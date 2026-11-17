Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930844;
	b=fm5g94zTqbjQBHqZKx3fEX+zg6iU9caEbn4daD/e2vNAZggHPrqhGGyPOf2InyQ1RA/S
	 pKvT199ikov31Z2229teUHUOLJ57c7qz5TSmKZCx+/bfigglJRsLP8jCcW0Uq9Sluqvrf
	 6J8QJjOyNl5qHUhVG8G1DyaxGabEj6fOE5biyYj3FzGot90wPdMGx5w49uIcsyAc4L1mx
	 Q6MYbEM9l+CiZ4G/zpcWyfCUL2EFPJYJ8yoZm7h0U4Uk5cX8tZ6onh91D6ummRs8O10PH
	 TZJp0KOmPCJ1DhO8lo4GZZWsHF8p4AHsSgdvfB2NQrlKFZgx0xNWuxaNoHRe+FTvylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
	b=4riOsxqYvIP9uKXb8sAfxKpi80HyHR/E0HKLCexPHvCqE4RLWelExJ2CPEhfjOjuPNp7
	 TjZ62wEC1vdQqk+YBt6DWQw6avDd/yj5N/OXuv/hwM6L+1zkeQHRecwUTAQvXMZH8OeUL
	 KX8j6Sr4Opp/YX6kOXpj0tVyoVNQAA3bRDu/1vmaMlwW0Zgz2SIhbm1ubrukZgj77y/7/
	 RLhhhJElXEi0BGynH/VJ/dIWqL4QQ6AarZt98C4RAx6Cu5NDAmh76PaZgH44OOJqjSf+/
	 89QzsU3PAoFbX61yGOYBcrgJL8mP/1NPYueipn7G6tT3Fwkymqfi6oY/6Ce8syfZc2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZ7o7KUj;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F9A606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F9A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZ7o7KUj
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2180379b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930843; x=1795535643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
        b=RZ7o7KUjf0yZpJ26n1S6UQZJEgftOanDPlT8nMSKzF09QIbtPjcMxRV63WfoVWz6Sm
         4Va89bbhECf5i1H65fSRdPOcJ5HX3R1EGCtSHwddDziA6cpuaAJEFOyL06pwfP/AfZM8
         HFKoaT4IJDCvQ3zL1TDnIWLFPhTQNiiaH9iUAKonzlz12lSBawZRA5+iaSZWUg8znSz5
         7uiXJPtkWP+psEspwuR7f737YQ+jQDUOW+1WdJCequIqAx8kQc9zKQxmeBAyOXLK1NKQ
         VgOwaitK3jDrbpkQx+NN1NlVgA+kC+eX30uO7PfmdkdeSfSX3ypc82AKyZNO0miPFZjl
         10xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930843; x=1795535643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ExJa3HV19g0ZGUa4rSb4P4UswY9qSGxs+IdWz2us4KU=;
        b=kBGQdXq/uo6/OVZkv1Wku2MnDk1yHzPgCGb0xNN7ODmxwU73P7PGbCnOVR1MrODAI9
         pmJig3zf/gan04Qi6LJvZpL4XwQMmRvEIoc4CBbOIR/n6Z7yV3+jdzYm97SXxL377AhJ
         faCl3e4Vc0xu9u2okNYX6XwCRjH0Dv2ezGowcrYn00/EQ+KAyPjSYUgaiXr1K1mKrc16
         NxWqDdDlNN36a5SE9SOc484Yxw6OtCigDxkoDIuOTyfpVaD6EhpEjTPUX/xsgk3D2gqx
         z4hXpCvD9/nLKDZrNSmC/BJS+/d4RGUPmCRae0ln+rePt1e9/Is9K98NcwJpTE1DNoaT
         cSKw==
X-Forwarded-Encrypted: i=1; AL+hErFQT49w+mFFt66nU0kNEQW3v+ptTnFv7Ljodo9S9TTApfglPnK1SjsCA2FBsMheqfK8hBc0l7Fd14D6IW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mxws2/sHBmpDD0/cZ1zE34EVmCJNbh9dUms48QpNf7H68Zr8X
	Ec1zBElUFCIv++jXB3YDH7a12rNnjdyUd7TbeRreOR4zAJaVlcl3tM+TfJXL9ca6rzU=
