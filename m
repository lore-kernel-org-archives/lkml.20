Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400103;
	b=P3sWsfT2cOYg0GAQRlXhyTK/FiZWedoczG37mq0Ty6vnNceZFguxZKARuJ4ckG8lspjE
	 F2J1t4vEkczQ9RqWOStCQCqqEVbFLUcgLpyDjTp4VEL0Q4vcJQbmOKky6dn2Y+pdhVIkB
	 9nXpQWp5OUk7goZ0O6mF4dWYJ+TZWO7ZNNzYOvfkusv2XecmoGnjgbmj+M/0usP/lcbJ9
	 XFCdXSR3VyyOJ4TWEZN7ICcqlHuo9/GjLLcP97kCNLa9/c2xd2iAPJjCIsugpcZjUJ/9Z
	 XUNWuqd7dFtQwwxC12LhRBnzvM+mkc3KkiHrmJB8wEVYRdPQ/UYUasoTslDtUdgoX6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400103;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=myoLJgThlL9FN4DLt/tkMZKaVhC0YbSYkhkSGlSE5nw=;
	b=rTm97Uz2NAWTpILTtorm6tnL0v+Zm6PviidyL3POgFsWruLv7eHc5spev7Ey9AKdVDxq
	 KGAyldimG7juZJNbbnhALSDF0mexQJk8hyd+gFZVFldidE8tTho4qHbJyn55wfX064vCd
	 RjNDHG8hKndeBqX0w+s1AKVwypHVxGR8xrcGPqQNAcmzvIJ/WoWNfnuwE4tAXGu4GyDnb
	 9iZRJaOjj9APC/JRBT0K4rjyzCFrPZd+XfQaddoUnVWDg1DseOq4fSzkDKmLBeUaS0ySC
	 1gaQaIBLuUyOXqn6o4vHy0J+PEqN8q3feT4/RN/rSKsZLMBrDAqChtB1+j7Lx1Bkbag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=HuypO4+I;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC69606A333;
	Fri, 30 Oct 2026 22:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC69606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=HuypO4+I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793400100; x=1793659300;
	bh=myoLJgThlL9FN4DLt/tkMZKaVhC0YbSYkhkSGlSE5nw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HuypO4+IEpaI46+bKu8Ujsr9YGO8cNsPFfUpPNFT2Hbz21Jg+jd7/1XCeKS2ZXAbW
	 glKANOvF5dZ7qllFxgfYv3osY7s+fx6aWVlvOVNJIyGF4MEPVNddqBPLcWYOG7+Zti
	 hkUC4GRdoxeyu7rza4c1fXHd1/4BUlIYBNwf0LwhzXZOGxECeK2il6x/4pmRw0xKQ8
	 7fwywradnL8WqRwe6g6LEjn7zPcbww9vaWblwY9XSh1Dg7qM9jyCTEOB8oXeUNFpL1
	 g0r+K+iZOZtUwsPFGe8wwqjOwqFom329lwDi7sHiU3XriK2EYQXNglCnkmSGimNRIA
	 f/VsnipNQsvtQ==
Date: Fri, 30 Oct 2026 22:41:33 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
Message-ID: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
In-Reply-To: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2a230af5c45f3240d52bcecf2817c740837afda0
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

Configure and enable the nodes for UFS, so that we can access the
internal storage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 18 ++++++++++++++++=
++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/ar=
m64/boot/dts/qcom/milos-nothing-asteroids.dts
index 787acef4a4c8..fa0cbf78b69a 100644
--- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
+++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
@@ -905,6 +905,24 @@ &uart5 {
 =09status =3D "okay";
 };
=20
+&ufs_mem_hc {
+=09reset-gpios =3D <&tlmm 167 GPIO_ACTIVE_LOW>;
+
+=09vcc-supply =3D <&vreg_l12b>;
+=09vcc-max-microamp =3D <800000>;
+=09vccq2-supply =3D <&vreg_l4f>;
+=09vccq2-max-microamp =3D <750000>;
+
+=09status =3D "okay";
+};
+
+&ufs_mem_phy {
+=09vdda-phy-supply =3D <&vreg_l2b>;
+=09vdda-pll-supply =3D <&vreg_l4b>;
+
+=09status =3D "okay";
+};
+
 &usb_1 {
 =09/* USB 2.0 only, HW does not support USB 3.x */
 =09qcom,select-utmi-as-pipe-clk;

--=20
2.55.0


