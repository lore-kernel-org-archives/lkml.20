Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985915;
	b=mdM/EixHcufid8tWIQDscHBvPAJhXwXl4D0loRNpJV0Wx3TtCr1VEJuN/5ByNAtPLOWv
	 cXFFHEUfDzTsTNYHCOoALVlRKCk5N0S0RoVOXO9+LXOav4vvayhCgcz7rOLpPJ34pvK2z
	 iKpGqkU1KgzZFchTsC3y7rv1/kqVMESM+wX0nxEiuOD/kT8eydYi075PQRsylnZriJzYF
	 +OzdnL668aCkkcTPwrleb4/Dc/JCvtNwjIWj2HC76nhFnNltBfMUGH4M0G2x6ttU6u1vy
	 h4GciC6ZoJ5U8MsRRY9OTyDPNvqm9a+Xr3uuMRriXaKgyznTem0UuDPezHIpnm5H+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zIN4tTxZ+23tHq5qE7t7jNQ6CYYlYri1A9S1msEJiBc=;
	b=H/YC83pawMPZDwkpEMVobjY5CfSHNNlPsc8+20xfN6+pl6jq2foL/obLbMPz5LfR3Wou
	 +jJaSXNj7xHTGKFY3RTHSGyMyElBmTIldoeoJAcid7qxvHZTurtGI3UWeRooxqSFiHcOb
	 eECqiUMzmcSHDA6A8Gb0LNgIZwYc8SfXjoso4hd3Z9LLJBvEojpB3jQWuUh0UK/E73KxM
	 dORJrOG/t8f5MIi0vdNofSdKY2+R022j+yTRmvOm2GmO3q3EqO9dGHuLaXRcIQMG+8bfV
	 WiBk5A/aMN+ldnuCfLBrGQstRMMkA7xJLSCusDaj0qFAzOKhhB8QaIPsNRpn0+BpIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AT269o8h;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44019606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44019606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AT269o8h
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso1335233a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985915; x=1793590715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIN4tTxZ+23tHq5qE7t7jNQ6CYYlYri1A9S1msEJiBc=;
        b=AT269o8hy/qXtldqUkuCOtrWhERV9h7zEsuOnMvWKCweh0neOV2/6FKHe1/FQ8d9jy
         rKScG7i38kQzRgjqKiDL30J4Rsi8wtQUV4u2FKG0wCNFpxnMpbqIrtLqbyDhOAh1leq7
         fCZQj0opuG1qnWzKyYM6ZGryQnAIq8p+TcuazJsr2ZcPRv/fLgFsJxTKmuvxPEgvp5UV
         TO/Akord6/Q9HgTelWuYAyv3WCjs0LHEwXwZpPLMiMXOqzEdLe6ga/fv28U7/m3rAGO4
         tC0Q6S/4m4BHQsrKV4RDNA2oUoMGt/FILcY6HtglGDqxbrz3pYSuQYn8sw/NFBEco20m
         QduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985915; x=1793590715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIN4tTxZ+23tHq5qE7t7jNQ6CYYlYri1A9S1msEJiBc=;
        b=qneJo4AqpE4GrmpeO/i2S+H1Hx/5nQ8s20i+aPQqgq2eC6kn0SQwJ3fXl6fzFZqG3H
         DFJSmH+N7GMBzqNZTCBbvrt4fVxu+Azwr+lKtDwY3LgW6usWmNK3rqaGVx3j1aIdnceP
         9H69abMtxGoqyDgQAi+NgDf9aXNYp/zS8wi36HSBdDxqpLYPZnmhv37bLy1Rt5TBSSEy
         c8WvgVkwfSCg7zMr+aS9FXd8A/YHeEr3IXQM7tlhZoRhkiJSPMOYwdCXy/Eokud5fvFK
         a3P43+9YhR/uxNaS+Pp2OJoAHdpVOfqm9SBMBseN30jDE9AOxk/aKcaMn9/Y3VcPt5No
         Ci7A==
X-Forwarded-Encrypted: i=1; AKwUvBz9pEnoMU7Y6ZGsUhtrXCGC6WkH/xhSqisoRH946gborhD7jyuXL6YWxXRqTKWwmJKZkUE1bEMMYP5Fky0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdn7MH1UHxQqoDeYNlAw2qK9G1vdwCLsQAvmGvzfdVa+KlUuLt
	hZKQu4wabHNW6qzyEnonSgi4gtFSDe+DnR5FOQky/FQOXtrE41x+6FBZ
X-Gm-Gg: AYBFou1S1AhEJUhYmMEz5aciju5HfkxkrGgUaYmIyYUqRYaDNBtQpXKYfsAH6Ot2aBS
	g/Y3DkllmEPfOfNKB4LX04zCZwTo3udo/CnvJW3LGNuv/dtM1OxZNRHSH/Ir5wcwNvDIFPQqHwo
	FBwPpH1tagaEvpQUMt3PrmhYBg0UPmesZp1B/YXOgofdBMbMy66u0R7x3Hh3nO2U3Wh79eSYwWm
	g5WLUMCH9CtqSPGzFf4K+KrWFUC7awHqatqlGReAg8phRWabxO8RejMtl3ESXQHrMk9kd/9qdS6
	/BhyyD33GSFIhPOYssCEn0SXf3ArZ0rYKF/4zS/R08SzJRjHQRfSIZwx8g/Ek0nnyG4Ykz0Y57C
	rdbAU0EEoTUpMBXk9smJ3OyyFn1oYzBjTn069VAL5pMP6V75aXslRB8xp1aOKQ7Dlhy9UrraSDX
	s8mgdDFiy9aagVFKkSEZTeE7sATlYPVQoLim4ygQH2GCpSSuHnSSDLVwBWrD3GYMcBI7Huk3Tbm
	G7JVuziomv1Bo92H49xDp0fTyM4Qc8Zw+6zobQCBh5DDFYk3cyewO02qBgun1ilR1iOOBR6nqWp
	OOl+UXfEFni0yowJaVI2ixcu3Am2baZ4SNZDJmxmPmFlgQH/y+NA0kySkYiWUX+spOM=
X-Received: by 2002:a17:90b:4cc4:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ade9b2eeeemr4528363a91.4.1792985914584;
        Sun, 25 Oct 2026 20:38:34 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:34 -0700 (PDT)
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
Subject: [PATCH v7 09/15] f2fs: optimize small block size large folio read
Date: Mon, 26 Oct 2026 11:37:39 +0800
Message-ID: <20261026033745.784107-10-nzzhao.sigma@gmail.com>
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
index b3ada22cb0cb..b805dbe2c187 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -158,7 +158,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
+		if (f2fs_folio_has_ffs(folio)) {
 			struct f2fs_folio_state *ffs =
 				(struct f2fs_folio_state *)folio->private;
 
@@ -3167,7 +3167,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned nrpages;
+	unsigned nrpages, len_blks;
 	struct f2fs_folio_state *ffs;
 	int ret = 0;
 	bool folio_in_bio = false;
@@ -3191,11 +3191,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -3224,13 +3229,23 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -3250,9 +3265,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			}
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -3276,17 +3289,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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

