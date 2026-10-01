Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ABC4848AE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841123; cv=none; b=BMTAUXC8yj8JtvZIy/qyJZRLuPAxM1djMur1foi6LcYaQwY2Ylrd1fv3x35wPo5LeUgawcVINCWSWGXLkVrTVOQH1Av9Z462RUSAOEq4L2csWCCTeXvclHbZ6gCN10TU/cZp0QkRV4A5tmLPdeNDg0jgXgBk6TEeqtAtrheJIeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841123; c=relaxed/simple;
	bh=0aVue5qlHixKUDgsg0/JaFYVf7jDnLSm4fZZkO8n+uE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=inMbVH0LprASuEJ2Zr/MXu4tsMljJ4F6+faJEWLmKE1kvTNP96PgInbBARLkHXCv+WzLISl19xTqohsqmlN4jzc2WtKUyzOF7Q5lP6vT90MHVvisXKlrfLyazyLAJmNgymDYZLkZ2fbwBXDuHwL7Hco0yQSEtDH+GRjCbePZStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ2nQkl6; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ2nQkl6"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso1370900b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841121; x=1791445921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=eQ2nQkl6xX4DO7OtJKlDC9LSi/pWn3aq/InuMEWwzSavkm3nYfWZmeabTiYHqpIexJ
         wYJLovMz8avshQIk/ZeOPryr/8R3Q22pm6vb50s9NGQMV5N9UeS9Slb32nnf8kxm4uDo
         jbEqcwQSXZgNAF4cWuN8SJbgv1DzXZmNGQCEpSWkpOZbfDDXZrnciucWN34D7HN26d9I
         XE8K7Vog1VcRYkAYRRYjwqnxkGZkCg1fmiuU5LrpdoHBBFa7cIVoNyJMUxHAlDrKNJ9N
         i3iv/9aWQreMfVYDVgK2rM6NQsQca+GEXBImBw0aCvv6zzwZDRepPWzzysNfKGXbRBUu
         9M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841121; x=1791445921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjOU7YARtrXAbkjxgoW/D83MupO/fBHcHqOARUheMbc=;
        b=Kub4uTWKW6YuylQYZuWYcarNh0dMxw4UTGzbrx3xi8iHYiqqMOabipjySp8y9bC7A9
         ykxcki+nXYFf3Mizh1O5FgyqBZnHw5AzSZExPYlCQmYrAY4kkGjYH2i8iY9jKYPvUl23
         0QppX2GRvzzKp6jht9YXUmRX0Egn4Lw2tDg/MjKGbgUnPfQ6xBcViypZfQjOs8Di3ZP4
         LLTPatipSc+l6rIPbTQHbj5YNJTNKAskHsAlhJ57djrCwivwq3dFu3RxWUsnwNiFhgoM
         cplvQV6d2zlrrCzxikdqbYQ9eYuwypo9ZN7Xn+30T1nADr78nTDpikMDq3PkTL5VXoWK
         Oqkg==
X-Forwarded-Encrypted: i=1; AKwUvBxGgoHTh2Wz6cP+dQZ74KyPtaD9pHG6AnoM27BKs0wC34GztdlfR8T1ey8YjHZ6P1Q4VbRKJNbvHCN3oGI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNSzoRrchosw1xSXcUwVBAwn5M7xG5waxGtjOLk/Kf6t50QGSY
	Gnn9KJ3tKxFVZqKL2jqYHUgRGBqJh3CX0OW4Fi0O7/p9esJjq52pfAU4
X-Gm-Gg: AYBFou15VP0BTuYCh5/QxGbCvAiEdJyz5BQq0LJTdavKzWg7yCLlB7600xPq1pzjl3M
	lu4Qi5ceo6ZDk8zuBkPmjxB0YJJsvqU4puEYlGAHNUal1Rjwh4rJlNw6nmy4ts4TqASDM5JIKFf
	zRmNCkm/CUyE2sIOC5ZOO+1teNamDv0xjgLtHxzlF3KGYXAUU8Bi0iZRB+dsAairqu7VYnkD3LC
	Du2yq7g2hNgRgOCvZ5y7GqGvZBP8mUNF8DtxQZfZ2/gbly1GqFDaQU8HRpNGb3ISmUa0sqlYn5f
	ELvksaumuCYxfgaYV9JoMEeZBRL5IwCfXZjsCS7sAU+aHgdWw0ldh157n2fzG8EdV3vmqIUYWW3
	6Q1Tk5IPfdyFOfF+/z3VB1TDZehsXEtK7C93zipUluzUvcQzROCGveKooaKMUi0J45nfqgW/g4k
	erO87mp/93NgnvbQh8bNXdH0Q8LPv6yPULbXr4m0vLLXw6gu5bBq4vKcHBVed3M4JyXJ/m3/ZL1
	RJQWXRwPv804loyOYsUp8TZhCzMJekPDpma8h5E4iKllUAnY1NLrFDn
X-Received: by 2002:a05:6a00:2301:b0:886:95df:c50c with SMTP id d2e1a72fcca58-887fe5c8dddmr1176734b3a.26.1790841121413;
        Thu, 01 Oct 2026 00:52:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm666843b3a.60.2026.10.01.00.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:52:00 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v11 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Thu,  1 Oct 2026 15:51:01 +0800
Message-Id: <20261001075101.489660-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001075101.489660-1-zychennvt@gmail.com>
References: <20261001075101.489660-1-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..488567f830a6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: audio-codec@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a>;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1

