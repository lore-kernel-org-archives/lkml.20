Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897B4B0E3F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358256; cv=none; b=dfTOEz0FdfIFhet9v+lHqUZkEOG+OKC4SMv/T1zHtcQPywEDnUW0/OaZaXPW+ateG+tCtJZA4//VnTtHoJIcB9g0SCkp4Oks82C0nqXhn5cbSAmbVVjCUf43CU/yPym1ybUd3SsaYbN7CNCxHwe+yLJSuGSr58vISCnr61xrLHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358256; c=relaxed/simple;
	bh=+9ObR8sZ6oxPHgi0+oswXpBH/VC2XkRBGmM9k23GnkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XK6XT2qrXWM3HGsfdj3G2Cy3if6vvKIOTs9mLroBVnpssyBCDQRm2mtAiQKZklDnMtZMY+mMJ4b35ecBo8j9JADJYQWBcdVD0bh38BJXW9nB6+vQdAhupbsVt7ylQBkkDZVIHhIAndlUjac4bBc882VK9nUit0o4o/xhbsum/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=N0m0RkQd; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="N0m0RkQd"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso317815a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790358253; x=1790963053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=N0m0RkQdl2gk68EeVMssiXX2sGxfa0SmJCzdeuQJLtdBUhmdQemKyFL9pdKnHF9kcI
         ssFi8QOXPB4dXM6F63wcbLbjIVPkUMcEjcURs5QajggNEgcr0TgTyzPLrZ8ANl8S10wt
         SpkPbvlz8TzU11sXkh/x1ALRmNZs1WYpz/4ePR+gkmhzENwwWHrawmw2E8NqhkjRc8RP
         B/IHmZ/rO3tsJ6E8tXpSW0emtF7xKMNNs7s0Gb7dmj33Y2G+KbL8RTdRa2cuLQ/rkME2
         Sk6WiyG/csQ6mYubm2L7/W1v+GBS1y/j0XlGrqpQirL28Ato1EY34NjfNbDKSM22UbS0
         YWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790358253; x=1790963053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=rM8Dd+UjVURdGSSyEI7EAjT1W9GIvpZC5wxXb2QK6RtbeTwED0ppAqwt5fL3XWswMz
         SA3JgtNVYvdtKHAyfPdh9MF7d0S5Y9slIBqlts+1/HzM/p0ne9rRAAtXlikMOZU9OCcu
         /HSNOn2lUcFQGPRinODc8NzvqIAPPjWrAOcMalepiMNGnaBHi/2/f/lz4pNbsMAuA4qG
         oXjaRysDqv/WYtylNwtyDMHBO5hSqthK/wUU49CwjkhDiKPtQ9oyTier0eorqeLE4o9W
         RWBYXG+DONYeXBhbYscDODAayubVTSWKvTMj7jU4VcgWgNdPTLXQ4rrXz47wX0LLJ9+J
         QEQA==
X-Forwarded-Encrypted: i=1; AKwUvByZiz8H6E0PEwhngTpjJFUN5Es8GhPv9ta4goDRJOwdunan/DNP9FWp/34DBBJnflG+yyblg8VrZYs4q/I=@vger.kernel.org
X-Gm-Message-State: AFuF++n98GIyciz5jBgH37NkZSp/5G6lhnAtkQgOsmV/jtJaD/5xowoO
	o4G6hFwOey0u3MbaRUaJSCI4vxI4WdgeXoWeIr1z3r8KS+Ftxk9UOaxu+B8oH9b+iMo=
X-Gm-Gg: AYBFou2AK/AB8yp61rwNj9MfRv/wlTcwtaCrP+hIQR7LZ0ALYTNBqEwb9uYBaJfLDST
	M5MTjwQBzXySKR4D2DGpEKH/wDEYLIzpKKQi3br/vwRI2qaXQbrEIUe4c1fPRs92JTk45qs7XUk
	m/c0MmjPk4XOtdGFV7WnS7XXPi5COAl9CRtHhsO/j209X0nlyGrXbfTVwGn0sMAprzVt8f0OvOn
	arf+Z7vb2BPJhv+CY571YnVC0stUyuqzm9NyPGpZ47/93yVJcEnKqihdsaR/mPz1bkMw4dTsUCd
	NroAhJvU91TH7sTr9xW8dkKd6NSB8AL2YgNrHcM9ybt29TuIYXcE1TAxqdft1tiMZspeaePxcM1
	LX3DyOqlYFFyrmLAn400ehx0AZpE1kDOdo0qC58DbN12CY2iJUVUYCz4lFFf/RbcZbwgdfoS3HN
	GziZtxkGP+61/8VLcB6Hpz0nwUkdn7VOPYiRQMUc4VHSl+aogID90bARGLaw7egZTZ3MUJz474p
	M86c/knkB0EEfgbavlvxpI=
X-Received: by 2002:a05:6a21:505:b0:3de:141e:c712 with SMTP id adf61e73a8af0-3de141ec98amr3845520637.14.1790358252614;
        Fri, 25 Sep 2026 10:44:12 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88dc7esm1528404b3a.30.2026.09.25.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:44:12 -0700 (PDT)
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
Subject: [RFC net v4 1/4] bnxt_en: return the RING_FREE status to callers
Date: Fri, 25 Sep 2026 10:43:58 -0700
Message-ID: <20260925174404.2789072-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925174404.2789072-1-joe@dama.to>
References: <20260925174404.2789072-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index d7728d0c5b6e..a7f6facca7b4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7660,50 +7660,55 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
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
@@ -7711,14 +7716,15 @@ static void bnxt_hwrm_rx_agg_ring_free(struct bnxt *bp,
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

