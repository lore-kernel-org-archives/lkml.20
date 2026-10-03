Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27914388396
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061725; cv=none; b=olGoPfIm8RvzhnbuJ+/gsAOCLrm1EuTl3TGybqmXaMhii2iKCgQHo7FmKnmZZhonCk4sOrRazMnG+K/23L3gAhZnuPzamU6OENEuKNttUeC7Rih80fRqXEoghnvdxNiCd3H57VkJDo9MzYu6veKOvckhJf+1D1cJasAz0nj78ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061725; c=relaxed/simple;
	bh=Gd6F6ON3yGTMjzqcwtixnePOI3psQQHWcRSQ9XoLHxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwFIMBgctq/aQLQstvlymFqFfqjMxtRmgyW+/dRfPNR2lIg46NNJvQKZdM+UIK3CUylPAGKm7dJkNFdtPExX5T9y5qF5vuaEv1mCJIdUVOmj+tiCRUIZGgdVFu8u8ZkWfUEefDDTw/3uqmzSv9HY026q/hnwNzHWagSVy7nk2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY1PEWTq; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY1PEWTq"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-8ac8a2ac52bso3370467b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791061722; x=1791666522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WdQn6f6AsaloNtXz63r2rYU9L2euT0e0WgByXQq7Q8=;
        b=jY1PEWTqw9HDqK+uRlYaiYtppZCPqwjURiRzNDEimxIUzgiudn5l8EitHNBuJw0+lA
         E6GdZtHLFpj22FpS0kUxG1+xzZM3BgREo8CDcyFj8QKX9g8X6eQcTW9aCTjFrKPQc81R
         9kWqlIafKDgMLqCMlr14FxeVQUwkeljLG+toW2oqHVLxHEpGd+/+V5vemIulgRUkzeHw
         unQGAAQauoFzUVoVSh0BNZ2hbRoYLdQFutAmhJPYlZQvOgSAPhWMM/s2yogNgzpE+jb0
         Zhul/akzXQwFQYphawNDVTAB7xw95Z5e4F37nt5Glh2TWlGf1LsidN1QQHJ1iQd++uXj
         gekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791061722; x=1791666522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WdQn6f6AsaloNtXz63r2rYU9L2euT0e0WgByXQq7Q8=;
        b=LdcAqbNVVR7JFB995ecYXhJQCM/a/RZ5mj1j44p4j8n4HA/2pIYeioXhdNkG+p7I2H
         160tjSolWGw2U0l+wLlbp7Hud3P0Po2CGrxfacpkX7L7p52jFDfRWX4KmsTg3S5imnzn
         8gi7FlMrppSItLRTNu+p+QLNskhZC+gVqIk9hwPjfTW+3jtNyssiHs4g9HRmITohH3bC
         HxlJYJW+Mz3PTRCSaWI1yuTDEi96nr9NpSjDPuQifIQrEuQb944kCRwuMyKI3qx+vv5Q
         y+akbmAd8ljaAN1ajRJdgxkG14a1Zegyz4y10hIUqkdf/RGzdDwVyACT8llnTFzXO53t
         iz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeTm8b0rntgMbkRfkmAgxEYE1rGSQILfETjv1SZcQe0MRdDzj9uowc/FO9cqJdFnxO0s+HnnrZj6qzESA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaeJAH8Vs+QV80dXWVPgaWGGFLxXmceVKpHlQIEUT9j/K0lvbr
	4GJbawjqcasqw+Pc7e5m0Y9jxu6q8dzyZ7KsRgQrDTBmTswI0LKAjj8=
