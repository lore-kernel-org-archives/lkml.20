Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029383;
	b=0S80A3qMlW6GRTJ+9rKopkcPu5Nowza+FxjwsL8xhZ9pnT0FFFTWT2oEXaNgkp37OMIa
	 ve1nW2oeAbMGBLoZP3DiMpgIK/NZMh6BfBBV07EJ+DIbeMfivZdC1S0meyXFCDvPiXqmv
	 4MZvINVxZ9K2Wsf2M3wuRbN958q4yfiEjSsflYRnT8XEkYZdq4h4OLRFgmzR9JIuedavq
	 HGhI9FOHa7eI5ysBF4P5kOLPIq7zeoMgj8gOKBvKGo6qAWtoFLYSRgnMhjWrZfPwmsr0j
	 S2JLTDO0IjdA59pJ50w3AfYZ4GoKpQUJ84GHXFvtY1INQzBfAStLCHrL5qKb2ov4XFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029383;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=++CLhtwJU7E/apX3ShgBI7tg0hq/bQQTr7J0yKAAwRI=;
	b=gJwMSB3+HOpBK3oOAu7hAkF7tbBcIcU24VCn/VoE3KdvTMb9wckLzHyFj7dJnM1c9W9f
	 YBRVrwE/ajJwxDKAu/5/LE1Mg+lvgHAaNZ+iEAL10fAIZE8eFnGJGfQ0nCGcQMqskvrLq
	 U99WvtO27PzJl4QL8vnVhFM6UyhtN1xEB2vt0wdoaATLrLC73TNFkP40miwmKrT1pgKjM
	 hbkIG4zekzXdEAonbSOkIyyEopoV6RgKIktyzwYUj6FItc5vLDg7WKRjT2NvE6rAffaSw
	 4MOY0fH5XEolzMNtRuBXmvAxGw3HfsBgAj+sHsGbuT9ulA23D2E1E6yW6F+iM4wTZww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=gT7O1cb6;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="W3tp5GF/";
	arc=none smtp.remote-ip=188.121.53.108
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D94606D827
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D94606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=gT7O1cb6;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=W3tp5GF/
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzfx4ctG; Sat, 07 Nov 2026 05:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029376;
	bh=++CLhtwJU7E/apX3ShgBI7tg0hq/bQQTr7J0yKAAwRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gT7O1cb6vEg1CvbnytjAlxtCn4IohAml1oeYLxcjnon5fsr43MN3ufU/+voMNWu86
	 epprx2VBtV22xum43ZAimHrVCcIeNN3Tqqr3IXafnuvpxHbfXezeaZT0LZQR7DgcHS
	 d7rETI68HM3A0FInkXIkdT7zuWW+3s+cSxYZa0BoRxaqE7/3SALv2n+NLjYeQbnVet
	 0n8dOyuNDKRFI+GbFM29WVYeqhhZxop79pjAOM62uCPCNPJGnrOf+ZbkMhEctyLdzT
	 L8BnM77AG5mOkHkubCA1R+0FfphUMHeU4W4Gk6pdX/rWarVaaQm1WlVPaxhkcO0VKx
	 Zl5Eiwt/Dx/sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029376;
	bh=++CLhtwJU7E/apX3ShgBI7tg0hq/bQQTr7J0yKAAwRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W3tp5GF/EMF233FYzDtJUcI3Jl7vv/097kSQqHl07wPouOMmYIaa3RZoAgA4SRQ+N
	 BhAguqeyfaK0dfix9j6xsFVCxnPWD9JVxHJtftNXC9Em0aavTfk65Lnx7oeeZii1nq
	 ZQxfDzQgJXcL424n01cO/ukLa/sTFENoQrsc5fqIOlDG7+o2TlAd1b+lvI1cLImjz6
	 UGGIeip7j/n5Y6mZmn0EuwVNXY1aX1aXoi286nsaqhwSPGuCONwJOcRlzHrd2TgjnB
	 s8shjrUk+oXPL3EEUpCXzoWfJjKpqOkIkiUL2nbA9fKf3jnbVBlYwH01R7dSZ1QOJ0
	 g/yFskD440U6g==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb740
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=bQtJiiKavY242qEU4p8A:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 24be3b93cac18cdfe297311b83a03638:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 17/18] Squashfs: don't store large fragment table indexes in memory
Date: Sat,  7 Nov 2026 05:28:42 +0000
Message-ID: <20261107052843.725239-18-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfI1mkjuKAG/Q1YAgyaz/IAK+4HqtXIkVVuTD/vy/n8KkkyZjN15VeOEZzID6vFVh9kz9BT/242p1AmOgy0Vdu42mqBAQd1IWSkCCq0Xg9wV4QVxLJt0K
 ejEHLs/yO1I/xbaf5gLAwlv9dAFKEHYLmp2lmoM2ihKfYRxGv2E0jl8j5yZhfY+64XZJVQswTWfIPQFPddtQ+etj2jV5hv2DcuiHk1IFgLTYAgFbcBQhEco7
 jf7yyuL7pwONL8Fhcuy0z1qSkWgjnXL220B1zEcqUiMQmBRKQftYPQwM23Z1TBIY

