Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325334F3937
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892612; cv=none; b=ueDIX4/MABO0wSzjbs/y/MwgfIgNYiBYdFQJWi3tBfgizRtF5TtYuJ+KCMyx2yOEI5Vzr7yvLqSC96ervG/10LrlYpIQLaGIuzm5PKE8vL2K/lYa3Z4yhB2X1jr4oPgVUFw5kb/Gnfrs6URBAXfpCNwEJuyOJd8EuTzo3PiFZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892612; c=relaxed/simple;
	bh=BPNgHSwLKmiOew0LWZsXz2yM5C7qwf971HnvLpqqEes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+I15vO3apmoynechs1vOoeN3a92GwwjXRuoeJjvJan1v0aWSfUyx33xXDliCysLPxAJGqRwaNT9G5UAhJiXBnPsoaMG3DvS2qjQDDAmWgquvLHQmuWfShuzr0aZgG5Q+5/vNL+7GzRBukvp7SBqIQYkJQadN+WrYTnXOG3jU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzK0gogJ; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzK0gogJ"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so986731a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892609; x=1792497409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOiYDl7mZ6lhh3dxPT3WdKzl5dH1QWyreHw8tB/pqeY=;
        b=NzK0gogJgizD5gSOUh7ToEu33KcoJ7wVKScqa2JUZqembAMPiHsoEwf/RXJAKbpWtt
         o3nzBw07CtwlgaoGfaVj+28i/WAY0y5p93iUcSLIVRJbEOAgyOFTFgxyHIM4cF+xOzq8
         S8gp5Twx4cCAe7uUJ2Z9rx/U0gzx432H0ok9aN9pdxolnnMF+3Qd+8NP0IUA3Q9nnsKV
         q+mrc7FI6gLDczwM0d6metQtsaj4OKr0mQM950uVSYqNCpUUEmBmeXhiCIYr6M6/RWKQ
         7SnBsXpMla2HqErh+uRAER4NRL1FbFdXLBrRL+hXNWD/Rxmh+xPMBycn8uf4hmuehHRn
         xadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892609; x=1792497409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOiYDl7mZ6lhh3dxPT3WdKzl5dH1QWyreHw8tB/pqeY=;
        b=fDxtxSF+6dcVjah59E42c4Zv521rid2GXtU3rsysdf8TCUlSwwEH/LkLXFdOmMe49Y
         qaC7/cnbmmznUZ1FUQeJM+tBYbkRD53jfo1HhiHDLIxn8sjc5pXgJ+sVfqu4UCOE7Dtk
         SCNcdGcvF+pCbdBdbAGCQ+ErnRk7AJeb+oTyjzBjZDmPaYJ1iZWr+HA4rWaf4cTebC5C
         PmjQMR5wFhxXZHIHyUPtwTE3B/kxSqt7dIqIWPSVl0JXWAeJm6Yd6eP5ZjkxjPYf2m5T
         iaTL7Bqfj0CvZkEmqHWf8bxcMimtmRrurCAA4cuZ8Xk/Ws8H3KpJUJnoDYVxLh7YAJMN
         BECQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu/fM6VLbQt5U0MXar+fdEBBEczj/5E9+scv8LeBwo363tMBrCRm/q4vXis5jkTEP0Rw8SCWr6J7PPHoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOjZNxunflNwoKajctzSs0hzSUA1L6rnKFmFxz/AvET+2drXjB
	lMT/vkLjC04UCFfLYAdfkUHeuQ2WtMdzea3CqRN6juixCI8x871Fv+L3
X-Gm-Gg: AYBFou1CcPuzk6uD0tzXrcnXajAt3oJp1xh6FPTMrDUckYlx/HC4Hwpvl+IejsJz0sx
	TPgyYk1qC6VIWhcaLiDT5birNYDoxJanIxzh5Chb0NoXjz2tFlrwLAZwbbZtcp59ULCyvGEURH/
	qkGQP7gvTIkG4EXkw09xYwXbeka9uUJcu1gBLGK0MWdW7hQLBUmPJNyQartHorKwS1CTv7Bcu5Y
	xk/aLKofRo8PppCkh6FVzjIopyWmf7BmBAsyzgftf9PaOu5vWUaVaxxQ6Tqkb0wtEVxOhWP8PyH
	m7ZoZwoEM2mzYJWRLvcqVZGCqs2wo9Jajv5kj4sfI1IofyUVxs+R01War8aC4QFyai/bhEt5rZK
	Apsht2SFK/va9HfzAwrIpdN3koCdmsQdRwJsoeiDBjgMso8PKFc+81F8eRWlI0C2Lr5jTnRB2Ji
	nJovdKr5SLOtl9qqQJu768Y/0jienv/RoT3EO1mIMggTH55uIiyWNq50qItPSK6g/t/2KR/27PD
	b9y2yBHtzGOt89zlsvR7yw+bXOw8qMiZDrT
X-Received: by 2002:a17:90b:1e47:b0:3a4:ee64:b82c with SMTP id 98e67ed59e1d1-3ab3b06bb4bmr9681112a91.66.1791892609329;
        Tue, 13 Oct 2026 04:56:49 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:56:48 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 04/18] f2fs: carry subpage offset and count in write IO
