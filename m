Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313248;
	b=OD+0ZEmMroq1Ryen7jIc8sIGeU33FtggMh+0YVZVefn7r0E6Nan/5gMw9az5NAhFadNk
	 fOoINe5wovU38/QUak4DJmdnjmzT9V4r8hFFuGaKbvIuDDuzdNV+UjN7WOIqCOJycwDUg
	 CD3Ak3FLnh2j/WJ/luj+v4oND087Jm6EZJgJOkPvECTPkASA4jC4i4wA1CXK9+sucN7V3
	 h0tuN24VD/0ztOpMbeeBE9Y2e8X6o1do5fEBcwdxvciSR+nIG3iDYZSS7MXVCUxqVRMlG
	 Gz/TBcJG+4Bzpmf1OmvI2FABnyoi+Tau+YXhokxeqD3bf7MRFGKhbRjqBX8Aqa8VnGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313248;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WASSA4Njt5c594yDZYU85Ex9NsemwZ3Jk+8pja+CF3k=;
	b=Bh369SgtKd7Yb7bP/biWemokhCsY+xrGLMXY7685OV89QdHCzc+dl7IwF/ET0upilxbz
	 p2K/vgKI2LMOplS02x1IsjPVJt5oqU6kjqinxRKBZtw1NPvVGkSC9mN/ETBHapLgUg99l
	 hKGl7nVGY3DWGXtum8nApr8WmdaNmonDXdRlzGUp4rW0Wi5t8rHILh6qlzJ4stsMHASWb
	 uwXNc4ELRgT/J/vh8d0k93MJnXjWxmlsTKXCiUuk8BSYz+4z2RJSMhv+KyI8OVQbPQrl0
	 PHn1xO2Sgi9UzV8vvfDT10IkzSJ95D+Ko8GhZNinNoRRGnEOku2JVNrsvM529ESlpWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Sq3DbXyV;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A973260A2627
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A973260A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=Sq3DbXyV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313245; x=1793572445;
	bh=WASSA4Njt5c594yDZYU85Ex9NsemwZ3Jk+8pja+CF3k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Sq3DbXyVdwU5PksddanUig6uCq6omy4KV3tYUjQ3hQb0W38SJxPj/HNkyE++EnOrl
	 H4qwIoTophmQLpxp122AVJAy53r/rnsQYAD6S8NCwVX4RQ92mGRLEygj0jUkF3WJHq
	 nQlSt5cfBKmQ97Y7gBFDQ0L84QEzw7hxOBPg/RrJdG1MXi7ThTYwj7HMviS85Mqmnr
	 VY2fQ6++10hNGD+6yQnGjijyPqOxFg9Rhl6Ej4gXVSpueYyDNi3P6IUNCDSIYFp8xC
	 3lvwasCZvnjpJiQ2F8T6ZMQId5bi0BEb7RZgMHE9SYZ7miTqwp+r/4LDlUDsVgvo5M
	 8iCyWOQLh2U6g==
Date: Thu, 29 Oct 2026 22:34:00 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 5/5] arm64: dts: qcom: milos-nothing-asteroids: Enable panel
Message-ID: <20261029-asteroids-dts-updates-v1-5-79351337d681@pm.me>
In-Reply-To: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: a4d7f84c97b0931c526bcae9372aa0694dfad82f
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

Configure and enable the node for the BOE BF068MWM-TD0 display panel on
the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 70 ++++++++++++++++++=
++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index af115295a20d..e1edbb603e98 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -86,6 +86,20 @@ pmic_glink_sbu: endpoint {
 =09=09};
 =09};
=20
+=09vreg_oled_dvdd_1p8: regulator-oled-dvdd-1p8 {
+=09=09compatible =3D "regulator-fixed";
+=09=09regulator-name =3D "oled_dvdd_1p8";
+=09=09regulator-min-microvolt =3D <1800000>;
+=09=09regulator-max-microvolt =3D <1800000>;
+
+=09=09gpio =3D <&tlmm 109 GPIO_ACTIVE_HIGH>;
+=09=09enable-active-high;
+
+=09=09vin-supply =3D <&vph_pwr>;
+
+=09=09regulator-boot-on;
+=09};
+
 =09vreg_s1j: regulator-pm3001a-s1j {
 =09=09compatible =3D "regulator-fixed";
 =09=09regulator-name =3D "pm3001a_s1j";
@@ -889,6 +903,48 @@ &ipa {
 =09status =3D "okay";
 };
=20
+&mdss {
+=09status =3D "okay";
+};
+
+&mdss_dsi0 {
+=09vdda-supply =3D <&vreg_l4b>;
+
+=09status =3D "okay";
+
+=09panel@0 {
+=09=09compatible =3D "boe,bf068mwm-td0", "raydium,rm69220";
+=09=09reg =3D <0>;
+
+=09=09reset-gpios =3D <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+=09=09dvdd-supply =3D <&vreg_oled_dvdd_1p8>;
+=09=09vci-supply =3D <&vreg_l19b>;
+=09=09vddio-supply =3D <&vreg_l9b>;
+
+=09=09pinctrl-0 =3D <&disp_reset_n_active>;
+=09=09pinctrl-1 =3D <&disp_reset_n_suspend>;
+=09=09pinctrl-names =3D "default", "sleep";
+
+=09=09port {
+=09=09=09panel_in: endpoint {
+=09=09=09=09remote-endpoint =3D <&mdss_dsi0_out>;
+=09=09=09};
+=09=09};
+=09};
+};
+
+&mdss_dsi0_out {
+=09data-lanes =3D <0 1 2 3>;
+=09remote-endpoint =3D <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+=09vdds-supply =3D <&vreg_l2b>;
+
+=09status =3D "okay";
+};
+
 &pm7550_flash {
 =09status =3D "okay";
=20
@@ -1027,6 +1083,20 @@ &tlmm {
 =09gpio-reserved-ranges =3D <13 1>, /* Display */
 =09=09=09       <63 2>; /* WLAN UART */
=20
+=09disp_reset_n_active: disp-reset-n-active-state {
+=09=09pins =3D "gpio12";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <8>;
+=09=09bias-disable;
+=09};
+
+=09disp_reset_n_suspend: disp-reset-n-suspend-state {
+=09=09pins =3D "gpio12";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-down;
+=09};
+
 =09qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
 =09=09pins =3D "gpio48";
 =09=09function =3D "gpio";

--=20
2.55.0


