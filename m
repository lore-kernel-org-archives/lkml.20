Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15994DE711
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647987; cv=none; b=n2ms6fJp38p0LGQp2Tl07YY1hb2ep6jKG5qLCVNPR4opOEQnnVVd3vMEOgF0kVTYTE2bOo2VZrZ0kSTYYQTS0CY5DBVIHUEM4pOIDqM9+0XZo65Tv7Aw4P0sM66sJ5BXsAojllPBEXohuYuNOkYRzPgIGrAvpzQhHEjcyt+Ol0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647987; c=relaxed/simple;
	bh=0kqpkWCX+McU4OWemDEHRra8kpIDnPy9O0dOQBiEauU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrubpe4lEfTt26bRLweY6qa0NQrbd95OpE+yzfuzXwfON+5lsIRiKrJItslm5Trzth2opTfBfuKQy+/Vhx5RrjkqpVPoZFQqCff9Jf68PPmXfq1xcQGuq1FPXASyi201W8mG29i63Cq6cTso7ek3IIMnEf0wT94T7Hfpo0f42RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajVr06jp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UB4sZ59v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajVr06jp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UB4sZ59v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZYm62410434
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=; b=ajVr06jpJTzbjBRx
	0LcsHc+lZ96TfHK7dEFhQVlpFFN+8CFnx9Kz/FqKkZcjvpA8TFHrr7UWIXrCzE4d
	wUBJEu+B+/Xs5/USxpFJfM285HIS4imq2KEqlEo1ZSJxQU6bFrIM3h16C3bN2t0Y
	LIeBERsob+7jkkzFmSk7xRf4hqWqpsuVsJaYfH+o+WDk2zhjGy49M59jXxWPW30n
	MxBX5VToPWits+Y76WClnIAp+cb+XGnhsJHWgmQO1u8VEfR2Q2X16kileD1eNB5/
	oxisJc2Rq0h3fE27ubD58ju0dbWxVdVUukMh6C4OgT6/7aOt1PH84U2fq+OEW54U
	Gq/a4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1496186a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647968; x=1790252768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=;
        b=UB4sZ59vwH54s2vjz820twfaeO0UAfuaXYnGWdpOAVahmLCidwyOiJ6Irx9TXK/waC
         hZ0hKe//9ZN6ZpUcUKntJGUdwhVlAMahRh1RNMuaNtUEvQ2dsGIzp7KYpJFF/ClX/KRa
         5nZvP61VgJoC166TIMf/cjBgBfG7t5m6QKZoBaCr86M3ZclhZOlfpSpsj3o1Bg3iduFN
         FovreRoR51GaWx1tUfQ++HzZch0N0wojWwkumTbFxxLcfA3YD50g03zTunYGrtM4LivH
         pbUrwQeYHlPT6KF4HTIJZ+GuJboEaI3KZOkRFm0t1QOBr9+hf+vKJyaQmMuELxjbjICh
         OqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647968; x=1790252768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ5WgPyMo+VGRWpxH+/dMYkefXTeQ1YRnMZn7FbpR7o=;
        b=cYnprd92L0vCH43j/ARpNPXnuz54j7ZYssEjO8XXik0t5EHS42HLVxgqLqHVV5vMbU
         bw+5PkcKbogYynK5LVTtglhRSshxTJth7qSghfagTVMMQ1Hvx/aAKJjoD1QKM0yDZALz
         xdteLZ058V6QOm795kAuRdzCRzChDhXRo5gwSZuadiw8aFflwqgOIKKbQGxqC9YrYIUl
         Gffkk7jyMxAGWD3PWCCwAMPSvlzL5bQN1eVrEKOM0Mb3nnLrQRiQjTaf5cQb5nEQb4kD
         R1P9Km3e6Gac1AtoHel5yHwQYa9HXbGR4lKFocfGnCr0YAH9wxtveWXXjc6JNphCxM7u
         cATQ==
