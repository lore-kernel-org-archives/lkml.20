Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41EC41D647
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115357; cv=none; b=f3xZxhEwUiQ8RTG25r9JoZbZNWj2CO/swyJ+fO2w7uu9o0TVqaBNW/lygjQ7tmugMATh36kVFZWGWlmoG29Oi+arKBDO8L5r1u0rPEitmdZXxJHuco6c7aYMcPt4MvtCnystIZGCAr7h0f37/vKxRT7+N+sGep6e2tCHOpSyqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115357; c=relaxed/simple;
	bh=xE30Qt7zIKt7pcnaioEffY8ZCWbCqOVSLJObXoIb9Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGAjMZ4ziF67+jyO0PGhNyaM/Po8cwoCv0fhb+WPuZ3bkh3DcIe/y4b2/OaDb8GcQTNuS5USapGQ36KgSNGN6wVOd2aa5uzQ9X81AXEHKyw3kC9eQsD8vFg+hUwnHDDNbNZ6JKKjuy2E3DxYm1e7X1eI9ed6v7vTUPWW6iCgkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQO268wz; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQO268wz"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so249617e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790115339; x=1790720139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cYu/7TP7+XgfZfRQNvsk21Nb8kX34KuhCY2JK6GjCk=;
        b=TQO268wz7ijZ2WFJ2nzXAZ3uvT/f/L2Dv+0hvE1x2eN38XA8mG+gLOh/Nct5NHXH+n
         GLPqrwSRVx654G6QK8Ww2VWgLYR0H3XrC73sa8FndN2KR3LDxvlA/cYEfS6Of9r6qYZM
         5RkGjNiQ9yxbs6YcQ49i8g05j85VUL4sGx5lWMofPVyoTIYT0DpYPbmg5s11h6mTnIH7
         4XwoTajni7yrT6502TKzeC9mZJq+86FGsCeHQl3vE1kigBzhIfcuWJHSq5C4z75sR04z
         lfolpKu+xOl7ZzmwTlGU1RFfYHhG54RKaNjty2QRKc6lwkjpZIwRLkGAZAqXe2QccMj4
         OYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115339; x=1790720139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cYu/7TP7+XgfZfRQNvsk21Nb8kX34KuhCY2JK6GjCk=;
        b=USbbOM3V6eIShkDBaMZXeNsFC2auNaVgukbyj6Dhu/SHBmYUl5996uOjqUADsBENjk
         Sm1YCrVaDKaAliCPNHKNfXTKjC3LI3/6AgwifHw73NhMJW9/tIsoG+IetSM5FUaKfNcM
         0AMH2aV5lesAIkbzBv2LAE0Py0xwwhJKhaKrQAg0vXvvtkqPRQDIj9pPymF7XqJi0THv
         cwjIlBnTdJ5T296C2c501NdPF5DmyHUJ4lqNaQTjdxNers8BQoCE4DQiy6BJVvswhkup
         oj8BntZKlm+gohyDD7V+H0J2iVNyqsqBQ4HcoURsdSfik841j3I0mRlwFTcNz6DJZWeA
         TgUA==
X-Forwarded-Encrypted: i=1; AKwUvBym4uhwF3HEmh9PtCycHgMVE8mFaE/yhNOBn0mSHFW/RfRf5UVoBKoeS2fPBRmhq/6EJH2HVsnHSR3kQ88=@vger.kernel.org
X-Gm-Message-State: AFuF++mp/p3IjFIhkEnfWmoCtGZbgktgffWm83Ihx8WAkPK6Q2s0YqM0
	gsipkJnGA1P+LN7tDagIeSgcNgJBv7JourGxicQhBsAzO0yQTou6voidkZlspVmCQSg=
