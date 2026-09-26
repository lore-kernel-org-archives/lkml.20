Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1CE47A87A;
	Sat, 26 Sep 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431296; cv=none; b=a7J/6RJxjFEx8HwATbtGj1WSCgzA8570/Kh7r74AmJ6MT/B7suzo4q1bDh+OgMRJAsZ67lqKU8ot+73s6vHhn30rtzmUTMWeav/P09/Rjh+PjUnocOZF7Hg/KEoPyvX0dfm1QTGSsPepUuVPVwgRnmNJdJ2CbxFCDsWBMSrARQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431296; c=relaxed/simple;
	bh=qQUIHhKBO/tEtR1HaQ3f9rkS9xI6r0srSNjHW1sYRsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=po3ak0Mwyi40Okc91FhsIEUqTGa7fBw/xbSa7MVZWbuzDkC+QQVb7E/LUg9hodvBaoTGegsIf8Uz/AbAjGtBwqExlUfWHTYwO0Dcvgx1D3g7n4AVPkaB1qIXXWvvjN2DUoZaBYPcjEYbyWirKaapJAdPqxKIUOlVCHd6bTbPYFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=5+s05xVg; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=B5v8Tksx; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="5+s05xVg";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="B5v8Tksx"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431256; bh=8pv9T7LZK+v2vYBachbzhcd
	FeZ+/Et9QVTzmQAU0NLY=; b=5+s05xVgzRkHHgJwbxZ/ekDehrARQ49WIawTN855UtPcRgglMH
	xIXzKHDseTrRHDyfRsNdoht4bzRJ0WjJwZDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431256; bh=8pv9T7LZK+v2vYBachbzhcd
	FeZ+/Et9QVTzmQAU0NLY=; b=B5v8Tksxt2bL3RsC1eqcJ/BJSrnEvD2zgKvrLanAsVFEVM7Kcp
	/nFMub5rmUlKYyfbB5oCLPDFtcd5yo2PmqSrfNKXNCt6pmGz0+zaIb9zbZBuLs6NwZNvONV8kdZ
	p88UL3/RRbM6pre4bxy/vFYmBYXPbluDDEimLacvRZY0QiRoU8Vv5sZEaUv1ZWNeAMjCsRd707H
	MAWoLQDnZYszEKPtd5gpJuZhykZtgMx8aJaEUt4oPP8ijb/QEcFKsAKH+pmUOncuJ+PaCbAecPO
	gQp5nkR4zBUz1WjwvZ18ur7dOH2VOXMYHHSV2Zj3GyVODMJxsMvbxWN9YqviyiPImaw==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 16:00:55 +0200
Subject: [PATCH v2 6/8] arm64: dts: qcom: sm6350-lena: Enable wifi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v2-6-b4612e3eb536@erebion.eu>
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790431254; l=856;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=qQUIHhKBO/tEtR1HaQ3f9rkS9xI6r0srSNjHW1sYRsA=;
 b=Ny3B5ZkR/DMy2w4o1VgFmT9X3AIAKm3+dPTglM1yAt4Zhh5C9Yo8dS5SByNh+yzGSxsunArBy
 bGEJAdeqn8pBPYKnkHbDRwi+3roRgS2a/T0aeNeM1R7hTU865YERanV
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure regulators and enable it for the Xperia 10 III

Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 9be0e7ceccb55..b234919c301f0 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -559,3 +559,13 @@ &usb_1_qmpphy {
 
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


