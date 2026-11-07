Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029382;
	b=mCWwcWvG8JJJHbd9UFkIH9lgxOYIhJW8kjU5xAffLJlr15CWJAZztLnHhg2MDNQ+kJ6P
	 yPRGZRxR2j83XAwAY2F3AEVZtFPhxwwWQWKFSvYVekWW2F5KVuZvTVTXpZzwFrkDC01d3
	 VweaHV5JjxOA5eBVFRKH7DrPP/srKKrQiGIdn2Qd5SxpKWiR6HYhs6ZMx3AExdWPdeumN
	 aJ1jPQkdEsD0kQes0SbO0VZEzxOqaSGf5/hsbCEVBMT4k4X+g0YMgV9KLC0kY643uhUNo
	 m4lIWdrCDp4F8V9hlS2MMglAWIrP1NDB2DTd4CdNmyKu1C9R0aIYjHtScXILN3sO50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029382;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=4sjB9n88n6D0m3se+cNhWFRKdR7kvC5kPczfEWD8gyg=;
	b=cvn8bprdZpY5FWpWVsI7BX7f6D2eGVOOwfH9ZbUv8mD1RrGU4p0l78M3Md8KbFxr/8lb
	 VLlzvTI5szlKNOt76ghKDMwO7+2hKr2jUx+poLf9rqIRXLqUbr0pHdyWYWxuXF2tCbfYd
	 cMcJHnIiLLAgIY6QgZJPDie00NmCC88Ok75zFd6rqD6JWMmbvOwD0hHJa4onIN7Uoa3v2
	 TwW/CpLholbDaRiSQttBixghG7Awa4kGqg8Mbm+wuwwHqF6lA9aMujDaJ5gDtra8US7b0
	 1lZ7Z2KnRb/TyoLHMChL+0xZJuyX/6c6fCSZXAzfm5Ut5BmhzTIQhDN/dKLVQxlXWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=N+0vBwmA;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=AjyGFBh4;
	arc=none smtp.remote-ip=92.204.81.223
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [92.204.81.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98313606D804
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98313606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=N+0vBwmA;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=AjyGFBh4
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzWx4csN; Sat, 07 Nov 2026 05:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029368;
	bh=4sjB9n88n6D0m3se+cNhWFRKdR7kvC5kPczfEWD8gyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N+0vBwmA3za0zq0ykYqO6tN9hAGx86UP/RWq+IvModbfhIX5B4XsrSuYCBQcNiFl4
	 FE4G5BQGYClJLjOBLuBYYxvtuIT0WWcGUcwCyK7u+0+MoWThHquNKfLPbOtQmiRxi8
	 oE9O29jmCcO1/3GPZzvmrC27XX0i7D2qn9oxSna9ZOS4yp9TqmXKBl4si4+K/38AGZ
	 i0SCEbGaPMKFPHPy2nKeXZdXEjZi0lSQV8Yw1Z5dgK+oNTvnSKfWMQH20/W69Q/9Au
	 fdpAfsntDdSIqt1TMqX8Rd/QvzUvS5CZlI8le4HKqKNR08yv7vagFEK/5Jm9b5vCTR
	 15Gl2GlMyJDTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029368;
	bh=4sjB9n88n6D0m3se+cNhWFRKdR7kvC5kPczfEWD8gyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AjyGFBh4F65SiOz7UWHx7K5NY0juytqRHPkWj25KP6S5DMURTOCmyBxKno9q3N0Th
	 xito2z0Zq4k1BsutDnhPDWETsVNtVgFc/i2kxW1gLYQeDFj3Zrw4JqXAsvCSy7RzAa
	 fctLO0Qy93aSuMnfzhQdrr7WOiHaffKbuoM3FjNJECYJaaulqtdijhxdyZcVVXlIic
	 fS0+98GXLwjpWYYpNM4N7IEchsalUvwSpwbv8r2+o/3R3cW1MIhC7Udgp75+eDHObA
	 p4fPsshRHP56AaJ4mDrD01PdzrYsDYOAYL8FZyYiczH2ae9CCwsDsa4YTj7CebDV6S
	 zn7XvTdXiO5GQ==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb737
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=IeOlCYqPYvspwizo2FwA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 38bf870c74a197a5a12c81273644a355:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 12/18] Squashfs: very large files can exceed an int block count
Date: Sat,  7 Nov 2026 05:28:37 +0000
Message-ID: <20261107052843.725239-13-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfHCOImmIEnAlJy4HHO6GkxmwiB8/CAQN0r09oll/m2bXEKQxY+CgvYBS9S89Bg7X8FcayqReX759do2DejnEEcAbZldP6vozIpAS0jSasYOIoH6zvMX/
 2XZz1HApRIWr9QjLziT7J/ZxxxicKIX/mNm7qTJe2JTXNsPUXjeIJ/xONVgb9/e4Jl13Qiwv1GpA/Bq0ejWMFIVP3HOn9qMAXAQAU/ZXHKfGOI6oiSt1Ea+3
 Z4CTQK4IIqPPt54UsBbaNtr7i3iVz+9c6tD2Mm9eawRk6zG8EZCHShIMjfKfGptp

Squashfs in many places uses a signed int to store the block number and
block count of a file.  If the block size is using the Linux page size
(normally 4 KiB), it means any file larger than 8 TiB (2^43) will
overflow a signed int.

If the block number and block count is in terms of the Squashfs
filesystem block size (which can be between 4 kiB and 1 MiB), it
depends on the block size as to when a signed int will overflow, but a
file larger than 256 TiB (2^48) using 128 KiB blocks will overflow a
signed int.

This commit widens all appropriate variables to long long (s64) to
avoid overflow.

