Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269295;
	b=NqUFn45fsPeEKfVWkBj4y2xM0MybLBf/iinXza4NS8mO0rmxpV+FudbNsM48RZxqEVCs
	 D++MkaEGiqBf2ctGl/xfaNhTNzz5SudsD/VLkeLDZjwV2YJ2TfUNoiVy+Du9HUj0kCngb
	 tRjSQAwEgGw2ozFROwo+a3I1qRWdw4lv8AVv39Vrd0/gDGkLY/ENm1hMqNZqO0LCcdxa+
	 g38tafZeuQy4IUKE5dragi8CljWA7XLa5dIs426itMMnFu2McageaV9oIVV7lKUvw+lE0
	 vIlpBbGTx1zh3hn1x5yetecUENrC0gM97gvdCja6PK8xoGOQzKnP6t1M8sydXoArzKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
	b=pHq7+Bpar5OrWjTPk6TYomOIfayf/GpsZsc67ldzr/Gpa4Qei7eRWbyed3TisEYhOHt9
	 CTolPQnvePxNvyR7Qn1TA4HfKB7Hlzi6iIWz5l9E70oCLfy7R1NaeC+xyXMpaLTJY5PKA
	 vd+F7SGzujiCWqhkbtvdVumZnDnWLkYkX9qCY0NP+U6bSgMhARTwk4Llh9MuFpryuleKc
	 k7vBxjho6iKtDraVVhcCYzjsQHl30B01j1XCPFbvKyL/dCYvD66mJop5YtdrEgjxdPGpe
	 UFI9Y6vaid9LeysyFsOYGOXLt46XoeYTcQXaGaixBFVlihI6KLm5NQUWYoXZ7xWmbDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41860A2635
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF41860A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4910b863b84so915039f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269293; x=1794874093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=CY3ZSYuMj6d1KBAuZ6mSZcQGtrsjTZEfWlgaZXhTn+GsyS2D+PfZK7YizsfmWrNXZe
         Trybh+Wfbt57HwdfM/se4a4grwhRBYczTw0XyuBmuTg8cjGxf/fvPlwvE6M9XwTmEM7x
         zKA4HCgkRuTjjizqx4XElLoNhedo2ri+wxoHbWa9mVBS1l9sz0zcPLyjdqRthZ5VNZDr
         aLUCld4zrjNa46S89hjyEpVOL+H/pc5OM+QntJsZVSgbLjdzxdh0uIIMOrCIqY+Nr/Yc
         dgLfLwoff65nz07LVtf0UqFBPO7nMmh5Qr3xpg9tI2y8Sav39wdVxzkqRTAuYFytFEjf
         hZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269293; x=1794874093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=WvoMGXHfC8eNihVM8iek7O9Nu++BkM7KEOxI7xPy9zZu2V+PmISgip7l5VXQ+ZXPAV
         b3IwSd/8fC7mGcR6HuwlMF1/KE423BirXTqI0yIKfD9OIbp7KafV0SXJe6TmHZqgURpa
         3CeW+FfXkZiFmkMMCwSOIPoQ6A1UxWoQqh1t+lWnlcG4TG70NyIDtSGzNL22fb4qFLAN
         UyvM/UzYmtPql39I4QNZfwdjHO/OR2IY0xoqeR1gznCPuW5GZ1b1qew2BmBxdmICuFZQ
         0raIbD8vJaay5db0YSF2EwZqOSuuHc1+oI6CLx1DARrQUlMBQoOFWv/DjbokFSFjBPnx
         lZRA==
X-Forwarded-Encrypted: i=1; AL+hErG5feC6chnDt863H0VyE5kLMMOOYfXUKMVbh5/ObdKlAMKSFP12t289lQc6LU4bRs5nDs+HKKUqu/8/Ky8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lTSnWp9KZ+4D4EIAcRhYwm8CBD9usY0FC8JSr+UBW1nEQF7HA
	FOijKhb0xroUmlE+TNyAycYJg+Eer5M1ctg1xSy1qe2LjGuTYxkMWGQU
X-Gm-Gg: AYBFou0EJ4qmah/7YRZWnVF18zkZLPLeMeBufoJobxwWva7yTw+iE2/LgJaWzd4e/2p
	To38GGI/usJV9F1qn3tMGBZUR7PMab0S/+UKxDEvjLxoTnOFjcv1ZoiWFIsw1tVvlZCRWK5eVYv
	ztXtoaFplrDgw4/nEd7i+tc7o7zNDGp6nZZARSFDhoKu4gbWPYv3Y7MfzsNCukKPcfj94v0Sc+u
	MoFb+/i4nq4cnkmC8qxNCuDNCnKmdSTXMd2f6sSoLyWhl2ggtiHQAFFdf8zx7WxxW3lDLu8XzTn
	XUzgob12RXC/kzTLHIprTwglbcUihE6MYSBq0PI/xk80P7WTlz7lIp7x8gkBB34IF1w5B27moox
	nzD//iSvvN/ujH9nlw1ZxXhKoijPy3Sn8H9fs/X+fvR/DAvCPHYIKhQe72hJh/F9WeHYmZ3KEBk
	tt/HLXskMk6ITnjxW6XZhqBwnsrpfotkdjDO8lrZD/HEvpmjuky59VGYboofkNaEtJu5VNdtcOt
	yUdj33forMAFkUJsatRV99vf4TM+lxCOOJPuYhA1UXIhRPcEQkwMYxvA2Vti3XiTsZUkhuCjGzp
	KJ3mvkPj4UoWtkMQ5/u5qLalHLJPs8v3ar+mqV7bqp/Dl17CTum+UHIVvVBzoBeg/ZA1CPZWy1H
	25TOmvumW8Ebjbhc7t0iqluk2BDmU9Jfw6Vo6kdwlgZp3DSOieJkxxflUGAStL8INAMnTV04=
X-Received: by 2002:a05:6000:5c5:b0:492:3f98:5070 with SMTP id ffacd0b85a97d-498364d741cmr1563424f8f.12.1794269293229;
        Mon, 09 Nov 2026 16:08:13 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:12 -0800 (PST)
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
Subject: [PATCH v12 4/5] clk: en7523: generalize register clocks function
Date: Tue, 10 Nov 2026 01:07:49 +0100
Message-ID: <20261110000753.508-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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
index fbe10e4c3693..7d302498c3d5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -823,12 +824,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1314,6 +1318,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

