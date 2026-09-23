Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB913D4125
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197682; cv=none; b=inFP6h06FJh/ldZ+/Gkxxfc0pn/Izb+xZloHBXNwYuhIhFyY2IAuTysHKNwKWwgb9dA2RiWALJUbiG/LakQvqeMhuQajqbSaAmOz+hEd1EA5zb4h5Pj+9Ovcwj7SDy6otc1vrXmvvtduJ+v6FejyRCK5lZZaahymYc9UPmUAC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197682; c=relaxed/simple;
	bh=+9ObR8sZ6oxPHgi0+oswXpBH/VC2XkRBGmM9k23GnkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CS+YEUOlzmqecSF+QSd6EwyIR36WM2kb37mlBWMXyu0xBUN5gjkH5lI0vbJNBmx4W7svZY0Qw+GbhED7oUZwahP4fr+tLs9or7DmB5cO9/v5k31VyrrOjfVrs08v56MoLqcmQVQ0WoRl1q9u4nBxSSl/uk4BZIIHIn3LjXwDn6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=wfbQgxt9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="wfbQgxt9"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso8046285ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790197674; x=1790802474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=wfbQgxt9wVGDq+cXS+L+LaX7wdr5CRtLon/t403RyCFwYXjB3hfJzoNqDQ96mfXdXh
         werfKpVRB+HKdp1JuTW3ssoTBjmLIcs9UDynfmavMxu8ao8bf8rt42nGF1x2/pMC5kg1
         BrKPpvv3xxxLWZTvrCosPE7Qpu1RA9nQG7608Mb1ap9g+HRXafDLLMlzP0ZECrV2WQkE
         7mPcKF5sdoCZ5BvNJ56FAKX8pHTSzoK9ho/4n885WsffeOsQBIRJIvZGePepgEDWnsZk
         YmiioLxGDBJUrVtggnHAAtS7bKBzi6NHNPK0ApogyxFThQv4Uj4RO6mpXcjFzCta6Yy7
         s8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197674; x=1790802474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWTLyua4wnNjgucbsZIX9QDTCvjLZHoMRXqqxyAwH6M=;
        b=hWLzpG7QfyIiT15HUmRCRQ+t8b59xsWXo3WOizaIzUemrrmrjSBfy3yn0BvdlEYeYv
         fDSfpAgxKGBT5x2S6X0axkbVgXL/DZxRjP31tyJbv8aTJslP7IZZOjqzEUyXu7Xhs6/H
         pP3Ij2TTzmq8Q9b+OliTURmkKAG36zHYM6ZtmR8cWo1GNDfZOAlViQox5J0XfsxAnUvO
         FWQtNYoK+KQ0KOMw4qI/Mrx0xmlIJrI3FXZPRMuWcjK6yeOBb5ZoJju7PmEwn5OLdbjR
         vQuwgspVruLtAhkJXwjICU5mlXhg/1Fzy3UU9AwMaPHPWbe/A0VpNZ2/OAaUg31bWpec
         4ZKw==
X-Forwarded-Encrypted: i=1; AKwUvBzJB91lskvA0Vx8o/XO0FIo8VhXh7F+7/T0mfccrrGryXISY/AZ2Gk5m17rCso47KupgqgCT8NIlBGM3Sw=@vger.kernel.org
X-Gm-Message-State: AFuF++m+vEQUgs6uWUUGc4qw5LC6cdwzZaERvIey5SbYGW90xYwDXnDW
	Cdu5e9kitTQ5RZwQAXjB+prTrHcSde7CaYb2CmAp0tWh5pODKlBuSrdXuU3kBJCm79g=
X-Gm-Gg: AYBFou0XWC72L5czIGMPxCMpp605AOLjLvDN2JKJZ/fJyPZJOArgmsd3YAHT907nMBg
	y8gEAZqOoFGt0z9Ac6/SI3goK+h32riJxpJkOlDkCjAj+lc0+aCPxMF2yJwK6SpU7z1eu4gVlQ0
	6wkn9I3fRYlzKzKywOHQBmlcSw+j/op18vg/eITfIjX/qXFl/ef94dz0poPh5V3pQlujd4Qz/NV
	B8vvTD8mJkay0t8BOqWwtokQNWIJG36C0VOUDyfqdouful6wNkb3/XL4Bxtksa2/tkj+fMlL+Aj
	a6T6pXp0JcSVztQTrqWA9JhIdHZ4Jzry1orWv374PzIv0FKmOCzjZsu5KL7uJ1JS36i0off+TXI
	kFDvSPPyaBp3wpvqcMSlL6pgJNXCX+0N1xnhS83OABkIWniBRlLthpsyq7oLHAw6YRQ6X6qt2yi
	n+YTHYz7Di4+pTdzy77lZwJAXcpdizAEBTk5vgYakB+JXe+zWqsc5Z
X-Received: by 2002:a17:903:908:b0:2dd:c053:a6f5 with SMTP id d9443c01a7336-2df7dc41ad5mr3196195ad.39.1790197674312;
        Wed, 23 Sep 2026 14:07:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:40::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d58sm16931435ad.11.2026.09.23.14.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:07:53 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net v3 1/3] bnxt_en: return the RING_FREE status to callers
Date: Wed, 23 Sep 2026 14:07:40 -0700
Message-ID: <20260923210744.3406861-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923210744.3406861-1-joe@dama.to>
References: <20260923210744.3406861-1-joe@dama.to>
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

