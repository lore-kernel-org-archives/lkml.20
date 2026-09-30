Received: from mail-dy2-f29.google.com (mail-dy2-f29.google.com [74.125.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2244BCAE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752314; cv=none; b=jY7CoR20GP7/aKsGLpHMATdtn+rUs49RdbccGBvQK+SgPBmQnXLE2VD7o9JXr8E8yRjjGmctENMqGYbj8FWMK/FSpqg9ZfI/H6nSrjQMpksI0aOUT0pe3/YGTrDIDKE4w51iurjHzNM/lnAv//vle5DyicJmeNOLHg3TPOFn5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752314; c=relaxed/simple;
	bh=c83hvjKXXoWrv71LfaNlDth53hjN+oY7ccKoynNwTFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcKRAdXhyvyL9BahxBOxOcLMNBmemgc/NLPhqwnXYi2OtAS+/dcyq7HU25KVh1t2FkEPTzVN5OcL37kv7A2eOjA4nO2jo6eRJ6UHL6GwBrCADM4kSLTCC71se84TtkFM3T3DZ1u+dylkbXY6rcdZaq4EyAGSfhYQS5DPyZ7BFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tu4Z+mpA; arc=none smtp.client-ip=74.125.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tu4Z+mpA"
Received: by mail-dy2-f29.google.com with SMTP id 5a478bee46e88-34b48100af4so1216098eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752312; x=1791357112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vc/q1PXQqj7qHy6KQYAqVAJ0Bd7pZvYeGhGOCctp1E8=;
        b=Tu4Z+mpA+gMurznSCMokvJ+AX9U66bOd1f79y1WIetHKtHJWdXreQfh+98JhW3p/do
         7QdgXNoAA2EtIZjQUsa0/flej595E0SE8yOfvRw4FCEM5XuxsdgmFvvuZ48Oa9L5EGWg
         jsL/1Y4EJDrPTQbmPf6uyAvSevXyVk4X3FlNPohDsIgvkNspIdPlxC1aZG3Lsswe3RBg
         FGanbxYOVgX2wZDOfXh/jMWnik+VBxdwr1YPH4lcqf78Lcxl2HMyYWL1syMSvyeZQZ+H
         v3s5HZV6Dj39rnBdZWcug4KtibNU128ZottTh+qD0Oras7hi1SSVbmDcNrzxcfXSD3wn
         OdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752312; x=1791357112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc/q1PXQqj7qHy6KQYAqVAJ0Bd7pZvYeGhGOCctp1E8=;
        b=tMYBjFcrzXEe955NYsV5cHyAiDTVWn936MsIR59Rgn4QaqDgLGYVa25u8jvPLxYYFa
         QWyE7/ENRdbijkXTbQbRbnoO+0JcMRZLSUNMfG3oelHo7ShNULwmBCdXLs+SVngslDMD
         Dy2lvmagdwEk5sPRnGDiLGxrM56Zp1Uy/Yp8fQCaw+9QaN6oYiHIM/+NJm8llUCwyJP+
         HJPbdIPUkPgv9UEOeH3/ALW2Nols90o0pT8K+C7joTD6IlHu4lvvY21aVTEJHY1dRYzk
         Ouaq86vI+uWRZjaPMrFvIzfpafkWjgxvthopmAI9Q+4ctQEjZLFGxnd2OFZzA3bTQOoD
         aDJg==
X-Forwarded-Encrypted: i=1; AKwUvBwxN5snTvDiB7toSd05rEImUVHHIhzdRxEErdFXn0OfH4WoV22JRj2eQJvjU5272vaA4Q3K5V3+ReSwbDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/gVITZFUZQlBQ8GEXPRZf4mO+WMm5W1DD1R/gaTDhWIPzL2ss
	n2jeW/H1MPQGXdHa9Ls+MIr0wIMpNsx8lJh6P4Gwa8HEVWgsncVGLflFpUd7btwc
X-Gm-Gg: AYBFou1DI/HVH7K+bs/5AeG/VGPy8bJ4U6K0iCCE2fXiZXpsZ5/o5wlzC+65WxBHx8f
	/ED4nbjKKM65Bi0w4DHnCALKnuam4ja0Oqc6JmB+5jph8U+ELRVVi07IZPIzvKKYlzZFhBbDOFI
	toUJIQ3jOuNWsulvDuV7ApHFYKnkN3qhgmG1LnMewX6no9DM3CWRFy9h+WGgYDuosUn9Mip2d8G
	5xB0/A3VUIsGmlW7YZlK7IUJoKGMF8eWdNf/Gq4fKQwx9o9xNqgHwBbMFc07zF5FqGp23plO3Ky
	/CkY4ZwIWzBm5qY5dFB3FWNv2C8rIvyIVZZEY5puPT92Rr754Z11Ig0GRwaeUNIqAAfao+FC5j8
	NfeqJm8+ylnV6y95pDuOaeR/Mdg71LdMsveMyRXNhTHr13HnecHsH+8oAU5gpN0RA3OVJAIqXzg
	WqxmCneonSZ8LhXBdHZeDS5qjoQ4v0a7PtLPRf+YgLIV1IP3pN/K/D5ro8/SJtkFrwFg==
X-Received: by 2002:a05:693c:80d0:b0:33b:c758:74e9 with SMTP id 5a478bee46e88-34cd8f78b2cmr902659eec.4.1790752311818;
        Wed, 30 Sep 2026 00:11:51 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5b4349bsm1621837eec.25.2026.09.30.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:11:51 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Wed, 30 Sep 2026 15:11:38 +0800
Subject: [PATCH v3 2/2] ext4: remove unused locked_ei parameter from
 __es_shrink()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-fix-ext4-es-scan-nr-scanned-v3-2-9aef0be87d21@gmail.com>
References: <20260930-fix-ext4-es-scan-nr-scanned-v3-0-9aef0be87d21@gmail.com>
In-Reply-To: <20260930-fix-ext4-es-scan-nr-scanned-v3-0-9aef0be87d21@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, 
 Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>, 
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

__es_shrink()'s locked_ei parameter exists to let a caller pass in an
inode it already holds i_es_lock on, so the shrinker walk can skip
that inode instead of deadlocking on write_trylock(), and fall back
to reclaiming from it directly if nothing else could be freed. Its
only caller, ext4_es_scan(), always passes NULL.

Drop the parameter along with the two code paths that exist solely to
support it: the ei == locked_ei skip check, and the trailing
es_reclaim_extents(locked_ei, ...) fallback, neither of which can ever
run while locked_ei is always NULL.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 fs/ext4/extents_status.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index d88af807d36e7..efbccb29d5fd1 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -183,8 +183,7 @@ static int __es_remove_extent(struct inode *inode, ext4_lblk_t lblk,
 			      int *reserved, struct extent_status *res,
 			      struct extent_status *prealloc);
 static int es_reclaim_extents(struct ext4_inode_info *ei, int *nr_to_scan);
-static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
-		       struct ext4_inode_info *locked_ei);
+static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan);
 static int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
 			    ext4_lblk_t len,
 			    struct pending_reservation **prealloc);
