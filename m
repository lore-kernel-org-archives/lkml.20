Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400096;
	b=mlWbSrA1laWrLrA+FOdjAq4j2HAoAcw4xyV36bUErAfkWAPShNG+M3oVj+VIMXh/ZCpa
	 UE6DshqJ0nwq91/tFDxK7oPnjkc8B7JhUhVoWCvPmQFQkz+IZMVeBf8NpsheVcYL6sRqU
	 A9jOX+Xo8slZDmJ8ipCEA2mGqMeREzjIgg8is3kr1i9THnVQkYfdjMAUM/Oj+PFmgwMiN
	 SyXINZiLh8tC1My3ipO9fpp8ch9l7IUpRem/2P2BQi32MLYSDTFpyNWzO736C/2OdBQMh
	 hOzms13Cpo60u5tZh2jEAaK/HkfrxrGzcXM7cQwNHgT8HeL2gtkseEdBLrHTv52xrAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400096;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7JfbwZDY/PzYUnN9HFovfRYf02htsuj9qVvuTl/ilY0=;
	b=OJTMfnBKEHIPcO7BElsuia/TD8Mk168HlI0iTDryHSuOAE29WY1CsXlFO2FUGw6ZBDYw
	 fuDyuCaVaERrMJdx5Pu9N7Ip0Vzu1CbIudMagOyyyhPZYPGTeFy/AuPbggewBiCiHbCIK
	 ja60xdeKi2pS8MokkPvxRkYh30HltcUDqdonJTqJKUrf7ZaIe1z8KPp5QVBiVqfdIqtnz
	 8pkanwQoB9fnb2trCSsEfv3v9bR2Qo3IVYMPdnWSEUwuQhrOxSXAhGj76gDu8lFYb4irL
	 Stl+W1NRZo7DPJkOlIdfi0IdnEGEbS/kTDak8EUNh/WVQ1CFyq+xMkhIUNinTV2b9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="pCr0YfG/";
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781C606A33B;
	Fri, 30 Oct 2026 22:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1781C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=pCr0YfG/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400094; x=1793659294;
	bh=7JfbwZDY/PzYUnN9HFovfRYf02htsuj9qVvuTl/ilY0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pCr0YfG/9L55/+0SkQFgzGddTDrK4daTimev58q/1uRaUPHX1kulRs4WJD5foIe+7
	 mll+eWnyEvlqUiKrcM/QHOX67zSElBMPAfYb6EhVf6EyOIn2nlG878rMvZYqc0e7Fo
	 gWn5sftc7G7yMI7xh76S+HsR84VsPFyA/PsTwuxzTqeCb4NmwtpVS+4zgK4o3q79Fd
	 0ClsVQe9bh6m4+n6lR+a5i+MJYAKkxIM3l4UYd1qTclHQHDtvs4ACrOA/tldQqBSe2
	 WtBQmnHLMT1c+XkIQA9p/RZkSGjQavqzY72g8IlGYdzg5SEoDOf92q/rdMYYgE6WMf
	 5MGMfkKXVV6CQ==
Date: Fri, 30 Oct 2026 22:41:29 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA properties
Message-ID: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 4df621b4a0e8c1c3c3112fa96e712fd8f46a7650
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

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 3 ---
 arch/arm64/boot/dts/qcom/milos.dtsi              | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index acdcd3fa85dc..5c4581410a40 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -764,9 +764,6 @@ vibrator@5a {
=20
 &ipa {
 =09firmware-name =3D "qcom/milos/fairphone/fp6/ipa_fws.mbn";
-=09memory-region =3D <&ipa_fw_mem>;
-
-=09qcom,gsi-loader =3D "self";
=20
 =09status =3D "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index ed994c2170af..5f1ccfaf992f 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2028,6 +2028,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 =09=09=09qcom,smem-state-names =3D "ipa-clock-enabled-valid",
 =09=09=09=09=09=09"ipa-clock-enabled";
=20
+=09=09=09qcom,gsi-loader =3D "self";
+=09=09=09memory-region =3D <&ipa_fw_mem>;
+
 =09=09=09sram =3D <&ipa_modem_tables>;
=20
 =09=09=09status =3D "disabled";

--=20
2.55.0


