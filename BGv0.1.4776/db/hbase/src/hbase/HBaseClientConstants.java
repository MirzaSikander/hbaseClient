package hbase;

import org.apache.hadoop.hbase.util.Bytes;

public interface HBaseClientConstants {

	public static final String MemberTable = "members";
	public static final String[] MemberCF = { "attributes", "profilelImg" };

//	public static final String ImageTable = "images";
//	public static final String[] ImageCF = { "data" };
	
	public static final String PendingFriendTable = "pending_friends";
	public static final String[] PendingFriendCF = { "pendingFriends"};
	
	public static final String ConfirmedFriendTable = "confirmed_friends";
	public static final String[] ConfirmedFriendCF = { "confirmedFriends"};
	
	public static final String ResourceOwnerTable = "resource_owner";
	public static final String[] ResourceOwnerCF = { "resources" };
	
	public static final String ResourceTable = "resources";
	public static final String[] ResourceCF = { "resourceAttribute",
			"manipulations" };

	public static final String ManipulationTable = "manipulations";
	public static final String[] ManipulationCF = { "attributes" };
	
	
	public static final byte[] PendingFriendsCount = Bytes.toBytes("pendingcount");
	public static final byte[] ConfirmedFriendsCount = Bytes.toBytes("friendcount");
	public static final byte[] ResourceCount = Bytes.toBytes("resourcecount");
	

}
