Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3453FD40
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060621; cv=none; b=DMMcZcNY8aphGqtY1lY95RKvumOgOGuMZUAlqzhxpcItyKVSaltYXuKQhoByjWz2urwoh+JjaNyHPLcOOqXNW397frrgarzHi4KKjrVvMRGuNtHZDxaSDlZtmfmHx9qGB1MftR+Sx/EBemSzlEVndhJPuqy0kLqLEL/EXwsZQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060621; c=relaxed/simple;
	bh=FWOV55/3vGD+VdA6FUY/zNKrvVLuEsU8r1gv1G/TCiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKeEH/+yWOcL2WcIQCjdXhba94f9rMXIQlzUmm7Z7/tDPE59fFzwB5mry2xfAaW/T9uwx3tyluuUslaV/I3VvOxLIl/F93W0fV4mAEbiIfiQEF3AuNxETGqiTLdc6lCAUVW7gmI81KXBogwBe9Mv0QHUouyaboyAB1h/eOXWIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyQO7mJI; arc=none smtp.client-ip=74.125.224.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyQO7mJI"
Received: by mail-yx2-f9.google.com with SMTP id 00721157ae682-85b8fbb56ceso3164197b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789060601; x=1789665401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58wdEMpjvnsgClzUj13f3cAStl17GU2Ynr7IJ0GHfaE=;
        b=UyQO7mJILMc6RaXFxZd+oIS8Ciby2dT+G5UAf2HICLTCeZy2OeZ4SqSj1mtfHBMWnT
         UbtbMVcXC53IGkLrbwRjSkJj+UBrcy1lXHiidUcAECZZ5qjKxce6DbdOcDSJ2+kfbLjl
         z/0v1PFwo9Bv8p4rctMhUYNLtCJBPFr30iG3wIjfBvCM3J+zVxqgHkF5FTaMP0J2eYBs
         GKiRDolUAxPSZb253qc4xqsdVKC0VAcB6JvRWjxlobS8eHGDV1sN1fljnJofevFv6GQp
         bC8/lauxudlS/lrUGU28x5u4+0xJd8OfCmiBLVoDbn6QETB+9+hvIfPezmGomW5hEoP6
         ju9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789060601; x=1789665401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58wdEMpjvnsgClzUj13f3cAStl17GU2Ynr7IJ0GHfaE=;
        b=T4eENHDJWbDctGSRhKvx97wLQvufwr0C1eZEd+lz9m/tqfuiZm0btuix7V5T3C4zri
         ccXQzJjhEZ8kYVwyQ6EX9xFDR0e6SjibCKSP42s702Nh+elihPeF5IBALIFcctGH1KHd
         rk2X9wMlIQ0EQUJ7ynHVT+bzJu21eTgVax9CDGuGhqfCc1+5UmYidJBr1S89Yxfz7srl
         bIP1VRmuf3GZv4RaJUQL+EIF6aIbCTHfhOryEI1LyaOjdo81C7J5w0+pzpCnAq67LX54
         BofIQtXizTDzJC0dxRQJUn8AiCi7qpB+KnpwZCt0lKJhlFsBc0D67NFOHj7kGSKkz9sw
         oeFA==
X-Forwarded-Encrypted: i=1; AKwUvByp7r7N+j1gx8fXi/9zWyQb6GKvjmKdHJo3gD2L4jU4dSqqa/HvxrF+7QgF3FZ0ebju1y8MuBoOaoGy/tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lwjPWr55GN2eZ3SxRK4hYasbsomvz/VG/rhVew6+OE9k0I/50L
	NQopFL/Dda2vRY1AYMymS/C7sxgzKMAgjyRbK0xipsirFm1+aV7yyrI=
X-Gm-Gg: AYBFou3BErPsV+eW98kcb8Ah1O1Xu6mLoYMz4eQfr93CKmgHbINYhC9E+Ka76j0Vhy3
	nLrBQJZ8Fh7YOGGcFkYdSKAfniyPcmQpmOwW4kFVDZmrBGUjNFn+QyptTNFW7yz/HCJMlrzC8Aq
	xJC67WH0YfOU2ONT198LkwYCn17/S+QJvDQRwjG8gBqoGutFPUtK2BCe4/E9n1UftGVEFTLw7Ic
	bMpJ03enoy+DHORW5RF0gW+rVaSAaSh3D7qESuigLrYwfHzldQgItxYuycCV2+lh6ja/AKpz/rF
	nQEz6MFagPWzva4cWJUStrd3XzvTh7sOLwExCBmOpdwS6gq3ghNXHsbi3b0fFzdoNfpnD8u8OG4
	Yu5y/Dkio3QlvU+1W+dRjKLBE8oF1YvYkKyAU4PRlelpy3TJR9Thucg1nEqdr/0e9qVi0BRX7LJ
	dOzxdZAQxRgeCH9927m3q60qQqBsAc/SRpQSlkJ+VUIy6Zhkc2/vH89MBN09SHOfUc0xipIzpiB
	8JD1mqdz2Rk3qG3NOGpR4Uno5sS23FS02X/xRlonunMwF0jZg==
