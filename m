Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C844F4744
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647976; cv=none; b=BO4vxEGOMLQlqXdbSOljuyro4V0SFaYFjSRUboWUE5kfouYZbqky/x4OQkq7GzYchgXq55w+BVToWvP983Ii/WBbISn4p1leWmL73rVmGXIbX9LYiN83eA7WsYfqzI4aJ4+TbAUGu9VhUO78HVOmm4GO/Y2nJe3YpcaFTQI86lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647976; c=relaxed/simple;
	bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7AFw40FAe5pUVQFtmshdUbLONKjwvdstxDEn3Kbad/Hg0tWB+CIqVdiK3IbEgA1wlR5M+pVd9AqVAqzZ9/h5ppgE2nATTSRLyazHC8fzUMiE71lvGlc6CtnkSxURxzGnrbqKm14UROlMR9hoNgQJiHb60nTWz6oE8nh35dd9rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZImrOUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyb+/6Zm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZImrOUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lyb+/6Zm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZlQs613560
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=; b=MZImrOUpmrVaf8nI
	kON8lorztGUMYsU8BfiKwFVWq9w8XHga8shDOGL3Eop4Ui5ViShPFooBHV6x4x6L
	jJrsE3l6uMvvxBKjXERfyHH+tcAhDa7GTm9nN60/71ZOqnRzI3lg4LsedChQF1Xl
	3OrXw8BbeaGG/JPvuCuHT1uOloMSN+2IYhlFc0vg28Ox1A7rWXcTjdyStdHsTX/F
	W/k8m+E6Ic5ZNGnuyF+aOjmy/GduM/Jr0XubwlOPBlCY/tCB1KK/JovJipuODsFE
	CChDmPWlBSJ1mqd7ewNxUGOdUCSmrEK9t+x2pTFKl5IFP9NfpS0AjnV5fpRmfdnm
	uiszcg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0s27d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc489e7a701so1181003a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647957; x=1790252757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=Lyb+/6ZmX9AdFDaUWbcCL4YtYLfAP5bx3fllOq9Q2rkBVJYtHQz5fPQ50gC88q/v9k
         cwoZ8nCHb3slVMFpTM/qtNEJr2O3m/1KCWQqNZ+VzIXcSjzK1KZMkRxpKLJY1pxseDZw
         OCt0xdV4hzDPs3JAKXhs1GyiLF/k7gaw5EBcmxsY6E2+VbGspFPJ1vw2jWr57UGCTFIy
         0HCP15nsGu1U6UEbZywVV5a2m5l1Ld5ibr8UMeAeBfrGE/WK67/49eZaWlumVyy6mrAf
         /TcKPOjPNrRmeekl/36d5rCvHs7JnRbi7blj8xSDdR393qe9fIBetkvPyT+lRkHFCIJh
         N/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647957; x=1790252757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKULm6RU78Ys5LsZQmpXG27Sz2mKXEmSi8OnTIJfeLE=;
        b=q4A+XXiKv2axE1+ofCQ7kCIaLCJBI3QLoAxRgKbN80JinIrkiUGGxmuAqf8lE54MLX
         J5rjD2Bo784LFucheSotuhzQMVo5Cr7vvmy86X7UQPUs8RANS1dWEO311utQr3ZIVw+7
         tcU/QnTVAvOzsvpQDy3aY9oJYUwQU34XwobGU9udp8cED2YxSD/KtA3S5BgGjV6mR27W
         fsfom3ID85JOfsLYPGnRqL5m3a4hvgvygL9ohohMNf+2Y3wHWpC0opuSTGYmV4M4qQpr
         baGkT3QhEW7/UWBNw2RndvoxEP/FKFEBn3rvlAnm0Crwh4cMaCEe8P+p73/E/ACOH/+e
         z/zg==
X-Forwarded-Encrypted: i=1; AKwUvBzrWsxmrMF6rIwQHIh8dRZ89GeAMt8UZBoYkCItBWOo5Aha/k+snHj6wempJrKtwKY9ojVgQWGKOx3/XpA=@vger.kernel.org
X-Gm-Message-State: AFuF++kgjEYPIyxrRghg6HEawLSbWpvHx8+5WbjgBszfAS82E82X1Q+v
	Uyc2jR2gdi3ilG+M31WDdOh6MBFP2KsX2ILBf89RtMeH1CQSIzUofeMhmql0shwjaROBqzsm7MM
	x7SHlwW7MhDalAciouhju+VknZ24eUKr28KrWQawU5XMlGbYk0HiS/QfhPHSXRcrkbaw=
