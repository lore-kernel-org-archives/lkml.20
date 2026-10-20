Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513843;
	b=cbONkGbRaUDd24RIpViUpfvhT9scBt2BB+iz5IEUANn1htJrcIaCJizlX3fpTW37y93Z
	 tFHMCu+CMk1MedjOXjetqm26g2zWZPYhb30KPVlhKdiYBljX7CTiFktWUlh713qPcB3mq
	 SQithtzWGUgwpGVjdZ5bSbrBG4MoIuyRKDiv3Hvu26nrR1I7rE3gSnWTLW5egbvSyp0Zy
	 pspqVdhaNs/1Wzs7rUELICp9ljGeqqUalZa5FIO1ysPO3GC+y+TZt6VqjrRYMEZ7SKavd
	 R+wvFjAyHVxjoQlotv0nyQxgDMPzkcHxRhqrM4MMlZjKtRcsITOh9psNvNRfffwo4CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
	b=uzHu70gBgCXIsjuWoGtnQaLceSvug6zVNnpJxpMcgDGOl/E5+e7YDdYq33VMnn9pyLVP
	 /9sk5FjDKpNv9gTzlvjlMKL+RfWvnOx5Jt+Iq42JWNqHY36oceAb+qt33hPRlLSx+a2X8
	 HtyGvF9gOeBLAETMPSzXbXHgmXy+E1VLxXzhRxl+4uuULWMSOrukZY5gHKnkdqdopSnsR
	 cNhs9puKHOeFAEJeLLNQG9CUdUy2LDq8ksXu/rjwvFDXz2M5Ao6pLUHyelVJBJwuc3yI/
	 d73oQdQhfYNSuTfk3MLXhUJhzbUh0h6yGnRg5rOKk/u3ohcBQlSL49qCcJzaXe06cOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Al/GRjyF";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EB2606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EB2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIJ7ZpY9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Al/GRjyF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGL1iK2151474
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=; b=KIJ7ZpY9/GZYO5vh
	nbAHnEvozVZCM5/Alvz+UuzmFGMK14rsM4mu+w1I4OgRI6pWBpMlzHwKItFk9bpY
	j/KjQ+dI40CebGkkpfwechxRV3v99ASaBhBRRn2GyaEZnUbRrEwNjtSLVOf+EY2f
	IQAob8W+zRlbgHzKKHCaGTzpJPzbw2gqbc4xeEAV8eCb01ow2WkGQNlPLRM332qf
	YpMvprbEBsKxdEIBwa0d8QNkJlUvnaAU2f6LdvyUzYYZz/Nywny8EHoVwxtnH5mU
	/Mp0i5nDMx74wpgYg/9fWCMblhinCh1uRZdmqye4u2txA5LtQYM74hXN+OdGM1dH
	h8TcXQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n3dxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:30:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so8377315eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513841; x=1793118641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=Al/GRjyFnL8rNEsnbrnS0C9+lH7BFKX4rqwtVDc16SAEoYSubeXcqz4tgUDoFotgQ/
         OxSzEkNycUTf+wuZAt3RUKRCmH6k4spN99RfetZQl4BK5GFNasPFsDQe8G07PYR+9pJm
         N9EMtF8JM/s71rP+kC4dosEDlbQUISy/Z3nuJ95RHxtCIX4HVjTRNG+J6HiJTdeWpfcF
         OHkuVubizb9ShErADL5260f7gLUuVo8W+CODnXqww19Tp9EcO+QOAoQ2nJIGOtADR3T3
         VoSGxWmmGAJ9QnvzzRzj0Bv+CahxwVVIbSLyDjfaU7PjsbGBIMZNAOLV8Tt8PCVziLOR
         8dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513841; x=1793118641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rxi6W16GNCxJzqxa7kxMIrrE0rT56lRgfjmgtAS+D90=;
        b=i9SKTmD5G6Eahgmo89tD1SRQaR899kloNvj02VECqLgASYdZafJ3GiBwINcyoydv1d
         cwHqoEl22Bcm617fE9dykBeP7YzvKbQswZP/PynPh0CDo3qwByTy7CWA9K2XGT2epHiH
         LzHaOm3u3zacdfsEL68XKE3YAifezyWqACuSF/RkUrG7m/oEjaiYxVWBxAd4UabFJTZ/
         ysl5+bF1c7EW35LJmTtrDoZPYXZDWI5RLSajtStHviKu9sQqkrcFQUbBAXqMaGZL7b+J
         6Tmh3CKg79O4Usk98Gwq0vcpdyslAfG17ni9jloBLtYjxkWIYCrHaD69xUbVAYInT8rY
         sxng==
