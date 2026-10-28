Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202303;
	b=almEyZyVQL1ZUErCf72uxaLSmlYAsEz1FMN/+OQWy6tgYL/8YbWfJvvwF4VhyCPxLhTV
	 byHQxF3/KT2cAPmaNXZAdMLrC1Mp3cK7nlf6lZOOdSsPo19ja6gavJr06eRg0657kAckR
	 cOcmMBq+jORsOBDm9pIiJdrYkxUPlauz/iNAo4VtcTmZ5exwF/EcUOhGlCy10IpbcTxO2
	 SGKr+Ior9L9MTAtSgR+RIvwuYoNIKjcpR+JKCF70NGP5T8RltvshdGSDW6Ep9qB2hQjuf
	 DglkB/HKTy1H216hS9HZQAmSj4ZvIUfe12dlRk61rDaCps8DQoiTyhIHZVcmmeGtg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XM0jR06s6rdLGcgQm5ZLC/fvjjLeMmVO4kpVbVF/Sgo=;
	b=aeOVW99FxlfQkyrvD5vuxzoSTFpBUeGuxYUdtCiNnyNaXeii0sr+tJcyuPR4EG0ibpir
	 FpDeFdAasf4c0jL/AHo3snMgmO7DI8S2U9KSqGUItay09P7mr0mQFAy9M9lYbbC7h0Y4w
	 K7p1GnT4IX2K40Xf8Mi0v3tW16YVr35P7ONBg5t+BE1H7TeouYdA2JLMc9vU0a1KcRdJk
	 1BcBObmWB64Gouk/uDXjev3Ex5cURYM9/vdfX3iI6BolWiB5gr3GR3bNtDwPI3FL/0Ihr
	 efBQXB1MvoHlDG9MR8JE+YTXaLZwzm4MbA8i3D0sUVYall1SXTOQvoSd4dx6rz+7+uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChmX3jn8;
	arc=none smtp.remote-ip=209.85.214.193
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50760A3815
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF50760A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChmX3jn8
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2e9cf928dc9so10939835ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202302; x=1793807102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XM0jR06s6rdLGcgQm5ZLC/fvjjLeMmVO4kpVbVF/Sgo=;
        b=ChmX3jn8aWrOBcS1mr7PKJPpUkG1SaXKfsEEP6xe+cdfuYYcizfuHJB507G0InmZBz
         LCLW9593iX7L1/ezsKndruOK6zKNiH4ovQPVxr9g8hXYORydW0Dns9QS8Ck7yG9ZZzDC
         KmG3M1qs9FfeLo022GOWbSpKu75gtzr/Cc/iV0jBBuxEDkbBNz93P4CfJCD3+SpiCblI
         IJJeIR1V6AS2zAHVqUeswelVMbK9hbW1PoBghbUzzPs4V/0OnUqW4sNQyfiq40laMahr
         FGVswzXdig1p2nEuOLnGfmhFJNPhJoyDiubH8DbF6MElWIv9tGYOvGj3DwqJHe7t4QIU
         Wicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202302; x=1793807102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XM0jR06s6rdLGcgQm5ZLC/fvjjLeMmVO4kpVbVF/Sgo=;
        b=R3pqDN6eaT1Do7rGhFfTx5dE/jn23sb95ijubTM1jTTxjPuKNy/A4/CKfIxU3T9QTq
         ZB/bcxves0GBg3A/ZrdjN4KNVzRQXhD09l5mbXwHHBcspU3X15VctlXDJxtppJsV+Ku0
         bPot1laRabkoOBKx2oN7slLJxMqPnk/5Ck5UjeZDO+I+eKk9QNKSlYmrJvxCfNL5DRyL
         0vmrL/sY5mQ7JgVCdDwzNXDqiukNaUjZcdqxRsxrbQkJ2ubqmpNkS9Iz484Wg6Ovo4jO
         TcoFtXs8qbfwSuGsDuCqanzONQ2LNHg9t3C+Gk3sPZje9xeKJOPnLQSfWmZ5yF76/jih
         njlQ==
X-Forwarded-Encrypted: i=1; AKwUvByj2wJlZBfSm1MPy68gaBm3pL+b99x9VAEYxYEOa/MX26cdRBlEU9zSe9Znq0L6HoKqt2WCXZh1npS0uwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3fhMveR81GTJCF++gAmKmBBuD6Zw6tu2+nqV/u+XsVJFkoiJU
	/P73734lYhs901d3r4wHzXbKompfpxmFC84FFF4SHDedn0qOMPs2SPpC
