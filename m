Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966346;
	b=ZVRNrrWg+5NjL16ewU4NiPmhcarz0fHmPd/V5cgqwmhaa+6NG8Vb5pvOxwBVUBBaWoaN
	 B6HjawGcHrxEEjYNf62jKI1YeebkRQ6kozsIrbzYvvl9scpQxLQN0fwF9D0gxcRM9IhlT
	 Tl5jUYG4oBAXzx/oIbRnx8piAOvNJds1VZWMpmyu0Cpdn2CfzaafZ7Kn1J4sAkcg4MNMA
	 WzjUo3QxxNCz+GEGwUKaexvbtj9lyRLD/z1UQ7nroo8LNtj+41Xprhq7ZaRCk+sQKVMMi
	 1S77sYnZPJlVXNpPlvXAQS+OE74CLp37+TPTNpkIygZhlNmNgsbqPrGBkxKscERuC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
	b=mEvz3Hvu86tRVIAfxrkABIkV6d52kfW8yTfGpQn6z6FfQ/OFUz4fOnFIl8fOWiloTxNH
	 6DKEq0wGY6KNbW7P/4CWNx8urhis5/8+zVFBpmdpMEs01bOhAll5RxTFwI9aLCEWbTkgj
	 /1n/s1g5M7mvokojZt8l4iEIIN/jiISNVG7/Qz1WXFJD8IvsNJ7GJ7txW9Qg3BydYmm7Q
	 D51xJlEsQJ+jwAYNl3onmtrrkBWiDOxWt5BboXcswFpKiAjCee+p/wUljKmDMwm1KIel0
	 gOX9Kd+A6TX1kR6Nh56bNgpfdlBjfWtpvY8howAdRri9fobNXuWBu/9OnYaot978ERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ksjWc/xL";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5A606D81A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF5A606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ksjWc/xL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so4088175e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966345; x=1794571145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
        b=ksjWc/xLuwcNrgcBVFleerWYvoVfpdIIRX0YSPvH4MFuwO5QpwXDlsPDtTSSNsrYxD
         Y6SSt2hPYsquBibslngGQwC3s0B/Mh+7G5serEKfl5RiMFuCnIOlRKmAcxWg9yNVrW0a
         i8Od5P0snQxwZytdL1LtqzPKZitp8Zw0vBcnYUFqBWGRjiyzz2pgc/5BOPpuzFxNJzTQ
         7A9lKu7Qhg7NLzMFcIIsEz484omFKD4PfelvCx3m12WZ7lppCk+UhW+l3kf9HS5Vjwly
         CjFk/eHqoW3EcPeZhn5vDkeLrq0x+FdsLfEFoxDKhY6LqQkzU0ES3kV+SA70f7rH0egc
         1ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966345; x=1794571145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGW8qD+JMmv5f4+Iozi5uP2JfSMZ4/zLAzV9gW8MJ9c=;
        b=IjwrKOIaq9mTLM36/60SeqTw7I4tNPEuW2A3CyzumXnqJUdY8WkiLGkI8xjfVx/F1e
         GdC0YBaI6blPPpDSHf/EAL7W+XYIg7iJzZY0dGwyggqoLsXy/vTHrUwY4szbzXJw0pRr
         9O3wbHGOxhCXKVNlTB9jchVgTSW/Mx4pifR2OwSakjLo7DGDGCF7GCXlCTjBByEZM0jD
         XDiIfF83Ur5XvT7Pd30ld6IuDY+De6In7rfOkRLi/eMD/kcXiTur3+TQcka5ZhGBDGNH
         +zTW2l+sWDMTqTJPoEAZbfQeqEd+cH7PY+LAqzKjtbuIXLiL3IsSWzsdvmeAWLN/97ZW
         G8aw==
