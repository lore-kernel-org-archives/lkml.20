Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604149;
	b=3dCF1Ewh6CBZsO+FL9ukGJmnYBsCRuCBA3EnaZguq4pYJX8eDUmon4xKngNOPe9sZUVN
	 vG7uFeVAwtVQX6vlAyiK3Iitrio4U8l4eJkuEFMWRfjkCrjLQcl+PMrlgZH0X/N44Ejsu
	 u/drN5m2WLoWa2B2Cc0jN9PjN1+IA1ZiS9nw0dJKFY6d6oURYnCGq0Gq004GdeQeK/o+a
	 aAaiLjVQHA4My0C/sUeSiiaMZ71Ndz5hTF+VEX3/PAhNwgrpCN4QO5wNn4ytuktczfi7G
	 lNtjceKnNkeer8lFUPnfkEKfQlUsJViQKLmMVNNbiZm2P/V7DJoCrt1OSPjL+npRI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=;
	b=iA7qlWyo9/adijRbS85c1VVxhLOh8/oZr/SP6W7HwsuP9M3rx2GYF9jf3TIUC2S/aDaH
	 ulJwLFqX9Bnx3p60jH0jPnsbNt8rtyorZ/CyxTxArbxUt27GDGi271kVj3PuUSpJNF9x6
	 xiA8Ss98gcPCX5z7rU8PkCUo/zZClw7nQmq2j/jUq5DHavXMjrgpe9mNqxaEDO/WsB5Y6
	 ify9MO43celxePJmTQyJZoEFQ/dqick+i4LzJairwkVEAJoVZ/x3oHx9q3l3MmZmaBp+g
	 hQLGppvullI0nkJW4DrkqeGR/oN3ITLxOp8jUoA71jkVtSJMblkD/f8Z739QqjEdScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A40RjiYb;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFC606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AFC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A40RjiYb
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a18fc7a38so4476060eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793604148; x=1794208948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=;
        b=A40RjiYbuQT4l1IZ5KaRxQvTC95Ye1lv5NSYiPaoDeWiq1BHQoUCqvfvCPNBI5+jAb
         I67alxr5KPEheCAku4fQ0sNt1xSYrRr5xlPET/XtoZ6QAREs+RYz1+Vg1WzqsgQ7gjXA
         WdXu7f5Ang1sWhFgf6nI1tFRDlSBeg7uRQ3EbZmIRmhIynY1BmD65uy1dkmw8FGplAyS
         lUJ9SqxRqX3SFV7A/DJ13e9oMJmobinQLALerM/zO3ZE6vo8uqHHFb+wz40hT9I7Sa2J
         7nM4T6iekwG8ateOPeGbO/Lg8WmvYjp8gz/PR5P+823UAn5pyd8JXtIOjICb34CD+ha5
         JlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604148; x=1794208948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB/vt8Yqalu6xBIjfgP9QfXpUFDcSpikq6HleBSGoog=;
        b=UKaasasXNUdquh0QtxH4jUfGu7ZNhBYdK9k9B/a49Jpl0RQMM8GKxgVYnWrg32XoG1
         zJ3SDXNlMC2WGJs86QsRSkbl79Buaj+RZeBvnTelZ0g+KvJ/c88DFDelHUtqVGkpr6DJ
         LuIzsk41Bv3cTNFdyQBD17wZHbOmHeeCWGBe/oq0wkJQyTBcmnFXozx6ggfPq1AWhCuw
         BFQXC8MmFaLamcnsq0tCpjxLZfX+6l4hKN+4EbPwvdEgsrXvDvJOoAdIjgSowfzYyCH7
         CW7qyzEadI19xTOitdytxaSJ8u78Tenk41w2qTNnUqhzTkmZSHAFhjEJyq2bc/o8N6wM
         kbpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCnpu8wKh4pwAKx7WhPW2AVF739QU0ALBTPGl7abGjv9kN2a1jZIaUObMeGwktrJdWjqdi08C4vTY6ros=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d/t9xA6wWCW/Oz+lM6NcfhPQgQz2U+C5GiLNhDoM2MgjKBelX
	8fFeycgAqECYliyZT+7NI/A10EIQPTGf4fe7lfIkEkF5TPXpH0LDApr0
X-Gm-Gg: AYBFou3otBCCE7YrFzJoXvBovSUR8xGGb494G4fdyRHHe4eM5uBgDETbD9EHUCqGM9g
	HnBY2sFljIz8rQbUXUeunKe6nYJugts5H+u6p1A9FrJRPn8qmIBYa6JaKmz5Rxo2DPhYj+bxMn1
	kBxqReMe6GPYrR88ieDDXhd4UTSAMK9vc3EyhavsqNIIh3RwAEtG3s7SyImy6KkEfu+Z3ofYLRo
	lzCyt/0XIYrz88HYoPkFgd0mCan6nUF07FQzUpnhSD9Z+Rxd4yZL5g7J0sMEN8fhZm+JOS6L6mZ
	v5r4OwnYsXgOimHi1g6IuZJ5PNh0Q00/GnY6vG17bDyENUzn/26GhGosmB+Mj+wpIAyel68Z39b
	yblU/3V2Jgg35cA28jX9DVcPNTxjbkHOy46K2hoMWdO9q+XvRsfwS0HzRazot8NR5HpI8TXISlZ
	gaMlmT7bJk/8OSNh+5CK3Dhe+jV4zAmnuIZ7Nx37oOiW6tLu1rITXWd/lYB1remdvgkzczd2QLx
	jhKgldorG1OTNLaXoscU21JRqD0QToEtf7gaHQpxn8KsYx1bi3Oe33VLYkbD32EbuYB2YmSyH7e
	PzuWMnTkN/DW327S779RJl3+PfSLfJ9VLN9G/eF2OkJFi1vNTrw=
X-Received: by 2002:a05:7301:4706:b0:369:eee6:ee2c with SMTP id 5a478bee46e88-36a4221bc98mr13867197eec.5.1793604147501;
        Sun, 01 Nov 2026 23:22:27 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm36376021eec.7.2026.11.01.23.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:22:27 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] phy: mediatek: mt8195: Check PLL driver setting return value
Date: Mon,  2 Nov 2026 07:21:39 +0000
Message-ID: <20261102072139.3588-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The mtk_hdmi_pll_drv_setting() function can return -EINVAL when
the requested pixel clock is outside its supported range.

Currently, mtk_hdmi_pll_prepare() ignores this return value and
continues with PLL initialization even when the driver settings
fail.

Check the return value and abort PLL preparation on failure to
avoid powering up the PLL with invalid driver settings.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index a4bc1268946d..9658781484f1 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -360,6 +360,7 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 	void __iomem *regs = hdmi_phy->regs;
+	int ret;
 
 	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_TX_POSDIV_EN);
 
@@ -374,7 +375,9 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_D2_EN);
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_FRL_CK_EN);
 
-	mtk_hdmi_pll_drv_setting(hw);
+	ret = mtk_hdmi_pll_drv_setting(hw);
+	if (ret)
+		return ret;
 
 	mtk_phy_clear_bits(regs + HDMI_1_CFG_10, RG_HDMITX21_BG_PWD);
 	mtk_phy_set_bits(regs + HDMI_1_CFG_6, RG_HDMITX21_BIAS_EN);
-- 
2.55.0

