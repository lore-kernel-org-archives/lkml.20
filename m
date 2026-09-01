Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CDC47D94E;
	Tue,  1 Sep 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270250; cv=none; b=jz2tfmigA5RZRojverGddI9lDaNPJdKG3FQr8gJAyxJAydwjnpmNXfK3ZYfc8LpV/qgZwt9mCUgs6nrMWjffI2XyYWp7M2nJVWsyofVZbB8EG/RBH8e9+d7wI0o1EcNqJ/OFnRNHswL9xAwHRnwvYB6Ih+H/pIFyGNYp4R2+H6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270250; c=relaxed/simple;
	bh=HE1GNz2P/zEMdb39s2eVHSxXkOtmNPJqtjy9vPgKLM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R7MaG1TJxFccevPiqUTsYYbl7Si7s1hif4BS5qxqp14dGmBu7XOvbhMOX0DyC0bA1J8xRLFz4KBPEVVpowW1sIH0ukQz/knL7DZhuQ+xfYVMOMlYkj2zS1oNDMKwtV48dcUmD8b1vY+ROQtiiRc0JtYig1Ph8u1Ugpn0cWia6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwlcqDQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwlcqDQX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681DW9mi2743914;
	Tue, 1 Sep 2026 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g0m2tq3AyKuEyDrwOt+EOm
	hO6V2k6IyM+A8prQDi5AY=; b=JwlcqDQX1eeMP5Q+zocuIl1M7DepdiLOVvFKXD
	ecHF6udW11Q53ixPX14uPp8exjkpCCUhleWDQTmNhspE/nTmAohreUAmQAn2Vq5h
	aB2FJwN/MjhMRZ71d+Rlwg+EG7Cg98uDyDWJ0e+s+ZvmEI8OI1jQsUZP9AQDnn5D
	DWhusAZKrBDpJqkE9kMa812uMbFIZA0LJZ/Y6mUOyEUbpNUdtVrj1L4rDt2lnRBu
	0F0tOc6LCE8ZCdCs1r4RwGYZavAtdLOAG2CX73an9gJ3LT+ub5Iu5zd5HHZQyFb8
	p3KlHxD/RLfpX4jQFYWf6vceAm0uZ2F4Q4wNShhI8CDIr2Iw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7caqaf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 13:44:06 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 681Di31w800679;
	Tue, 1 Sep 2026 13:44:03 GMT
Received: from hu-akdwived-hyd.qualcomm.com (hu-akdwived-hyd.qualcomm.com [10.213.97.219])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 681Di3gx800644;
	Tue, 01 Sep 2026 13:44:03 +0000 (GMT)
From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for Talos Lyra EVK board
Date: Tue, 01 Sep 2026 19:14:00 +0530
Message-Id: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHWlmoC/yXMQQ6CQAxA0auQrpmk0wUgVzGGjGPBGhxJCwZDu
 DujLt/i/w2MVdigLTZQfovJK2X4soB4D2lgJ7dsIKQKT+jd+NHQLZPNyuEpaXBNTdhgJI89Qc4
 m5V7W3/J8+duW64Pj/P3Avh+ObqG7dAAAAA==
X-Change-ID: 20260901-lyra_upstreaming-872080c210f2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96d6a7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ny4UbMpTb884Vw1YWsMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: eUAPt3D2de3zsUu3IHxoTL3HYZ0nPIA3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfXxR3+61alGO+z
 XnRrXnTNCD5o/2JgPT3HDUVMzjVT1PTRqEph4D4RkP+G1TxIbG2rWNOOVpGqB5rBpvOAL9WX0qJ
 08zj2nZ1DyuxUpk6lBnEqR8N4phKsrs=
X-Proofpoint-GUID: eUAPt3D2de3zsUu3IHxoTL3HYZ0nPIA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyMiBTYWx0ZWRfX8UN3kYXjp1nI
 TW9+1YWbC+F1jPCfYKHJs+zhCO7qpNkNl032o7iSqEQ6sB+c1xdQmsueUhxSK4SW9kHx2VZSYYH
 Cqj3kNdyCvdfJrp6ObFfMeng4MlAYaVQwfG1e+iQm0u8CGGMr4HPM948IbzW+bgN62eyBPI09oU
 T1Ww+/tWsdBU2RjdmTchF703uETlGpwOxcTNw/leSfRqlyfYXbXr13BvFAhQTUGFNZM5KMzPZuv
 xusm0CHr89aAdXeGxpUEsjXLB1hqgR9WlG31ETJEcT3wloG1p9VQ5qyK6tQxD79bdz6gBW5Yu2d
 KkIyVc2WTKF/RJxjK3rfJxRJU8pJb2TItKd7NT9tLQT3qZFujMwPF44uWe3wzlCDG6Y5sR76iY2
 ig/+sN043S5XHkJcmaHsn5GozoacQ3amL3pyByLPKJTFPsJbQPSnBYEzzWUubk6pudXMwuva+eq
 duu8dDD3d1U4xwhXOkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010122

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a common carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card. 
  - Removes SPI-attached CAN transceiver module.
  - SDC2 Supported SDIO based WLAN on existing Talos SoM, while now it is
    used for SD card connector only.

This series includes:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Note: The WLAN node is not included in this series and will be posted
as a follow-up.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: Add Talos Lyra EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml  |   7 +
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 282 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 137 +++++++++++
 4 files changed, 427 insertions(+)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-lyra_upstreaming-872080c210f2

Best regards,
--  
Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

