Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021128;
	b=4HgJ91Nnh/MBIJR9LvJGiEBpaSgcWoUfz0n6eZNsSeyuh3OF+Jd8qF6DNmx15VKD3ZHT
	 k4yR8PV2V48ppchsQ2GVVPUrGgdofpz67YeaG17hJ42gjuXd3SISVn5Pnwv552EVLu6Aw
	 RoakNzD8UBogWsLxwO50QrmewmzTmY0ptlBybX/9ISs7UCoxVZbMg1cJEZOL22uawAbZV
	 w8tcLajQDbYsNUYGbYDXCDIMGC7BX9qYRUgO4sR/UTYF6hFDbPtoN2+l761imKaiE9ktO
	 NymjOkxmUgxTHpqwKiTEPUMDlp38B9BGMwHUyuV6pox+bcSo5YUJ3ShchqgMnE7T6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tTxUp3C1O2wnUd8FUbEYoeuC+ufoIvHQBgbQQiOhdOA=;
	b=4y+wOx9AI/Ukhi0vCHXBdBD14oJYITXmHegz4SbdAznXo4ysBbt/SDvJwmX4FX1WHwGW
	 THTzY+mj5cUJ7BGVkzbhJMK+4kuz93t6VWv8Zek51i+idzvctwi27zm8FGic/peOCBzTA
	 5aWbz4zIwzpYWJssIOGGvtRWIRtk4M9QvayUnuTXRGbcWws3Dg6cJ0A5xIbz+CkejbJmi
	 apc469/TKDU6iuDFA+15G6OunyNCxa2Umtj1KlOFe5AJgED/52T+bb0UVs6tTGdD51Kx+
	 wCr7BfJ5ECIym3xfUI038iW0+oyj8gO3rOvx0MC3nJzPzQjRRflM730W9SADMnvGBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V4ZRPYkL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A3606A31B;
	Mon, 26 Oct 2026 13:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V4ZRPYkL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtX5V1547952;
	Mon, 26 Oct 2026 13:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tTxUp3C1O2w
	nUd8FUbEYoeuC+ufoIvHQBgbQQiOhdOA=; b=V4ZRPYkLL/5rbpj8BYmXvzgyTll
	jJJ3Wm8P+BkJ/TRT2b2C4sxP38E8qlEDe7ksefAmftD+gnMl47Bu+EhCp17u2y6b
	p/IgWe1BtV5+nEGeZGjS1WlkgG/UcT9z72K8vUyKrzqtDTvc99sXlvs24p2y7+bU
	7CCILoG7BRDjLgZ69Spxr+3MBFc5n+q/4v8t/0JdWpriVjckpR5Csf3i2EjiDyul
	I+uaRKuROUp7MeA4VllZU8ShyO/YOOGM7T7YpEnKe/M03UAfsqUxyEH3M+pyI29o
	qmMR07Ukda42uPqncCwj1IYGh3hPU9ytj6SA+wCZYOMmx+8T/6/yIOCFuNw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstm9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:25 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QDPK591853286;
	Mon, 26 Oct 2026 13:25:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69QDPM4v1853312
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:22 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 73118679; Mon, 26 Oct 2026 18:55:21 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: qcs6490-rb3gen2: Add sound-dai-cells to lt9611
Date: Mon, 26 Oct 2026 18:55:16 +0530
Message-Id: <20261026132517.1133138-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026132517.1133138-1-karthik.s@oss.qualcomm.com>
References: <20261026132517.1133138-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX7fEq/R708587
 b+Q9ZZX9KaA6KBJuCLKuLHVNo5/aEkdkOKTGRLckCZFmji30nIHph9JEhXaEH55De23WUXD86n+
 k3Wv+ax4aBkOK7yzAMJFKuDxjqJ5qxg=
X-Proofpoint-GUID: 2avBkw88B-2QMNLR6EsH8TyVy97mVOmj
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf54c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=lJWSN8bgU03ZulAgMsQA:9
X-Proofpoint-ORIG-GUID: 2avBkw88B-2QMNLR6EsH8TyVy97mVOmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXwm5LySUuMO//
 +P50KcWXJJNY/wLxROh6XIFNE3gWgRxpP69lCm4xX4Popg1jSW/oUORDb8X/0bHKihQNnOmuSxI
 fXZDSCSQWmYizf1PPWtO+ex15B5O6jMhAAFmZdROlhjzO1MjCzWGc6+Lsodc0U6sGuiq1P8wuWP
 NCJyu92F02v6ZO2De+uowgq4LfAXFDqm/jvFFL4IwIpqB0X1aOXuQ+VMo16rHRhmKNLxEx5zdyO
 w3gWhwSEEgXAoPHUSvv02klI93dnFexYOj80xJNn4siVbIlyGJoH5rUZgkoA4XC9RxTXxdxIa6P
 XmeRpYMvjRZbw3So8pWvUykKrOprqH4d1eXau7ORu4fchKW57cbg5GnxPmN+jlYNoqdVSijv5fN
 7S8ghLoY97XfjYsGVhUnxAJhZCLIBPLi6Hz5yOc5mzEWiJx3YJUgm1Tbt2NP0AQFLPNG8Iu+msN
 7QSVkZUOms/RxnV/qwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260053

Add #sound-dai-cells to lt9611 HDMI bridge to allow it to be
referenced as a sound DAI provider.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index cd3b065a2049..f9b28791226c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -711,6 +711,7 @@ &i2c0 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

