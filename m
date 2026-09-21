Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F24E06EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009650; cv=none; b=L6PG0U2v1ANfvIUPDjH3gFY8SltGXhnEmU1owiomxVM1mlNfoaeepv2e3H+1lEYxeJiXe9W+8Ge+POUJM8EPsjIO7zTZy+COjfvxX7IyYntvyjFjivMAII4dBtP5wcdJ8ORxhxpephKmHYJf/ip3DBfxnYo10UYi1usLwZDOS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009650; c=relaxed/simple;
	bh=bWQ6pPswaesSyX3jvthXifBbTMag2VXIen957tS7Bj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvippH13btuYZFuvjBjKIV6vlWZ2PpOrJ+rhl4PI/tP0FwUjAIzR1d7O6Y32mea8Y1NGvtZX78sfUROYdogvqSf3IA/wfFAn8J7QhrFJ/QCOJfaRDPhPG0Vje3PBzyJUGVLKT/dKBgu/pLPNKeiwePiQ1fqnqiWtku612v+q9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed+q52Qg; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed+q52Qg"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6c9b72so441415eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009647; x=1790614447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PWAktAj8+a2EZgQ4kCGxOWW2beeBTXDV3b5mgoUzlt8=;
        b=ed+q52Qg5ZZSD9rMqA4+YPcezmvS0tMS07Bc3SEZTzDBy/qaM4CX44YEd1W160k1vy
         XUnGYq9B8ImZUogFErIKBaFqv2SheMp8XS8rhRTeenCVtgppEdvQFvhtCY4Hyo2dHTNm
         8yEtoXKwWk+5JhJCseLR5MJOG4yZw550Sep2FRsQtQsHsTxf7/IS1VZqUybxAFd2nj4i
         6RwUBmxmz0QH0YMC2uPA6WPbubjrr4EUBZ+kU3/mJOKrzrUZ565y63IVLx+CTG40j7LY
         jKg1va7/LN9MwGkH2oSlXbtnrZzBOre02AP81GMDuyYpbghZ4tjxR8Cw6WK4xMGcE83A
         cI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009647; x=1790614447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWAktAj8+a2EZgQ4kCGxOWW2beeBTXDV3b5mgoUzlt8=;
        b=N+uqVAEzxIbPCLXDqgmleAV0ZS9Dr5gEtelp3eTQk0OEeJmtJ/P8Xl4YN8N5GMSU/w
         lPZbUdG3SswMJfWwBwkkSqBxynYNLz+qza9c4m66WjoVtNfPbU91e5aEUZPK24qqEpsg
         jvCKDSUcH+ym8b/KNRDuOuqRZvlqh8SVksaGqWZr2/Zy1lls4hHRienI3KTGZeVQq7nS
         EozHMiyGOiNdZMaVxY3mCjweKAz0mJk/OK74KhQv7ufADcTY/HSDDaaec8cYOhqsFkyw
         qes+uzNMdRqeIE+EJJIBJgiQ6M70U7G4iArINDiA/aZ3xkXs8vIsTxxWydcZjgE1d+P/
         iT+Q==
X-Forwarded-Encrypted: i=1; AKwUvByvBTzJVjOzZnEJVD2ww/quWR9aYj4t7BN+5uav5mEflIjwhd7sS5GPewEMGTCEeI68D07PPWRFfxszXag=@vger.kernel.org
X-Gm-Message-State: AFuF++lPqpdIxKMqpuXwkajvtNRug7ipaLp4BpEwD1P0Y7kAD/mENR6z
	L+pAQKV2MbGRbYL5GrFVwoKEwtFZkXlZusSgSKgv7eH51TdJyLaZlfU2
X-Gm-Gg: AYBFou2g6UkbNjNbknMhrJJouvLzxgYlBpqYvjjlMmhjJ9FzEXUfEqh+3XAUqh9hTpn
	2lD4r7PFbOojdds857vpcMp3QhO6NUGcCC39wYXXATNcu2FuF/Vb2xEOzPvs6GuytRVnpTdaGdb
	DDullfm+t3xLAiScTWWJMaWycBuyKDZ2QsV+lEoPTUwtpaGVx956cx8z1BM1M2tNhTl9dlPPjax
	ysQtUi8ibYktK5jsajUkAJTeEsLSt3iif+MhOZCw/gRXp8VQzqyls+JEcEX+KwFq3rkdOQeK4BT
	zlMdX0E/Xj2zK9kRjnc3t1NftMHUvb7YKGfX9RD5e1aNOdWPB8wuIgx9CkI4mMmsuGbdk0/JzRh
	D3Al9cj2HpFsqsdHmwcx2cs7lh0OevYN+hLcWfo7HZWTaXWQJ5ccMEIbc7dX1z236AN31ux/G+E
	VFSAslAQqtO1UGrcvHnXRMvFLGoyfUne3lCe80GjI4zdYoZX0pSlV+i1TfeBrqxOU82odsjMJ76
	18UQNyp5k8W6s+PaM4mK8XmB/nnA/xcD+gazHeQuN2wqT5V2HkpA6iDJsi3nwGGtYs81T4XTSL1
	7i8WQqqvLqQswYlzDTd0TznUNJlkF6kHl7NMXv6FciKBckqxG7ZtUYn9k5byWZZKULJay/IAm0j
	FdpRR2Jvk0VwCX0eXa1HonQ==
X-Received: by 2002:a05:6820:812:b0:6b5:ec3f:497d with SMTP id 006d021491bc7-6d15a65b6c9mr206525eaf.24.1790009646999;
        Mon, 21 Sep 2026 09:54:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d145bc40e6sm510481eaf.5.2026.09.21.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:54:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Sep 2026 10:54:03 -0600
Subject: [PATCH net 2/3] net: stmmac: close the interface after a failed
 MTU reopen
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-submit-stmmac-reset-fixes-v1-v1-2-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00@gmail.com>
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
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

An MTU change stops the data path and then reopens it using a newly
allocated DMA configuration. If reopening fails, the new allocation is
freed while the netdev remains up and priv->dma_conf retains copies of
the freed pointers. A subsequent close repeats NAPI disable and IRQ and
DMA-resource teardown. It can hang in napi_disable() or access resources
which have already been freed.

Track successful opens of the data path separately from the netdev's
administrative state. Clear that state when releasing the data path and
skip a second release after a failed reopen. Close the netdev through the
network core on the MTU error path, so the PHY attachment and runtime-PM
reference are released and the interface is marked down. A subsequent
open can then allocate fresh resources and retry normally.

Keep successful MTU changes on the existing path, retaining the PHY
attachment and runtime-PM reference. Allocation failures before stopping
the original data path still leave the running interface unchanged.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..873331dbaf77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -281,6 +281,8 @@ struct stmmac_priv {
 	struct mutex lock;
 
 	struct stmmac_dma_conf dma_conf;
+	/* Paired __stmmac_open()/__stmmac_release(), serialized by RTNL. */
+	bool opened;
 
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..44b59d0f56b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4179,6 +4179,7 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->opened = true;
 
 	return 0;
 
@@ -4249,6 +4250,11 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
+	/* A failed MTU reopen has already released the data path. */
+	if (!priv->opened)
+		return;
+	priv->opened = false;
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -6174,6 +6180,10 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			/* Finish closing the PHY and PM state, but do not repeat
+			 * the data-path teardown after the failed reopen.
+			 */
+			netif_close(dev);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

-- 
2.53.0

