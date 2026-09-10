Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757F49503A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047085; cv=none; b=oBwfA41qPGGoeuf9hhkk9Frhcq09lL50uQho+xOLiuQRAa6vqdKE+3IqQTDCRplVu/82PTZuSNxLW3KaP22vExV6JU3huLruzETQG48djo3IkDDbW/QNGbcRl1iyasFNla4fOu8D/BONKkqCKkN6b1+9e98AqxYxC+29rzkbYBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047085; c=relaxed/simple;
	bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDOULxGozfIKZ8gR9oGrAVs/f+ItrCRoamiqmpsUt8YoQ4NJmkJOahAs7CS8zn7qqtrBz4KcjI810rFoJpB5aT3y3zkTO+vEboRtPY3dXt+LPkimfZ0jq63UpC1zP6M0jMLEoEbGza7J5uYQjKYM0aHMHu5i+uif2fV/F4jMnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+c+gsdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwcZYjMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+c+gsdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwcZYjMn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7XYl215988
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=; b=S+c+gsdm6QVRITwz
	LuCD3g/dWkOkSvmLF/LdlI5KZDqZHwOvobUtdy+/QnxZc1tXwayuNjZS56FalaxD
	z1mRwPzj5Yjy/JbEXj4ubmfRg6/ESqynEdiBAyF0jzjnkcXKlTKMhfKDoSelQFIC
	jnTwdCwmSCwaNxXeLx4BewI12oH4QH8TW4c0BBwe8bxpRK/4Owi2b3OkUqTO7znU
	YErxYxJO3NO1fAQV6I8AmFJXnEof5zA1s8amBieeNZ24JQuBAwm3PePuDX5p/80d
	vPqJ+RGtvZVLUZrn9nuY58QQ3CkJl8HfJCtqTSILYUc4+3xMkvDea8KsLjmApZx4
	pHkkpw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn99xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46f178d813bso7146114fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047082; x=1789651882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=KwcZYjMn77ae7QBTCZjZrmal9RhG7feF+haOtMdrmSqq5yKPqh+7mqxKvDB1HnNjea
         /48VArQTDeIFe/HsqdmYprhg/Gr48ZI4o3L7Yys/wctjCC+rK8i6J/NkLttdZlPcj24Y
         P1VJczv45if0iC7AjTDZ2q78PbrmAl1731AU4XHWCeqfqjRjDNlROB2HWvVoHKEQiEmJ
         +mrd1FNHZMNVNhl7MWCYp9FD66TsuYHkkwjLmIYrw28likKr9SGF5w0p+3W4KfKMkFlz
         ENvNlgGLPLZbM/+Mn557NyBltwt208XsGiLY2Bqfdq6YAZwSXFuTN54vD1UxZMUtufZg
         40aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047082; x=1789651882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=eULwli9FmIzb/rvBkq5RBDg+GoeK80efrr+ZeYcDGrqC5aCjvBmHjoAudDrvnYuzJT
         17hUE5tirdu+G+nCp3S4OI386IB+5t1N3SvHinJXSqK4ofBrl2G94q87Y0C+vjgNAXsw
         QgTJVl/ZVO/Iz4BSx4jPfLK1TSk3oNr1IOmfIxq5yuHEw2duJw2VMdOsFilT0Tz33J+u
         LI9DdRkNnhK2e45TUuLHQBC8uGlj+hPhOBxvBFipGk6j/92yJmEDF2KydLvd1fMoQsVo
         bx5rHDSB2B0PcB7B6NBwNM7nrMeKpPk/42I/guWYG9WYRJZCTd21myW4t6matQDjjI1U
         5o7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxW6MJJBE/eqFxTNkQIheFugsuoxSc/9LhNbL5OgcNrNUVwCsPWu8KW9f+6D8V5Z/Qm0ZML5Y1XJ1q4wI0=@vger.kernel.org
X-Gm-Message-State: AFuF++nXqnrD+BfguPHhnG3b5kC7wfB4zlPVkXFsXv0ZYhmPugr0Bhzl
	si5ZcPe0NXjYYbaje4p1K4G+35hNMiQ1kerjykTzQcWnIfR3KsarxcBWKhJW2bSu4qmZ8o0GitR
	irhDqR1mdz4SB6A/TJDyXTttcfiB3wCaM9xFIY3FCsrZfd7wWCVfi3HGN7WfAqicHVZ8=
