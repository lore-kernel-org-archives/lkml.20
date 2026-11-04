Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812690;
	b=SGmD81fxZc1GCW1qrtwNOzuElMQRHjmXgVoiLdQmwnLcIkf6SrGaTJQzmmRGL6lw69+S
	 2wPy1IqJ6MlsAUJWWPAs0STWh38fyE33154nLFbEcCJVJemv4MdMJoFdqdWDPKZIKHzs4
	 sVWEHWyggLggXW1JqgXj+5F/qdTYy+KM1im4h2zP2d1pONolJd29PhGT6rHRE/l62jUgV
	 qxgOIWytwejomsqc+/g46x5mtGyEhKEd1hZzYFfzjHz3wbIPJa+QdZVpT32pXK6S8fmVD
	 g7UUbkBLqO//elTs2vMgzysQFP6JOd/U7jOW46UJCY/OxhkYoIQrISI3dHA/uik2XGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
	b=v8KS/FButZgjg7/998zFSeQSlQtzcu7OpVKlezTg5JFTcpHGYstx4ndFS/5w0PwPSjKZ
	 jzjDp9IfA96efJelua6xv1wBu/hHo8jbDKGpJx5I9l1gCr48oRLOGQwrs9pq9fXX781LT
	 jT9SiLIbVwbUy5PWFIvOdS9v+Mt9vFINB2SCmfIIjgdX1WWChN92bqvwvwD6r7grX6cjM
	 QamMnB/Yk1Fd8imhsFXAVC0AktaGG8W1R+n19/5N1t2Koy9QPba0GhApeXVP8q+D+PQmz
	 GqrljVdmIGA4+UCjziFa9+OwRBy9s3s/Kk/k/LzUE+b4FcU+BPSu6oks2JrTJpYHIBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A71cIeR3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED71606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A71cIeR3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8656485e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793812687; x=1794417487; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=A71cIeR3AARNC1XBZ/bBp1ZicrZksc7yqu6Ryaj/NLf79YbXXoFX7Z9JC6B8Oop1YG
         cuzMQtJqj2z70GJnOB0NmhqzMYIpHSFuO93N4FXB5WTUsfK45VNB10QGVTm++r2D5X9G
         E0XhphC1qgdaQtvfFq883+BWD+jWIE0Jqq1CWKDeGS7TVXDqU2yref+D2hsuE1W4koTi
         yYuoQD+VgVk0He7b/dMRDhA9BQJQ5fcxAmGooiV/YefeufX5JvF70sGjpI+QKIKlmD/x
         LzY9g9iPw1dqD7qe325U6QVeTcnp+JkzbuPtYoHozLZKi3VVQIC8PfUZGMtQZg7Rsfgo
         Bl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812687; x=1794417487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8/NfmLQ3EYgwoCetf8WIbYR9sd0SW9xVRHDNR83SE2k=;
        b=eUvfgwKf89MrmfHslxPYX5uK7lVVmIIWCIyp7z30Rc9gvT/eu2j3zN+36OwvuRo87M
         CA6LrYE96w98bn0PqjTxUjVqjdNmyyidJ2ODKw2j0xEV91ngMtTpMZ9iZoc9qrn4BRU+
         RQYkdGaB2vBDSf++Y0rPAxkhhChfjI7Pco6BDwySaD6m9ROh45lPdwdwUriEs/f0h1BG
         uHfv6mDR7b+6A4C2VEAvA7tJWjPusD+FcLdrmXP5LI+p34b76gU+/OprreaxDpTHsI9M
         ZBcXOemWZV9MMEHbmocgj97A0WMOTtdGTmA2yQf/wRULlSGQUXFZm/uI4pp+YqOOJiBk
         fh6g==
X-Forwarded-Encrypted: i=1; AKwUvBxpYXGkN3qV7KVAEztNa0ods54iks1sABIlnkqkTVzGDbiZHLdcPmVgZEIJd9u3RedHmeUr3m+tMr08BhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wjUAdCQvt4FrWz3BZnkZapRZTNA0w22b2+SIbUTNdix0oPnF9
	kLU/qjN0paflsY++5DCvOZalWaARlMCEXujkuiBqlrzVYGHCgsYpY2JRdz373BdM25E=
