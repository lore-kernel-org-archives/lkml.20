Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530543CFF5A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486694; cv=none; b=cuP5IFUd3JEG4NyK4ks9lz0Tv4RTsWf0lmWTZcCSAVvVRwfLh9yS68By2MKDgc9QDYasf8PU4xF2e1hM6Uo1lIkO9cGhyqk1sliUdxU1lrLwhB4cA9K/RwmWwaJhH7J+M0lB50v2AaRk6ukZQH/3nlsgaeUsL/hLM5kqiyWRnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486694; c=relaxed/simple;
	bh=cbC2XhUsTJLB6BZt5mpJ/2DzTETC0/qixQ2p6zN/2zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKO/2fa3ky+e5jLhQTEAA3KMSfWFEXSGlnbiAyWrpCyTI6yUDKkcjVKmvKv90lxGHJ3oj6G77e8oV3r0BJtNu1aeToecEsGOpAcdvGrH2cJbSOIpF7x0vA+awOczRs61SRtJHzzgqXQXN3GBhiyo4njuFhZ9kl2NjTno8PBDYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=otkVz3cm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="otkVz3cm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e831e86ebfso3187605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791486686; x=1792091486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Zz1mpKCSKqZegwUQ0D/3xMtgVn99v1wjaeCbwZBKw=;
        b=otkVz3cmCwkNBsvGx1tg7bGrIBdHHSKfcsf26FB8VBGsBcWSwljXMztNU3GGSG2rz8
         8R6zVST94PPpRitPDSpyHkzq2Djq1UPvgFWEkzp9raoPuh52sMYIN3T/sgX1EFvOTJXO
         UN4DKj169Yrkiss5/+VqzZz/cwL5JBBYAcUVjWrN9kjH1ABC9rc+RwyWKhzIixb68nEh
         aLW9r9ulC2qBosvXaqvzbmQSeee2IlDzAwuvXFcMXI5jOTGlNWQPiDzZSxL3WOMqTliN
         hr07VYNuUC5wxUiG6QEwYj3kfm5eLWsAf9MSQUhL0kvRdWYLr2pe89+kdg4ELOc/K/Y8
         0i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486686; x=1792091486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Zz1mpKCSKqZegwUQ0D/3xMtgVn99v1wjaeCbwZBKw=;
        b=AFbTfcZ/864plL8o4SHtb5azaRixxFXRwOWIpFn1DD6bCA+GF6rvzfa5dbFD6p32KC
         6H9fIjzlvcsfJoWe/TH331xStZm2WQSNIUieeevgtgJcHlLtpFxH6BThaWk1oNKaKx5W
         FitUcnDXNPzq1528M8Z1DKFyaYQyEQ69CkilXvctoDJKGH4bbB85gMX5jhSUrdOYBsV2
         Wpsbeg//MybVci5VXCww5qeFzvhlkmrvaYvH8jDkthAcvpkzKnr0fpiqXsmuTibkNd0+
         QurwsngiMJGM7MyhW2kRuFaev/07q2Nkq0GEs2T8x3B3+KDBZJU0CimhIaP/u2nvtgHV
         2/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCqbFdSgXwP+iJYBvghdSJTQNBt4oJte0B4C+kmqH10jWoZmF18FEIAOI9Md9bIn1k9oiSYlcCPuJDQOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaj6TrOxJn5kKLGcutsC+zIlIacnG9undC0WtzrZDAJ6Qcyb6F
	yPI7ji6CK/ZW04y1DmQWkiLBhUSchg5+KQMLDd7N5Mx0rhZyFG4iOJkoJOC3hmXUqsA=
X-Gm-Gg: AYBFou20KoN9eGC8JHvADhEwPujOc0UuWmqpWKNxyiwoJ6LKLCG6hNGaK24sNmHSs6W
	epToP+M8UtiKALEqod1AlFeLb4QpFLG2AHfRyb++mZ2t5IYvxjEhORdAaskt/ey83/oxz6Yk5bS
	kQXsPUqvgeFQ/b1LDXT7TO9THVa1/Mqp7R5wRGS92p46J6egM2B7y+78ySWnlmVYCj9g7WiJsmc
	cPpgEyfqEz8yZXSpbfwLMriHVI+hDUyjVxMn5tsgCldVJP60uX3e9AsPAmXUTYS4uIyTasB0JUj
	mpu0IhRGoEKIN6RKlVF427IeShEeSg/D0lutxyfvp0/otWHN+2kfSAPknpOczln5CnnqSKl1ZDk
	+iOdWS9iBaC/roKebV5TlJzXAEsjr6Pfkxg1SIJyTaPZOXfEomyruckRa4kpeakeEyFErYJTKFl
	qQ8pYS3LsPu0QOypKgnbOrptEx4jZlDJM3aehFtX5CvgiEyD4xvDcixXePL7o4SUdYuI2j7oqtw
	uVowoeVDJeM
X-Received: by 2002:a17:903:2984:b0:2df:99e6:9448 with SMTP id d9443c01a7336-2e6005fe110mr46098885ad.61.1791486686444;
        Thu, 08 Oct 2026 12:11:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e83cceadf3sm762855ad.45.2026.10.08.12.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:11:25 -0700 (PDT)
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
	Joe Damato <joe@dama.to>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] bnxt_en: Add helper to fill SW USO payload BDs
Date: Thu,  8 Oct 2026 12:11:11 -0700
Message-ID: <20261008191114.3736826-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008191114.3736826-1-joe@dama.to>
References: <20261008191114.3736826-1-joe@dama.to>
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

Cc: stable@vger.kernel.org
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