X-Gm-Gg: AYBFou1TJg67VJ4yFEj+UdRIq/j9agGAKHKkQHKObaD/7ax76TXzNkN2qNpMWVZG+ua
	h/B1rwSNCbyorBLUKOQacuZsYPM7V6CQAe0tNqXTDpjdiE6C65IG8G1SofaCnG188auyRDeO/i+
	EkmRMFhNp1F8XB+z4JIm139+aQRcn9WWnWoYrQ1bbi3LIZW7NhFi4vyPCPTRRuNAmp0ACxtx8KE
	8qPjlQj9cEsMZMvpdKmZ+GGaiARIUtzlSRb8xcRN/xwLeF8gKvN2RqWWDtYsoErYBxr7TtXe9DP
	WmmERNJ1N5m6Qf2hq44mOPtpJ2U3fcKutv0yYADKIp5xZTiHVTS/vOjTxBAmNityIS9KLfu/0+a
	6ZbCZUZ787pGGmzUyrCbX17X8Gu4dOgNz7zk=
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234253eaf.5.1789047081745;
        Thu, 10 Sep 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234170eaf.5.1789047080677;
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:20 +0530
Subject: [PATCH 31/34] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=6282;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
 b=Yk7r/126fsVFqIkRtgEtkg/SmEsaf+7/pkv0uHTNSZbIwMseFkOEB4aYcjS4m01OFofwgXlj6
 N0Hcm2cYtYzCtwFtUfaq6KXy5rSwPGMa1KOJ+ijRmqrAsoEIbKHcHJg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX7sKv2R7u6Vy6
 Udb6IVyAtTNaOFkHeeaUbK/YJwIXEGObVaPAdRlBMDwQvFDHbw5ixnPu8DJW0d8qX4B8jrxhGR7
 obIs9fN1lu7Vjd880KPWaBTXZADC+s+kOqCSVGPCmImdtFScghmAU51HpOmWuff0XUBd96v/08R
 OWy88P0nF+gwkNc4glIU2RsSIJfXjQdKxLahqaZ244JPM6zCDKlZthONLlUyPc5Lw8bMm5/UYad
 0NLICbkXjHai7M5P/b5zAok6+BNJRaOWHjGMlUliuEXi9LJv5b+7fepoxr0cojDeHQrya7dn5AQ
 W/za28SNiv70fORcO8dcpgEvRAYGII/shgSZHUujf2cFuj3OgEDePK9ZfAlBWWHS56jkrrSSMLD
 e95Rl/Lq1TGvfraS4cgEmVA94CjL8yumm/x5Q8NDqhSuJJ9+QepeSGfpTPm2NXl6y8Atmq2Ywol
 R9TLGimudfzIck3PZ+Q==
X-Proofpoint-GUID: 3BlpD7wyv95MF15t6FOT7zxMZ-k4AlE9
X-Proofpoint-ORIG-GUID: 3BlpD7wyv95MF15t6FOT7zxMZ-k4AlE9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MiBTYWx0ZWRfX0uGxMEvAEFVU
 +hyk8YXLjQtInutqYCTQgrM59ak1TyfxaoGz0nuM0ZgboTkFJoj8dRBqJSfd7Mh53kYGeFtRmpi
 SDj07D4WBCxE+yFAH4f0jeF7Ynnsexc=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2b12a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i5f7Ji4RTl7zrp8u-5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100162

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 668c183bc177..9fb53fd8c3f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,15 +1108,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_port0 {
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index b73ad7861eb4..b0dc9f134497 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,9 +1027,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1037,6 +1034,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1061,15 +1061,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 1332c864801f..945ebe063dac 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,15 +642,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -659,15 +661,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 2e874f046a0e..c1971638561b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,9 +1021,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1031,6 +1028,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..39ecf4686c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3700,9 +3700,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3769,6 +3766,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3893,9 +3892,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3978,6 +3974,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

