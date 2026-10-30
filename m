Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341273;
	b=ttvjfPIuLQTGOB9OVCd7jSyZ20F/9dl+2tHxUw37acu5XN+EluUhNxbmhDm7i9v7JcMP
	 kIPOib36BvGxC4ymmT8svYCwQuwKqUKw3+jU7O156pJo4s05dHknz65ziaw8HZzX89W4d
	 08W6014zumIQ19WOJbxTQ/XxUmmso70SJ5q0+H5SX83x+zaHHXZlf6OywWcDpBEc4IqA8
	 Shz70vaRF7htlBWMeokYPYmaujS9TqyXncKgKrKl6B8vj11ikoPDW/ZYY3zS1MftLxQbt
	 lvyNtPVGNqcKAOyDB5tmIDP7rFtXM21ou8ZPqh5WrVfp+E/uW7de9N78FHmgLLj+wyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=lJN7Vf7DNNRxh5slT6O8W30akGjiNV/Y+7JD9cjzSZ+FCIfaD4nGdKQAa4zgkVQ5RWUy
	 qPvKUwRy6ZG4WNH2jbEh+21epHAkrg+GzMPbs99Qs3IDLSYSt4dFyCuNydQkZSCTJ5mdi
	 B7VyHUPDmmTJg2LrKZM1T3jQO9KI3xtABfWJ0wSNdIWky44cdU1V9hkatAZZNnmZnWsSy
	 j+Nt/GYdsiOeSAd/M30vIm8Yqa24JC/2efpKqallJJjK+ktTZAF0aLRidWzSw6WTmgBVX
	 CJ4eyIopawTNuFQeaAzxW+3/rEglSRfTxr42wLqeWZZ4s43fs6wzLjb0J8gPFTMLSTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4190F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdV5G4b3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0Yb1738518
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=H3H46kX025o/8Kik
	Xy7yiyuTpz5wG0IzznxcSF7+VdlWJKXEDJZm/j9eQ4Z0H/d+WMDQeGW7WoFxRTNx
	Q1ssTF7U3PCPTqh0dCPHKXyzAIxhQa3YNfFu/P9il/b5KqF48+9TGGUzMkOi/IyP
	IzpriTfzJdJ6e5h6MlzNUwFLdTf+xoXIJeYLQfEo4nzyDcNV45KMYLGCLwUK1Lc0
	xlrGqsF5n4fYZjYql6o5JnyGuFs4ED1cVXdLCwAlaGXBZF0v7E0H+XhbbNL9P4DK
	ZI788tuSb4vUFSEjpRUCetJFuh1nf+3GRhViKJ5hmtcEAcIf/NrcXHfTx6oY3ulC
	9yPT1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhgs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:21:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so527564b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341272; x=1793946072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=GdV5G4b3VRO8hQbgSlPzFJEOmY4MIxcbUCNo5ur9n9fbQYrGzRVoqcqGR6ihsiKxgA
         RDCDMHX40af7FsOXqOPPMAS/cerUx8i4vFzZpCAVJ+YqSgQqwx2f3VRWvxpqMdAR52yy
         8YameAINb/uQSmycUQKTj/QBRKyuqVOr90KPE73vZcYLPjyZVLXaEf+rMEgPwPeXq9DX
         lJymtESt9hNsQjlbCG152n6SJSLh7SPjVvolQkJKeenR342y6PuTcySzv9IUYoJG3CAF
         TP4MIjuBN2qqaCzobBCKk1DB6jyivHM7jUp1AJRKY4wt2vuw6s3cjro5en9Q81wcmm5U
         oqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341272; x=1793946072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=wZQI1Z0aRmxL2tsj6XhxWVeHWiyEF214CZNLlxk0rsTXVNW4Bec1ApIY/pm3s6hk05
         dpx94QfKkvllNlxURbgI28l7NHcBg9dB6NwL9x8A03ZAm/MRyqaoQQGFQc345CFrvO98
         RZaadkkHv0FSBB0yuVfFkxMKtrX7ByNLL8ColZIlv8BMR6Li94KBEeKil825je7nNYwg
         Us/aikE6/bBLKZTmt28de/NPRUlHqE6XdnupRq5QXJhm5ziQWi+3iufgrKi+jn4+/lCt
         pF4YxqUcZ8B6nbyjT3+YwoDtlDPNgb9ukqovkZ0lQxLFo0XDPOb0ICLSbJQklR3m93Uv
         CgFA==
