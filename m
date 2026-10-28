Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202268;
	b=thl9gSrZPIduzJb0aU6xbDPH6vJ6eKUUfJQddSEzI4LD5oL51bx8OM1yuVpbfqasjDdZ
	 CL88XsK/DjkD6AJoBvaB+31CHxkqTfen6SK18MWtZqvKTnNkWLa/iYzvWFEt1GTgwZ/FY
	 C40cwnOh5gArCVbIpMCVPQ8fq3FxCInt399kce3lG8v2LRk9XUmo5Gn/SiA8kSjdI5oWI
	 yRIIgHU2wYQs0le7Vm7PLgfMtkDHt5uXNmJlGJJBHi8rM/LYFean/L/QQzyCBt4UXkiv7
	 KYpqwbrf8WblmZE2Wm+05gXliN8tBhWYyXdxvOUG9cngPiU6l/KMoOIxGyyp6o8JwLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sdZSA4NDFr1pO/Eh75mZMaNOeHmEs+DObpcXA0s9FLE=;
	b=kTHLQsaUC7LrEC9Dm6zpNNEkSngkpS1slOz8uK6gxaGyKB2gRy7NGYBd4bUfsgdP849D
	 mzgrlsLGsIyt7Gkngzvy4M71Y5NrOUiIBN/39A7MpaEAePQnCf4yUNYqxXd4Oc3oBcYwY
	 YCK1CK0rxedF7FOSvIAZKfnnuI/myE8bh0KmUM70BE3Up/JLVe2Mf1oXLBka1Sn/pHi+2
	 /lik7X0ELSdLJ+dILEzWrg8KrUuNw7JdLQQumPyJpm2BLx9DE7jGDVTZqTJDzvmqVSjoz
	 bShag300uLZcqOUAUGvtoFMJDauAxUrBT8DqO+mMxyto1unAZd2bAUd+pJV8H/NvgMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vWAVNC/d";
	arc=none smtp.remote-ip=209.85.214.195
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205460A6F4C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6205460A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWAVNC/d
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2e9ae391a05so8328695ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202268; x=1793807068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdZSA4NDFr1pO/Eh75mZMaNOeHmEs+DObpcXA0s9FLE=;
        b=vWAVNC/d6fAZGxyWibiDhKuwVmrlOhdTzWnzYeQpiPA/tetx+Oob+6t1qs6Mb89n60
         HrT1bM5Z+j8ofBd3WWOT6NTxP/ZB9IVWWAH6pcOq36guF9z72HrU34h3Xoo+XC2XO4BN
         vZdlmP0tdGbtLm70Y24tZBWyICBJw7UjYp+xNVZXI1PFUPLi+PqLAtsp8zwghK35Qlk1
         1JWAVN6052jQvLvN6R76rOpEjBHkolBWnvZlV0Xfv5UMTwjpU+hEGowu8npgFEVoU1Cu
         mclMv4FXOz7J6umXwZ1Org5VDsNjGTDoRTW/WQsBa11NFRAl2YAUC1Ub+ZtliVF2hmSl
         i7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202268; x=1793807068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdZSA4NDFr1pO/Eh75mZMaNOeHmEs+DObpcXA0s9FLE=;
        b=0Mbf0PGpAI68rS1RxoohahDc0QtMkWiMOqIFXlyHPAF/adYwgvtaP17QXYciPjWtno
         PB97aP7bJmwWmBY4A60WenPIo6pqdOMEZGeZznEEX4w7jnaduYZtoIDvGo/x1r+6Abzl
         gHX6juYPjLLXhqpKf5f95xmDFjCK5R6CP8uxrdw+cZ15VP82lHZeSuTCzEktMfcKcjEz
         oCqi7cnIvOSoVdLY6MCJ0YcwVaDWUgQnNjk2nKXJmbxbGJsEYSm2h15pf2YJm9fqIS2J
         ZE+/Wa+QRNCeolJRtzMBN13W0FXvXH0uAMo8tcVoX3Obi+JJ1E/XYnFG8bcL8VVKeUxT
         11GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlS+PMum++zn96UJprGcHbqtKwKWzudwJBQ9sL2QMOOFtW4Rdz9VWL07gOX6XVyFt2UQU370c8qG8plxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRRDh8FHnWsOuvHwGFlB2v5OnkEEh1u9klVkRm7APk4dQUFcp+
	mlPxTloliE4yUgD5PQlgNPx9JZ0Uvr5KIt03CzLbWR9B+JcePF3CboKA
