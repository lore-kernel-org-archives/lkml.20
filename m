Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E554A7F3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875616; cv=none; b=s8k/q5WWIFWxbtnKco+eq87lXBo+CQ/equZQHCgZk/4X73ujM4xvpz8/hR8w2OzS/Ybw6GvPL+YjVztUSmhZHWaDL4cfoQU+BsbRZ2tUL6ndxyPB74WaS03pA7ureE2UAtKPz588dNUAqkKgsvQqrUDUF6i0o0i35FJZBLciG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875616; c=relaxed/simple;
	bh=Bi1cb3woDgCQH/9tomuCwCHWEJ1hy9AZu85Iv7PLKkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBUSGmBQGD/sWd6cbO4KjfHchpvJ8qcNbmA0Ik4Nlx5STcI3/0JQiCE8lcDqrvZxHGrFf0P4gNwx19sAMTRQ6otAmEaDpJsOc6CmPNyWTPkYNcu8QdYAzImjHhKrgYVoYa678Nkxs5JZcMVdNfC5/c73bTEyQI9NYAPRjFkN9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=UuZK2aDT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="UuZK2aDT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c252e703fa3so717328166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875607; x=1789480407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=;
        b=UuZK2aDTRtGmVuw2ov17H4rYrxOqC/P6eeNckBhkBzU/9IcvEnYlkrZaH6CSSQJ62h
         pmlSblLqVmwZMszu+UerWqrn1han9OysTkxdnTRKFWYmj0/VtiFnt+PSS2/cdAWjM96q
         dlGstfiHrQRtq95lOmE/bLkhZT0sBu5ZBG8mtwy4Oou6l1ZW/7WO8AujT1RHh+oE5Hfd
         rSsNFqJrH4Cx63nD1sY59tEKZkALcj4CGE4lGbcyQMz49KpPeRPpVMyQCoYyuq+jKaJk
         A/TmfYMA0D3uzt5QT3p/vULg6xYNXYAitfSdGn/P8DRsENdnqYCLYSBzRyG+CfRYeOFT
         TR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875607; x=1789480407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y/xU9e5Bzn6V96XBSS35d3RBrYr4Ir2RWo4uuGwhTc=;
        b=XcHxw82Kzby0ARleRJunTiEt6kuiR4+gSGP+Jko+ZaYK4czaLb7AOMrT1gHhowcBDS
         EOL/iGjEPIxMPg2ELt8Fo9VAYajaPbWTm27lVaeufoPLL7aSiRLZP91Kpdsg0O3HmeQZ
         yY1gSm710AN1Y+6W+C2Pz+7DO75DKeDBVLsGgiUpTrDYD5WUW78NJ0FdYD4OZBjPfq0g
         nsa0sfopnHBv9e8qGxjzy7U+0DNGKLq3hc9t7cp6X7px/tZVwyR8hdS7ZOpNJNHiKFHR
         ujf2udAF8SwkdUg3HK5z/zsRFUL1dM9D1kQrsevJP0GQfOtmgM2ngj9Yc0JvV5AkKsTm
         Xstg==
X-Forwarded-Encrypted: i=1; AKwUvBwXxTWdQw3RTq5d9bsGf/sBzGWimdbfKf/hU7Dh7JP5bTWbA7d5lznO1KuJS70Iri7EckNgILlMfvEo11M=@vger.kernel.org
X-Gm-Message-State: AFuF++nur+RnRIx+A+6AucWTVe6oBV+5C2w8mOO1x7kXwTOy2y2rUJuV
	s6PFG3qm53RgIp6tjUckkgb2Pj2kFvv7wzRQRSL3LKJucn0kfLzXOkrnm7CnISOIDA==
