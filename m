Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892541;
	b=Tj9o9ld+dmw6555Fb+L2JqoAR0aMcufoP577lNp67EIUJ6sJkKHp/BXb9WzIVHxEEeEI
	 x8+8Ym7chIbDktv19z07OjqRjfRSrwuQwbzmcLE5sk/aZ7ptHx9wyGof/OPcR1ryw9kKA
	 nBGvrJs2GwdIpgSdKVu2Mgk8JYQfGawjrOytHBDjB5GvpXL0hJOXLhpDHsD3OfIfmZXKZ
	 LbqOUocHzVnNrQ1Ew602KGn5vksBA9qcV3H27XThwghYJmZC33DH9+f2LjcP3kJSLcFkz
	 fylQgYreWUQrw1K7kTvb/Xp2DVoBoT0K1KFxCx1DwUjdkmPWIWY+6FfwzpVuYlJrTsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dZbB4hhU2IE0sHrZa2I9trvn+/ikExiKVWO59OUCjaE=;
	b=hRL0pvG/aVRWaqQKAjPjZqy/9omcqoeqWu0Wos2b/m51xmGfoB9RR5r+iFri8kiz10h4
	 b6T0mTnQaeSVcBoO4Q9YmTuf2hGwYlItEiQN9MOSDbMtJmkES/nx2Ep+NqB+lvI3tRWbh
	 ctocsjvFPOKSv00PV0GlFYmCq844K/KaJBuCroLbEcaIR9buoHVegS776RVZ6qqyDQdny
	 bbRjt7gD2i0dalV8jxLoRpqs3HYb0xT8E0el0KJGv+HgCmp2la+EEbPzmF+jXKXNuU1dv
	 ZL54O2k7vAx/QPSuUC7KLwCdOyfiW5EF1sb4zjN2Lgh3NOBcsUqZSqqA6yw3SozHIPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EXBv1B0G;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B68606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37B68606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=EXBv1B0G
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c162febb9so19899196d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892539; x=1794497339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZbB4hhU2IE0sHrZa2I9trvn+/ikExiKVWO59OUCjaE=;
        b=EXBv1B0GOuBPd/6seiYHJ593Pc80qqVWxzbKmGlPS2RsN3H6x38mdg5qtLYdkB3/Qe
         J8rkN3snCJq4vYIVSWg4XF7sSQHP5DNMOSPh6/lX4qjvjnfzmHYYYWmOJFDXiKov1txG
         pGVcRzYF+kllUglnac2Yk7UF92XjJuZ1Vr4Z4iLZ7GJwTdZk3eUVYEXZlh5PT7Z4PZaC
         riLRASQkM7asyx7QamxjXz0S1OWeXR5D07UwC7Du4BFzcLYDe6znkGJUgvzSDAvKH90I
         EPMRnDi9Oxc9eTQMUW30d2wxpaDbUjqqduP9ST+xPJxAn5aFrsa/hwgA15NidGN0qczG
         pgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892539; x=1794497339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZbB4hhU2IE0sHrZa2I9trvn+/ikExiKVWO59OUCjaE=;
        b=eVOPi1FNiiAiwU5wqJeh8/lEkfuTuJq/h29GnzhkwU6INp6KFbYnt/lvKfS24pK77n
         BCzduPqx3E5k18yaJzAUWorDHPfH9gWRoWnyVN11fMLBa0lkPnL75Kefe6vlF9bH7RpK
         72mEbUAtHf1XQTiPtG+8rT4lCeiaEHF3jwiNI4a0RjGIYh2W5PXyf0ARvlV9azBRR4qX
         5FPJAk2R70Flvvqs3wUNXH4zcMVlsW58KPThWs9aiU4Cgn6Bsjr6rffAjCUzpXp0qkIX
         Q2u+jqD7lMAtmhOmVWfy5hSEKZrhlz8aQ8908XSWaZ481CJhmO80IcXK3LwDW75lH4PO
         dyjg==
X-Forwarded-Encrypted: i=1; AKwUvByskS/j8W4E7dt13QOYWdQ5PnmnJhUMDj6jMmPMQt2NKZ83aOiTCl2w9Eixt9J98J6yuumssGTdLGJzv9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LU3LGQ+J+iqR/2b9LZIygZ8JrL8E4FeyfSU6wBmJt+iQKPttE
	uqM1tUeR38pGtGOAOJqzeLHkkDOwbJoBdU5Iztr5el6gNwMIVk7TFHNZUq8PWa33fcbBNj0COgT
	PhF02xcwggA==
X-Gm-Gg: AYBFou1fyCkhgOoumUj/WH7lD8AxSHtnvmzYiskKyNFiGG6IHG0I9EmzPP+h6W+FMez
	1iKusGI2Thr8FkVzCNkd4zDMsZfqEctqdejPqcOFtMOddr3ogZ4vxX5ALnnHrVFwGzy9Qg4EsSo
	zjKQa2hoR6GqE4q4jl3KCiNZy3IheeeeNACgH/SZFlgzbdRxmYUXn97mhlCDeFXnxcgnpaRN9F/
	Uvxe3L1NeiSvS/esLPyujXtZhiuazeNNA89lHylIOIoGGVqcSKnCFXaRxAwFPOp82acml1iibHr
	n2led8a4w7v1FIk6qEHkhFFav7QBuP2dYQQwKmgoSQ2Jw9Pfi7lTuIin1iZcT0p5LBt+EM0n+cc
	9+yUYxZ+EPJvbK36o3YdKDZmgxiBV3ZctmO0lQ7lBstEiH3HSfpa8wUGOQY5Y7Np7DMAFIXMi+w
	Tq7wF5gnDTTJDyzunVphcEgSqKYU+b7ojAb8CkKG3cw0m8o9mZr6ZeWSB2NvBbh/5wWaN04B8Aq
	JLyvfo9upUC8ltzH/LWEF/Ay7UgJSdqqL4vW3c956XCdpADrZXRZtkzqL7/BUTOGMLDc6ZOd742
	oZQAT36TrDFLMwAJ/ji6JZ4FS41UhNe0gkEBOUWKcr7vXQ==
