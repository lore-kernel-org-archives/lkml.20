Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D93B71BE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119607; cv=none; b=MqOlMHjmk4mNCXG3cE95ZNRRtd+bHSzR1LW+q1D6wEmdhXId/wviSESTzdrs/gk8zUbihTmmaFq5SIN4FzccnpZInssI+mcQnCTArvuVUmv1YNG2AbBVkXsi0HdpGgeUx1hAPViyZkGFFW5w+YYkHHS6gyycEduAPOlMo+633IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119607; c=relaxed/simple;
	bh=bsC1feJRpqzd0Nbr+etWKk/hN9TrxWr4aoH1+V1XhyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FvsMCW1W/9OTWjTm76dN7n6SJhj1dlpJ94Q1+CwKzRb21boQ25PSwI1LME0BQ1VbccF3QkswyBpZATXrKsqPYtTesSZUwZbfg3UPz+93XO9md2W3GwMZ2sns8smNtSzMgLG5aFvRsWl3eTb3hepd1iIlj8i7jNyAH6uz4E5ATw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBSh9Y9Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iz8ROJQI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBSh9Y9Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iz8ROJQI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kfT83844982
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FzFT6kXhpHl
	ikCbZq7Ay1pC0UHtIg5fj9LyUX6GW0CI=; b=BBSh9Y9ZsLZwvAKdZwo7IrLpNVr
	YfFJuhv1aiH4arfu68Pz+LCjEC4h+XBzHCaEYXiXFJ+ruu/w4oatrSu/eSsqajFl
	+TaNgEJzOsOzvFLqMsuzUYxGR/5znCR8cqrSDKIV9kgnSLJAv6HCVUbY1Gb27/Qw
	VR7zlHuDki9UBfd7TWi6Ylydt/dsNUaIkK0ct0dQuNME+LqL06odnFfEfM2o4Urm
	EciunPeIBRbGHlg1wXK4aMbG2FIy9cK9O0T2IMStO9J2sbzvwsxGXXh/Kf8/LOCn
	S2+9RM8R0DVIv3ikYbP56ziH9FTL9z9XXnbr4/JGoxI8P+QlmX9f3PoGMkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q427kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:40:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1145787a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789119602; x=1789724402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzFT6kXhpHlikCbZq7Ay1pC0UHtIg5fj9LyUX6GW0CI=;
        b=iz8ROJQIqT1rrW0Jvaev6iQYMshfszH5dq/vlyGcubTZAsiMdSUg3IXx9/dqY423I9
         5NkBLBkoXUMFya3lOvFCgyFJ0Sq+OzD2YKs9HStWbqScGujQkZLMfQ5huERSiArAWeGM
         QWNO0lxXDBnW9dkdAFFNXtB6EUGTuWopj9LoODqqzAshQXaue7TizM+ES7QPjtfuqXqO
         9D5Y88Gn7PFDs0+DX9BgZFZF4DuHCgIvTWXv8dXnM+HPZNNFTO/2WRzrmYc/gvJpRrrO
         AtP6vDYpFy367o2Kju7FVhxeBQPKlWtjkcTdJzCTHKkccBBqsByNrvqmfKBI7jFuoiQ9
         b3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119602; x=1789724402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzFT6kXhpHlikCbZq7Ay1pC0UHtIg5fj9LyUX6GW0CI=;
        b=hvSKevdcmynUDMamCdgVhQlafrMdkqXzR4hcoHSKl05ArcVPrF06461kP4bY/bIFg7
         4WXsugm1aSdygrZZIxgBLtHLPi16LqMPQp0aJ/US5N5ihVSr8S+jMjT3gZOkg7uTnaLk
         24PrpGTyszs4eMvFKZWaJKuotu+6I5Sh9SN+aFhWyskEgnlvgF26rxFcsWoEc8Ok9bzo
         C/YcgLzPVodAtNXYVhtCfWD7BfsyMtlvLXm33S6+ERHzbfQesX1wzd/5VVM9oyYwrLUx
         YxvJe9U+92UYTXvXeRhDrhtgIcXyihPvaWfsEx022pvRX/+xrNr2/+vOtMhYsKI4Hip1
         TruA==
