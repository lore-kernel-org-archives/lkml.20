Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875593;
	b=B7iGhwup/Dc8sW6TsBMLYRdnuzVDIuf1s3cGRDaUpOYsM2fmLfAEYlb8UTxYPNwYkG7H
	 fUe3Yf/QbwVi126XFjBTf3i5v9BSPKy0Ii0uHtT1+B/+5d8ZO9pyIsZkywclsQteeu7kc
	 8/c4anwv0jZHZ5/vnFBqvQcAlgbyoUWHcgdYvEJzaCONCUTa1u/egXUw7tDAAEJqmrVII
	 SLRThwDMKimDKPv82oChhEz+XbnL1LQIQ5vVCT3bS15OWZcMjKzarMKuM2HHCrnS4MwwM
	 TolBBv3c5earWutBQbixPiIWviK9O/wrrxvp4LdHFG+2gTB4Jz2rOfuPcDBiI3bChsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQx3gm9ICQ=;
	b=ageNHw2VlpU6wAjkTvmBiv9OPDApo/cRp2uYsXx6+Bl0GcUfZafVOXhgC4Nme1e9bjvq
	 BYeqIn3mLhujT+A9AjL9kXcFtKnNIyS+3GUjos0l8fRSPrb8GarSq91FxQQuuqOqSYHdF
	 BuFpZUiBC/mp6QDL1rjQ1DLl9PG19DxphYCsxJTwnZxyrwzkatAB5+0tGxG7vYKr0s9yV
	 hBS+HrfkNsVZMfPU9SMB3DJoh/ZKVeaPh3kqQIIz+SHt3XNfWndzXo1OIrIPOiRbPoDjZ
	 gwCf02iDfbrE6PDodwL1CD7fqM0nTihYCIJpXJAxBXpJHKMo2i/ZRUaEGkRPbWeI+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nqU/dD/2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55A606A328;
	Thu,  5 Nov 2026 10:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D55A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nqU/dD/2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai8IA1583205;
	Thu, 5 Nov 2026 10:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQ
	x3gm9ICQ=; b=nqU/dD/2xsLtkzE5ctoEPlwcYJMZWUAS95RYqgCd/qTpTAvQ5vt
	P0sMMwMSNVIjYoFvG0t9NsmrLNkHGKcny8WDGHyf3+tWioGWkO/flR5rXURG7/Bz
	Jps2SnHeiWt1VvI4iaIsX1MdZ6UZdxkYphrNd63qyr9dgwdcuWXcul0I7qB5IMC5
	RTYaKF6dPhDCKt0hstyVXrDzYoQ2FcNwBUFil5mOIBf9k8OYvvJStaaxz7zW2IFS
	R8RlFeo6/y0ee3kdFqk38+ka+aM2kuMh1mXHhN9Sb7ytIMhvYCcfKFNuyLwrb+zj
	QD85HMBKA92lsqY6q/hfzN1yIuQu0h8i98A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar09n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:46:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AkRCv550128;
	Thu, 5 Nov 2026 10:46:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rchiluka-hyd.qualcomm.com [10.147.245.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A5AkR5m550118
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:46:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4746761)
	id A99C2674; Thu,  5 Nov 2026 16:16:26 +0530 (+0530)
From: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link
Date: Thu,  5 Nov 2026 16:16:24 +0530
Message-Id: <20261105104624.621024-1-rohith.chiluka@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX1k+x3dPclkL2
 TJ4/lL6HL6wRrzoALyb01A/ryoBVmiyUQpROWYFjX7n+xL2fbON8tvXVDY1ywFv2buNxjQ5lMVF
 aDD1eJd2VzT34dqvnf5scv9+nyMwOoo=
X-Proofpoint-ORIG-GUID: vtC21ei2LI4arXS0s9DWja-hv77WhSov
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec5e87 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=yOwtmJoGaEZMXqy6B8IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX1d8QbbpTgVUO
 Mwka9BESrIXB0dN8LPG7DZoYix/4TgDU9TsjTbpIEINbX5kPfxDpC2qjxSQGoHYFN07atjPCPud
 2HUZlm/hg+IKIOcPZqED71VY3KTcJNX99E8gf++FtvmBGBHpFwOGStf4pziclB1U+NPA5Bn7M1X
 Xkl6yx9656AOXKDtPhFlycI95F9dnehObJo57ZjKiKvucdPRDajJR0UxVOiP0FVpTjaZZcon3bT
 tJXebMioBYVAr8BQLOpA25yfrly+WF2yoNr1wPYK/8g3ZcBCMIa7mIWQHhINn+tsjNGdhMKsGK5
 J32HFFizUJw/sojKv62DWmTZyJ/QvUwmyJ9dFXerEFtD2iiCPEO6VJJqKXpsSzAt8CTDPr87VXm
 qUYvCBjWJAfG6XdlqZ98IkDXOjXwTfHmOUiUs+7+XRlogjO3+R6zG3lKn+xx/Ao1WAUaO0/ZuRq
 9jJjE5ldu9LhjMQe2EA==
X-Proofpoint-GUID: vtC21ei2LI4arXS0s9DWja-hv77WhSov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050042

Add a DAI link for the DisplayPort RX path so that audio can be
routed over DisplayPort on glymur-crd. The link wires up the
DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
controller, with q6apm providing the platform (DMA) component.

Signed-off-by: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..eee75da20198 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -268,6 +268,22 @@ platform {
 			};
 		};
 
+		dp-dai-link {
+			link-name = "DISPLAY_PORT-RX";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.34.1