When mounting a Squashfs filesystem, the code reads the entire fragment
table indexes into memory.  Their size is determined by the number of
fragments in the filesystem, where the maximum number of fragments is
2^32, and this will allocate and read 64 MiB.

This is an execessive and unnecessary amount of memory because the
indexes do not need to be read into memory in their entirety.  In
addition kmalloc() is used to allocate memory, and this can fail when
large amounts of memory are requested.  Kmalloc() on modern kernels is
usually limited to 4096 KiB. If panic-on-warn is set, then failure to
allocate memory willl result in a kernel panic.

This commit uses a 4 page cache if the size of the fragment table
indexes are 4 pages or larger.  A simple and fast lookup array is
retained where the total index size is less than 4 pages in size, which
is the vast majority of Squashfs filesystems.

Reproducer
==========

The following reproducer will create a Squashfs filesystem with
280 million fragments, which will cause the fragment table indexes to
exceed 4096 KiB, and the kmalloc() should fail when the filesystem is
mounted.

=====================================================================
#!/bin/bash

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

IMG=$PWD/reproducer.sqsh
DIR=$(mktemp -d)

if [ -e $IMG ]; then
	rm $IMG
fi

pushd $DIR 2>&1 > /dev/null

# create 20 million pseudo file links to file 2049 bytes in size
truncate -s 2049 a
a=0
while [ $a -le 19 ]; do
	b=0
	while [ $b -le 999 ]; do
		c=0
		while [ $c -le 999 ]; do
			echo "x/$a/$b/$c l a" >> file
			(( c ++ ))
		done
		(( b ++ ))
	done
	(( a ++ ))
done

for i in $(seq 1 14); do
	sed "s/x/$i/g" file > pseudo
	echo
	echo Iteration $i - appending 20 million files to Squashfs filesystem
	echo
	if ! mksquashfs - $IMG -pf pseudo -mem 100m -no-hardlinks -no-sparse -no-duplicates -no-exports -pd "d 0777 0 0" -no-recovery -b 4096; then
		echo Appending to Squashfs filesystem failed
		finish
	fi
done

popd 2>&1 > /dev/null
rm -rf $DIR

echo Generated Squashfs filesystem $IMG
=====================================================================