X-Gm-Gg: AYBFou0riyQdzyBZaj0HCF5xV4IzDgMTZvJ/56gLn5bHamcldtSzVb8EyfGeZgNcduo
	3PtgtUr4tAMgEHHSJSmc98owSXfg25mdj4KOXnIjJr++bTLggDR8RWgievT2PegdljdGmNp4aXQ
	9lGvl1unr8EoMDvaRRZWcpHH/1GqW25d78BgiSbOVPS6zEORg080k8BFXo1TrFOOlfgoUUCB5KZ
	LwLUq3frjJ+IMT9B7csjlrkfhfghq1w+XtQGjmkkWoezjrycKheamrZ5tWEHXyYrIYHzLFPwxwK
	GBkIU0t2PBUkRxqwlEn6o6U0n1l21JgRjA1zQshkAo8+7H2M66FR2s/HRO2rgam2uuA3DJ630Tt
	XQWX3TzP4YljgM345EM1Wy5VBh+UARNODZUOu8xVchKS72aTS8POjF2QDmk43sKujnBdj4uw9sU
	E94eRLxlP93QXkP/lV0zQmrVJEIrNZwMbAlUQuuRf5q7b1BbxbVC2Gq2q+5l8vd535ky7hC/KZi
	12IucxD0EXs0OIsXec3exo/gsGPbj3LRsv70aw8gc5DEFCZtzROxyJ14jQo9LBNSvfwopPDiHlq
	YYCMI+dKsB7gaIUyY0zwB8UgFjWc/352cDQStd2gJAEgzPjrSPs7rivIOGsBqg97uqA=
X-Received: by 2002:a17:903:17c7:b0:2e9:484d:693 with SMTP id d9443c01a7336-2eae394f821mr31309845ad.5.1793202267637;
        Wed, 28 Oct 2026 08:44:27 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:27 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v8 02/15] f2fs: carry subpage offset and count in write IO
Date: Wed, 28 Oct 2026 23:43:53 +0800
Message-ID: <20261028154407.1601430-3-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c       | 78 ++++++++++++++++++++++++++++++++------------
 fs/f2fs/f2fs.h       | 11 +++++++
 fs/f2fs/gc.c         |  4 +++
 fs/f2fs/inline.c     |  1 +
 fs/f2fs/segment.c    |  3 +-
 7 files changed, 79 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5c5b45d3c67b..3ad709f69893 100644
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
index 747141c79900..c0e39f580993 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1282,6 +1282,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.op_flags = wbc_to_write_flags(wbc),
 		.old_blkaddr = NEW_ADDR,
 		.page = NULL,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
 		.io_type = io_type,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 603a7a570f2a..3a3852566a2a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -849,6 +849,13 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	struct folio *fio_folio = fio->folio;
 	struct folio *data_folio = fio->encrypted_page ?
 			page_folio(fio->encrypted_page) : fio_folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	size_t bio_offset;
+	size_t bio_len;
+
+	bio_offset = data_folio == fio_folio ? F2FS_FIO_BIO_OFFSET(fio) : 0;
+	bio_len = data_folio == fio_folio ? F2FS_FIO_BIO_SIZE(fio) :
+					    folio_size(data_folio);
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
@@ -861,11 +868,11 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
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
@@ -924,7 +931,8 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 }
 
 static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
