package hbase;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Properties;
import java.util.Set;
import java.util.Vector;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Increment;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.filter.RegexStringComparator;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.util.Bytes;

import edu.usc.bg.base.ByteArrayByteIterator;
import edu.usc.bg.base.ByteIterator;
import edu.usc.bg.base.DB;
import edu.usc.bg.base.DBException;
import edu.usc.bg.base.ObjectByteIterator;
import edu.usc.bg.base.StringByteIterator;

public abstract class HbaseClient extends DB {
	public static final String USER_TABLE = "Users";
	public static final byte[] PROFILE_INFO = "pi".getBytes();
	public static final byte[] USER_NAME = "un".getBytes();
	public static final byte[] PASSWORD = "pw".getBytes();
	public static final byte[] FIRST_NAME = "fn".getBytes();
	public static final byte[] LAST_NAME = "ln".getBytes();
	public static final byte[] GENDER = "g".getBytes();
	public static final byte[] D_OF_BIRTH = "dob".getBytes();
	public static final byte[] JOIN_DATE = "jd".getBytes();
	public static final byte[] LEFT_DATE = "ld".getBytes();
	public static final byte[] ADDRESS = "a".getBytes();
	public static final byte[] EMAIL = "e".getBytes();
	public static final byte[] TEL = "tel".getBytes();
	public static final byte[] RESOURCE_COUNT = "rc".getBytes();

	public static final byte[] IMAGES = "im".getBytes();
	public static final byte[] PIC = "pic".getBytes();
	public static final byte[] TPIC = "tpic".getBytes();

	public static final byte[] FRIENDS = "fri".getBytes();

	static class FriendshipStatus {
		static final byte[] FRIENDS = "friends".getBytes();
		static final byte[] INVITATION_RECIEVED = "invitation_recieved"
				.getBytes();
		static final byte[] INVITATION_SENT = "invitation_sent".getBytes();
		static final byte[] THAWED = "thawed".getBytes();
		static final byte[] REJECTED = "rejected".getBytes();
	}

	public static final String RESOURCE_TABLE = "Resources";
	public static final byte[] RESOURCE_INFO = "rinfo".getBytes();
	public static final byte[] RESOURCE_ID = "rid".getBytes();
	public static final byte[] CREATOR_ID = "ci".getBytes();
	public static final byte[] RESOURCE_TYPE = "type".getBytes();
	public static final byte[] RESOURCE_BODY = "body".getBytes();
	public static final byte[] RESOURCE_DOC = "doc".getBytes();
	public static final byte[] LIKES = "lk".getBytes();

	public static final String MANIPULATION_TABLE = "Manipulations";
	public static final byte[] MANIIPULATION_DEFAULT_CF = "mdcf".getBytes();
	public static final byte[] MODIFIER_ID = "mid".getBytes();

	Configuration conf;
	HTable hTableUsers, hTableResources, hTableManipulations;
	HashMap<String, byte[]> mappingToBG;

	// userid, username, pw, fname, lname, gender, dob, jdate, ldate, address,
	// email, tel, tpic, pic
	// rid, creatorid, walluserid, type, body, doc
	public HbaseClient() {
		mappingToBG = new HashMap<String, byte[]>();
		mappingToBG.put("userid", null);
		mappingToBG.put("username", USER_NAME);
		mappingToBG.put("pw", PASSWORD);
		mappingToBG.put("fname", FIRST_NAME);
		mappingToBG.put("lname", LAST_NAME);
		mappingToBG.put("gender", GENDER);
		mappingToBG.put("dob", D_OF_BIRTH);
		mappingToBG.put("jdate", JOIN_DATE);
		mappingToBG.put("ldate", LEFT_DATE);
		mappingToBG.put("address", ADDRESS);
		mappingToBG.put("email", EMAIL);
		mappingToBG.put("tel", TEL);
		mappingToBG.put("pic", PIC);
		mappingToBG.put("tpic", TPIC);

		mappingToBG.put("creatorid", CREATOR_ID);
		mappingToBG.put("walluserid", null);
		mappingToBG.put("type", RESOURCE_TYPE);
		mappingToBG.put("body", RESOURCE_BODY);
		mappingToBG.put("doc", RESOURCE_DOC);
	}

