Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A349434991;
	Thu,  1 Oct 2026 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833923; cv=none; b=KzlmP+Q+mxbzYq3d27uchCbI7QWz3D510RL63p9MUomLRU1ZhsVZai/0sE6rEimzspfZnEkoAmr+fM328wOh1TkI8OucShI3Y3/jnbOR6S2fpDWr6s1AcXCwiFY5AIWFyYUgzJ/dN1p0diV1TEpd1Bb1ooQOGRCEAVncaYvCXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833923; c=relaxed/simple;
	bh=TPTaSAt1pUieHAQqgCf/NQNWlQC/6rdA0i3BHm9fIJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sQEhAkDRRwJy6mkXPyMvNZ4rPRpVzSk2SKoYDGNiGcylM+Yp8Nr7KROfB62JHtB0pf3i8GqwdDqlT5hcPpNEy6A/GLdXPcA43BpRngZw82Hm5y/63xOmPIg1Y96ahhO/NSaqaaQe6fU3WDQTww1+Me2kyjQc5mX60E4JVu9qdeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=h3vRrJ10; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MknIhSw4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="h3vRrJ10";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MknIhSw4"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833902; bh=iDNs80Bq+W9JGZq8tbrtfgo
	dc4aIKlwiJU2OAx7v3k0=; b=h3vRrJ104jJX1Ah5c8yXL8SILH0TfXpZzQ3Gwsz5i6WSfVGGS0
	RXJJd3gbeLsvL+m6oNsaKh52AI31jFoxhGZpDfVADvFtD2ERkmFnzNnbP2/h+rw+zf/BvrqzDGj
	vT050uPIX7b1H8q2zRur78q5BSzAqyZ5kFdVNeIBMR0pFLK+36kxDOMKDwZYGBXOjiLgoFktP+W
	EZUOAAJYW3Kh30Pn2YCzpx0qprm1uo4q/CluHJvqiccLBc/yRjFwxbLSO+rTa1k+p9+4S89r49F
	tT2iq7PsgsOMLMM6Gv0vxc2UxD7aVapmjrqVc/nkNqbgU+KMm6gktEHQ3MMjxlLeBwA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833902; bh=iDNs80Bq+W9JGZq8tbrtfgo
	dc4aIKlwiJU2OAx7v3k0=; b=MknIhSw4KSOeZuA8LHAaseV7UzXEcOM0gIO9xi9NVxaYkxXc7q
	TRYOONMVrTlaKp8VSY8Pu69DXlEakOsrzMBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 01 Oct 2026 07:51:40 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8953: change prng compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261001-prng-fix-v1-3-72f924527465@mainlining.org>
References: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
In-Reply-To: <20261001-prng-fix-v1-0-72f924527465@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Dang Huynh <danct12@riseup.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790833899; l=898;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=TPTaSAt1pUieHAQqgCf/NQNWlQC/6rdA0i3BHm9fIJQ=;
 b=XyC7GgsxZjTUdFZLJXv3cxrvBekgdW2/gM988eIporEBRxyy24T2/5igxuqpIYZChstdixd8K
 6E1pa6Rc7uXDjkmrh0t6u5cmgExObqzVYzHfcIGk8zY9ocK+OfDoaTk
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8953 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: 9fb08c801923 ("arm64: dts: qcom: Add MSM8953 device tree")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 753167c3f861..99a1bca8e13a 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -483,7 +483,7 @@ hsusb_phy: phy@79000 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.0

