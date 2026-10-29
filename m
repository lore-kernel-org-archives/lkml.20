Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313236;
	b=opXK4ElNcUG+kU4aJWkzAjw7jwLZZFeHza3Y0XUww+gghvyljqaVYlazgDBqLyXbrWHI
	 g9WcDmaYExE6pNIvWewrCTNkxhlO6rLQ19v8BCkwbDNl9AvtnREyXel81VNtn58LU6hZ/
	 NM7s1pJwyXpSrXnbeGMKTFiacnAhMvNT1qWmg99dIP28w4MzHb2VEOfUwu/YAC2uJX7mV
	 mvhAsI3QtXaLQV17kL/3FkBWUjQU/g3YBfQTTNF6c2FHF4S/dDRXKRVZm/NZhP/SFFuTq
	 5OMweQC/f0iSsFDXqD/srNGCeIJxChVQ/g/SMCiADR9Bg+H1cigByVd+NXJc8xrBGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313236;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=fTWSodODTzSoFCvviWeSjULUwycoGOX3KtjfiF3lf+Q=;
	b=ztz6gOj8HuQ+htePNUuOgFi2QJFo70PlRe3alQ3qvQZsRny6fN9aryBslG/xJlzm6Xr/
	 aqzbtS+yQoDV0t7YtbAQB6LndthdNWebKnD2okrriCU3EirZhqdfh16kPB6Hsr2wUakSL
	 IjVnqA2F1ovOsjFCAGS5Op/o4hbHbpQifA63sJVrB0gi9fr8eQz+cI0TVjIl18n+UXKN8
	 WCgzOCfxOzYFpl6Uu8pY31TR8ktkT6ZcmbBj3qicAHG53f9ZarqSolZnrEBj15DqYky6k
	 vJDNa8EgoIGCl3077a3jwUMIfnmfSvHo907YTQgngwI4nibdQysRmBW2rem50YHfIiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VbpNZUJy;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64052606A334;
	Thu, 29 Oct 2026 22:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64052606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=VbpNZUJy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313233; x=1793572433;
	bh=fTWSodODTzSoFCvviWeSjULUwycoGOX3KtjfiF3lf+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VbpNZUJy/3ALRXzI+G22IxqXjZHGrfQLSoJskvJuBMk1Y7SRTnDTGkfZUiTce1AsU
	 WY5QTOQDKBEVqJhqLW+qsfUtHM9bmkumCBqHdHBHj1xrEPm0Z6ESV1FavgkGJDupcb
	 3BVnA/3ZqJY7995pWmSVuWXclHVzt8lTwsOnM+rJV1frYStnwHyZbuczbVK8cUgh6X
	 2OrddN7496a/hWy6tDV1JC5+OIPmm/TJzRrQfvBIet0T1DTFSKxINYmK+xpyBXy4+2
	 iTrbew+LnhiYyzNFKBLCvZ/h5PQjkRExYSk5VLGEadWBF1yHU2cDyjnVRnWK+EwZhJ
	 zgBpBgaxgCkmw==
