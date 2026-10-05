Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5E419FBB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190024; cv=none; b=unI43DCHFfziaFvtuO81y9tagMsyUdFUwwVv/HdvhL4Inin9D515We63xRZUQ0hgPd87Ze+lNc4RzFXpQ53cfRCNF20fngnlX19IHf3efp1pmT63zigh8WosxPSRc+/HJR/yGiicJwzHy1NJuRfj1959A0TkM6BhDyxiiyopeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190024; c=relaxed/simple;
	bh=1EYjs7dr8001HZvpN6OGACF0FxNrGTYPiyEH6vsCQ+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfpMBOOcfvt+yWsfg12q2zDSC4AdckHvEgPD7ZpUFnCCNmrO9h1g10WGVk2NJlCpdTnzoETHr+YMDoQ4iUDDqySF5EBsOrmlVmV0HsfbGmWR29TxWC3imbn5oYqwGoFjIYsmo8dcDUN8VIy0Zb9vip5W6POy9dS64lwEEy/1cbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CojhOGOA; arc=none smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CojhOGOA"
Received: by mail-yx2-f1.google.com with SMTP id 956f58d0204a3-675bcb34141so429473d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190021; x=1791794821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK57rzngoR9p64gbd7b8c0TtXsJytTuhMQ1jUtQZOy8=;
        b=CojhOGOAZ21Xv8L/k1hX5tRUzXaR/oiTGzFdFq6lFPMQzewnSKSvkMGaLzGKh5eXVy
         HG+oFJ99TzVUcDwxYymGggYV7z0TFWWULR3svKvMGyH9PrVIxQiWXz3+zBoasiAFaFWb
         hoZMfzTwY1mYSYanfBCfW42u8LQJ6YQ4fWV6guwdFm57QOg4kZjpN1bY6Vl9tAbsv4+z
         F0aCPbMxlNlIWu9TXkhdSj24hf+0jYGhkw6XGy9+oolwZ/E4B/iit6nAyKccKemOwJPx
         GFp6bkyZuKbXVZats3pn3eMTO0+eo/G+kiMNMVYsrrhHTD4I9DUoqTyNKGOo5cwQopoo
         ed6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190021; x=1791794821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK57rzngoR9p64gbd7b8c0TtXsJytTuhMQ1jUtQZOy8=;
        b=tf+xqCCWDpWmOatT6GiZeHHY0EswKKy/SqUEs+bE3z5MrKrRNqkWdRuTCtz0kSlp1v
         TeP8v+qtQdIWexbTWg2CRachRTDxKTotSn3tBEfnOsG2lQCZ12AxpRS3ehkJewkDBTbD
         pPSBz02jUiVs25WOeLp49OJMIT4ua7nPVbxkuUFp1sD/ubM7UssoHBasnzLBwVBL5DdK
         0zADVPBfbI5tlZFbE7ce6yvvd476kQuDiUgbQd8w/XC03tjSaJnk4veTGIx2iHQLuvFs
         3iVEjmsl2+4413GWeIgwlD7MgMKRKCkSY5yWmwfN+zmPZEy3/puE080lL98UU4vdnzZB
         Ogog==
X-Forwarded-Encrypted: i=1; AKwUvBzKyIlGFTBN+DAc153TpPFsf8ld91EdCZxF+i0dkShIPNzkFWstGoMCxurFPv8WjGaqNf8LuUiH8bafHMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnaoDzvZnT8MknJFrP0mzqfF+8E4BMzWsRptYZY4vjy6UiEVM+
	owEjFGBihVC8Zs2lq4EZUv0dIh1KuOkHVgY4SBT84ueHsVeE6s0+9sC8E6MBub0vUQ==
