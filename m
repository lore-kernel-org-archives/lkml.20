Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818757;
	b=eEiR+9wc8pqBDh8I83km4jws76sFsfVQEX/3oxR25IZo4RYEM/tR06pHnWsIyJ52guJQ
	 aMb/ix/anINwcgHhesaeVU5z7eb3nEMlP1TZ0x51CV4x+rTX9zRHv4OJWVYxOLErrMH7m
	 +1NcL7uBLntCJF3ccXS+PgjzCtLoRMFnDrPDIWh1vkVPRbvOgKjauGGe0tZlVCoD9RMo1
	 CHqTicnhzx3uVgmbMKRLfxrq1rOG+x0snr8dgA8YCHUFmqbJZKZHJRKSVovdbGdjtCzrR
	 O0Kst8IpVjBctYMPTyR2MU58F47vyukDkxfeEs6RavaEQ6OVRtj0iqQQlZS3IFjmPhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818757;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0xmcEkNO7u7/9PKNphOLiy7umGDn2shs9wyqvnz7GwY=;
	b=gL+IYIjMT2NMbRkBNs7tlN3W7XzuONyn4xolyu3ONY+omV3QFYP+XCn3L0Vx3Ww8QsNA
	 1Wo/0MPQTh/ArxFHE/+fypFTJHCdZLvUZ3sec6p95ZTRBBvpTgq4zJ4HRoCVGQn2qNpuv
	 kYZ/ppwYrngnUlVKuzqGQE10XSMMHjv+HRDB6O8yPYhP3ehz2t2W4/pkmNAXeJY6EwmhB
	 GYOUjm6wCnCa1MnkcrIr8R1SqSkSPhFn3fup5MR77nfKgm6FM3udmM27Wck6aPE9sSJMy
	 VxwW1PP8d59R4UVizYnX8rvQHYTBKnvlXSjOXvIiBKdkQ1tFPiXwOT0Ojek+tYK5zWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHWfRpn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5547606A32D;
	Wed,  4 Nov 2026 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHWfRpn5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793818756;
	b=wK75o/8sOUuhQEnYcHTwdBFVOoKKwnvKldpT25Y4pqC4f0BQUt3GXVxki+Vvr86R0srC
	 KqHNdEhV2L79WX7yNEn8L+kmyhJS4sCTsf+0hWx7RAGv5aAtQ4TrZuh8jbnkSpgBbo8FP
	 DPbxJ20xIuxIusEhqvqz36MFAnvL764OZ2TfJNwKPCLVYkLt1mCqgiAq1PMFAfa3uSduc
	 VNEGl7Dyvccj0TfzREECKCeSvKFyvUG4npPVHwdS06nO+lbPHhQTolgztgRm769T8Pd0J
	 BH9Ff3OLCRZcP71aEXLjehV9+Qv2aJ0b5BgUAhwyxONFIar3PcpnXNhkgGL8YEi6u9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793818756;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0xmcEkNO7u7/9PKNphOLiy7umGDn2shs9wyqvnz7GwY=;
	b=wbf8TK/WAFjPKEIMxU0zoT433mHnw1ERanDKMo3Xn8pz2dV1u4zsjKvYJuTz9gPimFWn
	 LLfcduNU7EfmM0XV8a8yAYbeGfJ57+1chIFtBbenBdlB3Aa/eZ1UrfJww+no5dzsu5Fvf
	 QbDftd1n8ld0k8dnbkz+H8RIIRpOvdABagVbHJTaDfVkL0D2OwYL6u7Sh9RxQEJy8nhM+
	 A59yxJCIjHA6p/eljajiKEHDl9Erpj7Cq/MBVcfZU45spxpQ5Yfs8OInLpwlteE+w/p5O
	 m4fGxPCuJ0k5+Fn79X/d59FaLxInurt7eBw11OLczyXHeZqaNZLkgsXsqKisu+kY1jA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22E411F0093A;
	Wed,  4 Nov 2026 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793818756;
	bh=0xmcEkNO7u7/9PKNphOLiy7umGDn2shs9wyqvnz7GwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GHWfRpn546nNtO5oRsCIFDNvHCGSw70X2aAHKgCJHC/YHWTwXKNGpw2hcl2E+nYPf
	 jgy65jIiyIqJIiPVTFNJoaWTsEg430NaMK4Q7A5ZhFBAHMZI8WxxzoTQ1BAYr5Z6au
	 rFz/LoBacdZXWIvrNotXZmtXmxUkGJ1tEQzh3Dhik1w4YUc46K6hftjHOTy2yUfnJh
	 +S+R0i5Gbt3bMWsM3/QyvlTaTWInU9Q8Pm28zIWkxNvR97Ukg0sI0CLGzdkzyF0PyS
	 NvTTEb2a/tgkv0sr8x1lmFLfvKLfkIyjvk1yZtNRym5apBgWeZpijTvTZibkO4iuzw
	 PJO7eAf5Ogf6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 845A446F40;
	Wed,  4 Nov 2026 18:59:15 +0000 (UTC)
From: Asdlerto Korry via B4 Relay <devnull+korryasdlerto.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 20:59:15 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy M52 5G
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-m52xq-dts-v1-1-b198f02912ff@gmail.com>
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
In-Reply-To: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Asdlerto Korry <korryasdlerto@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793818754; l=791;
 i=korryasdlerto@gmail.com; s=20261104; h=from:subject:message-id;
 bh=H56IcYVSNo0wgt3tuO8OiTWa9f7y69coL2KlUgR93oo=;
 b=7ne9EcWarSEtCO5jWlreL4Dpdj69yuj7pbG5P7iQ3DiaS27+sbIOb0sC+cEaKQd2TTJP4HMxQ
 eiLFnCUteAqDdCon8a6mtBDZQshWdqv1O0fcrCWrWBua9PYzlCISgii
X-Developer-Key: i=korryasdlerto@gmail.com; a=ed25519;
 pk=RqttIGkm2XZ8NhLQBzPgpXXawOdVa1uODGsk+sagbxs=
X-Endpoint-Received: by B4 Relay for korryasdlerto@gmail.com/20261104 with
 auth_id=1411
X-Original-From: Asdlerto Korry <korryasdlerto@gmail.com>
Reply-To: korryasdlerto@gmail.com
Content-Transfer-Encoding: 7bit

From: Asdlerto Korry <korryasdlerto@gmail.com>

Document the Samsung Galaxy M52 5G (samsung,m52xq) smartphone, which is
based on the Qualcomm SM7325 SoC.

Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..fff2be0ecb47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1124,6 +1124,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - samsung,m52xq
               - xiaomi,lisa
               - xiaomi,taoyao
           - const: qcom,sm7325

-- 
2.25.1