	@Override
	public boolean init() throws DBException {
		conf = HBaseConfiguration.create();
		HBaseAdmin hba;
		try {
			hba = new HBaseAdmin(conf);
			if (hba.tableExists(USER_TABLE))
				hTableUsers = new HTable(conf, USER_TABLE);
			if (hba.tableExists(RESOURCE_TABLE))
				hTableResources = new HTable(conf, RESOURCE_TABLE);
			if (hba.tableExists(MANIPULATION_TABLE))
				hTableManipulations = new HTable(conf, MANIPULATION_TABLE);
			// conf.addResource(new Path(
			// "/Users/mirzasikander/hbase/hbase-0.94.16/conf/hbase-site.xml"));
			hba.close();
		} catch (ZooKeeperConnectionException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public void createSchema(Properties props) {

		HTableDescriptor users = new HTableDescriptor(
				TableName.valueOf(USER_TABLE));
		users.addFamily(new HColumnDescriptor(PROFILE_INFO));
		users.addFamily(new HColumnDescriptor(IMAGES));
		users.addFamily(new HColumnDescriptor(FRIENDS).setMaxVersions(10));

		HTableDescriptor resources = new HTableDescriptor(
				TableName.valueOf(RESOURCE_TABLE));
		resources.addFamily(new HColumnDescriptor(RESOURCE_INFO));

		HTableDescriptor manipulations = new HTableDescriptor(
				TableName.valueOf(MANIPULATION_TABLE));
		manipulations
				.addFamily(new HColumnDescriptor(MANIIPULATION_DEFAULT_CF));

		System.out.println("connecting");
		HBaseAdmin hba;
		try {
			hba = new HBaseAdmin(conf);
			// Removing old versions
			if (hba.tableExists(USER_TABLE)) {
				hba.disableTable(USER_TABLE);
				hba.deleteTable(USER_TABLE);
				System.out.println("Deleting existing Users table");
			}
			if (hba.tableExists(RESOURCE_TABLE)) {
				hba.disableTable(RESOURCE_TABLE);
				hba.deleteTable(RESOURCE_TABLE);
				System.out.println("Deleting existing Resources table");
			}
			if (hba.tableExists(MANIPULATION_TABLE)) {
				hba.disableTable(MANIPULATION_TABLE);
				hba.deleteTable(MANIPULATION_TABLE);
				System.out.println("Deleting existing Manipulation table");
			}
			System.out.println("Creating Table");
			hba.createTable(users);
			System.out.println("Created Users");
			hba.createTable(resources);
			System.out.println("Created Resources");
			hba.createTable(manipulations);
			System.out.println("Created Manipulations");
			hba.close();
		} catch (MasterNotRunningException e) {
			e.printStackTrace();
		} catch (ZooKeeperConnectionException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Done......");

	}

	@Override
	public void cleanup(boolean warmup) throws DBException {
		try {
			if (hTableUsers != null)
				hTableUsers.close();
			if (hTableResources != null)
				hTableResources.close();
			if (hTableManipulations != null)
				hTableManipulations.close();
			if (conf != null)
				conf.clear();
		} catch (IOException e) {
			e.printStackTrace(System.out);
		}
	}

	@Override
	public int insertEntity(String entitySet, String entityPK,
			HashMap<String, ByteIterator> values, boolean insertImage) {

		if (entitySet.compareToIgnoreCase(USER_TABLE) == 0) {
			Put put = new Put(Bytes.toBytes(entityPK));
			put.add(PROFILE_INFO, USER_NAME,
					Bytes.toBytes(values.get("username").toString()));
			put.add(PROFILE_INFO, PASSWORD,
					Bytes.toBytes(values.get("pw").toString()));
			put.add(PROFILE_INFO, FIRST_NAME,
					Bytes.toBytes(values.get("fname").toString()));
			put.add(PROFILE_INFO, LAST_NAME,
					Bytes.toBytes(values.get("lname").toString()));
			put.add(PROFILE_INFO, GENDER,
					Bytes.toBytes(values.get("gender").toString()));
			put.add(PROFILE_INFO, D_OF_BIRTH,
					Bytes.toBytes(values.get("dob").toString()));
			put.add(PROFILE_INFO, JOIN_DATE,
					Bytes.toBytes(values.get("jdate").toString()));
			put.add(PROFILE_INFO, LEFT_DATE,
					Bytes.toBytes(values.get("ldate").toString()));
			put.add(PROFILE_INFO, ADDRESS,
					Bytes.toBytes(values.get("address").toString()));
			put.add(PROFILE_INFO, EMAIL,
					Bytes.toBytes(values.get("email").toString()));
			put.add(PROFILE_INFO, TEL,
					Bytes.toBytes(values.get("tel").toString()));

			if (insertImage) {
				put.add(IMAGES, PIC,
						Bytes.toBytes(values.get("pic").toString()));
				put.add(IMAGES, TPIC,
						Bytes.toBytes(values.get("tpic").toString()));
			}

			try {
				if (hTableUsers == null)
					hTableUsers = new HTable(conf, USER_TABLE);
				hTableUsers.put(put);
			} catch (IOException e) {
				e.printStackTrace();
				return -1;
			}
		} else if (entitySet.compareToIgnoreCase(RESOURCE_TABLE) == 0) {
			Integer invertedKey = invertKey(Integer.parseInt(entityPK));
			Put put = new Put(Bytes.toBytes(values.get("walluserid").toString()
					+ "-" + invertedKey));
			put.add(RESOURCE_INFO, RESOURCE_ID, Bytes.toBytes(entityPK));
			put.add(RESOURCE_INFO, CREATOR_ID,
					Bytes.toBytes(values.get("creatorid").toString()));
			put.add(RESOURCE_INFO, RESOURCE_TYPE,
					Bytes.toBytes(values.get("type").toString()));
			put.add(RESOURCE_INFO, RESOURCE_BODY,
					Bytes.toBytes(values.get("body").toString()));
			put.add(RESOURCE_INFO, RESOURCE_DOC,
					Bytes.toBytes(values.get("doc").toString()));
			try {
				if (hTableResources == null) {
					hTableResources = new HTable(conf, RESOURCE_TABLE);
				}
				hTableResources.put(put);
			} catch (IOException e) {
				e.printStackTrace();
				return -1;
			}
			// assumption: Only one thread is initializing
			// might need to check the return value to see if it succeeded
			// or not
			Increment inc = new Increment(Bytes.toBytes(values
					.get("walluserid").toString()));
			inc.addColumn(PROFILE_INFO, RESOURCE_COUNT, 1L);

			try {
				if (hTableUsers == null) {
					hTableUsers = new HTable(conf, USER_TABLE);
				}
				hTableUsers.increment(inc);
			} catch (IOException e) {
				e.printStackTrace();
				return -1;
			}
		} else {
			throw new IllegalArgumentException("Invalid entitySet value: "
					+ entitySet);
		}
		return 0;
	}

	@Override
	public HashMap<String, String> getInitialStats() {
		int usercount = 0, totalresources = 0, totalfriends = 0, totalpending = 0;
		HashMap<String, String> result = null;
		Scan scan = new Scan();
		scan.addFamily(PROFILE_INFO);
		scan.addFamily(FRIENDS);
		scan.setStartRow(Bytes.toBytes("0")); // start key is inclusive
		// scan.setStopRow(Bytes.toBytes("10")); // stop key is exclusive
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			ResultScanner rs = hTableUsers.getScanner(scan);
			try {
				for (Result r = rs.next(); r != null; r = rs.next()) {
					usercount++;
					byte[] resource_count = r.getValue(PROFILE_INFO,
							RESOURCE_COUNT);
					if (resource_count != null) {
						Long val = Bytes.toLong(resource_count);
						totalresources += val.intValue();
					}
					NavigableMap<byte[], byte[]> allFriends = r
							.getFamilyMap(FRIENDS);

					for (Map.Entry<byte[], byte[]> entry : allFriends
							.entrySet()) {
						// if they status is friends
						if (Arrays.equals(entry.getValue(),
								FriendshipStatus.FRIENDS)) {
							totalfriends++;
						} else if (Arrays.equals(entry.getValue(),
								FriendshipStatus.INVITATION_RECIEVED)) {
							totalpending++;
						}
					}

				}
				// process result...
			} finally {
				rs.close(); // always close the ResultScanner!
			}
			result = new HashMap<String, String>();
			if (usercount == 0) {
				result.put("usercount", Integer.toString(0));
				result.put("resourcesperuser", Integer.toString(0));
				result.put("avgfriendsperuser", Integer.toString(0));
				result.put("avgpendingperuser", Integer.toString(0));
			} else {
				result.put("usercount", Integer.toString(usercount));
				result.put("resourcesperuser",
						Integer.toString(totalresources / usercount));
				result.put("avgfriendsperuser",
						Integer.toString(totalfriends / usercount));
				result.put("avgpendingperuser",
						Integer.toString(totalpending / usercount));
			}
		} catch (IOException e) {
			e.printStackTrace();

		}
		return result;
	}

	@Override
	public int getCreatedResources(int creatorID,
			Vector<HashMap<String, ByteIterator>> result) {
		SingleColumnValueFilter filter = new SingleColumnValueFilter(
				RESOURCE_INFO, CREATOR_ID, CompareOp.EQUAL,
				Bytes.toBytes(creatorID));
		Scan scan = new Scan();
		scan.setFilter(filter);
		ResultScanner rs = null;
		try {
			if (hTableResources == null)
				hTableResources = new HTable(conf, RESOURCE_TABLE);
			rs = hTableResources.getScanner(scan);
			for (Result r = rs.next(); r != null; r = rs.next()) {
				HashMap<String, ByteIterator> attr = new HashMap<String, ByteIterator>();
				attr.put("creatorid",
						new ObjectByteIterator(Bytes.toBytes(creatorID)));
				attr.put(
						"type",
						new ObjectByteIterator(r.getValue(RESOURCE_INFO,
								RESOURCE_TYPE)));
				attr.put(
						"body",
						new ObjectByteIterator(r.getValue(RESOURCE_INFO,
								RESOURCE_BODY)));
				attr.put(
						"doc",
						new ObjectByteIterator(r.getValue(RESOURCE_INFO,
								RESOURCE_DOC)));
				// To find the wall user id

				attr.put("walluserid", getIterator(getWallUserID(r.getRow())));
				attr.put("rid",
						getIterator(r.getValue(RESOURCE_INFO, RESOURCE_ID)));
				result.add(attr);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int CreateFriendship(int friendid1, int friendid2) {
		// batch the puts
		Put put1 = new Put(Bytes.toBytes(Integer.toString(friendid1)));
		put1.add(FRIENDS, Bytes.toBytes(Integer.toString(friendid2)),
				FriendshipStatus.FRIENDS);
		Put put2 = new Put(Bytes.toBytes(Integer.toString(friendid2)));
		put2.add(FRIENDS, Bytes.toBytes(Integer.toString(friendid1)),
				FriendshipStatus.FRIENDS);
		List<Put> list = new ArrayList<Put>();
		list.add(put1);
		list.add(put2);

		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			hTableUsers.put(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int viewProfile(int requesterID, int profileOwnerID,
			HashMap<String, ByteIterator> result, boolean insertImage,
			boolean testMode) {
		if (result == null)
			throw new IllegalArgumentException("HashMap result not initialized");

		Get getProfileData = new Get(Bytes.toBytes(Integer
				.toString(profileOwnerID)));
		getProfileData.addFamily(PROFILE_INFO);
		getProfileData.addFamily(FRIENDS);
		if (insertImage)
			getProfileData.addFamily(IMAGES);
		Result r = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			r = hTableUsers.get(getProfileData);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}

		result.put("userid", getIterator(r.getRow()));
		result.put("username", getIterator(r.getValue(PROFILE_INFO, USER_NAME)));
		result.put("pw", getIterator(r.getValue(PROFILE_INFO, PASSWORD)));
		result.put("fname", getIterator(r.getValue(PROFILE_INFO, FIRST_NAME)));
		result.put("lname", getIterator(r.getValue(PROFILE_INFO, LAST_NAME)));
		result.put("gender", getIterator(r.getValue(PROFILE_INFO, GENDER)));
		result.put("dob", getIterator(r.getValue(PROFILE_INFO, D_OF_BIRTH)));
		result.put("jdate", getIterator(r.getValue(PROFILE_INFO, JOIN_DATE)));
		result.put("ldate", getIterator(r.getValue(PROFILE_INFO, LEFT_DATE)));
		result.put("address", getIterator(r.getValue(PROFILE_INFO, ADDRESS)));
		result.put("email", getIterator(r.getValue(PROFILE_INFO, EMAIL)));
		result.put("tel", getIterator(r.getValue(PROFILE_INFO, TEL)));

		byte[] resourceCount = r.getValue(PROFILE_INFO, RESOURCE_COUNT);
		if (resourceCount == null) {
			result.put("resourcecount", new StringByteIterator("0"));
		} else {
			result.put(
					"resourcecount",
					new StringByteIterator(Long.toString(Bytes
							.toLong(resourceCount))));
		}
		if (insertImage) {
			byte[] blob = r.getValue(IMAGES, PIC);
			if (testMode) {
				// Dump to file.
				saveToFileSystem(profileOwnerID, blob);
			}
			result.put("pic", getIterator(blob));
		}
		NavigableMap<byte[], byte[]> everyone = r.getFamilyMap(FRIENDS);
		int confirmedFriend = 0, pendingFriend = 0;
		for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
			if (Arrays.equals(entry.getValue(), FriendshipStatus.FRIENDS)) {
				confirmedFriend++;
			} else if (Arrays.equals(entry.getValue(),
					FriendshipStatus.INVITATION_RECIEVED)) {
				pendingFriend++;
			}
		}
		result.put("friendcount",
				new StringByteIterator(Integer.toString(confirmedFriend)));
		if (requesterID == profileOwnerID) {
			result.put("pendingcount",
					new StringByteIterator(Integer.toString(pendingFriend)));
		}

		return 0;
	}

	@Override
	abstract public int listFriends(int requesterID, int profileOwnerID,
			Set<String> fields, Vector<HashMap<String, ByteIterator>> result,
			boolean insertImage, boolean testMode);

	@Override
	abstract public int viewFriendReq(int profileOwnerID,
			Vector<HashMap<String, ByteIterator>> results, boolean insertImage,
			boolean testMode);

	@Override
	public int acceptFriend(int inviterID, int inviteeID) {
		// unchecked update of data whether there was an invitation exchange or
		// not
		List<Put> updates = new ArrayList<Put>(2);

		byte[] invitee = Bytes.toBytes(Integer.toString(inviteeID));
		byte[] inviter = Bytes.toBytes(Integer.toString(inviterID));

		Put updateInvitee = new Put(invitee);
		updateInvitee.add(FRIENDS, inviter, FriendshipStatus.FRIENDS);
		updates.add(updateInvitee);

		Put updateInviter = new Put(inviter);
		updateInviter.add(FRIENDS, invitee, FriendshipStatus.FRIENDS);
		updates.add(updateInviter);

		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			hTableUsers.put(updates);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	/**
	 * Does not modify the record for the inviter, because it is assumed
	 * that on their page the invitee will still be listed as friendship request sent
	 */
	public int rejectFriend(int inviterID, int inviteeID) {

		byte[] invitee = Bytes.toBytes(Integer.toString(inviteeID));
		byte[] inviter = Bytes.toBytes(Integer.toString(inviterID));
		Put updateInvitee = new Put(invitee);
		updateInvitee.add(FRIENDS, inviter, FriendshipStatus.REJECTED);
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			hTableUsers.put(updateInvitee);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	// This method has to be treated differently as this will be used in live
	// testing and not just in preping
	public int inviteFriend(int inviterID, int inviteeID) {
		Put put1 = new Put(Bytes.toBytes(Integer.toString(inviterID)));
		put1.add(FRIENDS, Bytes.toBytes(Integer.toString(inviteeID)),
				FriendshipStatus.INVITATION_SENT);

		Put put2 = new Put(Bytes.toBytes(Integer.toString(inviteeID)));
		put2.add(FRIENDS, Bytes.toBytes(Integer.toString(inviterID)),
				FriendshipStatus.INVITATION_RECIEVED);
		List<Put> list = new ArrayList<Put>();
		list.add(put1);
		list.add(put2);
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			hTableUsers.put(list);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int thawFriendship(int friendid1, int friendid2) {
		List<Put> updates = new ArrayList<Put>(2);

		byte[] invitee = Bytes.toBytes(Integer.toString(friendid1));
		byte[] inviter = Bytes.toBytes(Integer.toString(friendid2));

		Put updateInvitee = new Put(invitee);
		updateInvitee.add(FRIENDS, inviter, FriendshipStatus.THAWED);
		updates.add(updateInvitee);

		Put updateInviter = new Put(inviter);
		updateInviter.add(FRIENDS, invitee, FriendshipStatus.THAWED);
		updates.add(updateInviter);

		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			hTableUsers.put(updates);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int viewTopKResources(int requesterID, int profileOwnerID, int k,
			Vector<HashMap<String, ByteIterator>> result) {
		Scan scan = new Scan();
		scan.setStartRow(Bytes.toBytes(Integer.toString(profileOwnerID)));
		scan.setStopRow(Bytes.toBytes(Integer.toString(profileOwnerID) + "."));
		PageFilter limit = new PageFilter(k);
		scan.setFilter(limit);
		ResultScanner rs = null;
		try {
			if (hTableResources == null)
				hTableResources = new HTable(conf, RESOURCE_TABLE);
			rs = hTableResources.getScanner(scan);
			for (Result r = rs.next(); r != null; r = rs.next()) {
				// TODO: make this work for multiple regionservers
				HashMap<String, ByteIterator> resource = new HashMap<String, ByteIterator>();
				resource.put("rid",
						getIterator(r.getValue(RESOURCE_INFO, RESOURCE_ID)));
				resource.put("walluserid",
						getIterator(Bytes.toBytes(profileOwnerID)));
				resource.put("creatorid",
						getIterator(r.getValue(RESOURCE_INFO, CREATOR_ID)));
				resource.put("type",
						getIterator(r.getValue(RESOURCE_INFO, RESOURCE_TYPE)));
				resource.put("body",
						getIterator(r.getValue(RESOURCE_INFO, RESOURCE_BODY)));
				resource.put("doc",
						getIterator(r.getValue(RESOURCE_INFO, RESOURCE_DOC)));
				result.add(resource);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int viewCommentOnResource(int requesterID, int profileOwnerID,
			int resourceID, Vector<HashMap<String, ByteIterator>> result) {
		Scan getComments = new Scan();
		getComments.setStartRow(Bytes.toBytes(Integer.toString(resourceID)));
		getComments
				.setStopRow(Bytes.toBytes(Integer.toString(resourceID) + "."));
		ResultScanner rs = null;
		try {
			if (hTableManipulations == null)
				hTableManipulations = new HTable(conf, MANIPULATION_TABLE);
			rs = hTableManipulations.getScanner(getComments);
			for (Result r = rs.next(); r != null; r = rs.next()) {
				HashMap<String, ByteIterator> commentAttr = new HashMap<String, ByteIterator>();
				for (Map.Entry<byte[], byte[]> entry : r.getFamilyMap(
						MANIIPULATION_DEFAULT_CF).entrySet()) {
					commentAttr.put(Bytes.toString(entry.getKey()),
							getIterator(entry.getValue()));
				}
				result.add(commentAttr);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}

		return 0;
	}

	@Override
	public int postCommentOnResource(int commentCreatorID,
			int resourceCreatorID, int resourceID,
			HashMap<String, ByteIterator> values) {
		String mid = values.get("mid").toString();
		Put put = new Put(Bytes.toBytes(Integer.toString(resourceID) + "-"
				+ mid));

		for (Map.Entry<String, ByteIterator> attr : values.entrySet()) {
			put.add(MANIIPULATION_DEFAULT_CF, Bytes.toBytes(attr.getKey()),
					attr.getValue().toArray());
		}
		put.add(MANIIPULATION_DEFAULT_CF, CREATOR_ID,
				Bytes.toBytes(Integer.toString(resourceCreatorID)));
		put.add(MANIIPULATION_DEFAULT_CF, RESOURCE_ID,
				Bytes.toBytes(Integer.toString(resourceID)));
		put.add(MANIIPULATION_DEFAULT_CF, MODIFIER_ID,
				Bytes.toBytes(Integer.toString(commentCreatorID)));

		try {
			if (hTableManipulations == null)
				hTableManipulations = new HTable(conf, MANIPULATION_TABLE);
			hTableManipulations.put(put);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}

		return 0;
	}

	@Override
	public int delCommentOnResource(int resourceCreatorID, int resourceID,
			int manipulationID) {
		Delete delete = new Delete(Bytes.toBytes(Integer.toString(resourceID)
				+ "-" + Integer.toString(manipulationID)));
		try {
			if (hTableManipulations == null)
				hTableManipulations = new HTable(conf, MANIPULATION_TABLE);
			hTableManipulations.delete(delete);
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int queryPendingFriendshipIds(int memberID,
			Vector<Integer> pendingIds) {
		Get getFriends = new Get(Bytes.toBytes(Integer.toString(memberID)));
		getFriends.addFamily(FRIENDS);
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			Result friends = hTableUsers.get(getFriends);
			NavigableMap<byte[], byte[]> everyone = friends
					.getFamilyMap(FRIENDS);

			for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
				if (Arrays.equals(entry.getValue(),
						FriendshipStatus.INVITATION_RECIEVED)) {
					pendingIds.add(Integer.parseInt(Bytes.toString(entry
							.getKey())));
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public int queryConfirmedFriendshipIds(int memberID,
			Vector<Integer> confirmedIds) {
		Get getFriends = new Get(Bytes.toBytes(Integer.toString(memberID)));
		getFriends.addFamily(FRIENDS);
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			Result friends = hTableUsers.get(getFriends);
			NavigableMap<byte[], byte[]> everyone = friends
					.getFamilyMap(FRIENDS);

			for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
				if (Arrays.equals(entry.getValue(), FriendshipStatus.FRIENDS)) {
					confirmedIds.add(Integer.parseInt(Bytes.toString(entry
							.getKey())));
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	// Auxilary
	protected ByteIterator getIterator(byte[] array) {
		return new ByteArrayByteIterator(array);
	}

	protected void saveToFileSystem(int profileOwnerID, byte[] blob) {
		try {
			FileOutputStream fos = new FileOutputStream(profileOwnerID
					+ "-proimage.bmp");
			fos.write(blob);
			fos.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	private byte[] getWallUserID(byte[] rowKey) {
		int i;
		for (i = 0; i < rowKey.length; i++) {
			if (rowKey[i] == '-')
				break;
		}
		return Arrays.copyOfRange(rowKey, 0, i - 1);
	}

	private byte[] parseResourceID(byte[] rowKey) {
		int i;
		for (i = 0; i < rowKey.length; i++) {
			if (rowKey[i] == '-')
				break;
		}
		return Arrays.copyOfRange(rowKey, i + 1, rowKey.length - 1);
	}

	private Integer invertKey(int key) {
		return Integer.MAX_VALUE - key;
	}

	private Result getResource(int resourceID) {
		resourceID = invertKey(resourceID);
		String name = String.format("^\\d*-%d", resourceID);

		RegexStringComparator keyRegEx = new RegexStringComparator(name);
		RowFilter rowFilter = new RowFilter(CompareOp.EQUAL, keyRegEx);
		Scan rowScan = new Scan();
		rowScan.setFilter(rowFilter);

		ResultScanner rs = null;
		Result row = null;
		try {
			if (hTableResources == null)
				hTableResources = new HTable(conf, RESOURCE_TABLE);
			rs = hTableResources.getScanner(rowScan);
			int count = 0;
			for (row = rs.next(); row != null; row = rs.next()) {
				count++;
				if (count > 1)
					throw new Exception("Duplicate resource key");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// this should not happen
			e.printStackTrace();
			System.exit(-1);
		}
		return row;
	}

}
