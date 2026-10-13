Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CCD409102
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886637; cv=none; b=kB5iz2f0YFb9JnVOpdwew129yWKdug2URfM/oAOlOsmD8HKeqDXMrQTmhJRmV9KfnaKwQytwks30yQxzLYVA1rH5XnxrwcVJiKseqZU0h0Ra6Ab9vj5wMTDU1LXq027anCVXSqJ26WsrahoOm31DwnbM6rPzh4fgJCMXQCr5go4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886637; c=relaxed/simple;
	bh=Nc/7L25ppw473cMZLDfSHTkAdQ61YYv4xbHO2l7mNJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvucuPI3QDPtQOOB+J3sNIOvr9SBlsw3nWOar+Hhm/Nk6RPwEEK3p+bgs9SV7MjZjPTx1j7alihWsyXljG8nuoIcz4Hjb8p8odajp2thG4ZWooW89Em7+upkj3ibN3bdm9u7md6FezMvs+4bFp3DXv1CEzzXPv0IMCAWwKZlEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKnf5Pyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFZcBgfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKnf5Pyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFZcBgfI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8WbnL923065
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=; b=fKnf5PyzQIitLqHk
	/w4QuRiSVo6GKqod1N2AuvuOF5L6nDflGy8lY/xk4rORieCQfGa6Zm95fsEbzCug
	x7cqrv3m/XrM4C7nvaaJ4k/Io9VL4tidR67oGxA3n/Ey5TzJBBqntThflDd4e7vy
	EwRnw3RfyjhwWft5GBqfPoxL7ca7WPpQCkXieoLXV1cTb9WE6vbqf/VW8G3vFnDR
	tnEUCM/UeA7DQIlsGk2EySEMzHpY0KLAAwvbuH+W4dLgdFzErtl/lgiNAmPRL4nI
	egULl3PhrcnUHBTK8xTL3USlXFCmq+JfOHehffxKs0deRdszkyxFFIadIfcvujZO
	+pD4XQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1td9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2394950a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886635; x=1792491435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=;
        b=FFZcBgfIZ1mU05f3kXDGzaNq1B0+NceTnUsJiObwEjwt5lWFP0+3ygwxZiXk6+akAE
         cInWfcUi2JQ0zempHpVje9b1khdU/QoqznVegZ1LTBVBp+P6udPJ9lIuUnbUG5h32u1N
         BLU2NCSfJl69kP+KIkrfDHVVVf7jVh8+T4kyw3yvrlO8tBw2fXAMBe8SFcqgFsnHnI4p
         SpNQrxknZU48HC4ZtztXzwt38PCldfsRccJB3g5MNksPT1f4UNCbnAvjFUAILQni5h8A
         /rGOlC5HepC0Rl8dUrpin0o6J9Y9pw6T3mHgPiehS6VS6Xt+3R7xfzuvlIF6SPQIZUBH
         vL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886635; x=1792491435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=;
        b=XlLJrTO0eSdJsZlXxgnwfW0xb3n1iGqFn/fgwYS1+CTRrbNgcK2WXKyCKA9iJDzdmQ
         Ko6Sh0SgLYYCjwTemN8cIKX5JQavyA/n2DEMCuaOQaEb7ocXMaeAfGOn5MV/ERY5+h3j
         WAjtdps+YupPwE8tR/geXrck2plTniaZwcGFmMePAnHT9jnlSJW+dKonZAR69fWn3Hir
         ME7hvZGhspQNcjrIM6LFklmTuQ27CoafuRYoJ+jTXiUGnfV7lSD05PQWVrMDgYQdF08y
         6fqhxRb0k2qu8/WwcYJ8Ix4rg8oQPMJw6ugfGpkZ4TsMmfAIl85sPo1Zql+zvsa4t9aM
         KCQg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ9i0H/VUuVzSc7TlPU8e8hqrSY6pwD/CGpLbAt9tVdEfjYZrbzVBEyvG2HpazcCmQ5myP7UheMb0sEDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2Kw1Bt65lDYRB9OKWvLLCWoTAooKRIzX9sQLGWPr7qD2hGRcx
	6v2rkAU5MwVrsiAeaUG5KUsLQFtRDLJPJv25+O+nAjNCZNA78mr8o16lfY+W82DbkqgjBBpx4OX
	0hGI4FVLNrV/C+cUa8KI3u0uKm1P3Vs/bwKK9Qn9VveAguOVIDddP3L8MASNtctggGAj2aIzWqY
	g=
