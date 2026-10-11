Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC08379996
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743329; cv=none; b=caB4BFTDiHI/jtZ6JfrtetU/cWd5vkuu3vCVCjWwvZn8EMznzhMh8eIPmJxocJ8Gtwk7tev/xUbS3DV3RtVn+kkgcgCnSlU8K8Ge3UwVql61ol6W5uf14RcMMHykx8XuMEmFwpoZuR8Xqa+Pc7tyAyqoZjsnhg4tbkazkHn9WHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743329; c=relaxed/simple;
	bh=6KWPx72+CFDP30hTguFnf7/6ovxWOPyRdeWB57p6IOk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPt2W0IYEzuXICKeNcAKwphOeNTnAPtjRdSq/tkH1Z4sp8/chxRiFhn+sKaRvlpNQlLkWeYwD/TrEGa90mJaf8J35iDXY7v2GZ7m8VH1eQgAN9E1t9r2NXJTDRjvyZvWlJoA6boId4wpXYyyLgjC/LqfEHwXTNm1t+Jvw4Bu6Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=PrxA09Vw; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="PrxA09Vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail3; t=1791743315; x=1792002515;
	bh=47Ien8+5jycXxhN8nifC6j89S5IpZIIT4rkjaYPhcwc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PrxA09VwuLL8ALC9yg/UD68KWzvHtT5BHFMnh1FfcIaPy1UQlZYM5c/yLND4AoHQE
	 EvOyvo1fYELPov4SKIk1c1d7URMmpjF2Mfl1xqWUjJz4yOquA/zq2sP8fkZv0RSFyP
	 Tdk18sJz3kgW4xThg6E/i85YsbevahwM1zvL7meW5zCTfN2Pk6Ib+7ai6qVTU4ucLH
	 vQNZW9Ywpyi7Eq59q7clvWOSrLlau4YJDuZwvturGjzDFtiKzZ3gN9tnEW12oJ4Hsc
	 akAGo9PM8lGvehvt47tKlXqea6rKeGp7OTXJuJDUXH2OPT/QFQv1MlPFRVDbPDC2C1
	 v8qhy0msG9PnA==
Date: Sun, 11 Oct 2026 18:28:30 +0000
To: Liviu Nicoara <lnicoara@thinkoid.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera
Message-ID: <b53444dd-c273-4d92-9502-046978303d47@vinarskis.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: e4a5dfe10b839fc8e547879355edf715897a40e1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 9/26/26 14:25, Liviu Nicoara wrote:
> Describe the OV02C10 front camera on CCI1 bus 1 at 0x36, fed by MCLK4
> at 19.2 MHz into CSIPHY4 over two D-PHY lanes at 400 MHz, the only
> link frequency the ov02c10 driver offers.
>
> The wiring comes from the Windows driver store. CAMF_RES_QRD.bin
> switches a single rail, GPIO 91, before releasing reset on GPIO 237;
> GPIOs 235 and 236 are muxed to aon_cci there, the CCI1 bus 1 pins, not
> rail enables. No camera resource file votes a PMIC rail for the
> sensor, so avdd and dvdd are left out and fall to dummy regulators.
> The CSI PHY file votes LDO1_C at 1.2 V and LDO2_C at 0.88 V for the
> PHYs, which is vdda-1p2 and vdda-0p9 here, as on the Inspiron 14 Plus.
> MCLK drive strength is 2 mA, as CAMP_RES_QRD.bin programs GPIO 100,
> and tested streaming.
>
> The module sits upside down in the lid: with both sensor flips on, the
> picture is upright and unmirrored, so rotation is 180.
>
> The white camera indicator on GPIO 110 becomes the sensor's privacy LED,
> so the V4L2 core lights it while the sensor streams and takes it away
> from sysfs; the comment waiting for a "camera on" trigger goes, and
> panic-indicator stays, as on the X13s.
>
> Assisted-by: LLM
> Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
> ---

Great to see a follow up!

The initial patch for camera from Laurentiu Tudor that Abel was referring t=
o
was never submitted upstream, as it depends on CAMSS PHY and DT camera
series which are trying to find their way upstream for over a year now.

For reference, it can be found here:
https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/d79e44083197b263ee59=
dc3521a2b16ad2a12bd8

Either way very nice to see someone following up to have it upstreamed.


