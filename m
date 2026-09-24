Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71394EB85E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271895; cv=none; b=rIQX4o8/IrRn41maIKxvKR8hdotDBYr9flD1spFZDVhNR+v5GVbe2kLeRlq88dejK6gA18i+vYdFYZ39LOosCULGfr+aKqCgibHXfO4g+vpEm8LBOjx8I+sC2Cdr727IbU071xVv4xPXdbQM+cKfGD5nP4b4FpXzbyjGiA14q3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271895; c=relaxed/simple;
	bh=5y1WY6VfQEa6z9Uv81Qr6nawVi5OWrxat0IypjeFi8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfS1DT6mEftXTmnhH/RUIdBjuu870qiuhW+zPclQRtusaNdskN8bpe+WuZyTqMPovnVnB3eBIo74p9L6CqBHdd9r7MlYYgn2LSIftvX/oecaj3Cpc9rsLuA68o29AFn+oipnqM6glKRDN7f4BkVR3AJx+7YPNWTftRh+SE5F7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIa//JnI; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIa//JnI"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fde7so115476fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271891; x=1790876691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxlMLeY3xGhSrBi9Qa91jcGZfKU8ZnUsiaHuYqFMG9Y=;
        b=AIa//JnIs+JBUhYcHYD2lgpLAYTUPDWB9A00NnsQFsrZkJV4ISJyhED/D9NlKY7IZo
         YarEBdjIOXWJjvi32DgH9idgi0Mxnm4bgTNsz1Q4UsxHs+y0UEe10kAZPGQvy55wmFjZ
         hl72KyRibv08j+bg64VWLzze2C5OU5dyBpKTxQWu6j5AdCcwRe7BTT0GKWEuhTmTUOza
         7PmtMSAbkqVLS/BDXrV3oLmHUF7Mhsf6dRvNYAs+m/wvcA8P+lXpkFOFsj6WrgXskvS0
         S8P5LaP+6h+hdGCFz1Cfer9/szhciW3jYT0LWv0ein5V8HPZ1x0YxZjOrJ0W88KbD7Mk
         pjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271891; x=1790876691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxlMLeY3xGhSrBi9Qa91jcGZfKU8ZnUsiaHuYqFMG9Y=;
        b=ZnPV8XjcxiL1rIwBed91/L7/siHyclJnrWx8l4Ss52IzsA8x6n8M+TBT4Y+2LYWIAj
         208gOH68QAcOpjnvE0PYyGgOubPRKCg5Clqk/lAt/X+EdhxhRJb5YUZsKrcyVrvfG1NY
         d2TCrEC2a97IU8CFcNvxQErUM7FQJh0P328RRr1gP8/lJlC+iXi2nLZ+H9Z8SWg4231A
         TON5XQej44j4O3i6vkj1j9ZnNYyCnNdHLWdGKoGWBL2kbltJPaY6na3B80PifTyetxGf
         OT/WassjBQf1Z46JTlkKOAzoRT+BfCmNMozTE9qQqq1S0TOxFg+QcarFL0f33FVbf/rT
         Kc/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxh9OQRGysnjGS5vsJ+S//AvUxITAqRi8ytFPpxJHuoM9EW7stG/hK5tWerKlJup6Et4Ndd3HgDgul3ugU=@vger.kernel.org
X-Gm-Message-State: AFuF++ki/2D2JmBP+a2nVybuTJOuYXy/R2ocve9CeDGr38HygDpSEu+F
	aW8RymPPh2orLZKU6br4ObaOVHPiUSabdL+012RdPfEV/1rLhVy54c9S
X-Gm-Gg: AYBFou2dHvZbwsbwj38yL7Ti5K89hx/e9rLO62xGZpLUjPJcHhfVJFw8Q+f+X+A2xA5
	d44+DaL/ft8wgK5Q2DN26YEkFLVe7mSEQ6aeq3sgJbsYxQWWJyE6DO2qPJD0vio0DTfc/Ft263V
	9hPgbQwSoI7sxMQOVEmx5+UYo8LhTU3du8NwjtXcM1dSoD+NxSDBVe0PnD0FUmhtvh9iP5vG+pg
	gT71xOAic+Vmq3eEUBqZBdT3Qc+eNto5i35i9GR5bbBowku0SqiYhjuBTno6fA3PF8LIx2e9zyR
	/AWs8Z4Zw4ZRD1O6XT0C3x4io0W4GhWfu0Zc95eecAemGCy1Kubv1nATxytTDxPzguuhA6AwXuu
	IYZq81xvODUoYssX9kKz36RvpengjcE3oz/Q16FsrTmjsWBApEMrJ+I+WbWqym/BHPcrIpkqG8x
	aR5ZQxxdyZAl8bb2YjjTZsBd3nrwtZ6W65+CqB8SwyPaGBn4yUAgm6rIkOKXuYRmb5YOnoLNagw
	B1z0Tb+fkSipsm5EpjK0ARYAIwMgzUiapwKyR0VIB/loG+yIMzPqYa2/Hj5E2dKKC7zQUC7g7Gt
	VpwoPFR6UkvSZ3TKixqQaBZNdYkKRz6sFo6KFxQL8VW/OwxOeL4FC/EHHaJqKn0AbiqToyp3Rpy
	wl9VLC0aIwwWueIgI9LkzGQ==
