Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699611;
	b=Hw2BOwGxHuWRgSeGnFA1k2GQQIRyXbm7Y8pRhvBLLI4zSyh+qbR7Y59BDtle7IPd9Lpk
	 +IDMSxTRgyiay9yyA2utrCNg/ABNYFa95whZhoFT6bYN1N0EXDDRkYcKfGo6uyh2Xo39R
	 KuD33K2dKPt/eQcqFdTHW+33TuBmtDnw9gXdot+Iqc/zfs4Sj1uji5se2ulhN7BAbg/gs
	 VVkRqn9JdtLJlMtMNhaNtZD5UihigkJBoOum9DVDripJnlGn2q3nEwWSdoEkg9UnlwP5+
	 z9UIw7+pRQy3b8LIRU8SJx8FHzm13t+3T3cLDq6rYOZd0tZAyV5gCuINbb3rdxkrnYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699611;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=0sAgHpehQcfAj2hsYuQCocLlia+Uotm3r8l+pRKd+sZqFaiyKJdyYbHKZWMpi4y/JzR7
	 ogvo1q+Mt3IaugFFEEaZkcnrRwVJD7AXxv+Qi6Gn55m5JVs1/5P7TkEv/3NZyFVi4SwmU
	 UXKNofFlMoSKmpXf5bDVSgICyHRCsZ+9IguwawErHmoWI6sxvfAvP3WfNiwN2+c3Ev8Xj
	 KYybBzReNzYQZDZKchah8r/2wPrlB3hM3HI7Z6fNe0N6umOw9cFfY5+We2vKlZ2HBxN4b
	 i7t7ELRDdZWllJ7sIzRnRoU6DWNhHXV85ECJ5D2cahE4EdpGgFxVRF3kdGHdgdQdkoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E861C60A2620
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E861C60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so648665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699609; x=1793304409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=hHNxpqTth7SgOW/gmzjzv4744tlA2T0e6fcGzElqLL9Y9qnU9xW2P8f2YrqWYC9PRb
         BOyIYyIhxth7K61koa+VvNOmWC8Y7tz7kqBYRQbwcudmvdQ9Na3y1xzhszuryXz+kFXk
         YL/m79bNOC3QfYlhxRHoJ3vvqIcEKxQSadIIAW4lC5f6di0urKBehV1rVz0Ehmk2RMCD
         LKdwJVWUAfd9o+VtpoeCiYVrfjHn5HR5ROtSZa14DPzTu6xYFZQ20DVTeiwG1sMxq3J3
         LjxAFRQgPp7ZwN7o99lJ/FYzL2wzYTjBbicF+DqBBcRF1xrRsZBLAFND7dVtHr+qU5xR
         av9A==
X-Forwarded-Encrypted: i=1; AKwUvBzjEQgKmCBKEZDyhB+m8rYM3zTupRq4IHuzxluqy+EiDYDPArbhzX1AtwXelCTCj4VRV5QlgH+B63AWVfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl6ICAzyqOufNBmSd9prmRenCibqXLKg2+DLzXmvTdNN5KygcS
	+r5KhH9AdlNV8UTjV1RiGF9bP2IVDQfuUzDi626YEXYJWZhXHCCM/zfM
X-Gm-Gg: AYBFou0+ULk4SpCi+jOqJNfi9q8mhuhyLr0SaBKkfpSm/fLU+GjiFc/dEjKMNj5gphX
	JJ09244v1YUy2Dk25fwttwLHhIRtzQktvN/71HgVd8dTuzhwCQJsbxWH5q4iWwor8f/uU3Oqhhd
	sTImkCb8ncJNagiS1+F1QeoBnOoMAIPElA++DSr9W8kYIiA7CC6PIud92Biu/Y+65i/RB2x4cfK
	XLf45NVGmS89hdsLc6GjnKM2dcCoXmPJ9RyI34uCigmMI5IkQe2TjKHxCsf5LCV4G+zyRTxwO6+
	X/wsIF5gC2QrYZdhNHCANTlw4ntm9peZLQ8CKdLP23vw+f/uEBHGOnrusJdJcTyPbzfvI2Q2ghR
	Bq6uP2QDgAOYa72A8Cbg8mOPNLinl8Y8Y6DtK98u3HTgCgNzRXo+Fab7m8zuw2lPD8QfJerWyc3
	5sYSN+1LLJEavmR0lHtVIFVU8Q9Ufy+MJzgCtH2PNlE4HIMR2RSgSqcQZJNoTRQuhdlKQ4u3yet
	sC5d8vyGOifTqCWTY8w441iA2ARWfYY1NiRksrGs29lmAvJM36WAVsso7b68jCto9E7b+OzVVk+
	kbbjPQNGvB5BO+g=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr2469675e9.17.1792699609209;
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
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
Subject: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:36 +0100
Message-ID: <20261022200640.3101932-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

