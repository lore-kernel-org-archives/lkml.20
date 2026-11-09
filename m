Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248444;
	b=VUYXsf+T/tTYW9dQO+uyv+U+Ls6M1RYb+SjNn0IIOtKqfjIh0kO1M1jUHMVjJsRRG4Ss
	 DhXXlx6tcCnMAtUhhFPPrhnhB2ciPWtlV00gZZOhie1vz2mRckncVxosae17ChLQZ7T6G
	 t7sDMdcrA0PrTviq7lLsc4MoLzNTCZ8dlfne4vOQu8sc9n6zboEuDxM+JqMR6Xq+7VhQl
	 8GIbhgj80282/2epiQRIjYgpoXHpJDrCmSFCVGfn8ERqSy5Og0XE3uZdwHsdeAdSazwwP
	 fdyUZivo74pNmHxO1pVLq4ZYrjlT0kPu+jl3D8r9dwRsJg+im/DWLXP+DGoFJfv77hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ymhL8xoF/8YKzsevUnnZhRK3yv2uatdwTABN3AakMkQ=;
	b=DC+7iAsWf8jsArQEzosw+7FNIvn4vFUTX5yjtcaUiSizlzivdzjpvvVKUzcaV917tB5j
	 DQmRnKJojNuGLf3w4ARp54UMYh/v7ZURqHB0W3n9JKhKpbVWEHT5ddW02mnDe5y6L26Df
	 2ABx2VZEuoE7SF6IB/dkT6DPHbZSdq9PI+QEklNUMkyy0oFvwqshorgDpqo6T/+K0PRi0
	 qcONfvec1E08nEs7GdA2f+72zeA/xR8/aTZmpB/n+fXtUBNFWDcst/7bFlV/FOkszf3xs
	 PixSgkced2tKF1Zw01ETtg7NwlVnHjywCscVAC1yKFGAb/v/Mje1HFWidu7TfwPfGwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJHYz34j;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8C60A2627
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D8C60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CJHYz34j
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so16517605ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248444; x=1794853244; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymhL8xoF/8YKzsevUnnZhRK3yv2uatdwTABN3AakMkQ=;
        b=CJHYz34jsEx7m78zSHP7Fy/nLPotJiE0m+bcwDDnbRGhV/T0Yop9isyjwlCibxqwkc
         n0EB0WOmgkNMEtQy7M2RWUcUXCWlt1Qga7B0pk3aX5g14hiEablqVIeQsn09TVRrXYk9
         zWNgc2MkoCZyV8UWWYwrazkm0V7AQ7QcUvNnDZnewliir8x8PUDSENnCmfMYFn8jmxNl
         XNMLzAC7nGosUXGhVxc4nYBVHHvuuO8ZIhd4dTq8i0AmiGphX1KbIeYbtxmDUYd5oO6F
         gLBjMNPMCqvClMENtiO2VSB6VAsIIKIp0mW7hAJyaWh4PhbU3t1yNAo8V6JpDr7RIeZK
         uGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248444; x=1794853244;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymhL8xoF/8YKzsevUnnZhRK3yv2uatdwTABN3AakMkQ=;
        b=2UJr18cECFjTVNUL3bQlgIk9pBwMYIwu4Nis8YVj+I0yZgSRr8EAKRtt5GFxPiPHKo
         OIcvjfro40gctftsJSGfqvmKHgywZrsYUIh/Eby/Lv0Zz3hzr4F9ZuCWVG8Smjt0zYJa
         vyDXnqDWcAyE7VX269BVEN87OBy1+nc/jwSMSiENEidz0YZ3Q0NOsdA3Wq0J5ZGScVol
         /Hia2hqiHil02/TMNN/4TRzTk8cg+1pVyY2V6SDhY4rKjfHWUnD7oAr/begAHiuZViAp
         Gy507KpfDyawcu0fCLt38sNF7wT2rulSGXC3vtDEdqru8qTzLKeJwyE6KHkK0hP7o32x
         /GzQ==
X-Forwarded-Encrypted: i=1; AL+hErEAL3r3IQ2otIn9nrypQSz0qLJVKJYe4dii85hy60oSVbhTklW1X5rLlIftMerH14wtPld/6msT2koHdvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vbmc5hsi6flIpT4OVqvU4GGJ+vJv8Qsyq0mDpd92CHm/IY8kr
	Mrmvk31lpUOBKLe67CNntS6mTQ+UA3MoFPszV+9vuCut4jNdltXWsyEsH6MzyF2UN3H3Ryxphro
	8CM5AYaAwqWYnZdXhBMeOiruIRw==
