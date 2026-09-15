Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4492F83B5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455341; cv=none; b=jBH1OYD87UDojDyZriR0g10sRBx8/NyYIUUgYPKEsMkg1DCXWEK3rEHZOHobEHPBAx6SmHLBgrIiOfx9/AxZzkPyG/RCLzWyH2wA46DqNQvgNSHVAtZA/kGz15Sx1SdmocBE6rK3/km0bSdw+dQ7ryaeTX3ION9U5iNCkOf6tLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455341; c=relaxed/simple;
	bh=3CW90rJKwWLBPZ8YHnyFnZ6a1XPTW9hv+mR2QBoZwrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0AcVPb2TfRLYMpO4G1CjeaWjmrJRYR5yQhgGNFiXk4b/dzvNm2fjOrN3oMq4+lIhNoRHCceVoFkRyHSADX9RZzNSzaY3CTXEvUmDUXLTNt70Pjcy8459WMvLU//3UielOjK6ksHuRreHSgN8by3gG38feHznCwhCcqMjk2twf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT9JHR2Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT9JHR2Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so11136075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455338; x=1790060138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK3cIv3eA9Wbpi6yK7r4L1UxbUiz8LF7wr+ECYNcigM=;
        b=KT9JHR2QjrGYb2GPg+zXt8FIOO91bGnSBOdUozpF/Xfg+96r/edZazoJsqv6aZMTqM
         5rufsIWnzzTu4JbBXF2uovSFmUbotqxfA7gsLLjmVeUYx1HI3A0U688auL2M6oDJcVou
         8JdmLUF4l7IsXIgXzvYFrCD8lO6MdxA7v54wqN5jQRHztE/rHM9i5rEdyCRUetFiGgbZ
         UxCM91pAC8zpBHsPVXo+iqncIZZyxmMz7bCTq8US9iI2kB+P6FsXEOXR1/YuL2gxwCrz
         EIdzr3I5I3yTVGMQDKQT6SHO2Y4RE0euKhH8jw+adkuT/lhOBE0z0Bskuwy1QV7DD9kc
         nt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455338; x=1790060138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK3cIv3eA9Wbpi6yK7r4L1UxbUiz8LF7wr+ECYNcigM=;
        b=OE65IPgiIYAMOaGWgRk/aHyTaFaAhovGxZiRQNrA1JywVIEI2nphb8jjUjadNEr3bk
         5dMjWF0LAIuqfffcR3kZXgWkB7q3v9Al4ELtlz9h35ms27cOdydYAStPd3SU86a9Yzcj
         drW1k9HPc/kNNrE3cvr24Wp+m4mTwK1tctbrMh1msfwoNTD30gMByHzPk5sZPLgvoSuJ
         rj1r9F0VAT/JEW1+9k6zh+veR9xOttbXm19D56okPh7SQ+8Xwo3FTjWNd8KBr2uAkWJS
         2DDQOc87werkNhtoDuMEWwhpZ3rausW3kPek80WMa+UqYV3UGs++YBxsh06yFXzDOQXo
         Hhlw==
X-Forwarded-Encrypted: i=1; AKwUvByIKj7t+znKKQeMpNp1cg5IoVOjWKJF4wr1p1BCv5NVsdjX9fGumAWSKqqSECft24qNseJmZp2KaT6cwy4=@vger.kernel.org
X-Gm-Message-State: AFuF++kR0vsOFek/bMej5QbplJTzIdDVz+K5OxzMUxqTZZSthJN3tpdX
	1YlJ+9Evwoz1N9Mrl4PPw3bUrNK8AxbQ11qmGqyaJcGRyW0vDbozgAna
X-Gm-Gg: AYBFou30LMLsMprLOuyycL5qIoGHkxps5McM55VfUPi0VcP6LEw+Dbk8N6tyCx4sJ/1
	3NsjvTjT9+NYqGFxQuDcNf6bCJfusslpm6Ncs7BKVRXQ2ad2gXoZhJo9zjvNSP0aODJENqpYkpc
	RI5Fs3ilmmduOO1wTHan3YnFrKm+Aq2JgplKssrxPjBpTdId1L754GKmHEcvOQOkvSqCYVKQPce
	xnm2FVYzoH8BBXB9otHw3XsKUGhE/z1ML/xJ/dqQ5pCw/TxKKQM7+AAZ5n4UHTS5CMnYjgTWSnb
	PVKAOw6WLzkjQ4nJJ80hgbPwm2zboeMlZgNQv365WR9KJYprZIKTDdXLc35huz1FCeSm19/fss/
	9ovbS6zSwJGgx3ZO1PI4xsM4bgC5qsEgZOi0ODjN6I3QPjAiJQmQX2Xa38oah3pl52j7u0UczXZ
	YoHcV9la9NoLifEuk3bJSNcNaO/gI0YiwPNBK6OY0KMXzugZZzAYdtYVXQMsmBn7Ox09lFdnH1n
	KBOy6rROUhisYvyBErekH1QE+/xRyfA1KSItx96
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr73955375e9.19.1789455337805;
        Mon, 14 Sep 2026 23:55:37 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm46002775e9.4.2026.09.14.23.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:55:37 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next] net: axienet: add a TX timeout handler to recover a lost DMA interrupt
