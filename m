Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC438361975
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187578; cv=none; b=WM0zTXtX0hdYYlTE8NWsweJni1UGWZ2IcQ1GYwvxKRqgua0NAxQjKLbGqHIgH2DuhESbHMm+LZwI8pA3lcyKkqkvbNWRPpbAC9BNfTWbcfXQ+/dgh0A/DkWpMZctZ0usJY9IvdODVsSauu0KhZGGjPOVQqCwxBWOIcubj/wKa5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187578; c=relaxed/simple;
	bh=WFjPHdh767TYAqxnbwvqJA2jUU4RF6BRsluNltVcpcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4H/0MLbT0JHaA/39rD8iDz5GyVwcXcr4HBiThZ+rW2qzJEl3RKM2uyc8De9/SpFEtpCaTPHOamUT+23Gvuv3Q40dwp4vNoDt1OpkUfccrD7seH+GFde0P/UVcAr/Yk6IHTSXwLnxQgpLxP5cOHUif5BVW35f29525axN+63JKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLAGjv79; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLAGjv79"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-396affa9420so562294a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187576; x=1788792376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=SLAGjv79wvp0MRRORXuvbSRYIPsnbFXeAAZkOJmMr35JckBifULsDYN+5bd7Ull+my
         YGwczbxUjlJBXSBQrBmTGmrMNhlte7BQh4gRBjwHWp5cacqfIYN2LL4ckS79YwemRODd
         y+k7jbuxnlulI85bjpDDQwHskq55MfI6RrDqsnmepsLjr6ai3t1ZXUbOgmFOc0yDFhYY
         td/M1OiK/J6WI25iYpZczUivDybgqFQ0EGQM5HQzMfFLrzo9aopcvZvAAp4iUKGmZu/m
         pomLmZyNNJESRnVfmZN9TDPGmHwCoXN97OBb4RBDJhateoCpooEp0JAhukSmxthN+gIw
         kBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187576; x=1788792376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=HrDb194d7QingGK55Azs2Pl/LHOCaj6kEoxdQrw36WLWDjVwh+wlh1xxE4HAABFlRa
         Kp7A5kqXvZJr+BC8KpRpEnMiGu3+EH0mFFANICdDNhL7LIZFvqmx4or/IgBBAe2kDKZw
         yH4519KL25UERFJUP5EgLnZNz8xhsgbbEkuMCqX8B/a5FvzqmOrPA6uVHRxhNN3DvC6W
         Q3b+OYBPob85+bMRIx7RMBiWt9tcFW/OIeba9WNtVAm3qEWlgP7Q5qbFWMEmEcgTJ1LD
         mHsqtckBeEViRzhgpPsMZR+rSeA4nE3g839+kBXHQJBs7C7Xd0z98739YxOxFRzQbCnN
         MMYg==
X-Forwarded-Encrypted: i=1; AKwUvBwO1R1rDWn3ozHY9+3d6ZbyKBlYo7WnbDwfRO/k5Y6gpIznkObtTYb3XioSxLQyUhoa2dgaYTNpI9/dqU0=@vger.kernel.org
X-Gm-Message-State: AFuF++mjdlh3KAy0l/IOoFQ45/oG4PHFlOrrI29JXpD9KRHuklCDD2RX
	KTdhUFq4LPug9YJX95G0W1dIbEtobeT3yN+5SxABeLQ+lZNfz/8z7SH/
