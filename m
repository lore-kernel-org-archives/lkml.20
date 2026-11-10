Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306281;
	b=CRbUruKVl00qaUj8goGARNRAv4qIyUKzW7XcvSHEmzv2GzL0AKFC8okGxAuApyAGx5M4
	 ZAtoKpNkawwBULu7UbYRyRKFGYo8nANTHDqL91UgSAT/S4QvV0RAmLqgnRXnLyN20PdwM
	 OZ9vTT3g59SIq5JRj6/njfEu3TTsPrvFV6v9jkcQ78RIA377ohQt6MgT6ImHjwXQaN038
	 UMR9YxOQ/fZftDsCyz9cywzrWD4h5xiGJW9bPGVOruwXpFeYxv+qNMSeraMz5SE5Ww/ob
	 T7WJntjSmnncY+ToxVEWvZoiNnDCgmb2as20qA9k8XAdClHxkLs6AVk38yOqdGIfzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
	b=OzAGENeq/Duh6Ixy/7fo5+nK8V6aZUJJBjUmSVcxp1hwYa9SXLYxV7trNCzcOxlx2cXF
	 8m0UsQ7wnDch3vTqp3vqVOcdFrK7E6XR58aC+D5PseeSKwI2eyheQRtkkp4l8RNwX6gMs
	 Uovp1OwvBhoUGrmKdp6cVLbLckf5P9UY77EMfYk23bwOLAUSiA/fJkkookAtsT6I3l4/v
	 zTzH7Q1fkmXH8+XB6Hz3bzQ30iUm4l3j5Ou0iJLWkHgGcQdtnybbAdd0TgypNhIQvFzRA
	 6V/JQJw7/IcyWTrL9lR5AYySjsQSB/IqPDX5kTHMAZcpF8p1MV6/yHsNNFXP368+9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZNzSO1b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WClujH5q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C850606B9AE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C850606B9AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZNzSO1b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WClujH5q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W1tU2833573
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pCtU1KcayBeoT9zqqnQ07p
	WDW9ufhr8NXme2DICgWck=; b=VZNzSO1bZ2xnFZ1nEFqtFBTbM6C3Mylj5xZJC8
	YCsQFM1R0RYFOx9NhP7uve16JPMZLvXMIz0vxvnKfKuToqjJQ1lS+3uTYi10H41g
	RH/jhPCeRzdnaizsjt4Fm7Jp29NUzyu3A+iN/1aGb3SPageEl7fwwsvEmdOkPmyw
	ECjgxudRWwUkZB4100kk5OAQU54vPiA6fzrARzAtrGRNlX2z9c9JHlzRBXF8bqUK
	+O/fCnG+zjIZuQX+y65G5s1Fna0Xp8pcrDjZFG+pEAnFmYXMmuXQ6826mxNhUvFZ
	EEVOm17O6c8qnnUsfdskq0bPzbi/EB67Mc1qlGtNJwbwyqgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrds8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:24:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so185824eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794306280; x=1794911080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
        b=WClujH5qUgtCIw56w2KFLzx9ciCbwhTkzHfsanCsDGorAeks9byTH9nVWco80t/Pkc
         JOov6LjvW2fePZSxXTCqAe+UqEukQjlU/Luq2hGuEpHecwTcltFu2Cr7gVS4nU800o/t
         3L0L45LbHAvuSAPNdLlH+K1lwn/D0UhUmi54/JuHiRrhhrdmQLVDqsvrxyHx+3YjjOVn
         fZJ0MuudUC74fsloZmh1raNWuNFtyeDzhpoUW5mZ7QKEFVIa31QP8R7o56PucSwXecjd
         PN5HVpBHs+Ai8i1B60Xr8htO6rhpC9/e/glQc5pE5iw59y2A5gu/GZZU+8Fm13wzTp+H
         TbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306280; x=1794911080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
        b=AHXc5s2kUZTnd0GmJPRa/NQD+Xq7nCv36MmEmxQFkjf2gva9Sh0Vz8k/RgKTRLWTvL
         vji21oz+uKSmrSAunfCpxAl3M/w/LwKEYqOim0f25sQyFYIgZvaWriazDS2Kx9xvDECY
         WIexN9U/L1kk4PJBCMHETZTqUuY7F8pgHgcmbLrZW7YCvohcMMyjwSMF6QkkhfOz4LYG
         Sd2E7dgKfkWQ1EoH1fVeEVsB62dLyWLvUC/1BCzzQ66OPGt0X+x+pRLUTd365C9c1JqJ
         OweOA2vrWh4UWQqzk3MFRFVA6N5s2AQIdqKsiu/sgmpdHbECpztZVSf9OYGXhTonPx7+
         b9JQ==
X-Forwarded-Encrypted: i=1; AL+hErHkedZE/WoaTAYhL3N1IDXwFRmS+h4HTXfM5H5AXuGV8V56kYclkdihKn7GvdH+pltd7dDV1mAAoZeQ9nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w1qGBq9+rnksc5m/5LYBa1qQQqieI/b6sEbg5ghlEL4IarVcC
	fzJhv4M/NmNOYMOwWpNan6XDmqj7ODgSlBeIO5JzLJYViHkA+AFrzSOiizmJu0WxGMw5B4A+XR8
	ESyUSuimYNeCrxWCWDXFidjCDdwaDGIlGQMuqF8A7ZPtXyS2jiwnfLUUaw1Tt/gVPmFD9N0FHvk
	g=
