Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6FB33A6E9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289334; cv=none; b=PN9kPzuK2DByQLEDMDUM7F4PPWp2QoOExd0pnNUQyk5ERrA4k/yJTUi24zulEB3P0IOOf6gk95z0u6exNWmEtPYNtsncKf3DeL5nLcqbr1Vj09QpS7N+OiDxjPcrg15RV+jzgkQV3ptPKtuwPXo9acsUl+tV6EDU9hUYm5ndqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289334; c=relaxed/simple;
	bh=T5jvT7tm0aW6akXxOM7o5G0i/6YErUOWkthgtqpj6FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4laLbKkg/S5pTCwaG5f8eHoaQ/S1wes7rd77DFbEyM/KQv3mnCU1oZNx5tNTvbaRz+YxywJwmprYqWqC3xU/N0lxK2bLj1thzmHVYMdZJWDUYi1ZUd9kMISEnzi+KbxV3+gXCMF6cSQ4tejQWF2wEmo1CFLO9RqsyiutpCceg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIcZFt4h; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIcZFt4h"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536605c4d8fso1062231cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289331; x=1792894131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IivJPlqVutyc9WqVZ+S/63gE6BUOeFCDRKPNo/hGECs=;
        b=mIcZFt4hk308FQS5sGul2EVVweNtmUQj+9BS/V86n/l57Xn3yW+SVrnOVlrv7AOPIt
         CbdFvXl9u7dJNKnYL4Fr5fQdxXOugfwqLPhdE2dr8SXVt3rN+uTaahNiUSGTWvessWVR
         GLuWuj9AGMx8ocaWTcfACE49DGmmXQlW8Wr8GQLN9wGrc+i/mbyBJF7Zx352NZ7q2/Pz
         EnwvBxxjhOO+8cFErh5miJm1BkLyDlKnazCclC/yi4odle89BUtqlZL+4Z2anrFJXN/B
         miim9J8cT2KCVC1d2MkecXBPjGXKEJhp4wQCnxqMBpueie6bgjnInz7qmINB4uiKkt6D
         IaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289331; x=1792894131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IivJPlqVutyc9WqVZ+S/63gE6BUOeFCDRKPNo/hGECs=;
        b=U40jqiLo3zSJMnat7XvmDpG0D5z1RiHrP80MSuSdKs1bwkiB9yUeqjMsr6+1jpnddU
         tC94XBABiZeNO0RyAEMCsq+xOYiGREL70MiDHKEuKyi3PAVURxyUMRixPnpZ0WSsQobu
         KzhsvI1XstZv3qM0hs2eg00c7WKcpns6RL9ZsQZHckOqCNSrLkGyJw1Bjtl6imm9O4Cb
         OizBZJs91mPww/lvikQUE2EGnT6JvYNgYyhK/nBlExy24MiZfPHsCaDUWGr68a2ppLRP
         jBMGnZhPYicZmXZgTpz//i1LW8L87yeV1sVwBbpAZh7GFOf5zoTIbtiLNEcVsTLkcm5n
         tIiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdqaztXgoFKhGBG5q20In/Jdb8l+BLoOsD6Inrv35LgLOHSgJjtiE4OiRPGoOecThKQ2CzRF6+DPpY5TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9vx2P8zJ5h3vAls9MXgw+3jH+GCjpoeh2eZ2izvY+S2d4Wuj9
	1EnuX3iqqDSEcVSEtqIIUJiw3QaSAU9HGjkzWPpg0jfYWY0qQP1pwIs=
X-Gm-Gg: AYBFou2xVSg05Q7rStN9ldLz3pj9eJmTJMTlLtLIIFBu+KXIH4kVTsG7i8DMZUKSGwq
	wxTZgw7lfZw6GiHfvweTocp86YHBEvTK7DXhRXSKe6W/CIE/Aeyy75BQX5re+RQsOhrViseflem
	aJEOoZzFHjfZUx/g2zwGTTxFvy0y/SCpOYxQjswAwyOCcM0aV3BGOzjswlFx2r/goVUvNgyoa0P
	yFzwDxWlrVJnUuXqEB8kj1DyqGn5b+EvhikGHSnHhY0YblpTZI+R+ap89SC1FHv6V9+WaAXUrpW
	HNrkmWJ/fZR6lUb1nHFXpj/JJf6fs3dzDy4DKjCbciqEseMTSwk+N+x9VbxF1V1yqzstib7tAlA
	GIUrmegHv2bxtiPy5Hk42ykQkVUKxUHluwWQmFH81NL/4MVLP9L4sxVnu7fJNuVU3GEkWfWY8/B
	F0aMKZm6ufX9KlW8pghjgEmmwaGSFkYKV/FRxbGkjM1+7OmxyutTW2eGYzgXACw9OyRrQMnFuEr
	Hf+BN7paJsCA1KyFWffoZp4UQXr63xnyNTRS4R9gYVb7aVDD8HoUMrIr8OoUujQU59T8t4oWHaT
	lNOeQyUzMy1yt0B8JgGNurYkItmX