X-Gm-Gg: AYBFou0Ps1dl+eEvSyZDpn33AekuJDF8fLtRmjkgNcbRzb8iQkOU6tTDj93HRojSUxT
	bE+eVbCX9up3E/FNjnn3Jt3CwQy9Hdm/V2huE3VI1mjXadpnQQYVkYTNHxAUlhGPLD2rfut/BBA
	exTAXcTKUn+AimAtIvU3xgkF4V4W/sJ4JVrkZ+y6wAODT05NhRpFfm9pUB2ufF6dDGckRv4Me65
	PfcKp3CcUrCsJzBEjwbn/IjNqqyanMp/qxfxmZu4U4gVMhWCdNczmUj3WY8sIF3le8rIMgqHKMY
	XlW5sANTeBz+0+azycqi33x9jcUtV/K68xg9Sg5HgYO4ToXrEnSodDmI9n7abEZNJvQo9Hazo5Y
	xQXSXP1pJsH9hBhs1491/dWUnRFH2cvh1KQMCfF/zAZ1gwi+6s0604jVGyRxkFPS2R9023LwXGx
	X0yAXZHG/Rjm9LiqyHOp+XytOKRdL01m7I+uW5pa4ZQhf/BhjvqNnQSOQ37Dq7BlFGKcZcE25T+
	oOpi/8PPfCbqkcyuqGZfW8qE+rAOjVvkPfiQoC68M24GPK3X+8Qs/NdaLSDeT6jMUp8IURcd06p
	XJcudG5GQnYICVWUzx4LsqMuaG4+pqN1cvweDxhvBz7yEQ==
X-Received: by 2002:a05:690e:dc6:b0:677:d455:5198 with SMTP id 956f58d0204a3-677d4555829mr984847d50.40.1791190021565;
        Mon, 05 Oct 2026 01:47:01 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:1149:2fcd:c86b:8747])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b9c895sm2346306d50.13.2026.10.05.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:47:00 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 05 Oct 2026 01:46:48 -0700
Subject: [RFC PATCH v4 4/9] mm/damon/ops-common: use probe-weighted score
 when probe weights are set
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-4-b03452e137f3@gmail.com>
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

When probe weights are configured (damon_has_probe_weights()), use
damon_probe_hits_wsum() for the frequency subscore in damon_hot_score()
instead of damon_nr_accesses_mvsum().  This routes the probe hits of a
perf-event probe into the DAMOS priority score.

Make damon_has_probe_weights() non-static and declare it in damon.h so
ops-common.c can call it.

Scale the weighted-hit sum in 64 bits and clamp the result to
DAMON_MAX_SUBSCORE, so a large sum cannot overflow the subscore range.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h |  1 +
 mm/damon/core.c       |  2 +-
 mm/damon/ops-common.c | 19 ++++++++++++++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 7c5a416e1eff..b0895ef477ed 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1306,6 +1306,7 @@ unsigned char damon_probe_hits_mvsum(int probe_idx, struct damon_region *r,
 		struct damon_ctx *ctx);
 unsigned int damon_probe_hits_wsum(struct damon_region *r, bool last, bool mv,
 		struct damon_ctx *ctx);
+bool damon_has_probe_weights(struct damon_ctx *c);
 
 int damon_set_regions(struct damon_target *t, struct damon_addr_range *ranges,
 		unsigned int nr_ranges, unsigned long min_region_sz);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index a15dc7e9125a..9fc536238c2f 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -331,7 +331,7 @@ static struct damon_probe *damon_nth_probe(int n, struct damon_ctx *ctx)
 	return NULL;
 }
 
-static bool damon_has_probe_weights(struct damon_ctx *c)
+bool damon_has_probe_weights(struct damon_ctx *c)
 {
 	struct damon_probe *p;
 
diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 2f3bf86a221b..3c5cd745f4ba 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -172,9 +172,22 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 	unsigned int age_weight = s->quota.weight_age;
 	int hotness;
 
-	freq_subscore = mult_frac(damon_nr_accesses_mvsum(r, c),
-			DAMON_MAX_SUBSCORE,
-			damon_nr_samples_per_aggr(&c->attrs));
+	if (damon_has_probe_weights(c)) {
+		unsigned int wsum = damon_probe_hits_wsum(r, false, true, c);
+		u64 subscore = div_u64((u64)wsum * DAMON_MAX_SUBSCORE,
+				       damon_nr_samples_per_aggr(&c->attrs));
+
+		/*
+		 * Score by the weighted probe hits.  Clamp to
+		 * DAMON_MAX_SUBSCORE so a large weighted-hit sum cannot
+		 * overflow the subscore range.
+		 */
+		freq_subscore = min_t(u64, subscore, DAMON_MAX_SUBSCORE);
+	} else {
+		freq_subscore = mult_frac(damon_nr_accesses_mvsum(r, c),
+				DAMON_MAX_SUBSCORE,
+				damon_nr_samples_per_aggr(&c->attrs));
+	}
 
 	age_in_sec = div_u64((u64)r->age * c->attrs.aggr_interval,
 			     USEC_PER_SEC);

-- 
Git-157)

