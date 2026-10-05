Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583E41A4E8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190042; cv=none; b=CRL4w9yxGyn50wtpn4m5Lia/CxGseWw+ydMWD45hayFpEGSULS4vxuhZRxLEspz0/CgHoLLw7NKgnaHngCs4h+wLeM+3jCn493JjrFY+p7QW4Mnv0pXWXRh5CbiVMtDG2/5WRQJuIBFJpb+473ef+FXhXv5vj1t6U5+NPBOumME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190042; c=relaxed/simple;
	bh=symTFEdsEz1iDbwVSvZBKTbueNku2GFz7sx5Y41Ynvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGnQF50KqeK+sGliJpNccJGahgQpI40APFt9j8yUOy6tcpeOeZZjVoJUSbre2XTQsjsWeH0v/+6a+3y7OEkUvqE+jl1mBN3WyLM9a4SRUCGatSY7txm9Z1X5IqdjMUb8h8mYkz3IgnaQGvIQ45fM0I9OGg0tZMjXQovs563VUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuVfMhjG; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuVfMhjG"
Received: by mail-yx2-f3.google.com with SMTP id 956f58d0204a3-66fd0af9eb0so450432d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190038; x=1791794838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNNeYfS92dPvp0CaRE/I5c5+qwjZ49qCZegwTjKDnBY=;
        b=UuVfMhjGPSe5n9C3ZKe8ItXGu0gom7h9TRIy4sowODbE/XhdMJPTd+GTb/AMqHgDgn
         Ye7WPFLUCMrYfD8c3leWLr8FZH3gwJ78g4UKYFFjAhAyL5s0VBinSWZezRoFOGWX7ELO
         qRIVib3MtuiTlEfMDFO0CHH49wTyeeJtY0Wxn+sgN5IuL7rmQmhoylmA9Khg4vPhCBmm
         oBZPfVE3GN4bRoyVOLaD+tOjG6QIOuGSXYQGJBhlKClUbiW15C7M7Iwp+Yp8QjSMIR3y
         4t3BhtTfjCSGufDFMSH+R50LgxLcgLaymEZPnwUd1OJQARUC+FAxwUX6CIGvvSoHe6UM
         Bwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190038; x=1791794838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNNeYfS92dPvp0CaRE/I5c5+qwjZ49qCZegwTjKDnBY=;
        b=YGBrUmwqvtHKw+JrA4Mwb16lsAU6nbXragixs3zTLCbP7thkbb8TXcjQ2XcBv2mcJ6
         UiVfZR3nXmI9rAchp1SGrHH/5D9ApImZe4r6XbnIilwi10kX+qIR7o94bo0zS/M8dr7R
         hbi4ibW2u6AaBwqzIPdSjAlcpIv+NjQgu/FXOiweUuC4uELi5C0299yfYSGoW+IrhCPz
         LHNb9z9S0PLhUxBMN8I/twVW2KOUBsHOTZKq0fMCLJSpCq4AbcWh2EUePasr0cy0ACTU
         6aQcREPitT+7EMKEuRfyZMbCHlpsI6NERr9RtHFyxAim1cjV/5RnELhxIbPQ+d/AvRWN
         CpFA==
X-Forwarded-Encrypted: i=1; AKwUvBxPee2yMz4M23pKeTxajMKlNVl0l1zcoCC8yhn0gYuimmOD+HIh0VXoVUMVt8fJsZCHNXQxaeyhJL/BT8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA6iSZaiwQDBqTjUHebWd/46PEKSqCa4z31HVU07CRK+ukKClS
	DzKhp8Jl78voBrDOE3FbXT98rcY6nyXQh1ht87axwYaDMkFH5HgMzPw=
X-Gm-Gg: AYBFou3Kbjz0fIxBS4RBVbA0wh8kRJK1/UR4njLW12nbfhrRtHKFZW/Uj8fH5pZF2os
	dVgJaf8jgrEf1BZU/wGHIPyoxnfwJphB0bllkBDRVuE1wabzFkKt2o13Yb1chhf1LsEtP0wfvcQ
	Jjk/Fnv1V2ZS8pcLHSZP+qDpS0kaNrKTHANUbPOi0RNkpwGBWANpeW1yY5X1mn4VMXn4m1Agdnj
	+yQ6mEUk7sg4SKk9Rxy6HG9dB5+OdWrLxBWZUU1vkrIOC+Ks5WKzMwc78OHrXcHTJc57D2SQS6q
	QgTZt71fUXA45mPvIovPqxkrGxWz+Ra08I8XzbgGtlWokQpQyyxWxfr3pEYhlEcisrL4fLJyfiX
	VMuvpzLSPL++3ZDTsH38YgHH57j/GNoRxVpyVnCsMDYLZOfbFjzkktUGhfLuob/s7a7F16OzW/z
	e2l90NJ0Ag4hL9ztV8GHGmRph/Lvlr4ctHF/qnSUeAecq7xNf+/0B8Wl8WsxExpoaEqKLSqQUGr
	dEJGaekYrEWLj9wfEmeWUggM4/xbQzoO5JlKQW098NivkVP05gG0kBx4MwXYl/dgSu/Hzy14man
	LwVkSCb51nW38RJjbG281vNzT12ZG7pio8E=
