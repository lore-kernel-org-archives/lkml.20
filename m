Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FA3ED3CC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338692; cv=none; b=Mg1BhFsvnGCVea8uOxxt9t3+3d6xYx1aAquQHhXrNjqImsmwixNIew28mWKZc4+0OjYhLGcgwlUJDsVRfF0cjqgranipNAQ4xW2abtrmr/xo2bJZyK5XZmImpELrczTdQGTukdfto8V3VAJN4Uz1QATZWb7/kbzbIyl0mX7RDQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338692; c=relaxed/simple;
	bh=W9gAYG0X9XJxEJUSM37YRKmyz4ctudzKtZ3GvTGFjQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2Pc0JNJB/g8S/CvpdTaHJI6J2GjKcsABs+ap3oM4mtbVh2QjkrfwraW8nqun23VIiT8A1e9rthWnmmRIjN1ZcM3zmQE56gEy9MaBhsYqOCoRg+Pm4PkHZ28wIXTby5FVNTgU0zgEDO/fyr1f0Mmb8bCGOFMxaqBTJAtugYv2hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0l1jqUv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0l1jqUv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1147413b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338687; x=1788943487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uexc1NDi5NdMn1KWK0fKne2QitDNcH/zJBrubqnXvz0=;
        b=m0l1jqUv1IPswz77SST8oCqywRkd/wNCYOxbmeEW9vtCDGHxvqEGd45S/K7T11kZiW
         S9OSrSx4z+CPZleoo/hxOzDqvqLHVRux+cCZu+sF1fD2azNLQPVV7UFltBXP6SrB2H96
         TgrDHzNy+9vUbqxROvIxJneftfVvO1aW01t5NKNjei4UugAzAezhssHY+uIpgp/FHUH2
         TSiYs8FPk+rb6b+rrmckeePdsXAqPOcLLg9mKGMo2lhIkwLFBb4pwPH91ykAZTsM01Sr
         bP3O24dNyMYoHO65x4l78bz5fZGWwRbdNfGmZGdEp+90SaRvRogmhzW4kHzn9cW2AZfY
         qX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338687; x=1788943487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uexc1NDi5NdMn1KWK0fKne2QitDNcH/zJBrubqnXvz0=;
        b=snR5H82PdcuT3otthMmE+kZxvtNKHy0RYD6MKr8su8a3lPsjSM5JQUHBFeSiduUXcl
         pmQ2o0GoCI+MSQojhzmH4YQ1E77pDsV2ZRVhgKiX+CdNnq+4Drb+UnGVQLBJXPWCwx6s
         opASJt91Uxo5eZCryC+wSHmkM04HF7nffcYS+OrrVma6bv39uclJe9VBnl/Lnf1JcSQ4
         5rGxmYjGVKYnSXohmVTb92OP8o0eKN/k5nWzhQ7mITlQ86O55qzsKfRmlYGKfmVizyij
         SUuMIKjoQ42WtjQIT5SBwdbu2MB4IF3VocEiBp/hC48FG/DYEOQt7aZmW9fEtAYtSQe+
         v4Lw==
X-Forwarded-Encrypted: i=1; AKwUvBypqghLg2m3uI9SyhQeqejC3qugTOPFESCI5igQIjI1ely7ZIzP5lPYkUy+nwHo4E6IEIlsiMeQAQ3yf9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nIfYBGQ2Q3RknDa0LOLiz2+VSE/zeADjD4txZ5IYZ90FTqbSa2
	k6yGxoqVT83GFxBM7J4YWbQnic1Ao760HtFEXApe7IebQgShwaKec+Ju
X-Gm-Gg: AYBFou09dPRoXY4hFVcCXT2eD9+baen9eADwNDfXs1pBySFgdolPPL/2gAQvIK8Wvs9
	5e3WaFWYdB4aai91ydAH0JpABrQs9wDFKGsW0KWToLngvSg/YiNdNGmatlnTxJAdZ0wWYpiol0s
	oPicMUSeg3u7gAqH8ZASgqkIhmWnRNcHfKeIzriqID3YfC/g7n6lVzhyzxUvFC1UtmwD08Wwam+
	tXIGxy4qtcq8jGpzNwTygqUg8q39Lbby7EQFSwki1QgVgkryevWc99z8FFLY/9RbuU2SeUYV0pa
	u4+p6sB85JSy0TCicTtsGkNg3QSC54Lfr3YiMKff6YjSB7nvgQX3tJXj6pFNmFT6GIGPLRTB4UC
	fOfufv9CnCMfErkZ8BOUqiMTQAhBqtxTVIuSdjTex/pHrW+hgYTASzx1UC/piAdxs7H7fLBvW/p
	/YGiqFNdJwfZnAteYMzBfGK2VifxrWiW/nOm9ChjunUs/i0c07DkKT75aNlaz6GpxgI+QB5LSNG
	zNa8yV9ZJDCwNZq
X-Received: by 2002:a05:6a00:124b:b0:857:726d:2709 with SMTP id d2e1a72fcca58-85ed3f6e6e8mr5014011b3a.21.1788338686927;
        Wed, 02 Sep 2026 01:44:46 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db29deb9fsm1047430b3a.16.2026.09.02.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:46 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Wed,  2 Sep 2026 16:44:45 +0800
Message-ID: <20260902084445.27170-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting goal_tuner to 'temporal', if the goal is achieved,
quota->esz_bp will be set to zero.  In this case, damos_quota_is_full()
will always return true, even if no regions have been tried to apply at
all.  This causes qt_exceeds to increase unexpectedly.

Fix it by:

- Returning false in damos_quota_is_full() when quota->charged_sz is
  zero.
- Adding an early exit in damon_do_apply_schemes() for schemes with zero
  esz.

Fixes: c7ec7d5f6b3d ("mm/damon/core: handle <min_region_sz remaining quota as empty")
Cc: <stable@vger.kernel.org> # v7.2.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v2:
- v2: https://lore.kernel.org/damon/20260902081825.18931-1-aethernet65535@gmail.com
- Changed patch title, v2 title is truncated.

Changes from v1:
- v1: https://lore.kernel.org/damon/20260901105925.106186-1-aethernet65535@gmail.com
- Changed the check in damos_quota_is_full() from '!quota->esz' to
  '!quota->charged_sz', because the former is an upper bound, while the
  latter represents the actual quota usage.
- Added an early exit in damon_do_apply_schemes() to prevent a scheme
  with zero esz from being evaluated by damos_quota_is_full().
- Changed patch title, original title: always return false when esz is
  zero

---
 mm/damon/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 8e3ded1a2cf6..de78ad56c8b3 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2560,6 +2560,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
 {
 	if (!damos_quota_is_set(quota))
 		return false;
+	if (!quota->charged_sz)
+		return false;
 	if (quota->charged_sz >= quota->esz)
 		return true;
 	/*
@@ -2666,6 +2668,9 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 		if (!s->wmarks.activated)
 			continue;
 
+		if (!quota->esz)
+			continue;
+
 		/* Check the quota */
 		if (damos_quota_is_full(quota, c->min_region_sz))
 			continue;
-- 
2.55.0

