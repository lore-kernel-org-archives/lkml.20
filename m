Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED85437C0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569458; cv=none; b=YSHZ+rwhab0YK9/gBdCp1Yz/EdVY7UVqbkKuqvopWwFcTFe2vX1e7WTViyAJ9miXBoScfV/Akmts6Zm0Ae8fX6RdnjL3xGU5K9k454KybIApwpSoD6ORu/IrZaicAucJJ2edpj3+qf8rW4a3pwwBZscIoiZ444C8tfq0sm+sIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569458; c=relaxed/simple;
	bh=FYqqj1PmOH7S2LWEsE3Xy6aNF+A4qQjGDxqGjVkO2qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JFDJVsr60ALgv4ENSbxV1xYD5QwlHB7hdCCnTQkyW/yyKlOFh4b69olRXb5PHl2tazy3DZuKpFGSQjIynm2yV83acqHrAo1i9ge1KLelcr20DtNnZVtV41rtrZcZkbnTB/rLcKe5FQ014Q/FeWf0Zzqczs2hNNn3ohau/thDpFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQrf2q8A; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQrf2q8A"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso1062285e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569454; x=1790174254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmu/RgpBPaO9Nzgyfpg7t1XLITe45Rlmeeh/CoQR4P4=;
        b=MQrf2q8Ag7Akl8ahAPUtgD+Sct44f/nb9a9r6W9Q0B/9+zDJduabh5uj5JVIBTXFJn
         9nv2FW/d5/NpiTGCkFoi47I/sK4uxFiolyAN3nuX8euL9LBEldcroZ1LwsDdLR/zWsOn
         yisoys6ycIRjKYv+WRY8k3Yacg5l9V1DAUmreN3DbCbDbfhXUZ1niV51kbxvnXbyzdet
         gEf/79cUkQHlAN10yZz0nEyTZRGrJMeR7DGXyk1KdY3WtF8mMXNYvB2sscVcBjTZn+0y
         nyDhuk3zruhhX9vP/JcS165xJfozeiOckGQcv3BN+uIPi/CRJVhcLhumPzz/SfB8hFWm
         5R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569454; x=1790174254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmu/RgpBPaO9Nzgyfpg7t1XLITe45Rlmeeh/CoQR4P4=;
        b=SYu24HyEBBD4XPbZ+Oxua2lu9pb2jMcnjcWUXwUhGCJk/8UXFF9U/p1ILmxa87yAXy
         M+6I+TEfIIqS2tU8JrFv/dbGo+oJeN7b4eIhYGPfV4HOhwLEsSyvMY6fxDalf2y2NDT+
         pUK2IJHpDhD1Hq/ihHo0unFsKfAaDCdKjYIW9fZmHo1TrfSmg28vl/yRFYhZv8n1PTI6
         A8RdvkQF17ck7xmw8WVbV48T2EgGKkxw7mEVK69zrV9edpr5uaOv46QxzaCvM/yw2DFD
         UizUz2/ioli3bSkmViiKxbBp33gXypLbo24pARlj9rMZTEQ5hKNwgy/4OugE61jj4/Kd
         9QfA==
X-Forwarded-Encrypted: i=1; AKwUvBzuUkt7sFT1oUNP0wTlI3ER6g9BO/g8U8Ge/IOeSwxFLS7CQShsauhfjDBkAl5gyRjWMLbRgjJNbkPRetE=@vger.kernel.org
X-Gm-Message-State: AFuF++nipAfl+G4hPGEgRfjPGpOm2dMTRNCQiTK15Apcyoe7cKiWN1GX
	DjR9D4nE8Bx0fnMpyT99LL7jzFNPdA+fE9lTWmBQRJNyP0m+4xU3vsGc
X-Gm-Gg: AYBFou2eaukuACtK0cLkrVbTPNEEasUIJZbXIuknap2UkHu274P77Uu4KuXs54Pj/kw
	SiuRYoEIPrTE0kakkuI8X09QgzvIess1/58CU5aE7MUbAgx+WhMar5NiXbUeeHfaVnm6sYJTGFT
	jq1PPDyXEaRcNP32z09Z9EE8beXD0Gp/nGfnCsfz7b2NQ1oPA7AKdy855WPNgpPUkcP8/6AB4Ds
	hZVKUWM1QDRxd9JB8wfJ9yDduKuPikuWkXnGZTLsPzL895YsEMRipAuQhrro4QzJXgFdrZRv5cq
	kxeV/M6NNOqvVKUwITWrCJG3Cz/45GYNRLy0Hk7ppsVTzAvScTe0nopJTdbeUjVxAd8w7ksUFae
	dkej1VUie1vm5SycVeyU3zbiRPUgM7ATl6xZMLB7ocGT/uB7PlDAH3gvjrIammNZHFtMfve0hS/
	xr6NFerQ1IeK5MgufRKRvqfIdxMxdmFCGJ/0VRqw/SHQtGICuYOUx3Sv9BYOnkfQHTAJdTvW98Q
	CJ47lEPH/8QNZO3rHCGQ0OkGUcWxGvKmPPCXDtm7IAhInrML+Vn2lXQNp4M5R/a
X-Received: by 2002:a05:6512:2511:b0:5b6:1a7c:59cd with SMTP id 2adb3069b0e04-5b8b6643b77mr897687e87.39.1789569454155;
        Wed, 16 Sep 2026 07:37:34 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:33 -0700 (PDT)
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
Subject: [PATCH net-next v3 8/9] ip6_gre: make prepare_ip6gre_xmit_other() void
Date: Wed, 16 Sep 2026 17:37:16 +0300
Message-ID: <20260916143717.1875082-9-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
References: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_ip6gre_xmit_other() copies the flow template of the tunnel and
picks up its encapsulation limit, DS field and mark.  Unlike its IPv6
sibling, which fails when the tunnel encapsulation limit option leaves
no room for another header, it has nothing to fail on: its only return
statement is "return 0", and it has been that way since the function
was added by commit 41337f52b967 ("ip6_gre: set DSCP for non-IP").  Its
caller still checks the result and bails out on a branch that never
runs.

Make it void and drop the check, the way prepare_ip6gre_xmit_ipv4() is
already called.  The next patch gives every failing branch of the
transmit path a drop reason, and this one would otherwise get a reason
it can never report.

Assisted-by: Claude-Code:claude-fable-5-1
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_gre.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 0b270f4ac774..e7d0fe4570e4 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -693,10 +693,10 @@ static int prepare_ip6gre_xmit_ipv6(struct sk_buff *skb,
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
 
@@ -716,8 +716,6 @@ static int prepare_ip6gre_xmit_other(struct sk_buff *skb,
 		fl6->flowi6_mark = t->parms.fwmark;
 
 	fl6->flowi6_uid = sock_net_uid(dev_net(dev), NULL);
-
-	return 0;
 }
 
 static struct ip_tunnel_info *skb_tunnel_info_txcheck(struct sk_buff *skb)
@@ -878,9 +876,9 @@ static int ip6gre_xmit_other(struct sk_buff *skb, struct net_device *dev)
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

