Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D90494802
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047054; cv=none; b=cLzDCF8IUsz9hW/QBAz32CKQ+wU7Xsxxa5M+gBz6sbn+7r1qICYPAEnxPOyf3qU5jn6QH437Z7nUV65uPA1Q8WgRFGfpag33yGBot8WHM/o6n6CLp/SXl3Ds2tZqOTH3YtkOjparCxpaek2i9HZjcFEUJHwfPY5eE5U+atddGbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047054; c=relaxed/simple;
	bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyWxq+PWrLv8TDsmW/6gmEHTahG/COXUwJzz2OBCOhCtG5ymWHLxXIMULscsvIjKNMfFoJqV8tg1hl+MGKhID/4OmMnuQ+EvxdPQrglGh/6sNJFO8xGOowS2AlRW2n9iF0v3p5u9tb21pV9NA2gYvqnt+wocmegV3wGB+n897cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2+uZfox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPZ0ztKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2+uZfox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPZ0ztKs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jRi383777
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=; b=R2+uZfoxJPoLyr/8
	q+CKFQ2uTdgFxSr5XG1w1sk0/alSTRxyzIzgDW2zhCHezeviwSz7y1T5xSEJy21M
	ZH8K0+Jpg9a9tNa6c7eO+VnxSzESr+PtG96R6O1iK/98TJCm/jc9+JnXBldxxS3h
	ww0xSwSJ4SRnJFOd96zxIVrUl6gkdXGETBZ1nnArxlTiTXOYmElxssQZepoA2uaB
	9gx2M1USJypIRK1NMUEZb7yI6/MyRlZLWV4uGQNly8APE6w4IfRuZ+j0ipLz0jyq
	3dBRYYRZjwrPRCuDETIbXCSLbjuqjrN/EJMkqBrbz30lmSPM1c3bkQq+t+T/uZaH
	GtKXIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv07t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1233085a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047052; x=1789651852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=FPZ0ztKsIAJ3iYFv641T/uxcS2Qpkontm8YrQZ5Tk3gGiI9VrQtLahYV3lSBTTU+84
         cBhI8gcJyVhHsmUBYSIpOb1bXIOiCUiEbIE3h4g8esFCqSCMq99JVfmNgblF1PQEZY2H
         Mq+6VVyPwmaEY3nDnQnZ8eAxGY/tCdJtRVyo3I/o7V1hUWYB6nQ1X5Eja4eqW6/dBDqP
         4abZN/y5YAF2xWwPnD/u8qIF4kvyX1r4C9BfezyGS7V0FPyVGqKtJhwxfNwuAGCEj7Yt
         rn5mX6KgApkTV7SHocFcraePHfTZjV8DuMYlqIuMhDTl2klOTirqmWGa6uoJLsZJBaAE
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047052; x=1789651852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjSK+R9ijDi4F52861fR54EIAz/vAldPCSfXJkNn6lA=;
        b=NXNLh0nirWNic810Am3Tc0xJDc0wnvi4vmvWmCKxDoH6cvIJomHYQOmGTQmaCB31GO
         kXQr1PWklll+9/sAhvwXfCdXFFWI9hTy/htTHaoXYaQr/ADIcEOF6/qE5JUdeIg8sKAw
         3SfaWAkiQUrp5EektUfPB6SUa1inwuW6PLmzOa18yPXaSUITKmqhh37QraO73/CphIH2
         GudU98XwFqm3R9Z52RT/V23aRGjVd3fY4NwoHEO20ZbCfqyADLJlzHnR6xz2jpsW9n63
         CvmhQ1DrCc/Jnaswd0lvTPYiV5AEMRT10tFgSVB2VIZeP2vXD7OJ612U7Cse6Cv4Pbtg
         To6g==
X-Forwarded-Encrypted: i=1; AKwUvBxfVrRtHS2GcxJzALoRqs5GEAmb+4Ex5d6o1KlaRyBtD1bl8Ht8OJ54uC9sVm8/RtqC0EbnbHFbwx6YJZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Sukb1oiiZNNY5qKchM7JWGf6nz8irAIxdHL5/0QwO7lf7Rxp
	uM2NQ9M5dqG5Mz5ONzLbgkMQb4fZ8QnwDG6uP9x9mMPeyMwMyw+EtE43l9cTF2XjCPSg7HCzHxE
	9uiFAru2Fiz5Uybere9qAQ5+EUCeUDhmhid5J5N3cPr8zbV3Rm5VwZ+BHKQFdBI8i0wY=
