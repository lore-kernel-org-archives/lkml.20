Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848F3B52FF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524459; cv=none; b=psUS7WSvUU8gA/cdRWT8sk9q7FJ7/HPB1tSLNP0TsmlHLIxlDzdZ/+O4Oqc0kFkm6ibtYniK/0inIHOZajycVLtxyVgqiUIwwtgLd+zXTq9oxrE2Z8ekvZ37xnOVpaLU+V6AjVAQ7bUpANt12FxjemRFSL26sbXIIix3kXXO0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524459; c=relaxed/simple;
	bh=MJhf/VdVlwR4/z1tqw+ESVPZyrpQOjiiuMxVZCsI8gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gk6rwCjXjyavzjZjJ+IVs7h3SNUnSg5qMmTdqCWgilPeHr9dBuEtGviLxNdV0TnZfJ9W2g5K1t90j196BUEYW69IKzCWtcknJS1Vxnw99d2341SS5a4Z4fLHz2GTHQ65yzDv64LYYDsX6lZvOgl6egpqpBB4t06GUf5I1Gp+Rpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID1Osszv; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID1Osszv"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso2124472a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524457; x=1792129257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYDcawsl/q6WnSRicggMNThMT7mmzOe7cZcZv/tuVvw=;
        b=ID1OsszvROSLigPfmbh/ftT8d2CfZqzP9bFi5XVjdQNQUUookgLY2RVaIFRhKXL+Sf
         0+1iW1rtiXqrY4r8YHq5Bqdc11gnQJk5ka3icEKozsrDAXq6PX/ynWENVwxEeWrELi1u
         C45ioX08jqlfQJ1AUWUNjpl/JYf5wbD1DGnpuNyE722v0NkRbqMg6Wc7phgGRNC8easZ
         JKILsX2AAyfBvLRnWQx6lUOBpA9sMDMslJ2rtObTP0zd1TZlo+4E8A0ekn2KO4RUM9/S
         r2BhSqxi1FUwo7oV3zR3WmZejpOi4j7SvwZ+6j7lLEt1vmnlPEL1G+PRyroxYzvx0uUO
         5W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524457; x=1792129257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYDcawsl/q6WnSRicggMNThMT7mmzOe7cZcZv/tuVvw=;
        b=HYYuLS88lPygsgu19MOgXcRvZaL3/dsC91x/idjLF+3EjQiVHfqEgfmyncfY5drqud
         B6UJEUD0A1ik9wXTT4tOG2bTYYNfXEQOizb8TLNDH2wo3oihfFj444ot8tRjKmnO1tW+
         l3Mkw3RYxudYzLJFMMqYFdue6yLitS7QMdUdijCvgC7stdlij2GKERejllOfkWZUcqHT
         Ym8guLggG0jtizCRa7GIiX7TpyYQABjdxzBKRqPGOd4YZA6/k3NB61BiNm4uei9qsfYi
         N6JbPyCwKNh9XibVxxAymVsd5joQMZCOWU9mgUwxgrszcjwyXfJhx8K1Y1GEvJcmbgeb
         lAag==
X-Forwarded-Encrypted: i=1; AKwUvBzFddIyQ5eWt817a+/F9Ez6Yhmz5i4bdDHns0WfPAPfgBs5F+yux/eSNcyDZ0m8pSBmLXeckMCfxIV0Hew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc5NDlH/1UX3Y8VsHXGBrMKxekIczXdikMjwwLCbJ1FR2ND/jL
	a9IVA4jUai+qxh855WaqzR7BeeaVTwvHzIMdf6zVlBSEdKgkwwBWibyO
