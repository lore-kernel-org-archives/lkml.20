Received: from mail-oa2-f26.google.com (mail-oa2-f26.google.com [74.125.231.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621C4CE681
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271891; cv=none; b=UF9ziIjpEDhWt6zFbSZrMdRZskO/gaHHgn30aDmG026fQ2xA31jPLyAY82HYGy0Wi4+AGT7ap51lmv1f2MqaDfCjTqQPq4Sj3iQdsjbvBLIcXQwcoYDumii3xQu1RdYOQTH2G3HRsV48LM1797C99u/QxP7FRNARE6Zwxyhf8VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271891; c=relaxed/simple;
	bh=lENjvTcJ6jn6OOtjQT9OxyeXMbXMz3M/XL/BEeU1C48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JrMGhQ8/Yl8HbchafQQMHwEOGE314VYEBo/1LNvWvHtr6Q67mHN1zvmchX7Pun02tVuBnZT4JXyDOeyL65awLuwzyyYDoU3IFQHq3KIfbBfUf970H0O589Rjda/zfeJq6t1kuWh4QC+LZhWPDf/VyF/HZZXTOtE5xzDW6mwtCB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5/ocFJo; arc=none smtp.client-ip=74.125.231.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5/ocFJo"
Received: by mail-oa2-f26.google.com with SMTP id 586e51a60fabf-466cc88a9b9so110441fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790271887; x=1790876687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrMqc8Q1NW4R8bM+PWgpFGuXOWv8RLSIAwP5mrNvnTc=;
        b=k5/ocFJo/TqwLLtij4rM8EDgk1dATiT5Fxr9mic6QuxyfVU9JyxzoHPFj6DZNL/REx
         KempqyQLQxYgqqt0DTDIXx45dc70oJZkfuYEwC2As6rNhLBQ8pfRwm66MUAqGrIIwiTt
         5TXgUEW5PicfDJFkpzqVfQxxirvAGuVcPSGVcS+VYRWN7W8cCNKLYZKNZIIArYkzfmv9
         ajETeCZWxQlnaF4x37F2zT4f3G0LVWbPpV/BNBd2W75RuDB6R7GFfz2oZzpUPzAAUb4m
         leM1LzkNkajv6631vxo6UAFQ6sEVGWE7edTZEkaQyH4LkY3Am+GFO2sdCAlq972csj1A
         SadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271887; x=1790876687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrMqc8Q1NW4R8bM+PWgpFGuXOWv8RLSIAwP5mrNvnTc=;
        b=TvHv5TwvBiawF6ax2e6KrrXAHHu5dqAjzfAALl/WStTn5iMePlIr4jLXn1742lWGaM
         kwGD2eVEbUYIPlMRGwIOmEgYAbq/w31PisPDnhyfDGb4Dv1fW98bvBblbbSRq9PPRqcI
         430EI3AxQZZ6sFKBQVHMALD391QT+d/HbD8WQkw/WcjY8eMbnTKMCoN45Pc6VpYKIlQ4
         vrre5U98Wk1Flnt5Q1TgwU/abTJdyE8azHpE7cFD9Xo4tz0E4V0UvsVldFsO3ZUUkJze
         E9Oj22G5Jou2oSkERXnNgxSWUtBZAaOSIwIQ45oeIXbd4I5BcKmWlFKWqCEqK5R2gSz7
         blzw==
X-Forwarded-Encrypted: i=1; AKwUvBxvrMzM03cUi7wkFqdSVwMkHS5BJfj4FSk29pe6lpJKvXqR83vDAO6zoJ2ySncWiVUiBpVxtgWiCPKAYUc=@vger.kernel.org
X-Gm-Message-State: AFuF++neIH7++UJxYlN+2eDOIWfJDibs7q3Um49rr10RlhBXrHORPjZZ
	Frnhbs8ak0AjMw5WdythG3IR+QPmdpviLaFHCqS/ifnMxyDYdf8fxJc2
X-Gm-Gg: AYBFou2r99EMojUrsnFMXWAMfz65mTZ+TjNSNdRrcUHtvY/LxBaRF+C6ngnr2DIzf2o
	iCMAD6B+eB4X+dvu0DWvCp7e0lPZ8k20qYi6Z+xKNyfOo3vS9FdS7smFsFmpLVDcOYgoMYEKG3E
	Xe7PPMl1Psn/hJ3sx6Euj6cuEFGYDONEagKJsg4BORv4DJ5ScE0Qx7NCoYIQplPwkBsVB9WrBlr
	YG62Sdeb4lB+Lx1gpjm6mRxNmchHBW76naoiOPqisqRp3qwnjAm87cQoxH2N7WEE9al+qR9nU93
	81m9LU2qhRJKXa9rRpSmSQWILiPwyKoVug6RUa7gApzQNsGAERTiM2TfvfkzV5a84z9Si9itc1E
	edBt5vPexfOeZTHihs1nok417THTM70/5BIwGLwpH5zSWfR2jEaxNZhixExF81JoNdMpG901TTR
	p33bIkkDoE+D44tKQxHj2BxlXBcDi0INJUnMgTrpcmyXwC6IGa0Pvmkxw7bh7HDBiMmJdaUpJuU
	ha7c/VO4myL8Fk3+3YCqFnQYehM7kpqPWHt14PkQHwUn2JOff9iEbptjNVbhAKW4wx/vzedAkgB
	JST/SH+vNF0aEFiBw9cQAQvomcmKHB7/qKaXvvPDqHmUfCfo7R+6Wmy5hFW6qmaztjccF0yAIU8
	pkkjw+wYEx/pC8KZeXc7w4Q==
X-Received: by 2002:a05:6870:d88f:b0:47c:f956:c7bd with SMTP id 586e51a60fabf-491e4e5f03emr3167632fac.3.1790271887477;
        Thu, 24 Sep 2026 10:44:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491e8f8d14asm3027802fac.0.2026.09.24.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:44:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 24 Sep 2026 11:44:37 -0600
Subject: [PATCH net v3 07/10] net: stmmac: account for failed live XDP
 reopening
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-submit-stmmac-reset-fixes-v1-v3-7-c031e3f3a282@gmail.com>
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

The XDP-specific release/open pair bypasses the ordinary datapath
bookkeeping, and its caller ignores reopen errors. A failed allocation
therefore leaves the device marked running with NAPI disabled and rings
released. A later close disables NAPI again. An IRQ-request failure also
frees descriptors after starting DMA without first stopping it.

Detach and stop phylink while replacing the XDP datapath, update its
ownership state, and reattach only after successful reopening. Preserve
the existing PTP registration on success, but release it on failure so a
DOWN datapath has no residual PTP ownership. Drain transmitters and timer
producers after freeing IRQs which can restart TX queues, including on
the ordinary release path.

Keep the old program reference until the change has succeeded. On an
attach failure restore the old program and return the error, allowing the
core to release the proposed program. Program removal must still succeed
when the non-XDP datapath cannot restart: BPF link teardown cannot retain
the detached program. Leave the interface administratively up but detached
for an ordinary down/up recovery in either failure case.

Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 47 +++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 31 +++++++++++----
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ce598b575763..467f471874cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4314,12 +4314,10 @@ static int stmmac_open(struct net_device *dev)
 	return ret;
 }
 
-/* Quiesce NAPI and transmit queues without releasing their resources. */
-static void stmmac_quiesce(struct stmmac_priv *priv)
+static void stmmac_stop_tx_queues(struct stmmac_priv *priv)
 {
 	u8 chan;
 
-	stmmac_disable_all_queues(priv);
 	netif_tx_disable(priv->dev);
 
 	/* A poll function can still arm a timer after napi_complete_done().
@@ -4332,6 +4330,13 @@ static void stmmac_quiesce(struct stmmac_priv *priv)
 		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
 }
 
+/* Quiesce NAPI and transmit queues without releasing their resources. */
+static void stmmac_quiesce(struct stmmac_priv *priv)
+{
+	stmmac_disable_all_queues(priv);
+	stmmac_stop_tx_queues(priv);
+}
+
 static void __stmmac_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -4350,6 +4355,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
+	/* TX error IRQs can restart a queue after the first quiescence. */
+	stmmac_stop_tx_queues(priv);
+
 	/* Stop TX/RX DMA after draining IRQ handlers which can restart it. */
 	stmmac_stop_all_dma(priv);
 
@@ -7244,19 +7252,15 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 void stmmac_xdp_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u8 chan;
-
-	/* Ensure tx function is not running */
-	netif_tx_disable(dev);
 
-	/* Disable NAPI process */
-	stmmac_disable_all_queues(priv);
-
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
+	netif_device_detach(dev);
+	phylink_stop(priv->phylink);
+	stmmac_quiesce(priv);
+	priv->datapath = STMMAC_DATAPATH_DOWN;
 
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
+	stmmac_stop_tx_queues(priv);
 
 	/* Stop TX/RX DMA channels */
 	stmmac_stop_all_dma(priv);
@@ -7271,7 +7275,13 @@ void stmmac_xdp_release(struct net_device *dev)
 	 * watchdogs during reset
 	 */
 	netif_trans_update(dev);
-	netif_carrier_off(dev);
+
+	if (stmmac_fpe_supported(priv))
+		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
+
+	/* Keep PTP across the immediately following stmmac_xdp_open(). That
+	 * function releases it if reopening fails, before returning DOWN.
+	 */
 }
 
 int stmmac_xdp_open(struct net_device *dev)
@@ -7350,19 +7360,22 @@ int stmmac_xdp_open(struct net_device *dev)
 
 	/* Enable NAPI process*/
 	stmmac_enable_all_queues(priv);
-	netif_carrier_on(dev);
-	netif_tx_start_all_queues(dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->datapath = STMMAC_DATAPATH_RUNNING;
+	phylink_start(priv->phylink);
+	netif_device_attach(dev);
 
 	return 0;
 
 irq_error:
-	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
-		hrtimer_cancel(&priv->dma_conf->tx_queue[chan].txtimer);
+	stmmac_stop_tx_queues(priv);
+	stmmac_stop_all_dma(priv);
+	stmmac_mac_set(priv, priv->ioaddr, false);
 
 init_error:
 	free_dma_desc_resources(priv, priv->dma_conf);
 dma_desc_error:
+	stmmac_release_ptp(priv);
 	return ret;
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 909219775507..7ecb7addd2ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -108,6 +108,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 	struct bpf_prog *old_prog;
 	bool need_update;
 	bool if_running;
+	int ret;
 
 	if_running = priv->datapath == STMMAC_DATAPATH_RUNNING;
 
@@ -119,25 +120,41 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		return -EOPNOTSUPP;
 	}
 
-	if (!prog)
-		xdp_features_clear_redirect_target(dev);
-
 	need_update = !!priv->xdp_prog != !!prog;
 	if (if_running && need_update)
 		stmmac_xdp_release(dev);
 
 	old_prog = xchg(&priv->xdp_prog, prog);
-	if (old_prog)
-		bpf_prog_put(old_prog);
 
 	/* Disable RX SPH for XDP operation */
 	priv->sph_active = priv->sph_capable && !stmmac_xdp_is_enabled(priv);
 
-	if (if_running && need_update)
-		stmmac_xdp_open(dev);
+	if (if_running && need_update) {
+		ret = stmmac_xdp_open(dev);
+		if (ret) {
+			netdev_err(dev, "failed reopening after XDP change: %pe; interface remains detached\n",
+				   ERR_PTR(ret));
+			if (prog) {
+				/* The core retains the old program on error and drops
+				 * the reference it passed for the proposed program.
+				 */
+				xchg(&priv->xdp_prog, old_prog);
+				priv->sph_active = priv->sph_capable && !old_prog;
+				return ret;
+			}
+			/* Uninstalling a BPF link must release its program even
+			 * if the non-XDP datapath cannot be restarted.
+			 */
+		}
+	}
+
+	if (old_prog)
+		bpf_prog_put(old_prog);
 
 	if (prog)
 		xdp_features_set_redirect_target(dev, false);
+	else
+		xdp_features_clear_redirect_target(dev);
 
 	return 0;
 }

-- 
2.53.0

