Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EFB4F30E9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416146; cv=none; b=GUJ9xDydUVM0x3PVopLYNK3iqprQ/I4OKiPqq/DbSOp2TQE8TdwH8C0TInwWxgiQS37svp5tA/Mi3JKFDIdiXSzpxyBXR6a40rk09XsYntk2IsldaUsOVa3zantiZLpwwN3Q1JISstg4vywvbuM/KpcyAogmsfQHY/tALzsFz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416146; c=relaxed/simple;
	bh=Y3HX3g0lpxIxkV4ib/pssKJyE3f5VJM5KbpNGYoLHFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U7Jc9zmiW1NkfH8PAyGo+oDSGwDS7M9v0EHUmLXtPqq8OUEkZypsxM1zpuIT/IuvKZqns93WW2+nT9wwyA/EbDk725rIfomG2Pxmgar+nzqwZu8XBo4KLEzDI6Rfpg2R1tQkn/vIn350hR+4sDnCyuZdXkPcbQ7k3Nzm4AscS6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGKlUdrL; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGKlUdrL"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a706146559so1634937a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416143; x=1793020943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88uXbX/jv9pcVoHDV2x+38VZZBZoNn3Hj1HsL+yQOPU=;
        b=NGKlUdrLZJCq1PJff8YhIzV5SQ7qyIkWuVSnGpcIOe8sJiikFpWAfE7n6xaTDrA0QC
         hLa2t7juvYx6ltqFvb94yjwxuWKF82V97VKVrAOy8D+zQhs+Yx/9g9zyC0Um+qtjqHqe
         Cl5tTOYVBGwkyCMDy8rSsMvsRPKiQ+Z6MsOc2399IEiMKtyqHelfpYvo0OkkFt8rrLM1
         1UBgvsV58h76+npdcLchDBy+Q0rDonjvUT7nQlpz7v02PK/4kGtFJSMdQGN5qxkjfQOD
         6R5izCI4bk8CfkzXw3WHNf63K3SbOsnXKE+GeeZw9Fd5HZOuMQVKegupwVElmS51fKe9
         MbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416143; x=1793020943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88uXbX/jv9pcVoHDV2x+38VZZBZoNn3Hj1HsL+yQOPU=;
        b=BdClpAUabNDaCZbC57vtT42oIUX83YTy9oftWQ9obyCd3K2u/5jFyrcMbJrrJF+jHU
         6ShfjcK9a1a7dJzYXMt6wPI088mr9MjuzUES6JcaqT2MFwNeW+Ur5acXi/NttSkiaF5z
         5qju8FTuaIPtF/SbdhdEiRuQVDhAWn1DQRw6uAErv4lZu4IA0iah9UF1Ureuz19yauxc
         7pF4LIqY28fQlMeV8EQbeaJPzhkba+ZDSLfI9lFW2MU2wwEHJ5ZCuzIUFmZB5Z165Z97
         9jH5tzycsUwGFIDPvsb6kjAEgcscyytsKDNZhN7ZUbWz9/Jk/ObyKGddwns1HERlhiFM
         cZNg==
X-Forwarded-Encrypted: i=1; AKwUvBxHDHPSYVoH4+i5+X5dZoyL1poKC+H8YzLBmRbtYgcOItYKNLWUQbYQrskbkjz/qlS8RrDDBfz5CqNsUiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEdirjI5tS94NvluvL0Mk/zrOFeh3iMkAR7ctQFuaSyY2975d1
	uFSFYIWmPV7luYirzZqJyhKGz64o5L0zQwaEEGJq4Uj83Tnw2qdQoo/1eeP+D0YZ7Ws=
X-Gm-Gg: AYBFou2FgpAXkVk104XjpXGZXR2bN8ljJNaL95JkusJYwUqNaapng4tNWYj3lrXxoXo
	qTnD+6psODCgrjjRgZ66IoHU8J71WZmldZKLqlw6WYuiZQrXVRAW3pS8dVYRboF17qWzLvMvipb
	P1N+EMZX/eShZ87nkyuRC8jc7iuSMybvgAJwuURvT2AxLRV26mJF6wYcbxUM/l6hhBWxb3T6pW3
	Do5gYz70G+2COEFWIIZNlp12zFdhZUKW8n2PIrTKXFDMQudJLvMOa6If+W3p62SqWfCG1LQQ6Fa
	0IdgLZK1oJJvliQceQU66Pml21ZmDsJQekLWGAdMjCuYoREZ8zKnCDs5zQVmsgekQGXehFd7eUr
	94BDspyL5Q8DxCdLQAzUw5annE4gg9tqV9UdZxj0hZkrKcCcHME6Gr5a3CHc0bYY8TXGqF6ekMo
	FHW6z4oFvtrQ4+uuKplG9C2FLNlbZTUXRT77ARue7QEE9nR480AwQ6l1lIVlRRTMUhc8kKIRsm2
	g8ogw==
X-Received: by 2002:a17:90b:17c5:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3acef17909emr7226702a91.24.1792416143321;
        Mon, 19 Oct 2026 06:22:23 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3c8e2c9sm6505875a91.2.2026.10.19.06.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:22 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] ipv4: icmp: use skb_dst_dev_net_rcu() in icmp_build_probe
Date: Mon, 19 Oct 2026 21:22:20 +0800
Message-ID: <179241614083.5916.6651154069510905781@whr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

icmp_build_probe() derives the network namespace from the ingress device.

    /* net/ipv4/icmp.c:1296 */
    struct net *net = dev_net_rcu(skb->dev);

The ICMP Extended Echo (RFC 8335) PROBE replies identify the queried
interface by name/index/address and should look it up and apply policy
in the netns the packet is destined to, not the netns of the ingress
device.  Under a VRF, skb->dev is the VRF master, so dev_net_rcu(skb->dev)
returns the master's netns and the device lookup / reply policy run in
the wrong namespace.

The rest of the IPv4 ICMP echo path already uses skb_dst_dev_net_rcu(skb)
(net/ipv4/icmp.c:1123, :1267, :1437), while icmp_build_probe() is the
exception.


Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 net/ipv4/icmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/icmp.c b/net/ipv4/icmp.c
index 90c0e22c2..a577dfc65 100644
--- a/net/ipv4/icmp.c
+++ b/net/ipv4/icmp.c
@@ -1293,7 +1293,7 @@ static enum skb_drop_reason icmp_echo(struct sk_buff *skb)
 
 bool icmp_build_probe(struct sk_buff *skb, struct icmphdr *icmphdr)
 {
-	struct net *net = dev_net_rcu(skb->dev);
+	struct net *net = skb_dst_dev_net_rcu(skb);
 	struct icmp_ext_hdr *ext_hdr, _ext_hdr;
 	struct icmp_ext_echo_iio *iio, _iio;
 	struct inet6_dev *in6_dev;