X-Received: by 2002:a53:c60d:0:b0:675:6161:4171 with SMTP id 956f58d0204a3-677ac159e1emr2637240d50.108.1791190037814;
        Mon, 05 Oct 2026 01:47:17 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:4577:1050:1149:2fcd:c86b:8747])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b9c895sm2346306d50.13.2026.10.05.01.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:47:16 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 05 Oct 2026 01:46:53 -0700
Subject: [RFC PATCH v4 9/9] mm/damon/core: apply probe_hits_wsum filters to
 node_eligible_mem_bp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-damon-perf-rfc-v3-send-2026-10-03-v4-9-b03452e137f3@gmail.com>
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

node_eligible_mem_bp is the share of a scheme's eligible memory that is
on a given node, and memory is eligible when its region matches the
scheme's access pattern.  In data attributes-only monitoring nr_accesses
is not updated, so the access pattern cannot tell which regions the
scheme is for; its probe_hits_wsum filters do.

Count a region as eligible only if it also passes the scheme's
probe_hits_wsum filters, decided as the scheme's core filters are: the
first matching one decides, and if none matches, the region passes
unless the last of them is an allow filter and the scheme has no ops
filters.  The address and target filters stay out of the metric, as
before, since they scope where the scheme acts rather than which memory
it is for.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 7c0df07f0a90..bae4569f0ab3 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3609,6 +3609,31 @@ static unsigned long damos_get_node_memcg_used_bp(
 }
 
 #ifdef CONFIG_DAMON_PADDR
+/*
+ * Whether @r passes the probe_hits_wsum filters of @s, decided as the core
+ * filters of a scheme are, with the other filter types left out: the first
+ * matching filter decides, and if none matches, @r passes unless the last of
+ * them is an allow filter and @s has no ops filters.  These filters select
+ * regions by their data attributes, so they are part of what makes memory
+ * eligible for the scheme, unlike its address and target filters.
+ */
+static bool damos_probe_filters_pass(struct damon_ctx *c,
+		struct damon_target *t, struct damon_region *r, struct damos *s)
+{
+	struct damos_filter *filter;
+	bool pass = true;
+
+	damos_for_each_core_filter(filter, s) {
+		if (filter->type != DAMOS_FILTER_TYPE_PROBE_HITS_WSUM)
+			continue;
+		if (damos_filter_match(c, t, r, filter, c->min_region_sz))
+			return filter->allow;
+		pass = !filter->allow;
+	}
+	/* as damos_set_filters_default_reject(): ops filters decide the rest */
+	return pass || !list_empty(&s->ops_filters);
+}
+
 /*
  * damos_calc_eligible_bytes() - Calculate raw eligible bytes per node.
  * @c:		The DAMON context.
@@ -3616,9 +3641,10 @@ static unsigned long damos_get_node_memcg_used_bp(
  * @nid:	The target NUMA node id.
  * @total:	Output for total eligible bytes across all nodes.
  *
- * Iterates through each folio in eligible regions to accurately determine
- * which node the memory resides on. Returns eligible bytes on the specified
- * node and sets *total to the sum across all nodes.
+ * A region is eligible if it matches the access pattern of @s and passes its
+ * probe_hits_wsum filters.  Iterates through each folio in eligible regions to
+ * accurately determine which node the memory resides on. Returns eligible bytes
+ * on the specified node and sets *total to the sum across all nodes.
  *
  * Note: This function requires damon_get_folio() from ops-common.c, which is
  * only available when CONFIG_DAMON_PADDR is enabled. It also requires the
@@ -3638,6 +3664,8 @@ static phys_addr_t damos_calc_eligible_bytes(struct damon_ctx *c,
 
 			if (!__damos_valid_target(r, s, c))
 				continue;
+			if (!damos_probe_filters_pass(c, t, r, s))
+				continue;
 
 			/* Convert from core address units to physical bytes */
 			addr = (phys_addr_t)r->ar.start * c->addr_unit;

-- 
Git-157)