X-Forwarded-Encrypted: i=1; AKwUvBz/HOjTzqfbBzHHNExExObsN4Q2Xn12LMP7ntyQJBgWrl1ARKGMjd/qcp3x2vhbUse9qFObF66ONNkU/8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zQGIKL4GmJGL5uNZU2yN7IvHPks9JXo7Xb20heJWdPMEdO/a7
	jBJ/ydPSBUKr/b8C1dTuJua0w30DsaUBBE8hhSSYZ8dKRIJmmuKuns5J
X-Gm-Gg: AYBFou3YyMJ830Nx3RCKmQvmVlKMHcIx44DY5pgxVAFlx7dbx+V7of7YkwQ9tf5/kUr
	Ck6ftLaJUADz7OSEKsVL3k2UW3L8teI5kfTB3vhAu0yTd+yc/NZmEhDENXsZoAX04vWX8MHxTrS
	Kdu7ofTJhTOFpz5I4aMv0xBMFx5x7OIxj5qTMiw4KkTMjnOftRjJJvYOId3N1HUsFedQw9cwO6o
	j6E8/OqNU2RSMSf62uf1f7oR0S11CWqGjsy/mZo7d32wT9/DBYW78OqS6DLoif7+lPsvuQtUs8j
	lEw0ZAwQ/mbVD5KOsOue8ZXbRIJgoXaOtHQFyMaRf4NLqDWt3Eg09PWImbJcI9jZH66+IHneVOA
	iqwr9mlCBgyegP4EDOhDEVy8cofr+t0S4cLQxtgA/oJzzjF84eXk+UVjCWCAyIz9wZzDwDTm59V
	O0Ohb2Z1mYuZU107gp1Vf4fi23FWhL9iycMwhePExEmtLUNa2QktqNnC+mETQBRHCt7cyfxgerB
	js5GgsphzsazJqZD6qGbG4AnP3vEv787Ea3cK4cuJAcTQr55NuiC8Xz5f7cHn6FyqjEzBxET6KV
	X5+0gAVCKicBv1VH1bCGKNZPStJ9DvKikxZbNpoHWwyBnEN6uqudAukn/htCtYqphMVOE9w8dLr
	mBH2I+g8fO/C8zeH+Vb6tekr8TDc+V8P7SA==
X-Received: by 2002:a05:600c:a308:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4b76b0aa492mr6846155e9.21.1793966344650;
        Fri, 06 Nov 2026 03:59:04 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:04 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v11 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Fri,  6 Nov 2026 12:58:48 +0100
Message-ID: <20261106115852.189098-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106115852.189098-1-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use spinlock for concurrent access to reset and PCI register to catch case
when clock is enabled/disabled while a reset is also operated at the same
time.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2baec734df9f..e534a5c91e61 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -577,44 +577,87 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+	struct en_clk_priv *priv;
+	unsigned long flags;
+	u32 val;
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+	priv = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return !!(val & REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
+
 	/* Need to pull device low before reset */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	val |= REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(100);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
-	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
+	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	msleep(250);
 
 	return 0;
@@ -623,12 +666,19 @@ static int en7523_pci_prepare(struct clk_hw *hw)
 static void en7523_pci_unprepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val;
 
+	priv = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -660,22 +710,37 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	return (val & mask) == mask;
 }
 
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -683,12 +748,20 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	struct device *dev = clk_hw_get_dev(hw);
 	void __iomem *np_base = cg->base;
+	struct en_clk_priv *priv;
+	unsigned long flags;
 	u32 val, mask;
 
+	priv = dev_get_drvdata(dev);
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	usleep_range(1000, 2000);
 }
 
@@ -788,21 +861,25 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(addr);
 	if (assert ^ inverted)
 		val |= BIT(id % RST_NR_PER_BANK);
 	else
 		val &= ~BIT(id % RST_NR_PER_BANK);
 	writel(val, addr);
+	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
@@ -823,16 +900,21 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	struct en_clk_priv *priv = dev_get_drvdata(rcdev->dev);
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&priv->lock, flags);
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
 	return inverted ? !val : !!val;
 }
 
-- 
2.55.0

