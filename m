Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29ED4F390F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416138; cv=none; b=P6yjdb7bwkNxKovn2SGJUZKS2t3kkjX/ocvhbeyqmzJWaX7YO9S87ZLqCV+xgdkIZd5CFykWlYoDacxdUOc2maljAbVIeb6leTa9r8ueaMgP+MkLalLIQJh4la8/ABvj1/iTHAml1ArhAjuIPSHCLBVtIsCqPbHWIno7w08FKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416138; c=relaxed/simple;
	bh=Q2eussegMEXlMuB9XaZj3TGeoOrydpSZHsCEsqU8fDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a+haKzqr+mCXxzSlHd2ET5qZ3WO/+hnRpbP088UBiREYmdUzxwNZCbSa9+bemKuq3aIPY7/p9ANxxshewrYL0wW3Pqeda0XAFO5Eo6Mf7XsHUeqmrcP7BKLGgKP6IKuceABHFZSzuxTQ1q5iuVsbeh1iWIPkVobMxTf5DDeGRS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX8kKHFh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX8kKHFh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5fb79ce82so10648035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416136; x=1793020936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Uej8RaCixc8uhONaildvoqjFo40RXd4HoOuIpWKquA=;
        b=kX8kKHFhXb6iyY7oJW0fCoS+ru6ZyQk2RZt3AD8vRAcVfE6wADfZ7RvkRlQk8GGvAM
         uYavu57vUn3mstaWZXIZcPNENZv6EVPkYLxn4NsywM2UQhpC+VTIVoh8Cvs7jQ07zxp+
         IJfPTdrLl7yFtVIePDmZ5grrwINeh3OwBUlBI+vg8rZOzYLa0k6L2G2PAnvlQQIgO6Jt
         6XWgYkvOfp8S84ocpDi6hOT1qRDGwINAWarx4aJgRP1yogggkipgrv7432m6xceZLn/d
         KagAcWuXCiEfosAW+2EmdhEqIBlgDPihq1mWOYzGolyvvo957pEI3FZx6adeXgnyapGh
         qJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416136; x=1793020936;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Uej8RaCixc8uhONaildvoqjFo40RXd4HoOuIpWKquA=;
        b=V25unEoJVWPh5K5711W4piXDn9US83ZD4V2uOD5a6GqsxlSeuNTQ5TfqJgoEWnj/VI
         ygHJhCS3uZMRXPbTX1cqm3eLeiPcAKhaSzjkL9kOkKJfreJMoHK5bjxYK2skwA8iwZEA
         zkbYGrA9jPpnYU9w9unbJyocqKNKQu4k+a/4hnnhtWg3kw/S3auIKRO8QMQqKnd+uOW6
         7yt0znpvTohO/yrU/HDPT+FTM6joDI1Z8OBzYZf936FJGHCQlO4X/xS3wSaVhDm2DKf2
         oJ51zH0lyMlFT5eoZfDfej+Cigb45R5tEnGguORq50pBLUZVlHjoeoDpNEv6x6ih+MzX
         4CTg==
X-Forwarded-Encrypted: i=1; AKwUvBxmfQreK1vVkl4f9KkRbfwDvOXGM/JJOj8lk8lPcelvFH9gaRRsn7PyH07IqmeTPMb07Vq5KRwQsDPeJwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWYwWXsFfknGx10Un8nKvQG5DXyWNdeQ9iDSIk33/GzTErIfjv
	09Cffxm+qpn14VngB+uDuQShgsR1nY5SlNfw1V3zoZdum3deLFj7Sph2
