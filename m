Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966348;
	b=Q5WAb/+TQnG3GJcW48S5ZWy59WzV9dhCkxxRuH1jhoBfMFTpydGfNnHpDIslysvz/wjU
	 nzhzY3is/cMhVyfdsT9W3ITkI1SjQ7ENwh0Fz4d3I7iYRLCBccWUBIaqeXHJYK+ziSqOM
	 NMh6h4WMWm8+y/ziWmmsRDoRugoQMgktRhjjSwm1Q2Eq+tMCFnCNHYy5oD15oH6d5svzG
	 zRbbX6g/PwAjWtvmwAWJxW0rQiJqPNw9Z0kXVhojBmVwGA96VJRzIPFFfUoi/ljb4+fxJ
	 +uZw79n7eRrTk/fF/rL54NLlu/haOWO2KsbaJlHhHoifsXvTMjETPV7/VwB+9efiNZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
	b=q97smV13Imq4VAeMQEjH+Q65ZS2oJwj/v7DJi3cUHWJIz8AxWvIMtz4tXvQ+KoGv33sh
	 qovx+xvZPWDKNte9MIe39Efrz0EXSdHTfrINy5tUH3pLvHLl7duoDvtNzSJFlc1QGCMMq
	 slwqfL0nT5XmT3EgQO978YI8QWEH/IiVkMvMQ9Wzg6UAmMgj8778s0xQk/Gt70Rxd1UkT
	 7zcDJnJyFjDMeeywiPzb5FMJZOalL0Cf5mRZpO8Ji1S8lJ+d1iXiDJc9tB+Zt7TS/fjyr
	 oYoFLjkaOyY7MEnem8xAlO5G9N9rFmSBUV6oEcOlTV1e1aYE5wkvOpFQ7WxYtWQYURw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B804606D831
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B804606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R7xtl7sW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5988785e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966346; x=1794571146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=R7xtl7sW7EmobVMgdMwO8Z4zbumVWxPTPUqr2gloWr+RMmgVLk6X8UZ7PZ2mwYaIki
         K4n0/3ZqNqI5e6Mnjn3IUgacRQvAbIgFDSxrj9QtUHUbsOPs34iFLSuIxqMVatMhN/aX
         JWGlTv65AvH/HlgUvF07JriBlvvSiOrRZ8FUOdSJCju9GElvmdph6uq3mai0VraqKqIs
         9+qmBsdSYBpolGLGgIweT6UX4CtsrDiRVtOfoVBN5k51JpnQrX2OQhFWgqEMvoKVItbP
         xNqInF2tnnyUvIQUw8mNMXilHd024EhauwK1wxdMUwWI7RpYlBmSUhLUOGg1MMwMhq+N
         k6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966346; x=1794571146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vgb+cjl96ygFaTK6ZGzDBTxWIYeEzqjwHcNjALJCkdU=;
        b=lv6y0qVxJ6XhpTyUY0BXPUKRdz8/oqU6LPBz/2qXO9B8VMphGreX7xxTFlzoJo9viH
         ig7gdyv06AIOrJs/BE7V/9N41W/7326/HwhqdobQ3XtnZcE+5wDNQrEeziaVIriwSUGE
         K5G28/vcSJJOxf2PB67S5lacZsnYNCUjy6vH2VD29IEzBhk1Wk8UiY5+cImwHMSizzcW
         qbQ/gZIIW5Qn3clZumsf8u+tB65sHn6DOmYh6CclBW/LLMZc/Cq5AkPOlPeyxfkW0KT7
         n0PBuFN66l96x8nPySSQ7LYJKtD+oEhUTjIIpyhM3O0nNf7Mq+W05Q95nqDiSI5aICsf
         NgBA==
X-Forwarded-Encrypted: i=1; AKwUvBzEZb/K/Pb9cN0icbOPgArzCApq9vTr8h7qEfAblHIPZoUlZLgBH4Ct3kSBzsbxefKKlloBZVIKPFPWX48=@vger.kernel.org
X-Gm-Message-State: APuU4Z90BsdhUI3sN14t+oXuwwh2I39G/bcXGdGPpxfi+53lc8QCM6Yt
	l6fs0SBkV1YRCVQ0FD1apPDkAnbuE+wMoHHfsStRZkSO1vL/Fu6s0aRK
X-Gm-Gg: AYBFou0jZnCw894+QpWnN/SuQZUDMyg4ohW18zHA+oh/MqmcdgrTI0jVRBRU8C2pfUS
	JFa2wfOGrbPtqeQ49puHt0OjJ/E4q9YUp1Bfy4PROmM8LrtXmQYZBapDZzJb19Gza6/mo1m+ixs
	x7lpqG3+g4q5CMzEw1nfX7G5TKD23R6nyXRCnvKqSwSuHECXQ8juJbsFP+AtzkGwgVbIRsKdoxw
	mc9FgNIeJsudo0J83mOf2RDY77Q3rMeU2QYX4/H4DogMCTWU8CMs21hxk65B+4PmKjBHHd3FKqI
	/xYLTE8CnAvr56BhSsKg6/shzBA1eS+qcZwJr20mRzzPaRhWe7tz9Vg9R0NiZeSIlt0YPpR6BC6
	DkxwH6MupImLia9w0unjwIwooWfJogK8pXJmY7bAHErz2QEoYPE6XeAzvMH28cek2hdwoHP+IIO
	7dI7+dBaRHPJURnArtckoVrqimSQfjNapWvsY3uxoRvKC1Zc8n7X3oMzGI/AJJni+AQGyvm9R3A
	Iy9TslSgdfNaLyiBQ/CUPCYX49DLlbB90D0FEDK1FrC1kqwT93khC1YGLB5wK61Uj6fyf8bN0AN
	fDbIaF+wsiAooDXmjejmWV4WSDHh2ft7YTYa5vGdSsbTGJOMx1ZZ0je7drT1p0FDee6mCboYZrI
	11UzNqXateMRpC1ycCJLjeAO4j3Tj3NvbFBMje6PWwU1zaHRd8tnxWq0=
X-Received: by 2002:a05:600c:37c3:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4b6d8592096mr37325885e9.0.1793966346253;
        Fri, 06 Nov 2026 03:59:06 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b76b5d52a7sm4849775e9.1.2026.11.06.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:59:05 -0800 (PST)
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
Subject: [PATCH v11 4/5] clk: en7523: generalize register clocks function
Date: Fri,  6 Nov 2026 12:58:49 +0100
Message-ID: <20261106115852.189098-5-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index e534a5c91e61..8e24eef651a1 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -818,12 +819,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1308,6 +1312,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