X-Received: from pjbob9.prod.google.com ([2002:a17:90b:3909:b0:3b0:9a80:7971])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:51c1:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b166cd48afmr429025a91.16.1794248443749;
 Mon, 09 Nov 2026 10:20:43 -0800 (PST)
Date: Mon,  9 Nov 2026 18:20:36 +0000
In-Reply-To: <20261109182036.2910559-1-hramamurthy@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109182036.2910559-1-hramamurthy@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109182036.2910559-5-hramamurthy@google.com>
Subject: [PATCH net v5 4/4] gve: Fix link flap after ethtool ops
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	jordanrhee@google.com, willemb@google.com, przemyslaw.kitszel@intel.com, 
	nktgrg@google.com, maolson@google.com, jacob.e.keller@intel.com, 
	pkaligineedi@google.com, yangchun@google.com, patricion@google.com, 
	awogbemila@google.com, csully@google.com, jonolson@google.com, 
	lrizzo@google.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

Take netdev_lock() around the link status update in gve_service_task(),
so that it is serialized with the synchronous update. All other callers
of gve_handle_link_status() already hold the instance lock.
Still queue the service task after the synchronous update, so that a
reset requested while the service task was disabled during gve_reset()
or suspend is handled once the queues come back up.

This change was tested using the DQO RDA queue format.

Cc: stable@vger.kernel.org
Fixes: 3b7cc73628ff ("gve: Use link status register to report link status")
Signed-off-by: Pin-yen Lin <treapking@google.com>
Reviewed-by: Joshua Washington <joshwash@google.com>
Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
---

Changes in v5:
- Keep queueing the service task in gve_queues_start() so that a reset
  requested while the service task was disabled is not delayed (Sashiko)
- Clarify which cases the service task kick covers in the comment and
  the commit message

Changes in v4:
- Take netdev_lock() around the link status update in
  gve_service_task() to serialize it with gve_queues_start() (Sashiko)

Changes in v3:
- Retitled from "gve: Make ethtool config changes synchronous"
- Fix the Fixes tag
- Refined the commit message

 drivers/net/ethernet/google/gve/gve_main.c | 73 +++++++++++++---------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index b5e2f39a903c..76ab304f1905 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -17,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/timer.h>
 #include <linux/workqueue.h>
+#include <net/netdev_lock.h>
 #include <net/netdev_queues.h>
 #include <net/sch_generic.h>
 #include <net/xdp_sock_drv.h>
@@ -1431,6 +1432,37 @@ static void gve_queues_stop(struct gve_priv *priv)
 	gve_rx_stop_rings(priv, priv->rx_cfg.num_queues);
 }
 
+static void gve_handle_link_status(struct gve_priv *priv)
+{
+	bool link_up;
+
+	netdev_assert_locked(priv->dev);
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
@@ -1494,7 +1526,11 @@ static int gve_queues_start(struct gve_priv *priv,
 			  round_jiffies(jiffies +
 				msecs_to_jiffies(priv->stats_report_timer_period)));
 
-	gve_turnup(priv);
+	gve_turnup_and_check_status(priv);
+	/* Also kick the service task. When the queues come back up after
+	 * gve_reset() or resume, this handles a reset requested while the
+	 * service task was disabled.
+	 */
 	queue_work(priv->gve_wq, &priv->service_task);
 	priv->interface_up_cnt++;
 	return 0;
@@ -1570,26 +1606,6 @@ static int gve_close(struct net_device *dev)
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
@@ -2064,15 +2080,6 @@ static void gve_turnup(struct gve_priv *priv)
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
@@ -2406,8 +2413,14 @@ static void gve_service_task(struct work_struct *work)
 	gve_handle_status(priv, status);
 
 	gve_handle_reset(priv);
+
+	/* Serialize with the synchronous link status updates, which all run
+	 * under the netdev instance lock.
+	 */
+	netdev_lock(priv->dev);
 	ops->report_link_status(priv);
 	gve_handle_link_status(priv);
+	netdev_unlock(priv->dev);
 }
 
 static void gve_set_netdev_xdp_features(struct gve_priv *priv)
-- 
2.56.0.455.g6c5a503b38-goog

