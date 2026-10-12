Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912931352B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776407; cv=none; b=HDJMLA+UUhtRGBuqcMictlrHi1dvQTlvO+baMcOVtizp6JveYzmZV1ndEF4IE+UxxgKyyAtPNn/4Ze5dM+v4LoQyyVnLPDHBFFONSF4LrzEbwQCC7ETx3nMtToqQBTbCMPFBDK9iukf7GC5h4qxg4VDnNOEo+xL9LJyLxU2j95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776407; c=relaxed/simple;
	bh=/ZKEoaWpilfkxOPSBGuefTVaDVJKjuhHsn734+6tnCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRUkZIF7Drv5OyGaecjKzr7OrMHY4aYjelKwxq39swEh3pOxAaW1bAOPbXc658FmzYWRUQqUiW3sO4lIwOTB+jMmeoXq24obMuaCLoHpOt1FudENX5AkEu3VX3Aw44kWJHy36t5C41/K2jAAFc6oupVu2Zko7pUMAm1kUkHZAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=ed3uv2Ia; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="ed3uv2Ia"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc751eddf25so808271a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1791776405; x=1792381205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQmudqxHZgmYHMAF8++0CQtKWTMZopP9Oa5fgsHurz8=;
        b=ed3uv2IaRwS9rxnXfrAXKMrGSBS/hDtC5HHk6WoNbviRHeSm4RZ/Rz+bvuB785z6x7
         +sqikvW37PsmclmD5/lvC0XJXXMpVUvnORwZeEoWjMaBP+O+fWQTSEJ+HfMKObHTRPCK
         SDIIlpab5jIEeROoa7ouE0MR3lrCYD6hsRDWDVFiVxBbH8kBvk980mndadK+Hte6Q9Q3
         BwHhJY5SjpPQRRMeSLkSj0QU9W8VlF7/MEbNZ9IiS5yPeXQMqjfmAT7Shzu+y0L9Wcpk
         4PbRURyzMLs9mLB4BBgdABtSFrN2R43fxjkJLFDiKq73Fe093sdRlrh6asbx8bcarRHj
         dpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791776405; x=1792381205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQmudqxHZgmYHMAF8++0CQtKWTMZopP9Oa5fgsHurz8=;
        b=SOIlU2cZHqRcxYAYaECY3zmPY8id0lr9Kqqa9Y6AVkr2gQR70Seeq+VMKwaXTqO/j5
         FBmMBQOKZvxSYR5wVsv7dzFPWrM2RwmBlHuFlnpEW5xOr+gsKjy4ZCSYc4XVt0UOxiZJ
         AhUWaCkW42de4sjgzNHKpdDYbXeoOt995wX8UTl5Xej2ae/8J3zDIq6FcuREBG0toiHl
         8/d35HXb7fnSmyIMDSaCDykrWO64TK9S1JJgVDMM4/WesNlN6uMwzg3eeCuvoUuT2jFG
         Ob8j1VszlLqScEwML4rUlCc/BDkGiL26jCtMfZVgdPjMfELpSFfTGChZ2jrA2JnDtoy5
         BJQg==
X-Gm-Message-State: AFq9FYK3UfXOxk9qV9prPz5zkN7pOPSMiyUJeqNwBwSajl0uhowQlLTo
	g4psd3hYKgPP7mZ0SwUCUsn4/QEV+BbZf68Pb1Dr/zgCu2B8CgMKfsFRBypwiy6Ha5eYdDE70mw
	xXtzVxbzf8qFtMA7gd0YCN7lOFfuofEcC7u+dRpNU7LfM
X-Gm-Gg: AYBFou11OsCmFb3A1IRws38XCVIErxUMScQBepl2RfZ7naxUhfwzVxs8e86sG+5FPil
	EB1ORv9BxR4d4p/GdjL5BScSZN33xTZ+p5djl99cAelOeW10qz1b+BM9+xrCatPecNB6JV3lTSC
	g/KmR9tRHvotipjWOFTZnoExMf8R+jDgZn0BHUxBttkMRTKVGmHFi4qdcOjsKq54Kyk+TriqZUl
	Mh5u4ukr5sqU68f9GEwbbotRHw13fpe7gmIfw/jW4FD0dzMov7jRr9Tee4mxWX5ZEnemQ93BbMD
	y1XOUamUXb7RiTXJMNDI1axdgoRwhc9osDgvovAbTC4HmRQ7D46zU1Dft8wjmqWxUNxPJzO/Jn1
	WIQ93GxjvXINKI9b6xieY0FM=
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr7994493a91.38.1791776405106;
        Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3abdd5d09d2sm1506297a91.8.2026.10.11.20.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:40:05 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: rockchip: Fix adc-keys wiring for Orange Pi 5 family
Date: Sun, 11 Oct 2026 22:39:29 -0500
Message-ID: <20261012033929.2317231-1-dennis@ausil.us>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When working on u-boot for the Orange Pi 5 Pro it was called out that
the Pro does not have a recovery button and was missing the definition
for the maskrom button.

The shared rk3588s-orangepi-5.dtsi describes a "Recovery" adc-keys
button on SARADC channel 1. This is correct for the Orange Pi 5 and
5B, but the Orange Pi 5 Pro schematic shows channel 1 is pulled up
with no button ever wired to it, so the key can never be pressed.
Each board's schematic also shows SARADC channel 0 is connected to
a real, populated Maskrom button, but no board described it.

Fix this by moving the common hardware (Maskrom on channel 0) into
the shared base used by all three boards, and keeping the
board-specific hardware (Recovery on channel 1) only in the dtsi
shared by the Orange Pi 5 and 5B, which the Pro does not include:

 - rk3588s-orangepi-5.dtsi (OPi5, OPi5B, OPi5 Pro): adc-keys-0,
   button-maskrom on &saradc 0.
 - rk3588s-orangepi-5-5b.dtsi (OPi5, OPi5B only): adc-keys-1,
   button-recovery on &saradc 1.

Verified against the Orange Pi 5, 5B and 5 Pro v1.2 schematics:
the Maskrom button is wired identically on all three (button -> 22R
-> SARADC_IN0_BOOT, AW15, pulled up to VCCA_1V8_S0), while the
Recovery button only exists as a populated pull-up with no button
attached on the Pro (the board's "RESET"-silkscreened pushbutton
is wired to PMIC_RESET_L, not to the SARADC).

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi  | 15 +++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi     | 12 ++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06cfe..d73f671b8f5f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -4,10 +4,25 @@
  * but not the Orange Pi 5 Pro.
  */
 
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588s-orangepi-5.dtsi"
 
 / {
+	adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <1800>;
+		};
+	};
+
 	aliases {
 		ethernet0 = &gmac1;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index fd0efa8d1bfb..709efa709b7a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -14,17 +14,17 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
-	adc-keys {
+	adc-keys-0 {
 		compatible = "adc-keys";
-		io-channels = <&saradc 1>;
+		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
 		keyup-threshold-microvolt = <1800000>;
 		poll-interval = <100>;
 
-		button-recovery {
-			label = "Recovery";
-			linux,code = <KEY_VENDOR>;
-			press-threshold-microvolt = <1800>;
+		button-maskrom {
+			label = "Mask Rom";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <2000>;
 		};
 	};
 
-- 
2.56.0

