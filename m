Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029378;
	b=0SRBPK4TWqansNiydtC/gsk6sAfmJ06mhZ7EhGZviWYbESuNht86hts7P5l3Of/2zW4s
	 hxGcq3FK5n8DSwP4/I1ITGKBzx8Jb2p/a3gBumXqlPp8GdFuvfveEV/UHFE2r5dHucCKQ
	 WplwUCqAjrSFppcOgejRq97wZlloFsfKDDoBNT55MMqwq5ET70QAcEIZiDjq3a7AwSvd3
	 LHTi1dks7FbHlaRa7hvFCk/UoGOxW2mr7AQxK2i/KQAsfvOqNL5I4C+8mNU1P7DrHJhLW
	 eNMA11PlW+nnZEZu9wdQpy/WVg0+keKXH5rg+JHiHdJrCl3QebDlj0oGG4yiE+CUnxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029378;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=7S3pho7W4dN5J/K88Ab3eu381ALbq3rL1f7oSd4JAJ8=;
	b=V95Q6RYav07GiqZvvkw18cKWFffOMOOLGSd+wiw8vcgqSf70VOqfeCatUSn9ACLglARX
	 WN8dFMpKctaPLdPFGm/HSY0ipWu5ZVPpdELC3pCLxgE/PUDqaGlg7lfJoCy7UjQnq/ykX
	 njH6qyZfcEvUkH0kkyIeop7+7GGfnGs/+XohzbsgxEckmCukmi9omrXQBPN116BGSSgoD
	 f2bENbESHH6doJGfSi4mK4Pw1R+Ofaq+TuxU83CLBMubPvUf16pzOf6YKbrcqhcZFzt5y
	 C2qS5sQVyRG74A7Ty7Q96/1QjsfSS6RhjG/3A0ntsOQvsiqUYfe7PhbJwH9PLQDMOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=htF+aOlb;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=JoezRCWF;
	arc=none smtp.remote-ip=92.204.81.222
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [92.204.81.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA83606D828
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA83606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=htF+aOlb;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=JoezRCWF
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzYx4csZ; Sat, 07 Nov 2026 05:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029369;
	bh=7S3pho7W4dN5J/K88Ab3eu381ALbq3rL1f7oSd4JAJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htF+aOlbpkozKIwosZe+kE4C44CvzvJHj1ymrCChXNgG2cg0+FXJHs8R9lCkqpqew
	 R+QSDYTlbrUtFFvoHQcVBMD6ryXFoqOYTnsDQ8Tc3W6HxyHnKsFzgxn9CbRRp3VX3v
	 UZYL1IBO/LIiSa0305easLV4Iob11mYloVS5leL+X1HHk1gCZ+ZxthwqtvnwboyKyG
	 bpMljJL5q8EWurMRyrxBbdjJc0qw3g0ooIbQZf95OVzSf3T3lBjoGxWI8QQ54sWCHf
	 btkOA1IxENuPoFvi4GtemOSW+SdM/EZpkIqOza6eOsRsb9rh1ok6t0dFVQYgx5Eot5
	 qW7fVbgumxY5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029369;
	bh=7S3pho7W4dN5J/K88Ab3eu381ALbq3rL1f7oSd4JAJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JoezRCWFbcn2dvbFwujXAGOFNGbksVJzRQb1RIaXlrqDjUgRWqJP/5z9J82EtT21q
	 lU7m/8Lh9exYfNTOKwdAv1MZqiMKHt6qkkC26JgkNTufxV9I3L7CzIuUWCcjiZJlee
	 Vwd0SQz9w/6ti5UwJBwv7DuwJajZylyRjl4kjSn5AAMGpR61kpSmg4gj0GFiYLar11
	 lUCaJydw8BUjzZPgF7M6KXkh2FUqf03PldeE+0hV1J6VmDNjypVS8v9/8NVQjYT+Xn
	 enZYU5OHZmAoa3T216QrJqycTMfLECFa6pdU53hnSiLDdFQd8zCOi8neQP5yf6qD27
	 utWM2413v2ZVg==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb739
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=RkH14jvAPMWmjoHUV8UA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 3870891f5133db97337e327617c4fc5e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 13/18] Squashfs: add more sanity checking to squashfs_block_size()
Date: Sat,  7 Nov 2026 05:28:38 +0000
Message-ID: <20261107052843.725239-14-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfH/uHgSFqkWLxygjMP8VqxsQ4Qmho9yqM15AFQnEvKx162u3nBobLsIJZYDcWTEOBMZEp72wxtZqAcpFVqDodUAqZNKT+z/ezNXxi+QYsptnIitoKg3p
 98pp5Z8oj+Zj/iX2PoQ5cfe9mX2no2TU9KHH8259XcZfVpXQKVtTvGCE17JTqNT3V2Uurs59MPUAEYkdS9E4pe35FDSWpa+4Q5LJTntZY+j99sUkN8/B2Cap
 IdY/8k3Uh5voyx8ahkhnVHe5X/kDaZeg67QUwMKnoGSV3lOHvt29+6LHw60KIYPv

Squashfs_block_size() sanity checks the data and fragment block size
read from disk.  However, it doesn't do all the sanity checking that
it could do.  This means detectably invalid block sizes are passed
down to squashfs_read_data().

This situation is sub-optimal because in the case of fragment
blocks, a fragment cache buffer has to obtained (with possible
waits for a free buffer etc.) before squashfs_read_data() is called.