> v3: add the Signed-off-by missing from v2; no other change.
>
> v2:
> - Drop the dependency paragraph from the commit message (Abel).
> - Say in the message that panic-indicator stays, as on the X13s.
> No change to the DT.
>
> v2: https://lore.kernel.org/all/20260926122032.4847-1-lnicoara@thinkoid.o=
rg/
> v1: https://lore.kernel.org/all/20260925181024.20352-1-lnicoara@thinkoid.=
org/
>
> Depends on the x1e80100 camera DT series, v7:
> https://lore.kernel.org/all/20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb3=
5838b@linaro.org/
> and on the CAMSS PHY API series, v20 patches 5/6 and 6/6, which read the
> CAMSS endpoint's data-lanes as 1-based:
> https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100=
-camss-v20-0-dc244e124e71@linaro.org/
>
> Built and checked (dtbs_check, W=3D1) on next-20260925 with the DT series
> applied. Run-tested on 7.2.6 with the same board hunks, the CSI2 PHY
> driver v18, the PHY API series v20 and patches 1-4 of the DT series:
> the sensor streams at 30 fps through libcamera's software ISP, and the
> privacy LED lights while it streams and goes out after.
>
> Bryan, happy for you to fold this into your next version of the DT
> series if that is easier.
>
>   .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 120 +++++++++++++++++-
>   1 file changed, 118 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index ad62350ba670..73f06fdcd138 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -10,6 +10,8 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  =20
>   #include "hamoa.dtsi"
> @@ -46,14 +48,13 @@ leds {
>   =09=09pinctrl-names =3D "default";
>   =09=09pinctrl-0 =3D <&cam_indicator_en>;
>  =20
> -=09=09led-camera-indicator {
> +=09=09privacy_led: led-camera-indicator {
>   =09=09=09label =3D "white:camera-indicator";
>   =09=09=09function =3D LED_FUNCTION_INDICATOR;
>   =09=09=09color =3D <LED_COLOR_ID_WHITE>;
>   =09=09=09gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   =09=09=09linux,default-trigger =3D "none";
>   =09=09=09default-state =3D "off";
> -=09=09=09/* Reuse as a panic indicator until we get a "camera on" trigge=
r */
>   =09=09=09panic-indicator;
>   =09=09};
>   =09};
> @@ -151,6 +152,25 @@ linux,cma {
>   =09=09};
>   =09};
>  =20
> +=09/*
> +=09 * The one rail Windows switches for the front camera
> +=09 * (CAMF_RES_QRD.bin: TLMM 91 high before reset release), the 1.8 V
> +=09 * LDO enable on the sibling thena boards.
> +=09 */

Just an FYI: CAMF_RES_QRD.bin is an AeoB file. Some time ago I made a=20
repo to
keep a list of already de-compiled files for other developers to use,=20
might come
handy. Here is one for Dell XPS 13 9345' front camera:

https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/dell-xps-9345/=
CAMF_RES_QRD.json#L245-L257

IMO this comment can be dropped.

