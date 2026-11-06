Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946723;
	b=Ht7hbSrEt24Ahcv53M531UPuYBSK/tvsHpsxn6/cMDJVUryutD6Z/1Rxffpkjo250gt7
	 vk0VdfxEKNVDwo988XzI0maWvYIDkoWE69XAnR9+HOjzMsNaF/VUXiQYV/xo+UHefwROo
	 GDeoaMhEnPOBa30h/hGx41hE0UUQuGS/CL94cJqnMsv4RFxpm1tsT79B6jDV38vnKlz/R
	 JU+SuLrNFT/CATMnnNcXRYyyi33nns3KmdtBqx3OiLKZcS04pnVQ2+VyFLd+mS9LcUOYK
	 EwVXXr8rmTOx/FbgLmcafUHsVCBkB9DDB0pFsO6o7LA591Czc6ArToW0rOZztf1lK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946723;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=EnqmSbIOJ807tKUlzSPmBcjP39loV7iEXVKHoY0IMCY=;
	b=aJRQCfpMoeeHnCqvtS5Uv0ulFJEtaRmvendoUVRGH345d+bfBsazXctaXbaV8VIMmj3i
	 1QBS+AyZrE1gbvzerBLYB6ACGXnrEOJeBYure41OVVwVJHSbm52Ha375FVGuE9F5zWU8F
	 dF++syBWLGd/NNf2cSH9t29SJPtqNbhyG0bNYpD7Svzwom/6jFLjtS1SVIrNDqH7e8FIB
	 OR40Tg3OSM72oyRWIyYeI7LNZgzOmxWGrHJNuId9dzRV+q6Ibl/C1q+MYI9q/RsctfnRQ
	 gh+7fRnlY4Nppc3J/LNkkmeQlJhZzcCQaNbTqTNV8hBPxx4sLrCXDsAkrff4eB1X+RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=o3INqrMi;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9251C606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9251C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=o3INqrMi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=En
	qmSbIOJ807tKUlzSPmBcjP39loV7iEXVKHoY0IMCY=; b=o3INqrMiaHyclSV20c
	kBMVTNQbGhTeiHw83qNwR6w42GYgv0lUhvLTB1VwRAd1rfM1CktRGew/xRCusCzP
	0SZBtVg+LkNIdhPmfSeKHdKuSrzTzu3cK6l2R6wn1O0fULPTaV38NmzJ2HeSP4lQ
	FlCLxL6FlGdeCmBMzT9BgTBUQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S6;
	Fri, 06 Nov 2026 14:31:38 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v3 4/5] ntfs: write unlinked file attributes before dropping their cache
Date: Fri,  6 Nov 2026 14:30:58 +0800
Message-ID: <20261106063059.2904988-5-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106063059.2904988-1-liubaolin12138@163.com>
References: <20261106063059.2904988-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFW3ZrWUZrWrJFWUKFWrAFb_yoW7ur1UpF
	93Cr9xKw4DXr12gwsaya15X3WSqFyfKr4UXry7Gr17A3Z5tw1xtFW7K34rtF1ftrWkG3yq
	qr4j9r47uFW7Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jco7tUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QpFEGrtdEpCQgAA3P

From: Xuewen Wang <wangxuewen@kylinos.cn>

Attribute inodes initialized for unlinked files have zero links and are
evicted at the final iput(). Explicit writes and resident-to-nonresident
conversion can leave dirty data that eviction discards, losing EAs or a
converted SECURITY_DESCRIPTOR.

Write internal attributes synchronously when the base inode has no
links. During conversion, write the resident value to the new clusters
before changing the record, so write failure can release the clusters
and retain the resident value. Propagate conversion errors to the caller.

Keep named streams on their existing I/O path. This avoids retaining
attribute inodes that would prevent unpublished files from being reclaimed.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes since v2:
- Write converted attribute data before updating the record; preserve the
  resident value and release new clusters on write failure.
- Propagate conversion errors instead of trying another attribute.

Tested in QEMU with four CPUs, NTFS debug and lockdep enabled. With 1 KiB
MFT records, varied EA sizes from 0 to 920 bytes before a 4 KiB write.
Converted security descriptors and EAs matched their expected contents
with 512-byte, 4 KiB and 8 KiB clusters, including after reboot.
Injected EIO preserved resident attributes without leaking clusters;
retry succeeded. The nonresident EA, cleanup and publication tests passed.

 fs/ntfs/attrib.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++--
 fs/ntfs/inode.c  |  8 +++++++
 2 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index fce7144d7bef..9e49edebc7d1 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -16,6 +16,7 @@
  * Copyright (c) 2010 Erik Larsson
  */
 