X-Gm-Gg: AYBFou2ZNYIyQfZkJVecIyI8L8MLkPzWVIAsrls7wp+yP+mLy18C6BrEaDdX5SfrRQH
	15l527XvUL10lpnnKtmG6+r46eZFYYKpCtFN0m1zDWw3G3EYncnOA1Re333PxZOYMUMyFsyxlt1
	xbV2Lv0CUO93lebH/PbefAXWYH/xUaKj7zLTIcku+PPm6zRcTyOWB8VxfKIt024L+vROxljzFR+
	SvWyYbUyp7p9rcOqcPQ/TQnfY12+MQxKY66OC8NrVdJwZxFucRzHc7uFiZxhj6shS8UtRzLlxoi
	B7LA0LU0Pq0HJaQvoPpMW5oEVeBsyn/G4zvyeiWkUYfgb6HXXjfx755+emzIJnWVa7gohcR9Ga1
	WntRc0I9rBnPUm1/bYpog6T7o+cJOOmY3IdOzECo8RZiLM/Yu6JgbamCD1e2B+rRSzat5ocZCxW
	isJhkV0c1imJrmRgcAyayCXIFlZO1gq8MHu1OwiSSQjsyiqqVzC5fd3pgKinsi4L/RlEAZ+tC6e
	InZ4D90UKze5+j/8myNhrinhzCaQADCe6OLyePYZmV6nnxBhsCrbv+6X4ImqkOiT4FGFvWlwk0+
	1buBnHnh8n0IXoSD2SSsMVxB5gWSkwsdAl3YvjrXeKrXS9njExjeYng+GdfP06DAb7e6RIYHgS3
	i7n/mbHoKuLml
X-Received: by 2002:a17:903:2446:b0:2ea:238c:4cfd with SMTP id d9443c01a7336-2eae3f4f44bmr37405825ad.25.1793202302121;
        Wed, 28 Oct 2026 08:45:02 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:01 -0700 (PDT)
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
Subject: [PATCH v8 09/15] f2fs: optimize small block size large folio read
Date: Wed, 28 Oct 2026 23:44:00 +0800
Message-ID: <20261028154407.1601430-10-nzzhao.sigma@gmail.com>
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

The original f2fs_read_data_large_folio() implementation has limited
benefit with a 4KB block size, mainly because updating
read_pages_pending greatly increases the number of spinlock
operations.

Use len_blks to batch read_pages_pending and iostat updates for
contiguous mapped blocks.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 46 +++++++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 039916bad57b..d2c9e9d2eb9c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -164,7 +164,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
+		if (f2fs_folio_has_ffs(folio)) {
 			struct f2fs_folio_state *ffs =
 				(struct f2fs_folio_state *)folio->private;
 
@@ -3173,7 +3173,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned nrpages;
+	unsigned nrpages, len_blks;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
 	bool folio_in_bio = false;
@@ -3197,11 +3197,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
-	ffs = NULL;
 	nrpages = folio_nr_pages(folio);
 
-	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
+	for (; nrpages;
+	     nrpages -= len_blks, max_nr_pages -= len_blks,
+	     index += len_blks, offset += len_blks) {
 		sector_t block_nr;
+		unsigned int i;
+
+		len_blks = 1;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3230,13 +3235,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 got_it:
 		if ((map.m_flags & F2FS_MAP_MAPPED)) {
 			block_nr = map.m_pblk + index - map.m_lblk;
-			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
+
+			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
+			len_blks = min_t(unsigned int, len_blks,
+					(unsigned int)(map.m_lblk + map.m_len - index));
+
+			for (i = 0; i < len_blks; i++) {
+				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
+						block_nr + i,
 						DATA_GENERIC_ENHANCE_READ)) {
-				ret = -EFSCORRUPTED;
-				goto err_out;
+					ret = -EFSCORRUPTED;
+					goto err_out;
+				}
 			}
+
 		} else {
 			size_t page_offset = offset << PAGE_SHIFT;
+
 			folio_zero_range(folio, page_offset, PAGE_SIZE);
 			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
 				ret = -EIO;
@@ -3256,9 +3271,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			}
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -3282,17 +3295,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * If the page is under writeback, we need to wait for
 		 * its completion to see the correct decrypted data.
 		 */
-		f2fs_wait_on_block_writeback(inode, block_nr);
+		for (i = 0; i < len_blks; i++)
+			f2fs_wait_on_block_writeback(inode, block_nr + i);
 
-		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
+		if (!bio_add_folio(bio, folio,
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
 				offset << PAGE_SHIFT))
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
-		inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
+		for (i = 0; i < len_blks; i++)
+			inc_cache_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-				F2FS_BLKSIZE(F2FS_I_SB(inode)));
-		last_block_in_bio = block_nr;
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
+		last_block_in_bio = block_nr + len_blks - 1;
 	}
 	trace_f2fs_read_folio(folio, DATA);
 err_out:
-- 
2.43.0