> +=09vreg_cam_1p8: regulator-cam-1p8 {
> +=09=09compatible =3D "regulator-fixed";
> +
> +=09=09regulator-name =3D "VREG_CAM_1P8";
> +=09=09regulator-min-microvolt =3D <1800000>;
> +=09=09regulator-max-microvolt =3D <1800000>;
> +
> +=09=09gpio =3D <&tlmm 91 GPIO_ACTIVE_HIGH>;
> +=09=09enable-active-high;
> +
> +=09=09pinctrl-0 =3D <&cam_ldo_en>;
> +=09=09pinctrl-names =3D "default";
> +=09};
> +
>   =09vreg_edp_3p3: regulator-edp-3p3 {
>   =09=09compatible =3D "regulator-fixed";
>  =20
> @@ -674,6 +694,78 @@ vreg_l3j_0p8: ldo3 {
>   =09};
>   };
>  =20
> +&camss {
> +=09status =3D "okay";
> +};
> +
> +&camss_csiphy4_in_port {
> +=09camss_csiphy4_inep: endpoint {
> +=09=09data-lanes =3D <1 2>;
> +=09=09remote-endpoint =3D <&csiphy4_out_ep>;
> +=09};
> +};
> +
> +&cci1 {
> +=09status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +=09camera@36 {
> +=09=09compatible =3D "ovti,ov02c10";
> +=09=09reg =3D <0x36>;
> +
> +=09=09reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +=09=09pinctrl-0 =3D <&cam_rgb_default>;
> +=09=09pinctrl-names =3D "default";
> +
> +=09=09clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +=09=09assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +=09=09assigned-clock-rates =3D <19200000>;
> +
> +=09=09orientation =3D <MEDIA_ORIENTATION_FRONT>;
> +=09=09/* upside down in the lid; both sensor flips give an upright, unmi=
rrored image */
> +=09=09rotation =3D <180>;
> +
> +=09=09leds =3D <&privacy_led>;
> +=09=09led-names =3D "privacy";
> +
> +=09=09/*
> +=09=09 * Windows switches no rail for avdd or dvdd, only GPIO 91; they
> +=09=09 * are left to dummy regulators rather than invented.
> +=09=09 */
> +=09=09dovdd-supply =3D <&vreg_cam_1p8>;

Windows may only be switching one rail, however there in fact a 2v8 rail=20
provided by LDO 7B.
You can find it in:
* Tudor's patch linked above
* Device's schematics

I would recommend to add it.

Regards,
Alex

> +
> +=09=09port {
> +=09=09=09ov02c10_ep: endpoint {
> +=09=09=09=09data-lanes =3D <1 2>;
> +=09=09=09=09link-frequencies =3D /bits/ 64 <400000000>;
> +=09=09=09=09remote-endpoint =3D <&csiphy4_in_ep>;
> +=09=09=09};
> +=09=09};
> +=09};
> +};
> +
> +&csiphy4 {
> +=09vdda-0p9-supply =3D <&vreg_l2c_0p8>;
> +=09vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +=09status =3D "okay";
> +};
> +
> +&csiphy4_in_port {
> +=09csiphy4_in_ep: endpoint {
> +=09=09bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +=09=09data-lanes =3D <1 2>;
> +=09=09remote-endpoint =3D <&ov02c10_ep>;
> +=09};
> +};
> +
> +&csiphy4_out_port {
> +=09csiphy4_out_ep: endpoint {
> +=09=09remote-endpoint =3D <&camss_csiphy4_inep>;
> +=09};
> +};
> +
>   &gpu {
>   =09status =3D "okay";
>   };
> @@ -1102,6 +1194,30 @@ cam_indicator_en: cam-indicator-en-state {
>   =09=09bias-disable;
>   =09};
>  =20
> +=09cam_ldo_en: cam-ldo-en-state {
> +=09=09pins =3D "gpio91";
> +=09=09function =3D "gpio";
> +=09=09drive-strength =3D <2>;
> +=09=09bias-disable;
> +=09};
> +
> +=09cam_rgb_default: cam-rgb-default-state {
> +=09=09/* 2 mA streams; the sibling X1E boards use 16 */
> +=09=09mclk-pins {
> +=09=09=09pins =3D "gpio100";
> +=09=09=09function =3D "cam_aon";
> +=09=09=09drive-strength =3D <2>;
> +=09=09=09bias-disable;
> +=09=09};
> +
> +=09=09reset-n-pins {
> +=09=09=09pins =3D "gpio237";
> +=09=09=09function =3D "gpio";
> +=09=09=09drive-strength =3D <2>;
> +=09=09=09bias-disable;
> +=09=09};
> +=09};
> +
>   =09edp_bl_en: edp-bl-en-state {
>   =09=09pins =3D "gpio74";
>   =09=09function =3D "gpio";
>
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
> prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
> prerequisite-patch-id: a12186bafac9b287c19fd719aeceb8ff1372dfbf
> prerequisite-patch-id: 4bc923fa59ee4c1ff68e64497f11e937c0ab3918
> prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
> prerequisite-patch-id: 8cde6fd860c857dd7f3efce25970c88c783193b3
> prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
> prerequisite-patch-id: edb32e32f2b6be0b93f66d8da460c9f9de0c52e2
> prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
> prerequisite-patch-id: 348caa9cd0d1d70f181a47b40e2d75e8b25b5938
> prerequisite-patch-id: 1c4e4c457d8f95d8f5aaa2d93976c374b8282bf0
> prerequisite-patch-id: deedbed2643ca8a0f26bd87175d787d2f0c87417

