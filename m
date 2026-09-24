Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE7B4C8C7F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276028; cv=none; b=GlyGAG2zeXV5HK+jaY8VV120DyC+E/JeXZt6qB+fVYyK+7fW//K/Tzd74/OOgkHeNAOa5BZwOJzCiC/80r4byFNpihRVokP9yjQeWj+we7cpKgEpAOno2lMeDGl8lzFiZtUwaRPRrL4ezAwahwJ/6B59vN8kYYazRcpU6hNUXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276028; c=relaxed/simple;
	bh=omqFVCAY3+UhrMoHlGmPEeByh5AoFvpVjAbSgN/UIBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pr2lIqp9ozir6NW7z3LxHEy5C4zI4aaqcKE+2yM736Exlrgexh8tGev2U3Y2UUqEKqMgd10CkXz1sUOXmnUKa60oVcFTYmraAYoqY1McF35jRv1Kl/uCX5PTQf3ie4/jpsFvsSHlKZ3H0p+aCrbqHNmh3cbxDp4UsDYBTtEtVwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WNLHgQr8; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WNLHgQr8"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso81802a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790276015; x=1790880815; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nA9SjFeN7PdwcW5gyxXemAR3gJeIGBFhaIDunoOTXek=;
        b=WNLHgQr8paABpbygTtEJbyqjJ11kJLHDpL8NoqL6dH0RF2tHa9DDheIZNObhFgirGD
         iuTsikBEmwqNcDsWkVSW99va6nNkT1chhtVLfWCFVrHIe9TDn2PbLbGs7ky1ucGEXXnN
         wSwG5oqg1ig2x4vqVoT3xc+wYnoDg4kt0LSdSZhq7kZtGzhFm9RKeRiDwq6bV1WRgFDW
         rbtb/A5Ovrufo2QsQNvUUzsXLNq6G4sqdnuguMvUQNhy5Fs2pzKsimMF5pnoa0cpj95l
         3sdmRzH1dSPssWp9+cvdheqGXZIMH5fiAzsA5Qz2MuuVBFG7/kjvFjBiJmX3QNQUQ7Yo
         kHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276015; x=1790880815;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA9SjFeN7PdwcW5gyxXemAR3gJeIGBFhaIDunoOTXek=;
        b=PKTbQtD/WJThnHcr+rsJQxpcmho55MO9PjbynJ6wSqk2FTwNUxg6qCPj8Tx2IARWTQ
         8QLY5xBP07Hb4+AAv7YthkMFU1LXem/Tn/D5yeSTiy/5RhwUhp7mpPwQzO6N5mYYBH0Y
         Q/WhJsfmb3NYkAjf/iKoua4RST/lyp8QCQftGMiyrhRDRPgTHN3qQxumtglHqdSL/odd
         ssbOFlvIkuuFecPOPsGnVwBq4ShhskP/NYbJ9T+UwS37ZuxWNQKLycdKcg+iGVuX++wG
         /ynIN+zeGbG7LDkIjeS4SGQh36Km+sNRjDjiOMaNoygx/g4Z22xO1EQpdaacFkUge/Po
         KX2g==
X-Forwarded-Encrypted: i=1; AKwUvBzu2kDesDpojB1/v2ovLwnuMA4XcTafYzpTwJOW2kKJbRUgz+C3gZwn96LS2+AHtkj9rwKD92a7Iz1copA=@vger.kernel.org
X-Gm-Message-State: AFuF++npBOrBI7HWdoXXUp5PItxTKLzlxCnwKuXPPKpy4Vn1tuIXtRpB
	o0lG5HOX4eO2wWW85EbB4iKf14jf0fPznXvrxkb3JX8NOficeImdyG7Te2ZBZUq6Nc9tCi4Mtl2
	RHcfeilAyRlF2hs9d7nUekRmU5Q==
X-Received: from pgbdp12.prod.google.com ([2002:a05:6a02:f0c:b0:cc7:560d:c26b])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:734b:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3de0e7f4acemr3566305637.13.1790276014501;
 Thu, 24 Sep 2026 11:53:34 -0700 (PDT)
Date: Thu, 24 Sep 2026 18:53:15 +0000
In-Reply-To: <20260924185316.2831077-1-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924185316.2831077-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924185316.2831077-12-hramamurthy@google.com>
Subject: [PATCH net-next v8 11/12] gve: add ctrl ops for queue operations
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, jordanrhee@google.com, 
	willemb@google.com, nktgrg@google.com, maolson@google.com, thostet@google.com, 
	jacob.e.keller@intel.com, debarghyak@google.com, kees@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"