Date: Thu, 29 Oct 2026 22:33:48 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/5] arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
Message-ID: <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
In-Reply-To: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 47756a89b09698ed9a2cc4d563f29a42a002dcdc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
parts.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 200 +++++++++++++++++=
++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index fa0cbf78b69a..68b500bd4c3f 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -22,6 +22,7 @@ / {
=20
 =09aliases {
 =09=09serial0 =3D &uart5;
+=09=09serial1 =3D &uart11;
 =09};
=20
 =09chosen {
@@ -85,6 +86,22 @@ pmic_glink_sbu: endpoint {
 =09=09};
 =09};
=20
+=09vreg_s1j: regulator-pm3001a-s1j {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "pm3001a_s1j";
+=09=09regulator-min-microvolt =3D <2200000>;
+=09=09regulator-max-microvolt =3D <2200000>;
+=09=09startup-delay-us =3D <1000>;
+
+=09=09gpio =3D <&pmr735b_gpios 1 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+
+=09=09vin-supply =3D <&vph_pwr>;
+
+=09=09pinctrl-0 =3D <&s1j_enable_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+
 =09vph_pwr: regulator-vph-pwr {
 =09=09compatible =3D "regulator-fixed";
 =09=09regulator-name =3D "vph_pwr";
@@ -108,6 +125,67 @@ ramoops@81f20000 {
 =09=09=09pmsg-size =3D <0x200000>;
 =09=09};
 =09};
+
+=09wcn6750-pmu {
+=09=09compatible =3D "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
+
+=09=09vddaon-supply =3D <&vreg_s3b>;
+=09=09vddasd-supply =3D <&vreg_l7b>;
+=09=09vddpmu-supply =3D <&vreg_s3b>;
+=09=09vddrfa0p8-supply =3D <&vreg_s3b>;
+=09=09vddrfa1p2-supply =3D <&vreg_s2b>;
+=09=09vddrfa1p7-supply =3D <&vreg_s1b>;
+=09=09vddrfa2p2-supply =3D <&vreg_s1j>;
+
+=09=09bt-enable-gpios =3D <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+=09=09clocks =3D <&rpmhcc RPMH_RF_CLK1>;
+
+=09=09pinctrl-0 =3D <&bluetooth_enable_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09regulators {
+=09=09=09vreg_pmu_rfa_cmn: ldo0 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_cmn";
+=09=09=09};
+
+=09=09=09vreg_pmu_aon_0p59: ldo1 {
+=09=09=09=09regulator-name =3D "vreg_pmu_aon_0p59";
+=09=09=09};
+
+=09=09=09vreg_pmu_wlcx_0p8: ldo2 {
+=09=09=09=09regulator-name =3D "vreg_pmu_wlcx_0p8";
+=09=09=09};
+
+=09=09=09vreg_pmu_wlmx_0p85: ldo3 {
+=09=09=09=09regulator-name =3D "vreg_pmu_wlmx_0p85";
+=09=09=09};
+
+=09=09=09vreg_pmu_btcmx_0p85: ldo4 {
+=09=09=09=09regulator-name =3D "vreg_pmu_btcmx_0p85";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_0p8: ldo5 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_0p8";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_1p2: ldo6 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_1p2";
+=09=09=09};
+
+=09=09=09vreg_pmu_rfa_1p7: ldo7 {
+=09=09=09=09regulator-name =3D "vreg_pmu_rfa_1p7";
+=09=09=09};
+
+=09=09=09vreg_pmu_pcie_0p9: ldo8 {
+=09=09=09=09regulator-name =3D "vreg_pmu_pcie_0p9";
+=09=09=09};
+
+=09=09=09vreg_pmu_pcie_1p8: ldo9 {
+=09=09=09=09regulator-name =3D "vreg_pmu_pcie_1p8";
+=09=09=09};
+=09=09};
+=09};
 };
