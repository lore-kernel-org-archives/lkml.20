Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029383;
	b=1jHJ0duuFO0y0VqEb/LuAtNZsJd3U7dB2R2ayYDVuneWcRKrbOmEMXBqD21WCYRSNttq
	 cKuslNH/ROQpuC3Js/wDDyt+k0T3mG2gLNlxmpU0loW/povIPtO9AQM9xPLt7annXd4aE
	 fNUw/N5POkXRQD/trZGBK7Zgw998JEAHm974KuBIblOu0vwp0U4bco4LBuvmxqd03N9ox
	 Lk9qfQYZKRiKXpG3SOz29VAC8Bzi01JN49eDzX39TKlGUBniC26pK/sa3HIEx6wLqEWxE
	 FSuf7TPhQDUE6PQZesgLD8agqn5qPhW9MBr2oStEHBvP1ETg7faUMg7Gpqi8TzU/50g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029383;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=K/CT2l9DY+BPJvAefZTdn/K35wCf+QZApzC1eX3+ccs=;
	b=t/Orofq/0iAF3khZsiMw/jj6G98UnkxJxmAe88HEBde5QsvAf1dYfnh5612EWOV/I/Fz
	 oFX3JJdH3ul+Ghx8L09IfnxFCepK3+pwrJAJD5EwmSvEaB6VAk4SKbGwB9wFAgzjG7BgQ
	 BHvxd2GtFWoM5fBMGzMfxzX8oHqRlUCHki+mHi5ddP3kYCfM+tbstvyV10OPfwfgNWdzs
	 N31uey5brodU9Ngxplu2f058ELSbuapw9WPEzngXUmcEhPa3dqeHpcqXaaThxhSxGa6/a
	 xXSStgqezA32BR0bc8cHaux0PJ+g/zg1Gsh8Mb2gkNLyBJNcW18Eh3wJi54vtRRczxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=JW8u8wF3;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=aXzaY9Ra;
	arc=none smtp.remote-ip=188.121.53.109
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA9606D812
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBA9606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=JW8u8wF3;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=aXzaY9Ra
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzZx4csq; Sat, 07 Nov 2026 05:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029371;
	bh=K/CT2l9DY+BPJvAefZTdn/K35wCf+QZApzC1eX3+ccs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JW8u8wF3oKjN08I5RTs7NA75FtuOHYvTQ5hehxYWY3PyUjqc5gBeXXL8AWqjB7amb
	 Ti9VpRVbVqdj/y2TMtNFuW3lxRo/T3T2jieIdhcv9JDZBmBrqhoXsASJPgm3GomT+6
	 srsRd2Tt2IlBYpbBIJwnypkeNTJBPy9ZI3tLxECWWZkyDYLiZfc5kU5mpIf2VWcU0i
	 OxHeaIHuSUiXqCvJszgowh7OomPEn9tywDwrLi2//gD2R0roLw/1ga207NdS02ydlp
	 UdH9I4q8MkPQT40gPoO5fZ4ksqkB1he1mvGnjmokNzmN/kDfI5UN59kwfpezdnpzjc
	 v3UTAPNXy2QOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029371;
	bh=K/CT2l9DY+BPJvAefZTdn/K35wCf+QZApzC1eX3+ccs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aXzaY9RaEYTcK9oYj/g4gqEtU39s2dz/FBMYoz4EMdABH7UvaXfgbCz6MeUEnCXUL
	 QGIoVHddBx/X17Y+OtxO4qw+UW5i5UHYsbQ3eshhdu6EfDADcsRkNLi2lk03GVgwNb
	 FU07bi/Bg/tI125sX9XIYvGC3PMCl8l/ZRnRhjX+ahpEsY4d8DeUrtkrvrwtLDv1qx
	 kvzNA6/4WCyDAoTBWjh5n8mvLQ5L8eJ95DOoIvBziOduilGUyaEpbB0g07q8lKS4H1
	 2Sg0SJH9A1aFrjsxYvhTsWphjHnL+RF88bmpteZOe3Qkr41C7bBJWaapxb7XkseQlJ
	 1Ui3eGXw088fQ==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb73b
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=kpO94iFLt9uxLgV2_YkA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: eab89e2bccd27b23f72d141f9eab1391:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 14/18] Squashfs: sanity check fragment block location and range
Date: Sat,  7 Nov 2026 05:28:39 +0000
Message-ID: <20261107052843.725239-15-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfOTQmQ8ldb1L6Z7ew8SPi1012mr5U1Xa8lco2C4aP3m6zJYvQ17nzGMGS0TnBjTFG86S/TWYS0nApzO41kXfchTBTmDO1pI8Ie3zro/RzrC57oIcwvJQ
 R+QRD9meWRehcyk3jB4M+M/+BA5r0PtAyMwy9P4xzlq1fGj8KmpDN/vWKbzX0ni4EneNGi/CmEADuNODdiey2i0FRw6K4wwS6pizi0+pTdlLimPgWIQQA/Q/
 kODz1Id5ydCSFjza6qH1MfW7JZT6zVOnZlbJZqhY47sfTL9LygLZxuwj9ayikt5w

When reading fragment blocks from disk the location and range of the
fragment block is not sanity checked before it is passed down to
squashfs_read_data().

In squashfs_read_data() the block location and range are sanity checked
to the extent that the location plus block length does not go beyond the
end of the filesystem.  But, a block location can be crafted to be close
to 2^64, and so the addition of the location and the length can cause
arthimetic overflow, and thereby evade the sanity check.

This evasion, however, will be caught when the code after the sanity
check tries to read the block from the filesystem.  This is because
it is the block location that is passed to the I/O read, and not
the result of the overflowed sanity check.  This will return error
because it will be beyond the end of the device.