X-Gm-Gg: AYBFou2GpTSJSF1kNOWSQPf+jwRFMJNIlnoVvpMwCGebFizw4uY/7fO6BpyMKnUehnO
	zulhYaqT3CfeMFbgO44Me1iyO6rEdPxzu3PexzNjRvcFa36BpBP9KBjGOSvEVU2xPXkTE9pPQl1
	51AOI+OmIwsLjdZLK7lPW8YNpyoZEzqqHJYPtvNCXZ6zMycrLo0+z4Encu+63YGzJiUHOoRGc1c
	pXPqas36GW7AXS1GipEEJMs6k00HbzfupuWxhS1OntVua7T4zFk9WsYybUEXky+U9wJJ9C7+Dz2
	yG0Dp7KscjAKPfa7N2zLI+6Rq/LKoH3BwGQOsK21u3XJ6jISKcnSaU7/vCnFfwHydV4lmzwP7Na
	EOvAcXwDd3xxKcQQZQXg3YTnJnwUiPSqm/ZrTCmhDCS5VGG1m0HOLmnTXr9t/34JpeNk+Kf9Zpe
	H6qz2MzfcA6H9H8h4eguW6M6Z62KZq42OZz2I9Sxb1Ci7ONwWB+Pv/8HU3403IB391MWLJIZSH7
	A4mrgB4hXE=
X-Received: by 2002:a17:90b:17c8:b0:39e:6c69:7777 with SMTP id 98e67ed59e1d1-3ab3ac63cc1mr876888a91.32.1791524457160;
        Thu, 08 Oct 2026 22:40:57 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm2028695a91.0.2026.10.08.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:40:56 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v3 1/3] ipv6: serialize address publication with device teardown
Date: Fri,  9 Oct 2026 14:40:40 +0900
Message-ID: <20261009054042.272944-2-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009054042.272944-1-4ncienth@gmail.com>
References: <20261009054042.272944-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_add_addr() checks idev state before allocating an ifaddr, but
publishes the object later. addrconf_ifdown() can mark and detach the
idev between the check and publication.

This happens when a non-loopback device MTU falls below IPV6_MIN_MTU. A
forced interleaving published an address on a dead idev, and later device
deletion waited indefinitely for the leaked references.

Protect the dead indication with idev->lock and keep that lock across
both hash and device-list publication. Use READ_ONCE() for the initial
lockless state checks, then recheck both dead and disable_ipv6 before
publishing. If teardown wins, reject the unpublished object.

Fixes: 8814c4b53381 ("[IPV6] ADDRCONF: Convert addrconf_lock to RCU.")
Cc: stable@vger.kernel.org
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c90ee6dd7446cd..77b3b1154d591c 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1095,13 +1095,13 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 		return ERR_PTR(-EADDRNOTAVAIL);
 	}
 
-	if (idev->dead) {
+	if (READ_ONCE(idev->dead)) {
 		NL_SET_ERR_MSG_MOD(extack, "device is going away");
 		err = -ENODEV;
 		goto out;
 	}
 
-	if (idev->cnf.disable_ipv6) {
+	if (READ_ONCE(idev->cnf.disable_ipv6)) {
 		NL_SET_ERR_MSG_MOD(extack, "IPv6 is disabled on this device");
 		err = -EACCES;
 		goto out;
@@ -1168,14 +1168,20 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 
 	rcu_read_lock();
 
-	err = ipv6_add_addr_hash(idev->dev, ifa);
+	write_lock_bh(&idev->lock);
+
+	if (idev->dead)
+		err = -ENODEV;
+	else if (READ_ONCE(idev->cnf.disable_ipv6))
+		err = -EACCES;
+	else
+		err = ipv6_add_addr_hash(idev->dev, ifa);
 	if (err < 0) {
+		write_unlock_bh(&idev->lock);
 		rcu_read_unlock();
 		goto out;
 	}
 
-	write_lock_bh(&idev->lock);
-
 	/* Add to inet6_dev unicast addr list. */
 	ipv6_link_dev_addr(idev, ifa);
 
@@ -3897,7 +3903,9 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 	 *	   Do not dev_put!
 	 */
 	if (unregister) {
+		write_lock_bh(&idev->lock);
 		WRITE_ONCE(idev->dead, 1);
+		write_unlock_bh(&idev->lock);
 
 		/* protected by rtnl_lock */
 		RCU_INIT_POINTER(dev->ip6_ptr, NULL);
-- 
2.55.0

