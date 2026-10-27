Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103868;
	b=oSqAJ6Ao3ODcm2fNz22tCnPZY8wuUh982utb/YtOExspG7W+WpPf6lVyteMHX9vwBao1
	 8i+X2SmKYnT+o6olF9VQbyfDNIcwp1wZPe66IwXWxCpqV+NTHqR/M4kNBLJ1A9mVF+XZy
	 5g2wmh1Ggk+2a4Xmt8CYggaYp3bYYhBW1AmjX+WwGJjRTK5ddx6AbPUqLl1J+WxfrLy6c
	 421+tN1+ovBLAlstF4zvoySzwZGRsUueaF4GoDGwlOMlJrHQnPpN08FoUrejnF2K8jt5c
	 mB4Zs7DkAgnUbmulLpDg1biwZv19BwRLbvUR/Rjp6JR+t4JrI10Y31sH5UgNFdtpgIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
	b=EW1U85biU5g2UY7AfYx5IBM78uIns7qI/UnMVnJS56NwQww5zf04XpvZFQdVFWqWekJN
	 2YJ7Kcpy44KYAoPi4dsA9ZSa6I89BYB8Bh/EIlXLspfNh2t8CLnAscNjpAj9ZREniK0rF
	 HCSomW9oNkg/7/uDyX5jokQQMRCZ1yBKwz2n6qxaDOrTIC3yZQhPbNvrELxKSGZht34Vg
	 XP1bYaI0ZOuy/opkn9PI1+tD9znePbADaIE2L1B69ZcmhGZRoJ4+eLIggo7XboO7/+JVq
	 Nu45iPApVtcONgygBPOP8ZMYtJ0m01atFrXd2K8DPBk6sD0cB/t72lyAVLC5wBlcajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7D60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C7D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S+M4v1mo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bq+0XQl+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBHs3026383
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SBX0/to4wfH
	3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=; b=S+M4v1mo9w40RZh39oLWugextVO
	S/h0LkOQMNhtWU4GULebL14JinktsmxgGsPyNmYL5m/yOQ4dHshaODni2eWKscQZ
	3QcRfIEf7/xKez0wYsbFH4K9fsYDLT7bN4aI2wbz5RBf7WF6FfrDj+inI2ARz2Ab
	02W17lB5EtkMx/hVLPo7qJ1pzaet0TocvO6Td1uyjnur7DQJt/bDkIB9OoEImFJ7
	jDFuRhELaOf3oWhc+up8fUVsICJQafLKeHfjaERpvLMqYzvxVX6kiugau2ecQh4x
	tkmY4dMl9U16WQfBeRa1AvDfDumpMStjUlR2f9qEJUsinur2i4RoXExsQcg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91adt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3698bd5392cso807744eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103866; x=1793708666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=bq+0XQl+2jF7CYAyceKCAWFvpzkKuHBdtjT5uzzt1xG2UUhRMFFr0AGY2UJ6mEx/mh
         WQHbmzX1JOdfNiAVMUMmAFr07az2Lvnl1FO0n5ev8YgavauTCWJBhSGrTYyqOmomSW7T
         zuo94yFsfOFIFIj3SLsWuMlKHoQ7eIzO6vImdQ0IZI23ReGVTtN+aj6vFX6eyrUwMIFe
         yB0z1Z3ZD7VMBZ9XDxSx++NyAqi12ZsStVAzX2pZe/OpeTQ9QOuuxI0b4V9czsISJPGm
         GN5H/h0qVmEaRMmyj6b0CvvB+ovlNDLbfp9dXJYZHyBc14XL8x/OavzEk27PrFYd6oh6
         hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103866; x=1793708666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBX0/to4wfH3fUA/kO93uKJ2afZ0LuqvANCM4txROkA=;
        b=woILWa82MhkF8XboMSxj9TTY/JBsX+Ef2/5PQXxgjlDD2phWk2QDWR0Z3oqjy+QH9q
         dNHlWoQ8A/sw4sfuulW1Jhxdxzavhd/7lMhi/iPS0PXwUrCHG8MnC8fuYmLcsoyL/yzS
         ideWpNqQMeFel2F73Hnr/5X+yZ1H0fwsG/gM73eFtqfxdto1KbtoykE5/NLHCOaij6a3
         DAO9H0c3r1G6ONuNGIGn7OdLyQN7z3a54cIk4DgAG3Z0myz2oiYtC8sPa57MwlYpHpsz
         BamaLPOzLuVnlhZQ6UYNXOoasDxtZQZGTbLM96nXhiQ1U7B5kTvoCOJOvSnTcji3QRyQ
         CDAg==
