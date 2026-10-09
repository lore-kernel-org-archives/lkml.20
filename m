Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A2278161;
	Fri,  9 Oct 2026 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514720; cv=none; b=ayBIhdpmpS4dnfwaUaeLWwgDYMU/hUZZ1Wx0/I/J+t9AW9ekRXtBnRrS4YGaghiBkgyCe2aWb+cW9ycXKcao1PFy5YlqwOMJFCpvwNTN8B+MuWxnrgco1oQvSKMRTfZMcgIvUxVYUHfQOvJK6eqSM7MzPsUEoQSFBnX23sb9YUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514720; c=relaxed/simple;
	bh=mLfYN7muWg6cJGJGyBDD4Lxgs+mS7/H2NkrNP5TvdSc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sSL0BiqY8E49MuZmH5BBrhg1jCOK53s1JI85wMXsD4aZ5LpC7xSHx8oKPaAAlFMxTzA0fPQMrJM7wcHnDcrKsn2oBf28+qjHHvl2VKNRZmQKrG5bvWY78Iwn9kS1ttCOdZQpNO5sIygo2Mnc8bqouY3HyFP1vh9ejCAQhylvKZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bepV7Rru; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bepV7Rru"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990Pxjm230816;
	Fri, 9 Oct 2026 02:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x0HHg3mb/M1hd1/3QpgWqk10+iYdEx0hpIR
	LG40hlQY=; b=bepV7RruqPA8ZDuWLYSthKfSvUYWO0lfzQuxgx4vpvPIrmMybkW
	4/n+3kFDMNuF9eCKrz7Bn8dPymueBhQFCCCg4Xnrru/61sX/M9gtIqVn3PvQbH7O
	0B0DL/W60t2V+jfvDfKOis8LXuwguBtKzFzwUG84avO7CK/fg2mld8IxQAAvoFFA
	WgGY7UghjJCxGVo9U0gZ5FFDo1CXxEiy9SSGTpYmb6PSmILkllz3xIvSjGMVahm+
	93dXUf/SNMU2ijohHfv8H7Qr5oOAWSxPSnWqJ6W5u+huJFExeCObLkvSps+5QXLD
	2WoyOWa2flrnU+wX8gcQNRocDzH2soDhApQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj2srd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 02:58:37 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6992wZXM3028213;
	Fri, 9 Oct 2026 02:58:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6992wYJL3028193
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 02:58:35 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id A595620B13; Fri,  9 Oct 2026 10:58:33 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add missing DP2 audio link
Date: Fri,  9 Oct 2026 10:58:31 +0800
Message-Id: <20261009025831.1476396-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfX0YDaiJ1RUifT
 YX81WNKUzuFzQZsnLzATGHMbcbj+tur/MTJQOoyYr01ycJpxd7GgtvYkL8lEowHsbpodwvvgeCo
 PAom5vxuevgp1I94h0skAZJc0VIGjz7crz/7Hu662G29N9PjvgxYf1uoZ40Cxienyt4zJKdomMi
 4eUPkcBGu2kLd6EKecAbGVj24kYHQjlcBhfLJKPVi0pAIpCrI3fh6es8SF+RPRpKwpUD2C12nIe
 0x0mCyidA8r8fQPe23wm/4MuUyY1F5uVL82mzXxNxVYYZ+YJLUqYFmbTgypqOKz/Tv7G3hPSGs9
 L73gYer2qGwXxzCQAzuOE3gUuuAfSmMV2M/r1i1j93Gi65Ra4a5U6U3sP2YK1pTF94XOzEWO1ph
 6Ivc0ZabyypZ7z9TpX3VHzgbzvSI0gk0TZIoNGpjqDdCUky8toGDD9iFuqPc3C5J8GJ/Nwh/EbS
 eVBaVFChQdIhiq9JDKg==
X-Proofpoint-GUID: N-I7dQSmB3N4qJYTCb3gfbN1bxfkhcEd
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8585d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=8R6ti0cNnEqwqZHyyg4A:9
 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: N-I7dQSmB3N4qJYTCb3gfbN1bxfkhcEd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMSBTYWx0ZWRfXz3oMcM35FsWP
 j9fYJgPDlBRx8E27puuoiwV1Om0tDgMrAl504T/ItryNijpr8lJvK/aWneuP30i8GrNb2w0IW+P
 Rc6HpSUC+pOJjgw5Y02FITfBWeK6JMc=
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

Add the required codec, CPU, and platform DAI configuration. Audio
playback over DP2 has been verified with this change.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index d0433cc3623f..b6863b40b1ae 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -647,6 +647,22 @@ platform {
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

