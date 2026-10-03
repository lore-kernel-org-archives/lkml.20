Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAAE4749CD;
	Sat,  3 Oct 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055877; cv=none; b=NHRN9QlrEH25YFi4Bj+trIE+JWQW7nSidZxcv4PprIuvcBB/MKF4NyYKbPo/tFbC7HGpdO+xMtBdyGeDDKFl1tF7U8Utq2GjdX/tB4CgPKjwpGDVKI+SoL+ZeK2EnwYtbC4pvFomwyC77LsYRRiR3ffukKSSYJ4rJFBie478OqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055877; c=relaxed/simple;
	bh=Y1HymriSjJHYvtlGQbT+spR9eQbb12krl0VgxPxDnzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uiwl9nm+HCGhIYZIqS2A4S+u4EF3y7drfLQHMeHpIoTQyHiibkbrsTwXD/mimnGk7JjCczcMVFHNeKnCSATHVGk6XS1cqR17CtBADOP+nM0kjM1Vy/wvbhEs8wEvFvYdLSWb9kSlXP8KNt9gSz9QuIpsLWiqaQuefbK0VoT02uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=SZMhAOmZ; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="SZMhAOmZ"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMFXPviZDx94hfYTmT11AyFko1MyhGDl/aQY6zDFtP8=;
	b=SZMhAOmZPgZUWrcbCjDAyaRdmBwiAPOptFw1NVngfHDxduQ8w2mCFhRQOOkTb+qhbcVNOc
	93C3mu4uUGc894MBoRKOTWEuF+d3wacS0sWvUu/EBLhdprCgyYrGSx4Uxe2muunZlkhWQZ
	rur9ohRmLPV2i0Yutaf6+QTROUs/gAUbKyMFnTmCBbWhkh0H7pBaA+Bh6Gbt6RwZ1EqpOa
	Y3ryXkb1p4Kc0PSynYdSPisTRdq3SOS5Nq0La7O2hDZzrJJITLFhAxHW5VhnuH8xoHjcOM
	KrzFwquYFkIxZb8vuTB6WbZt7rEimqKpqgmC3ebcr953vM2TZDgKzBDE2SFhtA==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add power allocator parameters to CPU zones
Date: Sat,  3 Oct 2026 21:31:07 +0200
Message-ID: <20261003193108.789939-3-michal@nozomi.space>
In-Reply-To: <20261003193108.789939-1-michal@nozomi.space>
References: <20261003193108.789939-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under sustained load the CPU temperature on MT8188 rises from the passive
trip to the 100 C critical trip within seconds, faster than the step-wise
governor lowers the CPU frequency one step per poll, so the system hits a
thermal shutdown instead of throttling.

Describe the CPU thermal zones the way the ChromeOS kernel describes the
MT8188 SoC zone for the power allocator governor:

- a 68 C passive switch-on trip before the existing control trip,
- a sustainable power of 1500 mW,
- both CPU clusters as cooling devices in every CPU zone, weighted 2345
  for the little and 1024 for the big cluster,
- a 100 ms passive polling interval.

The step-wise governor ignores the switch-on trip, which has no cooling
devices, so zones that don't use the power allocator keep their existing
trip points. Limit the new little cluster maps of the big zones to the
four remaining little cores on MT8370.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 110 +++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8370.dtsi |  14 +++
 2 files changed, 118 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70cb..07f5f4e62d7d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -471,10 +471,17 @@ sound: sound {
 	thermal_zones: thermal-zones {
 		cpu-little0-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -503,16 +510,31 @@ cpu_little0_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little0_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little1-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -541,16 +563,31 @@ cpu_little1_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little1_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little2-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little2_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little2_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -579,16 +616,31 @@ cpu_little2_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little2_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little3-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little3_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little3_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -617,6 +669,14 @@ cpu_little3_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little3_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
@@ -625,8 +685,15 @@ cpu-big0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_big0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -647,10 +714,22 @@ cpu_big0_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_big0_cooling_map0: map0 {
+					trip = <&cpu_big0_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
 					trip = <&cpu_big0_alert0>;
 					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
@@ -659,8 +738,15 @@ cpu-big1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_big1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -681,10 +767,22 @@ cpu_big1_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_big1_cooling_map0: map0 {
+					trip = <&cpu_big1_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
 					trip = <&cpu_big1_alert0>;
 					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index 7ac8b8d034945..61801f79e729e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,20 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+&cpu_big0_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_big1_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
 /*
  * Please note that overriding compatibles is a discouraged practice and is a
  * clear indication of nodes not being, well, compatible!
-- 
2.55.0