X-Forwarded-Encrypted: i=1; AKwUvBwcJmc6x4d6LE3dTDLvI6uXFxfp8LtYo3pGEYR7b12ShX70th55aMR35Fl8yGttZNZGCOPaD67JoU3xm1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiwDhsyg42nvO5gmgFV4Pu+enQY9vQmPSqPkHBtFtYlmPSdbrN
	T3aZo95MSiTJaj6tTG0H/gXWJhsdE39eFnMpkwnjf2ww9cthZJ5+AB7nVjOW/vCqg1Tof7RSmyt
	TEf96CjgZl+lAYhokD0Ok0Xcd8Rkx80kdajJAWTe0psOgo7o36hEqU6i5QgRFS05C+GU=
X-Gm-Gg: AYBFou1HFUIpAXgmQQUiEfIGouMmAjL3+Uvx4vunnSgLL6oyAWlfWC+/XoV7JTULas+
	X5yj1OWufMRLW01SvxcU/0W3Rfy0BgT8mW4BvNqhGHfXMQZi8OIxryWBTcmW7cYDLDNxwL6Jj3B
	BuH9VHFFddtxoitP8vrwTHcm3joXs2dpYkVYSN/E8Qbw3BkPr5o3EXjMYx7Pk5i472tIGvq1kzm
	5FQHZ3eziGlhe0SZ6nNjJLKjmOc+eEMUsyArKZ0urLghB63octBfMe3TiABRjlmArh2nRsx+X3i
	pXcCcLdmHhYGZoCcXm2GWBZcBOp0l+IdD6rBWuWJKVVFnXiLuPb3W99b8zACNYoRsoR6XUik/NR
	jbURtcszDBu2MSUSQVaFxFGEPitWd6jw9ip7+UYIY3jDrodr1yGU+/13BvTw5Y4RvH/o=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153263b3a.30.1793341271871;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153243b3a.30.1793341271451;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:49 +0530
Subject: [PATCH v3 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
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
Message-Id: <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=mXOJR5NrzpA3/ALgI/vb3johzXuTH1aNfzirkBmWNV2Ur3MUeIOd0lkchHZs3pkIo2CRjYtwK
 uedTJ5um0QiDmPuJAOYi0VxrRZfDaR20B7vFCvjD3AHkklpe5qFLYmX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX+rjczoqGcCye
 fouSjSP/AxcA5Oy+SgjrchUguTvyHeTc3TrR12ip/DKDCWf+ummXM0GjyZ3vs+fYBPp40UDWDCN
 QldnXSuOxX1iHHpJ3NzS3sj8GrqPIAebxXGlxHvLTrjQhKKfWk0MsDVp+buRl0xfS6711OKF2wd
 2ioD1IdCXmDtUQWcu5rYkvMbTZZfJUbd1wnE6ZnDvreFfTo/886YX22gOCVgbdegAygqds6DRvK
 eye7mGAgLgm9oMIvwzCYV+koqeKfCEZj4hv9/AZmOuRALMPXttqkfCc8Mxh9J8ptuXs7L4wZFPf
 PBUV0DBTJOtrybaY6plrLjearo77fGx5ki5SZh010Zkhq9/cBFBBkhQaJvLcuXbCRje+zMsBevl
 /Pf4MEFXgU95jDW2blR+qlhO8wvLjLnShupAGHsSIYKLLVXVZGcXh1ommm+TkNohVj5+Ezz4zon
 HP71fmnZk59uALFX1Ug==
X-Proofpoint-GUID: hIc6qmkBjqNNzZtgr2xVONGH-XFuT6pv
X-Proofpoint-ORIG-GUID: hIc6qmkBjqNNzZtgr2xVONGH-XFuT6pv
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae43758 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX57WCxOJ48aA+
 W4yI/lVAoeBr9x3+2YTwC0nTmsBHU0IdLcs9LEBO7M+y1iF1uSNuo2G8I6YeK9JHfIZw+1yMyk/
 GyIKYBPVfPsb8nzi0Tq5/6tmFce7pzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

