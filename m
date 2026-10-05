Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07F47F3DE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203110; cv=none; b=M5M05kCq1UZdkoJdEhFeB++2i7hVGyUF2tIoFjHukWSZBQACIMtkeScvgVEFa3hSAOIcxFbUUpNfuVxGmgSFOufU3LEg1hF8gb8xV2DGDUz/S9XPq/4BcQa3pwc+yTCyChmVBxEFX5XQSwUV8s5cO90nrv80p3xykLLMrr+DDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203110; c=relaxed/simple;
	bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD4ncTxu2HUJ4MG313v0a6Qf6KNxH6ihGlObwrZRjBKH/ZvA9fZcYHhmWXL/cNbKa16SG0JjoTQylB6CATWSiSDOUZ5B1/6XdjfJ3YiFEVf8aC5knLVlfVHj1KJ3UUqd60kCS/YZFbJspV/W2bMU4wFgKZl4aOho5ZnoPItHOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiRB14a3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpSbQNAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiRB14a3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpSbQNAw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFYJ9914122
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=PiRB14a3PGf9JcOi
	9FPOldIvC9lLWKnNXd3SAeCQK+wpLAhVQGIyCn66gyOI+Pl+tnJ+fRorBfv66hE6
	/OTOHnNpS7chmGa7FjhslPYgH3L6m0Y6LICrREAxPFG8sktVrG/gYhfM2Gb3mM9Y
	AIAPkTnY9dpptulCnN98hDS/4nTkwzeh4PO83fT4+E2r/Z7tLMRxe1QGVrsI1/sv
	4UTICS3OUhuUMnx0+Xu3u7UBtvwxx9ClADfADA+tdeqfR4VkC7xhIFwSNsktx6uH
	B+TkB/mL+HhplIl6On5ZO7XFlR8Omx0ciCdvrop4SXZ9R+iofFmY3VkTFgIcqo9d
	PV74Rg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:25:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6dccace8338so3750824eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203107; x=1791807907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=BpSbQNAwCFWROfygm14buzOZ371frLwwWC0UEZnSRRe41bAsYSFCRtQdOjQG3jTywi
         Xuzzo912BMCOFDrbhZCZ1y2b8HVs/qMsDCYSXzWg3Pe5a0FAlN61kKlt7sERgb0fEDFH
         sUOgiuLJCRXJ+sGQfxhpikpCNGXQxJ7Ook45lkf2sywK9FVjuQ0MxEpx0OrrwkAwXhdv
         kOtRFDTmhGA0fIE1m3+pFI1SjROIW3vYxvFYw4xyzBXxOK+6ALfWGE4QzR/Nb9vgzetM
         /TI6dO40S6s5Qtz3g84LdCBzGqeK8tELbyIvmuvRysEqvCMtfQeG0ssm7+mFrDnYQlmW
         b2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203107; x=1791807907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Tccc9b3HhDq3MFQHJ6B70DGrSoaa5a6Mj0wLl8E5ibSfxIcylkxr+1qC0ZRHVF5dBt
         m5z+2trRXw/TsZo2esPXyF3N0rtJyOxstMFkB+DJawU5pn94I7+ZEgj/hyyTqS15zoPQ
         oayr5iJbRZAVFHJdwpw3SFVGtYpaemj6Vv9EA8fhh5+Ux+sVJpwXPqHuUwIMVD0Na3zP
         6w+jBSH6lzPm4c5kAYXe9WYnJgBufGnMwriq0jUGfd72Lr6DpG7xl7Lgnaq2WCNvf00Q
         FMA1BRReJkgXlhr+VVDS+L5KdX2wcXGtrvkljAPQOTVI3T9I5/cTUm36K2hapo06+kEt
         p1tw==
X-Forwarded-Encrypted: i=1; AKwUvBwLavFBjzj2RZOpfwvG71YUTYzd8Xd0dk/0AXTafhPfKD2h9uJN15qMTPGz9LHoAMKki2S7BBbqU1om5Zk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/wRNAPSJxxRN2QHqH8shfqGdvdqNsggFam7Fb4lA7V2HfFyLx
	AOXyh/R8Ie0jS5ftplLH97OPrSGOTuksOQegS6HVLcLzTAshCV45Uo9DgG0DgeXZUqzYwzEpi4A
	+dH+VsHuZ16ScZPZ2HEjvEZTsp1xhq981J5lzkTLNJerQJgxXx6dcGxb24p0qjYjum9U=
X-Gm-Gg: AYBFou1MYgADZWQr8gaJckQp4fvqw2llgbnB2TOIhlXCDYwgYoKORE/Sx/l7geYKtyT
	gmbCoY5ExhcFWlnK7iEJfaXXpggSt5L8E9pMYYiii1qFWhH+Azvg7cAFGFeHLgkiehHb7LtaPUH
	ESYk3ZLB3VpgzECNRo3zDZ08pUC4VcyFDNJ1tF2lwHM+rQJDSLZ9JbRzh3fHccQNM/lXhGlKuWW
	HQljsF6CrkNZnNGbAqnToPZ2vcJ8nyCDXCkFcLeIEqBKVrs/JEJJRbWKLSGJRoNC6SCyNoWG8qt
	GkFvO6hybHoLYh0k1y8o93G1PJMyPtzpjGPQIiW4nAIUvG0HWSSNxfkJjvij13Xtpop7BsglL0w
	9CHHY4+fwNC1KhX/vdMQxxLHaqxsP1QzHzQ==
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275812eaf.14.1791203106919;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275797eaf.14.1791203106433;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:04 +0530
Subject: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=2P/b1Rzcshx2aT+h+pH72m9MAJi/41ALYT0f3yobAUvA5rTyfFGdJQeawAkimB2qNIH16umAi
 b6P8W2By7nhBUmEZ1zl3H3rKJi8yT51eg8YhfQEBqNhJng1+ooOPu7Y
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: mmECJsyUCIEpRoF-VtIC85qB5XJNJSyh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX8Tpu2k6N9mxI
 V8XwYPcOKePwH2whGd+nY30tb8rHmaygdlxn8+hlIMbXA1FQ35xHTW6PrHuZPEWZqnz13fwrA13
 KaZhxMGgDzerxko89M5S5nVAMeryNdo=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac39723 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: mmECJsyUCIEpRoF-VtIC85qB5XJNJSyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5KLypcNJXSKw
 WhMlJBKMjLRvHOU8ilaTgIGfnkZqaWAjMpnhlqf5XbWP/bjA97/8b4U1KTqsceXxUmIF69G6/Zb
 XmCm1PsBz/oo6VbpilyHt/8duQeqbHaTnm+MmNsEFDwjOm43kYAlbqvsEwIpPUmMmhP0DrG2HVb
 pAgkHb5I3qx8gESpOtZqJjvJlO+MaMVi4/poFLA9E4asvM8LOb4NLiZof3Y0+QaeJLhvs2y5aaZ
 zZ+7Fn1aYTXBqk3/QFsuEJAuB3tQwtJoPGVeBVeaCRliRwUj/0rikkHkbj0UCGPrmWluFVIWr/+
 /SFzyIlbBMnAw1NaGVtvPZKZYLthmmzYVjbsgB72BhBxdwyc9+Rbw/FJzgKWYhoGduCvFMWRYJU
 pNm2y+hX6SvDs7VpJh2V/w7i77vQ58yme0uVuZbLSS3CWVsnIQbolDxTUwV5fuKjw4U6ZL1Use+
 LTgRivRZ/AlwwxvLfdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

