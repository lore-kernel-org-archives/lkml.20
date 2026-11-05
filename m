Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873012;
	b=phpskgT1Kb6ZSYVR5gICmEfSz8J+jLcRrnhvXBydT/kli675ZKECU8BtPz8TY0hXF16S
	 0lXxE7IERnPzqgyoAa4BlS7Aeu99HWwpHXF6jlbrqM0SYXvbZ8eYKHMYVPZOSTKoU66yV
	 QfNJq0dRTxsTUPg9PxfLuu48TpIEPJEjbyya6zU7jsOPE6xp66nlCLJiZkjHDCACLUqt6
	 D4htGjBeCFVvh4dc0L/LekWTe86mxCgK7o7kChGtrcjHz5vkAAupHJyTi9wi1aJOBsdjj
	 6bqDzjWq5Nywxd3t2fGDJc9iuU1E9A/UjhVPwBWxxioIMTKtjHepUfkFHKXytRhKGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
	b=VhK0/9yfsT8sHZDzTyMPgVqOusYonGnlufkEJZvcuXi2frTsHHzdH8i6Hjo6yzSt8uhf
	 op6jbPwZ8WqxLiIMxOYalTvRSjL3UhdtwCqZHKaibJtpDp9Sq2d/Oeh+6VL47SzQ9LTnW
	 YYLAo/OzdXXomSxR+DPdCkBhXvmvfrrat8H7N2PFmORg2LoMZZsAYPQgZOFjIbMw/KabC
	 HMSAM6/wR+cGtdl7XdL+ZETVZNzMFyYSeQlcueg9HH0+yLyB/nNcCsAPedkRNymxeXXfe
	 KMs1MnoXsHQbMURRPZtTuXQy6ZiEG/vGLXP5pzPWTOmsVexEClaxp3Qk4f2rDVT5f8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF3606D82C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FF3606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10056225e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
        b=AqqHYXBGHB0bcCJok242CF+AK3YXMFNX3Jf75cLG0sZjn4wHsxktXeH1KHB+2dFAZS
         vWBXPXQSfUWQSadkNQkv4bnWiRQeumTzhX7IJOFdQrrNaBIuI6bHTCP4O5+1jarVMcwu
         JOLst6Nvm/tT5u4Kg4cUecbl46nwlWwauc2XapjvaUH//k9TYXccygC7pWhDfVfBVWDl
         OAE+CvnKbm/e1oTQ9mw4Fnq0gcRg/wFckLJgfesh5IVZhJEbp5oqVYQtuqXoo49vcSIP
         2KUtuhZYNOv4aj/vnVehimNqLabBERTHqQ9utM5Yeyw/jmW8WDssT8KkGgvgrTTZ2tL7
         sEpA==
X-Forwarded-Encrypted: i=1; AKwUvBwAL9XNPuTVkrC+wYfrvuRwsEaWz4v6T3x9/fn+uNmk9Yu4qVL/lFfWgGdZV0KD55soiciJzdmbr7BSEGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ad5yqZ9yFn63lFDaXY1ZCjeRwcR1ExJxFLaDEJTES/80Wma6k
	6SlAsYy6px+FnKc2kV7x/7XSvxJloWo79QJtJkLaJcXP5u745oLScU6e
X-Gm-Gg: AYBFou145fw6rNUeb1kKQlrhHDNVug1fEL6TY5b7YjWHnvkuZ6rYHC2v7KB/HkgrouH
	2M+51LLdz3SSR43rwZeijuQ8pB9VCxxFG0WKxpzaPhl6xP9zcQlc4qpPet0g+l5Y8s9K90J1HyB
	ZGSyeXJF80G9ikE88IaJ4AzVRthIKlOpVN3yLRiwIhszX10O4XKLh/wfn+te6LEhJLEUPrMUEId
	yRujT6117EtSHYw0MtQcnX5VYMGF6atPbTPb2vKHZlm2mKJMUU+DdLZvKM6Mzp8pkbkgeIX2LJi
	+lrwzWPeQEnBADhygBnVN4p+BXB79Oaa/sxfdPj+8tz6u7TY/+5/NZJztopvnyWnaLzXGaJF98M
	1IjahOdRS3rnCtAihrZ3UbQLbiIx0rh49v5CVd1+KmLf6jGFExU8zRyyO3gyEAob8pNoW823y6z
	9E7eqtljIbGpAVgzsteSSputeUOl03Pfm2tiRgRavTFeucm1LHH4NciZ1XoF6bKJ/RebMGGkOnY
	xcOS6EI9GihGGrtcvRUwmZmugd19J93cife/q/vlmTouX+0Ax1iOAuwn/7GiHZKjHaits4fe7KW
	kFZcJ1aCSYEC8nPCpoCuIgyJ4HyC7OiNKzqe+o0C9mPP7kP0oAy8VKhP6vmz1Z+C6a8mBCEvKQG
	i3X9acdwircfyYXCPfiMYPnNYHQ==
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr382886655e9.29.1793873010557;
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
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
Subject: [PATCH v6 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Thu,  5 Nov 2026 10:03:19 +0000
Message-ID: <20261105100322.37816-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..c8bd15b6780b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.0

