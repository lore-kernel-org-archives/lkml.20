Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794177931;
	b=tvogI7bBWBppZ/aPs2XPsKnS1XYDSkuqqer2DYpSBCZ83S13pAk4Cu5+/WSZFOBMcfbA
	 KrC0J6s1cP3BA18zd/Z8ZvISymRHizCVu6DWEavpMhIsrnQyWCELW3MkpLbkIlqv5Q882
	 daGTg/Lb2I3GolIAZWTPcj+TrfyL15/WbyYpaYBlGUuWj3iK4ZhdGsyb3NPKxFQtK/Du7
	 uBMc1QhmYSWYxeyyvWgdVb4ZRbqUEfAWgJzza8fCGukfJOpeY77a/0MFm1LgjHk7dFuDH
	 SJrR93E3XmtyPI8ND0M2qHtGXVTRC8XocmQn1RkHagA5l6isFS7jWt87IX6sIeVxLrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177931;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=;
	b=i7LtlVl4btc+gvpsW2Id6m8YlewvaJ8lJGgav1rGPJyIa+UxP7ojnUcx+3ib95IUZ1i+
	 G8/a5WSJpGWI3rfBxyGkA1btWPR4PZDImLEcvBJMu32+uqRuV8wr63B8svKzeZOY6whVB
	 VJt8nRAFVA7+P3X7HLSaroFiC9idOi2CM/uF6GwKfOL1eAF7m4DoTgxfLA05z4eRQdYNx
	 RgnWRCAPq05wWrOy7Iew1uwdC5Xqb9m3uN5vYPlkjnkSendQ+hvNptPj6vmE0jMLaocqO
	 pLDeeHWyRlYJbFkeNDQbvEhRe6ETI6cSgU7c9HdBshcy9mF8QezMS+pbtFVcna74F3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PImsTz+U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F4606A31C;
	Sun,  8 Nov 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PImsTz+U
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794177930;
	b=ysOBs+CfakkD2RB/fcoss23Md4g+45fv6Yc9+wpsj/I5BCx+6zi1GGo/xyCF5QK2IFK0
	 3rL9walbz1wp1pfGH3uZOtjliCBAoPfzDD7ISofN4hvMXmw2FwkvtaJ74cB1Zzp/fGhbT
	 Yj8+GZxSnYlZZEJzJvpCNWcJksBqXd86Wzdl9gggzeuoVC2dkKYyg6LY0FVlDBE5zExq1
	 A/WLwTieEiFL/NdtCYyTtAJG5DqFKSneWxQl+sqmei5cb1kqmpQeKY1qco7XXrSCeKo7+
	 1oOLPYdnSF4owxJU3SoSwagA5JnwPmWjlGn1AskTMeyN8M8iSOQnteTyRB2TdIRUMtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794177930;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=;
	b=qNmjMjlS9zH4YfGEXtu5ETDNmVAt89A9FQbDM3a212dhRZs2StXu0thFJJkzgKTBzOVi
	 jmEEQ+ag0/4uh5R70RMG99Sl6BA+t5DL7G24X3dqkDJI9qT0d0i9XDMzFoNjh8SfvBZvF
	 p9tfj9pWQg+WK9EspJj6ncvH+UMn/tWlm8fbcPB1vpAkvHfabMUei8Ts5mO/wJm0PbDhn
	 KYtE55MWhDOOyDdZrM2wdsGCo/pO64q8DzbAegxZHEX0WGWGBPGfaipiysF6F3tQlRxGF
	 jbYOT0+GrNbZI/qLRuyELubMVaeDlury0ywBBWS3h1+YGhfdKQfp0Hy/HkLNYyE2nug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8F0D1F008A2;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177930;
	bh=gAi70O+b9M+XyXPG9paos1RXPbdyd3edSA+US5ofRU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PImsTz+UKUiErx8Oynny1eLXteyzqZSoBHpQBa0LPdggogiY2ZHBnWwIA74EUw6XT
	 SrrM++7M7IvRVZQhsQ/xaj95bkIeETSel7/peBWWDXV50AeYC+kUlhmst6V4bXsjl7
	 L86v/FcH+eE8D39/fyNAKOoBE8Kl0HjHvobBrlNugtJ83SEz/ecuZ74RY3t2xKeOhH
	 JxqQlUm7muYMkH/Bel9WNjVIvX6qcVJsHMR7PqdhSZ4zMmQJUPxF4l/xtq2rvOhCu/
	 TQskN332uEjOvVs7epcLIzfemeAWFFdYdROAqmvsaLVtupOCmQ35AFuMIlN3U6DLHa
	 7ZyhkThi7TcGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5D05D48149;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 16:45:30 -0600
Subject: [PATCH 2/2] wifi: ath11k: hand freed TX frames back to mac80211
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-ath11k-tx-airtime-v1-2-f1a02b2372d4@gmail.com>
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794177928; l=2978;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=LxmAWWQQMXKfa9BFouDf1RFN1i86hWWxom/cJtre5Wc=;
 b=cNphVJyht4nkuTRgBAVpaPIEhB8Jxt69T6T6drzPgx4QO49b0n7bTI32gsZAJSQOLCoTMwTIo
 Izs1MLT8TqsC3FwonV6wpLsVF/puiiY/yt1NrD/6yXp4McP3rOLXgrW
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com
Content-Transfer-Encoding: 7bit

From: Christopher Griffin <christophergriffin05@gmail.com>

Two paths free frames that mac80211 handed to ath11k with
dev_kfree_skb_any(): ath11k_dp_tx_free_txbuf(), for TX completions the
firmware releases with REINJ or INSPECT status, and
ath11k_dp_tx_pending_cleanup(), which frees every frame still in flight
when the datapath is torn down, also during firmware crash recovery,
when mac80211 keeps its stations. mac80211 never learns what became of
those frames: one that asked for a TX status (a control port or
management frame with an ACK cookie) gets no report, and accounting
mac80211 keeps per frame, such as the pending airtime of AQL, is never
returned.

Free them with ieee80211_free_txskb(), which reports each as dropped.
In the pending cleanup do so only while ATH11K_FLAG_CRASH_FLUSH is set;
outside a recovery the hw may already be unregistered, so those frames
are freed as before.

The change, this message and the test were written with Claude, an AI
coding assistant.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b6..6c2be57f3ae72 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1013,11 +1013,17 @@ static int ath11k_dp_tx_pending_cleanup(int buf_id, void *skb, void *ctx)
 {
 	struct ath11k_base *ab = ctx;
 	struct sk_buff *msdu = skb;
+	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(msdu);
 
-	dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
-			 DMA_TO_DEVICE);
+	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
-	dev_kfree_skb_any(msdu);
+	/* In a crash recovery mac80211 keeps its stations: hand the frames
+	 * back, so that their TX status and pending airtime are reported.
+	 */
+	if (skb_cb->ar && test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))
+		ieee80211_free_txskb(skb_cb->ar->hw, msdu);
+	else
+		dev_kfree_skb_any(msdu);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806a..56f474d67f72d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -303,11 +303,11 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	}
 
 	skb_cb = ATH11K_SKB_CB(msdu);
+	ar = ab->pdevs[mac_id].ar;
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
+	ieee80211_free_txskb(ar->hw, msdu);
 
-	ar = ab->pdevs[mac_id].ar;
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }

-- 
2.43.0


