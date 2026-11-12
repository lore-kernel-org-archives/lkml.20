Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494315;
	b=SH972eOTwKkkXpeIj/tfKxp+62oqwFjpsi5kRvW5bhrjpyM+0Oe0QI6ybKtbCTostZyi
	 2uHbr1spCtGCpos92tK1EE7/8iNJDnlkVq+IxBS+RlwHtZVlxKSrFbqLNvs6vs8Cn9pMD
	 XL8S9bQpNPWZqMiE2SO4H2ZAfAt9AdF2Kl8N0GZU59Kjwc7WQyEEkKeVtkn8tVkxgU3Zs
	 SwsY1s6s+jYUPIhgztwi9K7Ayp6MooVhxXc9bsLfLzV9bEd9CuFwjP80sfX1hdgj/ZEa3
	 OBcAPJxsist1ZgQXtD1RvRHbLNjR7BzZaZhaTQRnGiAbUZTjTTEDUNim7Z29YwpB7lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hmIEzwpVPZSicrLKtBd9SCjsMRd93+KAzG0uZsTPwwc=;
	b=a16dhroVyKA+y5SKdKd7btitV65q7gSHd2RcwSwKh1sDJ1XfJoa1adD0RgbmSFyrP9PU
	 v6q1j1E9s39lZRpshBgyHD2MH3fpq4UK0EZzugQhUrxsCEM6RKt4cGUyyul5gHmUhwgew
	 FQNCOAVktyXXD+J0yP2juCukqWnJ7UvReRHsdlNxn1WyOrccgHjvBA7+z8G0xiBc/Wjof
	 R0RBekahNk2oU4jA9Wf9xiv4yg866WHsA/2iUPRdFrWL1tzYHOVjhSWDbU7vE22r0kN1K
	 8XXYgBMZV/4HTXYCij+qd/RhekTtg2vLFbAUNYan02A9xgoKLyf2f1GWVPm3nR+BoCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="FT/m6Rvr";
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0D60A3830
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D0D60A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FT/m6Rvr
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c504bdea834so227396166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494314; x=1795099114; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmIEzwpVPZSicrLKtBd9SCjsMRd93+KAzG0uZsTPwwc=;
        b=FT/m6RvrKyjzrcHZNZyPMj3qZj8GOaSO2y04g1cmeIf+oCtnFfOrPZruj1f8NJAd+C
         Aa/5Uqu4i1GZSh+GtyUilLq09/qVswZ1Uoo5uh3y3WY5h3ZII4btdiW2FrEPhIgkh4j5
         DvuNvnOyOCClFnouGisLWlQE8/iO8W0WVlM+Tm4gilfPwebsrNAGcmkaAl3S459oy5Ao
         YBoMX7LITT8OUlnkMyWrfQDPvUHmPEg3GgX4MC5MgpvKrn34IF3PsDNFGn7hVJABf9pm
         P5VCfvRms1rg8XhxnchgszLwS70wWdT9N5kA7WZ+q5qZgaphgsHRWej1smuOfiONmzvA
         PPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494314; x=1795099114;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmIEzwpVPZSicrLKtBd9SCjsMRd93+KAzG0uZsTPwwc=;
        b=P2zA3UVjLIK0JlQjh0ZHxEEH4zu+nRBKOL8z2p6x1AJ22muT65U2v7b8voiaoqrRW5
         xITIzfzTcAa3eLxvjQvTqogtmhQTAtXyRiVut3QSpX2Gq0DiCcMgpfXil4idzm4RE38+
         5elztBs0soqpsdSoEXNlAZfEb13NCwMII973IAmaz4OY0MtcnYwIgJNiAnno9Od5W+PB
         sC42fsyfXTyUHMpp+5CPAqWJ8Shp2Yk/GOYRHR3N4LOZCrdhCSacw2VC5D7hejOguSob
         pv9D/LhYSzk/zFeC7KHE14lkYEEb260vUz17Kd6n7nl6rMvUjCa9CLCi+WzDS4hQuHE3
         jIkg==
