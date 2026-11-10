Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352402;
	b=qL2Y21L5mEbjnF65YT4Jw99iclHHDUV+fCICCHApBN97Z3Q7miPEp3Be+1fDOYzywIwS
	 eYmqb2AVJoRDf8xqCX/BjtHrUPL4dv5/8XiW5UDCBIwzWQkxO1Qzw/RODDlwXL4WuLBDG
	 eXa+MdD7saBOIXVENLg1vmcHIvizflcTklL9QsCXKTRuzffr/Be2C9vEvhCUxoNqf/xrk
	 rClUaMXcLEWa5boNljT2y0GyoOYCHEpTBUDEw+xz8hPYEt16+UfvXRBXj1s7a5NvTUe9m
	 emWOkFBJkiGGHJ3EtPGR6j4pe+KJgdKY/yJ8YNwv9g++TsRGJpD3CjqwucAjBHA0iMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ud8T4mdbdPPGU2+VlHIdj3ZjRdWxPiYqyHT55Q4BDnc=;
	b=U/8/JjdP/jk8d/K0ergSzAwVQpw3gldQtibL+hFY7ASedlhA5ZIfmIeuF2EiITBDYh3W
	 wwwMCA7pVnVrP+m8z9k+/nN3R/DyEXl6eWLiS7m+8Qk7qCz/bTTutq7ryCRnPq1aHDTHi
	 9vv9tSqs7CfYFoHLV95ADeRHktLaTlvFHCLdfoYfkP+gi88vj6mBvVd07U4WoYz4KrBPE
	 nHBi1/cvYMhWnGJd8op60cBC4+MwsGRSUr8N6iiQWnIXcU7/GAGiN5m7k1WpNsn0KbKSc
	 Atrxd7lUQWgqwfl22vKB1JbBVyQ5lT6o45QnqnSdXkn+LrwAxv7hvX52GO+mE0eEqtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=snTVJ7Ds;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9DD606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9DD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=snTVJ7Ds
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1047537b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794352401; x=1794957201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud8T4mdbdPPGU2+VlHIdj3ZjRdWxPiYqyHT55Q4BDnc=;
        b=snTVJ7DsTTatcwZgyt0NTW6EYGJKr6B64WkjFf5RVm4yiATGep3mDPMkX4RnEjXD3n
         Pu5ALpzpm0Q21OSzW53ixtUWFrMWbUXIacAgn2+PFY/5l7c8COUYVdp5V90yzMCWbijf
         D9aM4ULn6F29luQmYN2YvCKj9vrsEZsI4VDDbNcrS5A2St5QZcxDsuSBEtF1acgSqQSx
         5NaSPyLDICGXkWsglr9BAzD/QFvRTFEIejqqnr4nMbOGn/2Ptccua0QyGMJGFK0e1xAL
         1KOfCfpUoOmj9XKSx+OEhk44Vysw2FD4+BmCso+9DL0fXM6k4GdYPNOtC8EqfUreGZie
         PfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352401; x=1794957201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud8T4mdbdPPGU2+VlHIdj3ZjRdWxPiYqyHT55Q4BDnc=;
        b=2nJJW/KGN4joY25VSozjYWTn43slsQVwFLgE1NxqgxiXHA2SC7MwFS2odAuAm36TlB
         4wVmPgow42t+R3K0ZYPWFMUOsNvNhGmyi6EIjXQCoau6hzhonlhHa3Y+SixoQXXbsunq
         M/BZV1YgWmFyebYIkgAtUk+wJQlIX+jBYQWxdQQlpRfHwII5vaE7tbUPJFtkST4yD9Qo
         hfMwS5Ipv2/z4BJtm5qm+N3YTSNkm/carmPAaxlPteWEPLzA5Q1p5BJ9AGFBA6Uhx9hv
         UpKy3x1YuzseIVhxhF3w6+ojz3YlVzO1N6AzT8tI4keaidTYM5bDiFFGWV8CsUcDRxrv
         +wAQ==
