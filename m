Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=bQqSQAGV1D0j0aFaeNaF/YOj3gQ0UwXWykryQBHBVg6gja54s9CrStn30KrAviEX1He7
	 xj3AFuzBKsAQYU856qJ8rbAWmJiIUrQWEplh5B9jLHHfWAlw3/OTcjFN4eNFF+rwapGGc
	 oc3KlePuoRr4w1pqUZ/7YIPH8a6hYa2lhXxJJG9uvUjgPo4IyfJKesV8rXOGkUPVLUFwX
	 z7zksUK1KfesdsTBP9WMHJqGt6PvdBz5ue2tnGutbZuPvBWYBLX1lXF3026vTKyDl9ldg
	 rsQ5UG+kbW3K2coY4vM36CGO8vEzw+PiX6GVDBa3Lcyl8+kOiiNFPBFEOlQfPmwIxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
	b=3fvkrAUId6AgP2tKmIwAgrcVl7uLnRAj4y15FtoKddlkT3Ryzol+/OTZ36shRJPJBSOL
	 DN5uAFFuoDDoAMXxBsO1A6UvhiQAon+xqRuw6a//IeTLFqXx2CviER6zmk624xKG1yEQc
	 u7oCJhoe5tJpwdtuu+9t95zfz8APhsw8oV8hns7kAY8eIcNbiSlfPdvjzNDFxchBbFpOz
	 jYxiTBPM/Hob7d3EdqFGgA5oNDmpU4Gl86Vo9IsdzSp9hFN7t/CVyRfiXwLuRkI3bshWo
	 R58ZVbhzq0Z7mmtKOMfznOebuqThQsPN3Fhb9PYvFQP8E27zEDLcu1nkuZ6Nlgc4NhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iLu/u/Oc";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094DF60A261F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 094DF60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLu/u/Oc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560355e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762715; x=1795367515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=iLu/u/Ocdy7uhlfbDWXL+IB3I0snvaovLpYg0pTcJm/H7IaRQaGPQlfsZvTkHjsJP+
         lVudbYO1rHvTY2zeJi/A6MLyFhOmlLfXcu0Guk5vVeVtCwgScZprwqbpxTlT9rYcdief
         bw0Vu4EqsTaSktrDyTOq0oIynr14snJ/z/1lfWkgncDcUIVf54rp+fLcWOOeuyMQmOaL
         hX+fB+ODF49UDWlRNm8o4JBumiXHSEXrozbdwbjQHnDMdgO/pbetdkwIzvJdqeFmqen1
         InjtYSd4kRof+leQY/F18TrIrC9Hrl7NaqJCVChrYKPOWLcDwwK1FuQj+8ZediI3LUfM
         DAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=Gnj3aGq4WVKIxzqw/QEbPubTkn7PCi+cMiDKmkSern3JsuM67SzL42EGc4KNdRywQI
         25FuI+H1+qdp85LToDgbxPFWjpDtlQOl9EWF3COXIyGH4YAbLLfrfpUwmXU7UdycvZFO
         T5+9hLmb2yq2fQ2TWF8t17TbdoqEB3Rjm/vMxx3v+CMGWvPIZhqXvhWOpBC2DGdw8DaB
         e4tFwn/TmeGbO1iwF/LWq6gz1GU49Ut2aNmfN5gupoHXxjr4xD5jBtlK+YAjjj537CSi
         KF7XUQIe8HvJ0jI+BfnZYQggnC166rHBxXW4EPZJqPbR9hwiuv00aAr0NiGuaiMAyJrM
         W9yg==
X-Forwarded-Encrypted: i=1; AL+hErFQJATktQQgheHOUVoLMAipeOYPYkrcMdNLGOJNIOwFkkP5w6hOjLdKQHQ64zDMhA4+bQLFvysK7wjkvgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gIfsdgn10YBJ0cXL1PE0uVQ998XlEkFIdcnxYjbQUKnLz5wBS
	rBoowlqbKYeMER4XZpN4HXfM8I/mxAMalO1DEwa7g9zzXpRifHtsO0FG
X-Gm-Gg: AYBFou2zozfag6tsO+0vUtsdZhApugE1kQwWu/Uswjn22DWbF7xn6nDQT/JQatUX2Y6
	O8IgUUr2rQQSQHbhD0MNCDsqEljWlea80/Fi2TVcEcMWZeWqdJv8J+nmVFyxD4SXr1bIE1DOgg6
	Pt36VIrgFE2qkiLrZQwHKFk1JOU1DijSd8qHHOZJYyZeiQ4w5SaEQTWezSWHHBr7oRVBzAiPoep
	hNC+oOJTJcFlJINnHwkyfVKBQ4MPLqb2sh+wdwu5m5MSDnNS0aqSriLV8fWEZurnGgignfq1/8A
	3XbAMlv/gqUsMEbJqoecK9dMW/yUry8sFisDCB6yNvNl+NJamjQyQahbCaOy4AXido78CmV4TQ1
	DBBTPtOQ3HO0to6MYmbkS13teawCbKQWO8S1PlUsWu7TTHRxKyoai+vSiHgIFXFS7VHt1kRJYaZ
	RIcoW4iH2JtjfrojWni/6+lajYp7M9wjIdoTzskGlm0s3GuipZFtB774jCyM7XLYxhoE01GjgT8
	LQgAo3GS2XGYS1j0ImKrmxRm0ehLD0WG3XbCcagdHoWJJEbwAtDmrp+L6VBgMgazxagQUuvIV10
	rHS3XjzrfYNaxoUx/PFEh+y2Ckkupg5rZ5K0oEgi81MnMMHgKlsjsoydha2gmr9y4bNtysbn8IF
	kUp25nH/l0vg/PfgyICVx6ZYiqA6JdS7GPGLDSV4JEMEUSk3OYJ0SZgoIiC5aKS1yNyWDznrW6b
	WC+PyHUgUvcYyd8NzKZjZZrBqtuERgt46JWqw9SBn3Ok2xKKY4FOXtIZk6a6Z/IuDYXxuA52idm
	gLaLYtiVxj4Lw==
X-Received: by 2002:a05:600c:8b38:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb55a7b45bmr192615255e9.10.1794762715336;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: tanix: Enable Ethernet
Date: Sun, 15 Nov 2026 18:11:48 +0100
Message-ID: <20261115171148.37784-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

The Tanix TX6 and TX6 mini have a 100 Mbit Ethernet port connected to
the PHY in the AC200 companion chip that is co-packaged with the H6.

Enable the PWM controller and the pwm-clock it drives as the AC200
reference clock, enable the I2C bus to the AC200, and describe the
AC200 Ethernet PHY package on the EMAC MDIO bus, so that the EMAC can
use it over RMII.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index f08077175549..d101001b6f70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -85,6 +86,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -105,6 +110,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -120,6 +133,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_vcc3v3>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -163,6 +199,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };
-- 
2.43.0

