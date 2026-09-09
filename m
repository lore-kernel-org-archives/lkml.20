Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5149159C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988059; cv=none; b=kmxEhvOlmvJVURX9kJpzgD5y0yQXxxdGmUrxeIBeRPTp2UQGtlgDwy1AJNY1sagqvUO/JiNEbqVKpaGhjTT/W5GRI24+o75wgZ9geZC8BmvO0kwR5+M1khRIseeENdBXazqcyQO03I4MoqX47/Inxj6Ko3ZICySDovxWzL/SB7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988059; c=relaxed/simple;
	bh=HUyf1jNW5C6VMkF4GEdLDA5cUo4KPy1rxF/rBUbkDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgh8mkKDBYfm3WWwld+bHigtdMMRf/cnxI9GIZgUrnSyz9IxKyibTBxa2cLQ4ODAWXJ9XbFFy3SHDmOFe9VaQavOB9wmB5HrYMgeP1bwTPBcTSrRqeu4OJf2Yy+5P9RzOQhLjFqQnZFw1CX+2mTVFtMPLRsSTAIkld3S3xxSGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgVEZO9d; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgVEZO9d"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso7598651a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988057; x=1789592857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vbtB6JrjYpZN4dYkBaoy7eX+pbOdiI7LyNX1EdfEPGE=;
        b=sgVEZO9dWBkVe7nOo4aRfq183gwJGIDcsfoC/+ZKDJMaQbZF419O95VoG0g0C9ml7p
         UKGKunCuwMSVPWr8/TqYGPalB5uGtu1iP+r0kvIfLonc7jxoCNTrlwPQ22Gw+GOSX4+E
         RcjjvyY9PojQZbgHDrPB5ZGAuMUPxbVQ4SRwUOl1R4KL96S/k8FrUe5wFQtVFcVjdqeJ
         rbzK4z3YAvbOv42rDOHCq5t2ApbmQ2B+6mgy/JYRA1HxzXiDhQzZ7kA2gzVTmNa9BCqK
         4FrHMqavY2e3V0NpaxiodZf6d4Br7cZh5ffeWgIapZfQXPUtVcKn4Jt5SHzVOo0gULjM
         3dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988057; x=1789592857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbtB6JrjYpZN4dYkBaoy7eX+pbOdiI7LyNX1EdfEPGE=;
        b=VbF21igYa0/0qNUIxuXOJiIIOlCyUkEEJmv4Uvn13TuzoqzSiwCMsnlTqw8j9/Cd1+
         2EvOCBncrm6iydRT1GGwLWDTmejGTT+Asy4IE7gJFO81BEfostBNfUD8OzBexkMl0BfO
         ytLYn0WYz+8n9K3BbSb86AWZ+IONCRxzARfRX2tHWV6sjb7YY7Iybh2CryRfcrAWbiZ5
         L8uWmkoVLq5lS3YKvqUe5dUH3k6X9YM9RLzA5onlxO567NAmvlYsSyWUwIO32U+pu3nz
         2KUBKMvI0ALF18TS4pgh+oK1zbP2GFtBafjiZhrwzkqmAWqi2mp8RTczkodbcqHNaG8r
         WzMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy15epHJkbpv1vTzEutmXjTtvzUjDCRXBTm8P0oqW/nGP1cJ9MrdAuJoGzGghRib6w/7SU4ZXyrnZ+ps4s=@vger.kernel.org
X-Gm-Message-State: AFuF++mF67PqlFYd1TrepgCf4wwYZwrxvO/LpzEYCgz0r+/JzL5TjF4j
	RW4Z1M8r/i0Wqzr34+5t767BrsyMQZgaIq3htuAx2CsMSw6dGMOrdlMW
X-Gm-Gg: AYBFou3/vkoaKLzvpQAdh8WR+s+Jm5289AVAH7YVIrIXVQDJ4U1MlsUym9fBiij32YF
	vm8UbH6d8YUXeVECkv3egBdLRLaUxzbYcdh9Pzq1RfoHU8rXO7wu15AanRZuktsoPHEDlwYA6yN
	vGQ9m7BqH8U7GMX6TZfDKRkGMr0kvMbxxEAO01HC+7gKtBzPcyMP7vV3MNtAmMPKjR1mYYSFYJ5
	7zT7qjIaKRfmqxwhCIeCsw/pSCymDX2FwduRQoqukpsyDKOlD9ymYKqDohIYw3Pf5Oex47plavF
	W2LKH+RO+LQtpMiIXPuEn0kaQ9iGgIkh+DtldzzpZVfZqnP631wXFyycVvkYqpuIiomUeMOux6v
	/kdHnQuVlpDF0wjwEQ7Pa+G9JDAjuPDSZ/zHuSGFLER496Rm+ZBtbJKM2VWLTjuB2UdQEoglJZC
	JcbVAg9LbHLCaju6nSmuXYVv64O9WvfyQm/+SMPzRVyPUuxeXoKXsa7Kt4Gw+RbXP1EU/Zhe4h
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr58979698a91.23.1788988057397;
        Wed, 09 Sep 2026 14:07:37 -0700 (PDT)
Received: from G15-5520 ([103.206.144.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1435c2ae6b5sm1258817c88.1.2026.09.09.14.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:07:37 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	netdev@vger.kernel.org (open list:NETWORKING [IPv4/IPv6]),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] ipv6: replace sprintf() with no format specifiers with strscpy()
Date: Wed,  9 Sep 2026 21:05:52 +0000
Message-ID: <20260909210552.51828-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple instances of sprintf() have no format specifiers. Replace
them with strscpy().

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 2 +-
 net/ipv6/ip6_vti.c    | 2 +-
 net/ipv6/ip6mr.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index d5ff50a2ac01..ef3a6d931c9e 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -294,7 +294,7 @@ static struct ip6_tnl *ip6_tnl_create(struct net *net, struct __ip6_tnl_parm *p)
 			goto failed;
 		strscpy(name, p->name, IFNAMSIZ);
 	} else {
-		sprintf(name, "ip6tnl%%d");
+		strscpy(name, "ip6tnl%d", IFNAMSIZ);
 	}
 	err = -ENOMEM;
 	dev = alloc_netdev(sizeof(*t), name, NET_NAME_UNKNOWN,
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index ab94b3a4ba9c..182a7949d830 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -210,7 +210,7 @@ static struct ip6_tnl *vti6_tnl_create(struct net *net, struct __ip6_tnl_parm *p
 			goto failed;
 		strscpy(name, p->name, IFNAMSIZ);
 	} else {
-		sprintf(name, "ip6_vti%%d");
+		strscpy(name, "ip6_vti%d", IFNAMSIZ);
 	}
 
 	dev = alloc_netdev(sizeof(*t), name, NET_NAME_UNKNOWN, vti6_dev_setup);
diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index 3f2ed9b77deb..20ac8cb87468 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -692,7 +692,7 @@ static struct net_device *ip6mr_reg_vif(struct net *net, struct mr_table *mrt)
 	char name[IFNAMSIZ];
 
 	if (mrt->id == RT6_TABLE_DFLT)
-		sprintf(name, "pim6reg");
+		strscpy(name, "pim6reg", IFNAMSIZ);
 	else
 		sprintf(name, "pim6reg%u", mrt->id);
 
-- 
2.53.0

