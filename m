Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930853;
	b=ymZbpbb8f/cHzJCv0o9T0dDLuHXknpVms0qY2ZtPQRAJfi2AXAbaJqHcc3U9vWYTabM0
	 86Kcd48TgYiAIvhShxfoBeG9ITqTKLR7969jMs3+Uq+8fzQ3jSoq/kxUIl/dvPUWvFWxK
	 vSJ4Cwi3bhwPrdy6RQ2EPQ3iZCqppVnVN/e3qk8vxir8kf1kPLFhSy5ObgxLHUNeR62EQ
	 6R6riypM8v3C/KaRJBiHYbsGvDmQrXMxnugP7M17h3zkBJMuOfRqVcX0Q/sFMbJTba5bI
	 f6kTLyglVXHJpco8R+BHpQabMXxtUXEyOYdBIe2mgLkRc9nvxSIOk3R09BicYy1TmhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=by2bd5gLHMPxECvhXlWBaNJseiE+z9NdjwcyfDzXx68=;
	b=zorgsIE535QYq/gDTiJnj9KhfeL8Y53FcCdfGXK0FThHk6rfqBDMZlwXpaea4Buzp2xv
	 9E9I4pf+LKSp1UnbHVbmZNYqVh6fYXHnFlDr3veS0mrfDSVq7/K1r0HjcHHZQTbC6C3kr
	 Lf7rN9r9Ksj+RaHPiKxIaBoKXKaGPhPP0RRKnN3V/hQrwQAPh0dQivsRtgNu8CeeUhvOU
	 8tl2YvJ7KLho+FDZTPZEVt5iD2+e8OqP4Y+RrvrdTsm1xMY33xCK6msT0avqy8osuGosY
	 iD8t7P4vi1Ux9Nn+92tM5if4ZQLRYx42+UgaBZzW/7k/qUv4T1qr4Ek2Rw1JfoYKyUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aH7dMZSL;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B4606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7B4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aH7dMZSL
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2993846b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794930853; x=1795535653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=by2bd5gLHMPxECvhXlWBaNJseiE+z9NdjwcyfDzXx68=;
        b=aH7dMZSL5w52kf0WReb1/Kc6Ph/cSU3o+/Lzwkz2mKvdaCWW8I+BNyAxLL0TPCfgND
         SQPRuZ80nY1CKuey4aggKHEDeYYiLBFsSu6YIPmWTVFIlL0cV8RkTpiXKGL4Kk/xIUha
         czFlJa9T48Iprbftjw/nlQ1k+sXID82VxI9hq3LSJmnqmJcmJnmR7eONA8ykZqPxIVir
         yrpQBlT06aES5ho63aUV/Lhy0mSEevZ2rSbomdjVmi0Jz7A1nh7CrHtdBCyQxq9UUNDd
         Ws7VHkzuTuvBN+uLEpVDBfew9KPbniazcwrlC4rhSCRJMIVbljTofihZ8mgiPqsr8xwk
         3DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930853; x=1795535653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=by2bd5gLHMPxECvhXlWBaNJseiE+z9NdjwcyfDzXx68=;
        b=dPgqLK75gXcXfOCN1g5sCVeDMiQPbYSzfamDoKE7giH9+vxTY+i5Q0qHQmoEvO9Fmo
         bgsHY7IwPMGbAbinfh/bwMZTLDd01sKJySoyvm1mve7DbVnxkz9rqj6SW4BYcclEnwgE
         yH9/p1qGFp3uy2bYnj/SsajMrKEOlN3mVvrNcj6hkKwCFmiWAw9rJYIvLetYFj5M9NlC
         YdEhhqAxDGfPv0w5yNSj69/krKf0jnLYxyp48WabXoGZn9KhxsOcBRDbKizalUcnUk8/
         KU7xBMiTLTVImLfCSu+/hOiiImbvFzQ5JYR5vxKLkSD4PF5SbG4j9bYhfYaU/SrCvEhC
         gmEA==
X-Forwarded-Encrypted: i=1; AL+hErGSaPIllub535SB/33QWAnhLTlv5MtTwSR98FYD7XmUbPFwBk6ZfXMDagdWb/OUdSZlMtp560DKgt480dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mk/RQiXnNkNcG+9P5/wUqwAK4dJjb0I0nbCykfOn3kxGez5PQ
	I75YXwnD8Y1bcMmJH4rAzVFFLoHa6Mc/NRPlWts2abXXiPxkGt/YwEK2kE+2oopF+ss=
