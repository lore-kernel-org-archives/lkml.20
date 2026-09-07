Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3D43B6F6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768671; cv=none; b=POsojqpAl6OHpBe09TvDXJSrIGC3FxiEADjkuCMrE7KtuZQ2Xr1nDPJASdaz1RxXBfUl3oNLMA+A6L0x2mRvHrGF/GsXANUtd5KoExBnMkIH7i8Q3Geeh7sBhE7IsB8FwGM9JRYCkuoMmI8Zzls7QMsua7250HCCwXiYCPDppR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768671; c=relaxed/simple;
	bh=/6U0ejnKVCnY/voDTSFxOlc5gsLZn/m+oRxuVla0hs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIsBQtQEGJWk4ov82uoGaBlxdNfXcgb1snk2NyBWqxPATHxSNF/rW4HtRtGk/j4XH9MyrVf/v+bW4LHx8avWDgLfQlDinl2ekjE3dOXafQtuJFFC5soKPOPUw212Ho6uz3QA1zqV2KZil6bt3XWFcw5pv7LybkunNOY54kDA2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=DcqulXjo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="DcqulXjo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-853c07a76adso3110675b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788768669; x=1789373469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyY9lPD75y9BR+0yRH+j2QBcA33x9lrav1rJc4EJ4Ow=;
        b=DcqulXjoOcFAe+42LjPy3ULDXiPtRAPOGRyIvricudwkMBmRgTMAKY2yeAhBNAnaaA
         7FLCSmRnC2JSPBcgdFwh+8enDbwQIwEBlZTHX8aRAh4VgzYM7pSp7iCyAU48t/qfdrp0
         WU50JcVz4uHTyXCEirwdUtJsNe+U0CYabkUMgNZi7dSJ842otYX8YQuQsDTERy3+Ktzf
         4fhAGTqBWaW4soqfHPr0vP6NW5h68Ltm8bkkWsf8pyk8XJKDz0umiYhI1LnzcwHJ3owq
         6Yodsomko2Grt6ConWTbIFwApeDpP+95Zb4YNKHugzbZZc8LtdSu13MItyeuB+B50OVr
         n6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768669; x=1789373469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyY9lPD75y9BR+0yRH+j2QBcA33x9lrav1rJc4EJ4Ow=;
        b=d2jD0uHW+w+78iCwq/Pd62GLAHi4i4Nj2aCB7ZQ2SV8et6omYM8sngepfb8BNBjqYF
         /3QwM7H5tC9M/8LC7+rCt0Dre2XovDxlsYPMkW+e4K8Mhlv+kVUWoXMZJojySqizjzsN
         RUwjO6SVcN6tHqy4i7jv/AOsK8G1mMti3mGAyYaYOeFI2cBEgvarCU9W0TyOQXa6eH9j
         qEPDj8ijr4JoBB2zUMtXb2CHwViwDw8WH4I91BA9sLYHAjBt8Vbyuq1eThzYc1BweC4l
         I8Q4k+EzQwT4kakfJuXXS9jRXRs1GFwh2APS++gPr6cEKF6oHvDYwPQhC1f5WPG1hN/3
         zrfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY62VKdfbPwCERiT8M2JAp1PPXZaaiGWhSQ7i1polztff4Sw959s5y0+mbuVPLOb4CbYVRXt2kVN2L5nM=@vger.kernel.org
X-Gm-Message-State: AFuF++lK3Cdw3h802iHqq47ArYaprRWH/sK9qyxiokUXwwXwYJYAgrRp
	c+3TgQgnNj5gdKlk/4hnWsjwmywini3mzTZiYZrLfecxMAg5Mg57E7sWSNFRkOSHwzYj
X-Gm-Gg: AYBFou2gJioH0lwg0C96z9tEFP2k4JNZtTMjSq08KesoP5u2yWVC4Orbm/UJGIKnPFr
	DjA5sJ43XVOXZ4KpsPYuBRHGXKd161qlF0gqKRQaAkQSeBQqmNrXpFpTj7KT6Ae5l+J28dMvlts
	x5h90O5N8hSx1PE0hYYmMbWsRSBVwnKRzLYy5brbBZsfHWSjY0t5NfF2oT+ujZR0s77nW7WdvJN
	szZfDbN1ptVWDcx8+MhcaIWePe2hqhqbaUwEGbbt8WkUASxiMkn5eReitSwFMuCSOC0HAPtOl/Y
	pL1Xq5ZZaQbhTZ4FLBBbeTbr4KF8HuGUEODoNSyASHcPTSOsm5bSZxA6SMHisQv7+RahaDQEz8F
	0rxD+Fr9ilToOxkIHe6saIf6EGyGUlleD/nUjAA8+aJ488DOApUN/ErFesexiNxqeaVdYWk6hwo
	/mn3Lbc5HAuSPlVNp/D5yKS/runjqMRiqVoYyASKj8p2lxKDKWr2eOBkzc2qwN/aUsObyTvaPpt
	C5ZohQvdcHPShDVHeQ=
