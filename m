Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655639;
	b=lSFY+vte+YYFcNFBtR37IzKfSfy46mk5DOQTlWG1djSUJ6yYALsFVRJVwk9t6TJAZw2L
	 U6jwa+i9hSnHMV3WsOBPrFk30DGfB/ZXYUalRChNuh48FjV7WidOmmmyRKeI8zNZx20Zo
	 7z3Ol+h7J5wzKVr9rWkTwLvKILR4jjR9B53u0iO8PK432e0CVavmC+GhEl8P+Cn85mZLp
	 n2Ax6cmIAEuEdTBhuwCtMFI1i/Lkmf5oADTd+xWg5My0c66U6+g80ICYGxUQAvKVln8vL
	 sQGJq5xlt1ni0BR+4QhkBKM7Et9bOtZJgo5D3SPtHTnAOVYvSjqYxbFqbFdvdBFl3yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GEVnZZ8DddKj/sy4jf89cJFuyLfeifXpbq2r0UZ2bBs=;
	b=CqVhGvZZaUTwK38frS9/9zEWZ8Nkk+TmdDELGONX8XYV48IUJGSvhArHbaGL8Fd5YyT6
	 4b9KQrH1qPH45r9X/XRcW3orShVEjgQvQeAOa2lyFlNRQBcaeUUUJf3orqpzs9BCwBUrf
	 xc3C7avMF331cSXXmAygdrTLCg4sLGh9ciYZ2piN1ZMCUuMedr/DzZyRsX9pgSCOM1zO9
	 /UW6e1z/q0qfw1uWXGrNON3f3p+7H+7UqG0mfaWkj7JgmA0WKFofKxbFp6HmQZT/3Bk8+
	 3S2TyX5veKmf2tCVpZxp69stES0f2ywlPWabr47XXo/uFtcgu6lNohdp+ztmP24OpWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RmcgG840;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30F6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RmcgG840
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1125515a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655638; x=1793260438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEVnZZ8DddKj/sy4jf89cJFuyLfeifXpbq2r0UZ2bBs=;
        b=RmcgG8408/JW3U0SrM8b5PAA9dVxrbnGcQ86DW1sSZ37K3NhYDj1tGFzmQHXFkrbrN
         e94GTcJEW2No8RG7ht/oHKIoxn2uENpUQ/vjC+hAqR+qWb8TxGqTP9orJbqfes+uGh/b
         sgu/yhyjW/EMHirUy4DP4c5szbEK8HNqcH2QnVD/MNZabMAPYfKtitw5k1KBq2/9Z1Qk
         ZCiN56XgykCb1tCQOmqWZA5b2HJ4winz4mLrabzy2mtNUABa/1Xs8Okn7z10Hv/OcnQ0
         Rk6OzX7kK1tZMva6jWvhb+FauW/AQcAJ67XUnoLdvb+qJnNOn6agcq6z0PP7jWoXPxtv
         4fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655638; x=1793260438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEVnZZ8DddKj/sy4jf89cJFuyLfeifXpbq2r0UZ2bBs=;
        b=OnykUL9JqHglwiKtq/XI5mTopMxLnwpg9aEGsXXtRT246tUmsz0LEElJvsB6+nhDUx
         J8sB3LhY4IkIyzNl8oioD0kBVMai+eZanNVUci7+6Ot6S5bXgxaDEuAXUyJHlv/1iaQa
         5FQEXSJdtJaWDlP1VbkVb64aXWMNcVKEKUaOaOVPEyJcfxV7tYgc9e5nNs8V4TPJA4pu
         Jmhol3ZVF36Woo6Yt6BlQfSp6oLIS1MZsbZYdER5szo7ms7ImMq52tR7lCVYZufL9ofU
         7clbjpqucxAD3ZqxQ+kXVymXvCtkHieS2SDdsqxTc5VCRTJz1bF2ImNBYsD/zKmharX2
         eyhA==
X-Forwarded-Encrypted: i=1; AKwUvBwrFe/fj9HUPTjOMMbEkIdJ0cmt7BzWPqzOhxvnQ0sEKo3jNEBU54rY3UtTXyw2dwi5QLr2VD7IevINzHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0pw49DARhh5hxBRglO+F62mCp0w8lc6gGYkPbBW22PqkkyuXu
	cMndNqZcoUF4IXRm0nVcPCobZTD7NhehPiLPYfkipsu5pY6GaCef8Xmr
X-Gm-Gg: AYBFou2XTugdpCFptpOvHLiN+m98ISbHlkmNqUUUpg+xJXIvhSQDPucLzIEKUbhX8iG
	W/Cb7KQX6KWGgX6bqSgFeAoZ9i04mqCU/M0x5rIgjV6mpfLJpECVZdj+FOr9HgHoiLcCrWbjnRx
	Y7KbDTsnyqhPXldr0KbuH44bn+7KB/r/NkhzRX4Rmcvg++XlYVZ3EY7sW+UuHYbkm8UlDdjX7US
	c6Y2v8JX8Oqhz4a4PqXwPV0kpSSb1YY3VS+fKXMM5M/su2/yYW6aF6GdruwyZkCg5SI2R44TSSH
	zjnPSwb9AR+QU4e8chYUXbqUCfLN65xbglNdGz+jtb9oZeU+eDWrXl4hGtkuPg5T3Dl66eLWdn7
	W+OVmWtPgSe+ih7EIOoofaX4Cd0HqT4LsJpnWVuP19wBLdA6sIW9qSvFibOT/ezTdIlhjBwREOq
	t+9xNeNZY0oN+OmeIHAN6mEBL0mklfbiY1uUmwu9kAzmHy+7K2jkCYitcxe/ewVgVN5LB4AAF6X
	y0xywuHvFdADKquXBxjqhLp49Ghepjf5Dr2FK1vkcKWIpSiEkvisEG3I4NH76amfUE0XDlff3rc
	u4x41XP72JhSYvlX5g==
X-Received: by 2002:a17:90a:c887:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ad86f36215mr3384688a91.42.1792655637840;
        Thu, 22 Oct 2026 00:53:57 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:53:57 -0700 (PDT)
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
Subject: [PATCH v6 02/15] f2fs: carry subpage offset and count in write IO
Date: Thu, 22 Oct 2026 15:53:29 +0800
Message-ID: <20261022075343.3043003-3-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/gc.c         |  3 ++
 fs/f2fs/inline.c     |  1 +
 fs/f2fs/segment.c    |  3 +-
 7 files changed, 78 insertions(+), 21 deletions(-)

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
index 95212e60f09d..280ea6b72473 100644
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
@@ -3213,7 +3248,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
+	    f2fs_lookup_read_extent_cache_block(inode,
+						F2FS_FIO_LBLK(fio),
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
@@ -3232,7 +3268,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
 
-	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, F2FS_FIO_LBLK(fio),
+				     LOOKUP_NODE);
 	if (err)
 		goto out;
 
@@ -3335,6 +3372,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
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
index 5b948c92f981..485c01b6756b 100644
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
@@ -1550,6 +1552,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
 			.folio = folio,
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

