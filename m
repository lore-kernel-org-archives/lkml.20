Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788432;
	b=GmORxb+zM5Mvx7q/yug2G0EnEkqYgIz19AAt1c9EmErZJUHvcIaxOMd7Bgl/Ndi39rWO
	 jyuwlPFq9bEJSWw2Uvz8vGtg7BWiRYvQGMNSB8Rtd3azDQEVqauQWRFvm30K6NuqQTWzR
	 NBASC560IT5PlpWNDM6qKzUy5Y8oBZm3s0707BdAkmiuZPZ4bMGV65OoQ3XIm2JFVetjx
	 9r+zslrhQOggKF12z8pc1kvF75oSvcol5AP9XSJhkBd1dTpzYtVrBHmRXVfT+APrmx739
	 uM+GHkCxoFpIEU8Y6/bKdf3e8G/MaXTZ9Sb/C8hNJcXqQHvt7H3XB1nRQ6b60FW9Kcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7hhjMhMlf0hWX4EL6DJukBZEvd//7wsBPb4Om2A7D4Y=;
	b=SkxucrFV9GxuxWzLgwBghfaaE7p8cj10exyUUOsBqN0/CveiaNF9jDhGyp7UOGBhxsXo
	 YUCq0N4+686MWuXeN8Do7Rcc63q1fGip1iGOtkOzHmTzowx+w+nm8GxV3RZoT+kwPqniS
	 7M4fYQqX0u1qUpjGVSHbNA0idTeMBWTiciqNsMLV8MnhZxrIMQkRAczv0ucfu/gXs44kw
	 Huwvs89E5lZMJfc2zOph0G4Bf3QEdGyrdorkT79bzI/TH77G+JkmBpG89Q1d/lJevEHT4
	 3KQAHNDH3xa+FI7DjXWlg+ewitLaBZnrN78uRrne52lh6P+I5BlRD+REayFnX36PYDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DV0Jo9sJ;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285A60A261A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6285A60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DV0Jo9sJ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso1326509a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792788432; x=1793393232; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hhjMhMlf0hWX4EL6DJukBZEvd//7wsBPb4Om2A7D4Y=;
        b=DV0Jo9sJOeYtNS+GdqyayVG5BEcagncM8oFKKusfUD1jTkbxCSz9f2owmdAhLsONzI
         6VMo44vULDc77PjPYhWnvIqfY95D2DW6RpH9m/8KFk2ua88Ax9ReUj4hEwwOhmYLM34D
         conUs//z2Y6gVNp8QeIKHxGHHEriQmJcCDqQizmWdirl7O1+c6hDcHFegm+QI1tbI8ay
         b49C8x26cq0VxtGHldPhW5djJsh0ko0ZmaLh8LyPtwDCwH6RqEgYg5APvHFgnO+uKQQB
         USDNSS/EidUR5fBo6uDjxCW+ep084B+S2PdwTOovegRYAVW9vVGZsjVIGohFlAcgTg0A
         ED8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788432; x=1793393232;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hhjMhMlf0hWX4EL6DJukBZEvd//7wsBPb4Om2A7D4Y=;
        b=aI1zlUZlVVPgnrH3aVUJnCI4KXNRoC7Afb4ELX1/vWl3xLIS7omaWhRey595vA/T1Z
         raCBI1piYukH+k3T4T+7vqPj9KvaAsWJmGD+Vl88hCYn56mvOU9CP9gWJCY6RkV2Kyym
         N3rYezG8TCI8UnqngnpAh4DxifR1Pia2IgVtVNChy6A6xmTaVjDBhUfdv71zsh3JzTdb
         H78qwukN/ry0NZb1uTqdOts9yQ82j/SXfnpDwNqAUHmFZkq+kSbsJ/9crKbXyHEMoFzX
         vYij1jZ+MEy+bINMOkvcAP5cmkqguvwyqQqNq6WtW2K0uQrWeUv++UK8Z3fIyZqkN+c8
         XF4w==
X-Forwarded-Encrypted: i=1; AKwUvBwFuBzI4/IUv32dSzrB8XJHS2NSNHaerkih5e3gjeW3uaOMQ6JNVwh5QrTExYTrIy1cNHscyVy77jbP2/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv0yt4Kxte7NOA4rLRLec+WEimF2pOJR9xb7rcf1nX1k30FFaK
	yWZ+tpx4DYk8NR2WffUVPMfb95C4OVUBxk6MdtaHG1z+5QToDaGO0EL68nyOZPQl/yCbksDMFSP
	tkOQVKXxSaeyg4AXj73eb+csn9w==
