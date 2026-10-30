Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400116;
	b=zSOtcoDj1dghC5mhgYxjSYf1xXX5GlGmsEr5BbfLJMroL582Ley1TT7AKHasmmjy+yWI
	 zPSZp+UiaWOCDzDT30hRKRER/cm1GRjLnvlH9JpBBuqvBU3cs3D9mONqRaBas9yg0AFHe
	 j7BCJ1juO3BonNTQDUFVSnHRPERbBuR6rK4RVQQeXm82mm8hjXKi78voSH8iAThuHZYNC
	 tsjOvF2KnLs8AAMEKvJbgYuHwVD2vmag9gIQQw4UMMUpJbd/7ory3S0Kuvze96RPUDYQx
	 KtfQv4zC6/I4kJrQbvn+bCi0NvvY/lFkRpfX/AtAG19EMLzvm3AT36XsPFUZqEEsAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400116;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=y49SxGLTe3bsWfsiql5hTJXGuNk6P56VVWb8iZFO77Q=;
	b=uaXCpVbSRNAKDcsLjwKP9XVDLkyuEIjkXamM7+n0ofUfzkDJ4zkVAlY7bCVEl8Eaz8CT
	 c0ROiYaHWregQSo2P1mfKFdjxC+/RvQWW9lAASmTvlaPoFz6C8r/M88BPbwoDOFmZ8xeM
	 AXu4maaMbHPt1uApbKiQ2Hp/tJ140puSv8pOnfekQV4L95rQPIakKOxCl+04ZEiIvf+Ui
	 i6tz+JXcX+UxQN4A+xlPtcNXpgCUsfBu3+yCIK2qs55Wn0nROG49yFJJagx9nJAHM+0DB
	 ojGMGab4eXXDd7J/36v1nloNmHf+gSDoTJsXYDdYDTbGkmkTYSkdOJdIYRBzRwzQjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="I/4OQagU";
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7FE606A32E;
	Fri, 30 Oct 2026 22:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7FE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=I/4OQagU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400113; x=1793659313;
	bh=y49SxGLTe3bsWfsiql5hTJXGuNk6P56VVWb8iZFO77Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I/4OQagUp1dvxPHVuKX/1DihNzCLuWfreVNz+0E/3XeVsaK6DmgwVW+KUJK5sNkXe
	 ESJXyEZA/ae42FixOB71YP1naHP9haG7GkF/Dem8h3GI8y1H4fSvOR7rxToEr7Ngz0
	 MZeRE6bdLrJ2bWoFFrmq80Awes+QpOVO0FwAYWwcoRXlNWAefAKWF5Dkny8FFGI3u7
	 1gwsKIShHosZD4Ib2KDL0EAdrmQizTNNSkKuyQfAANwYRZTkxwgQJTD34eDFxRoaBZ
	 uHSGAD0gH8ZEjuvriiV5A0YMmZ4JPkhmPGR4gx9F32C8cs8UQDA/WJPEcsN9cFjAAJ
	 jw3DpPpE3+iTQ==
Date: Fri, 30 Oct 2026 22:41:50 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: milos-nothing-asteroids: Enable panel
Message-ID: <20261030-asteroids-dts-updates-v2-6-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 020bf8e3b52847cdd8101186ecfdc835aa542c59
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 70 ++++++++++++++++++=
++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 9ebf4564453b..1ffd0aedfa0a 100644
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
@@ -886,6 +900,48 @@ &ipa {
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
@@ -1023,6 +1079,20 @@ &tlmm {
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


