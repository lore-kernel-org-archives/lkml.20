Received: from outbound.mr.icloud.com (mr-2004l-snip4-11.eps.apple.com [57.103.69.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFBC4F4D11
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737378; cv=none; b=QPQ75Fy+ODh6AkpAYsFZKG5VppCS2Ul4vQ+Pbkzd50qXDDLQZan6rptQBgS+z8M+pC1DWizaRdW9GkiVOdeGYkVzrBCtTWlS7ewRr6AqfBiAE9ecC/hbJtuRIA0VTtomfW8FFeXbcOmIalap3FhM/DxaXGQSSWCuDJMId7mmup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737378; c=relaxed/simple;
	bh=CuSgv6w5hPAR6Ha7x5yAF9ThiEbhk17qwZZWg9Qx64A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5xanct32yZUPaYz5+trxLaGRTB3FzqlhQgtshWGXW319rz/za+coL/jgqNTcUgzClh5LfJDD6ddCFksqGKsc219HPNf+niNfrSqqMpr32n5d0fTJ9OAxPYhZNqa30TxkClDESfgN0G38JYnrDPe2z+ld3h0YgCPE2CXRNKY+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ZP0BWKqJ; arc=none smtp.client-ip=57.103.69.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ZP0BWKqJ"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPS id 6B49A1800364;
	Fri, 18 Sep 2026 13:16:11 +0000 (UTC)
X-ICL-RepId: 01a0b4a9-06a6-7e78-9b84-7b2d922ed33c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOA1QGUx8RTxweGwZGC10NQQpaAFIBQV9MBlh3AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789737376; x=1792329376; bh=DcCDTQc07A7TDdFj59KiYFwuhrizZITMxq2+rV42wrA=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=ZP0BWKqJ76a9QIho05vUDNPW8lM7SUK7DyeoxOWciIck7eqxtyb7kHCoCHG1/2LAa9hagJDa2+emdzsAJgerIwuATLLmibXjurXgXCaoz09hHYuFqfldh7PdsmYBpljdPZwzr9QAXKCKz/m91FIzUhjlcWNoBGnjsV5oP+eU71cq2QbeqjGdGAYLGOnYDoeLfrz3cjRdzN1f70ifG7Qi7X4oCVXurhTojgmWT73wwqcxD8nkx8IuKFJvxjJYfP4s3wqFTQYBS8sdRTUkZqpYUSgkTyGGamLxWYKYwoLdUjBSDH8nMEMBMlQn+rwVQyhMvi+9l6Zqymt9t9dEoAYTLQ==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-1 (Postfix) with ESMTPSA id 8765D180187A;
	Fri, 18 Sep 2026 13:16:07 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Fri, 18 Sep 2026 15:15:14 +0200
Subject: [PATCH 09/14] arm64: dts: apple: t6031: add avd nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-avd-v1-9-49977931f455@icloud.com>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
In-Reply-To: <20260918-avd-v1-0-49977931f455@icloud.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Sofus Forstreuter <sofus.c@icloud.com>
X-Mailer: b4 0.15.2
X-Authority-Info-Out: v=2.4 cv=A89h/qWG c=1 sm=1 tr=0 ts=6aad399d
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=i4oxPFHrzJf6BXMseXkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: c0EIi3ogtwusjNxhSgGy5S1iAqzWfLzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OCBTYWx0ZWRfX6vlJ1p/jkrE6
 1dxKRe9ot+Aj+yMc1rjBaC435oWFlEjCUC5FL2l1+VAJPEcjA28ENkzskilsEDoZ4HZ0sEiwzJz
 YsWJVi2DXZZwdhMvYbvqgNasR9ivuTN0I7MtVa8qEiKoOWS5S9Whnh1l6PcklvtI+/n74FiG7yw
 4yYzv7oWehCpHjTnA8oMe+Qre0+8EjwIK+sWKZS3DeMYQkBLpctsGesXgQKBjJ38paHaQ3dwtQf
 Ye34Rc0UP/WzdJiFu5R9FiXUYWq0Ok42gF0zwdv2yEWdkbQtD/zlr9laLdNxlj0OIWN5P3Cd5uf
 dFsc8kl+jB6gnUtRZ8FCbRfYd3OugZ6z4OpT9CYdgqLosQoTq+1gBLyLsWpGo8=
X-Proofpoint-GUID: c0EIi3ogtwusjNxhSgGy5S1iAqzWfLzB
X-JNJ: AAAAAAAB4Wl49F+tIp8pRKLmkT+eRNtcIhhIQ+tJ75569LCQGzxZgutXv4Bm+qVMK8Wv/DiE4QmHduSojOTxlfww+NhBR7mSncdxGBAu/XdlS3RISxMT45UVTUHqzWAUlr7EN3tfWt6gDETPaEPwWTruUtviAcn5VP7j3TLT4mq6lANxXdghpR79dz5Sreyuw9MNdnD5LKuzBCgyv08dYlSzdFlBa2iCqGYrNO23bwX2zQ6cKd7VKYx1pEnsQZgJpuvqvbcdNwbHG/iLQsmYigyPVFhCQ6Hy2PxABC0EV2MJon/uB/8rEFn3ceXYxjo5AdddDS9UmmSauxLXXrKoZPC2PIWttbYVVW1pbVv1Xfb8Lx2BFU+y2hyfT1mhYR5/TwNJNxzKCX+Uv9iJPYIU4TSqDef44LlXUoUktu2CRa7HenV5sa3dMynZHfVQmRQt19HRWOzaTDB9lHvvi/ZL7WZTQHvwm/hNRWEScKqm40IJ0VVfV/6PC/VBBdZDSYlz6Y2++8dkmxmlBVOqJyV5CzcKOiztc6wfInsHeXpWHolpauYMlro1KpaQv2ho59WztYHeFvUxWOeX0y307gwgh4xDrIvNgIdXxqLnIGgRk63nT7TCIpLPxqr7PH1dw4totbOwiQGhz4r2XWi/C0FJ2vaBoHP7hZe5fPa4Ec4og8IC3q4FIfACvPqzgXAzGyeYfGI93LlardSGFT2J44Aoj5whOTzmMdGSnrSLvYWYXQrZhF3tCMJD7iUI1cfdHLmgSO+J5PdfPJK5tWYsijH+JRKqtAh2xNM7Fh6EFWpd9NWM5GVN2Okr5iEOIvj6WimNedgK0N+xYi/yDBaZT+kEIdAqiun028lbGSUhVBXqEW0V+9Jufe91hxf/hcS05WeIETvO/NN3

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 2e9d3d2e6dea..431d13ec41a9 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -73,6 +73,30 @@ DIE_NODE(pinctrl_aop): pinctrl@2a8824000 {
 				<AIC_IRQ DIE_NO 601 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	DIE_NODE(avd): avd@2cd080000 {
+		compatible = "apple,t6031-avd", "apple,t8122-avd";
+		reg = <0x2 0xcd080000 0x0 0x12000>,
+		      <0x2 0xcd092000 0x0 0x12000>,
+		      <0x2 0xcd0a4000 0x0 0x4000>,
+		      <0x2 0xcd100000 0x0 0x10000>;
+		reg-names = "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1185 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1186 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+		iommus = <&DIE_NODE(avd_dart) 0>;
+	};
+
+	DIE_NODE(avd_dart): iommu@2cd010000 {
+		compatible = "apple,t6031-dart", "apple,t8110-dart";
+		reg = <0x2 0xcd010000 0x0 0x4000>;
+		#iommu-cells = <1>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1192 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 		compatible = "apple,t6031-pinctrl", "apple,t8103-pinctrl";
 		reg = <0x2 0xb3000000 0x0 0x4000>;

-- 
2.55.0