Date: Tue, 13 Oct 2026 19:56:07 +0800
Message-ID: <20261013115621.968742-5-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Large folio write paths need to submit I/O for a range inside a
folio instead of always submitting the whole folio from offset zero.
Add folio_offset and folio_blkcnt to f2fs_io_info to describe the
block offset inside the folio and the number of contiguous blocks
covered by the I/O.

Apply the new fields to the bio submit paths that need the subpage
offset or contiguous block count.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/checkpoint.c |  2 ++
 fs/f2fs/compress.c   |  1 +
 fs/f2fs/data.c       | 63 +++++++++++++++++++++++++++++++-------------
 fs/f2fs/f2fs.h       | 11 ++++++++
 fs/f2fs/gc.c         |  2 ++
 fs/f2fs/inline.c     |  1 +
 fs/f2fs/segment.c    |  3 ++-
 7 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7b89bb838..81c1c2de9 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -264,6 +264,7 @@ static struct f2fs_cached_block *__get_meta_cache(struct f2fs_sb_info *sbi,
 		.op_flags = REQ_META | REQ_PRIO,
 		.old_blkaddr = index,
 		.new_blkaddr = index,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.is_por = !is_meta ? 1 : 0,
 		.is_cache = 1,
@@ -462,6 +463,7 @@ int f2fs_ra_meta_caches(struct f2fs_sb_info *sbi, block_t start,
 		.type = META,
 		.op = REQ_OP_READ,
 		.op_flags = sync ? (REQ_META | REQ_PRIO) : REQ_RAHEAD,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.in_list = 0,
 		.is_por = (type == META_POR) ? 1 : 0,
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f10c75380..0719a0e1e 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1288,6 +1288,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.op_flags = wbc_to_write_flags(wbc),
 		.old_blkaddr = NEW_ADDR,
 		.folio = NULL,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
 		.io_type = io_type,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 29df36d93..cc92f05be 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -850,6 +850,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	struct folio *fio_folio = fio->folio;
 	struct folio *data_folio = fio->encrypted_page ?
 			page_folio(fio->encrypted_page) : fio_folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
+	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
@@ -862,11 +865,11 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	bio = __bio_alloc(fio, 1);
 
 	f2fs_set_bio_crypt_ctx(bio, fio_folio->mapping->host,
-			fio_folio->index, fio, GFP_NOIO);
-	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
+			fio_lblk, fio, GFP_NOIO);
+	bio_add_folio_nofail(bio, data_folio, bio_len, bio_offset);
 
 	if (fio->io_wbc && !is_read_io(fio->op))
-		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, bio_len);
 
 	inc_cache_count(fio->sbi, is_read_io(fio->op) ?
 			F2FS_RD_DATA : WB_DATA_TYPE(fio->folio, false));
@@ -913,7 +916,8 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 }
 
 static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
-				struct folio *folio, enum temp_type temp)
+				struct folio *folio, size_t len, size_t offset,
+				enum temp_type temp)
 {
 	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
 	struct bio_entry *be;
@@ -922,7 +926,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
 	be->bio = bio;
 	bio_get(bio);
 
-	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
+	bio_add_folio_nofail(bio, folio, len, offset);
 
 	f2fs_down_write(&io->bio_list_lock);
 	list_add_tail(&be->list, &io->bio_list);
@@ -939,6 +943,9 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct folio *folio)
 {
 	struct folio *fio_folio = fio->folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
+	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
 	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
@@ -961,8 +968,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							    fio->new_blkaddr));
 			if (f2fs_crypt_mergeable_bio(*bio,
 					fio_folio->mapping->host,
-					fio_folio->index, fio) &&
-			    bio_add_folio(*bio, folio, folio_size(folio), 0)) {
+					fio_lblk, fio) &&
+			    bio_add_folio(*bio, folio, bio_len, bio_offset)) {
 				ret = 0;
 				break;
 			}
@@ -1076,6 +1083,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	struct folio *data_folio = fio->encrypted_page ?
 			page_folio(fio->encrypted_page) : fio->folio;
 	struct folio *folio = fio->folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	unsigned int fio_cnt = F2FS_FIO_BLKCNT(fio);
+	size_t bio_offset = F2FS_FIO_BIO_OFFSET(fio);
+	size_t bio_len = F2FS_FIO_BIO_SIZE(fio);
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
@@ -1090,9 +1101,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_VECS);
 		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
-				folio->index, fio, GFP_NOIO);
+				fio_lblk, fio, GFP_NOIO);
 