@@ -1669,8 +1668,7 @@ void ext4_es_remove_extent(struct inode *inode, ext4_lblk_t lblk,
 	ext4_da_release_space(inode, reserved);
 }
 
-static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
-		       struct ext4_inode_info *locked_ei)
+static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan)
 {
 	struct ext4_inode_info *ei;
 	struct ext4_es_stats *es_stats;
@@ -1706,7 +1704,7 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 			continue;
 		}
 
-		if (ei == locked_ei || !write_trylock(&ei->i_es_lock)) {
+		if (!write_trylock(&ei->i_es_lock)) {
 			nr_skipped++;
 			continue;
 		}
@@ -1734,9 +1732,6 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 		goto retry;
 	}
 
-	if (locked_ei && nr_shrunk == 0)
-		nr_shrunk = es_reclaim_extents(locked_ei, &nr_to_scan);
-
 out:
 	scan_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
 	if (likely(es_stats->es_stats_scan_time))
@@ -1779,7 +1774,7 @@ static unsigned long ext4_es_scan(struct shrinker *shrink,
 	ret = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
 	trace_ext4_es_shrink_scan_enter(sbi->s_sb, nr_to_scan, ret);
 
-	nr_shrunk = __es_shrink(sbi, nr_to_scan, NULL);
+	nr_shrunk = __es_shrink(sbi, nr_to_scan);
 
 	ret = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
 	trace_ext4_es_shrink_scan_exit(sbi->s_sb, nr_shrunk, ret);

-- 
2.43.0

