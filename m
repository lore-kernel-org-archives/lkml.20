Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549883;
	b=YVv1lae2+ZeYF9ZmQlXc1CYPjvsuWEYfiAqX3x0GbS6xrrFLSbpSAT6PtpWc5BLTFgot
	 NRfHuvRKxQVySrLXNqQqZn9/YzHf66PDX7ai0KAzCzaclsrsjcWUxOnrDjLyh97RnrcPt
	 JCNhQUonqAGvzy7dp4f7aoY/kvAPvZfeSSLM8fve/LZxbGNmi+oXSiIjFtWw1zRgrQ+yw
	 +cXlaJT19p/IckTA1mmm2MYVpXKmr9MWTgaC9se0bYSrRGlQOyxuNn3IRbWec8fwlW348
	 OiHFPrytt6BEwPeRbKSNwxkQRamz6zG/fz0wax2l3zq5zFYlKdr9uxuBhcF59erpsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
	b=XvhiM495PNdrK3Vb+ETX/X1eFVKGhBWZN757fBcsa9eONUA3HvVD18YqdinxrSS3ikv+
	 ItSuhw/vuKQf3rHrOHOv0sbReAlM46DSPf3xi/eJeDgm5F5lcKKtvvrP7wklgTlCe5Mvl
	 sc6jABhZ6vE0zAg1wcsrcIqEJfMMYDFeJxipHSNX7yikl29l94b5tLkFSwiffFwyjjekv
	 VuT1pjh4Pj7A3jLhDZl7W3IDFi5eurc0xUiphf5pTOkJjI1lnblwGAE27cmmUevtZ0nAX
	 ZaKOIt0uRk9FmZz62al5rrp+pNATFbCDo4mRtvbk7aD+7hIF7TTIsACxcg3x51qI9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M5Gs/nlP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED67606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED67606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK1kRLoE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Gs/nlP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F3MT3256731
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=saQOMBXSCEt
	K+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=; b=MK1kRLoEHPf3kVJEjDSlbEodmAi
	EzPFRJk630tWP751H8rJ1wXu+hTqJOH9DirqlK2RW8+Redln8q4oSwRExmFyOY2j
	n3cmnwoZmHuEIGwkytlhxM2l2+sJzNPrd1142VjPZNSe+eaiXDaogtnD7gfNc0dO
	tOfSExYuw7n5uc9Bqwoqhmn4pCLtsFxZdBECVAl8sungyt4gR21LoCJ+I8ZTmGE3
	tDaI4l/nvpcTDh2V0GNyWtx2YLqQpZ0WNAltqfVuTqrzlC/ZJ40VWluqiLHTqdsl
	MyX+9vY52aAK/IrLA9rZmaRi9EELylGyor5uRxQtQOQBwi0Kr0S467s6HLQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1kgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso614945c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549881; x=1793154681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=M5Gs/nlPH8w6qFraNFRutnbanxyJ572nbGC4Y5d7nxuMthaM/fCf04hy9IUjQOYc9M
         zvedd0zUuz9CsS1Aefv8zTEWmYfgx+bglCElDd2o5ddM/E52Xv+13v2IpgdWNTi2NciS
         tACXLsdnVvzuqu3+ck8kiWNXyzrdyipvXOorKsyatDl3Wy0A3Rx0AAsO5SX5fw85RzOu
         2vwG/OwmLH8grQGbRJoLtF2RlazNLoXQogWlpBPa5Be3FlQmdEh8J1HNd4nzefTzeT+S
         9g4L9UJ7tkK7puXvTJJwepUGMxAA6CNogVybenMUWEeuck/5FHP5hDkfU5xr27DLe+YC
         kzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549881; x=1793154681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=saQOMBXSCEtK+IXlca1nlW/5mPlZ0IBZFAsLGkEy3l0=;
        b=kISkJ6x5AJE0SCNTUexKfJSouqgP1yTzbrbIMV3dfmoB9bAhdUJTXANODEM24cXE8z
         GiA3fjCs3W7fiQcF6cPDu9prObv66eskKs1uDwKLg0jPIyu7Dwu4b/Vjxkauw82QheQw
         atjVkLE3xxii9eIcRG4J7JyeINqw5ewm8YaM45b6O2gsf9zaF64drvB+e9tz0Nu4uAI7
         t3I79uo5iZTvdKBLVeicxZhQEiPvkdL3QBiIKy09se4yY8FhnTCsrfCA7fBCb6Hr1PmY
         Y79Ndwa75qXOn/CU11aEqZC0mPc8aklf9ui4NgKI/m2DmMWY6Y7fcu8WL0yzXlAb1RpH
         Aynw==
