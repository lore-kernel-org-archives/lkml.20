Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813BF493D3B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047039; cv=none; b=c9ywso+HnBovdg2yd0r3o+H0+SeStQQEFoqiMvWUdxw12eddjazLbkhYyaP4btRKCah4QTvm8v4cNVK6s/W9WWDA4CGk8t3mZWdl4hsmPSicwEpFwNAxaffWL2GjgHQYfw+UM/c7Iz/lV6NwRy4ARQsA+jWBqgCA4u7Cc6ZWqtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047039; c=relaxed/simple;
	bh=Jb86lq2W/qVjcMbz9A4WlBbHi6Z7bIdD1OC/4rQLyOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ei0/x02SJ8FPekk4GbvxtkeHfF3CNC62Uv4LPs6XiqqO/ALXDWXmqvaupVov5Eh+7mbljEZWxD4u/RVzUuoCW8sI/ry4ftXbq8ScsgQqQQt/3zkT4zjYMNi1fgbnA2kZ0REdZHmFkDIVLDudmqgkeTCl063UvZ+8/d97/LYa8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZphqWBWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XY84I3ST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZphqWBWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XY84I3ST"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7mQt3893327
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=; b=ZphqWBWJwyFcIl2U
	E2kBiEN9yJXfV6jt6dFLTEcDyqy3CTA8Q74NkVXMn6aKTxql6+3NgWJ56oO9eCug
	c6StLOwuuF0vzYNlbrdCOJT91jl8zRdd/tVzsAxgD2E119stgViFyaO2rFg3Q813
	FpPZ07tfxvVTRZVjI17C8OpxqZY8rS3Vx1/AjTIJDL5W/iYK4/cPLJstB87CYYG8
	AhUjdbNG2wrUBv9PzzY/qGiuNlSKY5h9TX19j1b0dDB4h/eNPOkp2DoXUW7GivrY
	QugrmvkI5pJBQ/hydK6L/Mi2t121jQmMn3xSuxgW5h/6LFJkzNsnWbgxnHC0Ep28
	BJOBMQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8s1v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:36 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1aa28c903so4191037eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047036; x=1789651836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=;
        b=XY84I3STVjHGgPAnt3gyHtFO2/mzliREbfMeq2rtk9ltweFXwBJoi4H8NFSbegFPk4
         3YIODV01e+SnthviNnzFq82SOp/nvYkGMwcedAJdClHTwh0T15/btMP6UvZ4SIeScT36
         8dFVG1WjtXLlXA79oDYI/z3pf1qOd4iW0a8Sx37QJNdoSzXFNmbWIrPmLnv7jNwQRGow
         8lstPm6hVrpnUQ7vxW+/3xCcuK1jcgCnoh0M4Xgv22qjCYNgHu7+BQxOFtKCXbJtubCS
         V1PARilEYoGBHanZ1SjGKambeCqcNzUy4KE3NPcS/PX/sDKfR55OsIm+rJqYt1p7/xUy
         u25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047036; x=1789651836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=;
        b=OQDQ1YsSYP/Z03c9itX0XYLzK00hzDOYZk3+UMzkNPjqyj5WhZH0YWGWif7aOobfu4
         jB00mlxWMr24YjgpzTHx+R0b6TD2mScLzxvNROflr3w6sxnWOxjk0vcuKh3UJ+MlhtFg
         PIEAvQAKz1TyuzhQVFwTcP3C4MMhEWX8tHAo+B2/C2s/SNkHo7u2vYFWrtB1XHJ5320G
         kHu/T7ZovgeOEv5vAK2IYqKB0e3XWqWa6tWwXZ8bTJaMK962ieGW5lMq2y1x39XBlfdm
         c5aFDriF35mEWK2kIjaqjwP8JCjngCuIX5hgNOGBNgJXoXPB4ulkQpgNR2+fe9IgwK+n
         Dpog==
