Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352404;
	b=sU13s0jTv+6ltEJNSX+eT86tgMfDNOGENqKCpo7bO4zUlSAXdCcSI5Euh4v1hWNYOkw/
	 Fmw44Hodc4v/Zov3To5PFtDFJk9XEK4i6yJRkgUxiqFWGQlOLgZX4hvYRnC3qMcfk+XKb
	 Kt3yvQ1/ALZBPhv78gtO0yOdnPMOG2XDrdHHVpwf2bGRSj9FqRkcHW60X+XRKs6OV0Iww
	 Ll+J5ZM3lkX8H6g8aWmMHLiR3D+UBHPis2Jqh9LVvuaxFq+1MJE7dEy47Mlunh7CVaTQe
	 QsXwnLFsqcxtAD3kh7QEvy7Rz3CUL6JXeEX7oZ/oz2A9L+lCC/rRbqQbTrHBtGG1zgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2PJWsGT9DDXgdyqOWNZn4zZ/5815bxCRHtUykcsi0I=;
	b=Ylh6kpMyCoMpUkE9dtCnZHNnbsbnKDbWZkbeip6CQ0YKojVP6Rp4FIozO0kzNFNbWnsp
	 5kI/6X3I2M7/UyKLHG+8Bnt2kVB8oZi5RV0CNlzq3M821wWtjgqt13fyXPULjN3qSPuK7
	 XeUQqdpmU8t3d8+Omuc779S4ujyxAfnO029a0joTJw2FvFWO2mO+urJ5VP9bF84336cGo
	 br0alSm+ISFKcxcSC2HC20VBSev/CVWCt0wCOZPMr7pHn2yTVEnvAf7Ub7Ld6AXsluIzA
	 /aSwgcwjx/dkOyAWnrOhwqh6V4+rul7DAWuWm9195gqAg0JRz6dmqOQL62gVb8LQFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="DQWHs/Y/";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C62606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C62606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DQWHs/Y/
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e940d5d2beso10157805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352403; x=1794957203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2PJWsGT9DDXgdyqOWNZn4zZ/5815bxCRHtUykcsi0I=;
        b=DQWHs/Y/PxX1bY1e05b88CkK2bDdAN5JrwSGtg8GmFLeuA3BgFRMZU3R3JUh8zlLvg
         HErh6MpMjAOgl5cKp15bbsjM/8DwipYqYtH2+M9M2zQM+2aeKsSSmDZe5Vz/Q2cQQRMS
         QfKQgK/OCFPz1FNqzRusy3fVbbq6nCuTfkZf5w+RuAq4oCwnvAYnzMVwtggo3O3bdlFj
         P5F/yqBL3vL1y9lZG561H+nDFpGLL4F0WHMcos/ea2HORjLbG1QEonMAlVDdQNfuFgW1
         LIQMXMrrZMKItHydzE4sOsuKCoTtoDyCUVAmWFuIIfgWzl9unLZrimq6c7BocjtqbZQJ
         Gn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352403; x=1794957203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2PJWsGT9DDXgdyqOWNZn4zZ/5815bxCRHtUykcsi0I=;
        b=lx6hXWQ/wy+l2oYFinkK3/TZXlGPgBhdsIEuEWPEOJO/7e9P9SGhRi1CVNgdfTkagb
         gBX0EXxpPtyj1d4swlgEqOIPlTlHek9BChiPV2SvohNgJv7Q3OryEF1GpfCq8xi9UmIi
         Td0hdEdapS70QDPpWMDKrBzlXjbzZoSncqwG2RnQi5wNWnWk9pAF/z1HVjlwLAWqIWFQ
         SVi/iMCSj5scG6eiWfZyXNuqyculAENEnS2Y37kmEPA0ioM6ZSWKVP66JrQBA/GbJ3mw
         FHmp0R6ycC1w71kf6AyYvrIZ+3LIBBPE3KZLTkUE51XgrNnbuDc//sBxOIVi6A0oHr1p
         aiow==
X-Forwarded-Encrypted: i=1; AL+hErHSfYX9AAAXVpDY2Bi9B/y8p3VgJOfpkFrkj82RZYB3xU0o8XAGl9/rti3+T5cGiSwTn3R2V9jB1a3qtIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yaI2ksKQdK60jJxVjNaN+6jguh0Ev15Pmm1O71RD0dUYLoWaA
	S/O289JIQ+VQKbj7yRr2StZrpl7/LY9dcsqLi0W+JGrwi5wvKXNla7iR+AblPKqlF48=
X-Gm-Gg: AYBFou1h7WJI6KpAefUgSJIhaXYv3RhSmTVB5PytTKtYM5bjQu6+ZKGz9+QzLQnPZmi
	q/Pp//cKDnsZiA23YgtkCPV6zqICSRK9ESy10l3E8KWm2vgwHnCPRglXAbFTLL319W6ChQlgqdG
	MAbfLk4YO8PYFw0w24lwL7LhYxnMpeNz1EoN9YPkWQDtuUbijOUB9EZOj2s9WKwnbWkXG+jV3/2
	5xfr2nAmxoY/VQMONMEwtrWShHPQ87iRh5/Jetp7OAos+7+wWtVLvcIk/vkXCxflQOYN11y7hTW
	xtNX7E+LROXx+vcBjXR1l2UJaZKotuafvFh31dKDYXYINRuWy/6owYaKIK3vbomemtiOJKjUTGu
	kgwDGhLC/4XWIc+YR6+tv+3Yoj97vP6r5pD1nvg0fUBJr6CQHlBzzfrDKCYiskfTdFNivAkBI/G
	NPPRkR64X5KLF2VE3+rLRqp9s8jXS33er76TqXIBHZKtjcUYhcvoCQOgHHt+B2bSw5LCadWlbJl
	mWHhzRyo5AiZZ9TER2NrFvzvbVIjegH3c5S96pPwLq4qlTY5qOeWKg4x7Flwwlq+hlGKP7m5AK7
	MvPqfE5TwzFkxwfYqfCKSqVuJUaI+qzinuTkZwI722P0iPwZ2y+NwumHID5WlTI=
X-Received: by 2002:a17:90b:1e47:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3b182fcd7b0mr392066a91.63.1794352402961;
        Tue, 10 Nov 2026 15:13:22 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm323373a91.3.2026.11.10.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:22 -0800 (PST)
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
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next 3/5] net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
Date: Tue, 10 Nov 2026 15:12:57 -0800
Message-ID: <20261110231304.1859217-4-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110231304.1859217-1-joe@dama.to>
References: <20261110231304.1859217-1-joe@dama.to>
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
2.53.0-Meta

