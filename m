Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AD3AE18C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892650; cv=none; b=k9eN3ak+2I7cp7mzjeQ01d+CIsTAuhW95etCp1S//3ZYiHTnCwEorbRlstaqaVSdELHwWHnTld9g7Qwl985QRTFLvApZABKbktTjIsqShc5AtxadUkoIGu8wNciuSXmezH+x6Uf4UeSF8sZ8AMBsn3D+faCUHASKqnSEXChxVz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892650; c=relaxed/simple;
	bh=yjDFSNlw2CbJjCQXUrOGmttGI2kGAbu8h82qPv9sEWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lt6X6H7TGkUtEznTwyBe1Cdi/F1OtQ3er0DVCHepGTc8dLauFi/ws67HAQpYQt5yI4C7b59h++wRTcMZl28BBIg/WlHULkSFMjKFmA4QR7Gk92mbmPo7VZI9lCm50TTKOrVpYAI1V2U7jvvlLM7dHOUEufv9QVScD01ZSbdkh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOjrsWS2; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOjrsWS2"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so987007a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892646; x=1792497446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZkECa2D/Ld14c/OJR1CbTK/ThR+UM78dn5n+j0wGE0=;
        b=TOjrsWS2f620SHGetwEVl+sZCOmPPH7T6orlc8CYY4RtJF9LZUtW8saBz8/A5xLoPO
         L05xL0XUVRgyf26YAY4K8FtXOQm9AKi4ViTX+RMdZuka69psWHs+s9pNBSiGPiVLo27i
         I83SqfMb59ek/2KQ3eFC0RoATq4TXxFqHgzkz6QAbk+WWrFnptFL60o4nEjQJ0m4iCh/
         1aptVG16ntEZzQoVf2sHLTpCeIXfzEmAJfokBT8DrcplJMRYRgGvYs8nxjIPeWj70M4Y
         dxfsSqCcIWAwnqPSM2iaDwncoAyluum8aN+BNc714G46sW3T0b7M8HUY1E+LzJ2nVLRF
         o4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892646; x=1792497446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZkECa2D/Ld14c/OJR1CbTK/ThR+UM78dn5n+j0wGE0=;
        b=M4N4LXcEd/F6pR+62NJwrZg1hYoJYRbovSdqPXgo44puKYKVkzhcVGccD0DdP17HTr
         aTXaV0s40NarXPRXbUyGDFTeAQEdRob2tQwrmdsqurjz8UurS3NNRkU1LjxUqZHFR5ux
         ZBJ84G1iJUvkUhpDi7TNJxImbZCyUWLmgbzzU6EMzM4oRKH05QYyPzVIxmEGxINQ5lwm
         hrXnI5sUf9EkS+tHe27GQO3I988732W22VeuMCqDC3aoteV/Kc3iyjFoA3edbc0SdHO4
         IUw3k0jEAJqDhespZsjzZXE6fzLEdLwwlbpxAM2rrJLxu2Z8YdA4hmnB2t/fA4glydWA
         xuVQ==
X-Forwarded-Encrypted: i=1; AKwUvByDuzmh4CPt7gXsTeEqULbnfiZyL0n3yjdSiMPWgVPeeOV68rJkfA4uBOitztlpgkifu/bDq556MtgkXTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4YCcbs3pE28QvGQebCDFO/Xrr6ydmJ11JRzfXKepmHpD1Z0zg
	lwXZxkb8zTh8tPOxpwcndBybjZSEEBAC62CS7VLvX9FGIsDim09NONif
X-Gm-Gg: AYBFou29JwvRUJ91GlJweT0rJiAvAoNtXDy8RziQjzqv6oJ7e5Vm7z3ssV+I4F2FhUi
	Zp0ljdhbXEC8arWqaSwz8bSH8O1uTZJcPwQ0QA2h2D6cc0z9O57Jb/Nae4vbDAP2sXVRQTlfCIf
	zMuhCcHco/d8Jodu2Tfk7nggZiOd/kIcX8/2Io2aI0sMu4oeqj1+cym6Xe5R5f4LaZw1IJLxrXl
	V9FgNnMb+Mty4uhLdib/0X/n2pGY+NOYslkkswsZL/Jjv0O8LbRgNlsa0yRtbyqaxHFazokGEey
	/2YyMJ4VgsZMQSNgWFl09WqhYj8VftpvM/AvoCP2jsVUIN7DnmHqMFOP3/Zdjb25ynR5AJQkxQm
	QIuf6XFJF7H8pGvf3Im6FOQbKl+mtFY8FbzODXShfOn6NfKR3/lH2l8hRDhDUgXuVVvX5nmrYNg
	4wxnfUvS2nAcmm7mgA+9roCgCBJYJb0wiQn9GpER0r0xHdcYXfPc58XRKei61gwBdVJ5HWCz0an
	TVLR+NTz9wKIp6ecyQ963ScOfzrRNAhGUzsMr/h62Y6DuI=
X-Received: by 2002:a17:90b:5444:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ab3ad26901mr8688398a91.36.1791892646351;
        Tue, 13 Oct 2026 04:57:26 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:25 -0700 (PDT)
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
Subject: [PATCH v4 12/18] f2fs: support partial uptodate large folio read
Date: Tue, 13 Oct 2026 19:56:15 +0800
Message-ID: <20261013115621.968742-13-nzzhao.sigma@gmail.com>
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

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8b9a4788c..0c4c41871 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		struct folio *folio = fi.folio;
 		unsigned nr_pages = fi.length >> PAGE_SHIFT;
 		bool finished = true;
+		bool uptodate = bio->bi_status == BLK_STS_OK;
 
 		if (!folio_test_large(folio) &&
 		    f2fs_is_compressed_page(folio)) {
@@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
+			if (bio->bi_status == BLK_STS_OK)
+				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
+						fi.offset, fi.length);
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
@@ -172,7 +176,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
 
 		if (finished)
-			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
+			folio_end_read(folio, uptodate);
 	}
 
 	if (ctx)
@@ -3109,6 +3113,57 @@ static bool find_next_valid_block(const struct folio *folio,
 	return false;
 }
 
+static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_bit(ffs->state, end + 1, start);
+}
+
+static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_zero_bit(ffs->state, end + 1, start);
+}
+
+static void f2fs_skip_fully_uptodate_front(struct folio *folio,
+			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
+			unsigned int *max_nr_pages)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, skipped;
+
+	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	next = ffs_next_nonuptodate_subpage(ffs, *offset,
+					    *offset + *nrpages - 1);
+	skipped = next - *offset;
+	if (!skipped)
+		return;
+
+	*index += skipped;
+	*offset += skipped;
+	*nrpages -= skipped;
+	*max_nr_pages -= skipped;
+}
+
+static void f2fs_truncate_read_extent(struct folio *folio, pgoff_t offset,
+				     unsigned int *len_blks)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, end;
+
+	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	end = offset + *len_blks - 1;
+	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
+	if (next <= end)
+		*len_blks = next - offset;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3153,6 +3208,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3185,6 +3245,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(folio, offset, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3203,6 +3264,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				ffs = f2fs_ffs_find_or_alloc(folio);
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
-- 
2.43.0

