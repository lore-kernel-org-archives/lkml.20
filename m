Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873013;
	b=ZqfrWlSR4+3xin8WJj6n8eYTKnhTG1z1LD+nrVHZyNAfgUMwbPWdKGCMpUzeYkP/L22i
	 XH+z7j/zG9J5ZpygWon1MXhkhf+CQrEyv86PoK731BaJ6wRVfBn/v1C3P1G9GLcoRqN5i
	 UNUe3E/4XygWF7ZDQ0PiRYsbvjkK9IJxlZnabUBnHRwLHPPyBKvc7ox8PeBc/g9CAAuD4
	 GAc5f6DnBdy01Vaeac0LMdCamC0WT07aOY73KpHblZzuip62w3K4bicEhHxhMF1aS3nhB
	 XGjOkLx6duP/QdWMWpfnhenf85DliWZQg3iV9qhYPs2SsnwHpr057zpGzgX0nC2KpCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873013;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=hwp98ZKMLJHRMSZrWaT3XyVJy7LjfH9gkN6ga743VImZ5T9c6XhuJnyEo36nDsgU1jVa
	 f9nO3jfvivpQfKb56WVDrREz63R4BbgTGRwwLAMiOiGs5bVVLvO2OM8b24p13BZEiBLPq
	 7u05oa4FFVoAZ0Gs0GDo1EoqXBcZWSdBHCR/F9RnGFEnd7IFYI2r5pwIAC7/JA6sNG2y1
	 Yw/tCTyRa+tkM66LDAc48CTj2UK8M0LSonBAA6VKCXsdMVIJWwQQJSTsi5EPvcYAdTXJ7
	 A2x5WKtamHsn/dBS5/lNzpIIT6Ehv3L1ygmT4dndr+BN6Y+FDeAJvM19gRipp5q2Y5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD94606D82E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD94606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12133145e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873011; x=1794477811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=sxco+qQUXdjDtPKZIfk18BYdj7UAWfH72H5ok9HdyV9baZJwv6mhIqAqAFJsOdpg4q
         rN5qH9z0MXXOnD6eHpeAyrCBL5RIXRYry3wEohsd3lv9J7RzRwz6y6STgGlnUq4mvL06
         1gCa1AnahV8t+IyqcA1cXrcwM71RYI2sYRyrxImllc9AyFUopoYntrW96uNl+JLeyH5J
         drdZ/OXY3JTQSDqOxcgFlqo9DCM47G/i0DjOphdmHCTLxgiqre7wu/hsXBpxnJ32jMDZ
         2BGL4lGwouB9N8fXCHy22BJ6YRGZLbuXAFyzkZQA5Okb4gmdaY939y7GMmou/UE5rTCY
         hJSw==
X-Forwarded-Encrypted: i=1; AKwUvBwlC+BtgYpBMHD2927hFuVlnwrGrPT8iQpZwX/wSAPRiMnM+Kr518r3GevrAqRBgRy731UVAB16BXB0h8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3QeWH6pAwHdBpSKVx4NcaFRGHJ9wYl6qm/nTs8K3kotrY+rFC
	ZqeSM12/vLJ5jnV2Gsi2Tb4d04yS+1JvyBuflDcZPWm+rikWtj1Fu8GN
X-Gm-Gg: AYBFou2FNMighYsfIy0engxebpVxsbK4DIXUflYC0E6AQ/mrYyp9ZeGp3l6rHzSKN5F
	PPVHKY5G7kVrR8ZKOIhNkCymFKHJxtYNSQmrWTZ891SVjidSeoMaMAlbPj+Qyyc+RJCRMXqHNv/
	Letbnl7cxz0jiFNVqCI1eibdDRlv09Yy0XFIpbu7j/2gYpBo5sUFOCDk5H42PMRrJz0dJbWoWqr
	CwpDuRvfcpzpbYf0xqhr9haiZup+y7yLhquil5K5MhKB6RToEm/8J7z7gOae/afntiM1dRB2pR4
	apfuthDo5GG4lX2y/p1yG/f+u/U2CcHQXvqvOLcCypZ+QYHawtUeZzlH4Fc/htCaOwn2y9K3yVp
	YkosHOAeHyW6Q8nobJNQaeo3iI8YlgES9zGvKn+bP/eSoh7BoYQGt/p1yMcpk/F6CMU6FpqTOlF
	10ysSie/pScEe3nPSK8UX1U4c/OFBoatoe0C/eoIXq27ssSDNr4ujLA5ji3BhE5w2fkF2IMofqG
	oJihSPdOlqG8lOtcp8wnYp3Xv8mNka1im416LqyKQ/5Wu6UCZHZ+kub8IMtvG75H4OkoY3OmxkA
	CC2AfiJNTpB0sx9oKU8cFJ4LEZnl4aG+2VTUk+/Lz3jtkwetb3cy+79YEqLvtSheGnZAEl1y8RB
	XLYzbz1uumjzgfI3Og7fYLBdnqw==
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr430949735e9.13.1793873011464;
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
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
Subject: [PATCH v6 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu,  5 Nov 2026 10:03:20 +0000
Message-ID: <20261105100322.37816-6-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0