Fixes: 122edd1514aaa ("Squashfs: fragment block operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/fragment.c         | 98 +++++++++++++++++++++++++++-------
 fs/squashfs/squashfs.h         |  3 +-
 fs/squashfs/squashfs_fs_sb.h   |  8 ++-
 fs/squashfs/squashfs_helpers.h | 28 +++++++++-
 fs/squashfs/super.c            | 32 +++++++----
 5 files changed, 136 insertions(+), 33 deletions(-)

diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 33ef05ea4367..246083e81db9 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -29,26 +29,66 @@
 #include "squashfs_helpers.h"
 #include "squashfs.h"
 
+s64 squashfs_frag_lookup_start(struct super_block *sb, u32 fragment)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	s64 start;
+
+	if (msblk->fragment_index_is_cache) {
+		s32 length = squashfs_fragment_indexes_bytes(msblk->fragments);
+		s32 base = squashfs_fragment_indexes_base(fragment);
+		s16 offset = squashfs_fragment_indexes_offset(fragment);
+		s32 avail = min_t(int, length - base, PAGE_SIZE);
+		struct squashfs_cache_entry *entry;
+
+		start = squashfs_fragment_indexes_start(fragment, msblk);
+		if (start < 0)
+			return start;
+
+		entry = squashfs_cache_get(sb, msblk->fragment_index_cache,
+				start, avail | SQUASHFS_COMPRESSED_BIT_BLOCK);
+		if (entry->error < 0) {
+			int err = entry->error;
+
+			squashfs_cache_put(entry);
+			return err;
+		}
+
+		start = le64_to_cpu(((__le64 *)entry->data[0])[offset >> 3]);
+		squashfs_cache_put(entry);
+	} else {
+		s32 block = squashfs_fragment_index(fragment);
+
+		start = le64_to_cpu(msblk->fragment_index_array[block]);
+	}
+
+	if (start < msblk->fragment_table_start || start >= msblk->fragment_table)
+		return -EIO;
+
+	return start;
+}
+
 /*
  * Look-up fragment using the fragment index table.  Return the on disk
  * location of the fragment and its compressed size
  */
-int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
+int squashfs_frag_lookup(struct super_block *sb, u32 fragment,
 				u64 *fragment_block)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block, offset, size;
+	s32 offset, size;
 	struct squashfs_fragment_entry fragment_entry;
-	u64 start_block;
+	s64 start;
 
 	if (fragment >= msblk->fragments)
 		return -EIO;
-	block = squashfs_fragment_index(fragment);
-	offset = squashfs_fragment_index_offset(fragment);
 
-	start_block = le64_to_cpu(msblk->fragment_index[block]);
+	start = squashfs_frag_lookup_start(sb, fragment);
+	if (start < 0)
+		return start;
 
