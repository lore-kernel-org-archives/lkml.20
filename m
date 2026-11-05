Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875731;
	b=TQipriB250E3BqqdzrZf3kxdG+OOw5FeS0AnH6qfkPJamsoJJUbiY0auTHa71hjdZBKB
	 FUXhjm1ETUWbaDv5yaEv0x9UBDJGIoTv7q+3EQGBmyVLUtzha6kFgyU4gtrO7SRnoUi6X
	 FkG/eOZQM1IO3XH3d85KuYo/EQ7Kq4wm27YImUo4rkDiNP4ObCRQ+pC8kntzEXoyk7E21
	 AM01YIv4b69fhyy/TXAxUHO4bqufChP7RYDzb7tlq7gapLwPy6EKvb654UfJdPMcCEKRj
	 Sw76bv0bCDR16CV+nmJoSwoqwoW33OIgPtvgG1GwLTs2NM+Aaklk7ZNkDkS8I7WdJ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875731;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQx3gm9ICQ=;
	b=dEv1BRfL83t2Q1yUOFmpnEBRB6qebdzG4XN+9Hnn6prtzlM1Ho+2gMAlNvqqu/FjWTj2
	 3jPWsVoxbjr9aW+q5olRTi/qCBdwUo+W3FhpeIrjTKAhfWLry81HiSXq1AumoPqcGiN6m
	 jD88MSPdIfxM5GvQv42Wgf4TKMw01lQN1ohz+xQSp5pDCghY/XmJg/2YbN9v2E3XFqVtQ
	 hSQcPTPm4QdbgIH9TOc8MAeJXZGH1n87lz8iukQJ6hj/mpwpgAqZMdnHGDfeuzAB2MBnQ
	 h+YJvqh6BQuDXHHfn4oqWlfwo+KVKd+1eRncPBvUucQQZOsDk7j3ESAC772ovgsGUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5IQmBWH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE8606A328;
	Thu,  5 Nov 2026 10:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAE8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5IQmBWH
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tUvO3685694;
	Thu, 5 Nov 2026 10:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SGS+uUaJgKhVkuuwLh5hQt8xUhYx0sVgTDQ
	x3gm9ICQ=; b=C5IQmBWHRYL9/kNtKd12wqii7Js9Vh2et5KrnLhn+tLk3ZIdSIf
	Y3+F3XSsrlw25AxiljQ0y2S81akvOhX06M4bZiXZcwlDnI/kqicy+LKttcaRqIdF
	dPDARGWRQx+un595aV2XTCQzZJTV0iIwct4BFW9MDFkAyoSW7UN9c9d+FqDOBStf
	P71NUquohVPxp6a7DoVP3x7Vi2ZuDnc3NA546tSTdOe9ihFgI8Z8zHtOn9IQrVHk
	SRWA0/ntTS99T6kFLxaEH4d6sZiocWonQrLJEit/PKK10cjkm5YBAqVmG7TL6QBb
	twAB+3Vqd1TIZsKyPFl/atdASvoT6/wU6Ag==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hmnb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:48:49 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AkAlf549507;
	Thu, 5 Nov 2026 10:48:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rchiluka-hyd.qualcomm.com [10.147.245.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A5Amk4K553508
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:48:46 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4746761)
	id 9CD46669; Thu,  5 Nov 2026 16:10:16 +0530 (+0530)
From: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link
Date: Thu,  5 Nov 2026 16:10:13 +0530
Message-Id: <20261105104013.614413-1-rohith.chiluka@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: AOG7dRtrkgjNAeSlkbEo--de5FBH6Wcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX+VkJSmCVVS09
 K2uxHAjJ7Bm48oZ2LNVdFCH1Z5ri3C8KweBthZVGm+U/VSSS4dlxUaZ1IEgQUzHpGwcx89Z6nfM
 cgnh7lJDROsnZQaKTFVRenUDdfqDMwHUuafK0u+pY7UoBLUCgA3y1aEk9UZ+kA0ziwc24WyisHd
 fg8fPjx29YUMo3/vhLsxDqLxjiCyDP5fBhHAWEWj6bjN9p50eFmpHxq4oLlhA2//SFGtX8b7Uzz
 9Cr1K70SJPwsWpEusN+vk6+UZ0vG1jQOj8q9mASFVwOWIZkQgwsTEcoH40du3Vrb8ZU9VVf6+Yp
 F97lb8TTsZZDDkv7gDCQlTRH8idbdJUYsieK78Cwmt67KG5BWDRTfvm/5eDvJWeU8j9uHreg1Aj
 yehYam8IAG3wo8rftJHukLJ23Ib1wDHRi/4K22HxqWTTZlDT1I4VmKLjDIDEtyaCpu1FwVLde+Y
 WLFBH8vIHStO+82ov5w==
X-Proofpoint-GUID: AOG7dRtrkgjNAeSlkbEo--de5FBH6Wcm
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec5f11 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=yOwtmJoGaEZMXqy6B8IA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX4bA+NxFyL7K1
 RMeKLHiIV2jLc8VP/vJkeJdm9ct6uBBzwCU/S/sqanXwiefihnSFcREU0bQwB7yaieqr8WtgYeF
 mQLH/HN+Z4fk05RJJeOgk3hYtPaxbgo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050042

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

