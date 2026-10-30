Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334144;
	b=nHNPX7H+fLTZwXSY2X6Lu1Ol5GKZFszFkuXiTYlBADJqH+wyC8Bw5IbXZIurAtOgmR2Y
	 q9TxSPtrMQIAS/7mB3MmZBrae2ep5AolB1meckHf28lJdeAlNcKlspRA02TvySTrKlr0f
	 cQJxuXn74sZVaOigCa5YY5567FGpYIXc9TAxisdIaq8mrRJqqLvHAMIlp1xuRoWdcVoG+
	 Ggz2DwA9kz/kTT0bBAGngTl7pCCOJE6ik2FGb5Si2t9xjTqhRiWXM315WyvoMm/mwwWVl
	 gfMb0DqLcdY/hoYp9mWS4JZ1KA1JlirNUmjkKCyxGi+hI8VHOAB0XXWUmUZZBZrp0LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3hxk8649SkhtYbceP5bCvTVG9m2eHm+fN4Hc1Hzwp+A=;
	b=vN4ni6NZO869claW18SU7yiE3zh1PgwFf8ejBLVyBvg4a0CUcykzgoNRlFOhnV9mnajW
	 ejqpopj8XAAE18oK5/OPZFbo6gaHdPQd8cRCXtxKaJtTyxqZpyaaW01nqG6qMfFwTbKe7
	 6GGrRzocJ+512DN3P2cNeqARV0mONQG5ASWUsTyrpLfgIYzqLG0dEv5ZJbyu7rgG31285
	 ERfFrf2xKJdn2LZp8wamrjiNmSGKJ/x0DHTQVLDVchEfyanScPQhhwHENl8rcMuI2j4GF
	 NmKRMMtrPL2IYVEotROTbCsl8fA4c0DMQVy8JDxzym5Sb/7xM9Dj1yoB45BzB73J46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=PG3pL5zo;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=PG3pL5zo
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so152029fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334143; x=1793938943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hxk8649SkhtYbceP5bCvTVG9m2eHm+fN4Hc1Hzwp+A=;
        b=PG3pL5zoX4SQwnml5tmfvXQ5UQ/7jf0o5+CpeisrSd5QgzbQ/Nl5Qq3ZwXXz4VnJjt
         FMzmZIPqHbTL5y5yLcFE6XR2l+CpI8MtoDEVC8TPeWzzkOhvySH1nOWkEAI4xEHYuDD4
         Kb3BeHkNgoMdMnRyA4tTK7XduGFmzblIkwctY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334143; x=1793938943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hxk8649SkhtYbceP5bCvTVG9m2eHm+fN4Hc1Hzwp+A=;
        b=Gco4d4q4RB6kXP/P+OIfQenRMDtgOMwB4Ud9sFHBycK7hXSXqb2tbhTs8wALTCjICK
         tFmvjEihUdh11c+efA8xnZMY33BpQeB+pwT6jJlCl1iQEuwBfp0q5zt//ThYdqM4ZRGL
         SVq28/fEP5ytAbh/vGH36W32wqYiEmVG9sYi+VTk0b/aO0AZJFgMxcykth3TpcWtDJLp
         o4yCIPU0UZRb/rGkpHZ/Y2ClsQZLhI013EFp0vMx0jOvVXc6Q0BsP570bl+EcYQsJ8y/
         FWv7JHcHcayULue8SesNdvimX4nkx4YFM4OEr6xv9GL+GDP+Lcwz5b/B9p30S/xRNKoY
         RJgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmYG7vuZdf95mWt3lAi1a9HWWja0r5eLiwVNv6l9+BoATKvwfpDnYNGMuvHQ1EvZZb8XY95u+zWpfjkrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKONyQRqge65lcUQkv/shdamkXV6RNa30t6vrU6oiptNx7UhVOf
	FjoD0DSOWYPr8SZIeVvkEPORZ/fFIi2oY4UcNN3QMLcfHxPKAAoQQZKPuOLpUZR+NbDSqNisMdS
	2K6bjSVM=
X-Gm-Gg: AYBFou0yv56gsJen5zHDbksjSKHCcFDoAi73trEUN7NyEfLs+Rb7nvBMMKbe41+W/ML
	myfcz/mlYLy6mJVVJCPWUo6qZzUCdgQWe9FOp+WiZ5Y1KtCB4foC9i0eKU8MEHIRXyt4FtCGG0U
	b+iOKEeQulSq+6tvMyyF7WdLkdGU1xfnOS3YMJb75Wdr6ssF3hrire3Ucfz8dSRGpb0x+cyAvnX
	1L5SKRV6J/SgXzyG31PTLUyB1RdxrcyFc3W8LqfhUSzwhuiubhSR9Y7P1Y+brB2vWSJZ6cwii9V
	9SGPY9zaFcWhc2wG1RIy5IXzlTpJ9OhPM0QzVxzCy04E530bQOtFBXRe4OLyjC1xMaZ7boPXtig
	ekQN1ZQfkM8CHCpGHK0K0JXqzYFaGSeA5UFnlQFvBSZCN8LWy8MqZUxLuGdxvMJ75CTYUvuB37/
	TRTcsn2g+QSl7f27iEPWsG/cuzOETqv1NLdYo7Y30G9uB6r3YDwJiN49KPW8jZcVs5gj+Gj8x5x
	em+ZP+4UkhKerp6QSXpv89sTASHOW6eW/5OXjh7XMpf6xJModd/ag09IpUglVAruCqK9nMTbSQk
	zWuWZYaE9odLYfl8zCEtvPqZgqF2EpOfHDbhPSUR2PKfMNx2VXLQXbHhNcoYKP5WjdHeE+qKs+Q
	j8bUaiWuQa3Fy/cAv+HJb8qo1R4WGCg==