X-Gm-Gg: AYBFou31YHXQwIE/B+2j7jTIBwdR5fVV8ia+oNrb3OIuW+ozim8jbcjze+tBeshyUAT
	XvsNXYz+mciagxJ1h5DDWNLaAd3UnCCYca4rerHbpmV40G1JI3XHfdDBZhn3AQzOStO104+J/jp
	WxvClX8kTRWPklzleDXxkEm7hDS4rh87VB3ZYcqx6thl3iL3UXh2X5Ke8/5QYG54d9lOLjTGESr
	qGYa/rtObgOpS9/7UhJuyUcT5FlsW8VEU/nyxu/LHDXIv4ZbeobGvugO1ud6PcOGhYPTrlgwnTD
	h1OIakB+6zPrrWYxv412xVqoue8RFvMdaHJVh8U4T0QE+YhbdbMH8fdra6waX3D0Q2XEzj8zcYi
	lytS3xtf4rikzdoT+tulL7t3PMp7IwQuLxGpLEP4z3CK1AsIyzttkrfgdBwGKKt5cp5KnYjDZ+d
	LPepCkCm0oV0r4hvRRXwLH41JEsu/c94h0JZighvILlQCxj3SsD+KwRXBi2DHcA6I+6xND8lb33
	Ve28eLREaEqTo60a+XpRHrq98NawMxEB1eCmg/IrI37G8iAQcaVZWVmPEXO81hIaSed09jl1Ir7
	5Q9MqLfgIsqJmk33Hv3T9Zf71QCGA8DMHg==
X-Received: by 2002:a05:690c:3181:b0:8ae:98ce:5497 with SMTP id 00721157ae682-8ae98ce7efemr12330927b3.0.1791061722002;
        Sat, 03 Oct 2026 14:08:42 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:550f:9551:5468:60f1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af0d179d3bsm743537b3.40.2026.10.03.14.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:08:41 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sat, 03 Oct 2026 14:08:01 -0700
Subject: [RFC PATCH v3 8/9] mm/damon/core: cap the region merge threshold
 per target
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-8-0f00417b41bc@gmail.com>
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
In-Reply-To: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-0-0f00417b41bc@gmail.com>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, 
 Wei Xu <weixugc@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
 Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
 Kunwu Chan <kunwu.chan@linux.dev>, 
 Ravi Jonnalagadda <ravis.opensrc@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0

kdamond_merge_regions() applies one context-wide threshold, the highest
merge score across all targets divided by 10, to every target.  When a
high-traffic target and a low-traffic target share a context, the
high-traffic target sets a threshold permissive enough to erase the
hot/cold boundary in the low-traffic one: a region with nr_accesses=1
next to one with nr_accesses=0 merges because 1 <= threshold, even though
that difference is the only signal the cold scheme has to admit it.

On the regular merge pass, cap the threshold for each target by a tenth of
that target's own maximum merge score.  The score is the one
damon_merge_regions_of() compares, so a probe-weighted context is capped
by its weighted hit sums rather than by nr_accesses, which stays near zero
when access checks are off.

The passes that follow the regular one exist only to bring the region
count under max_nr_regions by escalating the threshold.  They keep using
the escalated threshold uncapped, so that bound still holds.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 1d25f820e3f9..c2c74d0daf95 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -4175,12 +4175,36 @@ static noinline_for_stack void kdamond_merge_regions(struct damon_ctx *c,
 	unsigned int nr_regions;
 	unsigned int max_thres;
 	bool count_age = true;
+	bool use_probe_hits = damon_has_probe_weights(c);
 
 	max_thres = damon_nr_samples_per_aggr(&c->attrs);
 	while (true) {
 		nr_regions = 0;
 		damon_for_each_target(t, c) {
-			damon_merge_regions_of(t, threshold, sz_limit, c,
+			struct damon_region *r;
+			unsigned int t_max = 0, t_thres = threshold;
+
+			/*
+			 * On the regular pass, cap the threshold by this
+			 * target's own maximum merge score.  A high-traffic
+			 * target in the same context must not set a threshold so
+			 * permissive that a low-traffic target's hot/cold
+			 * boundary merges away before the cold scheme can act on
+			 * it.  The score is the one damon_merge_regions_of()
+			 * compares, so probe-weighted contexts are capped by
+			 * their weighted hit sums rather than by nr_accesses.
+			 *
+			 * The passes that follow exist only to bring the region
+			 * count under max_nr_regions, so they use the escalated
+			 * threshold as is.
+			 */
+			if (count_age) {
+				damon_for_each_region(r, t)
+					t_max = max(t_max, damon_merge_score(r,
+							false, c, use_probe_hits));
+				t_thres = min(threshold, t_max / 10);
+			}
+			damon_merge_regions_of(t, t_thres, sz_limit, c,
 					count_age);
 			nr_regions += damon_nr_regions(t);
 		}

-- 
Git-157)

