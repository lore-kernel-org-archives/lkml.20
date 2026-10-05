Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE24189B9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190037; cv=none; b=PewwGjTey8/cOYErFN8nOAD4T3nLvSPB6UVgUuT6FjUoZHuis/gloHW4zPUk2qZL34KGXwi2XMX7hAyVuX51uvzaMVZCbMXaQobAxT2v5AiPEjDdDs+kZHTRAAgtCSYNxJSgFp0UNgJ4bX9UFG6HVNVx1QLXtSJUzqAJyCWpGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190037; c=relaxed/simple;
	bh=hlWXkLzfFKbZ3Rje739fg5OrVaMmBszukle3NRqBO/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZoljZayfiUuLBj/bU+EVM0ZxhEE1YHsRmQUT7v83CmY2X5N47xUu2auG5HEZOMzH6UVezQPTNn6+VNaitmaSQnjnt9C9rLOfJEa+a8EQMzF+duFKZ2SY/tUqW6WNVl++sv93Ok4JjQD2w0WY9WtveMpKDTeb1viQnkle/rFs0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6InATez; arc=none smtp.client-ip=74.125.224.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6InATez"
Received: by mail-yx2-f8.google.com with SMTP id 956f58d0204a3-66d0f3138aeso475000d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190033; x=1791794833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lOJYATF5GzgxnR6rvCgXN1lfrW7Tn1J/cuI+kptyHw=;
        b=E6InATez3rTQNrTokb/g0seormlbBU24rLuI4cPTdhkz5yfXVLxW1MynaFp+piqO6H
         6MFVDkDXoKHUA3+V5GRRFETjbUqsPGomQgpIkt5k3X3m8Iy+V3jfhLt1gqhB60ZjDvxv
         oH4JXLtSGKsOUEksytUUW/pOHfBc94Qozu5s7S9/evxDOySUuWmPwReIF8CwMT/bCmJY
         Xj3zVRYHeAuDYjf1lTrrKbdgRtMHfkSy185y0Pu9TBbfqfF5feny02UXLFBjWjuCXD9Y
         no57tVP6B/m5iHUNDZziUsweWSloXkKSXndniseG6nH2P4aj+VUL0JCCk2e32Ex6WVbI
         bk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190033; x=1791794833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lOJYATF5GzgxnR6rvCgXN1lfrW7Tn1J/cuI+kptyHw=;
        b=LmAhPnp0tTjNW35ylgKc4eQ5+S0uaKrL+HOjVBQnx9RCQA2KrKAjmSr2Yrvp4pPz+N
         xifs0QbZH8kQD2Iul1cev0nwH62Zsah6ve/FFCnhXG+/mpG9qmGoF80RLgApZPXlCY45
         e2/RshQXE7yYjQW2B34vJlp5umrEX7Fcx1d8QMLlcT0BuvqDfpaZbiIiPa8Pazbod1hS
         0igaHRFxZpV+nUr1HUX91wUKHnro9Nuoh+yJXaDecd6uadlss+KwAeatz7byzHSIaO+l
         WUPmPMTUdCGBO/up5HdFbQOiCQ4nTtOpgaJKfXQ54oPCYVSUUxtLOPdoFi3NLPPZpzaf
         9hJA==
X-Forwarded-Encrypted: i=1; AKwUvBxTrFRWPEJix3hJZw6jRQHBHc53EXy859Erl8v4nUzq9WCuBwrH/jqMcv4oHcdBWV0PbxXXH+UybYMpVEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYOYAjSBnW5wLUkR50j/hJ8F0jxvztoAkBxbfI3XIs4I8pG7Vf
	JwboyDpeaz8bNVzPz/94uJZt7/DRRUq/ux9Cg1lHwIhLg7sq4V7mOJY=
