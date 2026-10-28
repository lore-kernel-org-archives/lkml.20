Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207850;
	b=QHkXCOggyUQerXIcrpoWwi4Fqv3Sg5/8xp831MC2HjoGU2VgecEmU0B7hI9uzyXvRMAa
	 OVt5fuazY2GxJX1w73qvf5rhTDNRzFy4qDaInavh21Y26Clt0lZB2pG527S0DgwN0lkur
	 NGgOnT7jmfBsJbvKwRSPZDWX5Kz2ldzM3rgCJzMuCsXRIf1mYHLffLKw3wPkwmpZeB0Xn
	 m/PUVw86+lesPJdL7wL3Vg1Fr4evrFmrKX28mubv8Q1CQDAkILr3QxdlYl0vPsX+EK1uz
	 r8tTJ76b+WVmQouhj6vj+fvDKN5mQn/Ie+nYVtweCAKt6wdbEAVzlPxyMG/QAfwNuoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8zJ+CABCBU45JUBR07bzfuVV9dkmnMA2f9ZOSTtAqbg=;
	b=mmS4AfRAwl9a3k1vqnezeb8aNUw2RRo6wLW176szDazQnxeqwGOQdUe/5Sea3sneg2yP
	 QC8Don9zNd4w/9aKmujvayU2RGWRSbilZaZOLTfesMf1vcri+T3nk417vvjX9xuoARH2D
	 QaZMpf2P1zPk0i2Xxboo5RKYxQsHH2NGLc+bEAoqKuyiNPIdcWLgOgHMdxBhRzZjOdyS1
	 6FZnaUkgIB0Gj5XCi9fzlKyuftXzEi64BGYZqVG18QYjo5B9C+iAxfMa8YZ5NMFjK/w9Z
	 1Wo92RgGsS7q2lGsFh7KMa2kpmlz+JoXCzAK+haR66GT5BwtLKC/j949TNMfGjeHPFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CI8y2eXo;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2221A606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2221A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CI8y2eXo
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679334baa1fso1582580d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793207848; x=1793812648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8zJ+CABCBU45JUBR07bzfuVV9dkmnMA2f9ZOSTtAqbg=;
        b=CI8y2eXovwu/O5fMtk947eXXsHmnlNxwGrTROXV//Q8qMHsfQljEZshE1ytljUjlKT
         NuYxQaotba5cxDEzyVf4zNqNA0L4/Ey8T9lWccUzBDTk8bwdODKqLL53H67ikao9MUNk
         d12kOZtlBmk7hCKx1pcI3BeAhbHzCSFpxqWziTGjUD5CABmZGC/DAnvec0L9kMz9Lzuk
         eCsheYTS3wED3G7AjNheGRs+3o3rVI5PlhIW0TGGeIZoDR3mAloTMzhw3xccnj8oc1ER
         Zngcqxz0qaR4u/J10Gc5njuMJc69LoT9h8VHZBNL5dFKCsp+lblZdsE88e4Fl3KAF6n1
         p2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207848; x=1793812648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zJ+CABCBU45JUBR07bzfuVV9dkmnMA2f9ZOSTtAqbg=;
        b=1P2DDJqd6w6Ed60u5iVLrvgM0YWGGqX1YOlnUVFPyITDLB1QK7jPcl+qWGbpuAQskZ
         4v3QdpDW5vLyv+4URBbcr9bcSJYHd2rvhJbgwQzzK/r3iOl9AkYBiBvQKw6btH3k5NGQ
         VhQ6ZQdpYDD8A0nwtZlkxZB3oQsP0NNOQFPk69OlyLQLFlaUm9Ev87A/x60XSXUvxVhO
         RGXLLkyZotFLXCX2XpvLCwhWoca6ncSP1CsvgNquxJJT93r3wodoyAI4OjzA13m7eaH3
         OcSueRol7MAxuSO6RLthqtZgArpNFhVJvhSROqBRh2UungbDykzTw13ERS5YG3H/QhrW
         BfVA==
X-Forwarded-Encrypted: i=1; AKwUvBzkhytOpJC4h8Nh5ltvLXnK6yApyuOzB48ucBF9jSB5EQk5xaMQ3iHBu56x2spUqC0U8mVUxIflTpcvsRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYII9Ej8o7nebkqJcS0vAJ6hyICvBiUE6nu0foqGuMaP/RTHUMkv
	uJRDojpIc7KgUMdLo8Nqlc6Kn6ebtXtQKAl+johEaBvPrzKOT0Hgm5g/ipFdN+B0k+s=