X-Forwarded-Encrypted: i=1; AKwUvBxcEtlVAn6zhxwZWSAh5vk9w3W3ZgNe6HK5te03H5CV/A7TPcimfsKiJ2CcQQBAuXgasfK5NdQpnhfFqEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3XWOlUh82gLbeTrNwGgE8MyDVdRLLPis10NaezqitxrpUIOGd
	l2VszIlioI1hL/aJqyPkG1HiexAuVmNBsViFw8k8HZ1otvHfNs/zYdpq7ayFqrdvsDmY5gYSGyR
	TgaEbPNrY/q6gFynFaVx0mpaEZigsAIVQt9z5JDcffrV+TsBbGysY9a2PuZreRGe0GM0=
X-Gm-Gg: AYBFou3gqUgrMfl1Rc16ZgXBLzynVU7eTdyL1n/YRA3uWA+YDEaQYkidJ9gPyw9nXSa
	wc9z8+tg9dfeFHJYKapy/VHMtfhGP4hWZfw0XPJbY3ekW5PxknuU8YPuXF1sWtv+u4mVjbBP7BT
	On10a25U9wFuRTHmHfpIU07YsNyKeOoLACVu0qcD3W5NtkoEfjQSXXwJ5exjeEwlbPdp0eCvv+M
	Rxki74UND2LwhavhuV65xCzLxUmtD3y6h4zTJZSQc8fO1ESZt37wvf5zKxxjvqGhDbaooKP8YqO
	2lHGzRUuw/j3TJy0bGcqe95kAJsHzvvMwPHmkx4Pup010KeQZakkxDQ8PyTr5rkQOnhS7+UutRn
	66zv9VY02xS8Nrk2vJUBjzMQxZkTL7xJQBkfWbpDtBICd4rju5OyJaUPDZpc=
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405342c88.8.1792549880641;
        Tue, 20 Oct 2026 19:31:20 -0700 (PDT)
X-Received: by 2002:a05:7022:4589:b0:141:4a06:ad6f with SMTP id a92af1059eb24-190a465c25bmr1405273c88.8.1792549879845;
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Wed, 21 Oct 2026 10:29:17 +0800
Message-ID: <20261021022921.2053957-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX7Qj/KxkPLzbg
 ymr1Jo4LymurZFVatYDLHvCUEfCpJIdo2CQIzq9XYvRWTsWCaweXCV1uM3rx8S4xd5juM/iiwUD
 6wFRpFHtDi0T2kzDc5yGILZBQp8Ijhg=
X-Proofpoint-ORIG-GUID: U9QtgLC7LRng4lW9vDDs-YqUTeV7tSeW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX2XLgBIGr3giQ
 QKBVelmTJvBQjbUIoY/AW1nH01ZUalfqPRopM1s9EXZanycbRqmwuV4SafV5jc6LOea8ug3PLt1
 yRqotOSggAYvyJ5SKCVTfWCu+uCFayaG7m7H3YdYWOz73ovyohTjhuo4VMwmCXrGEdij3PasAlU
 Ne7WkXQ5Z8nKLzi/h0rpcwrR1XaCbDbgoh+4uZPcR5MOCBboJKN2hKYXAJAMzyovQ2e02VDXurt
 7hJAOBojfX3OJ3M9ap4a+n/1Skun+F/Hz+TTGIU0Hu9K6COvmrd15APdOLonqbOR6odrc1GW6gm
 3Huwnja22yL5j313BncboNUOPEMsMRNc9eloa854R/tfepS+g92ckg6Hmwc/5pKEiMxl9r/DdyU
 vNlXj7q8wukQfm2A3calTvTvSs8mZKSyv+rnGBWXZmopSytpE62pf7V1PS7+Rq2pU1Y6eSWSHcO
 dlPP8XR2cj9PVELU0XA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad823f9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: U9QtgLC7LRng4lW9vDDs-YqUTeV7tSeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..08e73be5857f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

