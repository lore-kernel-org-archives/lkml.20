Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992482;
	b=2EnTzAXPcguMKNC98wu1HZ/rgoCnMj0o3al0x5Vyo/yTTSmEYnUQ+rjuOcdmiMcelPyW
	 Y6z8oQmMDWoH6RwQen4IMxghSjlYy38UAiUA9oJy6PkxZw2DOy0Osk/7PpQeuzNAMDfT1
	 gPaxfrzZmXNJdpVLhJfIy1bKrT6WAU7Riel+T6ufIMRv3NTObrzYmvVYFO6it2mFzFhih
	 0jF0Js7NnO15p2tQrhJimURyBg4erZNO3kyyr7IRDAnm10D04XNckFNR8e/jtfNpt91V2
	 sQy55hD3dT4aiXfhDhG2MrxizLjtchkQwaU2vDx/qS5IDxxgegAaobkLL8Plx8+WNCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kR7S8/i1XKTNJkCLT9lP58PFvpoVq2NqyFukFmYlwWE=;
	b=1Aq4BPF4smr5ptWJChH7ZuUhqA8yqK3tmu1x5Miq+6djG4nL/Dl9rQNatHJUghiRMOQG
	 cy+tLqOxw1dNopyyyVs4YdqAS5Df/DgolXQax7rS9piOOq+wpUdDY5bRPGR/N0qVDA9c9
	 vdNfl80isTcxOmkNr5XE9ioDxkTcAUXevG6/erwquU7K2YZv4H/HiBbeebkvM6Wl0vwlD
	 1yJEqdRYe1j2w4/Zkj7PweZ/RH8xdV+osJVdmx71scJda/3lZKtzcTma67REgI+/E4b58
	 lKBcdX7UOE+t+4zAPHiK5iXyTw02XxHaiq7JaV2Ixq2HcHG4uW9Hlie/VGeb+0QODCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hueZ5o77;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264E606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2264E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hueZ5o77
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb628232d2so497351a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793992480; x=1794597280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR7S8/i1XKTNJkCLT9lP58PFvpoVq2NqyFukFmYlwWE=;
        b=hueZ5o77w0GjbixA9TUefLk/Qk2bmsTihilVYhlQVmeIQl/8hgG39XKrLqIdCQ/Bb/
         2qRat2cs8sYtcAESSLbzRDghv9hPq/rN7I1Gvo4LP6pnG/WXDO4bOyujeAbl2Zgnfewk
         Nq0V5ey4fhKgb97cUsks8ewTQaCsKt4qzl/HjHKavifbAaSUbNHKt1wtRP4GiqKnohMy
         DNcpvFi0hdmbU8RgUSksBbjESGYjOwFCMPpt0BfNQT+UJnDMRRsLppX2uhiavk0cvwm7
         LBlJRT8pTTWjgtF/x88JKTSFEFOYkx3fA2XGF+/oxAit/WIKGAb3niHt70YnhQVRlzei
         hj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992480; x=1794597280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kR7S8/i1XKTNJkCLT9lP58PFvpoVq2NqyFukFmYlwWE=;
        b=eaqyl3WK8c99nx3V+EtSPQSZ99fQgR/+o9o3EDnDRW8+E/Hzpqh7xB57BdMKt8ps1c
         cpo3sMLCqfP3r8NUTuWlekqHDELsJnOI8abN9KH0oiTZd/8bDU1UzdMVCgUHAqVNE0VY
         6Bbk9K7Qx8ROZFCEqD0llvu3AV0SU04jN6wr4VjX++/ort99ElYa9KPXCTqGrmv3PPZ6
         RLUwaL2496ake4YaN6h/PuJK18HPS1LYVGpTop2iuc196sG4n+l4XWr+IVAx2Qx1E2Af
         PVHXrH1KLoA+7FpBdk6HrdRio37XWrfKlf6LsXfFM9q509rsm7u9DCYUglJFGQ9XZPBe
         Jrzw==
X-Forwarded-Encrypted: i=1; AL+hErF0e8VrgTuiJUwpQZY9kgfW2tpVL70SHiKxrF6am6jZ+KTh/Zh4LeK3r5//exxWVbUcafJuNue/xEuAZWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/O6vISjhWyKZIPTvCu3SkJMudnzWUw1MynheFCTEiluQ4gMSu
	tN+yuFdNHa6kOuH1ca2smvrSm8uqk/nPr/f16Iyf6EBF+Kl1PR6h1Zl8mk27dNfct3A=