X-Forwarded-Encrypted: i=1; AKwUvBy3a28QH0/R+Pr+PZBmzzk1pulGa+IU899VT011sazD0Kh3Z7YjyyBChcbT0Cd5Ze8onFw6Xpb8HKMI0eM=@vger.kernel.org
X-Gm-Message-State: AFuF++mifV+954Xu+0RCjfiMG44wN79hJvkPx982FK2wkC1FrcxP9/uK
	R9+hgartKuMSG38i2lLsn1GfQ0ygrgt1THbmOV+YPgPMDLL02mGwXmRMDIsqjoBVpUq65SsBKYc
	WkFWthIZMeq23f2qJum2cGUb56htvAq4e/cDRZqVLx4YMslWAvZJIWs4g8AD8/pTm2Bc=
X-Gm-Gg: AYBFou2PsyJQT2+7EriKyoSehNGTsMFn7s+Q+v8sId8o0shxMaLEo1V10J+BayxKquL
	EX7Lr04WQXOxBP9D8gIIWZtdqoffMtl3SUy0XkGWA6aRTOWK7O1hLK6o51xn8x4Pn+XZDAaSOPz
	NVxU8x1wBtxUqBIKFxPtyU1tQb13XqDTBq9Ym2cYMYpGGFZTG1XQEETzbk7K3OQXVyum/jZuiA2
	B19HBXQ/QttReAvlkBS5Wc3luI0k6oIhbKBFJ6vAvCnhxVQg6zGsqXV+NHHMmcszobI06RFC2N8
	Vi9u0cdXMkqwVIZKt/wfzseQmkdVBPd3XocZ1vm6K07MKEXjYNZSY9fsRKMEwNF6+4jS57QfxBJ
	NglqCa+V8lgfgKuICJYTj6kA0F3YVjaojV9Y=
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr19748321eaf.60.1789047035953;
        Thu, 10 Sep 2026 06:30:35 -0700 (PDT)
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr19748207eaf.60.1789047033852;
        Thu, 10 Sep 2026 06:30:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:09 +0530
Subject: [PATCH 20/34] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move
 PCIe phy and GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1823;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Jb86lq2W/qVjcMbz9A4WlBbHi6Z7bIdD1OC/4rQLyOE=;
 b=ilhcRFeQHiTl2P/3hDAHsWGvrpOnTqKP5TU6HgrB5K/gvAayrkowPkVhX05vH1KUsM9veabix
 E91HW/AUYreB1EAUleTWrOVb4NpoxoJoMIW/d46buEYcgXfMoN8+BiJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: G1fdW1fKvQibLkAFI7HGji8c7EJrMgYL
X-Proofpoint-ORIG-GUID: G1fdW1fKvQibLkAFI7HGji8c7EJrMgYL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1G3byWdaJm9K
 Nu+3f4tTmNf4r8dLNxwsSvgaznh9JWzSH/3At1HTy8zhr0Buvi45DS54rFZlDP1GtRo85qXF8q1
 RVXNX+sD3Fx+PGQ19YiUnMaI02DOnA21r4isiZmrUI92B5UjOn9ptoVYivAPp2VxlsHDcpCTg4m
 O8+HZSGynlhldK36Gf90VAHU8G23zbf2UvzS7N4oXcFZcSKCkX6qggx+oYXMZyh6kJXvQmlxF9l
 4J0yfubDUNLHVX6mfIvsNNipXqnLaFD7iV9JFeBhXDRiJBOAar0P0SLTrpDIuN+0qZNWF0gsXVd
 DlJTiMkvZwRUWGOSTgp77CiGUYVLmjg8EuzsPRDZsXy/i47C3GY4AowsvimmcPYMOzqYsp8Dvcn
 sduaukM8isXoZ0Diy2iylFyCcmxlDP4TcYpcVntU4aG2brzUd2KQRwqVyCYVQWAmaFRRlkVDtkU
 7o1ihFGzqcNPZZtJIhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXz4PHu2Y/7rYd
 WxoaqrPO0T0opLqbmyrWowe3TQUI+rfCCRnkKMB05jolk+rgAPBIsX9CVLM8sPJnhc+9KOUN1zB
 FOicj7SLXqygcpMvDv1Cje6+nCBbCMI=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2b0fc cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 141d263e6566..89fb685c53cc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -652,15 +652,17 @@ &ice {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -669,9 +671,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -685,6 +684,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.34.1