X-Gm-Gg: AYBFou19tRnZbG1XqD6V7m1nziB9JsLWFhCROKPiF5RpTTdRv+Cdyw+IcKGFWRr1Z44
	zUN7YGZqPSvKUKwaI754/CndWIcGA/RwKuh1/FHFlvQc0oNcEbE79vFmbndJEiY69eENH7fiE2M
	joJUwCzawPapAwC1srFkFnFnEg+0wPDh0c4ndj9zs4bCWKbgP927TJbC1w3JlnBoFTXM8kcViUK
	TYq5ad6CQ+wIwHZoW11VWPa8t6ukilZLzPVmVzeMxqGkvycPl5J9CHzo2OENmgeIVSxGa/WAJTG
	eJr6nfSFo9RQ0E7Tk9nhQw9LE7Fs7eQ0hiItbeF4b6HqRX4FOt7NfhY8iy312d6fCoCBqveNCfA
	BR9yFtaqj8B6xnISj1WGRh4OV71QqP857oHq+jUZZnqZMG+DcGOqa/0MvVyfQvXFQ0YrnfoNwtu
	JQvmf/FDucwFDQ6prHlnnvyactZXik4R16Zwdj6VzaU/2SR1pctaWGY/sv2ngOl+ie/Ny++5mOJ
	xfUpQ==
X-Received: by 2002:a17:902:ce11:b0:2e9:4b65:369f with SMTP id d9443c01a7336-2e9a69f2585mr70292505ad.34.1792416136168;
        Mon, 19 Oct 2026 06:22:16 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14ca2496sm782745ad.14.2026.10.19.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:15 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] ipv6: icmp: use skb_dst_dev_net_rcu() for echo reply and unreach
Date: Mon, 19 Oct 2026 21:22:13 +0800
Message-ID: <179241613335.5916.18191480036849517944@whr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

ip6_err_gen_icmpv6_unreach() and icmpv6_echo_reply() derive the network
namespace from the ingress device with dev_net_rcu(skb->dev).

    /* ip6_err_gen_icmpv6_unreach, net/ipv6/icmp.c:885 */
    rt = rt6_lookup(dev_net_rcu(skb->dev), &ipv6_hdr(skb2)->saddr, ...);

    /* icmpv6_echo_reply, net/ipv6/icmp.c:923 */
    struct net *net = dev_net_rcu(skb->dev);

Under a VRF, skb->dev is the VRF master device, so dev_net_rcu(skb->dev)
returns the netns of the master rather than the netns the packet is
destined to.  The route lookup for the unreach and the send policy for
the echo reply (ratelimit, IPsec, route) then run against the wrong
namespace.  The rt6_lookup may miss the route to the source, leaving
skb2->dev unset, and the echo reply is emitted/routed per the ingress
netns instead of the destination netns.

The IPv4 ICMP echo path already uses the destination netns via
skb_dst_dev_net_rcu(skb) (net/ipv4/icmp.c:1123 and :1267), and the IPv6
echo path still uses dev_net_rcu(skb->dev).

Use skb_dst_dev_net_rcu(skb) at both IPv6 sites so the namespace is
taken from the skb destination, matching the IPv4 path.

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 net/ipv6/icmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/icmp.c b/net/ipv6/icmp.c
index efb23807a..de4f39ca0 100644
--- a/net/ipv6/icmp.c
+++ b/net/ipv6/icmp.c
@@ -882,7 +882,7 @@ int ip6_err_gen_icmpv6_unreach(struct sk_buff *skb, int nhs, int type,
 	skb_pull(skb2, nhs);
 	skb_reset_network_header(skb2);
 
-	rt = rt6_lookup(dev_net_rcu(skb->dev), &ipv6_hdr(skb2)->saddr,
+	rt = rt6_lookup(skb_dst_dev_net_rcu(skb), &ipv6_hdr(skb2)->saddr,
 			NULL, 0, skb, 0);
 
 	if (rt && rt->dst.dev)
@@ -920,7 +920,7 @@ EXPORT_SYMBOL(ip6_err_gen_icmpv6_unreach);
 
 static enum skb_drop_reason icmpv6_echo_reply(struct sk_buff *skb)
 {
-	struct net *net = dev_net_rcu(skb->dev);
+	struct net *net = skb_dst_dev_net_rcu(skb);
 	struct sock *sk;
 	struct inet6_dev *idev;
 	struct ipv6_pinfo *np;