-	size = squashfs_read_metadata(sb, &fragment_entry, &start_block,
+	offset = squashfs_fragment_index_offset(fragment);
+	size = squashfs_read_metadata(sb, &fragment_entry, &start,
 					&offset, sizeof(fragment_entry));
 	if (size < 0)
 		return size;
@@ -61,11 +101,11 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 /*
  * Read the uncompressed fragment lookup table indexes off disk into memory
  */
-__le64 *squashfs_read_fragment_index_table(struct super_block *sb,
+int squashfs_read_fragment_index_table(struct super_block *sb,
 	u64 fragment_table_start, u64 next_table, unsigned int fragments)
 {
-	unsigned int length = squashfs_fragment_index_bytes(fragments);
-	__le64 *table;
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	s32 length = squashfs_fragment_indexes_bytes(fragments);
 
 	/*
 	 * The computed size of the index table (length bytes) should exactly
@@ -73,18 +113,36 @@ __le64 *squashfs_read_fragment_index_table(struct super_block *sb,
 	 */
 	if (fragment_table_start >= next_table ||
 				length != (next_table - fragment_table_start))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	table = squashfs_read_table(sb, fragment_table_start, length);
+	if (length <= (PAGE_SIZE * 4)) {
+		/* Read fragment index into memory */
+		__le64 *array = squashfs_read_table(sb, fragment_table_start, length);
 
-	/*
-	 * table[0] points to the first fragment table metadata block, this
-	 * should be less than fragment_table_start
-	 */
-	if (!IS_ERR(table) && le64_to_cpu(table[0]) >= fragment_table_start) {
-		kfree(table);
-		return ERR_PTR(-EINVAL);
+		if (IS_ERR(array))
+			return PTR_ERR(array);
+
+		/*
+		 * table[0] points to the first fragment table metadata block, this
+		 * should be less than fragment_table_start
+		 */
+		if (le64_to_cpu(array[0]) >= fragment_table_start) {
+			kfree(array);
+			return -EINVAL;
+		}
+
+		msblk->fragment_index_array = array;
+		msblk->fragment_index_is_cache = false;
+	} else {
+		/* Use a cache to store the last 16Kbytes of indexes read */
+		struct squashfs_cache *cache = squashfs_cache_init("fragment index", 4, PAGE_SIZE);
+
+		if (IS_ERR(cache))
+			return PTR_ERR(cache);
+
+		msblk->fragment_index_cache = cache;
+		msblk->fragment_index_is_cache = true;
 	}
 
-	return table;
+	return 0;
 }
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index d40d40bd61ae..f3a29a1e197d 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -70,8 +70,9 @@ extern s64 squashfs_inode_lookup_start(struct super_block *sb, u32 ino_num);
 
 /* fragment.c */
 extern int squashfs_frag_lookup(struct super_block *, unsigned int, u64 *);
-extern __le64 *squashfs_read_fragment_index_table(struct super_block *,
+extern int squashfs_read_fragment_index_table(struct super_block *,
 				u64, u64, unsigned int);
+extern s64 squashfs_frag_lookup_start(struct super_block *sb, u32 fragment);
 
 /* file.c */
 void squashfs_copy_cache(struct folio *, struct squashfs_cache_entry *,
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index d6b5908fff51..77f7085ad2d0 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -59,7 +59,10 @@ struct squashfs_sb_info {
 	struct address_space			*cache_mapping;
 	int					next_meta_index;
 	__le64					*id_table;
-	__le64					*fragment_index;
+	union {
+		__le64				*fragment_index_array;
+		struct squashfs_cache		*fragment_index_cache;
+	};
 	__le64					*xattr_id_table;
 	struct mutex				meta_index_mutex;
 	struct meta_index			*meta_index;
@@ -71,6 +74,8 @@ struct squashfs_sb_info {
 	u64					inode_table;
 	u64					directory_table;
 	u64					directory_table_end;
+	u64					fragment_table;
+	u64					fragment_table_start;
 	u64					xattr_table;
 	u64					lookup_table;
 	u64					lookup_table_start;
@@ -85,5 +90,6 @@ struct squashfs_sb_info {
 	const struct squashfs_decompressor_thread_ops *thread_ops;
 	int					max_thread_num;
 	bool					lookup_table_is_cache;
+	bool					fragment_index_is_cache;
 };
 #endif
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index be8481e808af..c83007046e5a 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -108,11 +108,37 @@ static inline s32 squashfs_fragment_indexes(u32 fragments)
 		SQUASHFS_METADATA_SIZE;
 }
 
-static inline s32 squashfs_fragment_index_bytes(u32 fragments)
+static inline s32 squashfs_fragment_indexes_bytes(u32 fragments)
 {
 	return squashfs_fragment_indexes(fragments) * sizeof(long long);
 }
 
+static inline s32 squashfs_fragment_indexes_base(u32 fragments)
+{
+	return (squashfs_fragment_index(fragments) * sizeof(long long)) & ~(PAGE_SIZE - 1);
+}
+
+static inline s64 squashfs_fragment_indexes_start(u32 fragments, struct squashfs_sb_info *msblk)
+{
+	s32 base = squashfs_fragment_indexes_base(fragments);
+	s64 start;
+
+	if (S64_MAX - msblk->fragment_table < base)
+		return -EINVAL;
+
+	start = msblk->fragment_table + base;
+
+	if (start > msblk->bytes_used)
+		return -EINVAL;
+
+	return start;
+}
+
+static inline s16 squashfs_fragment_indexes_offset(u32 fragments)
+{
+	return (squashfs_fragment_index(fragments) * sizeof(long long)) & (PAGE_SIZE - 1);
+}
+
 /* inode lookup table defines */
 static inline s64 squashfs_lookup_bytes(u32 inodes)
 {
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 8504939f9a8e..287cbc6ad41c 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -185,6 +185,14 @@ static void squashfs_free_inode_table(struct squashfs_sb_info *msblk)
 		kfree(msblk->inode_lookup_array);
 }
 
+static void squashfs_free_fragment_indexes(struct squashfs_sb_info *msblk)
+{
+	if (msblk->fragment_index_is_cache)
+		squashfs_cache_delete(msblk->fragment_index_cache);
+	else
+		kfree(msblk->fragment_index_array);
+}
+
 static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct squashfs_mount_opts *opts = fc->fs_private;
@@ -300,6 +308,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	msblk->inode_table = le64_to_cpu(sblk->inode_table_start);
 	msblk->directory_table = le64_to_cpu(sblk->directory_table_start);
+	msblk->fragment_table = le64_to_cpu(sblk->fragment_table_start);
 	msblk->inodes = le32_to_cpu(sblk->inodes);
 	msblk->fragments = le32_to_cpu(sblk->fragments);
 	msblk->ids = le16_to_cpu(sblk->no_ids);
@@ -317,8 +326,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	TRACE("Number of ids %d\n", msblk->ids);
 	TRACE("sblk->inode_table_start %llx\n", msblk->inode_table);
 	TRACE("sblk->directory_table_start %llx\n", msblk->directory_table);
-	TRACE("sblk->fragment_table_start %llx\n",
-		(u64) le64_to_cpu(sblk->fragment_table_start));
+	TRACE("sblk->fragment_table_start %llx\n", msblk->fragment_table);
 	TRACE("sblk->id_table_start %llx\n",
 		(u64) le64_to_cpu(sblk->id_table_start));
 
@@ -433,15 +441,19 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 
 	/* Allocate and read fragment index table */
-	msblk->fragment_index = squashfs_read_fragment_index_table(sb,
-		le64_to_cpu(sblk->fragment_table_start), next_table, fragments);
-	if (IS_ERR(msblk->fragment_index)) {
+	err = squashfs_read_fragment_index_table(sb, msblk->fragment_table,
+			next_table, fragments);
+	if (err < 0) {
+		errorf(fc, "unable to read fragment index table");
+		goto failed_mount;
+	}
+
+	err = squashfs_frag_lookup_start(sb, 0);
+	if (err < 0) {
 		errorf(fc, "unable to read fragment index table");
-		err = PTR_ERR(msblk->fragment_index);
-		msblk->fragment_index = NULL;
 		goto failed_mount;
 	}
-	next_table = le64_to_cpu(msblk->fragment_index[0]);
+	next_table = msblk->fragment_table_start = err;
 
 check_directory_table:
 	/* Sanity check directory_table */
@@ -493,7 +505,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		iput(msblk->cache_mapping->host);
 	msblk->thread_ops->destroy(msblk);
 	squashfs_free_inode_table(msblk);
-	kfree(msblk->fragment_index);
+	squashfs_free_fragment_indexes(msblk);
 	kfree(msblk->id_table);
 	kfree(msblk->xattr_id_table);
 	kfree(sb->s_fs_info);
@@ -613,7 +625,7 @@ static void squashfs_put_super(struct super_block *sb)
 			iput(sbi->cache_mapping->host);
 		sbi->thread_ops->destroy(sbi);
 		kfree(sbi->id_table);
-		kfree(sbi->fragment_index);
+		squashfs_free_fragment_indexes(sbi);
 		kfree(sbi->meta_index);
 		squashfs_free_inode_table(sbi);
 		kfree(sbi->xattr_id_table);
-- 
2.47.3

