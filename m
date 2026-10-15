Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB13E1D08
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040844; cv=none; b=XP3MCiL+doAFg5iyXe2JqYef6LXn5gwe9Y5HuyervGFK7nuMXubpD5HeQb00DQaJ1P7UCNE7OhyrU+vsihrA6e901FN6U3FGPD5Ay48ecdFNa431WIzcWozQ0YD/ocWliPqXdLYJUZZ/YPXVJWmeoo13OR3d2SzcMn/nzuH+AtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040844; c=relaxed/simple;
	bh=5QnK27Mi4gF8Os92Ye4At3N2Dx/p3ENx/C7QLtY+b8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYY2CV4qYHfTK+/ecHaZwbg2CECsq66qFgUUAMJAKy8TFet+GoRnhkcFgA2aP7UQnt2VQ+sj6p7AIQPSI0lh5TCUb6oAJ+PDdAvBJTdz5hA1ggm4ZHnHEPibU+f/g9wp9iDYfA3r/7wUVvuANFLIqDK8qckO1M3+dwtDMRce8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG3eBLD9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG3eBLD9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2275165a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040841; x=1792645641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrMZ1EzhfMYxX8A1FtoB4N7lHSMJS/8Ps17souRyYLQ=;
        b=rG3eBLD9Q9QV2kmDUtB7TjfJUYRVf6T13dwlx9AeQPMVwBein7YlbLsFpIg7fkKEkF
         iV7pK5MMKaJKoYW+O6QZ+4Bq88Dru0fjz64K707DDqwEUSeI57Gtfx6rgpSbXp30hZtr
         1FPGD3RdfY9TEF0PS9n5h+SkFFeuA3QYayE9TqPkcPD7NRq+fBRno7gSmh9G0s6cBPyC
         VBd+q4ULdU/B5pX7Qs7rreMh/lXSYlGtrzlDwYRwWgUGYkcIM8qzJ985u8c3otqYFm+y
         yAQsdNJeKn6U4CK4CXZRd0PUz0cc5sDdhH0SYNlfOtmZhNhJ/gf/66JwFGMdIsvPZiaf
         EdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040841; x=1792645641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrMZ1EzhfMYxX8A1FtoB4N7lHSMJS/8Ps17souRyYLQ=;
        b=JPb3mtVMmonFs5U5LA1llpl5sZKQTMmu4e5TEI99Mv3QooZVcLCwJp9jf2Fs9MpTqt
         FaVlw0Uz9FVD9XINKsSY2b8hJ+5BadFd2hCuZahwlyz6Oqkkc9vMe8j149DFQzI6+IHx
         tIWuj/2haqu0XLQD+iwIDLBKcTcG9A/RfuGcyp1XESEKs9yT0mpCHY9fxOYTg3f/aLdx
         smdKv6IO52Ybz3x42pfBgAxleJevo79UpxAuGoMn8AQMcL8l5pRy0/ba6j+FVnGQx4o6
         ZntxD6GD4GlHeekIJgv2MsMuttzIdu6h+SDIvAOygo3IfUC8md1biYPQ4jv/yDoitC4Z
         jU1g==
X-Forwarded-Encrypted: i=1; AKwUvBzNtjbR6npZCHknpi2fy1fbS/cI88ftbSUMwk5i6zGVH9Ub7J+PMZDFt5ii3Cl8VWzUmVV02Ax7RZyW9iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMeUY+myOVHZ+Ei8mN1Pc7lqdbeai1lxAFOK/dwoOyZC/YRMAv
	6lPGfBBHOcKx70atGPfw6dDMjpZkhf9x9O3pAc24zT8TAmhnRS0VgBZH
X-Gm-Gg: AYBFou3D+IOgB0Qf2jVqwF6KrXFee6t23biAU1uebKQIG27BZ3tUHJpQuwGebTdlwwo
	39GPROWgtYuBaYrLMg7J/0VEmKEKy3kjTnjk0inARLH7Bk740jAxuspGkh/bBnCNnkxvkbGYHp7
	c9Qv4Vib7+Lm3PgDaMi60uGlvhhD7grWtVn2Zf5RcnyG9K4/kikUM7tEYIa2BxYleZ2SQPU+d4r
	oCJ36vz9dCT6BjImysazWrbTqW34ChOIVERyuppuUaC1jsfs1o8DXUSHjquZmLXHXF6+Mk10YoW
	Da2bYBNR2tM/d6EI4PrLlICZxgihT7rPcjrENM332cDQvNIQgRq7g8JQNEOFpr8ydChhgKKqYak
	3Duvr8L1D3HfB838i9rr7cfxxT+QUsFNuUxIZrIc738inDasfAgTbsjTbPoNQstanP0FEgnnHz+
	4exD5ksWCHBv54qrHXdZ7tTlseaBFMZnpjaPdV5NgKWE4nLIc4G1RUQD5h1yQdov0MzWzLHXvUq
	6NkJ5QFgAj6WgxNtwIM5w==
