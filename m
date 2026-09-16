Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6C3B994A;
	Wed, 16 Sep 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554070; cv=none; b=czrkF/Le6HYSbhN3+yg46rdIu7u3t7mDvZryCZjCqm6hZhZx980Qmn5aRry0uwsWU53y7JOT8eRla7c34TQvn2dOQmso+xlFU7vzvaI4StKgdf8Ljcret+lLLCwU9a+meggwdD1zLhwSRXyB0fGuXQOf3MP1Bmjc0mdxix9Dsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554070; c=relaxed/simple;
	bh=PboT+r+RfT+BL1IQvtuB4M+Z7XNFYRQCTo2XEuJpVPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dw3IFdMGBq2ESE01pQTo1M2OExPBfK9zAlDImTLcdyv/xzQwQkQ5eIfeM4EMkuYg+nMk3E22Bn/uzzhc+s7XIyX8H1oh63FyNAc5+B8OBjsNdwMCbx7OvSE7ACnbBtKAd4r+a5REjIfa48YZO2Sss0A48/UjZJ6xSe3LyFcOc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBsJHMIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBsJHMIU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92j4R2478061;
	Wed, 16 Sep 2026 10:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eMpABhKDjwwEfFrmqVP3vSLbQ4e1XhSi8Kw
	XNnEyKag=; b=BBsJHMIUqfoJ1YKmN9iS4XmwgLsHaA/M5xTXCJUeIPFvVu6RoKw
	5ZIHxlp7FMlz2RBGIl2W1/fD0pjPwhR4q9NsBjP/1XvbeIcjtCv20fRfIlXkWMz4
	p5aOC4lKkGXLD+MQGGJE41BIx7iMf3cpnyQyCqLjCeyFDNX0jSJDQIxYJL5ji9r+
	FpI9CZB76Lrpk2ptsBg8gnAvyqu33jIaR8edLRyxQc+rZ8MgWaSjsFzolUw+x9mK
	wocPKYthdrOGJXdC4LtEXZVrTpLI256/6AFhL9MzhXIaYb/vlXd/KoyEv1sHHhC/
	T5G5pLMGQmFvjcZRE5+QGdEWoyg2iP3Ce1w==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksu1b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:31 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GAKT1E1158172;
	Wed, 16 Sep 2026 10:20:29 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68GAKSwf1158147
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:28 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 540FF48DAD; Wed, 16 Sep 2026 18:20:27 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add qref and refgen regulator support for QCS8300 and SA8775p PCIe PHYs
Date: Wed, 16 Sep 2026 18:20:19 +0800
Message-ID: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfXxCNJKwMQgqSl
 T9qm4oWH2/nrc5QZ9hWzRDAlI227yXbn7M+2XfIGZi7slZJbkBIYq7JpP6rzGg2HG/bmW3IrvvM
 u99GANPveH1Zmucm7I/0pUQorFCYuEk=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6d6f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MXBiqbVMOIXyEl0c16YA:9
X-Proofpoint-ORIG-GUID: 5BpUjaL6pX3F1ukrNCPpitCl-PAGtZKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfXxWdRB/BXTmHr
 Q+yFfaxl63ZsosnLoChY+F9PP3pmf7h2k2xBsbEBqJrMj+M3SGq+3MLFarVvuOjg0fe2ftnmveB
 +6M7EWnkI+SQQpSRCxb0Kkx7ssQgYoemVKUzBNyqc4wLTI99YXL7LUG8ilirOCrEceEhDudeldM
 8S0pS66EZTpgGsacV8R3YVCNLr+rVXshIh89b0GryXk+hkCQlROj2saGM0qiQFAIsVxezElchRG
 QP0/HRow5tU8Sh+/v9iEGCzJXhBGy7Qr/BGFGq2SbUBnBmKCvAJHbdIv84sa6A85YTpq5GpUlPT
 LyhKxySUUYKiAzsDmQZ251rksZu8g03JeDy8DyRfX9V2JUaeficmOoe54JXi3NlCiB9JXghKQY6
 6khK+6BGnR9eMBw+FZg3frCE42UvoHmeh5Rig4bxL9Vcj7q/GBnoaQ2FS3vSMKJhtLfciSo44OV
 zmJI6qOaTjm9pqSr3Ag==
X-Proofpoint-GUID: 5BpUjaL6pX3F1ukrNCPpitCl-PAGtZKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160135

This series adds qref and refgen regulator support for the PCIe QMP PHYs
on QCS8300 and SA8775p platforms.

The PCIe PHYs on these SoCs require dedicated qref and refgen voltage
supplies for stable operation. Without enabling these supplies, PCIe may
be unstable and the system can occasionally crash under certain scenarios.

The refgen supply in particular works around a hardware issue where both
QREF and the PCIe PHY are expected to depend on refgen2, but QREF actually
depends on refgen3. This series therefore votes for refgen3 manually via
the refgen supply.

Changes in v2:
- Expand commit message to explain why these supplies were missing and
  what issue was observed (Mani)
- Remove redundant vdda-refgen-supply overrides from qcs9100-ride.dts
  and qcs9100-ride-r3.dts; the supplies are already defined in
  lemans-ride-common.dtsi which both files include
Link to v1: https://lore.kernel.org/all/20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com/

Ziyue Zhang (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen and
    refgen supply properties
  phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300
    and SA8775p PHY
  arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
  arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs

 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |  4 +++
 .../boot/dts/qcom/lemans-ride-common.dtsi     |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  4 +++
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 +++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  4 +++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  4 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 16 ++++++-----
 8 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.43.0
