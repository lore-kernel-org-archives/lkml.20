Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912198;
	b=VC5rALPQANdZM+tq0PeMyFBBTCY01a8LR828CQ8Fb1XlcU4kWCLXiT+gnNDpaLgR0K68
	 2gwrbLq0daVs7PM49duYo35UccKTkcneYlWyDN3BGesJFrd1Q2MRH+75+bFwO+xfkOhpE
	 a932y1opyUX8W7SmFk6HPlqICuRH84KnzGDqzmAKVznjTSovb2/CDeP5SqnrC9+aZdTjI
	 DLTYZJo+XGKTXcu5B2D3sqx1mBqs2tl+XwHy8YRrfmR9fBGS2dWHoiXqJ591Vu2GpMNbx
	 sIra5IkTVZX/XRg7KVKwDILs5M9kDOEdzbOFteoVaiP6J/T5MPvyEyPDF79whRzvpPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a4SauZhnn74wjgYI6khUMMapX+qeM6sZyodz3gR1I0I=;
	b=HBk2GEWP4EWWhfoHWe8g0dKNZtUQ5N6mM7Ejm2ZNtD5J7QXRgfS+5+a9YxGCxTTQRlNr
	 NDTl5C+M9OdEKa+o7lAa9w7lgKejOOcyxfBiQNYk7UEHTCDABlqhfDzXLfQK6N+i+XELP
	 hsYsNLDB9Dxj99DESUJImUo2PKb8oJbyQKvrEYiBbBR4kKs02qrp4jUPuvdLNYIoSZMOV
	 5tX7ULcIGI5HdyomtS7sDqlThx0/GQDinPv3UcbHGcpgYSo1yG7iZ3FlSilKp1JSOZ8Ii
	 QgCIhe3B6v89paHPjdEQaTbw/+EHJGtHRQu5k4vZ2Dhw/O5U5cIqNIPluJy4RMtF7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IZ/8xgRJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C0606A336;
	Tue, 17 Nov 2026 10:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439C0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZ/8xgRJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH9TYh81699103;
	Tue, 17 Nov 2026 10:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a4SauZhnn74
	wjgYI6khUMMapX+qeM6sZyodz3gR1I0I=; b=IZ/8xgRJUlUyhP+fjJT8d5pfLSr
	jIWtiVB5FJRN20pwFbS9KRuGXkITvSyVvwlxu1h9cVH7uY+ioqHJK9xHr1rmd5bB
	w/auEwh2jtE4xT6uK4AfVx4tQYPTC+BDSGZmzgHzQLl1Zl3pubTmBcg0+U0ArPTf
	ZSJotYFWTjHGCz4M2S7JXa0Aw8C1SpUfHck+HaU+jMfBBkuhBtbTaZv4dozh5d9Z
	WaJRv+24iPa7fR1Aa1T4bt1FN+JwGLYl/u8MoQSdGn8UDLBX3tszKsRfTZhfD1wM
	AHqLQz/kkVBd4c+MlFAQwbHDVGZ3dn3ptkpvuQ3445jcQY4ZzyX5wiCY97A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjuhfhp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:10 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAh6ll384735;
	Tue, 17 Nov 2026 10:43:08 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AHAh7ma384795
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:08 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 07ECE67A; Tue, 17 Nov 2026 16:13:07 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 3/3] dt-bindings: sound: qcom,sm8250: add talos-lyra-sndcard compatible
Date: Tue, 17 Nov 2026 16:13:03 +0530
Message-Id: <20261117104303.435294-4-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
References: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX1fTaQSkm2IsN
 a0H6clJj5t3nhrpkqJ74Wy98pnKtv/71XpP9tOmt4gRuSkMrC9Pxu8uqgDH9tGEfVjhhfNhvPj8
 x/CLBv2+tU49a/PJfOsRcL/etPVxIYhy0Y6AdgIoXD+9Utj0K7zjvWrd9YI1mTec7OMm/tiBuq9
 h/f+SxfRedvROji/O+Sh42drCpWpRuMGvc+yhNp9XNsnBo7ugLZ2FFwLPQV+nI74uN08hfG/sVT
 oUnyCwF9etDqWsd0eBN2+zlrTsq3GK3/WBx4rTPCHwOwSNN/UPUEo1bKZ7nD1aOF2/9qrhcnc0C
 Zrr1opwclTdxSHdtlrcU9GU1ipWtggk0yYhMf8MwEgJ5deoQKmvMRtmowTFzMTL9peQT+sm/wcb
 sq/qQ4VHtMxgprOyM+i1o44DlCRjT/0DnONHcYsx9CeMRwcIv6Op+U75dFO8g6jT9Et/2PKOqCP
 fJHo8HQqn/WiMmyIPTA==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc2fbf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=mITDVRH8rqty5lmV4ZcA:9
X-Proofpoint-ORIG-GUID: TFhH99QyPjUs9vHzbt1Ggfvn3U7vJD73
X-Proofpoint-GUID: TFhH99QyPjUs9vHzbt1Ggfvn3U7vJD73
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX0WIOfSyj8s0W
 UVymtYodwmdMDmYM9qSdVCxtsLig77PgV0WOm2z0G7hoz2nT7zQ8JL3TxJyNy7JetWNsCLeUc3l
 WkZXWYQpbC8WmitannSXep/cwbmigw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170042

Add the qcom,talos-lyra-sndcard compatible string to the
qcom,sm8250 sound bindings.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e6d9..40b68b72f8f4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
+          - qcom,talos-lyra-sndcard
           - qcom,x1e80100-sndcard
           - thundercomm,qcs6490-rubikpi3-sndcard
 
-- 
2.34.1