X-Forwarded-Encrypted: i=1; AKwUvBzW6dB3cXecPJFeyVbZGOjP6iXYLWsiCz5tZQU1uuS0x28pZivQk3c+/pCE1rYxbbFMrJYk9CtOkP5u9PE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6bY0RI/kuK0bGd7idUtwxHTyRKeHAOE/aAzgbnu1d4qsJQqqR
	4GXcLo+/8Idwyk19KslNNxtHN9/4nwaR8luV5+n1chQ3SUbA0XweX2iyX/4TLgrh9bLhK3SNS7u
	IeMMZELGXCh3RitF4+KmlBQ7A1mrNPgSuV7k80HP/6ZsdF7uQX0gtQGpIFS015Xtd3rw=
X-Gm-Gg: AYBFou0HqlUeiQgLjIhxlhHTMHQabDwtrfVZNeOuQX+XQ5Ceh/61LK5dy0jdyx0dTru
	Fmp/RukvG5BL+033H0c0+6edGxf+ZJr5E2aT6siDmPZriAs2C4TITGDG5P6HzNOYpyKMOIfTC3C
	T+wDBCfdpEinvMoV5pNRL5LeIGs2diQZBfxbw8/PyHyR+Jaipe61xNbdmY5mGJx8HxYhr2YO8Ts
	fPlKDlMkxp/+XBBZ1F0B//8F6ykobXgPi08zxEKUMQjgu8uGdCfB2p31UQoMBgFjxJ6atODYGBQ
	BJgIwvNbi9q8sR1qvLbi5h/tdVJ6gHakvCO8XKeEFTJqew3cj/QR9Io5I7OsCcvk/NJyhDkEKG/
	Ftk2mFsIOLWnhXThcAHfJvqLQrOnYvw8rF4ENIc7RhCqVI4iJ
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760945eec.14.1793103866024;
        Tue, 27 Oct 2026 05:24:26 -0700 (PDT)
X-Received: by 2002:a05:7300:bf29:b0:369:fe82:8d3f with SMTP id 5a478bee46e88-36a0f81abc3mr3760886eec.14.1793103864883;
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:24 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Move the PCIe slot supplies to the Port nodes
Date: Tue, 27 Oct 2026 13:24:10 +0100
Message-ID: <20261027122410.62219-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B0FMOtLcpt_tM2ftxBTDyG3MGnMX1yBF
X-Proofpoint-GUID: B0FMOtLcpt_tM2ftxBTDyG3MGnMX1yBF
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae097fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DO3DuuW5O9QViVOw3M4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX7Q1bUtOEmDbW
 0lAbZyam8ZnRgKLS1jaqihodMPXx1DtWe3rdyovIJDWdwUdM+mPvzi0cP1TsH25IhTCrGUEGPeC
 PUgMqClZ7CjPB4u36FkFLGA9iyrxcG++BTLxfk3uEi1G7CnjOpaVRFy4YWOECPNXjFT5jXebebr
 s9FcZb0HyyaZV0SnoldMUQIhZQiukQrmq+KkoWANVfjjkTIWUzFOXjmb7sEtiZBSCDWKyucZVz7
 Es+FXyNaSckzNDdonHqeyGzl0ebFAIbuzhE1q/adYQerdAmvhfi1NcYdNmkv2AhRyfkRqaRxJv0
 UBnBZ52UQ41V385yASBequmBKhE8Uq85KwC5xWqgsR54X92Q6EbJp+8783JPH929euKVLEjTgz3
 4L+YsxCUeqGAkFok7uNP/+aA+l6Xfwy9vXr1tU+yjX1zyxVshD6t1exA/ZsW5obQe8UL1qWDV58
 8654+ClpLjyeFKysYGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX9KYkdS25VY8o
 p2ptBtortAuUKp6uw64zqVlgkOfOm68HmqevaNKOiZ+VNBi4vfrRQRnRcQfvkShh6UDk4V1NyMS
 OEwdCDACn6bMspwlHQYQdDHXRHZtBK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049

Since all controller nodes have Root Port nodes, move the slot supplies to
the port nodes where they should belong to.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..7e16add069b1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -743,13 +743,13 @@ &mdss_dp3_phy {
 };
 
 &pcie3b {
-	vddpe-3v3-supply = <&vreg_nvmesec>;
-
 	pinctrl-0 = <&pcie3b_default>;
 	pinctrl-names = "default";
 };
 
 &pcie3b_port0 {
+	vpcie3v3-supply = <&vreg_nvmesec>;
+
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
 };
@@ -789,8 +789,6 @@ wifi@0 {
 };
 
 &pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
 	pinctrl-0 = <&pcie5_default>;
 	pinctrl-names = "default";
 
@@ -805,13 +803,13 @@ &pcie5_phy {
 };
 
 &pcie5_port0 {
+	vpcie3v3-supply = <&vreg_nvme>;
+
 	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
 &pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
 	pinctrl-0 = <&pcie6_default>;
 	pinctrl-names = "default";
 
@@ -826,6 +824,8 @@ &pcie6_phy {
 };
 
 &pcie6_port0 {
+	vpcie3v3-supply = <&vreg_wwan>;
+
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
 };
-- 
2.43.0