X-Forwarded-Encrypted: i=1; AL+hErGDOPRY+Sb6+Gmb0AyvBUoDBtTYCmKPxI+rMW3dG1Po5PrBbtHEzQbuMcsaApFvynPFsSmXVHLYwRDRzV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wULmVgEfls3kAX2zgWNISCQmCtuCnK/ONkOPPFf0UAA39pQFX
	fZ6BjZhgRpClP6Q/QdOm36eEB4ERml3aH8JvXYZjut3SBC3dFrCzWXFD3CkFc50S4PY=
X-Gm-Gg: AYBFou0kAM5/zx2uC+GvBC9PzFNS/Yp8E3M5aE5iwZe7yMjZ6/XuegeOtWfStZnUT5z
	wKgFtHSKukmVs65Wc2/qmfWPyOd2chR6xvPncVu3uMiET9yiqnPY3cPEWOzVPxEvWUW9Ceu4aCP
	m7VYte/GVXYeB2beSQ7xvur/qLSBaw05mzYM337+hOHcK9K1HlwSuSDYGKZimw8HGxshrD2Pv+q
	E5pIKAU11QGWYGc+uRCte1RXSqLKBJxzLAdC5Pvm7R8MEhlko5n6pAgudvlLRJxzLbV7MfuqGUc
	iuDG/WJIsyZiLBN4s0tNDi19/9DyMyxDHegzC5kfeDtYZhW60jVmQxJ04Qn6vO9dJKviB782EeP
	SVt0G8Wdm+cjw2yhbUtfohlLpPWgsm3+LvoSULCWo7HIWVwMLNEB4LGZtIEqD6hxGpiyrDGydL3
	xzCZr7I1l/n/vxEkVdniaTnBW/NYcUj6j6kDB17JSlaC7/2BkrdobNCldSdxtowJXPd8glbMk73
	SsarsW8iWLjcwBp+ohKcxrMVzi2sjwCmgEJSfsm8cxXQYd4fvIa5vusMlOJfP3VnMVY0n8Y09rq
	QFnr3VkFmJbg86jYF22E4Lkg5gzkX+Aw1sRnlmKui2Q=
X-Received: by 2002:a05:6300:4090:b0:3eb:ace1:4b4a with SMTP id adf61e73a8af0-3f2feedf19dmr618205637.71.1794352400889;
        Tue, 10 Nov 2026 15:13:20 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b27cdsm1353357b3a.19.2026.11.10.15.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:13:19 -0800 (PST)
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
Subject: [PATCH net-next 2/5] net/mlx4: factor csum flags into mlx4_en_csum_flags()
Date: Tue, 10 Nov 2026 15:12:56 -0800
Message-ID: <20261110231304.1859217-3-joe@dama.to>
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

Extract the code which converts skb csum fields to WQE fields into a
helper. This helper will be used by a follow-up series implementing
software USO, to reduce code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 00210dbae1c3..f6059b533eac 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -861,6 +861,16 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
+{
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+	if (skb->encapsulation)
+		return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -891,12 +901,12 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct mlx4_wqe_data_seg *data;
 	struct mlx4_en_tx_info *tx_info;
 	u32 __maybe_unused ring_cons;
+	__be32 op_own, csum_flags;
 	int tx_ind;
 	int nr_txbb;
 	int desc_size;
 	int real_size;
 	u32 index, bf_index;
-	__be32 op_own;
 	int lso_header_size;
 	void *fragptr = NULL;
 	bool bounce = false;
@@ -991,12 +1001,10 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Prepare ctrl segment apart opcode+ownership, which depends on
 	 * whether LSO is used */
 	tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
-	if (likely(skb->ip_summed == CHECKSUM_PARTIAL)) {
-		if (!skb->encapsulation)
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
-								 MLX4_WQE_CTRL_TCP_UDP_CSUM);
-		else
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	csum_flags = mlx4_en_csum_flags(skb);
+	if (csum_flags) {
+		tx_desc->ctrl.srcrb_flags |= csum_flags;
 		ring->tx_csum++;
 	}
 
-- 
2.53.0-Meta

