Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985882;
	b=DCl0onLOGrTPtCvYaRRcxQ2ZjvNB/nZRUWq/pQOfomq4kB2YNCbTD4gSFK6oFJUiJwz3
	 4tANGGWJHyHgPom4SRf+R786aTLlxwOz/WJdiVk0/3BmvSfFlaCOJviEUcH31HGidzbDg
	 I0693e/tBE7aOGOrtYVVAbdXSCLZXi4ZRcu7HrCAxqoSU1cF+ovqupBroO57dyetSQtoB
	 jYK1O1RrF1EzvNx5yLRIJXgPHfWYAzVR20X5HcFAI98pPwV14Zn0WB2NOLIyNkMTlSB59
	 klfv7qvKn4BstieVua+ed5IO+PBdEk/ggb1OqOh6jKXterY7KW0JvACAmdIafHKKEgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bx23+Uf58L3kdyBabdGqaTRWMW3Z16jP7Hw799hzb00=;
	b=wMKFy5WX4falk2v8kaSDF9lCuddX38mB7z1A7bamgDeN1WDqTYtyOdZ6DhW2CGjpsE49
	 2z4bRxwEWX3KOjgMrOHSaAS76+SaNuecpRHpbHzXWedqTiPCn0tM1ZiJ5IFr3x24Am6Eq
	 ffub1qYGCQ3jMYLvMjdXDeoJ9JtIVi+MEgq1us9pKu3V7/yCYkn4W9f9bIFsqZtJj0l5D
	 7PrxkTG0zBqS0dy+xfdIg8dDy+vBdlq66ZL+MwBl405KCoSsvl2XjNYtiJjm8FEHMvEbv
	 INlvCRnUFlmbPq4lOJfXP/wx6T/ae2ecLANSqwtNd3T4IULsZWllLaYIyxZ4raWpsew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YONXVIXp;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YONXVIXp
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso479066a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985882; x=1793590682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bx23+Uf58L3kdyBabdGqaTRWMW3Z16jP7Hw799hzb00=;
        b=YONXVIXpHwpOqnNIcJg+WEFjTb1L4oKf+I2hu3/HdUi9qufE1L0jqrnd8CBVkE5hS3
         5U0ZBAXfv3d1n+Thm9EvOSPecztdvCZJJmXFAzxVlotxpr3FgRLSMkLt8f7LPOTdnek7
         CVyj17LabNnDCndV77SK3dt6nnU9PYRK0gaLWctx9MSkUL6fAlnCGrtDVNU3cz701FKB
         a6khClxNLElSXs5r3K0NgVAKUS5TF5xlr8vFQiDM2zUKuJHKnghIm1dm7/QYzL4U5kgQ
         IVCeMeS0Sp3EkNXapGsb5RkKQDK0ykuxk1pLKUn7S2oDiNhNUMTpy2gf3JjHUFsZyVtf
         1l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985882; x=1793590682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bx23+Uf58L3kdyBabdGqaTRWMW3Z16jP7Hw799hzb00=;
        b=Qe/Dj8Vt1Td76n1/CNi9Ar7/TfPYSaaK2eemt74oldDy/vcKyEkYaWSVPwBToW/Woe
         8Xt+fYiB0t3mAxLqWfbCAk7UD/b8LuKqhvh6RWX2lQF49DRDaY7WJXynR3gzGR2DJnOZ
         IDpCz+fVYhGmJAm4tVQ5Qs5FD1l4FbISR1q2MNX/gwKmyViT8SFTtek4BLDXT+88WNbV
         TMkSvxbqdnems25GmYnSRTNOmX1HEespnmccMrFIf8IAzd4gl29KjUZ4Fj9QtkzOSHhC
         aeQrcpAoGQiSH9subkB3cgHGzcguUQhnI7z4iqXGmB8ppG86WBDd4uHpj+DweA81/HKt
         I2ow==
X-Forwarded-Encrypted: i=1; AKwUvBys+ZenNyl0XxutiF3STVKYtfNfhMPItfvtnBhu6W/+7mZ1gck9kmKlMFS3z76HoXKqm5pw+pRpvJLaYpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJWqJ5ACFs0CxUCtdqjSJPnaKe9O9EZPGGyon9lzGP1uKJoSKE
	PLIPBmnWCsRLDTnY3JjTc8BVfJayfOANTC4eTuwTak03laYegMQ4knzC
X-Gm-Gg: AYBFou3C6+2wyaHTHHfNbXwiE3c3Tc4Llj/W2lJE9liRtBcD0gk/hAOK+uflY33Fx1k
	1SWgm4rilp/Cn98A3zIlSypm1ZevmlvHkA2AT/1/1DJYDq1J9PzW/PzwhUlh0xIjFKkU/qoRXm1
	Wo0iEsydkEDP0HU3tuCt+nTjtZ6BNM4KGkWPCFCMTBOiQ1aTEisPJRsd3YXS/U6lKkHk2bkWhB/
	DtkxAISn5cJfjOQLY6rm0D5rk6Ch7p5NAMOcB/iJbmyzjBQ5sX0e63jZInMyCuQ/HgHbO9XC2jI
	hiHaguWF7LRlOnVtpRPSbN7W63Goh7oH09996gWBnJGiwvBIxZ2PDGeJSMLk4bFieTpoCvC83Li
	ttstB0rasJpQZAs3oiuMK/MRpemqQjL9WS55ILUmjjpGt3kPng4UQidq7M0xcjDy4/P6G8sIv1n
	FZGbGG6F2MRQSnaTUKifTFWAoBISOC8Bw1OL15CSjwOHLVszyQVPqNTlp66TG9sHSnjkrnSZzg0
	URuuU8oxxRSn7H/VnkWnXjwsekKj90Ysq2H66C4SCdiHgHzj9spYF4u2aKS+FE8iTuMFZX/UR9u
	Zof3FZ3h1YGBd2ubSdkF9Kg+f7x/I8+Kh/C6E2o=
X-Received: by 2002:a17:90b:1a8d:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3adea0a3c84mr5198421a91.4.1792985881492;
        Sun, 25 Oct 2026 20:38:01 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:01 -0700 (PDT)
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
Subject: [PATCH v7 02/15] f2fs: carry subpage offset and count in write IO
Date: Mon, 26 Oct 2026 11:37:32 +0800
Message-ID: <20261026033745.784107-3-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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
index abb0c0caed91..62117de4b404 100644
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

