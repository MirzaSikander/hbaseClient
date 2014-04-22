package hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.Vector;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;

import edu.usc.bg.base.ByteIterator;

public class HbaseClientwGet extends HbaseClient {

	public HbaseClientwGet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int listFriends(int requesterID, int profileOwnerID,
			Set<String> fields, Vector<HashMap<String, ByteIterator>> result,
			boolean insertImage, boolean testMode) {
		if (result == null)
			throw new IllegalArgumentException("HashMap result not initialized");

		Get getFriendsIDs = new Get(Bytes.toBytes(Integer
				.toString(profileOwnerID)));
		getFriendsIDs.addFamily(FRIENDS);
		Result res = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			res = hTableUsers.get(getFriendsIDs);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		NavigableMap<byte[], byte[]> everyone = res.getFamilyMap(FRIENDS);
		ArrayList<Get> getFriendsProfile = new ArrayList<Get>();
		for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
			if (Arrays.equals(entry.getValue(), FriendshipStatus.FRIENDS)) {
				getFriendsProfile.add(new Get(entry.getKey()));
			}
		}
		Result[] rs = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			rs = hTableUsers.get(getFriendsProfile);

			for (int i = 0; i < rs.length; i++) {
				HashMap<String, ByteIterator> user = new HashMap<String, ByteIterator>();
				if (fields == null || fields.contains("userid")) {
					user.put("userid", getIterator(rs[i].getRow()));
				}
				if (fields == null || fields.contains("username")) {
					user.put("username", getIterator(rs[i].getValue(
							PROFILE_INFO, mappingToBG.get("username"))));
				}
				if (fields == null || fields.contains("username")) {
					user.put("username", getIterator(rs[i].getValue(
							PROFILE_INFO, mappingToBG.get("username"))));
				}
				if (fields == null || fields.contains("pw")) {
					user.put("pw", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("pw"))));
				}
				if (fields == null || fields.contains("fname")) {
					user.put("fname", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("fname"))));
				}
				if (fields == null || fields.contains("lname")) {
					user.put("lname", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("lname"))));
				}
				if (fields == null || fields.contains("gender")) {
					user.put("gender", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("gender"))));
				}
				if (fields == null || fields.contains("dob")) {
					user.put("dob", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("dob"))));
				}
				if (fields == null || fields.contains("jdate")) {
					user.put("jdate", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("jdate"))));
				}
				if (fields == null || fields.contains("ldate")) {
					user.put("ldate", getIterator(rs[i].getValue(PROFILE_INFO,
							mappingToBG.get("ldate"))));
				}
				if (fields == null || fields.contains("address")) {
					user.put("address", getIterator(rs[i].getValue(
							PROFILE_INFO, mappingToBG.get("address"))));
				}
				if ((fields == null || fields.contains("pic")) && insertImage) {
					byte[] blob = rs[i]
							.getValue(IMAGES, mappingToBG.get("pic"));
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

	@Override
	public int viewFriendReq(int profileOwnerID,
			Vector<HashMap<String, ByteIterator>> results, boolean insertImage,
			boolean testMode) {
		if (results == null)
			throw new IllegalArgumentException("Vector results not initialized");

		Get getFriends = new Get(
				Bytes.toBytes(Integer.toString(profileOwnerID)));
		getFriends.addFamily(FRIENDS);
		Result res = null;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			res = hTableUsers.get(getFriends);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		NavigableMap<byte[], byte[]> everyone = res.getFamilyMap(FRIENDS);
		ArrayList<Get> getPendingFriendProfiles = new ArrayList<Get>();
		for (Map.Entry<byte[], byte[]> entry : everyone.entrySet()) {
			if (Arrays.equals(entry.getValue(),
					FriendshipStatus.INVITATION_RECIEVED)) {
				getPendingFriendProfiles.add(new Get(entry.getKey()));
			}
		}
		Result[] rs;
		try {
			if (hTableUsers == null)
				hTableUsers = new HTable(conf, USER_TABLE);
			rs = hTableUsers.get(getPendingFriendProfiles);

			for (int i = 0; i < rs.length; i++) {
				HashMap<String, ByteIterator> user = new HashMap<String, ByteIterator>();
				user.put("userid", getIterator(rs[i].getRow()));
				user.put(
						"username",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("username"))));
				user.put(
						"pw",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("pw"))));
				user.put(
						"fname",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("fname"))));
				user.put(
						"lname",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("lname"))));
				user.put(
						"gender",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("gender"))));
				user.put(
						"dob",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("dob"))));
				user.put(
						"jdate",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("jdate"))));
				user.put(
						"ldate",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("ldate"))));
				user.put(
						"address",
						getIterator(rs[i].getValue(PROFILE_INFO,
								mappingToBG.get("address"))));
				if (insertImage) {
					byte[] blob = rs[i]
							.getValue(IMAGES, mappingToBG.get("pic"));
					if (testMode) {
						saveToFileSystem(profileOwnerID, blob);
					}
					user.put("pic", getIterator(blob));
				}
				results.add(user);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

}