X-Received: by 2002:a05:6214:21e5:b0:91b:5d3a:f136 with SMTP id 6a1803df08f44-91ca4b8303emr313913766d6.53.1793892539191;
        Thu, 05 Nov 2026 07:28:59 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9f2a9bedsm9825286d6.35.2026.11.05.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:28:58 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:10 +0000
Subject: [PATCH RFC v3 78/90] netfilter: use net_may() for configuration
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-78-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=5157;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ubJX8/CTpojFjSQ0swLThl496WqpHC6Xrw+LQLb1+3U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFtatf5IpP8SAXp6m5LuGdsX9uUOmR/5H0y7Mwvi61Y/EX4xyTOBZpq9+2LRQ2YvAerqPYAOo5f
 0Gd2BCnL0Vwo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Userspace configures netfilter in two ways. One is nfnetlink, which has a
single CAP_NET_ADMIN check in nfnetlink_rcv() for all of its subsystems.
The other is the set of socket options of ip_tables, ip6_tables,
arp_tables, ebtables and ipset. Convert all of these checks to
NET_RIGHT_FILTER.

Two nfnetlink subsystems keep state that is global rather than per network
namespace: the fingerprints of nfnetlink_osf and the helpers of
nfnetlink_cthelper. Both also call capable(CAP_NET_ADMIN), which requires
the capability in the initial user namespace. Those calls are not changed.

IPVS is not converted.

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/bridge/netfilter/ebtables.c   | 4 ++--
 net/ipv4/netfilter/arp_tables.c   | 4 ++--
 net/ipv4/netfilter/ip_tables.c    | 4 ++--
 net/ipv6/netfilter/ip6_tables.c   | 4 ++--
 net/netfilter/ipset/ip_set_core.c | 2 +-
 net/netfilter/nfnetlink.c         | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
index 0bf541936f60..10a9d206a613 100644
--- a/net/bridge/netfilter/ebtables.c
+++ b/net/bridge/netfilter/ebtables.c
@@ -2491,7 +2491,7 @@ static int do_ebt_get_ctl(struct sock *sk, int cmd, void __user *user, int *len)
 	struct ebt_table *t;
 	int ret;
 
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
@@ -2558,7 +2558,7 @@ static int do_ebt_set_ctl(struct sock *sk, int cmd, sockptr_t arg,
 	struct net *net = sock_net(sk);
 	int ret;
 
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index cf747e1e17a3..22fe0706b003 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -974,7 +974,7 @@ static int do_arpt_set_ctl(struct sock *sk, int cmd, sockptr_t arg,
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
@@ -999,7 +999,7 @@ static int do_arpt_get_ctl(struct sock *sk, int cmd, void __user *user, int *len
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.c
index 809441cedced..40a5e3cb7abd 100644
--- a/net/ipv4/netfilter/ip_tables.c
+++ b/net/ipv4/netfilter/ip_tables.c
@@ -1619,7 +1619,7 @@ do_ipt_set_ctl(struct sock *sk, int cmd, sockptr_t arg, unsigned int len)
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
@@ -1650,7 +1650,7 @@ do_ipt_get_ctl(struct sock *sk, int cmd, void __user *user, int *len)
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
diff --git a/net/ipv6/netfilter/ip6_tables.c b/net/ipv6/netfilter/ip6_tables.c
index 313c4aac377a..5339e35eb1a5 100644
--- a/net/ipv6/netfilter/ip6_tables.c
+++ b/net/ipv6/netfilter/ip6_tables.c
@@ -1633,7 +1633,7 @@ do_ip6t_set_ctl(struct sock *sk, int cmd, sockptr_t arg, unsigned int len)
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
@@ -1664,7 +1664,7 @@ do_ip6t_get_ctl(struct sock *sk, int cmd, void __user *user, int *len)
 {
 	int ret;
 
-	if (!ns_capable(sock_net(sk)->user_ns, CAP_NET_ADMIN))
+	if (!net_may(sock_net(sk), NET_RIGHT_FILTER))
 		return -EPERM;
 	if (!xt_compat_check())
 		return -EPERM;
diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 4aeb767088cf..dfe2c8ef1054 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -2267,7 +2267,7 @@ ip_set_sockfn_get(struct sock *sk, int optval, void __user *user, int *len)
 	struct net *net = sock_net(sk);
 	struct ip_set_net *inst = ip_set_pernet(net);
 
-	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
+	if (!net_may(net, NET_RIGHT_FILTER))
 		return -EPERM;
 	if (optval != SO_IP_SET)
 		return -EBADF;
diff --git a/net/netfilter/nfnetlink.c b/net/netfilter/nfnetlink.c
index 47f3ed441f64..524941691e29 100644
--- a/net/netfilter/nfnetlink.c
+++ b/net/netfilter/nfnetlink.c
@@ -656,7 +656,7 @@ static void nfnetlink_rcv(struct sk_buff *skb)
 	    skb->len < nlh->nlmsg_len)
 		return;
 
-	if (!netlink_net_capable(skb, CAP_NET_ADMIN)) {
+	if (!netlink_net_may(skb, sock_net(skb->sk), NET_RIGHT_FILTER)) {
 		netlink_ack(skb, nlh, -EPERM, NULL);
 		return;
 	}

-- 
2.55.0

