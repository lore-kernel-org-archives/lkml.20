Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767D401A18
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234104; cv=none; b=YdSy4LvKgqbzBrx0yuTXOmFAgilZB/HSyvldqMv6PTRxaAGeudypfstuMx3O47UTW95/4qlKgHFb6EXCfydQGrMGPpOpQJmo9NguY+zz4zz1zZyEbTFHXXwGFwAxGvB7A4kDDpJVRlWPMIs90wU/CwJ+Tl8zuA66/3mrgysWrsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234104; c=relaxed/simple;
	bh=6eVxT8+9oSfFOe4kUJFBQgPhIl74kB3Vc0rCC/OPSNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDyB3nC9N2O7JF73JwAAVorO6QLP9Afi7mhoIAbhjtK9YShxx/M8edHTxbFicPg7oVOJouE4tO51AmuTs3/qVUp9NiIeC/iFHwZAurPD4r8VZ6u9Qp2n6ridAMR2qFFg3FZDCC58CIJiSt2e+9kEU002PhXYmSazuwEV574wSik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=wKMJHl2g; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="wKMJHl2g"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so2351121a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234095; x=1790838895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=wKMJHl2g2/1dcja9ttGPpkH6fKaG4eJ3lz5zv3tSxNpNxYHods6NvoUSrko+toPkAR
         1q7aVdme2uBkQEpWikmxx5ZdJAx+QHT+ndzLWh0Wc07ZezT5BVM+WoGgSJ3CZxS8xlzl
         zK1jdkXpGYrNi6afLKgkB+C6n5lvECkUQOD9iqwo6TBysxQ2AYbMgmlR8rZASaBlZoE8
         HpK4W3gCioqIUgzoa8RHhgMAvRvAF9wXnvhcI4ywxwEWaXFfROXGQwiKAp6Eau6vHBh6
         GA9NX5bj2Sq+Qx8xbvjJ7iiQ1POqj82sI9j2CH5kiXKEKP/W4rKI3R7OxUF6k23AlI0S
         63/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234095; x=1790838895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrjq9fQeRRT3Dkn6ja90PvKLpuXI2Gg2RkQogJKUx6w=;
        b=KwLQO7W5W+2CTl4J/QCG6np6zejwjqdzZfcviRyAGlZZ0uAPGnUoqZGplO+jmUjLJF
         PgrUg7uu/MK7R0mWxtClK/tV3F0FcWwcZ7heIwnE5JYyxQ7eFWkBYeyUFmLzeqsM5vOn
         EWUkjtusLhmOf+nKIcF6K8Yjx+Lr3e5A5OpilbTMJRJJ7dHdaGaPwBpnbNODEbc3r0bc
         PIrvhD+lRqoASXjGDBgiJ7n34oWgrmniWbj8Ndby7IFMOkRcvPo8l2Hor1I64ifaKEw0
         WEfkEi3SZmaxETwjIA6lgCxiy2UaGXijiBeWstz1VEw2IlNsMG6ug1PvZea1OEzfOidd
         JTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXaE/rQmGm3i8cD+7S+WbXQM2UMxzgnd4SWonIiv83rjyKdrAqblfWgwBqE25fWTeR4yA9vzWzbQ9YvWw=@vger.kernel.org
X-Gm-Message-State: AFuF++nkyc5iBtWWuis/yEUdQ5sV+fbEnM3Y+6K5ParZC4K5KKF4sDid
	WQHFEi58ZhcQELbjGtMNMpZIcjLTgx0kJVrfWDD9IGh3POzMWKV8FlW4PzD2Suwjt1k=
X-Gm-Gg: AYBFou1bHLIyvh4zjCcm0wIKVwcV9OolwgscHq9BWABebcO58XFr6xj+UfL4l7rC0Zw
	KroTDbFc9t8m+TRzwyNDFFv2gYS4mhh0zfAlU+PwXPrJI9phzHRKBg7k5lw764W9wU/QxpxGTdq
	Eu+AwHFW1eG/p/0tWak+30ChVMMMqQ+Pq7GIcdYOVomAltbtgEO5I9JCYWRzZRdrhCqLRiWCvs7
	JDUnaG0FX43h1kZbV2v0bKbIzD0XHYrGwJl8Gu4cEAjA5MQGflYx9qxvDW3Pn5NMM4BzEvXpF02
	GzJH11TL9MfVFvH+cohAYZxK8kte3DKJUuKO8m5uwp36ntWnistAP/T3Yv9xYOYLY5kN1aT3tcE
	jJoZMgEoT42R2G/6UbF6BM/oJj/QJtB7dwA9uJB9x5rplj0wBx9829OtPV6Vi4RCHv1KkAeRoCZ
	1NcaCncRCvo676UxN+6xkBTkCDESBgjfy/mXY12KWms+nJf/1JFsHdIR1HNIeFun/9Wq69AVpCK
	h8PxzvzIBsU0y2SycvgRKabtW1L5x5wlUbsZjiGmij5CUo=
X-Received: by 2002:a05:6402:1599:b0:6aa:936f:5d2c with SMTP id 4fb4d7f45d1cf-6aacc83e324mr889306a12.23.1790234095400;
        Thu, 24 Sep 2026 00:14:55 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:54 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:45 +0200
Message-ID: <20260924071445.441822-4-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
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
index 908bb4425e81..815f67988ab7 100644
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
@@ -200,6 +208,45 @@ &cpu3 {
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
@@ -708,6 +755,10 @@ &pmu_io_domains {
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

