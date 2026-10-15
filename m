Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249C3E4118
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040848; cv=none; b=I72QBbFBW0IHCFS7J8XXPhmPwPNwtwuZZdUMHRuAUau1j7VVHZdxSSZsGN4tj+WyvMqliy8K++wJTf8OsHARp2saANgDLpQqTaGC9EzEQI1uIOD8M8E2nUQtMyFkI9xsJ3McNksrfCwwUKy9OA77i2314fnNXRlUS51ZaxsWKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040848; c=relaxed/simple;
	bh=Dpf1OL8eEQDvT3Yz4oFpKfSPnZF5935fgwHaPMTq0Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U00+nOXs0VvPJSecRSgi2X6gMsawaww4Fc9TDb+UFX7T/PsVBWowKy59nGCgXISgxGEL4nThUvgXuSSaYuYMnqbFX/xdp5Cc1+/CKEcVR7YOQ7ud4Pr5Gn9W8agXlc4I/nwOvmR701kkPntTYKuL95QRC9ElR2e7RSx5gix6SiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffO99sDZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffO99sDZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2766148a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040845; x=1792645645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sciRHkHVn7be+OO9D5ChqaCTElZLHKxLZIrTSsDdMj0=;
        b=ffO99sDZ0GWIwEs9Ei73VNGOg4bxluVPx+CGsWJt4r5uHCIhPMXMQvZuq7MjU2jyJm
         ArH6vku6/HpiSLd18ihElD42ZQRKZPphK6uyntLjvv7KDSuXGDthfX+SZMFK7menUEWQ
         ETWgAm9TMtWFqn5zpwnIMdACDBXzr44mTDLWOta6GPijRDxGsITs/4WNwaYG7kkVk6FB
         zvY89EuLwVeNdN8k3GZeR6Kp6RavR4Rra+JbTCshf/bKzYkFTorn8FdDSfHwkyX0MxOM
         F0RRh3PmdxvVzjKRqGNJRU437ZDM2dvNNFFuV0fV3vJLGlw1BRTRWKdRW/UVA7iXF6s1
         PlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040845; x=1792645645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sciRHkHVn7be+OO9D5ChqaCTElZLHKxLZIrTSsDdMj0=;
        b=l1510Md2nxHZzR9qM8YulO/5mS6VPwvz8qtpzpgG5tp3f0YSH1HTgVNiDUQDya1Hcz
         b69VHF1GkrKd7Dw/IqsgNPcE9fUy3eafvz/z6Jt8Gbnil28Uxe23vfDC0dof25RNsgfc
         8xVRih4CRowFZT3PX25krAKIpOvWi7WFq15Jz0E2sptypFGDWug0r+8boYGMixAM0Mx8
         OET6fNV85PCGEIhGDdEFSwl/M+rH0Nx2yfFN7hQADmowEUAi1Z1NMxeu5oEqr7AI5h0J
         unX/nH0RE7PkZLmzI4rD7W5zdiYDb6lfDxim4IbmnJHX9/VdA8n9bp4vMc8ZJGEMiuXG
         ylgA==
X-Forwarded-Encrypted: i=1; AKwUvBw9SRdBRnahSYe0yInxYIFF0M6wcatSLs+HPnhN7MKyxKknkAHcS2hXQuZkv350Yy+hEj6uGhaPrFCZUsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwAYkSVlJtEPSu6eQc3Dnc8o6vK4+Avs1aL5oW4oc43nWJU595
	/0UFJ8S8j2ejKnauoFA/JjV4gcRhwNPzlDdovQVXhJkcJoXLEuKIXwB8A6/DR8Jo
