Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930851;
	b=vmis9hIeGMNc0arYfWuEPZ/l98v+rsIfuViA+zVORZvx9YX642Hq82m84iNuaeeZnKR3
	 e8V8LEJxDzbTzDjAOsh1xw2Nt4gGc1BQiFH000m0I7kiDiiNn0UGiZMl4ti/BJOVsO3KP
	 GJ/ivl1B8ilZdzKK6IHs7jkd3pMRHuzAmO98pun7N9roaSiueUSq2HW260W/kMCXbiqoy
	 HnVrcq2HRVmUXVh/Rnvenz4Sofj5sbnAOgTHHW6Js10lIbGqUS9ZIc3TZCcvwSIQqzOLj
	 7yAW4Rly9SlZItOWHZdke805GjmEN4Ol+m3sHtE0gm3gAkgt9DYHysKrK2Y7B5ia6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
	b=W8/ndY6v0Xwf1w5S22nKG303N7c1jwH8zdaP+OVunhNYHvUVtwWS42rkElPYfYAQ1YUM
	 xbJYoimyPZiVOuwJ9dpDiRGSVf4LdWei7JKp42uq+dhdY1cTzZ+zkxTb1UqmF+QCaDpX/
	 qrbb1UnRY+Igge51BPnifen0JQWlE46fuleNJw+gzfAu4faCLUaTdSYUZOTmgiLEvG2GY
	 RisHhn3h7ZGCm8GS1eKaqss4e+c7UMDdw6uvVDRjil7TbhVEoA06PXnUV2ZCiGtxqfTep
	 0ZJFQlgH35hDZ0o/W3+o3v1ms0YUtyEazw3LZC0OD7PMw1yzLPnqQUuU/kQK5AH26zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DfAihYYr;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE33606A88F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE33606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DfAihYYr
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde1479f76fso20972a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930850; x=1795535650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
        b=DfAihYYr1Hx/FqwMJ++uuMbrUTmpfc6KPCxYCi5wOzpVdspIXPzcsosvZhU0XxEMIw
         B6vrhiqXTMvQJGlj6nOouEJ/kGGHkeA5MQlWJgcfkEuYmjzzU1uWP5+bY0IV3UeS47Oe
         vWgkcTtP/nZv6teke8OAAhraDps/KlgCFXg3qdQ6S+Zj8RIc12tfM7MKwg3BjeiDInsW
         18kYOWONHh4XfPq1KLoueRY+UjKz3S8Z9En81+9Ah95ePbG8OTZCC4ZkwQZlwsz4YLbS
         9a3mkMmXCAyrR3ieqEQ+A5K3hf5DHfRoOuEOf9bzYOQupWXTtEu9u1m0hT1cnkuiIHol
         Tnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930850; x=1795535650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AGrjC0rSP1b8Paro9DQQb1SL5gZ8d3d+SCH/LzYuvzQ=;
        b=qhscke7QBj03bU1NTIcw68OyKieU2Hh2YYcfEP0a/JIoU5a+tNQD4y9sWT2WqpaHb3
         0NmSXAT47VJjtpEMIleoIqMgnk09IdW8wtYk3XsLyIrp3g3JsgcmVLOHOWt1vhHHL1Co
         NWtFnqTm9y9eAdHM/zapz61wT/uZYXtGSlBzORYIPqC0metutRs53gBtPVTwNWfBy0SB
         GRgYbUYsUES9ckbDVsfzsyGZNcacd3dKUCz4iefrM+m05DGVPScVKypIX7tOgn8F4qlo
         1vAchh+P5QDI0CA4kHOYDm0Ht8q3fhjXl9A9Buv6Nt3m6DCZf4leOPHg7IPiBCU/vWiL
         aIhQ==
X-Forwarded-Encrypted: i=1; AL+hErHrhX2BX97RFLeOl3acUZRtX1fybFgq65wkUXcxxy7CFt/hNMNFHPRU+L2mSdJKrEJEI5ZPDouEaLxqY4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uwEU3LrQ5TOn8qqDAPZJQofR/XfV3S2O0luNeU17RWdUzIyYc
	4WLa0m9Zuw/YfAdGaROHItACpKcr7UyM+lGt22cnQQelzk0NW4/ezQhwEyklDJNgdwY=
