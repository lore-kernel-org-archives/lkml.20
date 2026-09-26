Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA83E3C53;
	Sat, 26 Sep 2026 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418041; cv=none; b=g1Res9eIKnY338j1j2S+1hYg0dyk7612OjVmBqAeHub2QNoOvoSCUXoloKpNRXlddRUmqUDIDY/V6ZYBfQt+onhvBpY0I2IBgOo+e7xeEly3kOtP/1CKi6tXWKfg0ts9HlxoXrYpWXNVBnuzd0K4e/LGWHWAoBrrA9RS7YwN/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418041; c=relaxed/simple;
	bh=CnqCI9zUx2Ih3eXynf8+h7IC3SYJGKIYqpd59BtClw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIe0JK8SjuE4P9ELvbLdwCDF7RBodJO3OIXu5nbz6S7oDkeZlCnfRlEJdlJs4o6vrQJAzBxUEnlph5l8NKsriNRoiayF6bLC8x4EUxreRnqZZQ6lmD9IGqGomvIzhT4scgErjxLiAYr5e8XHWQlEP1g8mgZvxUgSypmELVBTDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=TmrNEmGE; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=EyVaHDV8; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="TmrNEmGE";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="EyVaHDV8"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418023; bh=hNATm9qyniYwT3x8rwBBwLQ
	QBuNESnvdMPBTzEQjPB0=; b=TmrNEmGEgVqTb2YD6+YQHY4eKPO9MbCYfwIfQBYHwWHrTGY124
	ejQmyYdvyJdXifulb6KT55EHHk99niBm39Bg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418023; bh=hNATm9qyniYwT3x8rwBBwLQ
	QBuNESnvdMPBTzEQjPB0=; b=EyVaHDV8FlEQwawOg7cdjppRCoe2ZZ5RzNDUtTT6et0N6rWpUr
	p0lamn2DTUSPHIDxfFWyYdbhxwO+dVq6NJtgeyTQnacZicI5iG+JxxxXYkvJtyMIuyrfIF3NJ4Y
	PxFZAo3LI7gL6zSPOuVEp12G4+kYb3EvHNQPcJFbzgZVE2w4SuT7jwiG0c5xymiY4yTH9N7Iguv
	vOH0yWKrHJheVDgI1E5/U4Msrt+jLATLyVv1sRhCAnR79X5i4s/ZiIzzjiwo5iN8oL+7Ggrd55H
	Hjufi+8kA+K1rnEBu4mQR99WVV5bT6XmcIDxV5EJtbRSjQVUkw4XqlIBUtx0n0v4vRA==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 12:20:23 +0200
Subject: [PATCH 6/8] arm64: dts: qcom: sm6350-lena: Enable wifi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v1-6-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790418021; l=856;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=CnqCI9zUx2Ih3eXynf8+h7IC3SYJGKIYqpd59BtClw8=;
 b=EoiTFdsGa971WaQXxSF7wxsVtVBuf27E46vgfDsfTMGl6+oAcm85eRsn18n5s8S6i/M6FPCeG
 4iBP1mGVUBTCCWACY3qx4mQldeOKaBcUYoHX2xSTb1697l59jPSym9C
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure regulators and enable it for the Xperia 10 III

Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index cb749cc121abf..7c14360cb1838 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -566,3 +566,13 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6350_l4>;
+	vdd-1.8-xo-supply = <&pm6350_l7>;
+	vdd-1.3-rfa-supply = <&pm6150l_l2>;
+	vdd-3.3-ch0-supply = <&pm6150l_l10>;
+	vdd-3.3-ch1-supply = <&pm6150l_l11>;
+
+	status = "okay";
+};

-- 
2.53.0