X-Forwarded-Encrypted: i=1; AKwUvBxp4Jx8pMb/FXfIuf/qjmxcUHuBXxcAsOP8NCESZjuyDQzGM3MuqrEMQ24VauEUFnscRZZznhFagujO2pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRqHjL9nZEwd0yzqF/y2MRIbF/Cvtx6cTq2qnvhDhSSjOHZW7b
	SrZLdbohF0KQzzNRCNPWBb78I//oj6kKdYZDwUKYpXUqcw41tGfL0n/Br1+XlqpVguXZY1pOtwI
	SsjB8mSEchqrVSTNIjWA1IYJC2J/wmOhrOxsHbU74dVXf76hEdTe5jYTUWq+UrYHZIEQ=
X-Gm-Gg: AYBFou0lTVUmYM2R0E9krTsnIfXF4ij9XeYU1jpXcWwFuDPe3B3QGAzGhU0dS41YR1F
	0moPefCn4TlwwM58LnVk+V2dYgaorPtFp6G0Ziq42Yjkg/Ia/MlTFhpAe+58AtREJmxaPJiaZ0H
	oJA+aO/JJEfTLOrSA33xGw/1BJdcMi3Ki3tLqNOz3OM+frK4jzw+bBZ4kJmazzL+BliYkIhTS6h
	5KR7RG3ztrIyhtqbDvhDl+k4AbZ2LWwlaV2pMS0l3UzPKzlcQ97ImLVVu6OZ/x+WjiOeBvsrDE6
	E7QGnENV0SenFNdcc6NFTE0N3U0xM+GBy2D4GEnM9yySdzPsx4lfNeqrGyDj78Hl47CPOswXE5N
	9r3SRt85yO8UFkIbqyGvg5k1fQjIre7LJrIVsu7RmLEO4YQUA80MgMaRGYiNNuzM8QuGT6acvKK
	xnhuszinzMMmuqlPBeaAFX6+ztla2TIkNdKyM=
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14433988c88.42.1792513841028;
        Tue, 20 Oct 2026 09:30:41 -0700 (PDT)
X-Received: by 2002:a05:7022:1706:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-18514729a89mr14433959c88.42.1792513840461;
        Tue, 20 Oct 2026 09:30:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:00:26 +0530
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Add IPQ9650
 compatible
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
Message-Id: <20261020-ipq9650_llcc-v2-1-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: KTJK8PIkZxbmY2FavShvXuBqCpkSAhuu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX1nJMBtO0FLxg
 BYR74u4b6CWOf8xNElFjiXVWjKUbm1vlBFDwyEld2uChNe4G+r4+BQwXFm887zDGbt+U4GNNpbX
 N2X41dulXaDb+QUQZdjmIujdH5T+AOg=
X-Proofpoint-ORIG-GUID: KTJK8PIkZxbmY2FavShvXuBqCpkSAhuu
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad79732 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OsHVNsnzEVu89lbPO3AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfXyzP5Zv26LDDD
 kPwKHs/hnlZVhr/UhtEN2I8Lsyadk+pd9MthrRbadu1NDN2Q9sZXYVi7NeNrVZHVpp3yKufOupd
 ILg0aGgY6mdxf/Kn9VOML1lXLXfroBlfWwn2dg7zBEXlUkaZwPZku2Jm3yqpYoxo3G/pBeNM70S
 MQHO7b93rbZjeByBxSwJ4o6azDetbSD8Wpk2C/6v5RiQHEmPfLHRN/26b4KrQMXklnjOIh41mOH
 QBx5j97IID7oaK8EWzc8KU2DG7GtYL2qCxCCjCRnV2uR/V0Qk/Cbxum4VYQy2py4ADrzdYWJG3S
 dPPFZTn86rmdEPbLMV5ebLZipkOKgKsYhrWBZWB9S0JweYVTIEeMFKPJaI9MKpS2oQbciR/MIDb
 N12nyBoyj9i3zjtTea2aBSJ2KNIO9jrB9raoU4MLL7g4klQyYnlUG2W88pLkqpv+U/N741Mr0F4
 KG02n7tI8Qve2esH/BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Document the Last Level Cache Controller on IPQ9650. Similar to IPQ5424,
IPQ9650 does not have a broadcast region, since there is only one
instance of LLCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3efe68b08d58 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,glymur-llcc
           - qcom,hawi-llcc
           - qcom,ipq5424-llcc
+          - qcom,ipq9650-llcc
           - qcom,kaanapali-llcc
           - qcom,nord-llcc
           - qcom,qcs615-llcc
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq5424-llcc
+              - qcom,ipq9650-llcc
     then:
       properties:
         reg:

-- 
2.34.1