X-Gm-Gg: AYBFou0SeZWmyBrERM5XmbZF00nSTlc1Sj/5j4mHdlqyqRvpVMfZQnmfC6jLlai+y1l
	CoQ8+BcjIgr5wqtQSrmIQya5PXYTzPGNZLf3aq1QvFO9OhsXwURC6tih+mFpNRbcqF1A85GxCu9
	l6G0RJZ1TSFdTziTKuJFpB63wPXgfhHPJ2af8WjneMv1mVGPAPVW6qV2/FXQG/vDGRVQUF9hrao
	/mTKiB+MU88QOINLQvgmXIJkuyGVbnIymJp5v5zTi9fZSlR9yMSuxTFBfU3e64K2YXelZM9PL2M
	MD+/VeDYcNimh+gf8SnzyOp9Jcp1i9WjbB2RKG5voF6xQP2oLnc0DJ2mMFUT3ZgbdLEsctvdQ3p
	5aNuSxfhG77BNJbFkquNAzXJspk2ja0V0s5GiYPzF0nL4WU9v65JsIac+xF+FJsHPPCIXYP2n3H
	s9s0uv2ahRLdHczkWWg295coAq4QzD6H92zdDGeM/tyqBUvrQizrurOhETk3YOjhOZJfav7EPla
	WZqHtbDL9I=
X-Received: by 2002:a17:90b:4d85:b0:3a4:c946:9f4e with SMTP id 98e67ed59e1d1-3ab3acdc386mr14227232a91.58.1792040845490;
        Wed, 14 Oct 2026 22:07:25 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm2548033a91.13.2026.10.14.22.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:07:24 -0700 (PDT)
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
Subject: [PATCH net v4 4/4] ipv6: do not restart DAD for a dead ifaddr
Date: Thu, 15 Oct 2026 14:06:51 +0900
Message-ID: <20261015050651.1841557-5-4ncienth@gmail.com>
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

addrconf_dad_failure() can create a stable-privacy replacement without
RTNL. After ipv6_add_addr() publishes it, addrconf_ifdown() can mark the
new ifaddr DEAD, clear its route, and unlink it before the recovery path
takes ifp2->lock.

The recovery path then unconditionally changes the state back to PREDAD
and queues delayed DAD work. The MTU teardown path can leave IF_READY
set. For an optimistic address, addrconf_dad_begin() can consequently
pass the cleared NULL route to ip6_ins_rt().

This follow-on was found by source review and was not separately
triggered at runtime.

The new ifaddr is already initialized in PREDAD. Under ifp2->lock, record
the retry and queue DAD only if teardown has not changed the state to
DEAD. If teardown wins after this check, the work observes DEAD and exits
without reviving the address.

This complements the existing lock_errdad check that preserves the original
ifaddr's DEAD state after the same function reacquires its lock.

Fixes: 5f40ef77adb2 ("ipv6: do retries on stable privacy addresses")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/r/179161099408.434549.14449036924552933828@kernel.org
Link: https://lore.kernel.org/r/20260513025509.3776405-1-lilinmao@kylinos.cn
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index df566681226195..a2d3fb187f7684 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -2198,6 +2198,7 @@ void addrconf_dad_failure(struct sk_buff *skb, struct inet6_ifaddr *ifp)
 			     ifp->idev->dev->name, &ifp->addr, eth_hdr(skb)->h_source);
 
 	if (ifp->flags & IFA_F_STABLE_PRIVACY) {
+		bool start_dad = false;
 		struct in6_addr new_addr;
 		struct inet6_ifaddr *ifp2;
 		int retries = ifp->stable_privacy_retry + 1;
@@ -2236,11 +2237,14 @@ void addrconf_dad_failure(struct sk_buff *skb, struct inet6_ifaddr *ifp)
 			goto lock_errdad;
 
 		spin_lock_bh(&ifp2->lock);
-		ifp2->stable_privacy_retry = retries;
-		ifp2->state = INET6_IFADDR_STATE_PREDAD;
+		if (ifp2->state != INET6_IFADDR_STATE_DEAD) {
+			ifp2->stable_privacy_retry = retries;
+			start_dad = true;
+		}
 		spin_unlock_bh(&ifp2->lock);
 
-		addrconf_mod_dad_work(ifp2, net->ipv6.sysctl.idgen_delay);
+		if (start_dad)
+			addrconf_mod_dad_work(ifp2, net->ipv6.sysctl.idgen_delay);
 		in6_ifa_put(ifp2);
 lock_errdad:
 		spin_lock_bh(&ifp->lock);
-- 
2.55.0