X-Gm-Gg: AZFdTZeseffndpNOlCEvnSZQbgFSZx1JyV1EXv0vggqoK/W/XahI3mBq0+D3rYpLAYT
	M605Uvnv2JZ6jekvf/hRD7YtRx0QUnlKw2649Nx/jpNXjBvxbBvYs3zYbQVyg2Y2Uoz48n37f5q
	sS2dZBvfIPmWpZo4pf/0mj7S7FutKptB7YWQWd+pcCE4O9a7O2m/H7FAp7QO+ibN0rK/RG1Xcxp
	jHiY9RPVYmK3X4Oot5GE7OxePiD4WIJydI01PqqrHUdH9r026z7fgRdVd2s2KMenhQKHEf1bmJr
	8DP0wPhPRj/b72nK3LeswclYB4YuwxpTHzeoVs5D45Pkj/dAz3ULq87Vq73CGa9ce0MD2j+tzhO
	bUYSSQlsWTbweFrtMmlUktkdMiTyYKZr1pZ+Gajp/0N7qjmB+9sf/WoWRUXJTQ6dG0U2+DKmtGs
	CY2t4ggauAQgWQVJk7FTdwybl77s2rSpkdX/Mb734ix8B3LPp1dw84Cgu3QJfomBgnd/R0VRmvU
	MLfGvG19PROg/nXOrnZzk4am5Jvf5DA0XffdpVNxrYH882brQH/+Y+mtB8C2JPQUDAqTVhAiD4t
	FZbpEtFYi5dW3UIY6Px+X3nWgMGbGG65pat/WVs40c52
X-Received: by 2002:a17:90b:3c4e:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b1b0b6672bmr13618434a91.21.1794930849960;
        Tue, 17 Nov 2026 07:54:09 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abd063e8sm4624009a91.8.2026.11.17.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:09 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v2 3/5] net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
Date: Tue, 17 Nov 2026 07:53:48 -0800
Message-ID: <20261117155353.2250540-4-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261117155353.2250540-1-joe@dama.to>
References: <20261117155353.2250540-1-joe@dama.to>
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

Extract the code which copies the destination MAC into the WQE for
eSwitch loopback into a helper. This helper will be used by a follow-up
series implementing software USO, so USO packets between functions on
the same port are looped back too.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 28 ++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index f6059b533eac..97f27e005810 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -871,6 +871,23 @@ static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
 	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
 }
 
+static void mlx4_en_set_loopback_dmac(const struct mlx4_en_priv *priv,
+				      struct mlx4_en_tx_desc *tx_desc,
+				      const struct sk_buff *skb)
+{
+	struct ethhdr *ethh;
+
+	if (!(priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK))
+		return;
+
+	/* Copy dst mac address to wqe. This allows loopback in eSwitch,
+	 * so that VFs and PF can communicate with each other
+	 */
+	ethh = (struct ethhdr *)skb->data;
+	tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
+	tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -1008,16 +1025,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 		ring->tx_csum++;
 	}
 
-	if (priv->flags & MLX4_EN_FLAG_ENABLE_HW_LOOPBACK) {
-		struct ethhdr *ethh;
-
-		/* Copy dst mac address to wqe. This allows loopback in eSwitch,
-		 * so that VFs and PF can communicate with each other
-		 */
-		ethh = (struct ethhdr *)skb->data;
-		tx_desc->ctrl.srcrb_flags16[0] = get_unaligned((__be16 *)ethh->h_dest);
-		tx_desc->ctrl.imm = get_unaligned((__be32 *)(ethh->h_dest + 2));
-	}
+	mlx4_en_set_loopback_dmac(priv, tx_desc, skb);
 
 	/* Handle LSO (TSO) packets */
 	if (lso_header_size) {
-- 
2.53.1-Meta