X-Forwarded-Encrypted: i=1; AL+hErG0Bea/B18fm1uevrRScZv+WnvdXko+Jp/a4tsMDeByns/CIIHRodNPpAzKqdvNUwHMwacvM5G7GuKIRA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8buStG/aOgfARQ14QUvSwXAswWaCCwY8XzzZBiX+4TDH5/zodI
	yVOHd7pt5XQuwNBaCrQYCgWwcy2wrecWazyE/WtuAmVD8AdSSH2OdU/ksVknDdMZ/wjk0TJc5Pd
	xE/9fjqg5+hMy9yC67iFNGeQA46CFXQ==
X-Received: from ejdp25.prod.google.com ([2002:a17:906:28d9:b0:c31:64e2:a521])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72c8:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c5066b47cc8mr471942566b.29.1794494313296;
 Thu, 12 Nov 2026 06:38:33 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:54 +0000
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
Message-ID: <20261112143355.2923939-9-jprusakowski@google.com>
Subject: [PATCH RESEND 8/9] f2fs: compress: fix cleanup when a cluster write
 fails to be submitted
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

When f2fs_write_compressed_pages() fails to submit a compressed page in
the middle of a cluster, it gives up and returns -EAGAIN, and
f2fs_write_multi_pages() writes the cluster with raw pages instead. But
it leaves two things behind:

- cc->cpages[i - 1] is set to NULL before the submission is checked, so
  the compressed page that was not submitted is not freed by the out_free
  loop, and leaks from the compress page pool.

- The dnode already points to the new blocks of the slots before i, and
  their old blocks were invalidated, while the slots from i on still
  point to the old blocks. The cluster then mixes new and old compressed
  data, and f2fs_write_raw_pages() sees it in that state.

Clear cc->cpages[i - 1] only after the page was submitted, and restore
the old block addresses of the slots before i, validating the old blocks
again. That's safe because they were invalidated in the same
f2fs_lock_op() section, unless they are not valid in the last checkpoint
(checkpoint=disable), where SSR may already have reused them; leave the
cluster as it is then. The old block addresses are kept on the stack for
clusters of up to 16 blocks, and in a __GFP_NOFAIL allocation of at most
1 KiB otherwise.

Also, when a raw page overwrites a compressed cluster, decrement
i_compr_blocks in f2fs_do_write_data_page() only if the page was
submitted, since the dnode keeps COMPRESS_ADDR otherwise.

Submission only fails when block allocation fails, which happens only
after the checkpoint was stopped, so all of this only keeps the
in-memory state consistent until unmount. Note that if the allocation
fails while opening a new segment, f2fs_allocate_data_block() has
already updated the SIT for the block it doesn't return, and that is
not undone here.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/compress.c | 61 +++++++++++++++++++++++++++++++++++++++++++---
 fs/f2fs/data.c     |  6 ++---
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c5758da7c621..0147a7e05022 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1279,6 +1279,45 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
 	return f2fs_do_truncate_blocks(inode, round_up(from, PAGE_SIZE), lock);
 }
 
+/*
+ * Undo the block address updates of the first @nr slots of a cluster, after a
+ * write of the cluster failed to be submitted in the middle. Submission only
+ * fails if block allocation fails, i.e. after the checkpoint was stopped, so
+ * this only keeps the in-memory state consistent until unmount.
+ *
+ * The old blocks were invalidated in the same f2fs_lock_op() section, so they
+ * can be validated again, unless SSR could have reused them because they are
+ * not valid in the last checkpoint (checkpoint=disable). Leave the cluster as
+ * it is then.
+ */
+static void f2fs_undo_cluster_update(struct dnode_of_data *dn,
+				     block_t *old_blkaddr, int nr)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	int i;
+
+	for (i = 0; i < nr; i++) {
+		if (!f2fs_is_checkpointed_data(sbi, old_blkaddr[i]))
+			return;
+	}
+
+	for (i = 0; i < nr; i++, dn->ofs_in_node++) {
+		block_t old_blk = old_blkaddr[i];
+		block_t new_blk = f2fs_data_blkaddr(dn);
+
+		if (new_blk == old_blk)
+			continue;
+		f2fs_update_data_blkaddr(dn, old_blk);
+		if (__is_valid_data_blkaddr(new_blk))
+			f2fs_invalidate_blocks(sbi, new_blk, 1);
+		if (__is_valid_data_blkaddr(old_blk))
+			f2fs_revalidate_blocks(sbi, old_blk, 1);
+	}
+}
+
+/* Old block addresses of clusters up to this size are kept on the stack. */
+#define F2FS_ONSTACK_CLUSTER_SIZE	16
+
 static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 					int *submitted,
 					struct writeback_control *wbc,
