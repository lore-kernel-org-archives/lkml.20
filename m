Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250243DEDD;
	Thu,  1 Oct 2026 05:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833906; cv=none; b=h/1JitS5c4/NQHPt8PuzYaglsENisPCxYLcW2nhkIxvjTrV3pCr6/3kNcpeCQnDdcFYqSobENXGYb+AY0QaptXuwpcBbOwlzG9umApC7JMoAYg6+JcyygbETzKrroN6qA0RjauWvpZjQl5Zf8T8+WBKt4AF+tg+yc6u2at5Y0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833906; c=relaxed/simple;
	bh=ZtQlQY45zN+rVtOPNRS0eX5m2++6ZQ3IL1dSpMjH7y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDOl8MjVZk4eq4IKCMPfne5w7jHFby7zg1VSQ8aAJywT2/4k96be2ZEiaCSHrT06tAuXk9PEtIHNOZAKU/YK7XT5rXAwaaXflW32SwkSLkAvZg2bHQYU9eMxbtNYfHMYss1evyPXLkhS4x19085Bz/2fNWPmouTLN9sDvM4aon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=cQaiqDPi; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yhRIj5QY; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="cQaiqDPi";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yhRIj5QY"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833900; bh=dcznp3hnhyXVSEbGYEza3Et
	ACiXYGe8WRHcxX1n4C6I=; b=cQaiqDPisWsZG1UyGsWFlPEIq9gnVmwhJ1qPEK6YLXqUrzVZzq
	RVpglZTm8eQV8wU9KnwCnbABLzmgj7O5X6G84eLdZ1uNaTTHPv5ulVe9HUmV6jPyayztrKZm1VZ
	k3Zbhg1M17ZtAkiDQ2bIIm1hQ1YGEG2m9R0T8uICBJakJ8ZHPVrlydoErO3asAZeoVHHRBJoMfv
	3DXPMxovj0yFhKhgBvz8bjHmwi3ZruUup6JDeOxzGG8tOLozLZCIfdXL7647J5Zi82O0kIDrXPR
	bkKD08Na2e/gxONIB6rPHLoYBKho5p4uprhqoPyeE3ck/+YniT8rVcenMCXIl16HITA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833900; bh=dcznp3hnhyXVSEbGYEza3Et
	ACiXYGe8WRHcxX1n4C6I=; b=yhRIj5QYIl2Omh6uSQqOwP/QCEQV8rTxGLLIYuZLuBUy3MdM+s
	lAZZDC0nDPjT7NhSU5ddhvQzt2kNo/c3QIAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 01 Oct 2026 07:51:38 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: msm8917: change prng compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261001-prng-fix-v1-1-72f924527465@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790833899; l=910;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZtQlQY45zN+rVtOPNRS0eX5m2++6ZQ3IL1dSpMjH7y8=;
 b=ruFXKfZgc+xFTmJmfIjtBZ6rqfxNozVhBAashhqrCoOsE72ra2IJiquYITv9/txvhRhMA26mG
 wQUhs45fqo/DK+EMh69y0DsaLFh+gfIfADS5ASIZdi/KJ6NIAewwuBR
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8917 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: 7f18b1ea7987 ("arm64: dts: qcom: Add initial support for MSM8917")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a6376..ca647efc883f 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -610,7 +610,7 @@ tsens_s10_p2: s10-p2@232 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.0