X-Received: by 2002:a05:6a21:8cc4:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3da3a081704mr30312011637.22.1788768668686;
        Mon, 07 Sep 2026 01:11:08 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45e15604fsm3494883a12.0.2026.09.07.01.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:11:08 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Benjamin Thery <benjamin.thery@bull.net>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Zihan Xi <zihanx@nebusec.ai>
Subject: [PATCH net v3 1/1] ipmr: account multicast table and route memory
Date: Mon,  7 Sep 2026 08:10:56 +0000
Message-ID: <ef4076c94466ea4b147653e2b7f933778f245437.1788765185.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788765185.git.zihanx@nebusec.ai>
References: <cover.1788765185.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A netadmin in a user+net namespace can create many IPv6 multicast
routing tables with MRT6_TABLE. Each unseen id allocates an mr_table,
links it into mr6_tables, and leaves it until netns teardown. Those
objects were not charged to memcg, so the host unreclaimable slab
grows with the table count.

Account mr_table allocations with GFP_KERNEL_ACCOUNT and mark the
IPv4/IPv6 MFC caches SLAB_ACCOUNT. This matches the established
handling of IP addresses, routes and alternate interface names.

The first unaccounted IPv6 heap table appeared in commit 4e16880cb422
("netns: ip6mr: dynamically allocates vif6_table"), which replaced a
static vif6_table[] with kcalloc(..., GFP_KERNEL). Commit
6bd521433942 ("ipv6: ip6mr: move mroute data into seperate structure")
only wrapped that already-heap state into mr6_table. Commit
d1db275dd3f6 ("ipv6: ip6mr: support multiple tables") only expanded
the table count from 1 to N. IPv6 MFC entries were already unaccounted
from commit 7bc570c8b4f7 ("[IPV6] MROUTE: Support multicast
forwarding."); IPv4 ip_mrt_cache is older still.

Fixes: 4e16880cb422 ("netns: ip6mr: dynamically allocates vif6_table")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v3:
  - Drop the table lifetime / unpublished-alloc / empty-reclaim
    approach from v2.
  - Charge mr_table allocations with GFP_KERNEL_ACCOUNT and mark the
    IPv4/IPv6 MFC caches SLAB_ACCOUNT, as suggested by Ido Schimmel.
  - Point Fixes: at 4e16880cb422, the first GFP_KERNEL IPv6 heap
    vif6_table. 6bd521433942 only wrapped that already-heap state;
    d1db275dd3f6 only expanded the table count from 1 to N.
  - Cover: unfixed evidence is Slab/SUnreclaim growth with RET:0, not
    a host OOM. The memcg OOM log is from the patched kernel under
    64M memory.max using poc.static.
  - v2 Link:
    https://lore.kernel.org/all/cover.1788622674.git.zihanx@nebusec.ai/
changes in v2:
  - Drop the shared mr_table refcount / list_del_rcu path that broke
    the ipmr forwarding selftest.
  - Limit the v2 approach to net/ipv6/ip6mr.c.
  - v1 Link:
    https://lore.kernel.org/all/cover.1784795838.git.zihanx@nebusec.ai/

 net/ipv4/ipmr.c      | 3 ++-
 net/ipv4/ipmr_base.c | 2 +-
 net/ipv6/ip6mr.c     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index e5f2b1c6150d2..b9c544d48c452 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -3376,7 +3376,8 @@ int __init ip_mr_init(void)
 {
 	int err;
 
-	mrt_cachep = KMEM_CACHE(mfc_cache, SLAB_HWCACHE_ALIGN | SLAB_PANIC);
+	mrt_cachep = KMEM_CACHE(mfc_cache,
+				SLAB_HWCACHE_ALIGN | SLAB_PANIC | SLAB_ACCOUNT);
 
 	err = register_pernet_subsys(&ipmr_net_ops);
 	if (err)
diff --git a/net/ipv4/ipmr_base.c b/net/ipv4/ipmr_base.c
index 867b24beded11..a0ec6d19a237f 100644
--- a/net/ipv4/ipmr_base.c
+++ b/net/ipv4/ipmr_base.c
@@ -52,7 +52,7 @@ mr_table_alloc(struct net *net, u32 id,
 	struct mr_table *mrt;
 	int err;
 
-	mrt = kzalloc_obj(*mrt);
+	mrt = kzalloc_obj(*mrt, GFP_KERNEL_ACCOUNT);
 	if (!mrt)
 		return ERR_PTR(-ENOMEM);
 	mrt->id = id;
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index 3f2ed9b77deb5..9d8116b5edb17 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1427,7 +1427,7 @@ int __init ip6_mr_init(void)
 {
 	int err;
 
-	mrt_cachep = KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN);
+	mrt_cachep = KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN | SLAB_ACCOUNT);
 	if (!mrt_cachep)
 		return -ENOMEM;
 
base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
-- 
2.43.0

