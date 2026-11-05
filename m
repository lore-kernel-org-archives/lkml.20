Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876269;
	b=1p7vS5lqN4Y3+0868Nu2sa4EKjsSE5aRVtayr9H6jTqDk4jolvB3Odxg3Y3yGbweoTrM
	 DjQ9Bm3hprWc2yYT6t5xMCE3qqMK2le32cr4+nhTDBz64krocF9+ctOOd3Ms3bUcFajdn
	 /SvEd+5rHphhP8ulWTRvyy+A8+CD+KAVBQQoVBgBDDsHEbSwND/IAsEn6Sqr1tJoLVH1E
	 QFuSCnc8BqxLUeOqeiDASPZZpOv3IEgDH7bh6SyJVIw9ICJ/J2qLOa5p5SukHZPgnnZFE
	 0qjyPMohzP2D9aOxgjuD+XQULtF8lYx4/+erPVZ3qTJt4NUa8vDn9TODCq6iXyZtcLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQx3gm9ICQ=;
	b=VQnbdwUO2/EI25E0mquoq8bniItdGSJE8dI6LXf62QqbzP5QTBK6gqA8f7KevAMFGoAW
	 zasTr0xkp77mB8y0tk8WRAJDSitmB1GFIxwyzC67k1KA+wGvUwc3jJD+H606m0YvgTcH3
	 R2o8MzwlFz+ME7MII8SXEWVsORf/mkMBD0DPpvX9L9bnRrjqI1UEhvnJpgJftt/2aROBg
	 UPwDVl21njPYFetIqbN6WWtU+ZCjJt8Q3Uf14oDItEamj+5TEOIObmJsCCKFwzzzGYj5P
	 OwsUuEq3oniYyHnTJ9euzPqZLld/runsv4dtfPYzJVHuki4d1XQtLdCZxHqA9fSNEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIdviPAp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DC1606D802;
	Thu,  5 Nov 2026 10:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DC1606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIdviPAp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tQ5H433380;
	Thu, 5 Nov 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQ
	x3gm9ICQ=; b=CIdviPApimNhc6lZ7v0r9s+x+2/dqBXlzV26FyuteC4IWYq5/7S
	gW4+6O91zZMLdnwE571fzw0imTnn7J/OVVA4PJ6aKrhE2nwPVaevLBtJslaZWRr4
	NDn2/Wjb+D3SoJy69i+UDoRW5nbVZxUxNRLqw3sa4El7PISTFjjmTHdfr9nhaDi0
	MFK8u8GNKalnlK71des9P4kdz4noeKmeA539bL4TBgVjVL/WLm1Cd3UzPbcyZ23f
	Y7NgR7xYRpJwRf72W/EVKgeEBgn55dvlbJSIE5Y1BHVehoUlfoC5dcKhybClQEbx
	kERIar9MU9ocFeyJ1AofUbmVpCSVyi0Zcyg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd93ks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:57:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AkRCw550128;
	Thu, 5 Nov 2026 10:46:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rchiluka-hyd.qualcomm.com [10.147.245.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A5AkxCH550757
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:46:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4746761)
	id 4D717674; Thu,  5 Nov 2026 16:16:58 +0530 (+0530)
From: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link
Date: Thu,  5 Nov 2026 16:16:57 +0530
Message-Id: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec612a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=yOwtmJoGaEZMXqy6B8IA:9
X-Proofpoint-GUID: PGST21VafwtvaDlColkf_qjjt60pbPbN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXyXwgl5aoV6UA
 OF4yRmIzy1a3ilrV+jsNHk3rlMRxK/UTygLT1rycPJDCh0cxvzNoM1U1TOdBQN0M3HqVUOyNpa7
 A5ONXcSVy/6oQT1WHM0yqw6BBNuraSc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX4LmkKdQD1Ypr
 IY+L9Dqd7cojG8Fi/XfYJxDrH7k2EFHqAIS1CC1Atd2yieWqVPptD+ToNrFC5kzKMA9Z4M6bS0q
 YSD2AYNmPUxlG9IzdRZ3xvy2GRh5OX5QYBNf1gP+kOjUAqCg4UGFbHRUydS5cPdpmj+yJ9FpyZn
 w/1kFw24YlsbzFMFoHynk8lWYYkZEoekcvtT0iL6HqEdHQ4djOejTkZ5tV8S7/FuXoc3Ffmm48X
 25BlRT/+7A6tjq2x1dUJfecCj+4Qd9wmvW4U89ufepdEmmTiFoMdN9/FKyDQzQXtf189IUqaEOn
 GVm2WEQHhffhiFgRMDODpqy0nYH7PbDxLPpQ0031hod6LjGYsu4ziiTmxNmOUG5HVpbCb+GD99R
 yamOOu+75Xw0rGdq7RB1HHN2viyW8ECVA9mGBcKU7Ym5XIgAQNsY/pgPyXPWtrCb8iHpSVJygHo
 ug9Od7fCOH5K8k0PEyg==
X-Proofpoint-ORIG-GUID: PGST21VafwtvaDlColkf_qjjt60pbPbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

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