X-Forwarded-Encrypted: i=1; AKwUvByn1p38B3K+bWPu+5dh6Ie/lRLbPK0mfPTKFisHRvE4gCMVndWswrRrEDlikrzCi85OFLYvWbsHMlSrWos=@vger.kernel.org
X-Gm-Message-State: AFuF++lMyuUXV3rOA6WFuFurb8/ZFK9fRwuBi9pdkRZTKWdQEtyoeduN
	xW7wJAqEhpzKHVguh8LtBLjXBNaOwTHSMVrSehg3tKeDlo6DwWIRk9WTBGQgEpm6NtFiRdzvJnx
	TiFd5D55/l1aUuHayxkVFuF8pmbHh/TX4eP6CvPgqFtJP9avjlO8P7lJqca//41Gx7bE=
X-Gm-Gg: AYBFou1V7MBgzphh4WTzlfzijwnhecrEZ9JWhuoFB7M+nsfiJxxMgzsOl9Pr+W8AKJv
	fnkJVs1Eg0PhNoorMomSZ9ve9HW9oCzS5nK/Dyca8yH0z5Fg7Ge281bHvP3jdLqMud4gcb2d0CB
	i2rfjznf4YnzSw3Ih5oes0MuzjNduXUCduP4t13gXPIeYZGD6oHgynfOpK9uwL1fax5H//ijZ9/
	mgkSGprBz8H5xVRnLxyh3TPw5xEERjjee5wqgDtOWk9XVsvivUNa+F63sPA3gmCWQF2AsLV3FpG
	SoaZx1WGXFzh117rYkz8Gbj2sVHy7EMAWmtb78FJlm1Wk2LpkEOleykuj6HoZOg2Zcyup3nmkAR
	d3waEWZOt63dRoQHuN8j5Lmn4/liytVdyOIM=
X-Received: by 2002:a17:90b:3b52:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e35df66f8mr5234937a91.10.1789647967582;
        Thu, 17 Sep 2026 05:26:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3b52:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e35df66f8mr5234918a91.10.1789647967131;
        Thu, 17 Sep 2026 05:26:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:23 +0530
Subject: [PATCH v2 09/15] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-9-6272b7caae9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2866;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=0kqpkWCX+McU4OWemDEHRra8kpIDnPy9O0dOQBiEauU=;
 b=Fc1L53BnTTwQUkah3tqgEH4J4g9gSGNvEPULuIeOYH95PREHPBfCe5YmGuWMWxNC4C32Crc6H
 h5OmoaAqdsZCVBmCEg/bhif24Hr8nEnZVfruF4maDEmN+bbx8OQm9KN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 3USf7zjtG2DJL2bLJ3mGI8DmZoLw3hVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX687RmiKopH9Q
 swzafmq0ch9yz5Tre7KpvY132UIsZi5ot+bKgRllyr5rddFJchPbeqSZj2Zluo1WSuOapL5ULM1
 073hBKJkxSDOa51+3fPyqVk+ku5d4VMm3HMvyboT75oJm/6VeJXSe1ItaKlSEZJ/GRnTFFW0geX
 AW1KNYJht5khmWoK1jHkVR+rnATh8SLIomNJTtSBmAvtazh+i5pPMCYOI+ZwZIFK30li7XpUms5
 iA+asqq08V+Ecvr0hTUuObXSrH4xwx8Fao1YWpyAaxwoHwgaVLVLi3bQvUCglJTkFLjVpNyG0nx
 vsbLW3i72mR/GwzsW4t9QPRiMWXlI+8R6fkW1lJmDieLrXR+IkYTJnb7pkLsduVoR8VcyWQ12lp
 31v4yvgCkStIUiysiBETq/w4EqP6Rydp0CbcMKNtHzOmbQXibVOflVi/0ebekXP4sag4p39+VtK
 mX6MQXc+I7DL/ddNzdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX1mMtaIyAw1qL
 0roiklj2ceQdnYNg92ocHQBYDml+tMzO8X0Qoim3BLICvA+pP5uU84v0IPzludZJuMzNEMWXPni
 mHbBlZfq6iIvRZYnPhP368S+QG8fCS8=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabdc60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3USf7zjtG2DJL2bLJ3mGI8DmZoLw3hVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board file,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e9b9e03f725e..37b9dc1b16d6 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -499,9 +499,6 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -512,10 +509,12 @@ &pcie0_phy {
 	status = "okay";
 };
 
-&pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
 
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
@@ -528,6 +527,11 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..74cd66d98c54 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1586,16 +1586,15 @@ pcie0: pcie@1c00000 {
 
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
@@ -1695,16 +1694,15 @@ pcie1: pcie@1c08000 {
 
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

