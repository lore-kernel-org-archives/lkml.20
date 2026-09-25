Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41841754
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323389; cv=none; b=tIG1QuZWVB1Mli99A8pzC+x4LxM5MiQ/MLfAQf4RHn1kd3NiDAMaZIhwTGvWKrylb3lHpmWuOIyZZcqXX3+rBsPNalZ4XpLn34LnBjAerB9zZ/V4GmTa+IJgYcn6DVCixHP8P1P66byI/hhTxLmtIJOzYK2X+wOFReqaWOCm8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323389; c=relaxed/simple;
	bh=g6JdTsSRR9F/kd9vFTjm8aBON937+a9RhH+W6bL44Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZ/9au2sUvJegf8Ykv4mdCvQIeKfMS+FnHliMuoMQk+IWH/oVYFw1KtIgtEvnZEoF4OaxAJzEIm9OgpT9Xgf+PTj5Zc48CzsF0LgvQrOHs732FIbp4gQLgh3ZytDfCkwbo/fA69A8c8rh5iyOQQ4oL5/DFJJ36njIv9ZREmWQqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=pY0BEZZi; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="pY0BEZZi"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so79162766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323385; x=1790928185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=pY0BEZZiLMl+sONhTFyM396kNLS40oLdIfZ14xZMX8jmgJnUpJPM5rVlV2nRFB0wA+
         sAscSExjGw8vD/2UiXuhEsLy96bxmn0z79wKY+HiDhV0U3fSDG+M/EW+ixRQw5Zh9Mp2
         uhSUkvDPHvMNvJ+BrWjvIwAcygDAuF4KwpHMwc9d7L5pZTSHzvPN4ql08WIrn5YkiOA+
         eSlWwYtnuggm2XL9LTXO5kr/QZe8QRXOTEZPTt7m5lh6SBalOrdSpb/wUMRgI+LSzKzq
         p1qEoX4YmXaLbNBY82A/iGxxbScl7NcchpkI0p6oaWvvHbojijbzukZxREyORL1bkkMs
         TOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323385; x=1790928185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpzCtQ/x5w6zYJCz6BFrhS+ES9WYNEAKtYj1bG27RGA=;
        b=yEJkn7heJhyx61WiizwoSTeXbowCGdYrQTYsoByLw3yJTfb61qceDmex/ciEnb6W/Q
         Ymf9g+fQ2kumXr34OhOiD6DenXvNFa02KyI4Zz6zvUQuXHU+ZW46sFE2NYlWg/nn9Ddf
         +tIK3EsqG4GEXz9FFTBR0Y00xSk0oAkdzdCAGxck4tMeg3FznnCjroFz/MK37DuCML3d
         jeLcVwe15TpPbYbH/A707vT48QTX1x61EPNaKm0f0uYWCwAAOIrF5dFgB6GbKzgjIOBK
         in+5A5Rre6Wv5OUOyq37rzoZhTZfKcYveXXhRHq5h72IOAh7946De2rZdIe7wGrlfCG6
         srUA==
X-Forwarded-Encrypted: i=1; AKwUvBxI8fHIzTxbcIX9AfVVN9FCNH64Z+EdeSZUM1W5gMewMtT0PsXvUIAiU5Fkt7qCUJq8WPI7beMD0ukfAHM=@vger.kernel.org
X-Gm-Message-State: AFuF++mB/SWK8zMAnDM9CWuEttsKp8AjtCPzuUT332Ynhi5rdQg8OYmc
	VQpbAcljVu04Q5EhEicPhyX5JZdi4xr5hnGD6a+XpJwrlrCQayDdyHyceUlpEgJ7NHk=
X-Gm-Gg: AYBFou2IrCtpaIxGmzBQCtTKshPWi5Yxe+RkmZWsu3znKZufMa2EduwsSy1atq4Y0f+
	aMJxZpezU/AgcgKewYf17eivTGDRbNIYxXzZuM31PLpAATa7WQTL8aTzTg++MpHyB30e28FAGof
	xQjnisjdfYZvbatAGZZaRnTnY6KWz293Mkp4LBBjmkPdtj+2SCCGwS17fvy+JgLuWl0VWj9bpqL
	fR+m8XIH0PF0TtPcucWIzKEgUHn6CIcVGghVLAw56XL8lmqat6cG2zotj1GO23473Zzk7XHBL94
	PDnmiN2DDhD/Yil2aIp2ZUG75dYOL4tAJbRZklyFWwdJm7ibfJQRUBiNLkJBnly+5CNLqell39p
	YdEEDDPQgqs7kt8EHjAqheku48n9YYdZDyQQ1u8/B/lKh8H2gD0ulRgR5qA1BXndp0os2CEDDgm
	SAr2dCNOIw6t8rEbNIsx52UuLhVZDJK3A+1n6MVBpjY7On0tMS1TLqpU1alKhvdIJgMRj/u/5qb
	vubYjVIIIu/BKXHzGK8DReF/Sp9Q8hugbSioaWAg22Br8k=
X-Received: by 2002:a17:907:97cd:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c2ac241f82emr459322566b.8.1790323384750;
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:04 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Fri, 25 Sep 2026 10:02:57 +0200
Message-ID: <20260925080258.46489-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROCK 3B has a 2-pin fan header powered from vcc5v0_sys and
switched by a MOSFET driven from PWM8 (pwm8m0 pins). Enable the PWM
controller, describe the fan as a pwm-fan cooling device and add
active trip points to the CPU thermal zone:

 - 50 C: fan at 25%
 - 60 C: fan at 50-75%
 - 70 C: fan at 100%

each with 5 C hysteresis. The existing passive and critical trip
points are left unchanged.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..b9f09087b176 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -24,6 +24,14 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	fan: fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 64 128 192 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm8 0 10000 0>;
+		#cooling-cells = <2>;
+	};
+
 	hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -186,6 +194,45 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_fan0: cpu-fan0 {
+			hysteresis = <5000>;
+			temperature = <50000>;
+			type = "active";
+		};
+
+		cpu_fan1: cpu-fan1 {
+			hysteresis = <5000>;
+			temperature = <60000>;
+			type = "active";
+		};
+
+		cpu_fan2: cpu-fan2 {
+			hysteresis = <5000>;
+			temperature = <70000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map1 {
+			trip = <&cpu_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map2 {
+			trip = <&cpu_fan1>;
+			cooling-device = <&fan 2 3>;
+		};
+
+		map3 {
+			trip = <&cpu_fan2>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
@@ -670,6 +717,10 @@ &pmu_io_domains {
 	status = "okay";
 };
 
+&pwm8 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8>;
 	status = "okay";
-- 
2.43.0