X-Received: by 2002:a05:690c:c505:b0:873:5c6b:a31e with SMTP id 00721157ae682-884a1163a16mr1213737b3.24.1789060601165;
        Thu, 10 Sep 2026 10:16:41 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea6026sm2285967b3.32.2026.09.10.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:16:40 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net
Subject: [RFC PATCH v2 7/9] mm/damon/ops-common: use probe-weighted score when probe weights are set
Date: Thu, 10 Sep 2026 10:16:21 -0700
Message-ID: <20260910171623.6638-8-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When probe weights are configured (damon_has_probe_weights()), use
damon_probe_hits_wsum() for the frequency subscore in damon_hot_score()
instead of damon_nr_accesses_mvsum().  This routes hardware event counts
from a perf-event probe into the tiering decision.

When no probe weights are set the frequency subscore comes from
nr_accesses_mvsum, so page-table-only monitoring scores from the
page-table access rate.

Export damon_has_probe_weights() so ops-common.c can call it without a
static dependency on core.c internals.

Guard against integer overflow: clamp the probe-weighted subscore to
DAMON_MAX_SUBSCORE via min_t after the mult_frac scaling so a large
weighted-hit sum cannot overflow the subscore range.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 include/linux/damon.h |  1 +
 mm/damon/core.c       |  2 +-
 mm/damon/ops-common.c | 21 ++++++++++++++++++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 88a459a60b296..3147ce30951f5 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1307,6 +1307,7 @@ unsigned char damon_probe_hits_mvsum(int probe_idx, struct damon_region *r,
 		struct damon_ctx *ctx);
 unsigned int damon_probe_hits_wsum(struct damon_region *r, bool last, bool mv,
 		struct damon_ctx *ctx);
+bool damon_has_probe_weights(struct damon_ctx *c);
 
 int damon_set_regions(struct damon_target *t, struct damon_addr_range *ranges,
 		unsigned int nr_ranges, unsigned long min_region_sz);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 850880f791c9e..6b3aa86386b76 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -391,7 +391,7 @@ static struct damon_probe *damon_nth_probe(int n, struct damon_ctx *ctx)
 	return NULL;
 }
 
-static bool damon_has_probe_weights(struct damon_ctx *c)
+bool damon_has_probe_weights(struct damon_ctx *c)
 {
 	struct damon_probe *p;
 
diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index c36cc39cd2c70..3033a5c0ba690 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -170,9 +170,24 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
 	unsigned int age_weight = s->quota.weight_age;
 	int hotness;
 
-	freq_subscore = mult_frac(damon_nr_accesses_mvsum(r, c),
-			DAMON_MAX_SUBSCORE,
-			damon_nr_samples_per_aggr(&c->attrs));
+	if (damon_has_probe_weights(c)) {
+		unsigned int wsum = damon_probe_hits_wsum(r, false, true, c);
+
+		/*
+		 * Route perf-event hardware event counts into the score.
+		 * Clamp to DAMON_MAX_SUBSCORE so a large weighted-hit sum
+		 * cannot overflow the subscore range.
+		 */
+		freq_subscore = min_t(int,
+				mult_frac(wsum, DAMON_MAX_SUBSCORE,
+					/* +1 guards divide-by-zero: samples-per-aggr can be 0 */
+					damon_nr_samples_per_aggr(&c->attrs) + 1),
+				DAMON_MAX_SUBSCORE);
+	} else {
+		freq_subscore = mult_frac(damon_nr_accesses_mvsum(r, c),
+				DAMON_MAX_SUBSCORE,
+				damon_nr_samples_per_aggr(&c->attrs));
+	}
 
 	age_in_sec = (unsigned long)r->age * c->attrs.aggr_interval / 1000000;
 	if (age_in_sec)
-- 
2.43.0

