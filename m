Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21C3F2116
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582877; cv=none; b=a2FQ8P6S9ML7WMtGYUmXmauF+CrGMfvw8vkV1IsT9QTXHWCmGK6vjmRW+bGIAjmcDnELZIHc1CKCwTxnrhBLc2NkWsE0hUIJnTzu4ZuigA5Mn2tlH2/IdDutSwi7HPaV5UGZoXRGFvr0LITXDj+DTH9hHqC5AGaoRR0d6Yez4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582877; c=relaxed/simple;
	bh=jyTQX6gHVlLMAuxSV9YrNqfXCPA15cOhWl5JBqLVTn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jppskgt3XJw2ZDIktSpG5MR6dp33pCKDiaCGRcDBpLDncGRNnYQPQz8po8LU8MqSVlZew7i6oxsyUIlGIZHbQ+lJIziBe33GlOi//CT2B5DPJF33CDEiXB2tUf2x+jVDBHsLmIRcKZBTPLK3bt2vr6v7Vq0/H8PjzgOht+vcuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qkNDU2if; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qkNDU2if"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso69923a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791582875; x=1792187675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86KAF2s8MyS8a1OAHwlwG1z8Q/cZ8M57EZYH8fFLoz0=;
        b=qkNDU2ifM5TLloHirhQoMCTf/lFXWI9vPtNVCog11/fgtUIiMd6FCce8KGnXzOEpXs
         2Pi/B7XCUWUSSLOIKUFBiadkgXDyNpqjlq9ICI7iocKuU5dBdJ75nF9VzyjFb6M5Q2et
         xrFUmkkc9ksSYIvVVjLXWI8xZrzQ7IGyfgNEhsjajE3sVek3/QClnXohuwhXqQL9gP5L
         F0pyK/8ta6fNeH6dBwBnAoZR/+JDO2wLkg02p9wiMeNWLrXhBqjwPH0C9RYij5tWVslE
         z5AGRK+MCqTacmdjmA48lIpETW+JYYxF4gxu6nixOjp94qAoD8CIzWqM9bvZaHrTUTqB
         +mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582875; x=1792187675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86KAF2s8MyS8a1OAHwlwG1z8Q/cZ8M57EZYH8fFLoz0=;
        b=N9utNatEw1WP5zSnqO5GrZ/C8PpPXkVqqfjsYtIyOEYucd8a8sasXNI7kYqURzEwxv
         XcFfo5ZVMAcDezivEtJsFO6WxrAeHTGbezJT5wcko7nZOEipNuuXWcAA9Yd9Oigd5r3d
         HnhhyVDZzCgYTLQqjwggpPdXKld9OK12rhDjx+In9xw1DTQFYllB0+wvaw4WAHYbWIk6
         K51x1MVHIxGo2ZAu03+vQgBwtzLp2CLnU2yLDP5LuiLzTBz9mzhvniS7rQ4pknBVLAh7
         KTkqktGNCiIZPizlqwc99Z0rTyAs+z/QExAtm7c+eVaqs9DNtjMJS6gxv4F/n3avZVWE
         DmjA==
X-Forwarded-Encrypted: i=1; AKwUvBw0W1WpvhrRCSmPu85/P18eFn/nWN+uzq7VMnjPaHH1X1Id04BGlXbtffGO5L0yoLX1pv8/i1cRw9y1+X8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JUMKPvcw0BHsaJz+wB2DqmsfCwlF9kHn0Cvqkjq3KRRq2nZk
	5o0m0h+8fonwvjeC25m47v+8NMVQgxyEVfIhmjmRVlHwEjs0DcNRbLreKpOLcSpM9dI=