X-Gm-Gg: AYBFou3MaKkNPBOmPI8qEAEZgRRxJbEsQSUd+GyInbnxXZfCFx2NEKrzzU78aiOVrGW
	b2Cb84D18bGLlJiOpIZ6+1zLCB9gAUL5oaWC6qboxECh8iH79Vzkl1I4nvZqViXGnr16hRqvSoO
	ohFuFXVEZZXdtb4nYsiJM1p4U6pDfi2E3qW1pokBl8miuQhLUVKcTAVHxExYUivSslUm0MALfbE
	H8fVSq/Bss6vyAJUYGyt6ccImOm/plME4JRFmZ0lhr2w+14mmqDBOT1UC/anjHlGvU9D5K35R79
	t8zAWmJiT1pjAjAP/qPshuwFOWuHtbAHXvDDe5L7qnJ+zPYuBEn5frvuWfj26+vU/PrwUK2uyvs
	MjQqVAkMWCX6M8x19yMNWYPzt8nMb+iD1+FA=
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382251637.19.1789647957177;
        Thu, 17 Sep 2026 05:25:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3d3:aec2:4dc7 with SMTP id adf61e73a8af0-3dd5f724a7dmr17382184637.19.1789647956559;
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:20 +0530
Subject: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=3803;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wcVvLfMlz5riSmWs553D19WWY81mEZP/GQQgeVrM1KA=;
 b=86ZF4Ea/kEzihKao6RkKVEaYTkBEE7X5iDg1hFnl33qhmEgr1e8rdX7XWvF5+QyOQurq0Qh4g
 LSeH3WHYCRNA0g9StLHaABVdzAyrls6nDHtPLTQyEby9kg1W/DJCZHm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: jvnu8_qGmEcA3szLeQr8OvQ44CibVk7P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX7myaQ5vGiFMZ
 neadLuxt/CdTjn2ilbwk96lIrx5B49WcT6kGeb2YsED54TUd8HGrLnB2qiWgGO9IPV1FUZiXgoA
 Yk6yY9iJ4WPBk8IE3gaWHX/5Oi3rv6Q=
X-Proofpoint-GUID: jvnu8_qGmEcA3szLeQr8OvQ44CibVk7P
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabdc56 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX/vnSFnoK7tBw
 JSjW7SCoDcxJzOKwLI4SIf0AITcbvZunFHDWRs8/oRLy5F+6wRk2vKtseS3I/rpDNiqBQ+iCJsK
 bGIv7uqW6vfj5KyD2LkitbruXoY05FoGiZ3neT27PLpnx8tuSuYQW78w4XNBlSRO2Sy+JLYFxTz
 1kWqdN/udTyY0j5HrcIP9aSz3B06PB/5BROOjfI+mCBodsAQe36eXhYg8zEpsTewZe8qvXO/MEZ
 7R/0PWylPIXWUERw8V3T6st8ljsuB2L5/Wa/6TzrpLQGZjrn+PHCi1VHRW3a0Nvy2ZtJNDc7o2t
 ebnlsDHzKtVK0AC66NRWgB8GWQ1jkQZNgUf8UxkzZCtvFrzdJ68g5334QgU1SUJMtxdWGnSnRiq
 AhDfmy1KRlcTjrPvvaY1jvVzI1xHC6G9CLElfmAbbLPGUm1jKHhOv3qzVXMNB9Jp5CZIMt9HvrK
 XwED1YqCuBo4hY96VzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e636926231d..02cb29afb246 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,9 +618,6 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
@@ -634,9 +631,13 @@ &pcie0_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
@@ -649,6 +650,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_gpios {
 	gpio-line-names =
 		"NC",
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..88aa0b7de5fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,8 +508,6 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -523,9 +521,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -539,6 +539,10 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pm8998_adc {
 	channel@4c {
 		reg = <ADC5_XO_THERM_100K_PU>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..cb7f93b02b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2395,16 +2395,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2525,16 +2524,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

