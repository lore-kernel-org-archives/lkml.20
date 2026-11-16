Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826578;
	b=JrOTxTyl/xQ+VxwRepBOFf6CqoXXN8LrT7PgSiUkHdGFnAParokMFoBkXoIUA6QOXEy0
	 91WBVfQAA5u3agiGPPy8lzT1OYPyMoJ8/9hBihX5jMlUn+l58Ic9wvBixXcUv1o9mtDpN
	 1Yr2LuGy6032k4wMq2A+upTbBC+WlX/38UDnbSJ7vorDlPW+fHJp4C+a+BL0QNxXL2Mdw
	 kpejGnGRZpc84Y7fF1mm302oPBDmRXJY0mfFOfh6Rj4zky/5ygrBawDGdqG6sQzqk92Co
	 tjBQVxb2NXfqOKn32sDVF+GypBodCbP02Ka53DprqiLXhKC6mgoJXlaZEr3kBOfn2Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
	b=PO7WSYiBG/At6Lk/iwWnzZbBVAUYY3i2wCJ7gMZ8zCFPxgq5iCLIc+GhfaNMPz2NFSKU
	 uUmTtoou2KHoT73H5pYms6rI9IgkxDH1Rd+5DdMKZ0xmi1bgK05JYP9BWw4uCqHGHYkVu
	 R6bZ8jPo0A1r5/TV1wVSItlS5yTOM4ds/XPjk2J0+8ow+t2zRIXVnaMMpXDezV41HGWBg
	 +g8/u3JaT8Cqz/Dprcgbzaj+dgvXJZYqYqIL0UyQPzP2yph+bqv3IiIJEXvkzidgg6jA7
	 37SGKnl/nBW3cEHKCNgjp5VTDQTgcuYmEgof0RE1e/KiO6KMNGPF01NaUIH0fVPCUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMB+0as2;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2898E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2898E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMB+0as2
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b360828905so29713607b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826577; x=1795431377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=iMB+0as2h7GqLJWDT7oD7BLV/X/QQbIXv/B8vOgZP/FB0ocZ/c7UKq3CNnQp/2iWg8
         /UVg47d+oqbcSK19aA8oeu3m1OWoFNSXNKtGiKRr6W7OXYYXIX4FmAfnjqZdLdhmERHD
         IkmaAoTaNfot9iXM1XQsP/U82MLOMrYxx3TeubyVKcPsZV9z5k2TULVlkTDWEr0ouhMs
         x4Rn4e/PL8QTJgmxLJc2ETR4kWO/oc+Dp8Up2oTvbbRZqI8LoqHo0t2BmQlvYUiFm5H4
         aLgrmfXUaDQVkPFbJ4nTT5HPJqLix+3YXba9K/q8ySO8xym3rHg49nQIHnvZYIieBx3w
         zFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826577; x=1795431377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXHs4M+7tfkoIg4sYbiMPquQrDZ3R0cBJAsjaurMG7I=;
        b=gsxbKLwtp8jMdt13w/CLnpg/9y3Nrf91+d6c7riYLD1a7rndNL9lQ+rkTamfsMPFYb
         hCDJnXvOVz+FCZekZi5t8twIOKsQg1EEQJPmu25FUMiqzfuYEVCqDN6GsQMWCmJ92qLw
         L41hBazMXqE0RlIuvF5wsjzuP3CRlVGIXd3ir6t/ke142w/vImxUROZKjvQAuBqCaOHW
         LaSsJZBaEtRxjMBhT49B0SSgEmbhrOBcYshjwqGKd8XBXgG+6PHdo+1Ge0rwWde0Kthm
         JDgbtwJ70U2lV/L74yICRsdTuO3Fj/KxAqZYQuiPi4fTUoyaF89PBzNESc1AcVuKn10+
         hzDA==
X-Forwarded-Encrypted: i=1; AL+hErFLFfGJvdhalgWdg50jzmcXridAx9E7Rpzivu7cq8ogc30hrY+qwOzBQQ0+rwbgOcmBSDSk4XiCwFOR25c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+li6fmDNS2A4CUbkZApslKq7YSS6Fib5vaQC/+HlRIRGRRSRw4
	kkKsPrYWC8lieSSObesrZ6hWk3aSDvGZknBCmJFVAq8XCxGYJ8SCFEO1
