Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367069;
	b=wy/gTRWKh/3sBi4i//+MzLBGBMtHBuiO+63wKLIR54rGSs02rad0Wm6ukheb/fbhsgkA
	 ialSxE/FPMEAmmjW/Nu/e7afMo+IpRlYBcoOEAtm4X/ypNXUoJH7T6zLJgJcPH4xV80+/
	 5c5giZ1YrRfci8i+yQTtU6Ql8W6JTPYXJ4W9tQxuBVQCYuh/EMpXbjLiYnleEq5upNi5F
	 5INaxqTMRRtSFWGMFYerVqF+SFZhWP2G8eewD5ZVtRc1rkONLZsvvDi5bA5tNoOck2aSx
	 oJ9j+70d43G4A5Sp2z2XrLtkQKDjGYRWfMSZtR/i5M0mouevyBI2ODmMr/vj680LUlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
	b=DCbYzfX+s1TfBGQECTXr1bXccuIEJXUU4aIb0VA0+FiYvox6cektuDfI+ActACRkwpDF
	 Zd3XXWxSYr+oFUfRAFms8YlFaiQMU+IPMK/AM4+iWA9gJ9TJ3qgVque6VFP2IgSHnOPvX
	 Tygr3c6a4hnnHsDH7VKI96pcWtC0mpKWfgcpW7Tbr1zWIrZvMp18AUJGtN9xDP4WmkZ7s
	 yP54d39146fg0VYuLpe0Zt8jRc7/bK3K2diTiqhhPyUhV27rKyxib+TfHGR1wZyTPRGFI
	 w38J+vLBmkqZF0ewJJtz1FhH3+osYVcyQUTLn0G9ZkDn8m4KOZrmYaElv8ykmVTlBcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0lSEniW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYztFpMd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA9606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EA9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0lSEniW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYztFpMd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG3oF4116535
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UR4JTI9VQzJqFZB8kjqpLU
	WsRrNaJNk6gTj/t7aYhsA=; b=g0lSEniW6gquVXXpfOAY99DJUHOYnH1CQYc7zh
	7ilDpSevP4ENGSyIVmlBECy21yYDFq7A9G7Qcl49gOVULsUTr+YHadkD9VoRYO+M
	3vfc2d5QUPcH7S98ssSfvj9YmVChDGDA9Mzsp+1bifsNK2YtrpfvjnwzI1EIZZfB
	pePZ4gquLrsuJ2iHnUDS/gf4ExMnB+l+K17XeVQuFq3HmiYRmwq0RPGlwt4WuvIA
	HDDtPDyhLGxk0t+uJ69g9+o95/DHx76/Y2lPFbS47bysv5cedWtIPjDQgEEbZkcn
	AJzyYwYYbBqdI5dGDOe7W5qWI5aS/LtocNHY5yLjOmquEqLw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rkarx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:31:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso1051666b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367067; x=1793971867; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
        b=FYztFpMd8hZQdKRI6gGG0AABxaLMRCG+id5+xaVZfEYowaH0zve04S9HNDuBZHbES8
         NkzmuG7vUlHzXydORf43kxd6JqmI9YV6oqrjpkG12NhmMsdiv7Z6wqStKJbYyOBIT/j7
         IgeQIWRjeNyyR5zlsmNbqr2u7pTmVAWh4pNfigB7ZeTtnQbB+lRLIPSiu3xj2CA62XWp
         bWly4hu8DHN2PplltEWTmMBjGFGF6yVz5b2ipIWJazKhh6eK0T035QGjailjea43dvfl
         Tu99RnOVjx1xowk33o86buLuM6Buuc051wrjrnLAC2swZXqGSARAHf8glJIBFAEH7d14
         Bh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367067; x=1793971867;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UR4JTI9VQzJqFZB8kjqpLUWsRrNaJNk6gTj/t7aYhsA=;
        b=Cr2YA7WTfdnwLMo65p3Yug9RAyyl5uGhLqtmxr/McAg7r7cWGdTVLE9e/ePpVpwM8s
         H/XG7DF796A9lc+ysj+fx0mS/4Xk8jrdCUHLNl+7iS67WDVhsaFE3VvSimjfwOm8IBXh
         VKDjAsc4DianwMOq/ZtGAiT7BhTbDyv0/fOvW1Owy8kBaxi0fBfni/II6UGI6wEtLsUE
         MTn12czevyiQDpTe9t1KUUXlrnpoYeIKiwk7/Oy41r3Ra1/1r6GSzII2umVBbkkmZscE
         LrloHxOyHh+0MW3Kq/tVRCQh1Mi/v1r/DLVKXmR03og2LZaX+SX+6YgikxtdazIMTCR9
         IHXQ==
X-Forwarded-Encrypted: i=1; AKwUvByjd9B7CDL1EmiQJ1qvmPKglRHw+v0RoV3c8JriVjxR7qth7ghtOgeSpwGk5neaTvt8MzlWWVqGKSxcMEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBRT4alRSSwiVFElsaU/rVPTYSjL8Ydn1MKLsYPPJeQm6p5/a7
	92h+L72beUPn/th1vi52bCW4QntTFDzgq1itF/r/FBwVlU9+p3wGxe8QBMYkJ+Te2GhP0j4+9it
	RNpc9rxGweoVV1F1mzsnCnuIaT8AL2KMKJgro9ReTN1LPh7yyW/cZo5uE9hBI0B9fLpw=
