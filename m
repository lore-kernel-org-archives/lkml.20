Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572339;
	b=wXpjvA1ySCldFf/2hK0oWANH7RVznNl0y2t5qqpayqumIhxknTxOjBcR7Gt76BADubGL
	 I+nZH6VPE44tQJk5zvC8tdiBRoLHWgH/522XJB1Zz+5fNFcp9OalfnDSfr/FYCJicT3lR
	 6DcEwbJJ24xU8ZAr0ao42lAv4U7YrgKleafc+tPIk32ZXbNLUHMhQ7q5Ir7MqVqeYIsTO
	 mWO95fmHNPq+G4Ynz2Me6XElelJQnJMn/WjECS1ss3A4KGUennbaduBf5VPUWqX06GZ8+
	 Kupvv1qu2pLyiZQP+OFhGJYZfMGqm2qKXb3OV48PBjhV2vFgJ4qOcL1Nw6U1CmxIj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572339;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
	b=JaYvg9hrYnl55pGqGctX2LFu1GPBirBaW4RuCaXyK/IJlZvd+pDvEZ++VZ68h6T3Yn2I
	 1XiIcbp5uvFpMc5yYHxmeX2fyiDUufXSdZyuncf2ZDzdfPRRttpZvfEYK3bYjbuVqGYOc
	 lIHzChHXyghaHxt3O2OyJrkDjkDWMdbfyM2bLBN9Qag+AnQogaiOpKkV5G0+h9ZqCvXhP
	 OxvBo0wbGAfgbe3qnESwLuyyQ07/hGWLucsMSaPVedQR59VZkhFyuf/A9GqWUSo6nRwqD
	 2UQNOgaJpOOxdZfpf7ttscgorSA+rbi1bPbagz68gdeFHuZoL4I+MDR24tczIixCIdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60A606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB60A606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11263155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572336; x=1795177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
        b=DjsY5lRgc1749cUUr+Z1LSAD0pZEgpAKmFope/us2toqVxu7OpVLhw57USGokdq9C5
         SjPTeKzTgukzZ62yqE/kc66ZY9qJPgFL8LwoVOWjtNhe9VLBrsc12qfqKalKz0lHIvBQ
         tDhYl2GOGv731QkRnvOsdr2qZDuWH1zf+zvPlyuG4b7KOUTZiiBPXqhFDG8vV1wDA/o8
         ItdaraincXz0dws0TSwACeUfeiAJui/6cDpYqZznOzsptSiaBPkYmjyXFS1639+1ziCl
         28D7xZb95Bj18YBYgtyAmugGB9PXw/YkWMhIbkViJlih/vlJvKDEdXwhr+ScHVSia/Nf
         blqg==
X-Forwarded-Encrypted: i=1; AL+hErGSvTmS75iysLxdb/B5MdIJXcqaWn0jV3tel1muKEXdjtG00Rjs+CgsKqSCkbkIBR3t0KFLYMCLLC5YCs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z800Zcv4t5kRRbjcC5FmIR4ivYSk07HtEu1V5YfIPhw7xV75/zF
	mzWRH1FfP0hThnhitiicCMc/LLYwZdPPQvIGh+X2jlF5waGTeZA/1dn6
X-Gm-Gg: AYBFou26B1ldHlNFT3PsINFPJJ8dbezsTjKfVLT7ur5zNB7pp7NMSnvD4Ci3guPGOqs
	Pge6Op/UWKxgDoNYzjVPT8kfl6GYxpogSZN+hXsa4jLgYmaV0C0qSnHtXoN3mkUcbB5i9QTR5Cf
	3z7NS+0o7FS/JV5x93FpPRkckx2GwRk2H+Rx8CQ45PbBS9OJZ0De6XHJwgJLy9xCDq7WKF1FzaM
	EbdQgD7GxlGcAlM48jNbkoebJiDBYw2RKyHC+NfZdsBklzc1Vv0fptovlMbbikiDDUBpzVRQ9ik
	26XOdwDxAxNk3iMTPiNK1Jnyzpy84Lchd2Fi9oEX9yK9F/mdIawFeptuhAhRFROOv7lMlTcuHRj
	KKGbC0iaYNehyqLn4IPAZS3oZmvaUBv4GCPkV41gLcrH/oiPKXMyGACZyRBl/T7gW7KrWZLNFkn
	23yqxjFxvaXs5YyGNQlicsKDkfUKkTrKP549RGGa9zGRUZZXqhF8cQMN8xuJF6ZserZs56b8ac5
	9y47UwnkVFN6H3hPPi7dMFIk34+Mqenx5ovJG0bXal481CN2ymL/Qxu7FnCrmIXTcbSQWEUH1DE
	aixiwSLk0btOIj2NdXjuQUx2no21CJqr6mE2oVamkdLOLyLHs5wDlVF0+bMz/Nsd9f4dDURSKXZ
	VPcVtdnkjgDezutPQHa4ISYVE
X-Received: by 2002:a7b:cc16:0:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb4e2fc5eamr105768935e9.16.1794572336252;
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
Subject: [PATCH v7 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:48 +0000
Message-ID: <20261113121852.334604-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 2ad70f0dc4a3..ad30730db57f 100644
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
2.56.1