In both fragment and data block cases if the buffer is compressed, it
means a free decompressor may be obtained (with possible waits for a
decompressor) by squashfs_read_data(), only to have the decompression
fail.

In both these cases this adds unnecessary overhead which may impact
performance, and this is with values that should have been detected
earlier.

This commit adds extra sanity checking to trap additional incorrect
values.

Reproducer
==========

The reproducer generates a Squashfs filesystem and then corrupts the
block size value for file zero block 0.  If the exploit succeeds this
corrupted value is not detected, and it is passed to the decompressor
via squashfs_read_data() which then fails at that point.

====================================================================
#!/bin/bash

ARGS="-quiet -no-progress -no-fragments -noI -noD -no-sparse -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create Squashfs filesystem with one file

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=128 2>/dev/null" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo Corrupt the data block size for block 0 in file zero
echo Flip the compression bit from uncompressed to compressed.
echo "This is at byte offset 131207 (96 + 128 KiB + 37)"

dd if=/dev/zero of=img.sqsh seek=131205 bs=1 count=1 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dmesg should show the following:
echo "SQUASHFS error: zlib decompression failed, data probably corrupt"
echo "SQUASHFS error: Failed to read block 0x60: -5"
echo "SQUASHFS error: zlib decompression failed, data probably corrupt"
echo "SQUASHFS error: Failed to read block 0x60: -5"
echo "SQUASHFS error: Unable to read data cache entry [60]"
echo "SQUASHFS error: Unable to read page, block 60, size 20000"

dd if=/mnt/zero

popd 2>&1> /dev/null

rm -rf $DIR
==============================================================================

Fixes: 1701aecb6849c ("Squashfs: regular file operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file.c             |  8 +++++---
 fs/squashfs/fragment.c         |  2 +-
 fs/squashfs/squashfs_fs.h      |  6 ------
 fs/squashfs/squashfs_helpers.h | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 05ae61dd6be2..d3be147e1ea3 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -166,6 +166,7 @@ static long long read_indexes(struct super_block *sb, int n,
 {
 	int err, i;
 	long long block = 0;
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	__le32 *blist = kmalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (blist == NULL) {
@@ -185,7 +186,7 @@ static long long read_indexes(struct super_block *sb, int n,
 		}
 
 		for (i = 0; i < blocks; i++) {
-			int size = squashfs_block_size(blist[i]);
+			int size = squashfs_data_size(blist[i], msblk->block_size);
 			if (size < 0) {
 				err = size;
 				goto failure;
@@ -333,6 +334,7 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 {
 	long long blks;
 	__le32 size;
+	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	s64 res = fill_meta_index(inode, index, start, offset, block);
 
 	TRACE("read_blocklist: res %lld, index %lld, start 0x%llx, offset 0x%x, block 0x%llx\n",
@@ -362,7 +364,7 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 			sizeof(size));
 	if (res < 0)
 		return res;
-	return squashfs_block_size(size);
+	return squashfs_data_size(size, msblk->block_size);
 }
 
 static inline int read_blocklist(struct inode *inode, s64 index, u64 *block)
@@ -720,7 +722,7 @@ static loff_t seek_hole_data(struct file *file, loff_t offset, int whence)
 			goto finished;
 
 		for (i = 0; i < indexes; i++) {
-			length = squashfs_block_size(blist[i]);
+			length = squashfs_data_size(blist[i], msblk->block_size);
 			if (length < 0) {
 				offset = length;
 				goto finished;
diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 9f63e5b5c513..1f372374c29d 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -54,7 +54,7 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 		return size;
 
 	*fragment_block = le64_to_cpu(fragment_entry.start_block);
-	return squashfs_block_size(fragment_entry.size);
+	return squashfs_frag_size(fragment_entry.size, msblk->block_size);
 }
 
 
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 3e7d0730b2d9..6ca8d7227a0e 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -101,12 +101,6 @@
 #define SQUASHFS_XATTR_VALUE_OOL        256
 #define SQUASHFS_XATTR_PREFIX_MASK      0xff
 
-static inline int squashfs_block_size(__le32 raw)
-{
-	u32 size = le32_to_cpu(raw);
-	return (size >> 25) ? -EIO : size;
-}
-
 /* cached data constants for filesystem */
 #define SQUASHFS_CACHED_BLKS		8
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 124ee18ed8c9..9b3466d26cd1 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -203,4 +203,36 @@ static inline s16 squashfs_xattr_offset(s64 xattr)
 {
 	return xattr & 0xffff;
 }
+
+static inline int squashfs_block_size(u32 size, s32 block_size)
+{
+	/* reject any size with bits set where they should not be */
+	if ((size & ~SQUASHFS_COMPRESSED_BIT_BLOCK) > block_size)
+		return -EIO;
+
+	/* a block can't be both full size and compressed */
+	if (size == block_size)
+		return -EIO;
+
+	return size;
+}
+
+static inline int squashfs_data_size(__le32 raw, s32 block_size)
+{
+	return squashfs_block_size(le32_to_cpu(raw), block_size);
+}
+
+static inline int squashfs_frag_size(__le32 raw, s32 block_size)
+{
+	int size = squashfs_block_size(le32_to_cpu(raw), block_size);
+
+	if (size < 0)
+		return size;
+
+	/* a fragment block can't be zero size, compressed or uncompressed */
+	if ((size & ~SQUASHFS_COMPRESSED_BIT_BLOCK) == 0)
+		return -EIO;
+
+	return size;
+}
 #endif
-- 
2.47.3

