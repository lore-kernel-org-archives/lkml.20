Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294641;
	b=JdIgLMlI7GJGKTf4u1P7R/6Iis3ERJPy7lgzV6JqT6kpeJiQ2fI6WIE1CDnFurYIDor4
	 rI7/WBSv40/NRnD7g9KcT3Uig6U7PfwqewlU64a3bQ2Fqo+ledlaRjQ6Ps1UGPSFHV1P2
	 4Z8Nk+7wTkAHAjOuPSCdj5GchR9twmpK/8pxkaDDPKhnR7aO8/UbbbXoQNL6jdVb7ITbE
	 A1I1WbGbfqZe6FfCCye14nppeSv2OFdmzSb2uCUo8b+fWCDyh2Fkrt34FhmMI+L8X55kZ
	 AYp74KzKesH7BonsnOsnRzi6pVprMl39mJXK1u+x75EXPa0AgCj5Wpxet4uI1gG5JDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
	b=1K8Z2ZuhxiEEaAtY+zIJvsrKajkHFB9TGHTTpUbvi4x+lrV/l3gTnXZzoYh6NXT57rKX
	 +jGCQc+mT/kc68QC6Iq+s98WI+mRz0QVeNMMrA2FLgnenlefJB/Q5a6aYI69HirfVtIR2
	 Nbdvs8UyCrDWv8Y0HUdT9EQ2DXFj/0bbctRmrDcntCtLOGB+cNLIS+ZSiCp0tZI/Vm51/
	 q2SQCiNasEzZjBxBR1rLSX6y9xXSosYdTYu3hcjVM47DRIH0xoNn/8JYbkvhS1QleTdDx
	 nWrm1LL3KvIVrCkpWSS9vG9Qr2zBaV4RmwKGTbrZSOrApjKdv4ycGk0HapfIZ2WquZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4ii2gjJ;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 420B4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4ii2gjJ
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc0892f92cso853150137.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294640; x=1793899440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=v4ii2gjJH99nKNb/HaMMkH+Ab3FjrlDa1CFtLJRW9e0Se9pOc2wFGonNc2Faum+SMp
         eIcd68o6vrUtcLMs61oUuKKjThNI81IfZhqFu0BaKpDqw1xPHUJtGMfQNfN+ePh+3O2v
         CdkLsigaDLCVlc+P/Ht9MXNM5X9f5P2jfsn91rjSNk9wbx3hDewwydES8bbQM6T/TJYW
         DhItesTX+/goikD55EgVtIfoEKcZC/NvGSBtoXPCyhqEjkG8lTaf9x9bh4yDdGb3jykk
         67LUGRlg//02wbc14hVKIh0//Ww5uom5zBTmXy1JD5iti4cg8e60MxuLHg14LqT6pDwz
         HqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294640; x=1793899440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=cIOosR7xMej2FKBGce1layDOHn0EfFa+Fjc/hZJcwN8pauKoZ8K2Zw5uIIE9EkKlgG
         zOPpg1HjRTGlYGKCMtm4Z0n8gFi7qcPvK/EbHLJ5BSyCkykAWnJERsvZrHxq1INcB1QH
         XNN+jRBXb0UFm3NBpPWBpXyAHecYNnExnKBvRw3zjSLKWVQU1v4/5C+jxao/0JunCXQJ
         b1VB4htg7YiCFR8RNKcd5hDTWA2CI8OYzJFBVxhxklVqjj/FRK1K9hxzMtyJp6pqowu6
         fmnETIEWdKGCvmqu9SSu9YJfcGvkJo88AK76v86rsjr+9IuQT+C9wfD/L4Ev/Q/F5ELu
         /MLw==
X-Forwarded-Encrypted: i=1; AKwUvBxDQjhMsuwX4iW4EweBvBQhnGrKKK/zoY2pkt3yIQqdqZk1hT7FO8En7CHAenuf7YtYCJAEgLRtp3Jj9TM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/GRoCwrNnHGVGsKOM6sXs4ce5gg4LvANReyDVoWw+fxYevuUA
	3N4ZJk+wwkR+4qRUj1sj7wS4WhCjLlZL/z3RxQXMAOJ/mZr9GEcW+w3k
X-Gm-Gg: AYBFou0bABQq7E93ACZgfaP7cSXaPiHVARqltikZXM4F7ovgWTjYBNmSeTalfLkznmR
	U9hnZmknGboJp98tlpHy0D2BvmWEvhvZ9aoGU0N7EWIQoBR6bFMmFPdneJpTRGjvzZo0NJdrMe9
	DaCM7RNR+k6CmyJokKZYs1/5X2tjWWTapRALTMOs1dF1so2rgdpySBdqiVb4swxhXVEdVd0Y4ER
	MhKvPHvmT3ECYrNVnTwtTvfER6HpODUSpbiQPUiN0/Y9Tq6G2fQGeGaR1rGPyiSwqbc54LPGqbQ
	xXKpEpq8dARmDpVCJ+XaKEhZTbUiv0tX6EDCBfUO0XaJsLufYPmzV2fIrH7qRw1m7dHUQdP+l5C
	Nob00nFHPZbL8pLXIVY12SyU26N285Agwz9X+c9K2FroDKfl+UpTwg7B2NVj02k2SduRMcSzI52
	hj85tmpYvREpZXy+fQDir1dXitvJHzgrJBAZdoWU1REvp819D1LUxQxtPnQhqfxFgWthC66D//h
	7fKrC5z2mjNvc/gnt/Nl/EyNWXFIH2Oe9jWR9Y4YpAPEC2/4BIctxvce3abY3qONCi7A2BblNds
	ta9i4mSpruehOrM/biPZrcV0QRkWr2JoROmoRNoRtKcDnOw+TivMifokSXrUa/YUpEYQnQiKFFo
	L0LBl5Puz/D3AtUgWP8bYpeYrpexZv3E4+iLp
X-Received: by 2002:a05:6102:3e8d:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7d03a50a85cmr2383203137.7.1793294640169;
        Thu, 29 Oct 2026 10:24:00 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:59 -0700 (PDT)
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
Subject: [PATCH 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Thu, 29 Oct 2026 14:23:25 -0300
Message-ID: <20261029172325.3425046-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
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
index 839856c09e30..4d067d97c5a6 100644
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
 		clk_disable_unprepare(phy2->clk2);
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

