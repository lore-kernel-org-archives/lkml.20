Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233544CF52
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744772; cv=none; b=gDTf8Nb7TEAZ3X49KnnUZh6rnbfZncJeAiEGIMpn53p7Bpjhzg/GoWvnk3Aun4dnUT5EfrjX5XtRuCtu9mXQVckIawjRC3AiN1/GNVYsrA37vBPrlwbXlke54pKIHFbDPhFQcIzoFcyFvxO0+hKgLQiY5yoo3GKNDxqp91SMyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744772; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIvVPAjMYistLN+hNIj2XAKmW8Kh5KhKIpURO7KLVuU20FKw6Q3zTPiY3hWjuDzBFgMyVQfP7Nf6YDSRcbcEFcf57eVRK0FZArg59XjMXdpN4vbupm+nW7A5fpMOaxyPnJMAMRI1RXghLzIBbsE403EtQhBA97Sz0Saqs5XKJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGRfIW/2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGRfIW/2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a01933b584so10812505e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744769; x=1792349569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=NGRfIW/2lFAlhowVck3jYiqZ4c7+jQDnVXjrgPYUTpjjzkQcmFTuj4gkFuedGtZnb7
         TLlp7hryQaIbOMlvQ4opSoYI6UcFIUEIkI1tQxXICiMEeDEoEAlpaAlX8KANVDI/JW90
         btNXQAu5P8u/IKzqestMR9rQXKWZFMUdl9cqVTtSZtW8v+urkBHaZUrhgLIsI6Y+jDZy
         syMrybqtVfp1bCHkjdb27q1IW5dt9SHL/K9cfFc6HzDs0ORE7s7WHXp/B7EXvCebiPKh
         IoCttESWV2mUIM3D2LKN2MbIW7XO0AxgWT3lSrV/JWoQDk3zZdDHJ/MtoPiHo1hsztdZ
         OLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744769; x=1792349569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=rEcHyXoddkwzEqDZSNnfEF+9ze+4gLLGZn1fULX+aAQZNuaWCfGOQXNGNbiSiMQdMa
         /gUcz7BWpl0pjmW2zgXx8uHPrO1dYug+VKyd3qoJnq/tqIj9+d8olpTXQRZ8+qqANi5n
         oH24Ved5dz1e2imQjl3DPRr7mdaSovV45CYj4DB8RCWcekPlT3yf03uuNLJbz4ZOU51H
         1pxqF6WWHVzHI7P/ofthdOWeuhxTeNKcZtgacFvt964twdloJ0XV7ZAU/Ne0+1CaeP/f
         NHRtTXRl6/NmZqEt52aNM5pxkXACdAuhEF1VfHvzAe3pBWTtSgmTRQsTBtjXELgDn92x
         GKhw==
X-Forwarded-Encrypted: i=1; AKwUvBx4yC5Q/9plT9+Rvw2JduPdBIkHuAPKZe/p/VoglvHO6997i91A1HrMVMG8CujKS6gmK1zxWxsnRmvA0SY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdrPC2Lm2z2lZ+rBrjo/IyCq3jCvp7/NeDxWx66ADR0pfrd2j/
	QDi0vL2r/oJtKZ00hOMOV05qe0I/A0PmU9c3hIJCtSyUKDykB2hTIFIJ
X-Gm-Gg: AYBFou22glX6s5/xg1fbcSL2thNrYpqhOCKqXWdK1tRXT0BcZYTK+v3PsmriXYAx58s
	/frR1tLTvbAMs44kyPD1cqjTBEXQ4OfCLRKNyw0f3mk2UF0IylOdO5aygviRxI772eQsH7ONdHJ
	DD9rTFEz4AgTCA9VJ6Sqqs659vasC2Q1I1qhmcvhdIGRi8wfLPfq6etCAWLZrlyQnkSVBAZKODA
	PyLotZB5y02tNTTpQAu9A0icpDJmZDaRFnXXLo+Fw3PRVlKRdo3emtPuR9VsM4vuA0qMX+yYASm
	qhP93zLCwKq5RWo5qfMewsp5MRLqhaZNyNsvFOmogNPUBxUGhtkA1iTsPdXWL53m7TahkFUxljC
	a7eY3nZ0JMkn52lWh27l8jJVhae+NjrCAQF3reICRwEsOYViCz48ArNKb2/hhDBH7T+PQrlmpxx
	I/r5qacj/Mio5nZks9DyPMtu4vPOw6FJYBrDsmtzEbvKO9Z6W92y6be26xFDmEItw5R5AJI6yzb
	7WJnCHcikWhLSlMsOTf1E8BliTDdBTvpWHj3nQ4HMKDU5qQjihKGNK/OcFdQmLCGdoFS+DlGy/4
	n+u86WZ0SJrulnblPh2keGw=
X-Received: by 2002:a05:600d:8644:20b0:4a1:9eb2:b2a8 with SMTP id 5b1f17b1804b1-4a19eb2b2dfmr12876165e9.29.1791744768598;
        Sun, 11 Oct 2026 11:52:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:48 -0700 (PDT)
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
Subject: [PATCH v8 2/3] clk: en7523: generalize register clocks function
Date: Sun, 11 Oct 2026 20:52:36 +0200
Message-ID: <20261011185238.52229-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011185238.52229-1-ansuelsmth@gmail.com>
References: <20261011185238.52229-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..ec66a504d4c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -745,12 +746,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1226,6 +1230,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