Add the next few control ops to

- create queues
- destroy queues

These changes are just moving existing code into ops, no functional
change.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---
v6:
- drop unintentional change of gve_priv from const to non-const

v5:
- remove double logging during queue creation/destruction on err also (Sashiko)

 drivers/net/ethernet/google/gve/gve.h        |  4 +++
 drivers/net/ethernet/google/gve/gve_adminq.c | 50 ++++++++++++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_adminq.h |  2 ++
 drivers/net/ethernet/google/gve/gve_main.c   | 43 ++++--------------------
 4 files changed, 63 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethernet/google/gve/gve.h
index 016e85ed91a5..00966b6a730f 100644
--- a/drivers/net/ethernet/google/gve/gve.h
+++ b/drivers/net/ethernet/google/gve/gve.h
@@ -843,6 +843,8 @@ struct gve_device_info {
  * @configure_rss: Set up default RSS configuration
  * @setup_stats_report: Set up DMA region for stats report (AdminQ only)
  * @reset_flow_rules: Flush all flow rules from device
+ * @create_queues: Sends commands to the device to create TX/RX queues.
+ * @destroy_queues: Sends commands to the device to destroy TX/RX queues.
  */
 struct gve_ctrl_ops {
 	int (*map_db_bar)(struct gve_priv *priv);
@@ -861,6 +863,8 @@ struct gve_ctrl_ops {
 				  dma_addr_t stats_report_addr,
 				  u64 interval_ms); /* AQ-specific */
 	int (*reset_flow_rules)(struct gve_priv *priv);
+	int (*create_queues)(struct gve_priv *priv);
+	int (*destroy_queues)(struct gve_priv *priv);
 };
 
 struct gve_priv {
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index 05b011417bf3..54f235ea27c1 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -943,6 +943,30 @@ static void gve_set_default_rss_sizes(struct gve_priv *priv)
 	}
 }
 
+int gve_adminq_destroy_queues(struct gve_priv *priv)
+{
+	int num_tx_queues = gve_num_tx_queues(priv);
+	int err;
+
+	err = gve_adminq_destroy_tx_queues(priv, 0, num_tx_queues);
+	if (err) {
+		netif_err(priv, drv, priv->dev,
+			  "failed to destroy tx queues\n");
+		/* This failure will trigger a reset - no need to clean up */
+		return err;
+	}
+	netif_dbg(priv, drv, priv->dev, "destroyed tx queues\n");
+	err = gve_adminq_destroy_rx_queues(priv, priv->rx_cfg.num_queues);
+	if (err) {
+		netif_err(priv, drv, priv->dev,
+			  "failed to destroy rx queues\n");
+		/* This failure will trigger a reset - no need to clean up */
+		return err;
+	}
+	netif_dbg(priv, drv, priv->dev, "destroyed rx queues\n");
+	return err;
+}
+
 static void gve_enable_supported_features(struct gve_priv *priv,
 					  u32 supported_features_mask,
 					  const struct gve_device_option_jumbo_frames
@@ -1787,3 +1811,29 @@ void gve_adminq_teardown_mgmt_irq(struct gve_priv *priv)
 		priv->mgmt_irq_requested = false;
 	}
 }
+
+int gve_adminq_create_queues(struct gve_priv *priv)
+{
+	int num_tx_queues = gve_num_tx_queues(priv);
+	int err;
+
+	err = gve_adminq_create_tx_queues(priv, 0, num_tx_queues);
+	if (err) {
+		netif_err(priv, drv, priv->dev, "failed to create %d tx queues\n",
+			  num_tx_queues);
+		return err;
+	}
+	netif_dbg(priv, drv, priv->dev, "created %d tx queues\n",
+		  num_tx_queues);
+
+	err = gve_adminq_create_rx_queues(priv, priv->rx_cfg.num_queues);
+	if (err) {
+		netif_err(priv, drv, priv->dev, "failed to create %d rx queues\n",
+			  priv->rx_cfg.num_queues);
+		return err;
+	}
+	netif_dbg(priv, drv, priv->dev, "created %d rx queues\n",
+		  priv->rx_cfg.num_queues);
+
+	return err;
+}
diff --git a/drivers/net/ethernet/google/gve/gve_adminq.h b/drivers/net/ethernet/google/gve/gve_adminq.h
index 0b48e9f2a82a..d696e4932a8b 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.h
+++ b/drivers/net/ethernet/google/gve/gve_adminq.h
@@ -628,6 +628,8 @@ int gve_adminq_configure_device_resources(struct gve_priv *priv,
 					  dma_addr_t db_array_bus_addr,
 					  u32 num_ntfy_blks);
 int gve_adminq_deconfigure_device_resources(struct gve_priv *priv);