X-Gm-Gg: AYBFou3G4g0LdYOXYhMT6WYk8NAF5EYRVvNYl4FB9M+nuUMCib4MGq9sWTZfFHkrd5d
	VEkcNvDA6JUFXleGgulf3nR1cDs2peGrQP09zhV2QoIZ6Zehp/FXc8oHg922T6y1JdFM8oS0buy
	Ml/S8/LW8JGQ3cIw9O+jNV+AryXOD0uiOEs++eMu7ob2ZISQ5vzatsMR0Dlcd5ezbhHlLHO8AWF
	Rb1Kxo4fXc5UbhFBG+BT1PglKjDltxov+fgkBQEBVv7im8UEp41n/fC+BkgH5a9/sy2X4GQkpDY
	dNfFKzA/laFnxEnLQ3OPFD4hutxLb5QZJfQdaGJtahRVdIwLAwbrat5hYIr7r7JPpBnyDgGeyuk
	R27SQHlo7N6qsemQkEmHjW0pI+lLukS5XdwiWrWzSYWPIllU1KG+w+tiqcRX5N8z5OooJ8UK0vx
	YymzUpfktasQomjFEvKq8bnvCBHkl3AOdgqTecQ8FCwig5z7sx8jmpjZ3ih5TJX8bxADlocCKzV
	4zWVrIPnCaO8FC3ZfEvQ6FPUJ7aqSLU4HAOIeNOCXYYiSCsgltQtIisJ533RMUTE2OQ1AIyqtbB
	R23zF69Cjk20dJ+2tBHEsu5R/ygu2qkybntFZqWoia0=
X-Received: by 2002:a17:90b:2650:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3b0db6058fbmr3536892a91.5.1793992480508;
        Fri, 06 Nov 2026 11:14:40 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105854fa9sm77446a91.15.2026.11.06.11.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:14:40 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v5 1/4] bnxt_en: return the RING_FREE status to callers
Date: Fri,  6 Nov 2026 11:14:17 -0800
Message-ID: <20261106191423.4194081-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106191423.4194081-1-joe@dama.to>
References: <20261106191423.4194081-1-joe@dama.to>
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

hwrm_ring_free_send_msg() reports failure to its caller, returning -EIO
when the firmware rejects HWRM_RING_FREE or never answers it. All three
ring free helpers that send the command discard the value.

Return it instead. No caller acts on it yet, so there is no functional
change.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++----------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 33c4cacc8ffe..ea8529c78994 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7679,50 +7679,55 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
 	return 0;
 }
 
-static void bnxt_hwrm_tx_ring_free(struct bnxt *bp,
-				   struct bnxt_tx_ring_info *txr,
-				   bool close_path)
+static int bnxt_hwrm_tx_ring_free(struct bnxt *bp,
+				  struct bnxt_tx_ring_info *txr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &txr->tx_ring_struct;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = close_path ? bnxt_cp_ring_for_tx(bp, txr) :
 		       INVALID_HW_RING_ID;
-	hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
-				cmpl_ring_id);
+	rc = hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
+				     cmpl_ring_id);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
-				   struct bnxt_rx_ring_info *rxr,
-				   bool close_path)
+static int bnxt_hwrm_rx_ring_free(struct bnxt *bp,
+				  struct bnxt_rx_ring_info *rxr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring,
-				RING_FREE_REQ_RING_TYPE_RX,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring,
+				     RING_FREE_REQ_RING_TYPE_RX,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].rx_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
-static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
-				       struct bnxt_rx_ring_info *rxr,
-				       bool close_path)
+static int bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
+				      struct bnxt_rx_ring_info *rxr,
+				      bool close_path)
 {
 	struct bnxt_ring_struct *ring = &rxr->rx_agg_ring_struct;
 	u32 grp_idx = rxr->bnapi->index;
 	u32 type, cmpl_ring_id;
+	int rc;
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
 		type = RING_FREE_REQ_RING_TYPE_RX_AGG;
@@ -7730,14 +7735,15 @@ static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
 		type = RING_FREE_REQ_RING_TYPE_RX;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = bnxt_cp_ring_for_rx(bp, rxr);
-	hwrm_ring_free_send_msg(bp, ring, type,
-				close_path ? cmpl_ring_id :
-				INVALID_HW_RING_ID);
+	rc = hwrm_ring_free_send_msg(bp, ring, type,
+				     close_path ? cmpl_ring_id :
+				     INVALID_HW_RING_ID);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
 	bp->grp_info[grp_idx].agg_fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
 static void bnxt_hwrm_cp_ring_free(struct bnxt *bp,
-- 
2.53.0-Meta