X-Gm-Gg: AYBFou1B+v7EF7iS2ceVhK8vnmBW43IaKOlW+J1077YCBj1KTxBxLM2QpH6KOqypfC2
	u4TiJlUM6kT76bONVAtCupkprqz4gWjUg1HEC4DCfjuWrijc3Wmosi4VdwUE8E1f4l8CTU8x4cP
	ulTDB8GQMRNkiekZhJWmBrz6n6R5vZH2AOVEhH9eKccNiq5zW2qmAoj+WBtE1neylH8d8UO7EIi
	QJJfmn47wnsVZJRdn0MvgvDTxCsEFXOfldzx4aprmSgoYthtqenWmkogUNP/SEtwVUu2W9Fl1u3
	JWCa+Em4ns3Q8bye4Hbt9kPA6h5Nb3Vx39PvD0zt5YLN4QK35X9jkJP40sNYr5bAKyTvqR5X3gO
	Rb969REC2ZajMRoiGLlMT9EN4CtiKE2Ko+nc11l1ewZBEVTg=
X-Received: by 2002:a05:6300:8811:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e16baa4b6cmr6890584637.1.1791886634925;
        Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
X-Received: by 2002:a05:6300:8811:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e16baa4b6cmr6890566637.1.1791886634372;
        Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:47 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=7612;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Nc/7L25ppw473cMZLDfSHTkAdQ61YYv4xbHO2l7mNJU=;
 b=UIBsEVC0DuFMJuHxAN8ATaQoJ1+XYaeksu+ymMRI3qcSULz22rHRgH+2Lar8Xrkq7AzAhoLwO
 cl7TgMxFys0D+6dNqBZuPRitAeXxybEyY+QB9ItflUR5ctXd64ikh4p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace052b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hooUR3UheFJlRPkIXLkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: I50MsN2eGo8M7nuD4a7yvVhcRnHTDhdS
X-Proofpoint-ORIG-GUID: I50MsN2eGo8M7nuD4a7yvVhcRnHTDhdS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXw6PdrN1fmdtq
 KzS2mYYjVsgJXppRA0z8kMBeoOSUe8zHMtSI2WvQT49fyT4RzRNavd62aQqfq+upXaf1yP7/Mg8
 X6xcX+3yaMBazPw2QjwP14ZXscfKeqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXw4wwjCeL4kG+
 T/n66qZhEQuq/yNd7jI1mkiNJe062ulIviU5VxuUQpbblHynxc2jPajXwZyJttPH0sHwQ8BQtbZ
 c39neHyusqTBGWNPfDVN9w3UsCs/v4ReLCwYK4D476b7RpvuPikhNe6U+Hwrlyq+vQsfde43rym
 4rVI6Pt8JLFFWPWfVGwlXDMf4IguonSDzHV8MRmKn1JEorT4/FkIG+czhjPFlJdR6WcB1VcbjKZ
 99t3/75zdTUctRO6rWpg/cGEWaLPjililQb18gMCdX7vPN33x3xuX98aUpYHKyOghYJEb+IOCTK
 bJXSpIjTlY4/x83TCs4Jkl5rqeR1Ql4DbxA6WaQaOr1TFy5bucQezQRPtyU1TGyiZoPf6m08edn
 uq7LsZDJAQ2b5TPoPZQCSdoFf96I9x4k34hTg4QosVAMAFL5jDiRrM8DYF5MwMWUqqUMeXevaA5
 dr5lbMal63wEOFvn2PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
REFGEN, which in turn is powered by two LDOs.

Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
vdda-refgen1p2 supplies for each PCIe PHY node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts    | 2 ++
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                         | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts           | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts           | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                          | 6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                           | 2 ++
 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 6 ++++++
 8 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..d1746845a609 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -735,6 +735,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c1>;
 	vdda-pll-supply = <&vreg_l4f1>;
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..bf3c828c8a0b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -818,6 +818,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -843,6 +845,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4c_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4c_e0>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..b3f876956e7e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -764,6 +764,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -800,6 +802,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -821,6 +825,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index 096d40e49210..7f79470ec004 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -545,6 +545,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p91>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -581,6 +583,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..130946ba9785 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -743,6 +743,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -779,6 +781,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4h_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0>;
 
 	status = "okay";
 };
@@ -800,6 +804,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f26bdc1cd84a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -448,6 +448,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -484,6 +486,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -505,6 +509,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..45c95543fff8 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -23,6 +23,8 @@ / {
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 };
 
 &tcsr {
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..ac7e1382166d 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -813,6 +813,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -850,6 +852,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -872,6 +876,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };

-- 
2.34.1

