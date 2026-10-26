Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021266;
	b=sxc7cdTCMuMqqEaE0HpeYipnHmbmSbDD9FfZGRKKSJ1rQ4A3lVybYE/B7hfTyjjRZMmk
	 Qd/aMjVMZ4eCPkvcp8XZw8aPS57DZjInhgerW6VWh2ArBxGzTG8/OfNxmvNzCgciUdqcH
	 uxG69fyYdf7XuCxA1Gdhch5y7NgidZfD7KD8HOqPFpVirAScfYbIUEZsKpGF4A99MsWge
	 0NmrzehcgSNY27SLeWULvGl/jVb+dufWHrQl4mClnY91bGZjEdHPcS1TvvYJztQhAzwqd
	 OQ9ZELUUFfP5jUjDuHWzBcUPXBEof0s/rNOn2gHGmCyJnNurjU/wqrJBudVAqEywrHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rUCJmSkAQSE6h4s+zutWPJ/g313zVRHQcPsD4SLWs4Q=;
	b=dyekA6ogRqf0kDHu6M/vAic5DZ8VFFplxXG9DWzV8uzu1rPvM9mPhXDfkqcSb66zo8K7
	 JtV6AhZOEwRvN0dvtcXotAk3Z/xkYdggP8cLvWwpCyHDVjPZb9j9eop8wGzlbx5MhNbf7
	 hVoazV/Bx2LygYuEdvLRrTDUNRvGteBNL04XZlImzS3vOHVZxFyfeF9OWzZ7y8Lf9KCCT
	 IkQzjQF111RHayoErQOUzeITLVr9QKJXF9Ukx3jLIr+c6qKBxCWeCQvTbmT1Z/IeDAPDw
	 4yAegb5kIYSZV2LDicy25zyC8Q9vypeVydUb0NyImgFbm/kyKRycBVIP2Xkky9ldxKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN8qnszA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36174606A31A;
	Mon, 26 Oct 2026 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36174606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YN8qnszA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7174126433;
	Mon, 26 Oct 2026 13:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rUCJmSkAQSE
	6h4s+zutWPJ/g313zVRHQcPsD4SLWs4Q=; b=YN8qnszArhQPdW9A2hIJAvBRCor
	HJM3wqGpQLYPvhNNFefXY5kGy4aYIUDlF59X52utQUxvR5fFB1f78rSAoFSfjyBm
	IkJRm9Q6QR9zeH2gMm3Cue/diUM5IJ5FwkUN+iVzfbUr3A4YWbrPVAY4bB5XrZjW
	UCnr/3cKgVjU6glHkaZJUbBnL8oe5oRBVXn/keH984j4oJ7EsOHsubepj3DJGxmw
	ffVHXblz4TUoIUyp6BcqAlw9qVN6idPe0krxqNLUhrIAlKKzXe5LNS36yg3f0yy8
	pB6DKwe3cfXpDNeFoS/zJSroFmBu1BC5grYk6pGaXkcH7ZXEp4kf9Ik0aYA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptjxx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:27:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QDPPfA1853381;
	Mon, 26 Oct 2026 13:25:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69QDPPGF1853371
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 2BB8C679; Mon, 26 Oct 2026 18:55:24 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: kodiak: Enable DP audio
Date: Mon, 26 Oct 2026 18:55:17 +0530
Message-Id: <20261026132517.1133138-4-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXw2qVwI7CGFxV
 ZpfUA3knxphgmeut66bC7WgeNcuIeEoZO2tISVTLtGd4nc+Ry4T5AFP3SXAgemekiu/iHxrfH47
 Hros7YHL3YoTM0frcsBfTqWGJM/5YQA=
X-Proofpoint-GUID: ecPAonc_78HzYNMUO_9gT9PUEusOI4Fs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX0SnQRraesNWV
 2XW1izZJwZlxO9ZlX6VPzAxaLZmWl6hhsU0caKzJ5VwnW1n2GCuIf84khQIOMTqnr6cggAMefIl
 loYW9OhThokTZnEBMPkTVJWmzK4ugceJq2iqz5Moc+hlhZi60lBXfYRBdVf0D3u6eTKHQ+FA+3g
 C5HX18XHS/GWe5gv/xdr6jFlSZVSlSKT07U6PkY3wIMNBWDW2kEqw4b1RAOmcXuIsRb+LoJmq+L
 tZmnu4FPpTa+TX2W+kVO46CzTcFeDeqn/JLXtJql1pi4CGhX/tYmMw/bz2xJfPslb/07EFoWR6m
 4CCtqJ18Uq9ppQNQD9vc8gRRy77+H/OLj85e/dJ8yITNheVlrXtqGdKVIgjPyFxhYQ7Aksr2+yF
 ZYuD3TlHOHmRNzCqVUepzi0DS4vByPvLThuP/LSN1c9fj7sh9I3FgN45/e4BYcMIw5vl2uvwctb
 XH0FMQLhyxnAeGMiWGQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf5550 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=R9G7c-vIJ9g11eUHkTsA:9
X-Proofpoint-ORIG-GUID: ecPAonc_78HzYNMUO_9gT9PUEusOI4Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053

Add new dai link to enable audio over USB-C DisplayPort.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f9b28791226c..8aa91e96e44a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1197,6 +1197,22 @@ &sound {
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb";
 
+	dp-dai-link {
+		link-name = "DisplayPort0 Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
 	mi2s1-playback-dai-link {
 		link-name = "Secondary MI2S Playback";
 
-- 
2.34.1

