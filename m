Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883352;
	b=1SllihCpwXSD2D3Cd8HEx9ypbW2xjIu8y64zAKqmkmjxNtS0SxQhlSLS/uJNuyut3K5U
	 FoqwazecYpGSM/I3jpdcmSx0uG6qyXsYy3PpWfGmlJhdac4DRxPOEyF5OE8vhAhpuYolQ
	 9ihcOhC5+VolZQIfrszCou/3pHHnxVUGUZiPHLOPdutnpf/v7mvEQBmEWGrePnL2A1B+z
	 ++3uxzeSXQMCMN6KEobavqOJTtjM0QiCzJ991j9O7QbEKconA18k7Uxqaqd0bnts58mqQ
	 RYDNGokFPkh9rHTpe6KfUrzWK4QWVnUg7aV8LCo85MnH1NuMsn6FiI+mNXvGevK5KWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=;
	b=zDGNAN6m9MQLCxOVpB3TlpAZeWom/CvHFzUMy5UdQmBXvMhD13mrNurhz1n+y84M4TQM
	 L0qClnM6pykRSDkzZYwnWyhu2Fr+mN0g+ATGCEfww67DXVeYnhN/XmrIRVE4B6id1MNGN
	 b7Ys3vEU4RXBdGHlNBMvEj7ra6H7H4NFINDX6OjHkNVvbzOWTeg9VOhNlHBWNyiSdeqCb
	 0nBh6DDqeXnqWgKcgzYcukXADqpSzOHLS+AQdco+AYK6/r62lFZG0bgY2riy+eEunqn9w
	 N7R+1HOquADQfav/9iAAYoUUMbfSZuF1l8YrvEmONBztK7VMgrRQYY/JYA2mT5dPU+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IS6ZyH/o";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5B9606A31C;
	Tue, 17 Nov 2026 02:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IS6ZyH/o
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2adVm844530;
	Tue, 17 Nov 2026 02:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TMnlek1dv+xjOVL40CpOP+/J/naLf/Y4FKMINBX3Jk=; b=IS6ZyH/oqsX8SGoN
	KFwP6znWe2ElLzSdNk9ggo7EurFIQThj2TaqTkKpifodEVrQZTLEHp9VzAHY6Yxt
	gOcyFMgRD2CmhegaF+0WNOEOJP4MKu+5296zy6FZPrlzZaBzUpoMxAtbSI9YNmHn
	Znrmm5wBbBLOMBCCNlOyfmJL14MFI2nfqOt360DM+LLbI+EKF4uNGFaOXaMAszE2
	PdisHRxSOYZl+M+j6CGAbWwW6Np7qDr0V0DI8VwOtrr9PoT2hX+NLosRmPkWKZ8M
	oPoppRc62X2d7xXmaKBSzT7FXl4ugsNQITPJCa5PA0up+zKW0ogeZYxrI2RX6u87
	kRdFkA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h0e2q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 02:42:22 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2gKVO3843806;
	Tue, 17 Nov 2026 02:42:20 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6AH2gJAJ3843768;
	Tue, 17 Nov 2026 02:42:20 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 08:12:09 +0530
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add Monaco Draco EVK board
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
Message-Id: <20261117-monaco-draco-v1-1-e42d1673148d@oss.qualcomm.com>
References: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
In-Reply-To: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
        Sravani Tella <tella@hu-tella-hyd.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: JHCst1K7-D2zTIPdC0i0lw_UWxlj3b2v
X-Proofpoint-ORIG-GUID: JHCst1K7-D2zTIPdC0i0lw_UWxlj3b2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfX/7jZU+S+UqhX
 lAmYPBgGoyEcJncJrpWQPPWAc8QkkCZ0bmRZm4PaPL7Nfcg5TqJ5g5vq+ybWmkiv7sawcXuAqgr
 1qDbFEY8x6TzooGBUseNTAO9d3s0FdPbOKd/e5BIc92rM9u+JZ2d2cy+bHa4b+BWz0Tu6lYJxCb
 UDq0eu0Dok3cEuaW/mBVi6wswAwzJMrzmlKMHWfvinV7tFmMCybLmPbGmcT6dP+oR/NLApcgpkQ
 3NhVMYyTo7ATJbDqay3K0vtlED/yxMBovuoe4f152wksi9OU5r976rI7mbUZq1q2Xvgz/raETc+
 bdgSDk0rysbHULdZI9u52yXfBZMCZ8ZMkbj5uqfcMMxYxEBtR4QwOFUOPI2hq72fEp8t01ysqvA
 PVNdPXsBnJVi6qUm8wI4Rhv8TGJwM1URVHf8UPQqY90DpIK2gCoobCvCi5BimlVknIFFfw2LIWO
 v+g+ZOGR+fKVPRjJvPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfXxivXlBC7DEa+
 RneFmzynJx/swjPHzkR32w4hKBZd9THkX34Dr2zpPRJZTZY0wau3TzrrVdtgDmigeDKx6Bg5CD3
 02dXx1YTMduhQiFgpiJo8YvbqXHLdSc=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afbbf0e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=468qcLa_HG7mkFRz8scA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170010

Document the compatible strings for the Qualcomm Monaco Draco AC
System-on-Module (SoM) and its Monaco Draco EVK board.

The SoM is populated with a QCS8300 SoC, two PMM8654AU PMICs, eMMC and
UFS storage. The SoM is then connected to the EVK carrier board, which
provides a multitude of connectors for peripherals.

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d78bd8a9e373 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,11 @@ properties:
               - qcom,qcs8300-ride
           - const: qcom,qcs8300
 
+      - items:
+          - const: qcom,monaco-draco-evk
+          - const: qcom,monaco-draco-ac-som
+          - const: qcom,qcs8300
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:

-- 
2.34.1