Reproducer
==========

The following reproducer creates a Squashfs filesystem with a 8 TiB +
4096 byte sparse file.  The filestem is mounted, and the last 4096
bytes are read from the file.  If the reproducer is successful the
process will hang.  This is because signed int overflow occurs in
squashfs_copy_cache() with the result that folio_end_read() is
not called.

====================================================================

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo "Create an 8 Tib (2^43) + 4096 byte sparse file"

if ! truncate --size 8796093026304 bigfile; then
	echo Create of sparse file failed.
	finish
fi

echo Generate the Squashfs filesystem containing the sparse file
echo This will be VERY slow on Squashfs-tools older than 4.7.3

mksquashfs bigfile bigfile.sqsh -b 1M -quiet

echo Mount the filesystem to /mnt

if ! mount -t squashfs bigfile.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the last 4096 bytes from the sparse file.
echo If the exploit succeeds the process will hang

dd if=/mnt/bigfile bs=1 skip=8796093022208

popd 2>&1 > /dev/null
rm -rf $DIR
exit 0
====================================================================

Fixes: 1701aecb6849c ("Squashfs: regular file operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index ad6382cd22d3..05ae61dd6be2 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -35,6 +35,7 @@
 #include <linux/string.h>
 #include <linux/pagemap.h>
 #include <linux/mutex.h>
+#include <linux/math64.h>
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
@@ -216,7 +217,7 @@ static long long read_indexes(struct super_block *sb, int n,
  */
 static inline int calculate_skip(u64 blocks)
 {
-	u64 skip = blocks / ((SQUASHFS_META_ENTRIES + 1)
+	u64 skip = div_u64(blocks, (SQUASHFS_META_ENTRIES + 1)
 		 * SQUASHFS_META_INDEXES);
 	return min((u64) SQUASHFS_CACHED_BLKS - 1, skip + 1);
 }
@@ -227,7 +228,7 @@ static inline int calculate_skip(u64 blocks)
  * on-disk locations of the datablock and block list metadata block
  * <index_block, index_offset> for index (scaled to nearest cache index).
  */
-static int fill_meta_index(struct inode *inode, int index,
+static s64 fill_meta_index(struct inode *inode, s64 index,
 		u64 *index_block, int *index_offset, u64 *data_block)
 {
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
@@ -243,7 +244,7 @@ static int fill_meta_index(struct inode *inode, int index,
 	/*
 	 * Scale index to cache index (cache slot entry)
 	 */
-	index /= SQUASHFS_META_INDEXES * skip;
+	index = div_u64(index, SQUASHFS_META_INDEXES * skip);
 
 	while (offset < index) {
 		meta = locate_meta_index(inode, offset + 1, index);
@@ -327,14 +328,14 @@ static int fill_meta_index(struct inode *inode, int index,
  * Get the on-disk location and compressed size of the datablock
  * specified by index.  Fill_meta_index() does most of the work.
  */
-static int read_blocklist_ptrs(struct inode *inode, int index, u64 *start,
+static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 	int *offset, u64 *block)
 {
 	long long blks;
 	__le32 size;
-	int res = fill_meta_index(inode, index, start, offset, block);
+	s64 res = fill_meta_index(inode, index, start, offset, block);
 
-	TRACE("read_blocklist: res %d, index %d, start 0x%llx, offset 0x%x, block 0x%llx\n",
+	TRACE("read_blocklist: res %lld, index %lld, start 0x%llx, offset 0x%x, block 0x%llx\n",
 				res, index, *start, *offset, block ? *block : 0);
 
 	if (res < 0)
@@ -364,7 +365,7 @@ static int read_blocklist_ptrs(struct inode *inode, int index, u64 *start,
 	return squashfs_block_size(size);
 }
 
-static inline int read_blocklist(struct inode *inode, int index, u64 *block)
+static inline int read_blocklist(struct inode *inode, s64 index, u64 *block)
 {
 	u64 start;
 	int offset;
@@ -397,8 +398,8 @@ void squashfs_copy_cache(struct folio *folio,
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode = mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int i, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
-	int start_index = folio->index & ~mask, end_index = start_index | mask;
+	s64 i, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
+	s64 start_index = folio->index & ~mask, end_index = start_index | mask;
 
 	/*
 	 * Loop copying datablock into pages.  As the datablock likely covers
@@ -412,7 +413,7 @@ void squashfs_copy_cache(struct folio *folio,
 		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
 		bool updated = false;
 
-		TRACE("bytes %zu, i %d, available_bytes %zu\n", bytes, i, avail);
+		TRACE("bytes %zu, i %lld, available_bytes %zu\n", bytes, i, avail);
 
 		push_folio = (i == folio->index) ? folio :
 			__filemap_get_folio(mapping, i,
@@ -464,8 +465,8 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	int index = folio->index >> (msblk->block_log - PAGE_SHIFT);
-	int file_end = i_size_read(inode) >> msblk->block_log;
+	s64 index = folio->index >> (msblk->block_log - PAGE_SHIFT);
+	s64 file_end = i_size_read(inode) >> msblk->block_log;
 	int expected = index == file_end ?
 			(i_size_read(inode) & (msblk->block_size - 1)) :
 			 msblk->block_size;
@@ -584,7 +585,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 	unsigned int nr_pages = 0;
 	struct page **pages;
 	int i;
-	loff_t file_end = i_size_read(inode) >> msblk->block_log;
+	s64 file_end = i_size_read(inode) >> msblk->block_log;
 	unsigned int max_pages = 1UL << shift;
 
 	readahead_expand(ractl, start, (len | mask) + 1);
-- 
2.47.3

