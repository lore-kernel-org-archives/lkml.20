Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494316;
	b=PQEfBZQCvLHwXuARuF8z4m3/mGWfDI4uWOTOc2X89bNIKtF1y2C0Bf2U7NlTBpj69mjN
	 R3JyTXGwc5tiElRRaxkiP7R7ya4aqsFDq9Xbq1MjaccPpxI+IcklIFRSqOaEkc8CFl8Pt
	 x+gHnBZotahJbmEQsubVjFzrhW4TQ4/G6eKr6hHEjE5MBiGgP9xrsUsIJRFDXNml2dO7T
	 VmVjCFGhRG6kfxb6ajRuelxyKLfIfYGLQ5I7VZPSOs3Ds15Vtcp2lCTprACPAt9PsjrEe
	 zxnXBad38y8YtTZYTaU38l7qlw205rAyci52C6siiqHXYBsZu4zRr1aWTWmIxLZ3mmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zVcIRGLQacKFTiD51by9bgJAXsfg9Q9oQjRTHChvRJQ=;
	b=rKbhqlpaGvQvr17IcazksJzDpvDrPCf5sjbtD52b44/XHmSLYIR3ufAd5zJr8rjmseFd
	 55J8qP3hxrHxpVPJ1JVfQNRzYjCgIfytJMB+JXUF9YhaJxzj1CFRZMR957mfKY1MRKJ4y
	 krgRIO2zcwavDoV2v55FjRhO//yfuBW6b/ADeNjC6+548tUdIyMyw1e4hPi0PN7ZJgz1J
	 OnyAEZDcbwlmabmX5+kv2FM2hQUhMc9copKcFcQJ+iNMm9iHhqPuztIeerUkA9p5e9+Po
	 BSTiQC9kkhCOtdgHSN11pSvMdCrWWMRofd23CHzmmrcisgVEtYzVMi4PNM98L9bQNIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL4B+y2o;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ADF60A383B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0ADF60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CL4B+y2o
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4916d47eeb5so3498764f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494314; x=1795099114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVcIRGLQacKFTiD51by9bgJAXsfg9Q9oQjRTHChvRJQ=;
        b=CL4B+y2ogCQVCZWG8UTwLmpDANuOVontytkGNiq4DYsRilU/Ujq19ne5aKTvo3j7Dv
         cBtdU1F8pKoygb5uL/3sofUvH7XVioHoHxtIIimcTPrbth4LMsP4dCXFz69Ln8o2s32o
         Q4C9yKQH+mGRDycXlfZCcWIYQkcUqjbxcnMAGxdLOf/FT/5gPdnu09z6MQ7PCNfXJ882
         do6VOfiPm9FXkRa4C57PAxuXLhhfVDH44HXMdJLB5i9n/6CqIeSM8/hg40W5bM6NO+s2
         dDWQQjKJMPWNj0kPF6DH1Kwz9SgcVbZqGj285MJVXEUkyjyjlUVKCnatd/dr5bsLnvlg
         t3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494314; x=1795099114;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVcIRGLQacKFTiD51by9bgJAXsfg9Q9oQjRTHChvRJQ=;
        b=nqngrM/R0YSuO/2WriuPan72ojssyVWyBEish5qy12d8nxfgRAdOUzN1yB2Wq5KoUh
         vL8LFFTi3Z8MSRMhhMMUuY1CieToXq8M1crGVkxABZkqE/kGquzl9sPJ/T/s5KqarKeI
         JaJxqOQb7WsZZHD5WlSYhiLqkNQ1OVELRjWUzum2W5QLfKJ79qo/hedWhIx+DM36Rb4l
         uC5nZfJmfWxT829tWwy3xgONWL47xYEcc+v2kBAuJCL62962g5eWMtQUVYK10xPMD+Lq
         kAKj/t7hed3cm8Ni3mirVN9XDe17RtoEn2INH0yoLKrQtfw06mA/IpKRyK7mFNJRaleP
         JwcA==
X-Forwarded-Encrypted: i=1; AL+hErEBJEcKcSUwNjfNSBiL8wxcGKV2RT1M+zZ9V3dBmDSzCh8PAl6yvQ+Kc7pqV0o7h40oQHxgMzgD0xTX/PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pvJjl4E9voA0Mfk3lFUG1/NCDDO9nSpjppF8TQD0SR8i+he5n
	jjzjSOL9wTy/kxRRigDr0LvK1wr2zLhPjwgEANTa4vd+ep7RN17ztkuecvIYkQmGriDH3mPw5u0
	iryrISaHtWWsq6fx5qrXE4G29kiXDsg==