X-Gm-Gg: AYBFou1Se5gCMxorIFc+MJg7G9E3RYhaGYFBcf877Abd8Y1k6JX5mBcIMcfVpVT9t6m
	sPzGglnIE/Gj5kMkDSrjY+ZebLiKyMO2bkPkB2ndRBHH3LyMQ/olfIe/XuuuLXzHUK6h9y9kYFh
	0xUTCwYJchaB/Ms/QaKaFjmzp1ybrrVY0F10cDzhGoxKlWhPAvC6D1cCVrpnKppvKhI7Wz5ebV9
	/00z4Tenl5CP9hjVfemQILbLpVEQbD0zfUPy7b6K7PmnySU5CpO9/cUrHHdUnWYHSU+Hp3mgmsw
	GkFSBCuDOksQVpbimQ1fVQ2oT8CWWgtg6KlHDqkvAYOopProtccRhyTCChDgSsS6KrH7zl23k0J
	uF7z24WCJtbMworivhACDomogpWIfs9+p302WJUKdmujd07I0sa11lfhTh5wF01w8jKsa/hGxkm
	yspPWsaXknmWx/5YHaHesxycqiamqQ5g7WWfy48d4kph+hwkI1fGFb7pRAIWWDekskSxRP8wdxW
	1J+vaAdwx1b4Oe8JHZlEoil5pxDa3sfdrpnaZCSV0c+JQ0Fpp9a6mIqCixGr/U1kRpFPEKdHMg/
	kdy7XNelcDA1U7r95uJbXapVFTEAZABfdt1yqX/RV0s=
X-Received: by 2002:a05:6a00:420c:b0:8b6:400d:7cc8 with SMTP id d2e1a72fcca58-8beb6298a6cmr11857476b3a.30.1794930843313;
        Tue, 17 Nov 2026 07:54:03 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:59::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8114sm5476595b3a.12.2026.11.17.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:02 -0800 (PST)
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
Subject: [PATCH net-next v2 1/5] net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
Date: Tue, 17 Nov 2026 07:53:46 -0800
Message-ID: <20261117155353.2250540-2-joe@dama.to>
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

Extract the code which converts an skb VLAN tag into WQE fields into a
small helper. This helper will be used by a follow-up series implementing
software USO, to avoid code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 33 ++++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index c5d564e5a581..00210dbae1c3 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -861,6 +861,26 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
+			      union mlx4_wqe_qpn_vlan *qpn_vlan)
+{
+	u16 vlan_proto;
+
+	if (!skb_vlan_tag_present(skb))
+		return false;
+
+	qpn_vlan->vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
+	vlan_proto = be16_to_cpu(skb->vlan_proto);
+	if (vlan_proto == ETH_P_8021AD)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
+	else if (vlan_proto == ETH_P_8021Q)
+		qpn_vlan->ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
+	else
+		qpn_vlan->ins_vlan = 0;
+
+	return true;
+}
+
 netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct skb_shared_info *shinfo = skb_shinfo(skb);
@@ -902,19 +922,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	nr_txbb = desc_size >> LOG_TXBB_SIZE;
 
 	bf_ok = ring->bf_enabled;
-	if (skb_vlan_tag_present(skb)) {
-		u16 vlan_proto;
-
-		qpn_vlan.vlan_tag = cpu_to_be16(skb_vlan_tag_get(skb));
-		vlan_proto = be16_to_cpu(skb->vlan_proto);
-		if (vlan_proto == ETH_P_8021AD)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_SVLAN;
-		else if (vlan_proto == ETH_P_8021Q)
-			qpn_vlan.ins_vlan = MLX4_WQE_CTRL_INS_CVLAN;
-		else
-			qpn_vlan.ins_vlan = 0;
+	if (mlx4_en_prep_vlan(skb, &qpn_vlan))
 		bf_ok = false;
-	}
 
 	netdev_txq_bql_enqueue_prefetchw(ring->tx_queue);
 
-- 
2.53.1-Meta

