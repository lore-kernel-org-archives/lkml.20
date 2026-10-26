Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018567;
	b=Ec6+kI7DiwAudtVoSjs0HynyVvRphJd1ATM85d4A56QzjZBxONeDS+EMKQqX38D4fgi2
	 Tvme6nBdRiZ50vO+rDqmju/ZVwb12QJHZlJ6VHrDDVkw+hMCQAjZ83wmw3ekrdmVYutud
	 IYQuta/KZmZjpJFT7PraRo+QEqH4nIswP8rZ8v7Y9ykGH1cnqyQaHe8HsD5aOW/b4ndI+
	 FcYXII4XPFiyKQEJ8CNc00TIHKNfhockHhLensh0g/yiklIcKICVC0IZdyBGsTxudryGy
	 aft2d4xpsuuX42VCfaf3Lx/ND67xf0/M79GGMmcceSYdzDeFICgHmDqcECEqxt4fZ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+cZsL0JJ3g8rg7ayGGk79B/6QLDJ6d25Vu98DH2prdw=;
	b=pN6Me1qEWK8VwZ2KUsMyHexqZ1Ox93JR/44BehkK5jB/42fB1UeqZjS2sjFh5clOLrPZ
	 l5cu39ZefByQL/qSHXOuf2TqZhbswT2qVWm8e19q+kQHHBGnNPhNgvMDgpvbs4VqhUAOI
	 PdosS9MHTmWiZjzhJL8eTrhyvr/L3k5q0k6Y1Su+WEb5bK9e50j2J2VRLWXGMzgSNRi4P
	 5L5rHq3gs6ORHetoH6M+t/BHAnMLTnkhQZNdRTO4Qx64W5Pivfh6Lb5DwYWgP5LrCrh8N
	 BgOLpLSncFirSV/4ogHuf5v/OyUGNJHAasZk3jPLxwX3K1YwyDU5qcO0SCuutOzUGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qc86V6Kq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D7C606A31A;
	Mon, 26 Oct 2026 12:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15D7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qc86V6Kq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9w63049859;
	Mon, 26 Oct 2026 12:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+cZsL0JJ3g8rg7ayGGk79B/6QLDJ6d25Vu9
	8DH2prdw=; b=Qc86V6KqHib419FtjdcJWqRm0kp4SdimpPmOrY7XGIoD4PjrOZe
	3LVl3VfU3zzM6ZPqUylznrOrJStScVvdmcNAyA0LdekiCoLAR9XFtqPvGIzyoiDj
	b0mYeoAJaTCT8vOWkLh3Y97x3bHRg0QRFL9ft/V1P4YyYFol7CfDhLu7TeLExskc
	Jcg9wbl3efFKOe7btloIzH2Uu5UIAkk5l9ZRv1grPMRAQFQ+nXJ7EuHDpRFHwNSw
	Ll0UNM3lhgOFC9ELFi1JCGDfbMihB9/I5AvjTuRabeeTlMbnAkk4qP2gcVoxv6Qy
	OLp/l6kdji3LzkUkF92/GP2PNzOaJIjbk7A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdda5hr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 12:42:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCfulM1792680;
	Mon, 26 Oct 2026 12:41:56 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69QCft2b1792670
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 12:41:56 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 09B4165D; Mon, 26 Oct 2026 18:11:53 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: lemans: Enable audio over DISPLAY-PORT dp0
Date: Mon, 26 Oct 2026 18:11:51 +0530
Message-Id: <20261026124151.1086275-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CdeI0PaI6t3hS2ufBtzoufWpj2bNgijv
X-Proofpoint-GUID: CdeI0PaI6t3hS2ufBtzoufWpj2bNgijv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX0W5V8xJCoA+x
 CrgwT1YJKOvskxDVVUY5L9jl0Ef4ceeMHk4fbm1U/0SxxUIkOKydXaXoK53vNj2eQEhq4bU4x8R
 d9mUSRb9o9RYXiPzJpIEnPnb2jxudQr52BvoqPxxUI63TdLM7pDn10u6MeWUOr83l7HjfM4ci+A
 I5X/fOpl70W27pSOf3fWU+ohrVxE5BxKrlZlwgYwXyt2LK/EIdErS/Uh/aXdu3Y6y7oNK9Tp3sk
 5Z9nkdtfKccw+lD6bzZK7XUwCArqgnoQEG2xjR4394nW+CDwWEr36KvhIXMym7eQjudMNYZt5SL
 E4SIwtF2EEJKJ07PAlPLL/SEo49s7zBaEx4Gs1jUR6WKju2OrcqertXvT0UICkD2gU8PDfwm8JL
 06YU7DLLcanoH0nTu9nPCh9qcm+jgDAMFFIkcldnLoznfKgf1/GV+F2vLSW7wtLN8wb6qH560QQ
 NIb8SBLq2h103RL+zmA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf4ac4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=x9UGd40Bw-Ey9o_AYzcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXwSoEMLLWQGbK
 wyFhrlZ4/4m7BHUgncGgnvn8FqG1LtejMuOpJnGtDRkweewITcgJM4Kr+lVKdFt1Nt7SZXYWd8d
 jsD2E57z/lRLG4AQ4dYS1n2yHTZwPK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

Add dailink for DISPLAY-PORT to enable audio functionality on edp0.

---
Changes since v1:
    - codec node sorted before cpu node (alphabetical order).
    - dp0-dai-link placed before hs0-mi2s-playback-dai-link (alphabetical
      order).

Link: https://lore.kernel.org/all/20260413043713.1659-1-kumar.singh@oss.qualcomm.com/ [v1]
Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..83bd2ffa2a1d 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -183,6 +183,22 @@ sound {
 		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
 		pinctrl-names = "default";
 
+		dp0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss0_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		hs0-mi2s-playback-dai-link {
 			link-name = "HS0 MI2S Playback";
 
-- 
2.34.1