X-Received: by 2002:a05:6870:8092:b0:447:a816:9328 with SMTP id 586e51a60fabf-4a9072faa72mr850834fac.6.1793334143209;
        Thu, 29 Oct 2026 21:22:23 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90aee8c5csm810431fac.10.2026.10.29.21.22.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:22 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] ip6mr: Serialize multicast router socket ownership
Date: Thu, 29 Oct 2026 21:22:21 -0700
Message-ID: <20261030042221.73996-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

MRT6_TABLE checks whether the socket owns its current table before
acquiring RTNL. MRT6_INIT also looks up its table before taking RTNL.
Consequently, concurrent TABLE and INIT calls can initialize the old
table and then change the socket's selected table. Another INIT can
register the same socket in the new table.

rawv6_close() calls ip6mr_sk_done(), which clears only the first table
owned by the socket. After the socket's RCU-delayed free, the other
table retains a dangling mroute_sk pointer. A subsequent multicast cache
report passes that pointer to sock_queue_rcv_skb_reason(). This produces
a KASAN slab-use-after-free in sk_filter_trim_cap().

Look up the selected table in ip6mr_sk_init() after acquiring RTNL.
Likewise, re-read the current table and check its owner under RTNL in
MRT6_TABLE before updating the selection. This preserves the single-table
ownership invariant shared with ip6mr_sk_done(), without changing the
locking of the other multicast socket options.

Fixes: d1db275dd3f6 ("ipv6: ip6mr: support multiple tables")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/ipv6/ip6mr.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index af968a2c2a78..01a1087bc7c8 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1623,12 +1623,20 @@ static void mroute_clean_tables(struct mr_table *mrt, int flags,
 	}
 }
 
-static int ip6mr_sk_init(struct mr_table *mrt, struct sock *sk)
+static int ip6mr_sk_init(struct sock *sk)
 {
-	int err = 0;
 	struct net *net = sock_net(sk);
+	struct mr_table *mrt;
+	int err = 0;
 
 	rtnl_lock();
+	mrt = __ip6mr_get_table(net,
+				raw6_sk(sk)->ip6mr_table ? : RT6_TABLE_DFLT);
+	if (!mrt) {
+		err = -ENOENT;
+		goto out_unlock;
+	}
+
 	spin_lock(&mrt_lock);
 	if (rtnl_dereference(mrt->mroute_sk)) {
 		err = -EADDRINUSE;
@@ -1644,6 +1652,7 @@ static int ip6mr_sk_init(struct mr_table *mrt, struct sock *sk)
 					     NETCONFA_MC_FORWARDING,
 					     NETCONFA_IFINDEX_ALL,
 					     net->ipv6.devconf_all);
+out_unlock:
 	rtnl_unlock();
 
 	return err;
@@ -1745,7 +1754,7 @@ int ip6_mroute_setsockopt(struct sock *sk, int optname, sockptr_t optval,
 		if (optlen < sizeof(int))
 			return -EINVAL;
 
-		return ip6mr_sk_init(mrt, sk);
+		return ip6mr_sk_init(sk);
 
 	case MRT6_DONE:
 		return ip6mr_sk_done(sk);
@@ -1872,16 +1881,21 @@ int ip6_mroute_setsockopt(struct sock *sk, int optname, sockptr_t optval,
 		/* "pim6reg%u" should not exceed 16 bytes (IFNAMSIZ) */
 		if (v != RT_TABLE_DEFAULT && v >= 100000000)
 			return -EINVAL;
-		if (sk == rcu_access_pointer(mrt->mroute_sk))
-			return -EBUSY;
-
 		rtnl_lock();
 		ret = 0;
-		mrt = ip6mr_new_table(net, v);
-		if (IS_ERR(mrt))
-			ret = PTR_ERR(mrt);
-		else
-			raw6_sk(sk)->ip6mr_table = v;
+		mrt = __ip6mr_get_table(net,
+					raw6_sk(sk)->ip6mr_table ? : RT6_TABLE_DFLT);
+		if (!mrt) {
+			ret = -ENOENT;
+		} else if (sk == rtnl_dereference(mrt->mroute_sk)) {
+			ret = -EBUSY;
+		} else {
+			mrt = ip6mr_new_table(net, v);
+			if (IS_ERR(mrt))
+				ret = PTR_ERR(mrt);
+			else
+				raw6_sk(sk)->ip6mr_table = v;
+		}
 		rtnl_unlock();
 		return ret;
 	}

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
