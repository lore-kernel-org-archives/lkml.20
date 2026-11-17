Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883710;
	b=pUTDtbEQDhMWwd5iHdB91lO7yhaRyI+ULlfmJkzjesW9zxndgKaGzwbhxv0Y4kg05R9N
	 au+Y7c3acWjuifBrlwqgEM9BK/PmE1xrZ7Ga92cKHdTseAAeE8rtIFdBqT92NxVHQ9QHv
	 43hqy7qtfWSdLYuisewcUt+CYNVqYu6Tz8QGCAMUmWjforPP2808KqFOsNJ0DQ9/i3KwJ
	 xNuYColmnI+fN8HYZ5SWYOJb6df4feOynGh/V4GT+shWi3pZH5BU1tm/hU5mEJCPOZ6N7
	 hw4yvsSfryV9qBRFWIT/rZcTJInJmAzraTN6x3rcnkN05UQobjVWA+L5DX9BMpmodQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PqODReCg2QzJ0uTxGIF71OQEBQ1WNOkhUOGvJsIelJI=;
	b=0ezmNj3qRJSZ4IzurTTcYZpIxQh2qf/f+Piq6/NXhC930RDHUajZ948QqxV/oNEtUuZz
	 gbmQHzf5Te+sCVykU7oL87Dxw+GpmKdwMit3wiiQ0i1LJYsyaFMMFN16/zt/RHlVE4pAh
	 /pqO1GMBJM1xTG7PlzouxXqptlbO0CJOGwiJ6FMu0XluESUQUI2olll5dFpRZXDzateUi
	 Vix1XoHInJiI/vt2etM2kTmNf5NUZBLXkDVJF3T0gIJmAHn2Dm52uUKCap/Mp2uFda4JP
	 FB9ngL156UF7KmCWq9Lc0wQSX5Grmz7W+cPOCytM2R428/Cn/10I90YkjNrbg7b4UQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8MQ8WAK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1098606A31C;
	Tue, 17 Nov 2026 02:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1098606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8MQ8WAK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aNaT2935297;
	Tue, 17 Nov 2026 02:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PqODReCg2QzJ0uTxGIF71O
	QEBQ1WNOkhUOGvJsIelJI=; b=a8MQ8WAKJv8hIrBGcwkiQUtXWJ+uV0AeD9XVkY
	F2mCjey3EUX72PrDq17lgShCl8vYWeU0DjpjJDDrmBceJcCVd/4KQTDfKVyjT8Sv
	bFqwH/ibJGRGJnMU0mow5QMmW2HhU21i+Z7aCI1esJefSLmdZLEpho5ZebkYrdBL
	NecDD9NT3WR2tDXH9QIYwQ9iD0eTdqV6tVAChY0x2a5/4eEcb8TnKkhyouMDC8LM
	ulwxoDKV4WKt4s6BtZw41gf+9Zf27YrF9Yhik8NpIMHNB4wxJ7uLiVvc8OSy7Ryw
	CnGrIHCbzwPsziHsotQEjDNdYy3egm0kivjEXIBizkakFRQg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m08yud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 02:48:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2gJ7g3843786;
	Tue, 17 Nov 2026 02:42:19 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6AH2gJAI3843768;
	Tue, 17 Nov 2026 02:42:19 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: add Monaco Draco EVK board support
Date: Tue, 17 Nov 2026 08:12:08 +0530
Message-Id: <20261117-monaco-draco-v1-0-e42d1673148d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAG/+2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNT3dz8vMTkfN2UIhBplGJuZJpmkGJhaZiiBNRSUJSallkBNi46trY
 WAJuACCheAAAA
X-Change-ID: 20261105-monaco-draco-2d725f0d891d
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
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Kishor Buchi <kbuchi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfX4smJBJmQCKFC
 b3Tu+gOyyHx6NFDwEpsMUbh3K1WB1tZiJSrCDBXslA3bwcnbl8zWYKWKNKBvDa7oA/cL8n0v+wV
 SQpnYhiFnOy7YFfCMrsdX+rURACbXqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAxMCBTYWx0ZWRfX8Ie44EY5yNzV
 Rh8zGvReb8slCQ5gZNUGIohFB4ziXCD2LZFvSAbm5gZky83ztK4eN9nsX4TcnX/bxaljdizipuB
 LzPiTv+Tp/LnbK0IUHNhkuiLcofUadARexGkoLGgRBc+Fgr4RCerxp1Lgy73egGLGPjvvKfH8YM
 OTSAO1TMRzdKZC9JwQLZZqLyvU897RW9Pmkf3ot2s4aXqXVq2OcL0VOSSm2rVlA2NXs7/lT6uHI
 mPDGgQ97EyxfbJgWGv563SovHlxsYsQk/RXDY8pdQxD609YxB5VshfKSji+TOeVP3hiRO+V2Auc
 WLI+LiBu4FpeisBSPlbmVJ2EAn2RHprXQHeLvTkBjwPkLXO7vCO5WZKMIJ6uwhxs+KJPI8z6S7c
 C0vTcHqpWX1UvdNSyCK2XcPiPD6vFsKACvO1i3Z6nrvYuhOZsRn4PP/EErsZHDgFN1bpFHdXS0U
 P93TstCA9h94u4SEfWg==
X-Proofpoint-GUID: 9utMP2zDcyCzdLePRkMZbmJh6q5EWyEU
X-Proofpoint-ORIG-GUID: 9utMP2zDcyCzdLePRkMZbmJh6q5EWyEU
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afbc07a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JbYPIxnXxeGa9R2u3KcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170010

This series adds device tree support for the Monaco Draco EVK, an
evaluation kit based on the QCS8300 SoC targeting automotive and
industrial use cases. The platform consists of a System on Module
(SoM) paired with the Draco carrier board.

The Monaco Draco AC SoM integrates the QCS8300 SoC, two PMM8654AU
PMICs, eMMC and UFS storage, USB0/USB1, the Adreno 623 GPU, USB
and UART interfaces.

The Draco carrier board builds on the SoM and adds:
 - DWMAC gigabit Ethernet (2500base-x to HSGMII PHY), MAC from EEPROM
 - AMC6821 fan controller on i2c13
 - I2C GPIO expanders (4x kts1622 on i2c14, 2x tca9538 on i2c15)
 - Native DisplayPort output (DP0) to an on-board DP connector
 - Dual PCIe (pcie0/pcie1) via an on-board TC9563 PCIe switch
 - ST33HTPM TPM over SPI10
 - M.2 E-key slot connectivity

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
Faruque Ansari (3):
      dt-bindings: arm: qcom: add Monaco Draco EVK board
      arm64: dts: qcom: add Monaco Draco AC SoM
      arm64: dts: qcom: add Monaco Draco EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml   |   5 +
 arch/arm64/boot/dts/qcom/Makefile                 |   5 +
 arch/arm64/boot/dts/qcom/monaco-draco-ac-som.dtsi | 319 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts     | 546 ++++++++++++++++++++++
 4 files changed, 875 insertions(+)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261105-monaco-draco-2d725f0d891d

Best regards,
-- 
Faruque Ansari <faruque.ansari@oss.qualcomm.com>

