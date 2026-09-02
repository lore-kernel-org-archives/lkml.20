Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440144237A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344582; cv=none; b=MsDK4Y2nQd58Qi4spmLv53hOslnAuBKaPEPyKORyqkdRjCjjAX4BiRkBpVsrvTTcTIWMpp0BCXe+HyOz653QgrOQfpkkp5uB8LxZcjKFdu6265GMW+Kj8otAKwwd42snwslSQcNUOmlxs5JIxuKN6zAuAA8vuTFqbB7SULYuImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344582; c=relaxed/simple;
	bh=BltRNpqRejT0J8WQVpPYm7hnxBsiPPD5fyp6AxXutjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pu+yt8C74ooXryvSBR5neboLdV5BsZhY/9PWzUdiDfPDejLLumAE4VF5wFDcAZVwscgUZKwWlvCNVllGRvHo8CHP7/D4ccNv2OvaOQR0q/+nDDEny480lrXaQn0bpi0A9PsigIraAfuvZ0GEuDWlci19XV16OIBmG/f9V/4Olvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSk5NLN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUxp2qyU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSk5NLN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUxp2qyU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5pci688858
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=; b=MSk5NLN9cHyHm6E+
	6opaAqzKypKT3BvLTJ/C0XMadjlz9ly519FowGlwA4jWru+OpLR8m7jW1shCIb1b
	Vr+vYxElf/5QK/xN1vdaXLPfQKDvo1IvZwLEWWP5HYqdSeFlYfvhMvFnJRg4tTf0
	pkgGZVxAe4XEI3/cYs2fK/jBlTTwhkvsVWpaK/ElYWC5X7QNphJqkUl5m8j75ILn
	hf/EC4slUoB5ils0RmPYHdZVEDT88AduMcPaiLWhqBs4fWbbK7vakB1VpLDGc4Qc
	UwL0HJjQdIjNnnlCIt1rhaln+eSESD2IskiEey3aUMItB3r06Ph7nCHn8lFQif3w
	fjFa3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd82bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:22:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1829365a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344571; x=1788949371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=;
        b=fUxp2qyUI9bYuRIx5qEieFdH8NUvhCrRz4tflMnTOExQE5mH84yQh0ZFtX+j+LWYBj
         NNpRQUO2sk32WQ3sFGUMm6lVTqRnPXcyQ91nLgdLh1hj72vmiDI89THp0J2vM9LqsnzL
         ZLzJoazuhpUyI7AY8b0Z/3h6Ew4rhLXBl/gHt21rzfYj/wrhLXEKFLpLJ8BzsMtxt7oq
         jXxJ0J/EoJ84ezD7fzmjlApVTn6Q3Tbaji/DafNuiKgZtren5YAeyCBnfbGuqhWX0+Rj
         NOOCqkWW3ptuG2Gb/5dmd6Exu1Xnx28Xh9LJv5mLmEmoGOnbvaj1xItsFEoRNu9n88bi
         1zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344571; x=1788949371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ep1cetOD/tSXxQv1hy46l7D5Cip1PYoER5yBFlRN7PM=;
        b=U0SvxDw3LbHor0ejA7nV/fFvqkdwwJ1AL25Q0NGm+p6IpZYK6TXhXFNRyO9QXfVG3n
         wA7ERvoirGtP/v4BNEEcsBUgMzTfl4F/tRTKU5RDiQO5INNYEkhJES38JHjU5597SKd9
         A3rNpBoa2FbOKpIXoUBpUFdlI9O1L4ntsdFH8yUQqAyMQrx9ZsAuTtL/XLne1TvnxfRf
         vSwVdQkh+L3+kP0l6S/+llSiwDR88Matv2Yg8VPVXY9ctZPvKoWoQIUtlTCzLPQFucal
         5T8TEbtFEeTckUYWcyxDuvFV2EM47YwuFjb8TXgk8pQzubqAvYQOkBekYSvFecAfaaRQ
         TDeA==
X-Forwarded-Encrypted: i=1; AKwUvBzmPDSC78/MUUtdL8VeBWuPSpOZJCD9bAWhvfSmP6saNuPXxxGlC/X5sMuAQ9wjhKwvbp07uRt5mp3oaVw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZwvIA1Sp9JRw+2I4UlE/5TTgIzzEje8dif2zUuIIe1TSqwtVg
	5FDU1VqTOrWl3wsU9FdkJ2IKpQESyanF6nLIKP//8uCkr3lGzXDj8j+2LgSqiW+gNaFbiWqoof1
	AExe3nhdqzdXTV3nDfXS6iHwUiFaVNKfssVDIhr20qikCzNsqHOVASy7t2hQ8Dj3JMyI=