X-Gm-Gg: AYBFou0E/Er88P9bnfYa67g0xa/BfgazITDylU1+kSFHVSYAMDHd9ttBhgYzwj8QiE9
	28cXLisXPOqekoDUW9ztLtD407RBGR2jVr/Sd7qw/AoPfAYVGgNh3RItIjr00M1N6RIqoA6lHUz
	E18O850M49DhaSYSbiUFBnnzT345Y5XNxpUISOwK2kelWudwo23itUrE4ywZsfLNj0JnN4E3FgG
	O7BcYFeb92icj5YrkKSuaPEkf9uwxEB96jAkbwQ8x2pplf6UVtfpPomHsCmr4cR8QWxfbxN7hYx
	WQX2AFhst91bTBO0tZ/i4cFlkDlLJvJsrqPqmW9rK9YcQDfu3MfB+enra2QAOBm0clxsU9cHoiu
	58Stqxq+9dSQoFa3T89NyPeAYWJRBPwpbZiBQvlR7l6VnrGvqDY4KL+rXrKrKArLoTn4YsZlvt5
	taLkdzVrSPtZK1DTKvB1KLk+UiFUHPYfRkGvDkWFTQcK8r8+xKW4x5tKiMOBFm1xYI7goZ9w+n/
	3mp8DJEqoFr6i+QqXx4Sik=
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr2463266a91.12.1791582874924;
        Fri, 09 Oct 2026 14:54:34 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm6555649a91.6.2026.10.09.14.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:54:33 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v2 1/2] bnxt_en: Add helper to fill SW USO payload BDs
Date: Fri,  9 Oct 2026 14:54:23 -0700
Message-ID: <20261009215426.2377946-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009215426.2377946-1-joe@dama.to>
References: <20261009215426.2377946-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the code that fills a payload BD and its software ring entry in
bnxt_sw_udp_gso_xmit() into a helper, bnxt_sw_gso_data_bd().

No functional change. A following patch uses the helper to add a pad BD
to short SW USO segments.

Reviewed-by: Michael Chan <michael.chan@broadcom.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c | 33 ++++++++++++-------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
index 6c1060fa2ea5..ef04c9d08066 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
@@ -31,6 +31,26 @@ static u32 bnxt_sw_gso_lhint(unsigned int len)
 		return TX_BD_FLAGS_LHINT_2048_AND_LARGER;
 }
 
+static struct tx_bd *bnxt_sw_gso_data_bd(struct bnxt *bp,
+					 struct bnxt_tx_ring_info *txr,
+					 u16 prod, dma_addr_t addr,
+					 unsigned int len)
+{
+	struct tx_bd *txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
+	struct bnxt_sw_tx_bd *tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
+
+	txbd->tx_bd_haddr = cpu_to_le64(addr);
+	txbd->tx_bd_len_flags_type = cpu_to_le32(len << TX_BD_LEN_SHIFT);
+	txbd->tx_bd_opaque = 0;
+
+	dma_unmap_addr_set(tx_buf, mapping, addr);
+	dma_unmap_len_set(tx_buf, len, 0);
+	tx_buf->skb = NULL;
+	tx_buf->is_sw_gso = 0;
+
+	return txbd;
+}
+
 /* Transmit an skb requiring software UDP segmentation.
  *
  * Returns 1 if the skb was queued and new BDs were produced, 0 if the skb
@@ -181,15 +201,10 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 		while (tso_dma_map_next(&map, &dma_addr, &chunk_len,
 					&mapping_len, seg_payload)) {
 			prod = NEXT_TX(prod);
-			txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
+			txbd = bnxt_sw_gso_data_bd(bp, txr, prod, dma_addr,
+						   chunk_len);
 			tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
 
-			txbd->tx_bd_haddr = cpu_to_le64(dma_addr);
-			dma_unmap_addr_set(tx_buf, mapping, dma_addr);
-			dma_unmap_len_set(tx_buf, len, 0);
-			tx_buf->skb = NULL;
-			tx_buf->is_sw_gso = 0;
-
 			if (mapping_len) {
 				if (last_unmap_buf) {
 					dma_unmap_addr_set(last_unmap_buf,
@@ -204,10 +219,6 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 			}
 			last_unmap_buf = tx_buf;
 
-			flags = chunk_len << TX_BD_LEN_SHIFT;
-			txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
-			txbd->tx_bd_opaque = 0;
-
 			seg_payload -= chunk_len;
 		}
 
-- 
2.53.0-Meta

