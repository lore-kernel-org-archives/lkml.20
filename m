Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945928;
	b=MfbsnW3SMz1Qo+oZklKi0z7ILGKuTzClSVAMWPKgPsYtiCbmxDZunTVHIXUpSGARmaL9
	 VWMfu5Xtp4WEFH1wZUhts1XpUuYf2xbyGQuKwS6CJ0V1KQRpUUdCh7y3AbEJGIkcajNmB
	 /tUmAg0Rj/1XXIxsKToPJCmDwsDpJzL7ySQ5NYsAuRcQDCApIrP1RWUECOUhOlY/A7yvG
	 vSg5FYgopY4OyZW0vLYIRONI2STKrDrGwCzbz1f/CbKVo1PwPi/YN+xMCoqxwNTi7nhN7
	 f9EfWOimgNaUxFFBzCTwigNObfrniKG+DulOCFXWT/UV4+M1OL6ed4mMy5WP3VRoHlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=;
	b=PcL5bxJVf+H0XSi8BG4yG6DRnSEynlfCUBaWvvml2Gu6D99yOOVT1B2RiTlhBvQQYc4w
	 p6VQILqqj3VYQBGI1dHOYis5UwdsX0mm//3kqGOhXxpeCDWi/f+0gGoAuhrno0TmrozL+
	 LrD7F4ehy1Qcw7FQo+nXIA/9ACpQwAnQRa8W+CYRsJ9Khin693uOY4vLQeNP7+v0d1ckz
	 XQbH3KIo0wftZsy08ECVE/dfwCQqnYFmEWRoJA2/hJ5lU0Qbtb5yAzcuWa7559dZHFbLY
	 oesbBXjE/n2jxBKnLKnxgOT+PcEEWTbVVPun1uYdh5gwahxtRD6I0P4jMG0EHI3pSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJbaE24h;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D3606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7D3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJbaE24h
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so482093c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945927; x=1794550727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=;
        b=JJbaE24hBsZwoWmpxYjc1NKCuE0s1QoZpr3oO5u3C4vNxiyYDTZLDabWZKPZnxo7ML
         oIiWoqP9kyy4LqdefDbnpCPgidwOskBKtenZ0BBDCmkRf/iaUuBR2vLO4eaNlEjibAVV
         wqu8Wf2IOU6rxpG9FiklVU94pMa+IGTqcCp/b/8IqmRiFumw3cecquH3BBTXReVoxp6Z
         Gjq9d4CdAttE4jA7IA9tOCyx1rizDkN+/dqnP/WnUI0Eu00A8wfLf0doXRdy2rQLHDT6
         UHxDfOMoMiI+pS09XIuIt6ps5nyrhbJ9vmhs609Ib86Yw4ny2wtEIIdUR3mvgubU+oGk
         y1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945927; x=1794550727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMTw4oTDCJyIKE8BV8ip+57Dn/aXQGYoxWAp8K3eAUM=;
        b=G4/jw08oT4SpFQzZM2JmvTKWZqdgVfkN37qBKdRDolp2BxCYsvHMSbpxttJ0a4jm7i
         ECRXRhJXOrsW3+W6x7a2erljUTSKFnXwLQPVDottDqzogE9a4gFjSJPjP85FhXXWXfPf
         hercsyblqdoU5Phv82sA4ZCSpFxxwtfuX9uexpbRU2g8FxDy+3qVjuS9ksC55TXTN/zz
         +O6L/AxmzvcgL0ovL/p6edKKLGimBfUKd3TKd89WrRVhjbL3J/J8KuVXJJbHkxn24DeC
         sYbvI2iQDd2PNlML6AFeO1wrHS4jk19J+Mo3QvcKviLJZFJuwcJqcBdUC3jGNzjqIp+/
         qXSA==
X-Forwarded-Encrypted: i=1; AKwUvBzsHhRy7RPpokFOSNpjmLGyCAutpGuTXENRedKfwzKZklrk5z/dFCusvBLjzi6hXpe4SdElMIVn7TdqDTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iax0kYdkNKM/+XGVwvYVUQK2x6No2BjI1htf9lFctLlBCFqLp
	NF/65DzUY7/uF1jGDa6Ljeu7YRBp8vZOhTZ5oMZ2og9qvXfZy3zQyDZl
