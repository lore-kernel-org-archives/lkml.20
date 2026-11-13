Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572342;
	b=SlbP8NZ3aDc/YFMzH2J6jPNMtm0N68NDZMeqKJRfJw5XgQgQ+HXJ/eCzf/J9enRZ0tK+
	 946LGinm5NlWsvU168HABilC3Q38klmALlf5o782hKrO7VbtICZP034F2fF/XdzSPFFzO
	 CXXOrfo/4QodXSXnhVn7GIaVfv9+3qBoE4igJVD0v1GIvLdL9hdoEUkkMQfLc5U+Xg0pI
	 ZQZmtiy63bK3xhzalcgBGWCGFWFckL4qhJOqLuikd0M5KMQ0BepXKURvv608aqody5eN2
	 3zn1PebRU/HaxX4saJ13IiLjLhOpgROkLhNjeQ4Y/CsFsKvFpEI+GZPQGcFLGdLlROg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572342;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
	b=0Xghw1p6/qwBkzfA8ws2/faA6V1S4tP5Hf9NDyIQuIRKtO3GXiqQS+oxIZswXHUt1VN+
	 wjSthjbvvJqRpiMhoUfyEn8HiYAF4fQ3iru9/C/8SgQW7dECPr0nltxK3DtYjUa6bO179
	 HIQYcwFmURr2Ga+9qMt0rDyWYC2QjwBbY1O2FFr1+lhjuaR6R2QHIG/cK1nlauYYva83Z
	 KN0gHfD4b1ylp/GtbD0/Gz2U2LQMs6L4o+8v3B0GIKPCSD7Rgcz1f6aYt7GZn8EaF0eXt
	 SO1PdjpLfHpxITJpwy7apY81mjqO4AGTAqWio7ciuyNeJxXaAXYOAzSB50YTQsqDCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D2D606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D2D606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so375798f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572340; x=1795177140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
        b=xhrYtRjbK+tld01EluuHszAd47pYQZ89z6+VmcPrVP2mHNbTUIl+k5hkGWOo7no9zW
         AzPaSCQwnZL8ptJangpbsI1uUkrrRsycoewAYeQ18M/kvsbcEZFd65OuiS6wKKDR+yUf
         iBQZif+yhAECHeKI/AzerGB6vpVBPiMsWnWXubqO4ngfsbkPwpyivMRysGWhumjnWfco
         ZgcOYMgNnt/Qwfma9ostHwpMq+fPARRYx2XbmVwpnfFwGmVk3nQjBBpGuXv73ozy1TBR
         H8k6p0990SpOIFusspuobFe/UEiEzK0ZJ3EDpmp8H0fPrjQJ8OgG8M1WKzhwPiDCkW+L
         ZYWQ==
X-Forwarded-Encrypted: i=1; AL+hErHx7wMTr/vJGaF0wCvEhO77GfXz1tSIutRbtiUvCfMWVp/KGDFBYBH98bbgqfnYxPNwdBa4Lny7qfpHVeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aSzsaRGqYfwuFiHXHpaw8n1cDW+YI+TLezxS/Jw+YnpaHiUzN
	8dQ+VCtrTuJJEw1jvdxdWcV2zW5DgMQIqXivagKicNUIhBJw/oKFVGTH
X-Gm-Gg: AYBFou3i7yPL11stEHIuml2aiwxb2F74Oc4b8CSDF1zkjdnWBPOJk9ZqfqUsyVltWGp
	m+dIN6TW5vAzZndNT5UhUOhbPYfrpwWNJUhyaFUuc7L5IosMJMlOp0V/nPOHNeuno2z99D/mZwq
	yByYuI+lbi3QXgyWVA3kq4Y1d8OPj2721rJ87avuJC/UY//vTwQcIbmaG/YSXueB/RhxOk9HKyH
	FU3vF2ioIuWWDB3AV8YrtEb3psQkPZqVhUhu5cPhRqcJEv3qW0lyGLRwePl1GTiUsaQYiHfW+/W
	C/QwxjKorEBSEzyohKeJ396l/GT+HYj8m5Qrnx1xyfWIetXCwFW86CVW3gw5BopYqu8SbkJ9BFu
	wzTaQKWqyQJTOmxYyLj4GigpDFehWGmPUiY5E45bJv22xwOgO7Srbr1osNjCM+sUMW2kv8rIqas
	5SMwiDMli5IC5wG7HGWP+9zBV37TreeXUpC/DKgwasMWv6G7bsp3Moxn6aPYuQVUh+Tl45gTZWt
	dCj37H6fCEczVvIK+nem2vSf0Mr4BAhn7ToyB4bsre7hSsnHB/KEB0U6ZkLVL7amVr0fTgdhxgS
	4h95p8UOrJBWVpL7PuQIYqvzr6wGhPDyqdYV4XFASEJecphrWoJz0lQw6YCzKI8M7FhSx+G9NoD
	SbEPHMJ8i8HibDOiDV8Chvmx6rA==
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr6076606f8f.51.1794572340085;
        Fri, 13 Nov 2026 04:19:00 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
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
Subject: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Fri, 13 Nov 2026 12:18:52 +0000
Message-ID: <20261113121852.334604-8-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1