X-Gm-Gg: AYBFou3rVfW9ZToRcfFpx7MXey2Suwa5e2qWn4Tq4rhT5u8vkf2sbWMFUY+agCwJJ+C
	Sx9m9wWtsa2jufW25tW8lrZH7C73T//7CpkMDXiAb0pG0BFbsO62IReL8Cn+eEOVYIZnVG2zbRn
	vaWCMz0B+bxe4PieXTnJ98mmlCEAXaEoviDns+WP8R18thaMTlL3rGU/oPAvhHWo9sU5c3wq628
	1LuybNGwKhtz2/ZIPesgi+bttHAWQR/aclz1cJ+ULXgh1lXc5+NoFxaITqsWQqqpPC+bblkbrEs
	eA7lN5VVkMYqTthGj3Z0nE4ZaYgU3kqWzFfXbGhsgbpwQqSLDSSdcncNJD29XbAss+l6GRUrjey
	w7mxs8XxVv1UDGOPdde/fwqtQg5D6uZNKhDI13bgoms4K2h6LDFEwmuM1f1uuHEhtQz5+IXTHJ9
	8YjTdyP4/KDcXSjqC0x0jAA9zZqTbzbgRmMatVzbT3VS8tL45U8X0GWh0akhiAMbETdhOaQFgtM
	vmWpgmMuONZkHgkvvFiWl/2pRhK2og1lmX1Acq4PZMaXKWVQBLmlXAOpPT6TQ==
X-Received: by 2002:ac2:5696:0:b0:5b8:bc5e:d10b with SMTP id 2adb3069b0e04-5b8d89c2dbemr219604e87.53.1790115338639;
        Tue, 22 Sep 2026 15:15:38 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm164920e87.17.2026.09.22.15.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:36 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 09/10] ip6_gre: make prepare_ip6gre_xmit_other() void
Date: Wed, 23 Sep 2026 01:15:06 +0300
Message-ID: <20260922221507.3268127-10-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_ip6gre_xmit_other() copies the flow template of the tunnel and
picks up its encapsulation limit, DS field and mark. Unlike its IPv6
sibling, which fails when the packet's tunnel encapsulation limit option
is 0 and so forbids encapsulating it again, it has nothing to fail on:
its only return statement is "return 0", and it has been that way since
commit 41337f52b967 ("ip6_gre: set DSCP for non-IP") added the function.
Its caller still checks the result and bails out on a branch that never
runs.

Make it void and drop the check, the way prepare_ip6gre_xmit_ipv4() is
already called. The next patch gives every failing branch of the
transmit path a drop reason, and this one would otherwise get a reason
it can never report.

Assisted-by: Claude-Code:claude-fable-5-1
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_gre.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index ada48e23ca9d..6a0a508e0091 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -680,10 +680,10 @@ static int prepare_ip6gre_xmit_ipv6(struct sk_buff *skb,
 	return 0;
 }
 
-static int prepare_ip6gre_xmit_other(struct sk_buff *skb,
-				     struct net_device *dev,
-				     struct flowi6 *fl6, __u8 *dsfield,
-				     int *encap_limit)
+static void prepare_ip6gre_xmit_other(struct sk_buff *skb,
+				      struct net_device *dev,
+				      struct flowi6 *fl6, __u8 *dsfield,
+				      int *encap_limit)
 {
 	struct ip6_tnl *t = netdev_priv(dev);
 
@@ -703,8 +703,6 @@ static int prepare_ip6gre_xmit_other(struct sk_buff *skb,
 		fl6->flowi6_mark = t->parms.fwmark;
 
 	fl6->flowi6_uid = sock_net_uid(dev_net(dev), NULL);
-
-	return 0;
 }
 
 static struct ip_tunnel_info *skb_tunnel_info_txcheck(struct sk_buff *skb)
@@ -865,9 +863,9 @@ static int ip6gre_xmit_other(struct sk_buff *skb, struct net_device *dev)
 	__u32 mtu;
 	int err;
 
-	if (!t->parms.collect_md &&
-	    prepare_ip6gre_xmit_other(skb, dev, &fl6, &dsfield, &encap_limit))
-		return -1;
+	if (!t->parms.collect_md)
+		prepare_ip6gre_xmit_other(skb, dev, &fl6,
+					  &dsfield, &encap_limit);
 
 	err = gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT,
 						t->parms.o_flags));
-- 
2.47.3

