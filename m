Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029380;
	b=jUbHJTQS4dREOKQFIeWhL5gwA+QAKT1/Seg8WecKeVAMn77jfAsWkQUBBF4BReCHX0Ol
	 thsCjnc1FZKJhut+fcNFLi4i2t8NqJF/m0hUkUW+4Q/LaBrlobFBG4yaGt5Q0pQgoGDgW
	 LreU16KQxs78vqpSl7EjGvYeQpgrJq/4oZkHF/OtIJ0Lb5zqsMyDnkVIY6FwPZKqEGE0w
	 YcO77vgoo+p2tDbH8ki1W4e6rDq6PPcWT0qDjihAHZsU+fH6dV+TSw4TmUGtefnxg2eVU
	 BmFjRhQT7i5Jz1mEvRIeQPXcdvnkWzVxfqQj9X8Y9tYk9sEWyUK17ZR1GQAh25lzafQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029380;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=IiMoN8VXvUwOUeRQnuX/SUXsfn1Oy9POBWrcsvm+TqA=;
	b=alI1MlB/96Qkkm975D+tO5wyTkfIrFPOMs/h1n0DrtphLAO337LLmX6FOFjTLTsLtMia
	 mR7Jc7jobmH+6J+3iMfPSzSCXCrl1ycw/hfz6vJvl9uj38aSEI4Aa17xT6Ae1/tIsx38O
	 UlFlBW1+D4tK+ULRy+HMW71srb5JtWVU/MCL4r1Scx0lVHAeQHy1UZOsb8UJ666OeRqQG
	 0+QDII2gdHu3bf4FHM3CgGoT5Fd/oJVdb1PuNII/XzElfZAfvlPbgXq+9mkYEtHM1B3/L
	 1PUOnvn9TXR7wkUORr+UEA8RNS0OB59V4ve6jqoJEqynMoh0AIpkK81lCIrgHW2Kq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=cloMAh6v;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=jnOGNB6i;
	arc=none smtp.remote-ip=92.204.81.224
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [92.204.81.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B3606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8B3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=cloMAh6v;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=jnOGNB6i
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzbx4csw; Sat, 07 Nov 2026 05:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029373;
	bh=IiMoN8VXvUwOUeRQnuX/SUXsfn1Oy9POBWrcsvm+TqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cloMAh6vD6rW3muO+kDYGOMI3WHgEhk5lVTVhO21PrCV7BAN+yEHdYico4iGDOc7T
	 Vr+pill0T+qx3z3kWKN77g0ZKBm81L9Y6WPFBxu88MnMR+ZXHmwxR9R4mupp/tfK1h
	 EalPv9wMlZyODGgy7UtL5ZtOWDgoKkmv6Udo1bDTF8gMAt6NKK4qbbF6n5stfs8dFi
	 0PfRdb5yyF1fSE3oT/Hxoa1RYhRiTe1698gm5PAPySJAo+rjh+5cRtmmF1SwKeRu8a
	 BGl1dpqFX24+Yr1UOngK4uFjwxwqXvIuIM/kUMNUED51bwjXHtHUKB9HhxPylON3s5
	 hAdFlOoLFFD5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029373;
	bh=IiMoN8VXvUwOUeRQnuX/SUXsfn1Oy9POBWrcsvm+TqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jnOGNB6i5zdbyATrw3TmR57wXSMwTigySJCVOH+aPtDzZ28PPQmutm8HHPI09L3rw
	 IoipVP+UlSaLS7PQEi4kvdLL0Akw6mYjR9HuC6rPtdxi7KrOoEwOZ7XmhB3JnlGqH+
	 j/OFRDZ0MEMdyzSKtrD8zQBlptbiFT8Q74kyfBDRgznDYVyWem7Cmr7rfye1ITN8ah
	 nwPp5wZnxab273o0hIQJ5na9nVRF5tEJwVeEgQCeI7WhGIO10opI55GFd6YuXEOnHb
	 3vo4uCYR5q3pk0KYG2+gqOKUfc0GByR2GfgrJKTcLd7L4rUUWef+nkPB4RSah7WIfe
	 NteWa2EigKxZQ==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb73c
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=TSaEOjpj3gRMpAirYekA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 351f081cbcf1af5444a6609d925b4aed:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 15/18] Squashfs: sanity check block list sizes and range
Date: Sat,  7 Nov 2026 05:28:40 +0000
Message-ID: <20261107052843.725239-16-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfDVcxgEI3dhabqRmoeqDAJoKQWMPp2aVsW+LPKYUA3j85fJrGWSipJwEcqqW8NnM3gbE+9sPJoTOCN1S5xsw1Gn+ANOWd95HgxUWL0EtHr1ztaWVqn0N
 OPERrQb4dLKtzIUrI1P+U9YBK7Przjww4DWkW9A2IvWrFv142r595aa6Zx5wUZJLhUkBdO9Wj862hH8FSnOizHFYmdONB9b+1jBfr0w0yGpo83s7QQZxVbtJ
 5DU1c3+3LlCOtPcibdIdDvECIcUkUEBZBiTrR5voSYEhQif4XyXEqu9GuXuWzslH

A Squashfs file has a list of block sizes, storing the compressed size
of each data block.  This block list is scanned to discover the size and
location of block x, where the sizes of previous data blocks are added
to the start of the data blocks to produce the location.

But, when scanning this block list and adding the block sizes, the code
does not check for arithmetic overflow.  This means the data block start
location can be crafted to be close to 2^64, and so the addition of the
block sizes can cause arithmetic overflow and thereby evade any sanity
checks.