X-Gm-Gg: AYBFou1EhRdSLg3A+dQ79/DS+v1Okwi4evXSXBtY5LeJTeJ5ozSibgq8kaadQAjpVg7
	GFZaDhMMIUjt+snZrNEHDJXSNZTal9zfl23VZIGQMzeH0M2RGbcZkVxTGCb8spJTaNP6Y8ZJ1dQ
	xAS3AXyIrd4uJONm80vE1fIfUDDotIeYcQ3bARM04BeCBASTdoUquO1yF3EaTyx3wboPV6Whg2/
	7pRmILJJE68m2EOssxS2o3ybQTNWw2JOUR1Ut9fRo9q5/c+RIO4WYPAYDAAcMpv/l5FLrcqDjsk
	ZzDsxkpJB2IFJ5HrYr8ru//gPaPffEgRtZDYThD2wZX6eISEg8Dj/ZPwSOlckcmR6ghzIYTsJuR
	viB8GaFgCQEMbOdP15wSMEo6/36Iy0xmtkD28tn5qIjY4gjV0FrJYOmdsLtlUnLQp8ysrMlFscW
	9uTITgwXSuWkzaWD89V/saIMojA6Chnrj8TMj6IeExJ+NU2nTl1f7MS1By+JUd5tQyi0qoros3N
	nv9PAp3deW8fLaw8SFaFJ5BFT2vWSJr7VT3E9ai9wNCX/mc34DGv//gyEvXJ4CRJLzsp9gXwZ2a
	0Hhnrvj33F+JZLh6xVg4NkCuIF8+Feck0Ou7UfVxRt0=
X-Received: by 2002:a05:6a00:8d5:b0:892:fc00:6e74 with SMTP id d2e1a72fcca58-8beb7d195femr12866795b3a.27.1794930852949;
        Tue, 17 Nov 2026 07:54:12 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed20548fbsm5781813b3a.37.2026.11.17.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:54:11 -0800 (PST)
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
Subject: [PATCH net-next v2 4/5] net/mlx4: track whether a TX doorbell is pending
Date: Tue, 17 Nov 2026 07:53:49 -0800
Message-ID: <20261117155353.2250540-5-joe@dama.to>
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

When the stack sets xmit_more, mlx4_en_xmit() skips the doorbell and
relies on a later call in the same batch to write it. Nothing records
that a doorbell is owed, so a path that ends the batch without writing
the doorbell leaves the WQEs posted before it unannounced to HW.

Add ring->doorbell_pending, set when the doorbell is deferred and
cleared whenever a doorbell or a BlueFlame write is issued, so such a
path can flush the deferred doorbell.

Place the flag in the cache line dirtied by mlx4_en_xmit(), next to
prod. That line has no room left, so move tx_dropped, which is only
written when an skb is dropped, to the end of the struct among the
fields not used in the fast path.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
v2:
  - doorbell_pending moved to the area of the struct marked as cache line
    used and dirtied in mlx4_en_xmit. In exchange, tx_dropped is moved
    among fields not written in the fast path. It is only written for
    drops and is read for stats.
  - Update the commit message.

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 9 +++++++--
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h | 3 ++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 97f27e005810..123071a47bed 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -194,6 +194,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
 	ring->prod = 0;
 	ring->cons = 0xffffffff;
 	ring->last_nr_txbb = 1;
+	ring->doorbell_pending = false;
 	memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
 	memset(ring->buf, 0, ring->buf_size);
 	ring->free_tx_desc = mlx4_en_free_tx_desc;
@@ -757,6 +758,7 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
 	iowrite32be(
 #endif
 		  (__force u32)ring->doorbell_qpn, ring->doorbell_address);
+	ring->doorbell_pending = false;
 }
 
 static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
@@ -784,16 +786,19 @@ static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
 		wmb();
 
 		ring->bf.offset ^= ring->bf.buf_size;
+		ring->doorbell_pending = false;
 	} else {
 		/* Ensure new descriptor hits memory
 		 * before setting ownership of this descriptor to HW
 		 */
 		dma_wmb();
 		tx_desc->ctrl.owner_opcode = op_own;
-		if (send_doorbell)
+		if (send_doorbell) {
 			mlx4_en_xmit_doorbell(ring);
-		else
+		} else {
 			ring->xmit_more++;
+			ring->doorbell_pending = true;
+		}
 	}
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
index aab97694f86b..c28d5213cccd 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -274,7 +274,7 @@ struct mlx4_en_tx_ring {
 
 	/* cache line used and dirtied in mlx4_en_xmit() */
 	u32			prod ____cacheline_aligned_in_smp;
-	unsigned int		tx_dropped;
+	bool			doorbell_pending;
 	unsigned long		bytes;
 	unsigned long		packets;
 	unsigned long		tx_csum;
@@ -311,6 +311,7 @@ struct mlx4_en_tx_ring {
 	enum mlx4_qp_state	sp_qp_state;
 	u16			sp_stride;
 	u16			sp_cqn;	/* index of port CQ associated with this ring */
+	unsigned int		tx_dropped;
 } ____cacheline_aligned_in_smp;
 
 struct mlx4_en_rx_desc {
-- 
2.53.1-Meta