=20
 &apps_rsc {
@@ -838,6 +916,16 @@ &pmiv0104_eusb2_repeater {
 =09qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
 };
=20
+&pmr735b_gpios {
+=09s1j_enable_default: s1j-enable-default-state {
+=09=09pins =3D "gpio1";
+=09=09function =3D PMIC_GPIO_FUNC_NORMAL;
+=09=09power-source =3D <0>;
+=09=09bias-disable;
+=09=09output-low;
+=09};
+};
+
 &pon_pwrkey {
 =09status =3D "okay";
 };
@@ -848,6 +936,39 @@ &pon_resin {
 =09status =3D "okay";
 };
=20
+&qup_uart11_cts {
+=09/*
+=09 * Configure a bias-bus-hold on CTS to lower power
+=09 * usage when Bluetooth is turned off. Bus hold will
+=09 * maintain a low power state regardless of whether
+=09 * the Bluetooth module drives the pin in either
+=09 * direction or leaves the pin fully unpowered.
+=09 */
+=09bias-bus-hold;
+};
+
+&qup_uart11_rts {
+=09/* We'll drive RTS, so no pull */
+=09drive-strength =3D <2>;
+=09bias-disable;
+};
+
+&qup_uart11_rx {
+=09/*
+=09 * Configure a pull-up on RX. This is needed to avoid
+=09 * garbage data when the TX pin of the Bluetooth module is
+=09 * in tri-state (module powered off or not driving the
+=09 * signal yet).
+=09 */
+=09bias-pull-up;
+};
+
+&qup_uart11_tx {
+=09/* We'll drive TX, so no pull */
+=09drive-strength =3D <2>;
+=09bias-disable;
+};
+
 &qupv3_id_0 {
 =09status =3D "okay";
 };
@@ -886,6 +1007,59 @@ &tlmm {
 =09gpio-reserved-ranges =3D <13 1>, /* Display */
 =09=09=09       <63 2>; /* WLAN UART */
=20
+=09qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
+=09=09pins =3D "gpio48";
+=09=09function =3D "gpio";
+=09=09/*
+=09=09 * Configure a bias-bus-hold on CTS to lower power
+=09=09 * usage when Bluetooth is turned off. Bus hold will
+=09=09 * maintain a low power state regardless of whether
+=09=09 * the Bluetooth module drives the pin in either
+=09=09 * direction or leaves the pin fully unpowered.
+=09=09 */
+=09=09bias-bus-hold;
+=09};
+
+=09qup_uart11_sleep_rts: qup-uart11-sleep-rts-state {
+=09=09pins =3D "gpio49";
+=09=09function =3D "gpio";
+=09=09/*
+=09=09 * Configure pull-down on RTS. As RTS is active low
+=09=09 * signal, pull it low to indicate the BT SoC that it
+=09=09 * can wakeup the system anytime from suspend state by
+=09=09 * pulling RX low (by sending wakeup bytes).
+=09=09 */
+=09=09bias-pull-down;
+=09};
+
+=09qup_uart11_sleep_tx: qup-uart11-sleep-tx-state {
+=09=09pins =3D "gpio50";
+=09=09function =3D "gpio";
+=09=09/*
+=09=09 * Configure pull-up on TX when it isn't actively driven
+=09=09 * to prevent BT SoC from receiving garbage during sleep.
+=09=09 */
+=09=09bias-pull-up;
+=09};
+
+=09qup_uart11_sleep_rx: qup-uart11-sleep-rx-state {
+=09=09pins =3D "gpio51";
+=09=09function =3D "gpio";
+=09=09/*
+=09=09 * Configure a pull-up on RX. This is needed to avoid
+=09=09 * garbage data when the TX pin of the Bluetooth module
+=09=09 * is floating which may cause spurious wakeups.
+=09=09 */
+=09=09bias-pull-up;
+=09};
+
+=09bluetooth_enable_default: bluetooth-enable-default-state {
+=09=09pins =3D "gpio53";
+=09=09function =3D "gpio";
+=09=09output-low;
+=09=09bias-disable;
+=09};
+
 =09assist_default: assist-default-state {
 =09=09pins =3D "gpio71";
 =09=09function =3D "gpio";
@@ -905,6 +1079,32 @@ &uart5 {
 =09status =3D "okay";
 };
=20
+&uart11 {
+=09/delete-property/ interrupts;
+=09interrupts-extended =3D <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
+=09=09=09      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
+
+=09pinctrl-1 =3D <&qup_uart11_sleep_cts>,
+=09=09     <&qup_uart11_sleep_rts>,
+=09=09     <&qup_uart11_sleep_tx>,
+=09=09     <&qup_uart11_sleep_rx>;
+=09pinctrl-names =3D "default",
+=09=09=09"sleep";
+
+=09status =3D "okay";
+
+=09bluetooth {
+=09=09compatible =3D "qcom,wcn6755-bt", "qcom,wcn6750-bt";
+
+=09=09vddaon-supply =3D <&vreg_pmu_aon_0p59>;
+=09=09vddbtcmx-supply =3D <&vreg_pmu_btcmx_0p85>;
+=09=09vddrfa0p8-supply =3D <&vreg_pmu_rfa_0p8>;
+=09=09vddrfa1p2-supply =3D <&vreg_pmu_rfa_1p2>;
+=09=09vddrfa1p7-supply =3D <&vreg_pmu_rfa_1p7>;
+=09=09vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
+=09};
+};
+
 &ufs_mem_hc {
 =09reset-gpios =3D <&tlmm 167 GPIO_ACTIVE_LOW>;
=20

--=20
2.55.0


