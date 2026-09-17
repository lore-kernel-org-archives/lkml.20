Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC514E1C98
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647987; cv=none; b=qdshptOi5ovHl572NTm+3mDOEalJ0C6ZHjU9lme2JFrJODAfGLGxMtX0t4NeSRamT9r3wc4Kyq5DvE7XxSrkDK7JLSS6OR4vUhC1ija8moWOtpEJqZj3xllleyQKnmXuBT4Cejjt+Kn6QBbKJ8DzL5k9SvfUUarrsedy8CeYhXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647987; c=relaxed/simple;
	bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRm3oZI/ueU6D1lQlI+DsWF1HN1Ql3BITkhT/KOzwkirQ5+UebNfKktr2Vu/FVv65RIEWV30vo13tOhz0Rs6QeY4hPbTVXwfg/8Q8VppbCacd275Y9MLbM5kr56XyLQpt/RyBgH7d5Cc6XeYdFTc+MtQqpwCLISbVABhPUEzr4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EB8OaabC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhoIKx9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EB8OaabC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhoIKx9B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsVL4186816
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=; b=EB8OaabCZ0I2psom
	XTV9H8U+7cNXO3Pyb7tdXj2CD/yK+oNdSRY9YXPGcIPzjTOHPgmsfIj5i6SNlW5C
	oSPVGxa1cgbD+QDSn/9DvDUFkfJF8sMHq5FraEWfNb1ehN8g7tQRNzcfy6jyWrdp
	gpm2plBC9OzkG/p/wOl2s23Gv8n3CmrbCiiuGf7iBZ3ymO7D3CeAU4xsmJOcAsfS
	xlAJGRQIGMI3QXzJEcf0P5jfcnr3/l1FLSMIyfjJt5k8pSf4LRONDG+JWjukZKr3
	qazZuTbdmBUeld0X62VE+D1GJehPPT5uwwAm8VV3cYt4kS9VbhO40JXE/mug/lZu
	NgDeeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca5c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fb956002so11105225ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647976; x=1790252776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=PhoIKx9BlPjycAxy6++6BWMAjEuiqql+Jpf0rmHmZqRg/Zz7qlsgsUER5k3OXm4yTx
         QEQY3FGcZX7zd8QHk0iP5eomEYm1B2VAPKUQ2t3hiTWUQ/mD/ukGKZHeasBh2kQDaCmW
         O7eyh7HNNb6z4yUoa//lJGfuXA96QbmD0IIq4rTAZO3/eHD9cDNZWYfk/g6fOfK3nyHD
         cy2ocWTTK6BMZP4AizZH8xlZl6Y+OarpQmt51LPA1WPUYLBfZqD00OjRobp+ddw5WVbt
         lAHmYMHx2O1lwA8JeGNEDuV0dLFd/n3+5yqCu5EqxwmjI9ydgKHJJ5rF2pLW+8IImiCO
         rx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647976; x=1790252776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=buJSkki6OXjUYHdRNcnH2CFscOqAt4nvY7lvAW7iNK/g1Qy/hGw+R5mHNyMxATJkKi
         eUsOnDNEX+A2x0pPS571FE/gTjM2JD/CpAxeAT+ZkLzLyF2yTI03BuYTXoJcLfVw9RWm
         umB9RrtQaysQKNzyCb9rrqBQ53u4ptLmk7tIT5nokvuz0pFgLoshRSVmPcFrTsGHTEsL
         V4DFj/7Ss3dngKn3nzpW7HDO2R4s88OX5DYFxTnixYBaHJicU5HjCHFkX5jGxJH8Wkld
         6xVtGL5U0jRIQ8t83XGbvgiPX7g+Y1Kk/Skyxu/yLGd+SZx8pY5w3QiZcVVKcjbSif1M
         ZVvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsuy0ILZaz98YSUYWT5chShkneJw/ln9zTx++iUwDX9AGzbLBhroAM54H/uQ7Wv7dpJ7f6f5zQi2mopfE=@vger.kernel.org