-				struct folio *folio, enum temp_type temp)
+				struct folio *folio, size_t len, size_t offset,
+				enum temp_type temp)
 {
 	struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
 	struct bio_entry *be;
@@ -933,7 +941,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
 	be->bio = bio;
 	bio_get(bio);
 
-	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
+	bio_add_folio_nofail(bio, folio, len, offset);
 
 	f2fs_down_write(&io->bio_list_lock);
 	list_add_tail(&be->list, &io->bio_list);
@@ -950,7 +958,14 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct folio *folio)
 {
 	struct folio *fio_folio = fio->folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	size_t bio_offset;
+	size_t bio_len;
 	struct f2fs_sb_info *sbi = fio->sbi;
+
+	bio_offset = folio == fio_folio ? F2FS_FIO_BIO_OFFSET(fio) : 0;
+	bio_len = folio == fio_folio ? F2FS_FIO_BIO_SIZE(fio) :
+				       folio_size(folio);
 	enum temp_type temp;
 	bool found = false;
 	int ret = -EAGAIN;
@@ -972,8 +987,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
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
@@ -1087,6 +1102,14 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	struct folio *data_folio = fio->encrypted_page ?
 			page_folio(fio->encrypted_page) : fio->folio;
 	struct folio *folio = fio->folio;
+	pgoff_t fio_lblk = F2FS_FIO_LBLK(fio);
+	unsigned int fio_cnt = F2FS_FIO_BLKCNT(fio);
+	size_t bio_offset;
+	size_t bio_len;
+
+	bio_offset = data_folio == folio ? F2FS_FIO_BIO_OFFSET(fio) : 0;
+	bio_len = data_folio == folio ? F2FS_FIO_BIO_SIZE(fio) :
+					folio_size(data_folio);
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
@@ -1101,20 +1124,21 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
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
 	}
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, folio, folio_size(folio));
+		wbc_account_cgroup_owner(fio->io_wbc, folio, bio_len);
 
 	inc_cache_count(fio->sbi, WB_DATA_TYPE(folio, false));
 
-	*fio->last_block = fio->new_blkaddr;
+	*fio->last_block = fio->new_blkaddr + fio_cnt - 1;
 	*fio->bio = bio;
 
 	return 0;
@@ -1177,6 +1201,10 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	struct folio *bio_folio;
 	struct f2fs_lock_context lc;
 	enum count_type type;
+	pgoff_t fio_lblk;
+	unsigned int fio_cnt;
+	size_t bio_offset;
+	size_t bio_len;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
@@ -1209,24 +1237,32 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
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
+	bio_offset = bio_folio == fio->folio ? F2FS_FIO_BIO_OFFSET(fio) : 0;
+	bio_len = bio_folio == fio->folio ? F2FS_FIO_BIO_SIZE(fio) :
+					    folio_size(bio_folio);
+
+	if (!bio_add_folio(io->bio, bio_folio, bio_len, bio_offset)) {
 		__submit_merged_bio(io);
 		goto alloc_new;
 	}
@@ -1234,10 +1270,9 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	F2FS_BIO(io->bio)->entry_cnt++;
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
-				folio_size(fio->folio));
+		wbc_account_cgroup_owner(fio->io_wbc, fio->folio, bio_len);
 
-	io->last_block_in_bio = fio->new_blkaddr;
+	io->last_block_in_bio = fio->new_blkaddr + fio_cnt - 1;
 
 	trace_f2fs_submit_folio_write(fio->folio, fio);
 #ifdef CONFIG_BLK_DEV_ZONED
@@ -3231,7 +3266,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
+	    f2fs_lookup_read_extent_cache_block(inode,
+						F2FS_FIO_LBLK(fio),
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
@@ -3250,7 +3286,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
 
-	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
+				     LOOKUP_NODE);
 	if (err)
 		goto out;
 
@@ -3353,6 +3390,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		.op_flags = wbc_to_write_flags(wbc),
 		.old_blkaddr = NULL_ADDR,
 		.folio = folio,
+		.folio_blkcnt = 1,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.compr_blocks = compr_blocks,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 116c36a37f30..567568e1c49f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1350,6 +1350,8 @@ struct f2fs_io_info {
 	blk_opf_t op_flags;	/* req_flag_bits */
 	block_t new_blkaddr;	/* new block address to be written */
 	block_t old_blkaddr;	/* old block address before Cow */
+	pgoff_t folio_offset;	/* offset in large folio */
+	unsigned int folio_blkcnt;	/* block count in large folio */
 	union {
 		struct page *page;	/* page to be written */
 		struct folio *folio;
@@ -1372,6 +1374,15 @@ struct f2fs_io_info {
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
index 5b948c92f981..72c7f9ceafc2 100644
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
@@ -1550,6 +1552,8 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
 			.folio = folio,
+			.folio_offset = bidx - folio->index,
+			.folio_blkcnt = 1,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 273b6428c9f9..ab7537ff7ebd 100644
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
index daf6d9617d5b..80f58c586e33 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3876,7 +3876,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
 			return CURSEG_COLD_DATA;
 
-		type = __get_age_segment_type(inode, fio->folio->index);
+		type = __get_age_segment_type(inode,
+					     F2FS_FIO_LBLK(fio));
 		if (type != NO_CHECK_TYPE)
 			return type;
 
-- 
2.43.0

