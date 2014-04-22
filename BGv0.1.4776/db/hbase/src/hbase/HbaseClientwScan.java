package hbase;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.Vector;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.FilterList.Operator;
import org.apache.hadoop.hbase.filter.RegexStringComparator;
import org.apache.hadoop.hbase.filter.RowFilter;
import org.apache.hadoop.hbase.util.Bytes;

import edu.usc.bg.base.ByteIterator;

public class HbaseClientwScan extends HbaseClient {
	public HbaseClientwScan() {

	}

	public int viewFriendReq(int profileOwnerID,
			Vector<HashMap<String, ByteIterator>> results, boolean insertImage,
			boolean testMode) {
		if (results == null)
			throw new IllegalArgumentException("Vector results not initialized");

		Get getFriends = new Get(
				Bytes.toBytes(Integer.toString(profileOwnerID)));
		getFriends.addFamily(FRIENDS);
		Result r = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			r = hTableUsers.get(getFriends);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		NavigableMap<byte[], byte[]> everyone = r.getFamilyMap(FRIENDS);
		FilterList list = new FilterList(Operator.MUST_PASS_ONE);
		for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
			if (Arrays.equals(entry.getValue(),
					FriendshipStatus.INVITATION_RECIEVED)) {
				RegexStringComparator keyRegEx = new RegexStringComparator("^"
						+ Bytes.toString(entry.getKey()) + "$");
				RowFilter rowFilter = new RowFilter(CompareOp.EQUAL, keyRegEx);
				list.addFilter(rowFilter);
			}
		}
		Scan getPendingFriendProfiles = new Scan();
		getPendingFriendProfiles.setFilter(list);
		ResultScanner rs = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			rs = hTableUsers.getScanner(getPendingFriendProfiles);

			for (r = rs.next(); r != null; r = rs.next()) {
				HashMap<String, ByteIterator> user = new HashMap<String, ByteIterator>();
				user.put("userid", getIterator(r.getRow()));
				user.put(
						"username",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("username"))));
				user.put(
						"username",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("username"))));
				user.put(
						"pw",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("pw"))));
				user.put(
						"fname",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("fname"))));
				user.put(
						"lname",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("lname"))));
				user.put(
						"gender",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("gender"))));
				user.put(
						"dob",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("dob"))));
				user.put(
						"jdate",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("jdate"))));
				user.put(
						"ldate",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("ldate"))));
				user.put(
						"address",
						getIterator(r.getValue(PROFILE_INFO,
								mappingToBG.get("address"))));
				if (insertImage) {
					byte[] blob = r.getValue(IMAGES, mappingToBG.get("pic"));
					user.put("pic", getIterator(blob));
				}
				results.add(user);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	public int listFriends(int requesterID, int profileOwnerID,
			Set<String> fields, Vector<HashMap<String, ByteIterator>> result,
			boolean insertImage, boolean testMode) {
		if (result == null)
			throw new IllegalArgumentException("HashMap result not initialized");

		Get getFriendsIDs = new Get(Bytes.toBytes(Integer
				.toString(profileOwnerID)));
		getFriendsIDs.addFamily(FRIENDS);
		ResultScanner rs = null;
		Result r = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			r = hTableUsers.get(getFriendsIDs);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		NavigableMap<byte[], byte[]> everyone = r.getFamilyMap(FRIENDS);
		FilterList list = new FilterList(Operator.MUST_PASS_ONE);
		for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
			if (Arrays.equals(entry.getValue(), FriendshipStatus.FRIENDS)) {
				RegexStringComparator keyRegEx = new RegexStringComparator("^"
						+ Bytes.toString(entry.getKey()) + "$");
				RowFilter rowFilter = new RowFilter(CompareOp.EQUAL, keyRegEx);
				list.addFilter(rowFilter);
			}
		}
		Scan getFriendProfiles = new Scan();
		getFriendProfiles.setFilter(list);
		getFriendProfiles.setStartRow(Bytes.toBytes("0"));
		if (fields != null) {
			for (String attr : fields) {
				if (attr.equalsIgnoreCase("userid")) {
					continue;
				} else if (attr.equalsIgnoreCase("pic") && insertImage) {
					getFriendProfiles.addColumn(PROFILE_INFO,
							mappingToBG.get(attr));
				}
				getFriendProfiles
						.addColumn(PROFILE_INFO, mappingToBG.get(attr));
			}
		}
		try {
			rs = hTableUsers.getScanner(getFriendProfiles);

			// userid, username, pw, fname, lname, gender, dob, jdate,
			// ldate,
			// address, email, tel, tpic, pic
			for (r = rs.next(); r != null; r = rs.next()) {
				HashMap<String, ByteIterator> user = new HashMap<String, ByteIterator>();
				if (fields == null || fields.contains("userid")) {
					user.put("userid", getIterator(r.getRow()));
				}
				if (fields == null || fields.contains("username")) {
					user.put(
							"username",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("username"))));
				}
				if (fields == null || fields.contains("username")) {
					user.put(
							"username",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("username"))));
				}
				if (fields == null || fields.contains("pw")) {
					user.put(
							"pw",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("pw"))));
				}
				if (fields == null || fields.contains("fname")) {
					user.put(
							"fname",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("fname"))));
				}
				if (fields == null || fields.contains("lname")) {
					user.put(
							"lname",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("lname"))));
				}
				if (fields == null || fields.contains("gender")) {
					user.put(
							"gender",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("gender"))));
				}
				if (fields == null || fields.contains("dob")) {
					user.put(
							"dob",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("dob"))));
				}
				if (fields == null || fields.contains("jdate")) {
					user.put(
							"jdate",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("jdate"))));
				}
				if (fields == null || fields.contains("ldate")) {
					user.put(
							"ldate",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("ldate"))));
				}
				if (fields == null || fields.contains("address")) {
					user.put(
							"address",
							getIterator(r.getValue(PROFILE_INFO,
									mappingToBG.get("address"))));
				}
				if ((fields == null || fields.contains("pic")) && insertImage) {
					byte[] blob = r.getValue(IMAGES, mappingToBG.get("pic"));
					if (testMode) {
						saveToFileSystem(profileOwnerID, blob);
					}
					user.put("pic", getIterator(blob));
				}
				result.add(user);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

}