X-Gm-Gg: AZFdTZcTGQtJ4bqwrSVky8sZnL1eK5xObyZ1fHmqJZhl8Sfjkf6LWoFBDvdDyWnxZ5Z
	Qda9M9pVKF7gs34w9ZVjhaN6q27QK3KlWhKGf2xHbC4b0yt+dpLccOSym/qxtBOYqHmSODW7U0e
	0AU9V1hPkUedkb3SSZyTCJgQMtYBoRX8uEZHfnugQeMsRbGI+0tjdlORwmeqs8s5/DrZMqJg/bF
	OBxKySXQ8fbltLETK+RAfBTt+xVvHUMeFcuagKGLcWId3E7xRKSahXQTk/OSV+IO+redRAqcVmP
	B7T8yIyRVZEiZ1GKwgpovvEP/V0rRNX49p6tWBIkfB9lqih3fmcb49oO+wC8SKX6XNNLSICHd18
	QV3jIZmMsF75wf7E1yFa2EAhA5BJ/pNAPvuvun7Lqsrujql46mrTRNCYv+ejhFx4QZn+Mjy2Dhz
	lc+fivKcykLWbkC36yPZxaMJt0eWhK4Ufy1rxJTNBVUEQxFF/aZqANUB+6OKWFmtxZKMlXb3okY
	AlzqqE0TABUCu8HsgeYT2OI9oPfAB6oxZ8CLSTvOzewhWsw7r43csHmULlQvTFWj1hkMntsQJDV
	z/YuZgH5SowQUjaRe8cC8BFWoOWhO6H+/n8zHZzR9ZB1qdS/oT6flbnRuKlFXyVfy2dyBfgldtj
	W/AL2RzyoBaNaUzB2pqlwoRb28M1mtSo/6Bk4
X-Received: by 2002:a05:690c:fcd:b0:8b4:cc58:7901 with SMTP id 00721157ae682-8b4cc5882e4mr22480827b3.8.1794826577207;
        Mon, 16 Nov 2026 02:56:17 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa41:8a69:2b8b:32cb:351d:f30d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm82274987b3.1.2026.11.16.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:56:16 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Mon, 16 Nov 2026 07:55:44 -0300
Message-ID: <20261116105544.669029-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261116105544.669029-1-vinicius.eduardo.pedrosa@gmail.com>
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

sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
support and the reason for it isn't documented.

On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
at full speed on the OHCI companion and failed enumeration with -62.
This happened in 3 of 40 warm boots with a separate local PHY tuning
change applied.

With that tuning disabled, the current order failed once in 31 warm
boots. Clearing SIDDQ before releasing reset had no failures in 60
warm boots in the same interleaved run, or in 10 cold boots.
Why the order matters is not understood.

The vendor BSP clears SIDDQ while the PHY is still in reset, in its
common host path.

Add a config flag for the early clear and set it only for the A733,
whose config is otherwise the D1 one. The other SoCs keep the current
order: the manuals don't specify one and they weren't tested.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..c918085a9281 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -105,6 +105,7 @@ struct sun4i_usb_phy_cfg {
 	bool phy0_dual_route;
 	bool needs_phy2_siddq;
 	bool siddq_in_base;
+	bool siddq_before_reset;
 	bool poll_vbusen;
 	int missing_phys;
 };
@@ -253,6 +254,19 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 	writel(reg_value, phy->pmu);
 }
 
+static void sun4i_usb_phy_clear_hci_phy_ctl(struct sun4i_usb_phy *phy)
+{
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	u32 val;
+
+	if (!phy->pmu || !data->cfg->hci_phy_ctl_clear)
+		return;
+
+	val = readl(phy->pmu + REG_HCI_PHY_CTL);
+	val &= ~data->cfg->hci_phy_ctl_clear;
+	writel(val, phy->pmu + REG_HCI_PHY_CTL);
+}
+
 static int sun4i_usb_phy_init(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
@@ -270,6 +284,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Some SoCs want SIDDQ cleared while the PHY is still in reset. */
+	if (data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
+
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
 		clk_disable_unprepare(phy->clk2);
@@ -321,11 +339,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		clk_disable_unprepare(phy->clk2);
 	}
 
-	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
-		val = readl(phy->pmu + REG_HCI_PHY_CTL);
-		val &= ~data->cfg->hci_phy_ctl_clear;
-		writel(val, phy->pmu + REG_HCI_PHY_CTL);
-	}
+	if (!data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
 
 	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
@@ -1013,6 +1028,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun60i_a733_cfg = {
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+	.siddq_before_reset = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1029,6 +1053,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun60i-a733-usb-phy", .data = &sun60i_a733_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.43.0

