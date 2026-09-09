Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E3501F58;
	Wed,  9 Sep 2026 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949647; cv=none; b=imun+wfwMCy+Zu0IY25mQuRrPHp02sbzdy5tbTTKanQtGRiSj3iGpbuIyKeR9yExFMbD2qjP9FpLwlWd9cLP+ILTJ3P54DgtyiMz1/+tI8lITH0vsBjh8CKkiRD00s3eFP+Li+8Po4ugaIDWlhkeso8onp1PxdPua7GC3MtIQZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949647; c=relaxed/simple;
	bh=W9V+oB+r9lFZT7SEICn5PR68cDT522xBOot+vrw+XQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJ0rm61ryGqrNXopAPA/Ar7ZSy+dCn6BJWSAacmmWG/IMzRI3I6RpPN33fxGCQr6k7EdYDljDRxRP9bdEOanhaKHb27qxEJtBKkMMIrPD8LKYME0laXUxbKGDlmpCMkz+/CxRnhjCa9/GqPUO0V/PH161lvPprB1vIckB2dU0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=GVttOQ7r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VMnU3Jrm; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="GVttOQ7r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VMnU3Jrm"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CA9C61D0007A;
	Wed,  9 Sep 2026 06:27:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 09 Sep 2026 06:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949644;
	 x=1789036044; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=
	GVttOQ7rVoRtIgf8/wwQBmmTZqS6+yovk4gPnP/amBkwAXN08n5zynvDHilcjyJ7
	EhC609vmE7SVmrYLvSRbyWlpvdqMq4PnGQUQEsv3yj/9Bh110jW5Y9U5i1p/awlr
	vpJ6gzV8uxLnet4WiMeQ9xIZUR40ZUcMO7V6sTKzYo63Tm4/VJ/TeERoWTiV54XW
	cFBVFKlyJ3QH7xETvB1rBZ0CpdakTevobvInhv+YUdRlepL2oSTG3FMphh4IA8+z
	aWtA4CA2l0+xW6W7Pt9VdQUM+aAHu6DNEdZsiFktZzgwTsb+aqjBJLmSe/EnUQsc
	wajLY0E2ct2oKzrIbZtdOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949644; x=
	1789036044; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=V
	MnU3JrmWnWEcGmUesA+O0+xjpoTXwuEHVvMZlawYrTEMNFZETHqq5qy29V7FB7cA
	G0OJ89OPtjMDqc2kSqL4euyqyRF5NFRTolUGM+NMRKM0ijJ+WalMTZ+xDZB29Xox
	pXlbhu5W+eXb/b7gl88rmsrNwmitoGyFcj+jXsmPlHqAUor9RjSrf5/uV2JW9khb
	lm2v99LsThbZvgN4PRq8Cg7N8D71aojBIMP/t4DYdZRsYutMhRFIJRycmCRdP324
	FK/po2Q4Rb2Ue394nikfTp1zj/IjoEsGVr5mHCHHuxRw6Z2jyLMxaTeT3/SOVrv0
	VJGCSjlHRMhovTe8u3yEw==
X-ME-Sender: <xms:jDShapZtRXcn5dRJsX9peYNZzx-jJnLv-kP2DNg7nJ8qgOmX5mkfPw>
    <xme:jDShaol9vgVmhUCJh6r4bg9PaWjJttW2S7kQOLI94wVseHTGl6L2U0gleuXcyPA__
    umKNupyEhPaZHQ2fQZJFZRWGR0EZgYURUaRV6PvPqWN_Ncx-13gnm4->
X-ME-Received: <xmr:jDShanhLq6iRfrgLbZJ-2WxY7NYmo1lcfnGk3bNpZ80tzs8DAXLLpSgiPf6Mm54Gu9xoCS3ShZhw5Q2C3-UTPpHZ0Ei7vuHTsSPA_w>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjOV
    AL4mgnMbUq7YhGPE5ZDdveM7LgxCXqkeR1+taogZnmtDGdTPIoIz8vKCuXfUcs+JrBRSH8
    N4DY4AbGSPbRJoO5lIscekZ9Vg7unFGr0zOSFmBrqP1d2MO9RdnFChdTizsSvyQzhgj1UH
    V7uAmxQcHKyNFhglv8DaSP1uBsn9rD3VvrDBsssrJB+V2aWQeFfj1guDKHJh5bNLpfNn/J
    /EwYkbv2WonPJHzMUOTiU3Aa+p+h2VIlNBgUBShi8C2HqW5twJsm/AqlOPN3n7e+eB2jlR
    PXnh+/ASgD1/UfEhGA5LVPFipKQ6hilzf4Ka1pRNzURR0VFQk9fW6EIzl9kw
X-ME-Proxy: <xmx:jDShaiR41btzB0ie6OZKa7-lqmVTmNwT5Ct1Gqh7n62HFmqg_7oRrw>
    <xmx:jDShagbDUrRKyvy1j6TDuv37xaVGQ11xjc5nm55F3kMOTX6YdL2m3w>
    <xmx:jDShanRA4RbUDccIK9FfWKR5LgZ9UWVumEYDpcGDoiurIFsjpKp7oQ>
    <xmx:jDShan_Ei_CbYpmzTGWTj9_SAFCc08jWlMd-uHwp7caR-Zr0RH99jA>
    <xmx:jDShaj5a0z0dYR9gzvlXJnRWS615skYW7YRjk6VBwcJXBWn7-LZqzld1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:24 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:03 +0200
Subject: [PATCH 07/13] arm64: dts: apple: t8122: Fix continuation alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-7-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=W9V+oB+r9lFZT7SEICn5PR68cDT522xBOot+vrw+XQM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpU7QpOS2dfuibgR9vXCu5U3BD4VfBDg/9KneOBLc
 OcKL7m5HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZS/ZyRYdc9t897jN7yhr/d
 uXGddNHFBjmpmx8u983p9Vp78+Sf+D2MDFfW1cvtuaXjYPH3o2+1569cd68LRi07ukKelv7ut53
 oyAgA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Align multi-line properties exactly to "<" of the previous value.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 3c7677079a29..cf9cd0781fde 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -344,7 +344,7 @@ aic: interrupt-controller@2d1000000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x2 0xd1000000 0x0 0x184000>,
-				<0x2 0xd1040000 0x0 0x4>;
+			      <0x2 0xd1040000 0x0 0x4>;
 			reg-names = "core", "event";
 			power-domains = <&ps_aic>;
 

-- 
2.55.0

