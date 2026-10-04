Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EC456E1C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124855; cv=none; b=lZwFlj9m2X4fK8OPBjERWFm7panGzDjI+W8Zv+rLQ0A+Jc0XAoAYFFGMpaxz4D9g8PnvCEzaivktt6eNaF9GDZ9xvwMZADC+O8wOQJLkfwu1V4hjxYg6jL5CLIBvQCXOS51LxcgjyA/49VhdGkX5PR67wJSM6fcpgrisFFlgy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124855; c=relaxed/simple;
	bh=/L6rwePCTb6F8ztmjJ+vFJVUUHSCy1qsPx9CToWB9T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUSbmbYe4+JkL4uiw8oTuVDm4IZdWOpe9kbiv6WFYq/XTbVwVes+k41A4Ipfo7iwZvo9S8d3fd4txordFT678NA+38PFJxGCJL18vzADn/jehP9Gt4EQtew71q9TIg/Bn8qRP5v76Qcnsb1kTup9fwIxy5SIKwR1zL0CG/0py8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so5642865e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124851; x=1791729651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HArI0GqWQQ9wXZmElGrKtHu5g8ZbfDICvR7ZMSTUUN0=;
        b=rsrrQD1CMsrmmtzWVwRt3L4fkX+TtCPlRKRS/qeaztKjSqb6kK40LuL+GD1TuXcf/B
         eNiADvrbK7tCYbLK0eGXpJYP1tfsXkjYHlGUgreitz+NTIZs4Tsz4c+hfKlEcXFBFUI0
         vTHne2PIRVsHI31n+YJFslohwBQiBw8/wiGfQu01E9gfTHcKX82IvhEbz2UYAGcwpHkT
         4bJz4kuKZJBskcG0yjo6mNA3L2MD6P8qk7+J2F8+waPlD3eYqwLSVj/1l60NIetqo1wR
         yH2DMFTH80bgzwG3pklR7rmBHiIvPlRu7m8pJ36A/iNBedpuBvNFwgBV29iQIG4TX9v3
         JthA==
X-Forwarded-Encrypted: i=1; AKwUvBwrnO1let3suAq5tJKVPcKwh5wAykX6CQexZD30bbdXjEHXDS8AEeVaUunH6JjPuQeyfI5FvLIauo2wHoU=@vger.kernel.org
X-Gm-Message-State: AFuF++ltHIrhSlk2W/bXLDR9+Ug1EctqfAMjekUGRd/QkufmtnXDLwKM
	gS8nV90e5+8zc94HZWfjuBo4feIzoebBO2v32Adm6qMJJCFztI4Zohkt
X-Gm-Gg: AYBFou0/lYMlPQebmbbb0ou0BfAsozESXcdaCW7M8lB8BdtZTMgjha5ShknOF815V/B
	Ft5sMXehE0/7cj69Wobese1Oo4BzJ5OrVYs5Zys0+BeUwwOjnuyXJDiBYzHjtzQYpaUcZlsBCeX
	RLaSRge+G4gpEd+w9snXFlAsKrEEs8R8viZRI/1vrc2gPJsl5oKo5x3cZlnITPzzEHpd1DF25xO
	63KNa7npZxIDgyJzL4f2ZO35WRN2EmHKVp84FzOWlUysGZZFFXT1HoiEcV4QuoDlbLo7g6ewnMe
	Rg2htROVaTl5Qm+CqJB7tGcOkNsR5rbhcA3Bv6yG2sUbzOSEvTm3NFGhV2v1d3fF9jxk1Qzna2q
	QmQ2oKPw3htSrrqAR03zQmBPRXjCctIik5FT2StbpA0u6FBG6sOkvXG9L1m+M17HSHDgSDc7fuw
	9e43g6IZ/h9dwE5Jr5rzj+fpP6VLCNIA74OW4iwOLm+4/nm9LQMOu7lOnrBpf2vzbPx+Jmapuyf
	83f28iLFkPssd3kktja1UhkKCkhzA7XgA==
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr132090935e9.35.1791124851353;
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:43 +0100
Message-ID: <20261004144046.391444-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What the T7 does not share is how the controller reaches DRAM: the bus
path goes through a pipeline stage with a gate of its own, and no device
other than the controller has any use for that gate. Claim it and hold
it enabled for as long as the controller is bound, otherwise it is
switched off as unused and a transfer that has been started can never
complete.

Give the T7 match data of its own so that only it looks the clock up,
and require the clock instead of treating it as optional: the controller
cannot do DMA without it, and failing the probe with a clear message
beats booting and hitting an undiagnosable hang later.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0