X-Gm-Gg: AYBFou3ZZDpSDgcNXRkJz9nPFaSC/sK8vImeG9RHhdwEzTJDxrkcy/3xnnfgwr/GWJI
	xWYC/bQuT9FXRo/yHLJ90RwhOvgqzRxbnP1wlfaixr/ihOvMZYh57uSwayu7Spe6VsY5CEU5Pji
	FwsfTy37HVvYlu1s1v0v94hMKZ6vXkI9G1PHBA3Y8GQ3+p59gWn+Gl3iSONttF/I89owr8zT8EX
	yKWBW3OesHI66mwDBo0NYkmXmDZYZSFgsLpDrXGm9SLLBgqD7peQP1tLR2kHJx32znQXd7V5kLy
	b/q4N0skdMuN3qjDILZB3UXw+icHxy/YxpP+pzqWXHM581OS8KtN8n4eMFnnX4bPuMl681DdmBK
	iVJSPK+njP6J5L8nB9N58Z/ep0S2TPCt3/W11pzfvAEU=
X-Received: by 2002:a17:90b:5444:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39aede97c13mr6139277a91.2.1788344571238;
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5444:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39aede97c13mr6139230a91.2.1788344570812;
        Wed, 02 Sep 2026 03:22:50 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:50 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:48 -0700
Subject: [PATCH v3 1/3] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-1-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=1720;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=BltRNpqRejT0J8WQVpPYm7hnxBsiPPD5fyp6AxXutjo=;
 b=kuA5mkZdBm6/pNs2QMeI2TxTptxg5jqQrHIHVMTmphhErcaknsH27HMA0A4igl/rjqWZUrvDr
 BOzvKvv3bM0D+mkjxCwEooJTvtNoH39ECuIgxE9CbdTC7ueNVGliQlS
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: CZxjoDHGGFwwm0whV2n2eRa9Snt0WJ7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXyvtUt/i4BfmA
 MW06EV9cvmKa9dC+vKPpiX4SEyJbV4eeDoeukQOFS989agfBk4swW3qSXFqfeVrbRkF3vaRRsng
 oal0FvtnMFSiKeas3z7Zm52bD2s4NAsWd80zBU1bR331NxSH0OItIzwnnlyYwDKax4NuYkmpIKf
 B1JIku7ExCZbHsP1k0cd7ZT7MNfglZXZVaDLhb+TefGIYNXHbIfMnjFK3obJtAjtT/RLoMga6lF
 pvB0XMBtyFzVPjn/5GbiEyN8VuagcUV5H+GRe4er3frd1Rk0+scyBLDTVcNILGH2yh5ae0doj0O
 QaodOU6rMEj2dcKvmUTaPNzrSmfMHI3oUfqlD4+gzV3EvcjspnP5H1s1Zaa9PhCgOJ8HseiR9YB
 wi2fxbOFW249MWLBlWd0pSxZ9bjRevlXrDBE72dHQbq89O+cdK6Lc6SApsCApniyMv30sgKHghm
 SRQLDSwwKmJolRlgSsw==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97f8fb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=etYmfIWrwypQtZQWCWAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXxglsQVjHk7M4
 /p1Xh9am3um4xMDJPCYPyqkjTcqT/pUOgRDtOZNWhD1bOL88xRoId9J3Y+XTN0Rms2X8FMNFby/
 HeoK0wuKtRg9J6P6RaoGN1rjcwSGCvE=
X-Proofpoint-ORIG-GUID: CZxjoDHGGFwwm0whV2n2eRa9Snt0WJ7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
TLMM pinctrl; without this the pins are left in their default state and
the bus does not function on boards that enable it.

The MDIO pin configuration is identical across all IPQ5018 RDP boards,
so add it to the shared SoC dtsi.

Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
8mA drive strength and pull-up, and reference it from the mdio1 node
via pinctrl-0/pinctrl-names.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 4fc627b47fe7..cb3e1202b582 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -241,6 +241,8 @@ mdio1: mdio@90000 {
 			reg = <0x00090000 0x64>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			pinctrl-0 = <&mdio_pins>;
+			pinctrl-names = "default";
 
 			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
 			clock-names = "gcc_mdio_ahb_clk";
@@ -421,6 +423,22 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			mdio_pins: mdio-state {
+				mdc-pins {
+					pins = "gpio36";
+					function = "mdc";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+
+				mdio-pins {
+					pins = "gpio37";
+					function = "mdio";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
 			uart1_pins: uart1-state {
 				pins = "gpio31", "gpio32", "gpio33", "gpio34";
 				function = "blsp1_uart1";

-- 
2.43.0