X-Received: from wmbz21.prod.google.com ([2002:a05:600c:c095:b0:4a1:f80d:2f25])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:810c:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4ba09364b9emr108555165e9.6.1794494314261;
 Thu, 12 Nov 2026 06:38:34 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:55 +0000
In-Reply-To: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-10-jprusakowski@google.com>
Subject: [PATCH RESEND 9/9] f2fs: compress: roll back failed cluster writes of
 O_DIRECT buffered fallback
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

O_DIRECT writes to compressed files always fall back to buffered I/O.
The out-of-place updates done by writeback of compressed files don't go
through f2fs_do_write_data_page(), so they are not tracked for rollback
by the buffered fallback, and a failed write (e.g. with dm-error in
generic/250 and generic/252) leaves the dnode pointing to blocks that
were never written:

- f2fs_write_compressed_pages() points the slots of the cluster to new
  blocks, sets the header to COMPRESS_ADDR and invalidates the old
  blocks before the bios complete.

- f2fs_write_raw_pages(), when overwriting a compressed cluster, writes
  the pages with compr_blocks set, which f2fs_do_write_data_page() does
  not track, and also changes i_compr_blocks.

Track both as one entry per cluster:

- f2fs_write_compressed_pages() records the old and new block addresses
  of all slots, and the number of compressed blocks of the old and new
  cluster, so that f2fs_rollback_dio_opu_entry() can restore
  i_compr_blocks as well. f2fs_compress_write_end_io() marks the entry
  failed on I/O error; compressed pages carry the index of a page of the
  cluster.

- f2fs_write_raw_pages() records the block addresses of the cluster
  before and after writing it. An error other than a failed I/O can
  leave the cluster partially overwritten, so the entry is marked failed
  then too, to restore the old cluster.

Quota files are not tracked, they are written by the kernel, not with
O_DIRECT.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/compress.c | 97 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0147a7e05022..8aed34dcc89e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1345,8 +1345,10 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	struct node_info ni;
 	struct compress_io_ctx *cic;
 	struct f2fs_lock_context lc;
+	struct f2fs_dio_opu_entry *opu_entry = NULL;
 	block_t old_blkaddr_onstack[F2FS_ONSTACK_CLUSTER_SIZE];
 	block_t *old_blkaddr = old_blkaddr_onstack;
+	block_t *new_blkaddr = NULL;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
 	unsigned int last_index = cc->cluster_size - 1;
 	loff_t psize;
@@ -1404,7 +1406,15 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->nr_rpages = cc->cluster_size;
 
-	if (cc->cluster_size > ARRAY_SIZE(old_blkaddr_onstack)) {
+	if (!quota_inode &&
+	    unlikely(f2fs_should_track_dio_opu(inode, start_idx,
+					       cc->cluster_size)))
+		opu_entry = f2fs_start_dio_opu_track(inode, start_idx,
+						     cc->cluster_size);
+	if (opu_entry) {
+		old_blkaddr = opu_entry->old_blkaddr;
+		new_blkaddr = opu_entry->new_blkaddr;
+	} else if (cc->cluster_size > ARRAY_SIZE(old_blkaddr_onstack)) {
 		/* At most 1 KiB, don't fail the write for it. */
 		old_blkaddr = kmalloc_array(cc->cluster_size, sizeof(block_t),
 					    GFP_NOFS | __GFP_NOFAIL);
@@ -1472,6 +1482,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		cc->cpages[i - 1] = NULL;
 		(*submitted)++;
 unlock_continue:
+		if (new_blkaddr)
+			new_blkaddr[i] = f2fs_data_blkaddr(&dn);
 		inode_dec_dirty_block(cc->inode);
 		folio_unlock(fio.folio);
 	}
@@ -1481,8 +1493,13 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
 	add_compr_block_stat(inode, cc->valid_nr_cpages);
 
-	if (old_blkaddr != old_blkaddr_onstack)
+	if (unlikely(opu_entry)) {
+		opu_entry->old_compr_blocks = fio.compr_blocks;
+		opu_entry->new_compr_blocks = 1 + cc->valid_nr_cpages;
+		f2fs_end_dio_opu_track(inode, opu_entry, true, false);
+	} else if (old_blkaddr != old_blkaddr_onstack) {
 		kfree(old_blkaddr);
+	}
 
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
 
@@ -1504,7 +1521,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	return 0;
 
 out_submit_err:
-	if (old_blkaddr != old_blkaddr_onstack)
+	if (unlikely(opu_entry))
+		f2fs_end_dio_opu_track(inode, opu_entry, false, false);
+	else if (old_blkaddr != old_blkaddr_onstack)
 		kfree(old_blkaddr);
 	page_array_free(sbi, cic->rpages, cc->cluster_size);
 out_put_cic:
@@ -1534,8 +1553,10 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 	enum count_type type = WB_DATA_TYPE(folio, true);
 	int i;
 
-	if (unlikely(bio->bi_status != BLK_STS_OK))
+	if (unlikely(bio->bi_status != BLK_STS_OK)) {
 		mapping_set_error(cic->inode->i_mapping, -EIO);
+		f2fs_mark_dio_opu_failed(cic->inode, folio->index);
+	}
 
 	f2fs_compress_free_page(page);
 
@@ -1565,6 +1586,58 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 	dec_cache_count(sbi, type);
 }
 