X-Gm-Gg: AYBFou1ACyhhpbOPmI20coUJ8SJR/G/FyErVVRuMcD8Aq9N2hY7+0yDQkkectRAPeeN
	555mevaJiptdQFuegb7ah+wNJ8kDgIWxCQkrH29TNjXqdBiHrJFoVEoNYAh615uAEa9+QLZNCil
	Zg7mvQxhwngxPEaVIxbuN6yOZrffW7SlLYTsPjEsgZMfv6uhzzMRbHGn7/a+qo08dcFYJPN8TBT
	AqXbTICk14KVHKWuVayjn9B09CmNhLaCah/wQDb1dzOVJV8HzmScVZ0jl6rVIypuJTkdkeQxVTQ
	VAJptPTxn74dnkzm0YpAI6wg0HaDJyVuMrNI0NUyszFzraOD00Vsgdh7vcg9ErkCr2Qy0B+uqBn
	ujSZIC9AaIpDdTViR/f95YEQcsL7erhX/eSwIHzQawAELKCWfmR8NDHk8q5hXhAvj+BbF6dQZOJ
	gUrxBcC55vTWWZqY4zRhX5M63nkafPqfl3DJ0TmnFddw2BNSa8igjV1RUglev+EaE2PDFDbztLY
	6/O6dTQmxjKM4p4NLbsCvoomHYlZ3shyaPDlNPKfRkisCWfyzGTkUikmfdGj/o2DLKwATBozhxW
	KmxAWEPyqQHbhpFyInwZg4anWJ1er/fJPszxzg02Pnoi
X-Received: by 2002:a05:701b:2318:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b25d359e6cmr2423409c88.41.1793945927182;
        Thu, 05 Nov 2026 22:18:47 -0800 (PST)
Received: from aaron-m75q ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm2675521c88.13.2026.11.05.22.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:18:46 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v3] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Fri,  6 Nov 2026 14:18:35 +0800
Message-ID: <20261106061835.1316-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
of the WiFi SDIO node instead, and that consumer keeps the rail from
switching to 1.8V.

The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
supply stays vcc1v8_s3. The card slot itself is fed from vcc3v3_sys
through a switch enabled by GPIO4_D6, which the vendor device tree calls
vcc_sd.

Fix the supplies of sdio0 and sdmmc accordingly, describe vcc_sd, and
enable SDR104, which now becomes possible.

With UHS enabled, sequential read from a 64GB SDXC card goes from
22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz, with no WiFi
errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Changes in v3:
- Describe the slot's own supply, vcc_sd, and use it as the sdmmc
  vmmc-supply (Heiko). It is fed from vcc3v3_sys, and GPIO4_D6 controls
  the slot power switch: holding the pin low leaves the card unpowered.
  This is the same arrangement as vcc3v0_sd on the ROC-PC. The existing,
  unreferenced lcd_panel_reset pinctrl entry also names GPIO4_D6; the
  vendor tree uses the pin only for vcc_sd.
- Link to v2: https://lore.kernel.org/all/20261105102556.1365-1-yaozhonguwl@gmail.com/

Changes in v2:
- Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
  instead of dropping it (Heiko)
- Rewrite the commit message (Heiko)
- Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhonguwl@gmail.com/

On the boot-time issue described in v2: with the vmmc-supply in place
the sdmmc controller now probes after the GRF io-domain here, and a card
present at boot came up in SDR104 in 5 of 5 warm boots, against 0 of 8
before. That is a change in probe order rather than a fix for the
ordering problem itself.

 .../boot/dts/rockchip/rk3399-firefly.dts      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..03858a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -233,6 +233,19 @@ vcc5v0_typec: regulator-vcc5v0-typec {
 		vin-supply = <&vcc_sys>;
 	};
 
+	vcc_sd: regulator-vcc-sd {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc_sd_en>;
+		regulator-name = "vcc_sd";
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
 	vcc_sys: regulator-vcc-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -731,6 +744,12 @@ wifi_enable_h: wifi-enable-h {
 		};
 	};
 
+	sdmmc {
+		vcc_sd_en: vcc-sd-en {
+			rockchip,pins = <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb-typec {
 		vcc5v0_typec_en: vcc5v0_typec_en {
 			rockchip,pins = <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -777,7 +796,7 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
+	vmmc-supply = <&vcc3v3_sys>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +823,9 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_sd>;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