X-Gm-Gg: AYBFou2uN0NHfZFghGUNE15UIz7IZcM5EFRyybeAOi4D91ysKxJYbyJhKtZhSImVnbu
	TNZIp5TPgextTcut/jE3NGf/pXWi0zCwDoZsxEjydwwbjU3CU+DATpbonqGWlBNaenBUbgt/Nlu
	+NJTcmUxuFM1O2VA879WOmQ52Vl7BgzadSOok7WqwQWFzq3l3/5eyUE4Nrtxp5y+h5J1VY13Arq
	GTI9hmjA0Eh2mxQZGFCwG2zNwRzxQptH8owUSqhBP1sNprXP/61VE4B9ngDcNFnBk57dUC7IVhs
	DhNy6zqNXHyGQfTJNyU66FdZbbEjuGTmwioxg6T0XH4L55Q5JlbkVRDYh1f549k5DdfPI9mOhga
	y9oQllWgIDW8MI1dOwJV2A/BTBqDh+4uZqiw=
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079683a91.15.1789047051430;
        Thu, 10 Sep 2026 06:30:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4c85:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39d77b1c383mr6079629a91.15.1789047050861;
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:50 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:13 +0530
Subject: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4559;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LKfBxa22qZbO9H9P9YhONQYUG09WASL2JjEfs5CCqYE=;
 b=EZaIED8TxuCd/MkorGHX7hcWfB7QHRTDck7fvgVrWd+x+SdO908UXcPRPfYFH2/tyrDv/oV55
 AhrEjhyY4YeCl3O3xtmCy+6pXEJCGOht3RJ/ETYio+WPfblbZ0XUCQM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b10c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-yNNrFuiOvHClSI-D14A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: sTqcGq89Y94jG7EOCrnMrm9qkT-yMJwn
X-Proofpoint-ORIG-GUID: sTqcGq89Y94jG7EOCrnMrm9qkT-yMJwn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3Z8/2uYBjs+o
 6ny2DIUTDm+4UpUSrzAtNYSFT6xxlFcidMZFKQ/eb86zoWKHLGHadn5rgKOCmsVY7ZegCwE+ACY
 1bkmygQDkLR+eqar4L7eXXQldopO4kQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9Qfp+tBSUGVV
 4b5tMz1lnG/Ei12UbXKN21xCtVYwKnGmeEqOTgAhYXQMe7W+Wuc6MX9oktJMK/AH/FR0j8EWCA9
 gfVIc17JSHttz7FlbKvmxGHdT7RftygJrQUAAe6B8mzYpBJwbbtPsMIApmIMroEN6ecQYo0aH0n
 WLdyOyj788c7mxTxCAZile5J7ghK16IpdV2F4g0EPiaNR4jN9nUQGamu0jPf4ctcdBaCZ+B/r1I
 Brh/N8T4QBUZkTxWnAIOp2qmquFXk/Gc39DdV1Ij95sDLiqRRy4R04XXng/BTFwx93ITyjUKCzK
 eAYF1MBf/tD2eRaQ+HH5MPrPDoOXEj1Or45WROmzixyoQTYdfhUB2WATN3QXLoTsyb7VYr8uaJg
 x15VTZFo2gEGnXYL2CcoFikI/q3EfYLMgXxiSBzOsUy7sosU8o3b6JYYL0P6ZGUO4CjOUeQdlEs
 cpS0vkSzFfepH58MZnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index e6ab523d249e..160f6ccf21ca 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -491,14 +491,17 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 327dba55a5ec..fe773a47da2e 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -592,14 +592,17 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5e_0p88>;
 	vdda-pll-supply = <&vreg_l3c_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..a85e3211958d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,17 +1779,17 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
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
@@ -1898,17 +1898,17 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2018,17 +2018,17 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
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
@@ -2138,17 +2138,17 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