+#include <linux/bio.h>
 #include <linux/string_choices.h>
 #include <linux/writeback.h>
 #include <linux/iomap.h>
@@ -1958,6 +1959,40 @@ int ntfs_resident_attr_value_resize(struct mft_record *m, struct attr_record *a,
 	return 0;
 }
 
+/* Write the resident value to its new clusters before committing conversion. */
+static int ntfs_attr_write_conversion(struct ntfs_volume *vol, struct folio *folio,
+				      const struct runlist_element *rl, u32 size)
+{
+	unsigned int offset = 0;
+
+	size = round_up(size, vol->sector_size);
+	while (size) {
+		struct bio *bio;
+		unsigned int len;
+		int err;
+
+		if (!rl->length || rl->lcn < 0)
+			return -EIO;
+		len = min_t(s64, size, ntfs_cluster_to_bytes(vol, rl->length));
+		bio = bio_alloc(vol->sb->s_bdev, 1, REQ_OP_WRITE | REQ_SYNC,
+				GFP_NOIO);
+		bio->bi_iter.bi_sector =
+			ntfs_bytes_to_bio_sector(ntfs_cluster_to_bytes(vol, rl->lcn));
+		if (!bio_add_folio(bio, folio, len, offset)) {
+			bio_put(bio);
+			return -EIO;
+		}
+		err = submit_bio_wait(bio);
+		bio_put(bio);
+		if (err)
+			return err;
+		offset += len;
+		size -= len;
+		rl++;
+	}
+	return 0;
+}
+
 /*
  * ntfs_attr_make_non_resident - convert a resident to a non-resident attribute
  * @ni:		ntfs inode describing the attribute to convert
@@ -1987,6 +2022,7 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	int mp_size, mp_ofs, name_ofs, arec_size, err, err2;
 	u32 attr_size;
 	u8 old_res_attr_flags;
+	bool sync;
 
 	if (NInoNonResident(ni)) {
 		ntfs_warning(vol->sb,
@@ -2011,6 +2047,8 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		base_ni = ni;
 	else
 		base_ni = ni->ext.base_ntfs_ino;
+	sync = NInoAttr(ni) && !VFS_I(base_ni)->i_nlink &&
+		!ntfs_inode_is_named_stream(ni);
 	m = map_mft_record(base_ni);
 	if (IS_ERR(m)) {
 		err = PTR_ERR(m);
@@ -2120,6 +2158,18 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		folio_mark_uptodate(folio);
 	}
 
+	/*
+	 * A zero-link attribute inode can be evicted by the caller's iput().
+	 * Write its data before changing the record so an I/O failure leaves
+	 * the resident value intact. Normal writeback would take mrec_lock,
+	 * which callers may already hold.
+	 */
+	if (folio && sync) {
+		err = ntfs_attr_write_conversion(vol, folio, rl, attr_size);
+		if (err)
+			goto rl_err_out;
+	}
+
 	/* Backup the attribute flag. */
 	old_res_attr_flags = a->data.resident.flags;
 	/* Resize the resident part of the attribute record. */
@@ -2208,7 +2258,8 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 	unmap_mft_record(base_ni);
 	up_write(&ni->runlist.lock);
 	if (folio) {
-		iomap_dirty_folio(vi->i_mapping, folio);
+		if (!sync)
+			iomap_dirty_folio(vi->i_mapping, folio);
 		folio_unlock(folio);
 		folio_put(folio);
 	}
@@ -4941,8 +4992,11 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 			continue;
 		}
 
-		if (ntfs_attr_make_non_resident(NTFS_I(tvi), value_len)) {
+		err = ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);
+		if (err) {
 			iput(tvi);
+			if (err != -ENOSPC && err != -EPERM)
+				goto put_err_out;
 			continue;
 		}
 
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 62dd5bd5bb81..2b1388de7bb2 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -4052,6 +4052,14 @@ s64 ntfs_inode_attr_pwrite(struct inode *vi, s64 pos, s64 count, u8 *buf, bool s
 
 	WARN_ON(!NInoAttr(ni));
 
+	/*
+	 * Attribute inodes of an unlinked file have no links either and are
+	 * evicted at the final iput(). Do not leave their data in dirty pages
+	 * that eviction would discard while the base file is still open.
+	 */
+	if (!VFS_I(base_ni)->i_nlink && !ntfs_inode_is_named_stream(ni))
+		sync = true;
+
 	if (ntfs_inode_is_named_stream(ni)) {
 		if (NInoEncrypted(ni))
 			return -EACCES;

