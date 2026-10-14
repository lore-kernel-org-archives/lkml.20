Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978A1412294
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959242; cv=none; b=J1CFYwZ0kXBGZF+FMVlm7TQLTQzOXnvwY4rZ3kfHyFQ5sEgTMjnFSI+mLZwNv/y0+n8AL5CgfjPic94KkmEgsl0hFXKmRcMDTXksRLOPDKxxD2wYHbvCMO4JxL/BbrFySVHaEv5YKvaXNLF4YRGmg8WuK0uiv0UAitKA20rliUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959242; c=relaxed/simple;
	bh=NEEsEWJzvXXKw1U5i3R6qVwNEZ7+58VweQO0x61IjVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hIN+EheH1YfI7nQS0+cdbSWZgJ6HjJ92QNvPnEvj2UC76xKgBKn0D7cv3evCBAcka+5xiwLvHtpeZ+yHDGtNGDCfpiVthtNoM11pgyJ/rLncpHiawmIOj8VEwUt9x9Dvi6SyLhqvX+q6FEHNWkvWpjbUrKH6Jh28rrANw1y9atI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km4uLm93; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km4uLm93"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so28226f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959237; x=1792564037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FcCs3sohxCHYV561RCxP42Zr6CFjBiLneuemdbNXbEY=;
        b=Km4uLm93F2xKEXVmpyWTD1Nky7ueWakHbgHwoz0HLskOTG7r/i1lZYs4m1DF0EDHoY
         u6w496J2kcwRbn5nrllSqaowKJkHrwkK+vX/qZtfEy7KAp5sPw0oFkL+WDaBmAhthH9q
         BjSExUFd++yyVuT1YRIBi6XxJSKTzQOKl1URkoK8L000tUhw6Hey9yzeJ9jt0d5WX9r6
         AygqDuynb55hE1v3OKv00Qwd9ccmpDLTjt0pbtp66JKED9X0KpMXQLg0WAaiTobDjsxD
         GSKrwTc8gsHFpMgVENUmzIJDL1UvznoX805UfpTsTBgG2Iv9aw1RzDBTQhd//wR2d4XC
         yYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959237; x=1792564037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcCs3sohxCHYV561RCxP42Zr6CFjBiLneuemdbNXbEY=;
        b=gqZtRYUAc/aeE/T/N14szpw3ZDWxWAOrCmVXEgSpa9pAgmOxK7d6g0Hac+CdeIPf2V
         45Vsqt7Fi9aXm1gv3pwVGAG1NM9Ie5m+xiiCcMEvWS+3RCV6m4LSdGXPDLtk65I+n9sS
         ggx1DWdzGZhRIAp0WMsuq35heO1wvo90zvuXmtF/+7wGcpbfwNpRBOttEmPzAzSBfUe+
         ixS1bmJuXy3/+W9dMrOMsoWnQiqc1R3JeY0txd6e8DPV/mE37i/6S9UsMzj0UswinWlE
         wUtYfpz6SRIBV9cgBhJGvOqemk3pU71/OlZc5tHjlHDPZUxaR+v6T8jsZPmLqjsruMNP
         /51Q==
X-Forwarded-Encrypted: i=1; AKwUvBys5KPhy8rwo6q/bQ/Z5T/tI5lgiwx9AVnT3Z0ylq8uN+UcVxVL7B50qPZvgVE/vP7Gk2iWcprRGRgBWJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuoSBPKvLvO3CUFtNjF8ochyhxjzkTcB8oWDsh58juEGKdKC5T
	ChxcnKI29E/hdry+T2AJEq/jUZVDLNXp4AbUwXnH1VtzhXbO/5Hg/wnA
X-Gm-Gg: AYBFou1IvuhjsoO/ip2qpFt1d0uwRtad3Ylz02a1+OtOL53YTJ+IzGc5fWBCoxKOC+F
	myxYfsp4LCXhe/2OtYXSar+zhxNTdQTGyzb2kvnHKy14UWiTsQMvFR0vZvLF+Qp4j7YAMK0ZJaM
	Vqnef3GWXcKuRIVGvMir0+uiBguhDp7IMxmvi8rCsrcX6pbvX5ebcYZ7ApgVpb1yWh08CPkALH4
	iZ/1AXDSuDr4l7yEvK6d0tU7n1TWv52B9TQbKjHYa6HpEqhTbkkMAyH+iI65r8Fi42qZSV8f8Qh
	Tay4yxJgu5QYW6TaClLeHAQyewbxChWQXs6CCGB+LzAXZXv5AIIWt9cNbx4eH+xat4TVTD/6upz
	eAPnPkx76xD5oVWVyvKqJVgRROutHlN9I8ltwZce3u8zjIlrI3x5AbYzobm0oEDEYhf3pmrymmv
	BvTFGjluooIG2HSSe54VxIySOgbBpTUjuzIb9is7YOb/I3SQxurxjleA6x1xGRnYHl99gA9gkeq
	ghSZK4pDO+nAG06EKOX8pEqKIKcQhvCzjPDqmVClCBGV/haOZDIwjvfTxcRD0L0QptnJoHYOJUi
	uItI7HXcSuVR60rZdcXcCtstEnrBtWZIsH641lb12dT1Rsk39HBeW8X/d1LNiAt/Uddj87iiwjt
	ICg==
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr307794635e9.6.1791959237236;
        Tue, 13 Oct 2026 23:27:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] net: stmmac: handle partially allocated DMA queues
Date: Wed, 14 Oct 2026 08:26:59 +0200
Message-Id: <3537f9a4f3e875291812486982b907b3b02bec15.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA allocation failure unwinds every configured queue, including the
failed queue and queues not yet allocated. The cleanup helpers then
dereference buffer arrays that may not exist.

Only traverse allocated buffer arrays. Clear freed pointers because the
queue structures persist and XDP reconfiguration can reuse them.

Found by inspection. On a BeagleV Ahead (TH1520), fault injection at
the RX buffer metadata and TX DMA metadata allocations reached these
invalid cleanup paths before a test guard stopped them. With this
change, cleanup completed without the guard.

Fixes: 54139cf3bb33 ("net: stmmac: adding multiple buffers for rx")
Fixes: ce736788e8a9 ("net: stmmac: adding multiple buffers for TX")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27..495ff7aef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2144,10 +2144,12 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
-	if (rx_q->xsk_pool)
-		dma_free_rx_xskbufs(priv, dma_conf, queue);
-	else
-		dma_free_rx_skbufs(priv, dma_conf, queue);
+	if (rx_q->buf_pool) {
+		if (rx_q->xsk_pool)
+			dma_free_rx_xskbufs(priv, dma_conf, queue);
+		else
+			dma_free_rx_skbufs(priv, dma_conf, queue);
+	}
 
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -2161,13 +2163,17 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
 	kfree(rx_q->buf_pool);
+	rx_q->buf_pool = NULL;
 	if (rx_q->page_pool)
 		page_pool_destroy(rx_q->page_pool);
+	rx_q->page_pool = NULL;
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2196,7 +2202,8 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA TX socket buffers */
-	dma_free_tx_skbufs(priv, dma_conf, queue);
+	if (tx_q->tx_skbuff_dma && tx_q->tx_skbuff)
+		dma_free_tx_skbufs(priv, dma_conf, queue);
 
 	if (priv->extend_desc) {
 		addr = tx_q->dma_etx;
@@ -2209,9 +2216,14 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
 
 	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
-- 
2.39.5 (Apple Git-154)