X-Gm-Gg: AYBFou2Uyc3O9jpGM1hpvxBXMcJIdGK/GCDvSxbj6GZ9EMwnx5y82NNTmLFPaYqubt6
	byy891h3fJPnP1oFLdcwhxMle1kogXyW5Zawwsxl1uA/CNdKv5dOkD0e5Lv3dLukIt9lq640z21
	QbnJsZ6AacQDf+/zAYyPqBhfknoXAImKMbI3JuOOD6spv1jKafYkVMx0Jn3lXL5D6DFfyn0ZYgu
	YCg94gea3HX54QjsNoX6GqyG4Zv+iG2uhnFlF9//zoJ4SWEvgEYHG5nJm41Gto80ZtyfnaQjmva
	jWW5qm+iiWuY840O0GwzhrU0Phx3qLK9yNimaGcu4Grwg3xywVIeggPQLlNTuK4xGOkUnhYjk+e
	RqjuQ05TySIx3KPZsleQ9FiqmzBGW3gvHy37TWZ2j58q7oYEInvlTVYhoAj81Y1dH3pm12JvF08
	Qyxjg7EDX1jRqhKSb7YFKuE4LqKbzn3cGkMujwWkS/AyKTOxxwlLk9INvbSKQET/OkER3fVE4=
X-Received: by 2002:a17:90b:17cd:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-398bab2710cmr11977556a91.2.1788187575913;
        Mon, 31 Aug 2026 07:46:15 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 31 Aug 2026 20:15:34 +0530
Subject: [PATCH v3 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-keystone-devctrl-v3-1-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
In-Reply-To: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=6209;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WFjPHdh767TYAqxnbwvqJA2jUU4RF6BRsluNltVcpcI=;
 b=EDhmBQAGk3n3xwBV3ty5tVe4aEqWdWKxnk0TbK9Rua1kU1Y+co788gVzpzKP1LcDxN8UW30ii
 bPmqpi/zmobAKjOJUThukmRkZfBryaFPeKSjh0ts2/ekhPWlReapWP6
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Align TI Keystone device state control child node names with standard
naming conventions.
- Change keystone_irq to interrupt-controller
- Change keystone_dsp_gpio to gpio

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi  |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi  |  4 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi | 16 ++++++++--------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi  |  8 ++++----
 arch/arm/boot/dts/ti/keystone/keystone.dtsi      |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
index 662aa33cba11..083c94b62fc7 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
@@ -110,7 +110,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..11b27663503a 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -121,7 +121,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x10>;
 				interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
@@ -130,7 +130,7 @@ kirq0: keystone_irq@2a0 {
 				ti,syscon-dev = <&devctrl 0x2a0>;
 			};
 
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
index 4fdf4b30384f..b7a9fbd6d59d 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
@@ -88,7 +88,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -96,7 +96,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -104,7 +104,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -112,7 +112,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
@@ -120,7 +120,7 @@ dspgpio3: keystone_dsp_gpio@24c {
 				gpio,syscon-dev = <&devctrl 0x24c>;
 			};
 
-			dspgpio4: keystone_dsp_gpio@250 {
+			dspgpio4: gpio@250 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x250 0x4>;
 				gpio-controller;
@@ -128,7 +128,7 @@ dspgpio4: keystone_dsp_gpio@250 {
 				gpio,syscon-dev = <&devctrl 0x250>;
 			};
 
-			dspgpio5: keystone_dsp_gpio@254 {
+			dspgpio5: gpio@254 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x254 0x4>;
 				gpio-controller;
@@ -136,7 +136,7 @@ dspgpio5: keystone_dsp_gpio@254 {
 				gpio,syscon-dev = <&devctrl 0x254>;
 			};
 
-			dspgpio6: keystone_dsp_gpio@258 {
+			dspgpio6: gpio@258 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x258 0x4>;
 				gpio-controller;
@@ -144,7 +144,7 @@ dspgpio6: keystone_dsp_gpio@258 {
 				gpio,syscon-dev = <&devctrl 0x258>;
 			};
 
-			dspgpio7: keystone_dsp_gpio@25c {
+			dspgpio7: gpio@25c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x25c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..4678454c0eb3 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -290,7 +290,7 @@ osr: sram@70000000 {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -298,7 +298,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -306,7 +306,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -314,7 +314,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..20596fa446b9 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -93,7 +93,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x4>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;

-- 
2.55.0

