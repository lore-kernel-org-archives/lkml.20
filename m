Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792548153;
	b=lWzDEFHPzGvwEtsbiMOL6mfzIoNMQjWFzOBjhjWQnqDhhvFz+YHfnso/kCNJx6Ynw78C
	 pO/urJZn3guH1UXyJ/87Olw/TjBeKeQj8t+uuQbI5tMx15kxcTWEWusaF45N2YRFYTWC2
	 n4hgZvWRHdIBHH72wjwpB94iAlQyjKfh9y/QgnRfusr0PLYW7vM997VNHJvsHeuKhWaQq
	 JfYbZaFbPCn1szI+aEyQVnrHOBZoiIRn1tIXARcFmOZkW84ixPjOOyAdV40lLpnujyax5
	 DinGcEwIAcq9eILmgF+4hYy4h8cjf4NYH01JOoaykvYIIpyku2nc9wsb5M9hFJrmlbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548153;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=f0yKeF4w4GH+4lXqeNbGng0xeltVKW31ll58aa+tTMY=;
	b=zESQscpxbCHFM7Z8ra3er89OzYDvIl13Gt1j4IxOmOIi6ifYeEV8aF0EujMqJOUuKv++
	 dF/kWweBeI8XwS9F82XuRbtNoC9+p/bcUxGca8Ms2WhiqAvAbGPHRpAeinmiIV8qPtYwY
	 yOIc9Qp15Nak3OnKNafX+f86uKgadXvQ56StWnccEfQhmJbBw8fabwGVc/9TFvGiV0QNk
	 lMp98STj/XJsqMNf0qZCKFN1MtGA10uvorhdfH55iuT0DwQ7TJbBvUITQEjGmiZOyAhlG
	 QdUM+KwDOFVUo5CCp+yD/LDtLpZJYizplxgdI/oVZYDB3NK/QCN5YF2jC+orD3aijAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSD7Coup;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAC606A31A;
	Wed, 21 Oct 2026 02:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSD7Coup
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792548152;
	b=hQ1W6tdyEFzXVuVZwcb9SD7JGXgDWAmguY+qAGBfvI0nRDYSGwuMOy6Htt1VHhusyt/e
	 kSDr+6n+KZJGhYxKaO09aL4IbL2ZgZudoNiGax4ly3c0kpQptOpeyPR5zN9YpNE77C0bI
	 aPuE4x0AfjxvxgseHfrVcX1nQV8J9e8Q/B51MOAQEDkVL7yupjEwTr4M8hh+hCdnLa8KA
	 UCcJEegpHYIME/DgTiPy0B+e4SaEZg+v8Qw1A3kF/ZjuupTQGEPMb1H0Z25lOhfPv/3Mh
	 GlrZgfr5f3affeCkbN6CCwPH7CmG9mHn59m8YUlJuaerVh1I5JTgM+roB6OT36rd5VA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792548152;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=f0yKeF4w4GH+4lXqeNbGng0xeltVKW31ll58aa+tTMY=;
	b=W/4ZXCzJRmOslF46zwU0v2yhYioJyet2oDl5VdLCyp26KzaaSVt/9dXp/kT62EqqO4G0
	 bCO4okQqmPGzHA1nXSHLp4C5ZGOgAa7u/+kWbN+sKHy/9A0ygCchv3Gn+wQYpCQUTKhR5
	 qTAvov6a/nk7t3qghoMIJtZO153ZcM/wuSM1zHQ2lzTX7PObqqT8jHr+1GThuW6pR0dZt
	 6yncQuZlQsl28trQoxQ1MqGRFOaWUk3NKS4ZYIapql2Jz0IvCs8LFdOq6bFlNBHAOV2ZA
	 MlQ8OLyNUCilBtSQFX9pZwchhSu+kVl/8021gohLSFmvSt//W47CBHOWz7+qpxY2Fpg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA6781F000C9;
	Wed, 21 Oct 2026 02:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548152;
	bh=f0yKeF4w4GH+4lXqeNbGng0xeltVKW31ll58aa+tTMY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=eSD7Couposucux9BBfClKOEFLwEoiFInTcZfcMuL22QeyB9Il3A3mLqtFMb3OYpUv
	 z6HREFIMJLJSDgpwow3xoGobUeAprDaJm1Gu1+e1d+995hyBWgj/ETKCub5YP6B8te
	 7EqE3WyT5srHrs+cxM+GtkyeXufO7w9TvH2TrbtFzaEswLE7ooc5W2lxcatrGueeay
	 fv8F1PDNoefCjIbk+UAW7tmcl+MaT4BMRNIbZLlS7tWqAKvCNz8SlaCWzl6nk+f1tU
	 iQXuxeONsL0Gzmi4CAEQ+FT6Ct9Un1wbKfFoJmzJw+yG5Se18P/5l+zQvVXOFQkKmJ
	 HAXwJGj4KFWAg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7A8474326F;
	Wed, 21 Oct 2026 02:02:31 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 21 Oct 2026 02:02:29 +0000
