Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BF728315D;
	Fri,  9 Oct 2026 03:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515053; cv=none; b=MZyxz1g/N2Ak8oHaVuLLPQwAJ0mY8CjnGT5exBO3tmg2OWMv1DzxgRYDwjedcPIutyPagv/WhyhPGE7B9rmXm8jdsYSkvI8zeZ/8By1h7XZwOOX/fy921ITLvbz3oEYjAMyDMVRP6cnt064q1G45mEZpJ4+yce71vbdjs+CBrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515053; c=relaxed/simple;
	bh=bc940CaYDJoEqACAsUQZVvnlY5Y6rf8fa4bWs6efDmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=laRA75ic+M5+7PkvJKjEZjiFG6dA60Ml3JR8evhoxE1i3feO5PQEh49U4dvb/NSNgbmbLvr3T0+TEijjFAlgPFi19UBvgOJzM8WAqgDUttms1lmUZ4I/t9qwODBhQ6466Q3yntWr2hwTNo+g7fJUO7JIvX7oBj8qgQ3fPBPBvwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/GgKc05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/GgKc05"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990Pdaa230079;
	Fri, 9 Oct 2026 03:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9ckk8c12QJ0+nY4bJtYCI2MRimju1Liptuu
	owVneOyM=; b=L/GgKc05eIE23Pnz9wKKQ5J72JlMC0Fc6M6//Qv0tKpZxTH1+q0
	6+DtZXvo0vC89VgN3XBKU/07lnJ60La9Z4bPTokeF/Bany9qmXxYuoU/GE3NqzkQ
	KpM1DxDlUCRbu+nAJxq9Lvu+nxglK1pe47p0DWHWO4h2Eo8XCHHDametg195urZy
	DHSj3FIB00s+o6BfIJWa0t4SXoL91n9k26ColsmBKYEWH5mGZ2fTKWHbhiRMYH6l
	g8Mf3KTRgKRzfl0fQqLyhimOZlaMQH1xHJ5LTWszJbQaSSkNE+VWJbf5UgDdd80/
	LXwTIyqpqs9S9Ite4PESasT/j8W+XhrqjaA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2ta5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 03:04:09 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 699348Bu3036336;
	Fri, 9 Oct 2026 03:04:08 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6993477b3036324
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 03:04:07 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 3B2EB20B13; Fri,  9 Oct 2026 11:04:06 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: purwa-iot-evk: add missing DP2 audio link
Date: Fri,  9 Oct 2026 11:04:04 +0800
Message-Id: <20261009030404.1981995-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfX0/2bD/ve3HR2
 Hn7x8eGnKEV2rYffAS1LeLt/KvlIUawfK4De6tegzJDisFpT6sTg4HNp4hBZk6Gxc2iMNWYVVQj
 0qBVcXD2DiJjnTSU5WY8u1K6S2GmYaNoF+sX9C7ZeDy35oTOroY78pMidKate1k+6LDjdrgn2tk
 b2Bd+hbE0/LSc3R8wJXXZj39WfiRpPJlmsURUA4zVwYg7pLBSf+YVS/hR9Ql6p4gB1vfAqsdTKR
 hHm+JnlFUg411Sd9peeRtvD9EcJoJPPaEB/4WoV9I4dwfuZ13cCK593XYNamDrCw72zCxvCfEy+
 2Rc+8nBaqhw9zjRaWVldPYrsKelgowdhyINmbnU13m/xQl6sVhn/24Jb7JsIRN0+SPu0SnDyNPx
 QgfI6ZBKK74F9exqmyfV7QvbkBpFPZFraK599juNgeqjOrx2KPu30XWnGN7zAzCvF52LO1BGiYa
 qI6iQSao13ttwmD2dpQ==
X-Proofpoint-GUID: Xc2Vj0_0vXqpgbQVT2dTfqoezVbFG0vo
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac859a9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8R6ti0cNnEqwqZHyyg4A:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: Xc2Vj0_0vXqpgbQVT2dTfqoezVbFG0vo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfX51qJGNw9oJhJ
 KI5aRTxGLP8LdUsksmkFx9i9Eq1qa4ONCEMDwR/yT/SFzJqzxn6Tp46DL5LcGWQHc797lv6UL9o
 1H8WvbeoO4CTLVjMPWxL0lnf29+yTmU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090011

The DP2 DAI link is missing from the sound card definition, preventing
audio playback over the third DisplayPort interface.

Add the required codec, CPU, and platform DAI configuration to enable
audio playback over DP2.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index a811d8ca2dbf..93cefffd1f46 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -641,6 +641,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp2-dai-link {
+			link-name = "DP2 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wifi-bt-connector {
-- 
2.34.1