-		add_bio_entry(fio->sbi, bio, data_folio, fio->temp);
+		add_bio_entry(fio->sbi, bio, data_folio, bio_len,
+			     bio_offset, fio->temp);
 	} else {
 		if (add_ipu_page(fio, &bio, data_folio))
 			goto alloc_new;
@@ -1103,7 +1115,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 	inc_cache_count(fio->sbi, WB_DATA_TYPE(folio, false));
 
-	*fio->last_block = fio->new_blkaddr;
+	*fio->last_block = fio->new_blkaddr + fio_cnt - 1;
 	*fio->bio = bio;
 
 	return 0;
@@ -1166,6 +1178,10 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	struct folio *bio_folio;
 	struct f2fs_lock_context lc;
 	enum count_type type;
+	pgoff_t fio_lblk;
+	unsigned int fio_cnt;
+	size_t bio_offset;
+	size_t bio_len;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
@@ -1198,33 +1214,39 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	/* set submitted = true as a return value */
 	fio->submitted = 1;
 
+	fio_lblk = F2FS_FIO_LBLK(fio);
+	fio_cnt = F2FS_FIO_BLKCNT(fio);
+
 	type = WB_DATA_TYPE(bio_folio, fio->compressed_page);
-	inc_cache_count(sbi, type);
+	for (unsigned int i = 0; i < fio_cnt; i++)
+		inc_cache_count(sbi, type);
 
 	if (io->bio &&
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
 			      fio->new_blkaddr) ||
 	     !f2fs_crypt_mergeable_bio(io->bio, fio_inode(fio),
-				bio_folio->index, fio)))
+				fio_lblk, fio)))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
 		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
 		f2fs_set_bio_crypt_ctx(io->bio, fio_inode(fio),
-				bio_folio->index, fio, GFP_NOIO);
+				fio_lblk, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
 
-	if (!bio_add_folio(io->bio, bio_folio, folio_size(bio_folio), 0)) {
+	bio_offset = F2FS_FIO_BIO_OFFSET(fio);
+	bio_len = F2FS_FIO_BIO_SIZE(fio);
+
+	if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {
 		__submit_merged_bio(io);
 		goto alloc_new;
 	}
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
-				folio_size(fio->folio));
+		wbc_account_cgroup_owner(fio->io_wbc, fio->folio, bio_len);
 
-	io->last_block_in_bio = fio->new_blkaddr;
+	io->last_block_in_bio = fio->new_blkaddr + fio_cnt - 1;
 
 	trace_f2fs_submit_folio_write(fio->folio, fio);
 #ifdef CONFIG_BLK_DEV_ZONED
@@ -3199,7 +3221,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
+	    f2fs_lookup_read_extent_cache_block(inode,
+						F2FS_FIO_LBLK(fio),
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
@@ -3218,7 +3241,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
 
-	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
+				     LOOKUP_NODE);
 	if (err)
 		goto out;
 
@@ -3321,6 +3345,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		.op_flags = wbc_to_write_flags(wbc),
 		.old_blkaddr = NULL_ADDR,
 		.folio = folio,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.compr_blocks = compr_blocks,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 90da387f4..d0a9b3f99 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1350,6 +1350,8 @@ struct f2fs_io_info {
 	blk_opf_t op_flags;	/* req_flag_bits */
 	block_t new_blkaddr;	/* new block address to be written */
 	block_t old_blkaddr;	/* old block address before Cow */
+	pgoff_t folio_offset;	/* offset in large folio */
+	unsigned int folio_blkcnt;	/* block count in large folio */
 	struct folio *folio;	/* folio to be written */
 	struct page *encrypted_page;	/* encrypted page */
 	struct page *compressed_page;	/* compressed page */
@@ -1369,6 +1371,15 @@ struct f2fs_io_info {
 	sector_t *last_block;		/* last block number in bio */
 };
 
+#define F2FS_FIO_LBLK(fio)						\
+	(((fio)->folio)->index + (fio)->folio_offset)
+#define F2FS_FIO_BLKCNT(fio)						\
+	((fio)->folio_blkcnt)
+#define F2FS_FIO_BIO_OFFSET(fio)					\
+	((fio)->folio_offset << PAGE_SHIFT)
+#define F2FS_FIO_BIO_SIZE(fio)					\
+	F2FS_BLK_TO_BYTES((fio)->sbi, F2FS_FIO_BLKCNT(fio))
+
 struct bio_entry {
 	struct bio *bio;
 	struct list_head list;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976b..89e50f871 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1228,6 +1228,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		.temp = COLD,
 		.op = REQ_OP_READ,
 		.op_flags = 0,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.in_list = 0,
 		.is_cache = 1,
@@ -1338,6 +1339,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		.temp = COLD,
 		.op = REQ_OP_READ,
 		.op_flags = 0,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.in_list = 0,
 		.is_cache = 1,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 273b6428c..ab7537ff7 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -151,6 +151,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 		.op = REQ_OP_WRITE,
 		.op_flags = REQ_SYNC | REQ_PRIO,
 		.folio = folio,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.io_type = FS_DATA_IO,
 	};
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b09ffe916..f7079b5b8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3873,7 +3873,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
 			return CURSEG_COLD_DATA;
 
-		type = __get_age_segment_type(inode, fio->folio->index);
+		type = __get_age_segment_type(inode,
+					     F2FS_FIO_LBLK(fio));
 		if (type != NO_CHECK_TYPE)
 			return type;
 
-- 
2.43.0

