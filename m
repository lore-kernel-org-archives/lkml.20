Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723842;
	b=BoIGtDgGmAOjs8HGyzS4c+1Pdj4hy5rsjUb9uir/oaKnPrOflDmkmH8A1hn5D0BH+FVQ
	 KEQz+d6eoSMIYvqnH3w5/ibzNAGDAxFOsAZT/zLTbwL3NoqtKdrsYn49bvvyyeJe6KVhz
	 y8TDdqStqGZziQdDOIU5inY4DYMR0GK31ayahrSPW1haHGoe6GStMzssoNkfqUnKaI5Sg
	 Be7zmLTP8YlnybRyFJN7OpqWsNPzHAl83i6QGFpoJ2PwFG5U+/iwoZP45HkPWPVzkrVkH
	 4ZBlhhi09uDI7p743fv+4YwJpAX3CCfn8dZolrj4DWutjT8ML9aZzoxwNRjml7HUpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723842;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=KiUUr5tw3J9JDZ2qLmsnvfF7x4aP0hY5U8f57bafRRh+Z2RNMv2H/SIYTuEiSi8/EzxZ
	 +MOcf+yfh4FLz6CjXq0b4duaxdGRYhupcpkmYF2vmux4TGxprXpxIrGpFAjFVOsX9vhq/
	 KPYHZQUOAb1g/avK/+MlM43O88gHCGhR+/2/sRiysGrRHpQzWILVbGAESfrj3OUM90IhP
	 mkZ5q49co+ypCwcnCffAV6BGe21KFHBgGMkQSkZe4p6J90w0WpTUjAPvAaCqV2sd6pEJ2
	 yyhVPtVyJc6G3Ui1JbsOj5Onkx6rmxHmuWnaKSfb8unMDqE8rjzHCFlRmjGwrutxbQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B16606D839
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B16606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so4092702f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723840; x=1794328640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=fWNYL2cBkwhPiE8djzMF7/h5ZnG9R70wsuyX6XAdAipTJyRsbjN11yLH0GUE9QMTex
         8sRpcIauRw4jhiu5iWeQDNKiIJtgiiSDqK5rdoezy6dzP5k5vda9I+oXKNaLCKw84vKK
         am96vSEB3h6mhz0X/oUn632LM6LcZn3v71cMWPfH99hKHduBsDIr7i3IzfSBSHZamtUv
         zG/0jghyev9HoTVTXZUojWLn26zzWRmPsGleM4sA1sTGsiaen9RA3aWNHMX6qGEDQji5
         FXlJUdWkP967GhQLq6WB9CNYkklwBHhWA4HJCyrTb0jKQlEJibWERgI/Yj+NQdGJ9PEb
         H1Jg==
X-Forwarded-Encrypted: i=1; AKwUvBxzt71H2oJkD/4xSSDBhlipfRCPvhwdSKhePui0tnZ3tismu7xZwI4FKo3r7babBEwFv7UvxeS0/Qr5pcQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cJmLV1Xw08OwP4X/6QK82RUROkqU7kCp8LQ/Qa+M8eUPFwigq
	9s0heQhK8QIa3tN02mCx8mtWGu8ryA5LFHiGLSX9l3T0lWKfAvYfq5Qp
X-Gm-Gg: AYBFou3JDGZO6vPgBC9RN8Sjby7/MeANUDr1zsED9Hq3tcL1psgaLYxt8aAJ3kVRe0u
	JpnI215N1riJieftZ7Kq+lEc/JPI5oop/LGAEAFStGvuMBoMrf9xoZKSA+uWr0GhORO61wKXtt6
	fNMK/hiu+aUbAj4twGAC3ivSjgxu+PTxtVE1AHe2Z2CNkAAkkrrhcUZA2L6Oui8rPKnYEkm5jmb
	WNJHL6Vx3NAQsm6VgZqCy02NvuGP3FbOzM+tm8exQJCDHdvD7+gCH5CThJFEuRMnSba327OXY/f
	HqUzug0Pwb66YYgkFIqAroREpVWEi+dEWTLTZNKgQejGp6CEKuY9EK1Upr9r0EVVzPrVvZx7888
	+XH4Fy0oWz2B2LLZLoF8z8enMtXWj76nOT5uwalhp2rf9UoAiI/hToZUXAQymkc+QoJEWfnI4sg
	uU3d58KWhVj4inRZleRl3783UcAv5LMKwHHqvi3vaBGNXxEObttf0PhWIHT8l0JTQsrw9cN2mE4
	j+yc0n+cMn3O/iaAtoI/S99fWPYo16e6gX1ejoND9Q+Xr6De5u86D5vCGhVpJdbSVAwDLrr8dKv
	2EAZkXMVvm3prYkSXP7vlGHJygLnrJQ8HBM2bdadOrb7lgePLG2jTG9ef9eFVfuHxbyI6GaRryg
	i6VO75Wmy9GSMrqAl5CYSItijhw==
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr30563697f8f.45.1793723840170;
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
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
Subject: [PATCH v5 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:11 +0000
Message-ID: <20261103163715.385394-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