X-Received: by 2002:a05:6870:888c:b0:48f:e0f6:c033 with SMTP id 586e51a60fabf-491e753aef1mr3023509fac.49.1790271891303;
        Thu, 24 Sep 2026 10:44:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:39 -0600
Subject: [PATCH net v3 09/10] net: stmmac: retain PHY and PM ownership
 during ethtool reopening
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-9-c031e3f3a282@gmail.com>
References: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
In-Reply-To: <20260924-submit-stmmac-reset-fixes-v1-v3-0-c031e3f3a282@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Changing ring sizes or channel counts calls the complete ndo_stop/open
pair while the interface remains administratively up. If reopening fails,
the PHY attachment and runtime-PM reference have already been dropped, but
the next ordinary close drops them again. The device also remains present,
allowing an MTU change to quiesce NAPI which is already disabled.

Detach the device and release only the datapath during these live changes.
Use a common reopen helper which retains the PHY attachment and runtime-PM
reference and reattaches only on success. Restore the previous ring sizes
or channel topology after failure so a subsequent down/up retries the old
configuration. Leave the failed device detached and reject further live
ethtool reconfiguration until administrative recovery.

No additional outer-lifetime flag is needed: PHY and PM ownership continue
to follow the successful ndo_open/ndo_stop pair instead of being changed
by live datapath reconfiguration.

Fixes: aa042f60e496 ("net: stmmac: Add support to Ethtool get/set ring parameters")
Fixes: 0366f7e06a6b ("net: stmmac: add ethtool support for get/set channels")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 76 ++++++++++++++++++++---
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d56b7f911db0..d17c68f55caf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4361,6 +4361,8 @@ static void __stmmac_release(struct net_device *dev)
 
 	/* Stop TX/RX DMA after draining IRQ handlers which can restart it. */
 	stmmac_stop_all_dma(priv);
+	/* Link resolution need not have reached mac_link_up() yet. */
+	stmmac_mac_set(priv, priv->ioaddr, false);
 
 	/* Release and free the Rx/Tx resources */
 	free_dma_desc_resources(priv, priv->dma_conf);
@@ -7658,13 +7660,37 @@ static void stmmac_napi_del(struct net_device *dev)
 	}
 }
 
-int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+/* Rebuild only the datapath. The administratively-up device still owns its
+ * PHY attachment and runtime-PM reference, even if this reopen fails.
+ */
+static int stmmac_reopen(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0, i;
+	struct stmmac_dma_conf *old_conf = priv->dma_conf;
+	struct stmmac_dma_conf *dma_conf;
+	int ret;
 
-	if (netif_running(dev))
-		stmmac_release(dev);
+	dma_conf = stmmac_setup_dma_desc(priv, dev->mtu);
+	if (IS_ERR(dma_conf))
+		return PTR_ERR(dma_conf);
+
+	ret = __stmmac_open(dev, dma_conf);
+	if (ret) {
+		priv->dma_conf = old_conf;
+		free_dma_desc_resources(priv, dma_conf);
+		kfree(dma_conf);
+		return ret;
+	}
+
+	kfree(old_conf);
+	netif_device_attach(dev);
+	return 0;
+}
+
+static void stmmac_set_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int i;
 
 	stmmac_napi_del(dev);
 
@@ -7676,9 +7702,31 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 									rx_cnt);
 
 	stmmac_napi_add(dev);
+}
+
+int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u8 old_rx = priv->plat->rx_queues_to_use;
+	u8 old_tx = priv->plat->tx_queues_to_use;
+	int ret = 0;
+
+	if (netif_running(dev)) {
+		if (!netif_device_present(dev))
+			return -ENETDOWN;
+		netif_device_detach(dev);
+		__stmmac_release(dev);
+	}
+
+	stmmac_set_queues(dev, rx_cnt, tx_cnt);
 
 	if (netif_running(dev))
-		ret = stmmac_open(dev);
+		ret = stmmac_reopen(dev);
+	if (ret) {
+		stmmac_set_queues(dev, old_rx, old_tx);
+		netdev_err(dev, "failed reopening after channel change: %pe; interface remains detached\n",
+			   ERR_PTR(ret));
+	}
 
 	return ret;
 }
@@ -7686,16 +7734,28 @@ int stmmac_reinit_queues(struct net_device *dev, u8 rx_cnt, u8 tx_cnt)
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 old_rx = priv->dma_conf->dma_rx_size;
+	u32 old_tx = priv->dma_conf->dma_tx_size;
 	int ret = 0;
 
-	if (netif_running(dev))
-		stmmac_release(dev);
+	if (netif_running(dev)) {
+		if (!netif_device_present(dev))
+			return -ENETDOWN;
+		netif_device_detach(dev);
+		__stmmac_release(dev);
+	}
 
 	priv->dma_conf->dma_rx_size = rx_size;
 	priv->dma_conf->dma_tx_size = tx_size;
 
 	if (netif_running(dev))
-		ret = stmmac_open(dev);
+		ret = stmmac_reopen(dev);
+	if (ret) {
+		priv->dma_conf->dma_rx_size = old_rx;
+		priv->dma_conf->dma_tx_size = old_tx;
+		netdev_err(dev, "failed reopening after ring change: %pe; interface remains detached\n",
+			   ERR_PTR(ret));
+	}
 
 	return ret;
 }

-- 
2.53.0

