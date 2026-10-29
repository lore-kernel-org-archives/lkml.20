Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313243;
	b=LuWYE1Apeb6QWNyZHiSlluhxUERYBe4pOvFjrHniL2oBF/xz3jW8lW7LqrU0Sud+9OW2
	 SJg1e3ttoQvqR2S0sbDYgaUTwmbYsentDXZhcqYWF2j7BQG2Cs9HNMYL87FJumb91jkIX
	 FbKMsx0xgAgrlQOZdnol/wTnCKYo54IqKpxMC1BOzKcCCXrFPgNQCLa2yZW/trg2h/9VR
	 ABobb+09pRS51UB3iJhj/geaf178EP7X68dEi+Jf34g3QUJ+APK4ZRobkVTfjR4iE962V
	 Nu/b1W63qoZiaQpxm4/qVXFemyVi4rq5NC/5wY42QOy4oS9Dmn0hmYKD1uk4oKqOqlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313243;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XMjBMajdlFwCBglQa6I56ZbNV6DFrnDlTHlh3wXuUqE=;
	b=F22BVqkOBKc04WA3ADNvY0hDVbcQyJr0/teHOXlnDRYQaGFDMj33z2ExfEdAOwuAyvG/
	 Gl2/IQIZPXP+Anfax60HNLT7YfHyTrekcP4y+7bBMymL+ADcGOavtrSQMR+7hJS+hbU8j
	 we43He9IZ4+i9/OO+WHHN+452Lu8m80xizvkv73XmtdmCj4MZDUWjhbg2J7Kxiul3D4ay
	 VV3uCpLVq5f/f489EzO6E0RMO2MlkDc4UNCk4cIUKLTSCPsVf09UaDSC6/gkOVIVFs9RX
	 TLnCl1yqDCNYCP3tM4gaX6JVKq+moawRemlUG9MTBGBFV49Bhm2uVwklbbRdUU2Zbvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GxBFn6+6;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=GxBFn6+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313240; x=1793572440;
	bh=XMjBMajdlFwCBglQa6I56ZbNV6DFrnDlTHlh3wXuUqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GxBFn6+60/yeza8+nXMimOC2wS2nrPTAobaqLMD9LmOVCqcdCG5NfrhvzzvD387B9
	 um7nuN+uSIjGmVfHks4hbGWmD+s/AWiaOp4nEMM6eSKiE2bwV6bVg94W7RvI4gpXGf
	 NdHUhkx2gYIZf3dfA5K4JsL1d7GHyYbiTaTnWRjIP5CpbCJwcvpRs5Ie1uqZbGnpzr
	 ivelACwcpPQ33fowgnO7efxu20fQFwGF05iS0MkDEKQJPmVD/U/nH/EYF0SgE/+l5M
	 upgsPJtvhPjkC0Q8LnDL4RRj9Gd8F6xTE1tVUmYxGYRfQU+B5pQENqrQsfW3oe1aIS
	 dpMN755eov6fw==
Date: Thu, 29 Oct 2026 22:33:56 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
Message-ID: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
In-Reply-To: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6df0dd322fb7f14a37c143dcf1fbccb64795d8ad
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

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 7d8afe8e95d5..af115295a20d 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -880,6 +880,15 @@ fsa4480_sbu_mux: endpoint {
 =09};
 };
=20
+&ipa {
+=09firmware-name =3D "qcom/milos/nothing/asteroids/ipa_fws.mbn";
+=09memory-region =3D <&ipa_fw_mem>;
+
+=09qcom,gsi-loader =3D "self";
+
+=09status =3D "okay";
+};
+
 &pm7550_flash {
 =09status =3D "okay";
=20

--=20
2.55.0


