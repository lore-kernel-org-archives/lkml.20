Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880690;
	b=bxigup96eolawRFbH4K1S7AGIaeOZXQvFd8hgJf4tf8VfduGocmUPvQEWNqC98dm9ix3
	 xTo1YQbwBovpHPkAMI6FT113WaYEGW1ME6YtAlUanrQTcn6NFP2BEFrEKNk9Jx158VXRj
	 n/KwkAf3mLrChuklUjlWERFZv/efcM1M8a6WPvyc5/IFZ7zivdji6LHRAJKwRv3n6HVuq
	 8OPozYEk3Zs/QuJahRn0qKe/HDwcZ5OXMg+rqdSgvmde/oXqkjNOXPZ8tjxL344hUy3/1
	 8KDHTYl3TcGaHatbGLcIwt6HMEoyuA9xYbvMOvz31e8H7sFh6Wc5HKPizvpg3oDysnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
	b=uNijBbpevVCWHf5Z1ZdV0ATqvdGSaIYoZaBiVaNSkL43cbHInRaJUKKXFD6SZ7wWFc5D
	 DrauGGGo0oGU3VjbuKLh10/cfftbJGnjqk10M1EN2LX+UyEuLodvfV6/JDKnUGn7Lhlt1
	 h+PKXjYjJEGFd9DMsFuT5ZEBh2ybhglyoriPzLt6hh557StIYsmXJw2BCW8nlQEn0EJ8r
	 xaWj7SjylDf3hhLnzdfLHhIQEvN6+OuuciajNnOhkZCnm1k+g+m/tWvW2mYZALZcyulsM
	 GkrvWyhhFOsdnsFJt/2A5d8yjFsgacswnQ8XFKCd8aib3Q9LOWZq1CdDEtgyTqF8uuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eFLj/20d";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E27D606EEA7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E27D606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eFLj/20d
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12126575e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880688; x=1794485488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
        b=eFLj/20d7E2DhTKN1/H5dQL1wAaW9l7kKU6DASPZtMSkPfQLdjdW/L3oEmftPW9Cp0
         C1FgeYN+0EzLmsuISaxp8bX2yTUGV206JdTNp0BuhQOWr+Q8Yj2ByOpwWIG2ICpR+mpH
         S3366mmWA8dx6qknIV+vy8PU9LtO3O3S4A+cbKhUMIHjUgKybRco89YSjlHBfuoolVY8
         iEAYvjOIzOhZjSb+ni/HmnWnecUmT8Be8c5gNEqbUGizu+TMzY28h3Z7ueILKap7hkUo
         oXUwyVw0HPOKz1vWfAHoJ8myDCcsOzLisrTGf0KFcGiQBvHA1tehDWR/B9/sFEE4LbCL
         6eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880688; x=1794485488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NK/khkk0YHVKOYK9Egb+wYboRXW4TUYyNVtUBHR24As=;
        b=n+b3sNHUw2N5Rmm8NDvG8g9lqY2jwqZH45l+8ynyawu6b2qXnhQ5/cTO3O9NKeoXQD
         6VLWnI5zN8+1NsfX8YoyRqXYG72o+tsCe4NE6XI0c9Ft+HXYuvR4u++hgthzkxf+UBF6
         1ERx5ct4bwFNLV/RbA6LTBiDg/JAjz/Dp1GDGfAuqJtIyKfs09XbpafFZkLXva4eg9+x
         c1rrW7uHreaESeqISh+48cvWNnVN1KtovwgK8LlDikjWwF2WhRIlO5Ps6+2M6jVJVrK5
         v9VAaEbViQmQR+OUFruZ2GsxbIUlgEyGG4Iqx4EU/8A1WivHLEZiVJtz7MbTPog75zon
         hSqw==
X-Forwarded-Encrypted: i=1; AKwUvBzBiZqiSKuyQfHvt2r3chH1zYynSZvLYrA3bhvMkNSEZSPvlSq9Sbocl8PyAKiRN9P+mLitT/i6q/+bWvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pjbBHEChrpdUIT4yOJll0MYcPAWiIx9BDC1K5S5gb+TwQea/J
	DYT/n1URJBvhZ7li4Ly9ms8F5JIJzdNLV4136UVkOP2s1rGI/PQWUBv5