X-Gm-Gg: AYBFou1wdovbn/L5fkODJbBe5ZrU46XPpJZdu/cFlSxoD/6EgX5Xu4mJVDwcT5SqSBM
	hAeFD8HptnnsCDwZ6Om05SrQp9Sfbi5S4tG8Wl/WMpeNi07OdEA/mC+8+Wm+ozjUIoKt9XjJ3Bb
	P/zlfmnFw/BnZJSNYSvZgrWxdzc4K8+GRmKbhNkU2sbToL3pqmVwYQfjPpN71VtMYKLnq+OK7AO
	uWR29CyDAW5u8177OppceqGMhoCy1+5Ig6YmVXdpMBbYpepur15eUszx0XYTl5AQOOj4nsiEueH
	w0g3XnOe5oZLZByKl4qTjheRi/1ED+eiSDHP1GceacvN2vNF841xWQG/7fN4kVrLK2UoZRm1V5i
	Lrl8gmSx+KqHZFAJZZSGdJGSs/bpIWwH9OxbxaAvn3Rb+SLGd3euexgtgL550vpgbxifruN6nd8
	4tVPx+/jO8aRGBgMPvmZzvMK0YKiEARMzWmq4i4GSJR5ftyF1krTIbRbSsE4+Qkg3i17Nlo31+r
	rICl23VbAjyJELJy9tOpa/m2E1HBEstyC1aIvPn8/2PHwgdZGbfuQ7d/ybDXI6DXSJFdBIrIJm2
	uuKrz7ysHJUNibuPnpFxkkn/6KzZvZpS/3hmFG4M1twNr6LWeLsz9kd84RmBCwD9dT2rTFNZg5C
	voXoxWxPgkntUbuP3nC1VYz62410UQkBqIcSPZphCDOht+2eTyituhg23798CVAUwVf3yTf9zsh
	jds2hWM7wvgqjM3oEV7OZ1HX6l
X-Received: by 2002:a17:907:9708:b0:c26:1648:a06a with SMTP id a640c23a62f3a-c261648b7afmr1033756066b.37.1788875606512;
        Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 8/9] wifi: ath11k: stop a scheduling round when the hardware refuses a frame
Date: Tue,  8 Sep 2026 15:53:17 +0200
Message-ID: <20260908135319.754140-9-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k_dp_tx() returns -ENOSPC when the MSDU idr is exhausted and -ENOMEM
when no TCL descriptor is free on any ring or a DMA mapping fails, and the
caller answers both by freeing the frame. Inside a scheduling round that is
a loop: the next iteration pulls the next frame out of the same flow queue
and drops that one too, so a transient shortage costs the head of an
FQ-CoDel queue rather than the tail of a hardware one.

Return the error from the transmit path and end the round on it. The
frame that met the shortage is freed as before; the ones behind it stay
queued. The round-robin over the remaining stations stops as well, since
a shortage that reaches this point is not specific to the station being
served.

ath11k_mac_mgmt_tx() returns -ENOSPC as well, for a full management
queue, and that ends the round the same way; the next tx completion on
the radio starts another.

ath11k_dp_tx() also rejects a frame the hardware can never accept, with
-EINVAL or -EOPNOTSUPP, and every frame with -ESHUTDOWN while a firmware
crash is being flushed; those describe the frame or the device and not the
ring, so the round continues past them.

ath10k and mt76 check for room before they dequeue and never hold a frame
at this point; ath11k learns of the shortage from ath11k_dp_tx() and
cannot.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 41 ++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ffb6b865c2df..12535926631b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6499,9 +6499,9 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 	return 0;
 }
 
-static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
-			     struct ieee80211_tx_control *control,
-			     struct sk_buff *skb)
+static int ath11k_mac_tx(struct ieee80211_hw *hw,
+			 struct ieee80211_tx_control *control,
+			 struct sk_buff *skb)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6533,7 +6533,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 				    ret);
 			ieee80211_free_txskb(ar->hw, skb);
 		}
-		return;
+		return ret;
 	}
 
 	if (control->sta)
@@ -6544,20 +6544,36 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
 	}
+
+	return ret;
+}
+
+static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
+			     struct ieee80211_tx_control *control,
+			     struct sk_buff *skb)
+{
+	ath11k_mac_tx(hw, control, skb);
 }
 
-static void ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = { .sta = txq->sta };
 	struct sk_buff *skb;
+	int ret;
 
 	/* ieee80211_tx_dequeue() applies the airtime queue limit itself, so a
-	 * selection ends where that limit binds, where the hardware queue is
-	 * stopped, or when the queue empties, as the generic handler does
-	 * today.
+	 * selection ends where the airtime queue limit binds, where the
+	 * hardware queue is stopped, or when the queue empties, as the generic
+	 * handler does today, and additionally when the hardware refuses a
+	 * frame.
 	 */
-	while ((skb = ieee80211_tx_dequeue(ar->hw, txq)))
-		ath11k_mac_op_tx(ar->hw, &control, skb);
+	while ((skb = ieee80211_tx_dequeue(ar->hw, txq))) {
+		ret = ath11k_mac_tx(ar->hw, &control, skb);
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
+			return ret;
+	}
+
+	return 0;
 }
 
 static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
@@ -6569,8 +6585,11 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 
 	ieee80211_txq_schedule_start(hw, ac);
 	while ((txq = ieee80211_next_txq(hw, ac))) {
-		ath11k_mac_tx_push_txq(ar, txq);
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
 		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
 	}
 	ieee80211_txq_schedule_end(hw, ac);
 
-- 
2.53.0