X-Forwarded-Encrypted: i=1; AKwUvBz9kCJaHwYBM6q9C6QXHzZrc6KoPvkO3d3nZnUcgcDg/FM7Lei/crXb1CMe7ObyVDyg8eRqs52GXkbnbsY=@vger.kernel.org
X-Gm-Message-State: AFuF++lXtNq/4vfLtIZbv+hPlyUxgjlfpbMpH/lTsKXGHT2VLlGRMAaE
	hMy890BoOI2/U0O00OIsV6SXWsFxYtXXHtkf3ihhSbDhrCFGy83hB5bhLjSDU0WMbcK1+rFfnso
	4yTYDKztqRac8wY3MOwTYPIY6VFgaYtOIk2E+JihlLNr1m2PSViaOdyf+wg5RlPQ+D9A=
X-Gm-Gg: AYBFou0+1gABVMV9tZoRcq7GA4tfOfMUHKRTNcHL3Bda90hnZbxBPrpAb/Z3TAx3mZi
	/7BDF/7MmwKOuMjMWwhKqaNlN9HjbKZ+/626YpzYRoAmOLYVgQx9F6TVL014K8PScZuonOdmbRT
	vMCE1N6WqxJeH2Gy7FWbUuuYbTlgN6bMyk7QiF8vAj3vkeC0UEhqnYlDWCZwoIcp8/+yhcZmA4T
	wsJyfTVoe0LlLtsSahiAVDh9RueqDNqKfpyybTf74fhnBZgkxZ7v2crkeIqAwXSaECQoHoS5W9n
	dl0TslabDztEHk6gnpH1hLJBGwhbwSPEfZhIzbK1NrJx1wgaV5Fzk+zxvNCR1XKuTMfhyV2sGue
	kCh6qyjYLiPxbbcNa3HRL99rdIjZ+ZsV7pxs=
X-Received: by 2002:a17:90b:544b:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-39d77b1d022mr6555537a91.17.1789119601596;
        Fri, 11 Sep 2026 02:40:01 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-39d77b1d022mr6555487a91.17.1789119601027;
        Fri, 11 Sep 2026 02:40:01 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm5549984eec.24.2026.09.11.02.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:40:00 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Fri, 11 Sep 2026 15:09:32 +0530
Message-Id: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tBRBsZQS0LcbMgJoZlasaeDreTluGqmW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfXzV/E9wQarCXr
 +6H0as9rvfja4w9bTQdZ56tVUIQDQXznJNdv3leFf5Nxep8JBE8J618jrtmZnICpVaPgjqCcr9S
 5oHq0lLRRJJz+c7EYwT2TrpxXZ9/f+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfX+zYp7aFhLWym
 XsctYUIPmGPjpGBhrVdr5l3R6MmF2J6gJGK1eL5s+BnZC0tkf+1qBPU4P+VEuACtF8HdPGouL/I
 WTHCfcGNyRCdGuF4Uqx+btncpbd0lZ6kPrWKcpqH8fTiEbFvjTQYyrw+GzMfhAsgeBCRVmbVWwr
 DWXvHCGhsnHlKezUCqHzXKp6AKF52qRI35nLoBcgTg38i/5I2bH+31ZPCTH3oGta0mQVuuz/ZyM
 /UyoPmB613S+lP/NgW+0M37mhU7juLvLK4P7E4htUJW5fjErTmHnr28SFpJ2HBXu/y44gSfoF1Q
 HYywhZyeAejsSuVk9I89+U+PWy3XbW5PfJG2bfr7aIy3+4F1Bf8iitJIB670NHpFFZkvsl/D4Qu
 lgejSUMFy6l7Mhmwvvo9/Gg+9/szUOXKNuX3h8q+KB5AWEnJ84Yz+QPg/UVprRQGJeKgAslrwdv
 SVzAYCtYiG7Iyype4xA==
X-Proofpoint-ORIG-GUID: tBRBsZQS0LcbMgJoZlasaeDreTluGqmW
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3cc72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lpphfDA4Acmd_1yfjz8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110134

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  8 ++++++++
 4 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 286ea46d0c36..2d81b39cc9c1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 	};
 
@@ -66,6 +67,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 01400612d147..570e77e6d1cc 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 	};
 
@@ -66,6 +67,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 7cdbd257e9c9..620c9956d5e6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 &gpu {
 	status = "okay";
 };
@@ -17,6 +19,17 @@ &qupv3_0 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	no-sdio;
+	no-mmc;
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..a1757e24d1cd 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 	};
 
@@ -58,6 +59,13 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
-- 
2.34.1

