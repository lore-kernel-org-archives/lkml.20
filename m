Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B839B947
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791061713; cv=none; b=p+V4mwDpLNXYM2OQOWjHB4zbjbemUZade60nWpnDwUMjS01MdNhxInzq3TG4zttIav8sdPOmZNBRjVlaHnuuaIxW5nWvkRuekJ+VvOtahfJatJ2tjIUQUZ6+3YDSmVvUv7DHguiMlRTebtS5awP6zay8/XpqMbTIZAHajW6k3YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791061713; c=relaxed/simple;
	bh=sWnaJ6XMERLifu7SIUWAbGgqmKm15NV7t/6Zh29vc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8bgKMPtgApJ3+UMMg8+oBJR//jDCanVjKZXve6EzF70tDW4tmGNB3W5K0ecmK6YB9b060g8lMzvWGjeyPKiC6IqP9vF2CTKo6tlOVA8QW60CWdZbxyLAlJRSGhdQMu36nS3A2NLgCm7wFHjklWLnlET1t2/e0Inrq4ewaHMnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhB2QLv0; arc=none smtp.client-ip=74.125.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhB2QLv0"
Received: by mail-yx2-f4.google.com with SMTP id 00721157ae682-8af042c666dso66997b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791061711; x=1791666511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fqUlY6qim2cHCeufDeEuXDmVUcy77BBS09bM8HasmY=;
        b=jhB2QLv0VgIpHCW41qT6BlEPwAGo/I5AwZ+SrM8qVadMxs2pZn0UXJwLD8oJ9Q3ljl
         bFrih75STHFsZZBr9NxQk7WJz/NisUTvJfTjY6qhXWbzt0ddOkW1XGAk1eieekIKldR5
         Q3hlxVBQrXJGl5CpHIHVEZzfPe2dNDJCvVazgPtetWQU7QGqSUtI8966DPPUkVHyvW0Y
         JqyPdkffxQ8aKfv1+opRiY4UD45/N82cvV6GIpI5VYql3vAQuoHb9MPKVqGKk33RHOCh
         +ZTqHokxhrheXa82B1R/ZYG7GqT/jzYZ9YBKbjUC0A/a8DsJ7j5c7LvMyj7UepYr3i55
         hEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791061711; x=1791666511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fqUlY6qim2cHCeufDeEuXDmVUcy77BBS09bM8HasmY=;
        b=VYIDzXpdDZO+xplj8ZyBWwTis1onVMSwKnWdBL9Cp3QKmfjkCyxk6lJPAtSt61TTah
         0EB0HzqZuTAZruSxrgpNGaaFGXdH+2mRTq/tL0pjPbc/+BkXIqWbsziT0EyZL40L78W8
         rceI7ZAaCppCj4eqdQlgUY2YfWxjbFGsi8KpUgcEZJOSQe5KbfoquRuHp4N7Z6uZ/vig
         0BOtNwfM0+O5vlKwMySM7ixR3sB4MtIV34sTzEKog/FlGGuG57MbDFzTl7gMQEFtIRlN
         DfBZa9TwbOVQvgC71G9HPJkb5Z1Ln69pxtwwrjqKuYyfDsswtC99FxH9gs0inlclFwU1
         GYWg==
X-Forwarded-Encrypted: i=1; AKwUvBzD8OYh0zzI51hfFivip6qqi4E4KC2P5TGqmK9+Q/wA8fUpNuQvSUJ6SiqQEM3lcAawFvmpgXzzJ127FTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYi+OeSkxv2CVdRkwMO54+W+YrmX5UPSVCYQ0yr4Fq6IZ4qDvM
	wGdznHrckCpJIGu8aRfD2rpRSw1ylIjV3PySsRHBe9AoCe609c9u0tY=
X-Gm-Gg: AYBFou1Vg7CSsbtiNdvlj3Z2+GaUDLHi1qLzbzzaR1El/y/Bz8KKHPzJhmJ9CIo0oPw
	9gyok9vzDx3KB1jp56cO5CCiCVrHhwVl/g7Le+MPpaYSefLTdlzla63aFOJby+LjHJPjjG02Xxd
	LM7DyNdXbyadXk1ijsF5LBkeeb0Gien4LGAMujBWywuDCQTYjQ9tY+xUN3zVheLlmeLRU/NWrMX
	7/5nYvsYYuSaJSIk8pzxbziL1kvKRU7mJdxkMjlGIMLYVOdFonDF8EAPt7EfTkNxp72bKk91IZE
	qNUqdLVSMiud3em1tlBhG7mqgRJOramfl2dsJi3r+pMm67tVKr5GnhEV5yhLIzTtujJBSJYxOuo
	lsENY6IaFzKTo8AMWcE9xbAysB5wBS+Bh0aJOM70DdL/gkZmPJijTnrPMUSoUgIlm8wrOninvPd
	iqvyjcODZ8B9nyx0TPfKaGbYMqctH8Snhqxdo4a+GS9hYIlzhBNyFsQHYZAfUJsQ9GyFGv4ApcD
	+axRzTl1p+zrWlD/4wEsDHg6xpU/2e59jUHknFedtKnit2kmHtNsSzpF2yPZ4zAUdRTW4uB1Feh
	fQqG3RDVPgRt+QyXIjQx4YkpM6gbVmk7wQ==
X-Received: by 2002:a05:690c:e3ed:b0:873:17c9:afca with SMTP id 00721157ae682-8ae94c981a5mr12007377b3.29.1791061710890;
        Sat, 03 Oct 2026 14:08:30 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:550f:9551:5468:60f1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af0d179d3bsm743537b3.40.2026.10.03.14.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:08:30 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sat, 03 Oct 2026 14:07:57 -0700
Subject: [RFC PATCH v3 4/9] mm/damon/ops-common: use probe-weighted score
 when probe weights are set
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-4-0f00417b41bc@gmail.com>
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
index 217299aa6c03..d7baa6a58d3d 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1306,6 +1306,7 @@ unsigned int damon_probe_hits_mvsum(int probe_idx, struct damon_region *r,
 		struct damon_ctx *ctx);
 unsigned int damon_probe_hits_wsum(struct damon_region *r, bool last, bool mv,
 		struct damon_ctx *ctx);
+bool damon_has_probe_weights(struct damon_ctx *c);
 
 int damon_set_regions(struct damon_target *t, struct damon_addr_range *ranges,
 		unsigned int nr_ranges, unsigned long min_region_sz);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 4fd1db12bc49..6a90cf465d40 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -351,7 +351,7 @@ static struct damon_probe *damon_nth_probe(int n, struct damon_ctx *ctx)
 	return NULL;
 }
 
-static bool damon_has_probe_weights(struct damon_ctx *c)
+bool damon_has_probe_weights(struct damon_ctx *c)
 {
 	struct damon_probe *p;
 
diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 2f3bf86a221b..8cc6bc440153 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -172,9 +172,24 @@ int damon_hot_score(struct damon_ctx *c, struct damon_region *r,
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
 
 	age_in_sec = div_u64((u64)r->age * c->attrs.aggr_interval,
 			     USEC_PER_SEC);

-- 
Git-157)

