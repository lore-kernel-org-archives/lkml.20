Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723844;
	b=b7/7zxQ9n6bb2dEu7eXao/oAVnjM+7nRROSJ6aK+RAXr0LHlNFv4JY3NWqfclkqER5Vx
	 mbt53LGT3314wgtjn/xDGq4nuGNkV7KNwuhgrtwcuEw4f8+AeDSg0XeWI8MGo1ejFZwh6
	 RqoKihy3zoFqaWYzgZp5dt/yf1wqMYihw/spv7z/FiYpO6FIx7lb5k7/peNXY93Ek0VPs
	 a8NS2x0fzKaiZ4MX0d6Pes9WU52YqQLCuatUWD9L70zW4Z3v61+wdr6aEJ4LjOMiGT6CM
	 qSQiunE4LaV4jjr02WCRFwh0KgaCt/6715ezqMxgi7hba0C9JfUUKp+LS5X9i8pjkDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723844;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=ixU6ccPPHibGR8iIFiKtM1qcuvNEmfTLroEDowWgY2dJNkt6LpJlb6sM2eB0M8juak5M
	 m80V6/K6sAtL+o/vPQVe+MFIbU8BoxFLIiLFHFOr1715tvmrRO2Vg7q7k1Ajua1N4bMkM
	 ydeehGSD3rYlyM4+pYpZhij2HWATiX+bob13YTrwcKn7FdrMo38rBh+d3qTACrwQiLo2e
	 hZASnwgJSShczC2V6ltfMpm6k4CTpJrqzzXkek41Q2QwY91ZM6vPPaUM4ipwOCVAvep9b
	 Qv2B0Rm+HqAnzVQ24W285CAR+k1kKeOctBaujzPTvzUBkr+Aotn6XwA2SccAD8sOLiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC1E606EEB9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC1E606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759980f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723843; x=1794328643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=JJCJ9GBXmjP9m7VNeUiKwmfMjIW65f9Fl/EE0SyG6mRPk9vtlUQ6OijY600cFOdDs9
         DWy5AM9iiyKRRS08iY2NEHeEK/NsGki7o1EzTeylRLSIESceXiyjCdL6vBe6N006E7Ya
         2PhegQbYUU+1a1vlHXGoSAZ0ORI6Ggmy+dpgxFZKwZ1ytZ0b7MflRhCPmW72xPSIbLrA
         ey3lJvA/wCIP/lEiPt/j7UaY8q0cp/pcx4y4+tLAZ/rZVhK3QtSFTfuz8MLPwSFl8hRo
         UDZxb+9JxVzt2jqWOw9j6EWVvE0AlMCh2lMlBbry3X6DdATa6hcmR0YHTHkHgJv02TrJ
         rsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYNqhetfAH4WjohDWkSolYw/5S3N7rEwm9EOZ7Sn4dggukEjSBDOndnMGf+eiYhHGL1ptVLkS+uTA6vA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fyF/7+hICe6x6B4VnmoJTEVzZyyXK4cb47kOjkt1D7MTs74Ep
	TO/u1fu2eWSu0E31XaR2yMdaU7AdWNYHxtIhp5xojna2N6LnibbEjs0G
X-Gm-Gg: AYBFou1PMLcRmndq44X5jt47kmLY0kD4yNhljMPApvtPuEgE6UKvGN67cmhnJtLgZIN
	Bqo3LfcD+9kDVu7NdVKxPnw0Nlmd6RZyl4p8VfniAw2miWRx0hLget+Go3z/ePfzAxCzuPLe5tq
	dfoxsPzwiJapbE4VtNEIgRckwiLNVIiHROor/6LehJ0xUa2MnjddGJikMge9lvkB90kP5V5yAT2
	r0h+t+7ZB1CUV2ZVNwujMg3jB8YSsQNbw/aQvhvhWGRHjzq5WAKIdBClXCCq7iRG7g5EusgWxMy
	VoQ/jAjBRzaXZ/luLz7g3sUXxyhBeaawPdlArEBFLqoFDuE99JPVFrDkHdlp6N3fV83doyK7UY3
	bnz7sz60UA4lHgPYoCnwHVU7gGDUSeXDrSInFcH8C2801mt/CwSb11hMk6hhy3A3ASsYXfFw+Ox
	YYuOtSRMK1hozZo65Twzb8zPOJWdvotuv4jORdSLC+MnvXmaLCgtbdUqTnQ5CYOlzSechjk/sZ6
	bki1GLpNBr0s50NgkthEl4q8/LGtL8i8oBPRpN7KcD960bkgyMq/z49eTdsXTmrzLT2hSoIstN1
	6T0ut2XzY195H/0eWcO09LQbsfGTLcLakNexUTea0eXFVFw5aXqZU9IwemwVQZPayUlW4OwA5yw
	lSWTzQ6fDRwzdY+Zcaf7huqeUxQ==
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40422568f8f.17.1793723842657;
        Tue, 03 Nov 2026 08:37:22 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
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
Subject: [PATCH v5 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Tue,  3 Nov 2026 16:37:13 +0000
Message-ID: <20261103163715.385394-6-tanure@linux.com>
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

