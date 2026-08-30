Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3729BD9A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064192; cv=none; b=OLyEAQ3n9NnNoINVDc6Uff37y6dfJSz0+XAYzU4yIkPQ2wnQLYDIBgULAsjKb/pcMJUw+ZxpaBUeHCMbQgyvNowHK01xTnK/i8NlBffyyUkZWgq60KMX+tijWZYKpL6CF0E+ZpKsQyDoDWdFo2qJeszbQllrEa/g7EXk6BOrbDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064192; c=relaxed/simple;
	bh=jlsMADLwJ/8YxSz9rHL6HMJ91PlPCeP88izjFdx/g98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPYSs3C8Ck34Xmit4kFHhAVSkEABGc0E8CFjRbYT6Tz8vCzULdDhwPZhNGSMp/1nZNXpPXH2dICDcDr1yAZBboNlNGc0I2Qg3yWxLT2m9UqzkpIeKzGBsgxkvCLF2CuPx+eRJs7NUpzPnssae2Ks2AXVVWxBTjDISbwaW5piZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpbJopTz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpbJopTz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so431977a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788064190; x=1788668990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIo/hskvY35I+xlwCnjLbjXGmC9TvGJPu5fGHiHuA6o=;
        b=mpbJopTz2shr256SUkJKWCQdm9lOEfGY945rK4iIzon94pyGIhVrnIOqPkwgJhnUP2
         dbypGfwEkK7zPUNt3mioR6C+IX/r+eaPEKZgBPGTUCLOnBkEXLSrXV92isi4HWFsVo0K
         Zkll0fwfSiKia8d1fJzZg3ulaF6qpzMWzi8Jucr7T9pKSyPILIC2rR0E/0iKoj8Ctwb6
         or4m9wiiWepxRxbRUJkoXeSyNexWayThA0K7bKupVSFY/lI6MM1NCBu5CBaFjMmlbUYR
         Dnylv3hkUwyvjpdZnDhsqN7+kQMn6BDYzE7h3nL7Z+i/Z9p2PtqTsdlS1375k9N5ArBx
         d8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064190; x=1788668990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIo/hskvY35I+xlwCnjLbjXGmC9TvGJPu5fGHiHuA6o=;
        b=hjxfQ+mRuB6Ll5bEnx9nvW+0lUD5F4padXGNz65+WOrqA1/7djQon1e38XhK50Crbb
         a4h9WMc2N6FU9uYp4kufl9fOe7ySJgAzXMUry6KkIsQtjoCFQ/aT3WacgBSheXlUaOq5
         DeLWF2vrZ0kprR9y5ui542OPM3fNfAuR4pkoBVhmSmvHPvLqz+DkPqVjj/LT1bIg1atu
         edVRmVhP5mxTaKoktvPTnosCFwa6pxvtfO5+ntA33t+1BsiZDXDRLX12j1a9CqOizvLP
         eT6PSjoD/HV+Q8X9LEvCXr8pLlSnqD7WVkg/7pBJ7NzTJzcXSbZZozeFEon5RrrxvTVo
         FTcA==
X-Gm-Message-State: AFuF++lnr/ntgf8/hfr9wKM2LL8jB1S6WH+G53YBK0umEn9oQyJ91WHD
	6IRiFWyag/D8HzH/K2/pgJbxnE3kdaDawwPvLqam1OfbpG1VO+D1iZDf
X-Gm-Gg: AYBFou1j4WjYe4IG+QDEQmm2VIz9jCq0YEE/+lg/SfHifg9BMOWYUXvF78lhi3AXv6T
	FfolgB5rPPYBP/COqlAetyRIc20mW+z4uVz7JfmpDr9AUOeAgD+ownFV1txCljPbPdOH47M501p
	9MQpKSCwMtitNhaOz0fo11QJlku7Sz3UemEaUxDs9oC0IrRaOUqJbHzE1QSPC9iHFQHA+PMHuKp
	FVA/hspquP2HY74PZdsiB4KS1x+pECMzcMdl4ZUPZzVk3pkJ2DhFEvzjhEZEBsWzdWXNxipx3KW
	x7M5VNsykfSfyfusHYz9KB+MPiPs6SwEBpd0r02apRNkWXPQJiu+vjEb+1K7eUP86GXLBn0Jy2H
	iEC3rcGAGRgq5Clk/fi9m4H+qV8Szwn5bGaPDcnGvrQeafcCmaKdfe4MGP5dOADMUxqdxcJagAS
	bGraUc/9ivRS+Zia1JXSRmTYB01b1COnZO2j37hOt2bw33J3Adzc/2zNCSVcFX26gZtRz4yWron
	5BIgIhbQF6ZSb02UsxOhs9a6DrnM/EfMwEn+ApKo+mkroTVC5Eg
X-Received: by 2002:a17:903:1106:b0:2d7:1a3f:8db5 with SMTP id d9443c01a7336-2d74e0c729bmr155654705ad.4.1788064190386;
        Sat, 29 Aug 2026 21:29:50 -0700 (PDT)
Received: from o6.lan ([188.253.112.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8f98d46casm7493535ad.83.2026.08.29.21.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:29:50 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	zhaonanzhe@xiaomi.com,
	baohua@kernel.org,
	hannes@cmpxchg.org,
	ryncsn@gmail.com,
	youngjun.park@lge.com,
	baolin.wang@linux.alibaba.com,
	hughd@google.com,
	chrisl@kernel.org,
	shikemeng@huaweicloud.com,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	david@kernel.org,
	ljs@kernel.org,
	xueyuan.chen21@gmail.com
Subject: [PATCH v7 4/4] mm/shmem: split large folios only on -E2BIG
Date: Sun, 30 Aug 2026 12:29:20 +0800
Message-ID: <20260830042920.2280454-5-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
References: <20260830042920.2280454-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shmem_writeout() currently splits a large folio on every
folio_alloc_swap() failure. With the refined return-value contract, only
-E2BIG indicates that splitting might allow smaller folios to be swapped
out.

Enter the split fallback only for -E2BIG. For -ENOSPC and -ENOMEM,
redirty and reactivate the folio as before.

Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 mm/shmem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 6641823bed16..eff38bb33d8a 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1608,7 +1608,7 @@ int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
 	pgoff_t index;
-	int nr_pages;
+	int nr_pages, ret;
 	bool split = false;
 
 	if ((info->flags & SHMEM_F_LOCKED) || sbinfo->noswap)
@@ -1689,7 +1689,8 @@ int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
 		folio_mark_uptodate(folio);
 	}
 
-	if (!folio_alloc_swap(folio)) {
+	ret = folio_alloc_swap(folio);
+	if (!ret) {
 		bool first_swapped = shmem_recalc_inode(inode, 0, nr_pages);
 		int error;
 
@@ -1742,7 +1743,7 @@ int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
 		swap_cache_del_folio(folio);
 		goto redirty;
 	}
-	if (nr_pages > 1)
+	if (nr_pages > 1 && ret == -E2BIG)
 		goto try_split;
 redirty:
 	folio_mark_dirty(folio);
-- 
2.47.3