X-Gm-Gg: AYBFou2H2Jbp25C3eI1e/b6G7SJbPkGMEjwOw9xc771dHeIohYvpf47RmS7VqNuT7ve
	1+qAkThXXzyVHCPxvSNl/nNi7MVWi1KIaoHi6caEcNWC0spcYh8iP+cVlW52I4n7yi7bQa7cnpu
	jrgAGZ5TMhd/YvuLEs7KK0dr2mnb6Sd7ef42/YN9Dn5orUSjI3iDMt1qisuo+jUegzJ1uRGS1ZW
	snAmtSV9kNdUAvDnxlhd/UhNf9VW/EOmWM26e+RXu2FYJdF6MK0N+4uOAfSypQ2e7n/+W79KcjC
	GOkQbwuXi5Gt3Axf4d6CfShtOcVoB6D0WUBgnLNlGipYSC5pRHMxXLxSLCUcRbXpSA8Iwy+Q1Ki
	RG3zbCXb5ApxE/3e48WSsO7R+xqq39JrprZj4QqvnKBMLsAPwxUzuCicfgD2RysRiv4mnQoE4Qa
	c9T0yK1k9DGZzLInMBMyM=
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-3751fb34d2bmr2532799eec.6.1794306279643;
        Tue, 10 Nov 2026 02:24:39 -0800 (PST)
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-3751fb34d2bmr2532766eec.6.1794306279060;
        Tue, 10 Nov 2026 02:24:39 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6270742eec.25.2026.11.10.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:24:38 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 02:24:35 -0800
Subject: [PATCH v2] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-glymur_qcb_pcie3a_1110-v2-1-5f00e79613c4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOLw8moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3fScytzSovjC5KT4guTMVOPEeLBwWppFkrllsrmZaYqpElBzQVF
 qWmYF2ODoWAi/uDQpKzW5BGSaUm0tAKuijrB6AAAA
X-Change-ID: 20261110-glymur_qcb_pcie3a_1110-ff8b79c765d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794306278; l=4575;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=BCBTA/frB76SuiJPkvLW3JXK5QM4du9paQKutT4KVrA=;
 b=8E7L+tdnJFc5ZXRIw8FavsRfBzlyeY39WvOBPjEY0ew4lE0REcqZFiE51woDXDU+LMw4/04t7
 SN6u7VkScHvBY/MndkrpXG5LnoKBWsoQouc1FOhncyRXair8ocjeR/p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: XXP57NjstTguQOUHvD8dD4EhCNQC9-0n
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2f0e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_DYB0qbgoRNhAtT3QCUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: XXP57NjstTguQOUHvD8dD4EhCNQC9-0n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX6Pd1qm4WPhqy
 yr/790Uu++UJgBT6S0ULrl7qTXS7CTaNRinks5mhGko9i0/ZOwnoxwe5jmeVcJ5KECXBCS2uEj1
 Ub+X3SoQ1sJ3150ZZmQj5ze/H+2UvcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX44aKpzRaurpS
 RN9xunURqmF1RGtj2S9fAxzlRX/o9xC4L6FnAXP9yHQzIv5dWTr/KT3FhM1ONxrd3frlhLVnLGe
 JhZpYro6Js4T88+CBgJadVAtfjnPLKalmCZgwedA5sdWj5ju2xj3ja0vIEM9B6Z5pBwtzduW3nW
 XNWw7QyUI99DZly9/gmJwsUmzG0ORa1K3GERa9KdsO9w86RaFggVePRxFs7KMbyYBd9FVnKJwdY
 7LdDDAcMdm0OeJ1JadzC2WG/5AePCEvDQlrQYXZhgduX14GVHNzkkzWgyfKbeLJwscOwqxcUOGV
 vOTUGcExyCOiercSn1mgC8cVP6+s2FwjzDqROQmFhSnotFERQ44FZywHo7/x+X0Uoux70jf+7i3
 snnCKoFALBfIWCKHlXmY04cN1ShHXE+sx27yESPAUb7Y70WEA/QSzRPKBXzvvfmvjtQzettOB0E
 R1CnqrDZC5kVrSs4XPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100041

Add support for the PCIe3a x8 slot on the Glymur QCB board, wiring up its
regulators, pinctrl states, and PHY/port power supplies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
This patch depends on patch series:
https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/

Changes in v2:
- Rebase on patch series [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
- Drop output-enable and output-high from pcie_x8_12v, pm_aux_3p3_en and pm_main_3p3_en.
- Link to v1: https://lore.kernel.org/all/20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts  | 50 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi | 63 ++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index f0ed47adfc2f..e0abdd8c5941 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -13,6 +13,31 @@ / {
 	compatible = "qcom,glymur-qcb", "qcom,glymur";
 };
 
+&pcie3a {
+	pinctrl-0 = <&pcie3a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie3a_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
@@ -32,3 +57,28 @@ &tcsr {
 	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
 	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
 };
+
+&tlmm {
+	pcie3a_default: pcie3a-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 9751fbcc5f82..51fd34d335eb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -71,6 +71,48 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
@@ -631,6 +673,27 @@ wake-n-pins {
 		};
 	};
 
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio135";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: e23355aedabc4e1161ce8789f7f00d4554ef84d9
change-id: 20261110-glymur_qcb_pcie3a_1110-ff8b79c765d5

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