X-Received: from pjrn18.prod.google.com ([2002:a17:90a:b812:b0:3ac:3453:b5d5])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:280c:b0:3ad:870d:1bfa with SMTP id 98e67ed59e1d1-3adead57cbfmr304919a91.23.1792788431642;
 Fri, 23 Oct 2026 13:47:11 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:47:06 +0000
In-Reply-To: <20261023204706.3112215-1-hramamurthy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023204706.3112215-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023204706.3112215-5-hramamurthy@google.com>
Subject: [PATCH net v3 4/4] gve: Fix link flap after ethtool ops
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pin-yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pin-yen Lin <treapking@google.com>

When modifying device features via ethtool, GVE causes a short link-down
after the ethtool command completes, which can break scripts that use
the network interface right after the ethtool command.

This issue was discovered and actually triggered by the
drivers/net/ping.py selftest. Modifying checksum offload features via
ethtool caused a transient carrier drop ("Lost carrier", DHCP lease lost),
causing the immediate ping invocation to fail.

Fix it by calling gve_turnup_and_check_status() in gve_queues_start()
instead of deferring the link status update to the service task, so the
carrier status is updated synchronously before returning to userspace.

This change was tested using the DQO RDA queue format.

Cc: stable@vger.kernel.org
Fixes: 3b7cc73628ff ("gve: Use link status register to report link status")
Signed-off-by: Pin-yen Lin <treapking@google.com>
Reviewed-by: Joshua Washington <joshwash@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---

Changes in v3:
- Retitled from "gve: Make ethtool config changes synchronous"
- Fix the Fixes tag
- Refined the commit message

 drivers/net/ethernet/google/gve/gve_main.c | 61 +++++++++++-----------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 52c152a986eb..e2a016f4430a 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -1423,6 +1423,35 @@ static void gve_queues_stop(struct gve_priv *priv)
 	gve_rx_stop_rings(priv, priv->rx_cfg.num_queues);
 }
 
+static void gve_handle_link_status(struct gve_priv *priv)
+{
+	bool link_up;
+
+	if (!gve_get_napi_enabled(priv))
+		return;
+
+	link_up = READ_ONCE(priv->link_up);
+	if (link_up == netif_carrier_ok(priv->dev))
+		return;
+
+	if (link_up) {
+		netdev_info(priv->dev, "Device link is up.\n");
+		netif_carrier_on(priv->dev);
+	} else {
+		netdev_info(priv->dev, "Device link is down.\n");
+		netif_carrier_off(priv->dev);
+	}
+}
+
+static void gve_turnup_and_check_status(struct gve_priv *priv)
+{
+	const struct gve_ctrl_ops *ops = priv->ctrl_ops;
+
+	gve_turnup(priv);
+	ops->report_link_status(priv);
+	gve_handle_link_status(priv);
+}
+
 /* The passed-in queue memory is stored into priv and the queues are made live.
  * No memory is allocated. Passed-in memory is freed on errors.
  */
@@ -1486,8 +1515,7 @@ static int gve_queues_start(struct gve_priv *priv,
 			  round_jiffies(jiffies +
 				msecs_to_jiffies(priv->stats_report_timer_period)));
 
-	gve_turnup(priv);
-	queue_work(priv->gve_wq, &priv->service_task);
+	gve_turnup_and_check_status(priv);
 	priv->interface_up_cnt++;
 	return 0;
 
@@ -1562,26 +1590,6 @@ static int gve_close(struct net_device *dev)
 	return err;
 }
 
-static void gve_handle_link_status(struct gve_priv *priv)
-{
-	bool link_up;
-
-	if (!gve_get_napi_enabled(priv))
-		return;
-
-	link_up = READ_ONCE(priv->link_up);
-	if (link_up == netif_carrier_ok(priv->dev))
-		return;
-
-	if (link_up) {
-		netdev_info(priv->dev, "Device link is up.\n");
-		netif_carrier_on(priv->dev);
-	} else {
-		netdev_info(priv->dev, "Device link is down.\n");
-		netif_carrier_off(priv->dev);
-	}
-}
-
 static int gve_configure_rings_xdp(struct gve_priv *priv,
 				   u16 num_xdp_rings)
 {
@@ -2056,15 +2064,6 @@ static void gve_turnup(struct gve_priv *priv)
 	gve_set_napi_enabled(priv);
 }
 
-static void gve_turnup_and_check_status(struct gve_priv *priv)
-{
-	const struct gve_ctrl_ops *ops = priv->ctrl_ops;
-
-	gve_turnup(priv);
-	ops->report_link_status(priv);
-	gve_handle_link_status(priv);
-}
-
 static struct gve_notify_block *gve_get_tx_notify_block(struct gve_priv *priv,
 							unsigned int txqueue)
 {
-- 
2.56.0.257.gf7497c7d27-goog