Subject: [PATCH] arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol
 Helios64
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
Message-Id: <20261021-helios64-vdd-log-center-v1-1-4cafd110e0e5@iav.lv>
X-B4-Tracking: v=1; b=H4sIADUd2GoC/x3MQQqAIBBA0avErBtoTCy6SrQwnWogNDQiiO6et
 HyL/x/InIQzDNUDiS/JEkMB1RW4zYaVUXwxqEYZahThxrvEbDRe3uMeV3QcTk44U+sXPZuutwS
 lPhIvcv/ncXrfDzkFkdJpAAAA
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=RDt7P+CwOHiaEZvswLkEBaOOUqR15G5E3l+XUXhUTd8=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFk3ZM28ok6uurQ4RuGJvaChU8C3vtWXs34WMTzvOV6gO
 ofBseBRRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhI8SmG/1lfjils1Jsu0lPc
 klw6+daeKx4PfI8siAiqF+btd3xrHsjIsCsy+OKF7YymHVIti1g23t9sLJ3R8S8h2Svyb/PRd0d
 jGQE=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The Helios64 feeds VDD_LOG from a PWM regulator driven by PWM2 and
VDD_CENTER from DCDC_REG1 of the RK808, but the device tree describes
neither of them.

Describe both. The vdd_log range comes from the schematic (sheet 8):
0.83 V with 3.0 V on LOG_DVS_PWM and 1.4 V with 0 V, so the PWM is
inverted. vdd_center gets the same limits as vdd_cpu_l.

With U-Boot setting both rails to 950 mV, Linux 7.3-rc7 reports 949 mV
and 950 mV.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
No regulator-state-mem: deep suspend does not resume on this board yet,
so no suspend value is tested.

U-Boot sets both rails to 950 mV:
https://lore.kernel.org/r/20261021-b4-helios64-v1-1-74afe8aa6d72@iav.lv

This conflicts with the pending power tree series in the list of fixed
regulators; I will rebase whichever goes in second:
https://lore.kernel.org/r/20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..3c2ba805e999 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -271,6 +271,17 @@ vcc12v_dcin_bkup: regulator-vcc12v-dcin-bkup {
 		regulator-max-microvolt = <12000000>;
 		vin-supply = <&vcc12v_dcin>;
 	};
+
+	vdd_log: regulator-vdd-log {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 25000 1>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_log";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <830000>;
+		regulator-max-microvolt = <1400000>;
+	};
 };
 
 /*
@@ -370,6 +381,15 @@ rk808: pmic@1b {
 		#clock-cells = <1>;
 
 		regulators {
+			vdd_center: DCDC_REG1 {
+				regulator-name = "vdd_center";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+			};
+
 			vdd_cpu_l: DCDC_REG2 {
 				regulator-name = "vdd_cpu_l";
 				regulator-always-on;
@@ -580,6 +600,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&pwm2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc1v8_s3>;
 	status = "okay";

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261021-helios64-vdd-log-center-b13df4b678a1

Best regards,
-- 
Igor Velkov <iav@iav.lv>


