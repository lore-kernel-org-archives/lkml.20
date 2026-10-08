Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D890248CD63
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450922; cv=none; b=nyPdPLv3c+gD1BoMHkgVJY2tESNwhsWqQaj62mRSU8TATifoOD6fMEwM/PpSCwjZxGgSTvJobFXOmqO3fkhMOxmuAtzC9RcM/aBF0T50v7KWiA7v8MHveZ2D1Ik35ISIKSYjko07a+phn2A6qsNu5xM1v6fai+jh7rOtP89a1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450922; c=relaxed/simple;
	bh=IQF4cz+Rpi/wpP0+xNYcy4785qN3FcQI0Q4cCr8mSNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoyviVy1iJR09V7zWhIF42kPQ1m4FaACAnZ87/BR6APqYwS7POVxH/RsflkQnDzYgY/hco3qUSL7sETZtC43OdjyqPS9QRTmexsdoKl2NT1Ux1gl3hhzZJbs/xe3hv+uVF2EdCIFjEVIgK25IVznqySA3HPEymCpeY859eXbINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOpPyMga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPAuCphA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOpPyMga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPAuCphA"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KJLm3307405
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=; b=cOpPyMgamQXj0Ifu
	u6TKLMIjJipuP1Wxsi2Ja7l2RhJrk+MRh+AQSmnqxkDZLkA8nsTHe6uMNJj2U014
	O0s6uEFku1lTT9PVjRt2VvdLE77aGvEZTzoa0vcBufQWSg9JYVQSB01GoyeBTSvI
	rnIV7WC/LAoQvtK34Da1Hwp1zIP/OCMzOH4M6YDCIjzbMXBjxlEtHYFMFNUvtF0Y
	pN7UFaoFT2MLdcPxm7fir7PUkSENsePh+PTezu/kmVEHANqNky62KjVLAtv4ZbMk
	WJ6pQUyZoIEHoQUnSNWvV7raG0f5m2qzzU19m22a1XY4XYixn46X45FPi7BKIFYk
	SPXTgQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9pb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:15:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so3787781c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450913; x=1792055713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=aPAuCphAifyp1KMGVmO7YC2Dt1jnTzf/Z6PRGEQHTXT1SWe2dem71rbIDSDq2cNYM4
         c9bDUYFWdpur6Kh9BVCVd8pxumJKDMRYWzHVplJvoEv6mW4ql5Sj2DEiCnOm4PtjQ/iw
         D4zwWN5Yg3EgFXb/maqqp6HmHWGQtOAyUe3fXpQJ+bNS8CI5ESzDrFhEq3JRQafXQekm
         brwzJXwyhxM3tFxApxa+nv+7T7CdwNSlysliFm8UrRUgsFFocLsVm1RktJRhdjT4pEQU
         nGvAJEmLSyzJwyHlB5O0Fnd7Bktwn+Sh5vckvYyix9guJmkQ0yL4i7hlbUpNCrq91Ptk
         9F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450913; x=1792055713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwaAuuKQkcqcSjfeKVy94YdxpndXpc1raivuSHngRT4=;
        b=pjmg3qwivV8gcwzngO5rB2dOxRQwbu9GoJiqVqk7p59ARwO9Zyi1qVgQUbaMpvB7Kd
         8JPedzMbHAmES9Aiv6wNx0I/c7oTCSXt8G58sg0nKSDX7KMu5kjCO4WiQzuA16tOI/w4
         5+3moMylMxQyYYMC1um9gAP7KHNnzMPXye4RNzCG8IexlfdU8OypEy/4QAuN/vBDBQ9l
         hK8cDPDpUq87NoyObYSoIZNdyMimaMV7eIH2pJ9jov+019WlsFoaGU/LdshTroiSXszh
         WWSudS9hMLicIo0b7Ab7F1/VMatzPE+1smJ+uHBONeVNnFXk3FM7VBorJsWqUE28ajYX
         mplQ==
