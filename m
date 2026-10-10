Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609C40B373
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629954; cv=none; b=VtttizPpjqHII5DnqYq4UABES1QqSaYgI/92GtI7ImDEdroZbyNpi3NJkPxncpCXWi4XReMUaMexHovyUkYrZuLuNVgHMXZFB02BM9C0wXuY+cZlUo3O3FUVZwClTYOeLkDZiw0sZiwLSLR4koyZslKcCM10/pB3j8xeGUiHsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629954; c=relaxed/simple;
	bh=XgobmVnmfw+VKO70t7w47aUKtQgvvletM9pYZJJk38s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5Cxgx9Sz7MdM+z2wl8+vTk/oIh3m+5B+4ctrylYM21oFgOgU6fAi66cWFTLyVBiXV1W4MohoggDhqkO3UVMjFG0yeR9CfhQI2K5EgBQsTvU2/QN6NSBBTCGapMAeh0pFt4EzPUJXffoiqRNVp9PBLa6dvO4i+b1euC412BSTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso429107f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629946; x=1792234746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAObO9x1QF4WrfdAIN5+rU7Yr3xIr5PVFD+T0h41GXs=;
        b=dUuoHCfm8ewC5+KWlviWlofiUA+Yo6D6BYlgjCPDiqWI6Vht7pvnAOkaZbSeaPFi6G
         URUFcHxZVq0KcjOmXZeuTflN+gywYqdwX08mM3kaNMcBjAKGhCxMF3PhZ/YSKzG3xcg3
         wnHtdi7RPxcP/IPXaeCyLejrDhLBwtPJ2xcr0k6WDQVaJsBeSj0GIC9BZ7lA3CbKLTCa
         ETft432IwGV7dVf0YjvyIwCUE+kc/qCrk3NyhrylY7C5gg9J14RQwvwjINKJzrmpywOO
         uDaGBAQ/0KTe1xhy6bIbPJbAx0pAxIvHocNab9JPGiBkmrSCoGZaYu1/1shrkWG+iGgC
         A9Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz0M4HF9P577ifcsotHIiB7Lot4O4tm62HKiMHmfN53TOfJBxQ7A/qeB0Tc9TCq1kMAfbk/0QVDsPANgVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiO3SKc4xSr2lbdXod6MFT73UjjavAdzuKx2CT9v7MhnugsAOc
	j5Ei9CrVetIqGRtkv3vY6tbiRrdN67kUmHP2QGl4SyCALlWivqcFkoO7
X-Gm-Gg: AYBFou3lumAY+rAtJpUePpVWOuy5g40ofZdMloYQviZT4fTCu+T/ikDgYxG+eg/6KfX
	jS4GovWOuHt/6s0OTHm1ZyfL8qCW/Q729HI2FDb0aJpSHkwOajt9Bc/zPkm1TRrqSGNZYlLrAM/
	Lvxj4xkxv0C3eC3vX55D2Y/C5NwlpjPnjQOp59RaeNUrgwQJ9Gfk8awcPdWcJDQu3i0sZHGWifo
	/u69FWtH4KKj0XA+eYWHPkRaKdWU9ExGlt7xStxRTo1bIjPlE87OarqtSZ74961XFUb+Ohjwbwh
	wuaTZbuHRx/yaxpUhybyclKHeXKHTI/tHcjm7slU8kfCj7do9fF7DywYRiZ27SnatPrrE2wF7TP
	6jMq9iWdrA6jhZi7zIAQOpvaQ0HwL1jJF1CuNybIAZ/IhSR/NdmXIanNDt2f1AIBF6DTBbkr1I0
	xINXGQdZZLtextKaxWn98QGTcQhbkaGxekngcAjfhNiNx9GEgZnrp5x017ECsQ6WuBo/iWrYThu
	73EkVf3FsYNfscK+2sie9IK8zSFMJ/pt/M=
X-Received: by 2002:a05:6000:491c:b0:48c:4272:86b2 with SMTP id ffacd0b85a97d-48dba9bdcfemr8482673f8f.11.1791629946574;
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:55 +0100
Message-ID: <20261010105900.247342-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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

