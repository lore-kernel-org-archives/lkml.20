Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400109;
	b=dtixStNPZwr+Hf0DZd/zrgzdEN9+ZfiX6h95WbBkx+lsll5cE7Ajd/1FFRhTt95BhosY
	 3pdxLLBC4fgMIgZGGoLszbvbRb+vTcNl1TZsqaxUwZg8ayYtVafS/npfi3FrdgO1zS5ls
	 7o4Zm1wlCpUGTdRMOsBIXhLCbtzNZeBzvVvPOJS2qQQXOfWzoYCZtK5o0uehM8v0TQh5O
	 noFTbCeErzuutYbMNTGcM7y55PZtB1GJctw/mmAfL32g/EI/Kio5twJtFL58zXSqyVMTe
	 an9jyz1U4QuRYWWx93vHpJI9YukZjbbC7lptck6LTZR03ojeVBhMwZH4oxejA7tQkcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400109;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JpR/85rT4iXiGLeK70Ktb9RoMSPDhVzaKxPIt3ZCZ0A=;
	b=fJVnIV9okZd9B7D/Ny+HqwtJybrVkSVitw1BnWfFpIAxV4mzWkV4GC/EB1VfSzp0M7LW
	 +Y2T9xue9LaC+xla+Q1LSXqAtK9+VByhLKds6SLn8cVFGI3hL8soJBy74syApWO5Cx+5l
	 tuIM8ZrbhXYPDqTHHd3RvN8FaMz7UEtXkRRu75vWg0dXykeyQaNYVU8ideGrDyBmou6/G
	 vpzFgaJ8jK3tb9XnZwieu9eMzsVR2eDSwnd7TbexDhdachX86nay1VxSltHSwAudL4YU1
	 AQSv1nWn8fPUGTwHQ+Vqqi6Lbwu+xWInhCmlGLu0ni9HfrYK+zmwBCZRb9NfucLZYBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FsQFJPPs;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBC606A31E;
	Fri, 30 Oct 2026 22:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=FsQFJPPs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400106; x=1793659306;
	bh=JpR/85rT4iXiGLeK70Ktb9RoMSPDhVzaKxPIt3ZCZ0A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FsQFJPPsW/KX6NkrgxiiDX+daN7mKNBI9PGoltjOEaOaUKksRmiXmIH0QdEONlCf5
	 2+fOyjTPQuUfSKTfZm0Js+Zi5XtUQKmCAXhbhxdNhUmz/+24eCoYGjTGkDxuQK1Vyc
	 bCju2fb8SXeRNQ+fVmieGTishPgcbt+DGmiMxs4CUkdp4nEAQ8wS9amhntjKwNcwBq
	 9hjxYQozxdjNPwuFbCBKZzNYzTFzQ0cOzZ11dsfE/d1/ePeCqhw0y/baSXr7wZBx8J
	 /xlj5DaSu4kLt2XBBtXY/go1dMPtpiJcXWJmsEowIFvsiL83TOyF81G95Nc4ltklXM
	 mo8OfE3JMavkw==
Date: Fri, 30 Oct 2026 22:41:42 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
Message-ID: <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 92f60f461b90e5c98efcae50ed030c37f02f44d4
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

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 19 ++++++++++++++++=
++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index b2838d2d3d98..79092213c253 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -141,7 +141,7 @@ wcn6750-pmu {
=20
 =09=09clocks =3D <&rpmhcc RPMH_RF_CLK1>;
=20
-=09=09pinctrl-0 =3D <&bluetooth_enable_default>;
+=09=09pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
 =09=09pinctrl-names =3D "default";
=20
 =09=09regulators {
@@ -916,6 +916,17 @@ &pmiv0104_eusb2_repeater {
 =09qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
 };
=20
+&pmk8550_gpios {
+=09pmk8550_sleep_clk_default: sleep-clk-default-state {
+=09=09pins =3D "gpio5";
+=09=09function =3D PMIC_GPIO_FUNC_FUNC1;
+=09=09input-disable;
+=09=09output-enable;
+=09=09bias-disable;
+=09=09power-source =3D <0>;
+=09};
+};
+
 &pmr735b_gpios {
 =09s1j_enable_default: s1j-enable-default-state {
 =09=09pins =3D "gpio1";
@@ -1140,3 +1151,9 @@ &usb_1_hsphy {
=20
 =09status =3D "okay";
 };
+
+&wifi {
+=09qcom,calibration-variant =3D "Nothing_Phone_3a";
+
+=09status =3D "okay";
+};

--=20
2.55.0


