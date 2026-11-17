Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930848;
	b=x570S/tEdxX9qERwXocCWtUHm8rD1putGeGqzG3owJHa1uhrj4jLZSLR6aH1XVIdmb1O
	 OHblRg8VdisgieyniMYnij+SMoxK+wGSJ8SlvelVDDGSSH8eNePV7jm4NrguLFxuOoUj6
	 c/mm5vmT3q72sdhFuzWK2Cmd3URFjQLRQTEqXznF+N7uFnj1uJFZVOlY+LInbAL41Bqjl
	 esX6nt4c90M/v94vfOsN3HWQE3kUlTe3/fJwrFzuQgkGrpo4mkUte7jguFXZFgnUPuJkE
	 AxHz0E0lMJ0Kh8R02+VRm0qqrAs7MWh/FZ+kKf/mfjRz6QMl3EjhE1Dc0ZN5V+a7OhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
	b=1BKps4wyaT5tcm29lydvBDy85sKOGlTA5KCm9x9BpSYFl1AaOyVJgmjSjcDF4Mzn05Ow
	 ehkgE2cWuKri35+tXfx0uT0v7gRzD7FoXXlooaeV5YryNP/PxOpJBmxAipgus2nz9OiRP
	 JYWbFGU6DdCh7YqLf1rYrh4mdRxx2BuKSaOscNv93lY1ptFXRnjDKcIyKEF6HAwJlY1Js
	 179o/N/UiO57BLN3dLXLQFMX13d9Ojz74N6GgFcHSo3Y80dE5yc3KPYcMQRR4kwoPxlxp
	 UoaQL1+J2m8DtdZxNdOetDXPCyY2j5WThxQw24rjpKsGtU9DjXdej/2cEPXxmVO48PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NRWBHVqx;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966F606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A966F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NRWBHVqx
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987a2ba0cso30219165ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930847; x=1795535647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
        b=NRWBHVqxDtrZjDj810zSeDDkUYy70Fy2OixwQJx4w288utTEJ2lhTiDKh07xvr/vYH
         yLV+zf1kh5q1IU3c4fIARPakpLRFUzh2iQd3rORcU6P5ve41M64GrOuSBFnlvh3IFEps
         6gFDQtoVKzUGsm8jlQNb09VLw/T4v9qt2f/ZLa0sUFXnOtpTmoNrenLOep2ZDmF9rDqG
         lcZXqAjsuHWujLYdr9AeOIesJONIaXGLf4i7BPnL/bxAb0liHoWrPGM2CzH/41uqUF1j
         FO7xelRfvhlmqllATZKtUfxmq+/cLf3FGwj+8rvO2cv4UKUYzKPLRFzqvP3JZYZCL8MJ
         wu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930847; x=1795535647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T2YU1tH+CNIU0dqfT1pwQhaFGOXLajMVIubV/u5Dc70=;
        b=J7gdch2cz78bUPy+peWKxNzt/srNV38/7xOWVAM5lgF8Zcg7hcvQydKMpmE36ss/MW
         w3dQay/6iEeLeladev9kalwnR0UYYmup9368e5ajpmuOpKpnKhvAnh6gDJiJIrtV/i6y
         VYsiXdrJXB6BtouZ6nsCa7xSSiRtq3Q5EXBPcXsutMLa1bmzyrWY023iwV5QGY3uxqBZ
         P7hRKatyQ6+HDDpIy2K2Dbpg1s9PI98Dta2yEMw3BpocCE42K8Kzcdw1ISQJSu6UtcUs
         57brwVAQzrMK40FGmOgb7RElJqeyfeao5EpJiuZPbWQWtsNUq+SlOR4iYi7Cxcde3IpT
         m6+A==
X-Forwarded-Encrypted: i=1; AL+hErHcbtxzu9NbBOXK81sISDQEsxISHcnlbM7BLOPg9ZWg06gNfLatqfdB6r8whYrPTB6x4uWWwAFYBmjgjqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LcQNplJ6ABRShW18SYeiRA6YDa1yV4ODeuvfAxnwi1VVHnoEz
	JYzPurnM+5VAyAIKrd/hzTyABF4OGmJpZ3/fuUhqmWdhxiJc7OPZ4WUk6UhSaHED9dM=
X-Gm-Gg: AZFdTZeqPGQlWYRD5Af6udykw37iF/5cCA2HClH20L8OLPO0iPfu5AaIarNoKlf0aNa
	6tLyQnyQHVDQ8nR/io5KGO4eJf5+ilxBMREgckTby3UGRzNEB5F2nI0dLbXmrZx3IN2l/8rfGe8
	D6oiGqLaMUZtBrBkwtQcqQky187PZPjt8FaDpMzg7hsNJGtYc86yvphWWGfTdvBQr7KHq4UxBW/
	UXQlo9h8/wr8wQuDk7gQ6XQeLI4a9mA5LgrUu0KO8oHQwAq6cgHUubNGSZsZZqvYF50nh/XNqoA
	xYwW6+BOD2gH/noJqmlH8KfU6GKA1FMcPYYVrNeKzdqfEzTSIXShKAfes9wLZEB7k4I1aQDmo4X
	GDlb/nip7vxLhfGNNfSy9dGWNwty9vkthuZL3QWl5pl4rPMUgavhta37r1hjq0tMd60kBnkWN2t
	n5YozdGxUzKknHJp8rObynZ595XnaLqcnmGR/Y+A270nC66WhSh4Pg7r7UEGkB6k+4kftUf7wna
	GHQRbvpNVecjmX+FlVw/dxBVUDZMsfDftwc2ajuO1eqEqUvbtGRBTmp5Et6mzm8cxWzoBAUVrOl
	bw/XfbQIBMTHGNvPplY02Em+7pEo+jVQednKICN1Tw==
X-Received: by 2002:a17:902:c406:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2ee0da7af82mr132965015ad.13.1794930847005;
        Tue, 17 Nov 2026 07:54:07 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a54576sm18946785ad.40.2026.11.17.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:06 -0800 (PST)
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
Subject: [PATCH net-next v2 2/5] net/mlx4: factor csum flags into mlx4_en_csum_flags()
Date: Tue, 17 Nov 2026 07:53:47 -0800
Message-ID: <20261117155353.2250540-3-joe@dama.to>
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

Extract the code which converts skb csum fields to WQE fields into a
helper. This helper will be used by a follow-up series implementing
software USO, to reduce code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
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
2.53.1-Meta