X-Gm-Gg: AYBFou0S78il8KE1FL2/DVg5mUM+wjP/Qmx68bMtbEKUMelCaQgk00vDEDH4kH8dw4A
	V+SAkjWLjnqJmhbtliPbpV+306cxtba5FEGVhEpYxSP75RisPIHOulms8gL7dMmSQIzlRBYt97w
	B0OVUaT/oIa6AdxZfLvgxapX+XgtkItbG4myIVXhwvUWmMwYaCmxOYGLmWpzOveL054iuBIqCC7
	/MGAPJ5kdC8MOfTJSoHRuG1P33dKkMk1HLP+bOVJcq9fho8UtBTM7Q+ZUM0TN2f/EYG0SCVgwy6
	fDAa8BZ+WQJMUDW2e1bYR2UDeOhmirH8t8kIbGW9DMpulSddKdbkGdyqlUxi4BWSM/FIRE/XR76
	OGJCqS4uUdLH1hh8qVg80enlEC0Foe8ROlTgP5iGf7dcy/DngEPVshuhus5vrTRqmG3s2OIK+YU
	gDNwzxW2MZi8j8iGQasqptmyAPeNWtwlucTi0OcCB0aEGhfG1QTDoURnkTJPX0rUmKpeYSJAxJT
	gW+Bnk8XS4M7medSGaTv02t0Hl9WZGrHlIvBZMTP8Vo2BhOgDFaualCv37WIyju+EuBGkxe1N/+
	ugbKl7DMZYxulFEjPlDgIP4kxyM9
X-Received: by 2002:a53:c30f:0:b0:677:ad01:32b0 with SMTP id 956f58d0204a3-67a7bce93abmr1470801d50.36.1793207847839;
        Wed, 28 Oct 2026 10:17:27 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a0c31f1sm2058926d50.11.2026.10.28.10.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:17:27 -0700 (PDT)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>,
	Salvatore Dipietro <dipiets@amazon.it>,
	Christoph Hellwig <hch@lst.de>,
	Dave Chinner <dgc@kernel.org>,
	Matt Fleming <matt@readmodwrite.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm: page_alloc: do not give all non-blocking requests reserve access
Date: Wed, 28 Oct 2026 13:15:53 -0400
Message-ID: <20261028171719.2043421-2-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028171719.2043421-1-hannes@cmpxchg.org>
References: <20261028171719.2043421-1-hannes@cmpxchg.org>
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

281dd25c1a01 ("mm/page_alloc: let GFP_ATOMIC order-0 allocs access
highatomic reserves") accidentally gave all non-blocking allocation
requests access to highatomic reserves, which includes GFP_NOWAIT and
other sites clearing __GFP_DIRECT_RECLAIM.

While this improved atomic request success rate, it's unintentionally
broad and can actually worsen highatomic requests by squandering the
reserves on requests that don't need it.

There are concurrent efforts to clear __GFP_DIRECT_RECLAIM altogether
for costly order __GFP_NORETRY requests, which would then also fall
into this exemption and deplete reserves even faster.

What GFP_ATOMIC has over the others is __GFP_HIGH, which
alloc_flags_slowpath() translates to ALLOC_MIN_RESERVE.

Narrow the exemption to contexts that have both ALLOC_NON_BLOCK |
ALLOC_MIN_RESERVE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260904115629.3993331-1-dipiets@amazon.it
Fixes: 281dd25c1a01 ("mm/page_alloc: let GFP_ATOMIC order-0 allocs access highatomic reserves")
Cc: stable@vger.kernel.org
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/page_alloc.c | 4 +++-
 mm/page_alloc.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a8cac5e01066..8ac2e2bf14fc 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3238,7 +3238,9 @@ struct page *rmqueue_buddy(struct zone *preferred_zone, struct zone *zone,
 			 * reserves as failing now is worse than failing a
 			 * high-order atomic allocation in the future.
 			 */
-			if (!page && (alloc_flags & (ALLOC_OOM|ALLOC_NON_BLOCK)))
+			if (!page &&
+			    ((alloc_flags & ALLOC_OOM) ||
+			     (alloc_flags & ALLOC_MASK_ATOMIC) == ALLOC_MASK_ATOMIC))
 				page = __rmqueue_smallest(zone, order, MIGRATE_HIGHATOMIC);
 
 			if (!page) {
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index e238ee91ed24..9c3c2830acb0 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -60,6 +60,9 @@
 /* Flags that allow allocations below the min watermark. */
 #define ALLOC_RESERVES (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE|ALLOC_HIGHATOMIC|ALLOC_OOM)
 
+/* Flags that mean GFP_ATOMIC */
+#define ALLOC_MASK_ATOMIC (ALLOC_NON_BLOCK|ALLOC_MIN_RESERVE)
+
 /*
  * Structure for holding the mostly immutable allocation parameters passed
  * between functions involved in allocations, including the alloc_pages*
-- 
2.56.0