X-Received: by 2002:a05:622a:180e:b0:535:ba01:d8d with SMTP id d75a77b69052e-5364602c40emr56977811cf.39.1792289331426;
        Sat, 17 Oct 2026 19:08:51 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa68f8esm61731291cf.29.2026.10.17.19.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:08:50 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ae878000@gmail.com,
	daniel.machon@microchip.com
Subject: [PATCH net v3 2/2] net: nixge: wait for DMA reset before releasing buffers
Date: Sat, 17 Oct 2026 22:08:40 -0400
Message-ID: <20261018020840.3851552-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018020840.3851552-1-mhun512@gmail.com>
References: <20261018020840.3851552-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nixge_stop() clears RUNSTOP before releasing the DMA buffers, but this
does not ensure that outstanding DMA accesses have completed. Pending
error recovery can also restart both channels and enable interrupts
while the stop path drains dma_err_tasklet.

After both IRQ handlers and the error tasklet have been drained, mask
channel interrupts and clear RUNSTOP again. Reset the DMA engine and
wait for reset completion before releasing the buffers. Return the
reset result from __nixge_device_reset() so the stop path can check it.

If reset times out, retain the DMA buffers and reject subsequent opens
to prevent those buffers from being freed or their pointers overwritten
while DMA may still be using them.

Fixes: 492caffa8a1a ("net: ethernet: nixge: Add support for National Instruments XGE netdev")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/ni/nixge.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 8697a76..8bfda27 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -185,6 +185,7 @@ struct nixge_priv {
 	void __iomem *dma_regs;
 
 	struct tasklet_struct dma_err_tasklet;
+	bool dma_stop_failed;
 
 	int tx_irq;
 	int rx_irq;
@@ -391,7 +392,7 @@ out:
 	return -ENOMEM;
 }
 
-static void __nixge_device_reset(struct nixge_priv *priv, off_t offset)
+static int __nixge_device_reset(struct nixge_priv *priv, off_t offset)
 {
 	u32 status;
 	int err;
@@ -407,6 +408,8 @@ static void __nixge_device_reset(struct nixge_priv *priv, off_t offset)
 				     1000);
 	if (err)
 		netdev_err(priv->ndev, "%s: DMA reset timeout!\n", __func__);
+
+	return err;
 }
 
 static void nixge_device_reset(struct net_device *ndev)
@@ -869,6 +872,10 @@ static int nixge_open(struct net_device *ndev)
 	struct phy_device *phy;
 	int ret;
 
+	/* A failed stop retained buffers which DMA may still be using. */
+	if (priv->dma_stop_failed)
+		return -EIO;
+
 	nixge_device_reset(ndev);
 
 	phy = of_phy_connect(ndev, priv->phy_node,
@@ -910,6 +917,7 @@ err_tx_irq:
 static int nixge_stop(struct net_device *ndev)
 {
 	struct nixge_priv *priv = netdev_priv(ndev);
+	int ret;
 	u32 cr;
 
 	netif_stop_queue(ndev);
@@ -920,6 +928,7 @@ static int nixge_stop(struct net_device *ndev)
 		phy_disconnect(ndev->phydev);
 	}
 
+	/* Stop DMA while the completion IRQ handlers are still installed. */
 	cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
 	nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET,
 			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
@@ -933,6 +942,23 @@ static int nixge_stop(struct net_device *ndev)
 
 	tasklet_kill(&priv->dma_err_tasklet);
 
+	/* Error recovery may have restarted DMA and enabled interrupts. */
+	cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
+	nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET,
+			    cr & ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK));
+	cr = nixge_dma_read_reg(priv, XAXIDMA_TX_CR_OFFSET);
+	nixge_dma_write_reg(priv, XAXIDMA_TX_CR_OFFSET,
+			    cr & ~(XAXIDMA_CR_RUNSTOP_MASK | XAXIDMA_IRQ_ALL_MASK));
+
+	/* Either channel's reset quiesces the entire AXI DMA engine. */
+	ret = __nixge_device_reset(priv, XAXIDMA_TX_CR_OFFSET);
+	if (ret) {
+		/* Retain DMA buffers and prevent a subsequent open replacing them. */
+		priv->dma_stop_failed = true;
+		netdev_err(ndev, "DMA stop failed; retaining DMA buffers\n");
+		return ret;
+	}
+
 	nixge_hw_dma_bd_release(ndev);
 
 	return 0;
-- 
2.53.0