X-Gm-Gg: AYBFou3r07fBS/NMxcZug3OFqcPWvT8NeXPl7bzdf12oH/IATPvciCi+eDk8NjWnnk7
	fWcqspOlMGdHq6MVgjSKVHzmBz9IBH/2sCBWNGu5F4KohCGDO3597qoGGTqcgz+zg6UfFR6c8/e
	9FZ0I263DM/VmIa46zYIO6rcoIpZ+cTHzppxfd/SRpIqAANujkfDhBEY8ex3M9EpsJ4c4pfIITB
	u0KLrXSIxkrXHiG0h7pcjgma+m41UB9Mi7mc1wRvCRuNX0DFUCHfhp7nid6nW5ecvtQWqfLoq4z
	wqtEkO7sC4vMq9Ukv+B45D4Eoola/KUJh3V0tEWXPAr2g8P9f3ZXFi0Vk6m64JT8atX8ltm1i8P
	sWyWEm+bdzKf779RP1T0FNUdhUtqyFmGaUHmwDeyF9gflKv8KU/zm5txJTg7TX/kEckxKmcFL7l
	nFUl9sR4I7V4X6hpUZPOR2NEnvpcd8VB+sbmzZY0iXXbrr71xY1xOtdXgBD3ls519Ek2vqvHMKW
	MMeAavtrtDyvyVqQacslbnHfmFJtcyzfr9rku+j6arg8M2/2MCnxPDLsTZjr3fC5TE3s/9t4DfK
	bxnba7OMasq7eHWUgjSvAtj8OIXsfui/c8q+7+No+95s//QRPlt0suZQ7oofE2JH5p99X4q1Qjb
	Vnlgz2YlYkAcSY697Cj7mi/sP
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr433001995e9.16.1793880688427;
        Thu, 05 Nov 2026 04:11:28 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:28 -0800 (PST)
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
Subject: [PATCH v10 3/5] clk: en7523: protect concurrent access to reset and PCI register
Date: Thu,  5 Nov 2026 13:10:56 +0100
Message-ID: <20261105121059.11201-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 66 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2baec734df9f..c05d0bfa2340 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -123,6 +123,8 @@ struct en_clk_desc {
 
 struct en_clk_gate {
 	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
 	struct clk_hw hw;
 };
 
@@ -130,6 +132,8 @@ struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
 	void __iomem *base;
+	/* protect SCU register */
+	spinlock_t lock;
 	struct reset_controller_dev rcdev;
 };
 
@@ -577,44 +581,78 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+	return !!(val & REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	/* Need to pull device low before reset */
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
+	spin_lock_irqsave(&cg->lock, flags);
 	val |= REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	msleep(100);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(5000, 10000);
 
 	/* Release device */
+	spin_lock_irqsave(&cg->lock, flags);
 	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
+
+	spin_lock_irqsave(&cg->lock, flags);
+	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	msleep(250);
 
 	return 0;
@@ -624,11 +662,14 @@ static void en7523_pci_unprepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val;
 
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
 	writel(val, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
@@ -646,6 +687,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 		return NULL;
 
 	cg->base = np_base;
+	spin_lock_init(&cg->lock);
 	cg->hw.init = &init;
 
 	if (init.ops->unprepare)
@@ -660,10 +702,15 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(cg->base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	return (val & mask) == mask;
 }
 
@@ -671,11 +718,15 @@ static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
 
 	return 0;
 }
@@ -684,11 +735,16 @@ static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
 	void __iomem *np_base = cg->base;
+	unsigned long flags;
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+
+	spin_lock_irqsave(&cg->lock, flags);
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	spin_unlock_irqrestore(&cg->lock, flags);
+
 	usleep_range(1000, 2000);
 }
 
@@ -791,18 +847,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&rst_data->lock, flags);
 	val = readl(addr);
 	if (assert ^ inverted)
 		val |= BIT(id % RST_NR_PER_BANK);
 	else
 		val &= ~BIT(id % RST_NR_PER_BANK);
 	writel(val, addr);
+	spin_unlock_irqrestore(&rst_data->lock, flags);
 
 	return 0;
 }
@@ -826,13 +885,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 	void __iomem *addr = rst_data->base + offset;
 	bool inverted = false;
+	unsigned long flags;
 	u32 val;
 
 	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
 	if (offset == REG_NP_SCU_PCIC)
 		inverted = true;
 
+	spin_lock_irqsave(&rst_data->lock, flags);
 	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	spin_unlock_irqrestore(&rst_data->lock, flags);
+
 	return inverted ? !val : !!val;
 }
 
@@ -866,6 +929,7 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	rst_data->bank_ofs = rst_reg_ofs;
 	rst_data->idx_map = rst_map;
 	rst_data->base = base;
+	spin_lock_init(&rst_data->lock);
 
 	rst_data->rcdev.nr_resets = nr_resets;
 	rst_data->rcdev.of_xlate = en7523_reset_xlate;
-- 
2.55.0

