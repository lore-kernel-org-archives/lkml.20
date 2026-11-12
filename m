Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450452;
	b=DUSThgrEUZsFI42mtXfSreWH0hpKEz/6XFSwEHbj5yox+7mWXm2F+hilVFzPaB4D5nMD
	 kbyDJLZZGWxlSyG8iBacwzV3mlGOabFBTXrVCrS15qh/KgzXkHsmrP0K+4apUaj7SGJjI
	 PJ4ErSDbzEumIr4z0MNytpj2rIs0RmnBPuwhnY+fXNH5rwWNmZsXfWxVqgfJ5uNzLygSt
	 pbRckVPkjGbKW+2aYTSuxQdHYkcGkwD8sOp9ClQkIuGMlDu7VaDyLUtvizCwJXrdePg8q
	 pPGssigXP7z6MojzIb64L8cI75ybCZAw9vBsNj6YcWB0hBwVp/b/3lU4+9u0OkTk1fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/YGjHWxOg+C0RRTUljMpyFDjyw3xnQBxFFx1mqH2fw=;
	b=aaRZ/jgiUUzD7XxkjBJV8mCKCL+HM+a/Md9LWAN4dp9vNSjVpkIpVPnEEuQS2ads6uZK
	 sL6czr89A4/LYtZllI7/3AjvzIj5S6jrJSoyrq7j4UEllZuZoTjSCM0veZSHlnTuRnPOY
	 JgqGzs6s92B7NEjxJBC/WR37/NYwo1b+6XZ908qYfhVaMg7UkEQAqtxnHoPb0aQvo2ekg
	 jLEw0uREjJ/wXrmbE2sfMfcJ2n/F1XmZOwv8EP8YtbtsR0P6G4pBHLTAhuMQJTztBcpBl
	 o7LLw2x1E5zIX/y0IRwXszl81Am5jcgNerS0bIDB8oEPngCNAn4ZEdHqjg6uz0vn+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lw6wL4nr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A92606A31C;
	Thu, 12 Nov 2026 02:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lw6wL4nr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaNP02556683;
	Thu, 12 Nov 2026 02:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o/YGjHWxOg+C0RRTUljMpyFDjyw3xnQBxFF
	x1mqH2fw=; b=Lw6wL4nr54F01438G04WQ3dVoz5XtvgNZwFPvLXUTB62Ww8ipQi
	s2vRNbcjUpWyZ0H8jJULivZ+mXXylE90oXXmyX5l/uSGDWtzeAG6G7PrD3czXaK6
	rFexnvbNLYUCamax/PuHOxEmY5pEvDf/bF1a8Cm7Cnfq6ifYkC2gBVz+B5PstxC/
	8D1lZ/Ihtq04oBF2015TDFIdpqmJnNeFMW24KQE+MuUMhgUtyDnxhIP5Bd2wZLk+
	tXRwLdrlDVJ0Zbr1HZi+svE4B0TCSpQk2ijT8oZ/PJllAHGrHabCEjzDZryCnybr
	gXfccSwJpF+hOKoE+gW9D/tfHXFYWF6l3jA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m2vam-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:27:27 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ROZl3682193;
	Thu, 12 Nov 2026 02:27:24 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AC2ROta3682182
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:27:24 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 155F748BE8; Thu, 12 Nov 2026 10:27:23 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, mani@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        qiang.yu@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: talos-evk-som: disable PCIe L1SS for QCA6698
Date: Thu, 12 Nov 2026 10:26:19 +0800
Message-ID: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: fqJXuNKrgXthdTd0OfZXHKCLjceYURNH
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af5240f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=tsSK7UIgbFkQ5VEVeaMA:9
X-Proofpoint-GUID: fqJXuNKrgXthdTd0OfZXHKCLjceYURNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX3krIxqMnYiKd
 BvgsrCxdz3GY6uqZBM4aKynIrghctLj9AAaM/jqQT0Aa/h1gKw8Y9zLqFMWzZCIvaJCRB/AKGFU
 txSg4Oc3CbCBSqFT9xF0xAVQWM9Np9pz4BtjJohaXwi8YqMvOw9atqcSRnSaw4bXpaIQ8KTXkZM
 EEzxAbQ61OvOSie+W4HMx+o5l5eon5XAIVgm7Q6uvW9e+tR63Btg7kzCo4b9LvdBp0y7Y4d0M9Y
 MQ5CctU/EuZO6iFW2yKUGHkNcjZuDwBcCZDzOIrTJdGOJOHaM8CUnoprhQi2HbpcxQhnIxKjACm
 BOQ2G6dGLu3LSqVmsuUb6HyP83C7Rt9rTeC3sTtrVWFydk1BA0xkXtQXof1/zNvrHVP1nc7s6l2
 hOcefq7JPUkGtyB1lnzqfrx80YyI4LRx1rXJDf3mNH2Ep69TzrKbyvVfYJ6ijBXYbghL5n7ZHFh
 HuAu5+v9NL9xv+7GKew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX48NmkypOUxxC
 pQ9COTNR17X+gB5Z5f0L0dqlCO4XSKoBMdo0L4TtEMUyHGiVsiqq7OWzWsHGOw+zjT9HDRV/Cxc
 u2Qt71pSaHkXKbz5yPbhwy/3w1XrBho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120009

The CLKREQ# signal for PCIe port0 is not properly routed on the
QCS615 Talos EVK board. This prevents the QCA6698 WLAN device from
driving CLKREQ# low to maintain the reference clock during L1 PM
Substate (L1SS) entry. As a result, the reference clock is gated
prematurely when L1SS is enabled.

Add the 'aspm-no-l1ss' Device Tree property to the PCIe port0 node so
the ASPM driver disables L1SS on this link.

Fixes: 0f9e6db8a223 ("arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index b76df9d86cc0..2b1e2680eb48 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -382,6 +382,9 @@ &pcie_phy {
 &pcie_port0 {
 	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+	/* CLKREQ# is not properly routed on this board, L1SS is not supported */
+	aspm-no-l1ss;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
-- 
2.43.0