Date: Tue, 15 Sep 2026 09:55:34 +0300
Message-ID: <20260915065534.102249-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axienet_dma_err_handler() is the driver's only reset path, and the only
two places that schedule it are axienet_tx_irq() and axienet_rx_irq(),
both on the XAXIDMA_IRQ_ERROR_MASK branch.  Every route into recovery
therefore depends on a DMA interrupt being delivered.

If a completion interrupt is lost the queue stops making progress with
descriptors unreclaimed, and nothing ever schedules the reset: the error
branch cannot run because no interrupt arrives, and NAPI is not polled
because it is only scheduled from those same handlers.  The interface
stays wedged until the driver is unloaded.

Add an .ndo_tx_timeout handler so the netdev watchdog provides a route
into the existing reset path that does not depend on the interrupt that
was lost.  The handler only queues the work; axienet_dma_err_handler()
then performs the reset in process context, as it already does for the
error-interrupt case.

.ndo_tx_timeout is added to axienet_netdev_ops alone.  On the dmaengine
path lp->dma_err_task is never initialised - INIT_WORK() for it lives in
axienet_init_legacy_dma() - so scheduling it there would be a bug, and
watchdog_timeo is set in the same branch for that reason.

Tested on a Xilinx AXI Ethernet MAC by clearing PCI_MSIX_FLAGS_ENABLE
underneath a running interface to drop completion interrupts: without
this patch the TX queue stalls permanently, with it the watchdog fires
and the interface resumes passing traffic.

Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..b5927e979c34 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -55,6 +55,10 @@
 #define DMA_NUM_APP_WORDS		5
 #define LEN_APP				4
 #define RX_BUF_NUM_DEFAULT		128
+/* Well above any legitimate TX completion delay, including the worst case
+ * allowed by the DMA interrupt coalescing settings.
+ */
+#define AXIENET_TX_TIMEOUT		(5 * HZ)
 
 /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
 #define DRIVER_NAME		"xaxienet"
@@ -1884,6 +1888,30 @@ axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
+/**
+ * axienet_tx_timeout - Driver TX timeout callback
+ * @ndev:	Pointer to net_device structure
+ * @txqueue:	Index of the transmit queue that stalled
+ *
+ * Called by the netdev watchdog when a transmit queue has made no progress for
+ * @ndev->watchdog_timeo.  axienet_dma_err_handler() is the driver's only reset
+ * path, and it is otherwise scheduled solely from axienet_tx_irq() and
+ * axienet_rx_irq() - so a completion interrupt that is never delivered leaves
+ * the queue stopped with descriptors unreclaimed and no way back short of
+ * unloading the driver.  Schedule the reset from here as well, so a lost
+ * interrupt is recoverable.
+ *
+ * This runs from a timer, so it only queues the work; the reset itself happens
+ * in process context in axienet_dma_err_handler().
+ */
+static void axienet_tx_timeout(struct net_device *ndev, unsigned int txqueue)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	netdev_err(ndev, "TX queue %u stalled, resetting DMA\n", txqueue);
+	schedule_work(&lp->dma_err_task);
+}
+
 static const struct net_device_ops axienet_netdev_ops = {
 	.ndo_open = axienet_open,
 	.ndo_stop = axienet_stop,
@@ -1894,6 +1922,7 @@ static const struct net_device_ops axienet_netdev_ops = {
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_eth_ioctl = axienet_ioctl,
 	.ndo_set_rx_mode = axienet_set_multicast_list,
+	.ndo_tx_timeout = axienet_tx_timeout,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller = axienet_poll_controller,
 #endif
@@ -3054,6 +3083,10 @@ static int axienet_probe(struct platform_device *pdev)
 	} else {
 		ndev->netdev_ops = &axienet_netdev_ops;
 		ndev->ethtool_ops = &axienet_ethtool_ops;
+		/* netdev_watchdog_up() only arms the TX watchdog when
+		 * .ndo_tx_timeout is set, which is the legacy DMA path alone.
+		 */
+		ndev->watchdog_timeo = AXIENET_TX_TIMEOUT;
 	}
 	/* Check for Ethernet core IRQ (optional) */
 	if (lp->eth_irq < 0)
-- 
2.47.0