X-Gm-Gg: AYBFou1CxQXnaKAiGoHRM/xPEJ3BloHqQ+Ax6T2n3zTcV4s41kQmbniRxUuZ5tyHAjQ
	UcQQJdAPqq2d2FjaPPc3SSWWtf0ApfbNgNHl4FjOtyiEo4jgmeP2huA5b28tHJFk9/exqa/6tp5
	+3BchiYHBSDJYL0yhAmicKglxxV4I2WOK/ABejob8LEbBbx+I+WkNRLnSkM5aDzNTEboYzu1rbe
	1uK9gmhj+IlBWfp8N9UUFL/U5zOSkLvnwOosCoufIxtsjLZcOVgEbcDCrS95uT0eWIeuB1q57Tp
	aKYJmQLGyXotD1o3zokWSutzUQpdoew75iMP0vfZ7hlyw8JqD0jtNzBwZ7+FDAFNM5OTa6/DqND
	TfJ6AwCalPBi+1ghweXLt9zXXfbX5p0FXtvRI/zaqsN2FWD5Yhqj8nRIwTfH+7X7AmBbQffOAG0
	nVsKBlDBkj
X-Received: by 2002:a05:6808:2512:b0:4ea:18f:64b0 with SMTP id 5614622812f47-5640decc459mr1809526b6e.67.1793367067547;
        Fri, 30 Oct 2026 06:31:07 -0700 (PDT)
X-Received: by 2002:a05:6808:2512:b0:4ea:18f:64b0 with SMTP id 5614622812f47-5640decc459mr1809490b6e.67.1793367067074;
        Fri, 30 Oct 2026 06:31:07 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm1590884b6e.2.2026.10.30.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:31:05 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 19:00:42 +0530
Subject: [PATCH] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261030-qspi_dt_binding-v1-1-5249111cf870@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAGc5GoC/3WNQQqDMBREryJ/3YixxWhX3qOIxCTqLzXRfJUW8
 e6Ndt3NwIOZNxuQ8WgI7tEG3qxI6GwAfolA9dJ2hqEODGmSZknBMzbRiLWe6watRtuxXHLVCJk
 LkRoIq9GbFt+n8VH9mJbmadR8aI5GjzQ7/zkvV370/ttXzji7qTbLteDFVerSEcXTIl/KDUMcA
 qp937/TUFWbxwAAAA==
X-Change-ID: 20260916-qspi_dt_binding-8a1cb7a8772e
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793367061; l=1839;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=6+euTVf3GCpORG+HjlXn9bEmx+HYlFRWqNiglrEVYlw=;
 b=mva44UfZGpfgrUarHZzaC7Pu9cJNQKZyiCLNo3tQeYQENvV6cTkzLY9rBi0xaV1uq10Gvtwi6
 9w++rqbasXbD/ZJpziP/1CkivrzIGzMDZy5LMokToF7uFxtSLiuu4b1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: 0KI2fPlFMNvdSnYplkZ_rPFGPtaJWhIA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX+AuBUXfZqo6w
 Dil82WnUknz2zRnrBfB4gc839K49AJTRXBX40SaGewI3Xk1U0h8HN67kGinYM1Li6bmBqjkswPN
 cHsCvSroQ9U/qxTnAw0/IOEe91hLHQ0=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae49c1c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KUikZgbwDMKjgD0mul4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfXwHvh7hTolKpd
 wRmUkMqCZTKsdrWljd72+ZQG7l9COqYwElJAQ4ebf2+1fbt5GRq+TBsocg3/mnWtRTkN6dWZzs4
 N3B3/N9NSBIEmicvxbljD+VywA4dIPBrmPwV+TzwLA4jiDArwYWJisNAKeVfWnZ4m1oTtNxlkXG
 /eHFArHyVDxVDrVUAN3filJDOMowkyPUy6exzwLU++nvGNTqKAGhWJUG+MH0FksBIzAJOIBts/j
 VL/lIqxfiVmMnNBVyB8bnoqici9hl08jTmeWAOoWO6Rq6VJXUuFnuSX2fTv5ajU9/ucmTEFhpzz
 kxoJYcvDUpTgOVU+wMynv9ovtpfFB/+eEVTyqgPwOo6O311Xq8ugHaSobMXgnwVwi/mjVhua89M
 8TVMCFoqR+iJs06Kwvs6Dqd8YFfodovCVXs65vVUZsyVX/8RqrkuCgrV7814VpUH7VJHku8diYB
 HZzs7ATrHq0erCHJbXQ==
X-Proofpoint-GUID: 0KI2fPlFMNvdSnYplkZ_rPFGPtaJWhIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300053

Add the "qcom,geni-qspi" compatible to identify GENI Serial Engine
instances configured for QSPI operation.

The compatible also allows the driver to select the appropriate protocol
firmware when the Serial Engine is unconfigured (GENI_SE_INVALID_PROTO),
distinguishing between SPI and QSPI firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..e568b67d077e 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260916-qspi_dt_binding-8a1cb7a8772e

Best regards,
--  
Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

