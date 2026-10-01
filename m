Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E43B3891;
	Thu,  1 Oct 2026 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833924; cv=none; b=ofiGN6jdC0ADDBW0YgUwHl6htMKqMJYO8gR2/Gt82E5sOjjdrIMhMxHe1rVZG50Q0qbk2ZXTGmGhg18D2RD+iUUST3ts6ibnCmsZ1Pf7EkZXT5QgF9bB4jnFpwCHc2Gzpjciaxw5ImhCN4qvjt67kyMs+ex1XVVvM4Uj+9GWr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833924; c=relaxed/simple;
	bh=obrsEtepa7uP5Kmdp1k8ipjS/LykTrXMkDP+jIYlm8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OppAbA+Ue49+esGxGBVeHm1SGrRDia3mm0ks2nAphKOfYxIM1J44P6UGI0WifDOpI54LzAwEuZmFdDGTaRJBQBEjaR7AB6LW1cnXdP9v5LEPLOw3Nuvp8uUT3saCwrVExHUOvCPxvHbxIzZFGhrtfwrkg77gqLVO+l0iGjZJooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=D5Cv2Iax; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NZzYyAK/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="D5Cv2Iax";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NZzYyAK/"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833901; bh=rx6lYOt2a0GVtVX5usNrqOe
	rpP5US08LN5kesRHVLu8=; b=D5Cv2IaxXl31ImPybjmuvk7UUymWbdZJyjZr1rpUfUIuIBCg1D
	i9KEWZerhlbx2VHVvnJAUnOGxk4BStZrzjOIaF2CKvg3MjPuze7Z4KOPp9MpZmzkkyk01mteALt
	f5K4LE0FWevRoAGbblJiNRbQa4GRv/jm5Md+3anD2R6iOrhU3QZ1kpYObAS4MV1RDc6TlThKac7
	MCZkBgYkftxjCX73gE7jMQyoFt/RXmycHuCucfokiXUOt8684hBVg/iMBrje/mgzEGRWfeuGMtk
	dUvt9nZUoi890xAVP8h+A8SkQA6T9n91RJ2ClgWlmGOjq8xtvTCMOSFGwTH24z6XaGg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790833901; bh=rx6lYOt2a0GVtVX5usNrqOe
	rpP5US08LN5kesRHVLu8=; b=NZzYyAK/k/xgxjp3rQuf9bqyTf35XQl+AhqeTSTHBgihQdUwVv
	FfiKxrP/ZqffXzz32RQnHBEhp9p+woA0q8Cw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 01 Oct 2026 07:51:39 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: msm8937: change prng compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261001-prng-fix-v1-2-72f924527465@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790833899; l=907;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=obrsEtepa7uP5Kmdp1k8ipjS/LykTrXMkDP+jIYlm8E=;
 b=jsYBD8OJAGWE72mOO8mMtCysnqHgC4nPGYdeY8opAnTN/0CkDsZMh8IBm+VfP21DKfE6nme0k
 xG5ZTwnAqYfCD1Ufc1cKKo44tJKgVBxiFKmDD9DMhWPCKc700b/INKV
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8937 HW QRNG is configured by TZ. qcom-rng driver
will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Fixes: a829f6f2e8a7 ("arm64: dts: qcom: Add initial support for MSM8937")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de48f..73909d6179c3 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -653,7 +653,7 @@ usb_hs_phy: phy@6c000 {
 		};
 
 		rng@e3000 {
-			compatible = "qcom,prng";
+			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";

-- 
2.56.0