X-Gm-Gg: AYBFou17po8znHkWXwGa3tocBBwQPEGZqnNjp2CIpIwsOP/nOd5yfNkSfF4KCwWKB8N
	gAceIJYPt5IeTZTSyRGN4DSOR1gcizFapYebcAl02czsIBxkm0EzjWm1eyK1VfGaM8FHro0EOWs
	HlYmHb3uX7k8l7xacF1++btklLo4HEznl+f5UkxffG5VrffCAHmBz0hE2cpnkLYhlyzgpCmgD2k
	qpkldl07NIEmqAeQbg0ssiZKGChZOwbVGO11E9ttyfg1n2ZvbrV/BNdWfoReBmhkPildr8dE2wA
	60DWpctoWgHtA0aL3h3SxeYPT6yH+l/TkvS7ZCx0cktjH145+sem5mLDZW+Un6EiIqZDtLA/lNO
	0KCyLJyPmpeutycNkrRjDMbHIRopm0HfyWU7g7RldzWBlebWB/ANcMElcYQLf25eFP3ei43mFDs
	P8nir2e/w1KzL2mA3i9lHrH+oBSz0oSOY5ClRwC6p7XYHX3w309M8wBZD9oKTFmI1MMNaVyEQ/y
	/SxrESjQSGh8w6STq1NoBGqOGwPKS1UO4uS2WW9ZQ45Vvv03/6agC2eGAiCJ4f+9Y5dZ/E13/X5
	hnKfugcEXki1GkH+EJcQ9SwhE/f2nUTVrA==
X-Received: by 2002:a05:690e:12c2:b0:677:afe7:1f98 with SMTP id 956f58d0204a3-677bd3e2c84mr2661304d50.83.1791190033376;
        Mon, 05 Oct 2026 01:47:13 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:1149:2fcd:c86b:8747])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b9c895sm2346306d50.13.2026.10.05.01.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:47:12 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 05 Oct 2026 01:46:52 -0700
Subject: [RFC PATCH v4 8/9] mm/damon/core: cap the region merge threshold
 per target
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-8-b03452e137f3@gmail.com>
References: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com>
In-Reply-To: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com>
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
by its weighted hit sums.

The passes that follow the regular one exist only to bring the region
count under max_nr_regions by escalating the threshold.  They keep using
the escalated threshold uncapped, so that bound still holds.

In a probe-weighted context the merge score is a weighted hit sum, which
can exceed max_thres, the samples-per-aggregation ceiling the escalating
passes stop at, when the probe weights sum above 1.  Raise max_thres to
ten times the initial threshold there, so those passes still run.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index e3c29d7cff23..7c0df07f0a90 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -4167,12 +4167,40 @@ static noinline_for_stack void kdamond_merge_regions(struct damon_ctx *c,
 	unsigned int nr_regions;
 	unsigned int max_thres;
 	bool count_age = true;
+	bool use_probe_hits = damon_has_probe_weights(c);
 
 	max_thres = damon_nr_samples_per_aggr(&c->attrs);
+	/* weighted scores can exceed max_thres; threshold is max score / 10 */
+	if (use_probe_hits)
+		max_thres = max(threshold * 10, max_thres);
 	while (true) {
 		nr_regions = 0;
 		damon_for_each_target(t, c) {
-			damon_merge_regions_of(t, threshold, sz_limit, c,
+			struct damon_region *r;
+			unsigned int t_max = 0, t_thres = threshold;
+
+			/*
+			 * On the regular pass, cap the threshold at a tenth of
+			 * this target's maximum merge score.  A high-traffic
+			 * target in the same context must not set a threshold
+			 * so permissive that a low-traffic target's hot/cold
+			 * boundary merges away before the cold scheme can act
+			 * on it.  The score is the one damon_merge_regions_of()
+			 * compares, so probe-weighted contexts are capped by
+			 * their weighted hit sums.
+			 *
+			 * The passes that follow exist only to bring the region
+			 * count under max_nr_regions, so they use the escalated
+			 * threshold as is.
+			 */
+			if (count_age) {
+				damon_for_each_region(r, t)
+					t_max = max(t_max,
+						damon_merge_score(r, false, c,
+							use_probe_hits));
+				t_thres = min(threshold, t_max / 10);
+			}
+			damon_merge_regions_of(t, t_thres, sz_limit, c,
 					count_age);
 			nr_regions += damon_nr_regions(t);
 		}

-- 
Git-157)