X-Forwarded-Encrypted: i=1; AKwUvByU8lx+g9Q0qcE5PhFVupJWFjyVmilyJe+6q64syOanbhP3xPWigjWa6LJLwNzNmH5tnJ2/LgmCD3z1LfM=@vger.kernel.org
X-Gm-Message-State: AFuF++k3GvPv6GHezeyHope0/YNgu62u6/qNtuspqDkiw3ALrhvUmuKZ
	8a0Dd9sKFdz44lwbDMbxr48HvX18o8sGZajT2MxjFX8huqD9/0BZSC6iwFR84TFzd8Ecc4kGE9z
	0C7qszQOYYkWuQOsgQbm0aEF7H+wJPqEnW5ktro58y8Qkdvlq9ly/hb3PD69jZbKK1Yg=
X-Gm-Gg: AYBFou3o9bjLOplX8HGIK+qQ+Hrafn7UggQdbgOzhJwduw11JYDPGdt88lvzyk31or2
	4BGuiZKOV5vF9zDBH/xOOPYTLVdV4qCG4o+cDT2QdQxgI9o1bQaMTjD9PJ5LUYwuigWoda5aVw9
	UQYfNXtupA/BeCZ3tmXJi+G5PI4MEqZZgBYDDlBa2fdmiz1anzJsaeyewzrzw9+ws6RMWRBQ2jP
	d2mCKBVFSlg4+V0tgAgVRfS60tx3ZjlxuqS9PS88OfLca9aFVhKegeV52qBRfG9nor4+PiRE8IM
	bdUqF3VnS8vsEK4wD7EIFQ9YOlkL4XA7d82OMxqpJ5ldCCdtp5ZKa0SrL62MDpGWmq1s5/yycjo
	OaoH5dWqbYcEYhEZVgGGeTSaCK4vRo30lzhZHYlkpmiXqpeTnsppOgZbZCo5X1VCGntYPU6q62U
	yyP0aZH1XtfKJrzYp9KITEGvX/Esq1
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148703c88.27.1791450912918;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:14b:355e:2888 with SMTP id a92af1059eb24-165a9abbbaamr2148656c88.27.1791450912256;
        Thu, 08 Oct 2026 02:15:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:30 +0530
Subject: [PATCH v6 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-10-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Vhe5bl5oMaJUyAShkSZ6ejrjJCqx00Zr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXyyRHX76Bsx/T
 oCGe0bzgRqwkpQVGt8iD0gafa3ZJ51vr+QSIdQSRoX9FkG+hJ+t31Va1fCLgA7KDFuIoWjtFHRN
 GLtDDLYtyG2qx585BjeALPnh1tJswTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX205XULSy+L5f
 yO5MjScndTAb78smX3/Q30hsJOJmhjKj2fc+AExUme4iHDXJLJbAi9PVk3hae12gQ/uYlx71ml6
 ISI6aLnHQx99AefX0lcTMQrsfO7QE9uaTalPLgazJCIIk/bRjzSWNQR8Ai8bRNuZGiltrmgz+3A
 wWlWp2dXdMJTtzCq8aJf3YHpCRiVksVZfCFxTDvlLEBbabksfxTLV19bfEDMUtEAys5BGtBRVUq
 a0W6Tq2pinjL8Vbi8cGasWvKlhahXVD9GrNR92m97cCQc4UO+3f8kualRJTc6lkpcMcBp/3BnnA
 DXfIdjrezSXA+TqlGpYNqzNkDcNQVMeZbYr0+i/XO123PaKrjLc2+mBCR1XMPTuhKe8hMMgWsvL
 HYXuHXeL1mVreELE3/PhbPufZ1AZCTtiZmwSJ5IYVBzByWILOAmbB5VM2qQDLN18Q6I6uQ1N64S
 eN2kgr3XynqUbiWPHrQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac75f21 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lq6IrNssKMGk0eY42nwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Vhe5bl5oMaJUyAShkSZ6ejrjJCqx00Zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 50ce79219fe2..23a2e27b70fa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -418,6 +418,17 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x1a80000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -456,6 +467,17 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

