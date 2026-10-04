Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070648095E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139022; cv=none; b=aUUTUKSUDjcPpT+I5C9wTJo/FSukd9WnVvt8sGxQtbGyn7ljNWWydzQ314HH1IHbnO2wwCDCyAuvOMYa788pdyfFe1gyC72sSdPmKbMlPg0s7vLznXhdOeJS+lLx9EC66MGlK6VV+2lKnkU0CGE2q8plSW6gWR/pGQuAMErwQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139022; c=relaxed/simple;
	bh=WfeXK5AKDpb64C1NC+XtmGSUdPRTL3vW3SWE84o+1Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5uZNHi6BZk9XvRttx66K6ESZQvJZXNN56qAvB3bYKucTaa4G7wOntGtmMITyMf9bkwPcKJj14D3dU3tRDqeR33aPL6YDSxwPf/blAkLPcld8CsDHBWSzLT42BlcSZoC1f6cn4fFoi7BkgyJueJJsKihkFLr4NgHWWb0OLIboQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSEF8Q07; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSEF8Q07"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so377416a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139020; x=1791743820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/aRpqoHc1hrkg65nOx0P5OCRcv0ieiLuPj75uB2KS8=;
        b=dSEF8Q07cSD6D2Lyy02pcHv7+G4+9+5Nqb8gb8/QTI7xHOvaallksLd5GJ2nmjQEVE
         PsAa/lXfw5/3gMf6AhfNF7G9NxY6WpGXx24c1WIZIAp0gq8uXpfX4VGSzAVbLxud2zEr
         LAlpkqgWBkrpXV1zQ9yAjZQcAdd/CD5CG21DyHBfAxD+lsMdPZNlkAp3buMJHRn5xcat
         umo6u7BOIf0IrcjTsPn6v7eBFK6NsTJvd57Vp4k7+KqTyVm8BB4jLzufk0G+162rSFgM
         5a3h8XEoIHwzqxZayF/DTHd0lDu2ZXzdza92xoZbLOguOEFL+CtlLgHv8I/uq4V0G1V/
         mOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139020; x=1791743820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/aRpqoHc1hrkg65nOx0P5OCRcv0ieiLuPj75uB2KS8=;
        b=vTfI3kGV6kHQ9tHdhdb1eoMCBORQ+wrZS5/S6PWyTeAaIn+tuh02xI7CukXtsFVk/D
         7/SFbdrVVSrQav8OM/9Jd8p+iSn7EM1EERO/Tzvw4748xdwFTBXqTkTHLlnYdfoe0bVG
         JSDCSrQ7XABGa3ni7u0673DTrEppqfZ6t2NaXBBKXnGF4YcMNQHH0jJOfhLawVDxyb2N
         AW1+KKLC/Xp2y58RpzGjZkbFeRq4ArTQ99BfbMhSg1LHpwACGw4iIQrun/pqEY/LdiLm
         x2iSUndjlyO9ngcnrBI8KGNK+tWqH7cQ7eTfhNh/CD49hVDGuY1XAk6TqgPYBseNrulH
         pQGg==
X-Forwarded-Encrypted: i=1; AKwUvBy/9n3bJVJRTVn4gsZ8/IX+176i1cSi38ArOp2I5cybhzIP9E+54PmK+e9afORPef6vaNEvoZ70lcNTQtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPqPTDD/LK/T06JMx14wVEEnmqe4UlfUJmWxR0lNQuL/wCiLTX
	+3C+QDFLR2oYLdHa62hbHKFJ1HkbVp5MJzswzOUmUyEAtJZePqx9pya+83S7yyNg
X-Gm-Gg: AYBFou2CAFpwvIWi0FS7t5nxt9mzMHYlNGFFSaetSDEq6diE2e2JXmoXg1bgMQa+9BV
	Hca2K070HgRF4vw2FSuhpq/y0YpEuSSKqOryvEd5L3/AMnGScO3vyo88uYvxyR+yhRPaw4IpoJq
	2MTOoR8jZ3cf7a3yote6A3lNkNGcyGgH9rTjA9tJYWaGOXdVdYivarAXbYUXqFufNtlAz3rqGJh
	4DqQ3gVJihEL+h7gLzHzktXiKgUPWqQOUQMFwU03ppKi58PciYE4ba9dR3wTwv3ElOEOfOVKGbW
	N54epJegk+z6A/w6+4GijpQnoQ3WKxws110GBHvWazNskzIFIeWwXrMmJo+2Yy6svljYAg4DPOb
	FeTP3FLPCZ1NHpWw7BrytILx57PrEmtqy7su96E0PqXfk072OiwN/eRuSGJceHk41NN6RaF2T8f
	vQlUWIOnSSDyDifPnQirNBTiExykCkH1+A7/c7e0MbcV6PscSo9hyYnU5pda3ynW3uf+kB4HgJ9
	FzysfWX23M=
X-Received: by 2002:a17:90b:52c7:b0:3a7:f45:5cb8 with SMTP id 98e67ed59e1d1-3a70f456892mr2770926a91.23.1791139020479;
        Sun, 04 Oct 2026 11:37:00 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262cfsm7522854a91.6.2026.10.04.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:37:00 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] ipv6: remove ifaddr from hash during ifdown list cleanup
Date: Mon,  5 Oct 2026 03:36:39 +0900
Message-ID: <20261004183639.3773498-3-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004183639.3773498-1-4ncienth@gmail.com>
References: <20261004183639.3773498-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

addrconf_ifdown() clears the address hash before snapshotting the
per-device address list. When the device is not unregistered, a
concurrent ipv6_add_addr() can publish an address after the hash scan and
before the list snapshot.

The ifdown path then removes the address from the device list and drops
its last reference while it is still linked in the hash. This triggers
the WARN_ON() in inet6_ifa_finish_destroy().

Remove each non-kept address from the hash before marking it dead,
notifying listeners and removing it from the device list.
hlist_del_init_rcu() is safe when the earlier hash scan already removed
the address.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/r/20261004135117.GA206930@shredder
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 426739abb07440..309c49b2141563 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3996,6 +3996,12 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 		keep = keep_addr && (ifa->flags & IFA_F_PERMANENT) &&
 			!addr_is_local(&ifa->addr);
 
+		if (!keep) {
+			spin_lock_bh(&net->ipv6.addrconf_hash_lock);
+			hlist_del_init_rcu(&ifa->addr_lst);
+			spin_unlock_bh(&net->ipv6.addrconf_hash_lock);
+		}
+
 		spin_lock_bh(&ifa->lock);
 
 		if (keep) {
-- 
2.55.0

