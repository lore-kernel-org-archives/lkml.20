Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90863C2774
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128759; cv=none; b=ugxo7SIOq6RXW6x+TEYzWCfGYzlSCy1yveUa+eou6LdWChalcqVtgnbkaIcFdH1BRLb3G6JLqzw0FxcuNQFjKXF6K9FpceZid+COKnLL9AKtmWfbo+Q3zZAmA8cl5SCG5GZvt7VJ1H6I2Z5WFeqE+VZCUz+7ONyzgovQiFBiTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128759; c=relaxed/simple;
	bh=4rVQXffy4qy4VLMLrAAPlJmYPJn+K2yeUHCy6+V34G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYtEZo9mfOvMc4gMxbFu9ghpQTUgTrLKHbJk7gQt2v9WWR4A55oKZZrfPMA9NuyiXgFAuAK26nSRv84Pqq0NFsKYtyLOUOS+T0jcRZfwoelyaQOS/iXTo3zINm9ZOZf3CxeQo/EPMDMB+wX7D7i7da6wrG7QCOhyTWI7h4DXT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEI7w2gN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEI7w2gN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5800385e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128746; x=1791733546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+PnIRHhhGSsiIqPCSETbWlKVzVd3kBCg/pSqcr87rU=;
        b=GEI7w2gNYTHBtudcZtqETuaKkDcNTnW4GathQ8tOTcPbbFRyfMWuw3BXju5f3ekrDp
         9ZF7ElZm+R+Dd29s/uNbCreInlJGbp2d+cgdqp2SLhzhdp1cJqIdvkG+NtdGdSX7dSIS
         8+XuMWDxlyhqqwKLpLB1R552BSxP+RnTfczv5icpPZSEgYGWzEAuTOFO7OS6OeYQKlqP
         +yF/oVUGopuyAFdXPzOsTYllgjJyzzymKEz7yuROPzHdMh4AA+v3JaJLmVg/CKmvsRXv
         07SYzgkAFImJoHIUFBUX2D/tbgNgytfuzyxL/P8Cksauc0eT5fZo/vO0pjD/clcMU9Bz
         X81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128746; x=1791733546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+PnIRHhhGSsiIqPCSETbWlKVzVd3kBCg/pSqcr87rU=;
        b=roHNX5cCR1AB6u6IYerEtih+gvozXY/kLvwQ9hLwxLanT81tx2iuQqSp9JbzThi51d
         Qsx6S2rC0iFQ9lv5PkuyL/iW+5UHq8JVu2S1AKPYMW+NWtKxIh4CVpQB8DhUgAuFLwxL
         3kJJcLfXYg2GcJbwSxRbIAx10BSiKU0wWMpw0X+UFYs4d26DY2wPmfBGZZ3Gp8DAFI+F
         k2NouimB+Itk3PJTskX9f7nVHe66BMF2UMDz90jkpOALBdB8LVZznrzkTlw6cSK+rPsp
         h5Sd5o9KL8Qv/bhnVmofACxoFE2Oku9Hh3sKI0mSX2mu0hMeXgzYQ/iNYAt1qY5Js3tG
         YOWw==
X-Forwarded-Encrypted: i=1; AKwUvBxtSNcIWHL5KwjJYu/07LTo4I2TwCcvojP+BcEsjf0qapVkAJbtIOYStOU1DtySf+bnyg1WmZPrRKPliYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nOPVK/51b7gmYrfkT2y41E5g27z+vPP9b/ydrVCW4pJUw9HYvF
	28JCHvuaQeTV5MivxU6lvgx0gVmexZ9t0EYPIJnjNEGFuwtIZ/S/GsBOgMdBZw==
X-Gm-Gg: AYBFou0ADtuVZgpsKjJBc3WJWIYi4uqAPVk79P5yL7XRBA1zlAIy52Zcswtk2hYPHV1
	nsn83+RERq86E/HssEop0nKnloxGZ4gKS332kN/66RI2eIq6CtDdU67vI0SLiy2jQ+F30yVb4oI
	1PfTxONAzmtTAcufmrXdH7aXzol6o1sn4GUvbkurNFXHNQW+g7pKaPegbc/pKID2l0rBr0Nd/To
	ljJRpje7050OlfIxjcpFbMdKiTccl3z8tXavTXczEbYus07d7s2X3lpB5Zov/0SBfvZe+qXUjNP
	uPCodOJF6ZZTbWR5MhNsfq0E+gDGpWfbx4A8Cfh56ghpdIPh5NAF0AXHFKOIwcahuBxGCm+ebvB
	1pP/yFhOZlVHhCL8ZXQwNUGDUJFDhofFNnn5+iKuqNHLZMRjciD2B4yjVQ7To3rfhBppIiUpofK
	QCl73+MA0LDojx4G9mhcw4uhEmI3aZLH2TVrUbGxQ1x3eRHusE/f6jrND2Fr8XV+4gq08txYzgf
	avezyh9UmFsB+KJwQI=
X-Received: by 2002:a05:600c:4e13:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a02754304fmr151529325e9.11.1791128745981;
        Sun, 04 Oct 2026 08:45:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] ARM: tegra: lg-x3: Add backlight LED controller node
Date: Sun,  4 Oct 2026 18:44:54 +0300
Message-ID: <20261004154456.145362-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for TI LM3533 LED controller used in this device for panel
backlight.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 24 ++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index f888987ce1340..3a5e66d869b1b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -155,6 +155,8 @@ panel@1 {
 				vdd-supply = <&vcc_3v0_lcd>;
 				vddio-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index bb20197bcdfff..0d56fd25ce178 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -179,6 +179,8 @@ panel@1 {
 				vcc-supply = <&vcc_3v0_lcd>;
 				iovcc-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 1f10f4bfb5f24..2dbef0185a0b8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1170,6 +1170,30 @@ rmi4-f11@11 {
 			};
 		};
 
+		led-controller@36 {
+			compatible = "ti,lm3533";
+			reg = <0x36>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			ti,boost-ovp-microvolt = <24000000>;
+			ti,boost-freq-hz = <500000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			backlight: backlight@0 {
+				compatible = "ti,lm3533-backlight";
+				reg = <0>;
+
+				led-max-microamp = <23400>;
+				led-sources = <0 1>;
+
+				ti,linear-mapping-mode;
+			};
+		};
+
 		max14526: muic@44 {
 			compatible = "maxim,max14526";
 			reg = <0x44>;
-- 
2.53.0