+/*
+ * Track the overwrite of a compressed cluster with raw pages during the
+ * buffered fallback of an O_DIRECT write. If the dnode can't be read, write
+ * without tracking rather than failing the write for it.
+ */
+static struct f2fs_dio_opu_entry *f2fs_track_raw_cluster(struct compress_ctx *cc,
+							 pgoff_t start_idx)
+{
+	struct f2fs_dio_opu_entry *entry;
+	struct dnode_of_data dn;
+	unsigned int i;
+
+	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
+	if (f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE))
+		return NULL;
+
+	entry = f2fs_start_dio_opu_track(cc->inode, start_idx,
+					 cc->cluster_size);
+	for (i = 0; entry && i < cc->cluster_size; i++) {
+		entry->old_blkaddr[i] = data_blkaddr(dn.inode, dn.node_entry,
+						     dn.ofs_in_node + i);
+		entry->new_blkaddr[i] = entry->old_blkaddr[i];
+	}
+	f2fs_put_dnode(&dn);
+
+	return entry;
+}
+
+static void f2fs_end_raw_cluster_track(struct compress_ctx *cc,
+				       struct f2fs_dio_opu_entry *entry,
+				       int compr_blocks, bool failed)
+{
+	struct dnode_of_data dn;
+	unsigned int i;
+
+	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
+	if (!f2fs_get_dnode_of_data(&dn, entry->start_idx, LOOKUP_NODE)) {
+		for (i = 0; i < cc->cluster_size; i++, dn.ofs_in_node++)
+			entry->new_blkaddr[i] = f2fs_data_blkaddr(&dn);
+		f2fs_put_dnode(&dn);
+	} else {
+		failed = true;
+	}
+
+	/* The cluster is no longer compressed if its header was rewritten. */
+	if (entry->old_blkaddr[0] == COMPRESS_ADDR &&
+	    entry->new_blkaddr[0] != COMPRESS_ADDR)
+		entry->old_compr_blocks = compr_blocks;
+
+	f2fs_end_dio_opu_track(cc->inode, entry, true, failed);
+}
+
 static int f2fs_write_raw_pages(struct compress_ctx *cc,
 					int *submitted_p,
 					struct writeback_control *wbc,
@@ -1572,6 +1645,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 {
 	struct address_space *mapping = cc->inode->i_mapping;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
+	struct f2fs_dio_opu_entry *opu_entry = NULL;
+	pgoff_t start_idx = start_idx_of_cluster(cc);
 	struct f2fs_lock_context lc;
 	int submitted, compr_blocks, i;
 	int ret = 0;
@@ -1590,8 +1665,13 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		return compr_blocks;
 
 	/* overwrite compressed cluster w/ normal cluster */
-	if (compr_blocks > 0)
+	if (compr_blocks > 0) {
 		f2fs_lock_op(sbi, &lc);
+		if (!IS_NOQUOTA(cc->inode) &&
+		    unlikely(f2fs_should_track_dio_opu(cc->inode, start_idx,
+						       cc->cluster_size)))
+			opu_entry = f2fs_track_raw_cluster(cc, start_idx);
+	}
 
 	for (i = 0; i < cc->cluster_size; i++) {
 		struct folio *folio;
@@ -1646,6 +1726,13 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 	}
 
 out:
+	/*
+	 * An error other than a failed I/O can leave the cluster partially
+	 * overwritten, so mark it failed too, to restore the old cluster.
+	 */
+	if (unlikely(opu_entry))
+		f2fs_end_raw_cluster_track(cc, opu_entry, compr_blocks,
+					   ret || f2fs_cp_error(sbi));
 	if (compr_blocks > 0)
 		f2fs_unlock_op(sbi, &lc);
 
-- 
2.56.0.567.gdb80ae8cd5-goog