+int gve_adminq_create_queues(struct gve_priv *priv);
+int gve_adminq_destroy_queues(struct gve_priv *priv);
 int gve_adminq_create_tx_queues(struct gve_priv *priv, u32 start_id, u32 num_queues);
 int gve_adminq_destroy_tx_queues(struct gve_priv *priv, u32 start_id, u32 num_queues);
 int gve_adminq_create_single_rx_queue(struct gve_priv *priv, u32 queue_index);
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 0cec289f89e4..38c964ac0e3a 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -943,33 +943,16 @@ static int gve_unregister_qpls(struct gve_priv *priv)
 
 static int gve_create_rings(struct gve_priv *priv)
 {
-	int num_tx_queues = gve_num_tx_queues(priv);
 	int err;
 	int i;
 
-	err = gve_adminq_create_tx_queues(priv, 0, num_tx_queues);
+	err = priv->ctrl_ops->create_queues(priv);
 	if (err) {
-		netif_err(priv, drv, priv->dev, "failed to create %d tx queues\n",
-			  num_tx_queues);
 		/* This failure will trigger a reset - no need to clean
 		 * up
 		 */
 		return err;
 	}
-	netif_dbg(priv, drv, priv->dev, "created %d tx queues\n",
-		  num_tx_queues);
-
-	err = gve_adminq_create_rx_queues(priv, priv->rx_cfg.num_queues);
-	if (err) {
-		netif_err(priv, drv, priv->dev, "failed to create %d rx queues\n",
-			  priv->rx_cfg.num_queues);
-		/* This failure will trigger a reset - no need to clean
-		 * up
-		 */
-		return err;
-	}
-	netif_dbg(priv, drv, priv->dev, "created %d rx queues\n",
-		  priv->rx_cfg.num_queues);
 
 	if (gve_is_gqi(priv)) {
 		/* Rx data ring has been prefilled with packet buffers at queue
@@ -1113,26 +1096,12 @@ free_tx:
 
 static int gve_destroy_rings(struct gve_priv *priv)
 {
-	int num_tx_queues = gve_num_tx_queues(priv);
 	int err;
 
-	err = gve_adminq_destroy_tx_queues(priv, 0, num_tx_queues);
-	if (err) {
-		netif_err(priv, drv, priv->dev,
-			  "failed to destroy tx queues\n");
-		/* This failure will trigger a reset - no need to clean up */
-		return err;
-	}
-	netif_dbg(priv, drv, priv->dev, "destroyed tx queues\n");
-	err = gve_adminq_destroy_rx_queues(priv, priv->rx_cfg.num_queues);
-	if (err) {
-		netif_err(priv, drv, priv->dev,
-			  "failed to destroy rx queues\n");
-		/* This failure will trigger a reset - no need to clean up */
-		return err;
-	}
-	netif_dbg(priv, drv, priv->dev, "destroyed rx queues\n");
-	return 0;
+	err = priv->ctrl_ops->destroy_queues(priv);
+
+	/* A failure will trigger a reset - no need to clean up */
+	return err;
 }
 
 int gve_alloc_page(struct gve_priv *priv, struct device *dev,
@@ -2495,6 +2464,8 @@ static const struct gve_ctrl_ops gve_adminq_ops = {
 	.release_db_resources	= gve_adminq_release_db_resources,
 	.setup_mgmt_irq		= gve_adminq_setup_mgmt_irq,
 	.teardown_mgmt_irq	= gve_adminq_teardown_mgmt_irq,
+	.create_queues		= gve_adminq_create_queues,
+	.destroy_queues		= gve_adminq_destroy_queues,
 };
 
 static int gve_init_priv(struct gve_priv *priv)
-- 
2.56.0.rc1.310.g51773c2048-goog