X-Received: by 2002:a17:90b:5823:b0:3a7:cffb:8b96 with SMTP id 98e67ed59e1d1-3ab3a60f9aamr15354818a91.18.1792040841080;
        Wed, 14 Oct 2026 22:07:21 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm2548033a91.13.2026.10.14.22.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:07:19 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v4 3/4] ipv6: initialize temporary ifaddr before publication
Date: Thu, 15 Oct 2026 14:06:50 +0900
Message-ID: <20261015050651.1841557-4-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015050651.1841557-1-4ncienth@gmail.com>
References: <20261015050651.1841557-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_create_tempaddr() holds a reference to the public ifaddr, publishes
the new temporary address through ipv6_add_addr(), and only then stores
the reference and final timestamps.

addrconf_ifdown() can remove the temporary address before ifpub is
stored, leaking the public ifaddr reference. Publishing ifpub alone is
insufficient: manage_tempaddrs() can then find the object before cstamp
and tstamp are final, update its lifetimes, and have the constructor
overwrite its timestamp with an older value.

This follow-on was found by source review and was not separately
triggered at runtime.

Pass the public ifaddr and both timestamps in ifa6_config. Initialize all
three fields before adding the temporary address to either the hash or
per-device lists. On success the existing public-ifaddr reference
transfers to the temporary object. On error it remains owned and released
by ipv6_create_tempaddr().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/r/179122559913.434549.12720841717630168470@kernel.org
Link: https://lore.kernel.org/r/179161099665.434549.5858601179492551889@kernel.org
Link: https://lore.kernel.org/r/20261007164548.GA1153540@shredder
Link: https://lore.kernel.org/r/20261012145240.GA779501@shredder
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 include/net/addrconf.h |  3 +++
 net/ipv6/addrconf.c    | 20 +++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/net/addrconf.h b/include/net/addrconf.h
index e6764245995f25..6818057cf72750 100644
--- a/include/net/addrconf.h
+++ b/include/net/addrconf.h
@@ -81,6 +81,9 @@ struct ifa6_config {
 	u8			ifa_proto;
 
 	const struct in6_addr	*peer_pfx;
+	struct inet6_ifaddr	*ifpub;
+	unsigned long		cstamp;
+	unsigned long		tstamp;
 
 	u32			rt_priority;
 	u32			ifa_flags;
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 3bede30d4e989b..df566681226195 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1155,10 +1155,19 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 		ifa->flags |= IFA_F_TENTATIVE;
 	ifa->valid_lft = cfg->valid_lft;
 	ifa->prefered_lft = cfg->preferred_lft;
-	ifa->cstamp = ifa->tstamp = jiffies;
 	ifa->tokenized = false;
 
 	ifa->rt = f6i;
+	ifa->ifpub = cfg->ifpub;
+	if (cfg->ifpub) {
+		ifa->cstamp = cfg->cstamp;
+		ifa->tstamp = cfg->tstamp;
+	} else {
+		unsigned long now = jiffies;
+
+		ifa->cstamp = now;
+		ifa->tstamp = now;
+	}
 
 	ifa->idev = idev;
 	in6_dev_hold(idev);
@@ -1491,6 +1500,9 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 
 	cfg.pfx = &addr;
 	cfg.scope = ipv6_addr_scope(cfg.pfx);
+	cfg.ifpub = ifp;
+	cfg.cstamp = now;
+	cfg.tstamp = tmp_tstamp;
 
 	ift = ipv6_add_addr(idev, &cfg, block, NULL);
 	if (IS_ERR(ift)) {
@@ -1501,12 +1513,6 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
 		goto retry;
 	}
 
-	spin_lock_bh(&ift->lock);
-	ift->ifpub = ifp;
-	ift->cstamp = now;
-	ift->tstamp = tmp_tstamp;
-	spin_unlock_bh(&ift->lock);
-
 	addrconf_dad_start(ift);
 	in6_ifa_put(ift);
 	in6_dev_put(idev);
-- 
2.55.0