Additionally, the range (start and end) of the data block that is to be
read from the filesystem is not checked for correctness before
squasfs_read_data().

This commit adds checks for arithmetic overflow and sanity checks the
range of the data block before attempting to read from disk.

Reproducer
==========

The reproducer generates a Squashfs filesystem with a file with two
data blocks, and then corrupts the location of the start of the data
blocks to 2^64 - 128 KiB.  This added to the size of data block 0 (128
KiB) will overflow, producing a location of 0.  If the exploit succeeds,
when the second block is read, Squashfs will not produce an I/O error
and instead print the Squashfs filesystem superblock starting with hsqs.

====================================================================
#!/bin/bash

ARGS="-quiet -no-progress -noI -noD -no-sparse -no-fragments -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo "Create Squashfs filesystem with one file, with 2 data blocks"
echo "Create a hard link to it, to force Mksquashfs to use an extended inode"
echo "(more than one nlink).  This means the start_block field will"
echo "be 64-bits"

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=256 2>/dev/null" >> pseudo
echo "hardlink L zero" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo "Corrupt the start_block field of file zero's inode, which"
echo "points to the start of the file's data blocks."
echo "Alter it to the value 0xFFFFFFFFFFFE0000 (2^64 - 128 KiB)."
echo "That value added to the size of the first data block (128 KiB)"
echo "will overflow"
echo "The inode start_block field is stored at byte offset 262258"

/usr/bin/echo -en "\x00\x00\xfe\xff\xff\xff\xff\xff" > file
dd if=file of=img.sqsh seek=262258 bs=1 count=8 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dd will not fail, and it will display the Squashfs
echo superblock, beginning with hsqs
echo

dd if=/mnt/zero bs=1024 skip=128

popd 2>&1> /dev/null

rm -rf $DIR
====================================================================

Fixes: 1701aecb6849c ("Squashfs: regular file operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/cache.c            |  2 +-
 fs/squashfs/file.c             | 27 +++++++++++++++++++++------
 fs/squashfs/squashfs_helpers.h | 20 +++++++++++++++++---
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 4b6ef8838bc6..a81a1d396074 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -490,7 +490,7 @@ struct squashfs_cache_entry *squashfs_get_fragment(struct super_block *sb,
 				u64 start_block, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int res = squashfs_check_range(start_block, length, msblk);
+	int res = squashfs_check_range(start_block, squashfs_frag_size(length, msblk->block_size), msblk);
 
 	if (res < 0)
 		return ERR_PTR(res);
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 47ef3d71187d..1df4c7ec00b7 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -281,6 +281,9 @@ static s64 fill_meta_index(struct inode *inode, s64 index,
 			long long res = read_indexes(inode->i_sb, blocks,
 					&cur_index_block, &cur_offset);
 
+			if (res >= 0)
+				res = squashfs_add_indexes(cur_data_block, res, msblk);
+
 			if (res < 0) {
 				if (meta->entries == 0)
 					/*
@@ -292,7 +295,7 @@ static s64 fill_meta_index(struct inode *inode, s64 index,
 				goto failed;
 			}
 
-			cur_data_block += res;
+			cur_data_block = res;
 			meta_entry = &meta->meta_entry[i - meta->offset];
 			meta_entry->index_block = cur_index_block -
 				msblk->inode_table;
@@ -353,8 +356,13 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 		blks = read_indexes(inode->i_sb, index - res, start, offset);
 		if (blks < 0)
 			return (int) blks;
-		if (block)
-			*block += blks;
+		if (block) {
+			res = squashfs_add_indexes(*block, blks, msblk);
+			if (res < 0)
+				return (int) res;
+
+			*block = res;
+		}
 	}
 
 	/*
@@ -492,8 +500,11 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 
 		if (res == 0)
 			res = squashfs_readpage_sparse(folio, expected);
-		else
-			res = squashfs_readpage_block(folio, block, res, expected);
+		else {
+			res = squashfs_check_range(block, res, msblk);
+			if (res >= 0)
+				res = squashfs_readpage_block(folio, block, res, expected);
+		}
 	} else
 		res = squashfs_readpage_fragment(folio, expected);
 
@@ -629,7 +640,11 @@ static void squashfs_readahead(struct readahead_control *ractl)
 		}
 
 		bsize = read_blocklist(inode, start >> msblk->block_log, &block);
-		if (bsize == 0)
+		if (bsize <= 0)
+			goto skip_pages;
+
+		bsize = squashfs_check_range(block, bsize, msblk);
+		if (bsize < 0)
 			goto skip_pages;
 
 		actor = squashfs_page_actor_init_special(msblk, pages, nr_pages,
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 146307064d9e..5250cf7348a3 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -236,10 +236,8 @@ static inline int squashfs_frag_size(u32 disk_size, s32 block_size)
 	return size;
 }
 
-static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct squashfs_sb_info *msblk)
+static inline int squashfs_check_range(u64 start_block, s32 size, struct squashfs_sb_info *msblk)
 {
-	int size = squashfs_frag_size(disk_size, msblk->block_size);
-
 	if (size < 0)
 		return size;
 
@@ -255,4 +253,20 @@ static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct sq
 
 	return size;
 }
+
+static inline s64 squashfs_add_indexes(u64 block, s64 blks, struct squashfs_sb_info *msblk)
+{
+
+	if (block > S64_MAX)
+		return -EIO;
+
+	/*
+	 * the above check ensured block is not 2^63 or larger, and so
+	 * this addition will not overflow
+	 */
+	if (block + blks >= msblk->inode_table)
+		return -EIO;
+
+	return block + blks;
+}
 #endif
-- 
2.47.3