@@ -1306,6 +1345,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	struct node_info ni;
 	struct compress_io_ctx *cic;
 	struct f2fs_lock_context lc;
+	block_t old_blkaddr_onstack[F2FS_ONSTACK_CLUSTER_SIZE];
+	block_t *old_blkaddr = old_blkaddr_onstack;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
 	unsigned int last_index = cc->cluster_size - 1;
 	loff_t psize;
@@ -1363,6 +1404,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->nr_rpages = cc->cluster_size;
 
+	if (cc->cluster_size > ARRAY_SIZE(old_blkaddr_onstack)) {
+		/* At most 1 KiB, don't fail the write for it. */
+		old_blkaddr = kmalloc_array(cc->cluster_size, sizeof(block_t),
+					    GFP_NOFS | __GFP_NOFAIL);
+	}
+
 	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_set_compressed_page(cc->cpages[i], inode,
 				page_folio(cc->rpages[i + 1])->index, cic);
@@ -1386,6 +1433,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		blkaddr = f2fs_data_blkaddr(&dn);
 		fio.folio = page_folio(cc->rpages[i]);
 		fio.old_blkaddr = blkaddr;
+		old_blkaddr[i] = blkaddr;
 
 		/* cluster header */
 		if (i == 0) {
@@ -1412,14 +1460,16 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 		fio.compressed_page = cc->cpages[i - 1];
 
-		cc->cpages[i - 1] = NULL;
 		fio.submitted = 0;
 		f2fs_outplace_write_data(&dn, &fio);
 		if (unlikely(!fio.submitted)) {
 			cancel_cluster_writeback(cc, cic, i);
 			*submitted = 0;
-			goto out_free_page_array;
+			dn.ofs_in_node -= i;
+			f2fs_undo_cluster_update(&dn, old_blkaddr, i);
+			goto out_submit_err;
 		}
+		cc->cpages[i - 1] = NULL;
 		(*submitted)++;
 unlock_continue:
 		inode_dec_dirty_block(cc->inode);
@@ -1431,6 +1481,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	f2fs_i_compr_blocks_update(inode, cc->valid_nr_cpages, true);
 	add_compr_block_stat(inode, cc->valid_nr_cpages);
 
+	if (old_blkaddr != old_blkaddr_onstack)
+		kfree(old_blkaddr);
+
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
 
 	f2fs_put_dnode(&dn);
@@ -1450,7 +1503,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	f2fs_destroy_compress_ctx(cc, false);
 	return 0;
 
-out_free_page_array:
+out_submit_err:
+	if (old_blkaddr != old_blkaddr_onstack)
+		kfree(old_blkaddr);
 	page_array_free(sbi, cic->rpages, cc->cluster_size);
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4d7731fbf5a4..016aa347880e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4018,11 +4018,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		pending_added = true;
 	}
 
-	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
-		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
-
 	/* LFS mode write path */
 	f2fs_outplace_write_data(&dn, fio);
+	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR &&
+	    likely(fio->submitted))
+		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
 	if (unlikely(opu_entry)) {
 		opu_entry->new_blkaddr[0] = fio->new_blkaddr;
 		f2fs_end_dio_opu_track(inode, opu_entry, fio->submitted, false);
-- 
2.56.0.567.gdb80ae8cd5-goog