X-Gm-Gg: AYBFou3sLCg0dls/cA7WR3t9+Z11HUNGnPqoOz63cIrV3KqehP9A5UMEHBjOJhiISHQ
	y8kBI5UZZeX8L3lD5mNhdch0DA6+FTgOiWQ1JjZ5yl3NpveVBfqYw4/46DK4s3E3JpYD85/8Bfi
	P9bcPVN+ncymVStf1YWQo7F0alLB5PzM1R2i81+eP+gL2uo9oChFbnydSrSsieQBI162DGG9tC2
	kAKJlPagZSqgY/r+8wsBAOaFTjpTGrK8wZLpDwZjd+ylK3fevH12xuRSYA1Ty4ZSatp3XGLTrAF
	VXNBGGDkDYu4tm6Ao0JHdA7bSH5yCRQfq7cnzh0wWPcbqm6FyVl6F+gaI7mIacP3fB8ayFd+/Po
	+S2bfUEM5UX2bJKEW5M8vqJAjRkWt6VpEnmczjr6i5uV4ids4ZfjPWxBh8/XJkHawj1I9Y9qWQL
	P9vubaqcRtwSUu5F2iPNx5o5LmEvMiz2J0T3X+lmP+tRB8PB4uIpPSOqaBwv8Wg5Wci1SV4bbZ6
	47HdmEM+8RxvQWGp+1CRMTxm0vKuGCONZEVca2gownLG2flvEpRrGHqoWjYMtaeb85VYFjz9/ge
	v3hSN2VEY114zMIGOV4knWci0wSicogCmsaMYEDIB0vZ3Df9A3BegA7lOR+mkoy9vAnYvkITgWR
	6CenCTwSm/g==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr373130175e9.29.1793812687472;
        Wed, 04 Nov 2026 09:18:07 -0800 (PST)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm99030535e9.5.2026.11.04.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:18:06 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 04 Nov 2026 17:17:58 +0000
Subject: [PATCH v9] arm64: dts: exynos: gs101: Add thermal management unit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-acpm-tmu-dts-v9-1-e5c53cd8b440@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMVo62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3cTkglzdktxS3ZSSYt201OREi9SkFAtTwxQloJaCotS0zAqwcdG
 xtbUAfAtwa14AAAA=
X-Change-ID: 20261104-acpm-tmu-dts-feca8ebd851d
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793812686; l=8231;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FzMgyf0GkXAyHz8KN3lxfqbJvyM58XZDMZmsVFVF56M=;
 b=VcLAybzUpRdt0QacvThY4kiJAnifS9EwqcYep0QB5ESA/2J7Rlxdlz45MZVYRS2cA2JubWltF
 cvCADLbjES+ChWqPWNh7RaCINiQSKBd1jYJmS8Hh2Qrrd2hE2vlSM92
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the TMU node and thermal zones for the little, mid and big CPU
clusters, and make the CPUs cooling devices.

Trips are ordered by temperature rather than by name, as the
power_allocator governor relies on the order of the passive trips.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Hi,

Add the device tree description of the Thermal Management Unit (TMU)
on the Google GS101 SoC.

The GS101 TMU bindings and driver have been merged in v7.4-rc1 through
the thermal tree. This patch is split off from v8 [1].

Changes since v8 [1]:
- dts: set polling-delay-passive to 250ms so thermal governors (step_wise,
  power_allocator) periodically evaluate and adjust CPU cooling states while a
  passive trip point is violated, place generic #thermal-sensor-cells before
  samsung,acpm-ipc (André), fix tab indentation in cpucl1-thermal
  cooling-maps, and use GPL-2.0-only SPDX identifier.
- dts: order thermal zones by name and place cooling-maps before trips to
  follow the DTS coding style, and keep trip points ordered by temperature
  as power_allocator selects its switch-on and maximum trips by passive
  trip order.
- defconfig: drop the patch. CONFIG_EXYNOS_ACPM_THERMAL defaults to
  ARCH_EXYNOS and is already built as a module in the arm64 defconfig
  via CONFIG_EXYNOS_ACPM_PROTOCOL=m, so savedefconfig removes the line.

[1] https://lore.kernel.org/linux-samsung-soc/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org/

Thanks,
ta
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 136 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  18 +++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 000000000000..5ca8360ee97e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google GS101 TMU configurations device tree source
+ *
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpucl0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			cooling-maps {
+				map0 {
+					trip = <&little_mitigate>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				little_switch_on: little-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				little_mitigate: little-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_hot: little-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				little_critical: little-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			cooling-maps {
+				map0 {
+					trip = <&mid_mitigate>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				mid_switch_on: mid-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				mid_mitigate: mid-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mid_critical: mid-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpucl2-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			cooling-maps {
+				map0 {
+					trip = <&big_mitigate>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				big_switch_on: big-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				big_mitigate: big-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_hot: big-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				big_critical: big-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index b218ff50d228..395e4716f8fd 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -91,6 +91,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -103,6 +104,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -115,6 +117,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -127,6 +130,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -139,6 +143,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -151,6 +156,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -163,6 +169,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -175,6 +182,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -646,6 +654,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top: thermal-sensor@100a0000 {
+			compatible = "google,gs101-tmu-top";
+			reg = <0x100a0000 0x800>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+			#thermal-sensor-cells = <1>;
+			samsung,acpm-ipc = <&acpm_ipc>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1937,3 +1954,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

---
base-commit: 2c222a46655e0191e70ca92258ad3b3ead32787c
change-id: 20261104-acpm-tmu-dts-feca8ebd851d

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