The real issue here is that leaving the sanity checking of the fragment
block location and range to squashfs_read_data() is sub-optimal.  This
is because a fragment cache buffer has to be obtained (with possible
waits fop a free buffer, and then the eviction of the original cached
contents) before squashfs_read_data() is called.

This adds unnecessary overhead and contention, which could be exploited
to reduce performance, and this is for incorrect values that should have
been detected earlier.

This commit adds extra sanity checking to ensure the fragment block
location and range are within bounds before a free fragment block is
obtained.

Reproducer
==========

The reproducer generates a Squashfs filesytem with a fragment block, and
then corrupts the location of the fragment block to 2^64 - 32 KiB.  If
the exploit succeeds this corrupted value is paased to
squaashfs_read_data() and it is not detected until the I/O read fails.

=====================================================================

ARGS="-quiet -no-progress -noI -noD -noF -no-sparse -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create Squashfs filesystem with one file

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=32 2>/dev/null" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo "Corrupt the location of fragment block 0"
echo "Alter it to the value 0xFFFFFFFFFFFF8000 (2^64 - 32 KiB)"
echo "The block location is stored at byte offset 32958"

/usr/bin/echo -en "\x00\x80\xff\xff\xff\xff\xff\xff" > file
dd if=file of=img.sqsh seek=32958 bs=1 count=8 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dmesg should show the following:
echo "dd: attempt to access beyond end of device"
echo "	loop20: rw=2048, sector=36028797018963904, nr_sectors = 64 limit=72"
echo "SQUASHFS error: Failed to read block 0xffffffffffff8000: -5"
echo "SQUASHFS error: Unable to read fragment cache entry [ffffffffffff8000]"
echo "SQUASHFS error: Unable to read fragment cache entry [ffffffffffff8000]"
echo "SQUASHFS error: Unable to read page, block ffffffffffff8000, size 1008000"

dd if=/mnt/zero

popd 2>&1> /dev/null

rm -rf $DIR
=========================================================================

Fixes: f400e12656ab5 ("Squashfs: cache operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/cache.c            |  7 +++++--
 fs/squashfs/file.c             |  8 ++++++--
 fs/squashfs/fragment.c         |  2 +-
 fs/squashfs/squashfs_helpers.h | 24 ++++++++++++++++++++++--
 4 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 7cb16414cd23..4b6ef8838bc6 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -490,9 +490,12 @@ struct squashfs_cache_entry *squashfs_get_fragment(struct super_block *sb,
 				u64 start_block, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	int res = squashfs_check_range(start_block, length, msblk);
 
-	return squashfs_cache_get(sb, msblk->fragment_cache, start_block,
-		length);
+	if (res < 0)
+		return ERR_PTR(res);
+
+	return squashfs_cache_get(sb, msblk->fragment_cache, start_block, res);
 }
 
 
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index d3be147e1ea3..47ef3d71187d 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -443,7 +443,7 @@ static int squashfs_readpage_fragment(struct folio *folio, int expected)
 	struct squashfs_cache_entry *buffer = squashfs_get_fragment(inode->i_sb,
 		squashfs_i(inode)->fragment_block,
 		squashfs_i(inode)->fragment_size);
-	int res = buffer->error;
+	int res = IS_ERR(buffer) ? PTR_ERR(buffer) : buffer->error;
 
 	if (res)
 		ERROR("Unable to read page, block %llx, size %x\n",
@@ -453,7 +453,8 @@ static int squashfs_readpage_fragment(struct folio *folio, int expected)
 		squashfs_copy_cache(folio, buffer, expected,
 			squashfs_i(inode)->fragment_offset);
 
-	squashfs_cache_put(buffer);
+	if (!IS_ERR(buffer))
+		squashfs_cache_put(buffer);
 	return res;
 }
 
@@ -519,6 +520,9 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 	void *addr;
 	struct page *last_page;
 
+	if (IS_ERR(buffer))
+		return 1;
+
 	if (buffer->error)
 		goto out;
 
diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 1f372374c29d..33ef05ea4367 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -54,7 +54,7 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 		return size;
 
 	*fragment_block = le64_to_cpu(fragment_entry.start_block);
-	return squashfs_frag_size(fragment_entry.size, msblk->block_size);
+	return le32_to_cpu(fragment_entry.size);
 }
 
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 9b3466d26cd1..146307064d9e 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -222,9 +222,9 @@ static inline int squashfs_data_size(__le32 raw, s32 block_size)
 	return squashfs_block_size(le32_to_cpu(raw), block_size);
 }
 
-static inline int squashfs_frag_size(__le32 raw, s32 block_size)
+static inline int squashfs_frag_size(u32 disk_size, s32 block_size)
 {
-	int size = squashfs_block_size(le32_to_cpu(raw), block_size);
+	int size = squashfs_block_size(disk_size, block_size);
 
 	if (size < 0)
 		return size;
@@ -235,4 +235,24 @@ static inline int squashfs_frag_size(__le32 raw, s32 block_size)
 
 	return size;
 }
+
+static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct squashfs_sb_info *msblk)
+{
+	int size = squashfs_frag_size(disk_size, msblk->block_size);
+
+	if (size < 0)
+		return size;
+
+	if (start_block >= msblk->inode_table)
+		return -EIO;
+
+	/*
+	 * the above check ensured start_block is not 2^63 or larger, and so
+	 * this addition will not overflow
+	 */
+	if (start_block + squashfs_compressed_size_block(size) > msblk->inode_table)
+		return -EIO;
+
+	return size;
+}
 #endif
-- 
2.47.3