X-Gm-Message-State: AFuF++k6pFzkliFnYzxa2nZwxxFewHuh+jhpA6kY3L2aC8anETokWHFT
	MgzDRnxaHJINTU1axcMicoGaNBrIeriUbQbWUF9mvDZK5kufqWhsXi4BpkNB9dOxC20BvahZG8M
	YgPaPExkuV6hdXhEPyPi9l3/VbImaVCwB6NcBSsrE7scxJCnKCBOz3F/g8MbiUVnaKgFFtv6GBJ
	w=
X-Gm-Gg: AYBFou0bUxwU9vgJUHYLEnsebTHA43A3C/BUtvCykFDMq3Spy5LoBHgeTZNCDxGru/g
	3AFNbGlZwXqxrnt6vmhVF6v18KU+SV+9QL5d2z0RwEDN3MGJ/WhAElMiqLfMi6cMDKmHYZ2gfzP
	Eu1gwDDVVewDquRElP5rcjTbjXQ53E8AGiy47Jnpfs5iRwTV0/3Q2z6Km1NZlak1asrguEMbqlu
	Y3AjYiursGTsBRNYZKlOyXc1DtnHNuOthnq4s6NRuVRY3rq9zf3MJNb/9OCZV6C1oJxzJoYtBNn
	o9LxHlZvt55RgT8gIYSyZ3vAMmAsmF9iOT9LLyh2G2jFSNIqM5q0XoleHYFLs9Pql03K5lKKjnF
	0UV0IAxMUmBO4QtPxfroSlfkQ6FYcWm7y+ZM=
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140392375ad.3.1789647975329;
        Thu, 17 Sep 2026 05:26:15 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140391465ad.3.1789647974417;
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:25 +0530
Subject: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2872;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
 b=cF9I/hWsExkAiVbbV7/osNokxs5yvv51z0xwLwPgIRfvgP6gbsnI1/lgRPjLFIJGCus2wlWde
 B51WrGA7n/HC2rQuBVRdkGrHlsrvylK2617RcpGptw+etC+rmEFLDGZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX0aUeovsNfrP2
 NGvdXQCOhsU0TDgjD2KT1E6goPNH9rQHpc794Sdsfd5Xa4m0hQIH51dsAt3Dyag0TJueBQO9lLk
 Ew80w0mg2z4Hny481AQjqZgazmaR1Pteikt6FV9uwx/C43QbqeGXK+jYM+zEOmaD9K07oHXO3Eu
 nMmyvnx0WgWmucyMfuUGhr+H1Poe7D1UaR/cM1+SAzLFh7OScRJ8HfjZq7PXe8ewzQP7/KsuYGa
 HY/5yEPH5xchmxLK9tgaOCKa0lgvUUYwtkCEk5DHAi0x7Rf4JXHouvjx291B02DKNjJLRULyde9
 AZHpDbsngMuYDDIiLnaX07KvEl0GjnSEQoEu5il7W3YBNoZnNoiXsjuBt5fpc9FV35ifDFDVdgX
 3n2ej3SKfkX9Odm9nVSkQQSYEUZeGkxbWnWUv307/538805hwFCxGFtCEUeN4yLnsr/vCtmcAse
 ahaDIXiXoEWk8xKRCFA==
X-Proofpoint-GUID: kHn-ITamrWJ71JpnHNp7qVxwv6wxP1vT
X-Proofpoint-ORIG-GUID: kHn-ITamrWJ71JpnHNp7qVxwv6wxP1vT
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabdc68 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5Bm5lB/o04Uc
 ohc//2P/CkVhNxuqTpnhols6BfV1S21koNHuUoe0pxE+tSzMYWgP4i7Cig4QaqAu1QfhiwzHjNW
 2+b22iU8ThwgzXLVlzt/EhY3PoaCpHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 5 ++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 43f110ba3a7c..142dafb04324 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,9 +444,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -461,6 +458,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 198f656bddf1..aa2d9532d37f 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -366,9 +366,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -383,6 +380,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..a22f78f5a5de 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1367,9 +1367,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1397,10 +1394,13 @@ opp-5000000 {
 			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-				bus-range = <0x01 0xff>;
 			};
 		};
 

-- 
2.34.1

