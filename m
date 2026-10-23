Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768182;
	b=4pwkVsG2lLqjymusXKOdxQaibvDheZHKh9YC9apf3/2nyy4CQNCXvVqyCu7bENCm44ds
	 zVf+FvD66Z6Rz8iB9hJNgywPXSx/ADS3wL9jADJpHDLfdRTdvzmvWjuMlb8dlrxi0dcvU
	 cq4LCuwr/LPAofvM8iKTODfIg8eFoUWEpN/PEASTN0vathsWD5aY3oHdrIIES76ZHl5Ky
	 uYYtk8xoy1jWkuC9oGx3QmC/MNN6M21RnM8PQq8eKPb9fjHlSU4zu8X4mDHcZ6VY8q0Cc
	 HQuTGIbfdrTpOKRo1hF/maD7rxv+LzyMA7LalcSx4UUWQMF6KhEaD3d/xNcdfii7BIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
	b=w+2IPmK2RBGAeyft+dm5IiHWIiHyu1Nq84v26xukUP+I8C+udQwDAOxeCAKm++Ngj3xt
	 qJkNdN2aGjQm2Jei+ToxGsvxHoAkoCwrSC+pTC7kUJ22AsowpKyRMQK4WVBO61qsShKAo
	 3TSXEgYtlyOzCMLQi8VLYfrKoqubQw5H5yrY0pBI83QwwQHJiRetHl4T7+skR4XiC6vzF
	 Cnc2rVdJlYUaaBlRO7oeUAo4RUC+1+VsKDykyy31+RtXGMR/sGw6TlIRMfOyTpitkIv+n
	 KooTfi54miF2s2zmCUly0NoUOC7uNUYGNDivBp4tle0fahji+Q4cc9diMurJQdJCp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BE606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7BE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n7W5gKds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fokU3ugz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6AT22974544
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=n7W5gKdsJEkKaidU
	m27qhM9bZMOjL2rv3vx+3p+Ap1EM//wf+CHUjzMKsTBeSTUsNv2+2P6Z7N25EM4Y
	2zI/aZ//IhxJokKwWv1QjCU/JKh0HbeKcETCWtCoGzqoeSe5ov2v8dXEUN0S/Kpz
	5302ifNKU4bVYdRK7URyFJX6pzxJ+B5T5vMfZJ7mquolTklbUSMWHIPqoLJtIfUs
	F4NVJjUFd7ZPKFZ+8ZsuknSKYk5yAujl/Ue/9FCWmtWPTITSZU9wo6PpLDbmuI3/
	lkYEo0QcIM2cvtp4K+oZWI+8QritfBG2dj4PxB4EGNsUT7THzlFMcud2YHo9owLD
	S/C6SQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4qt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so884390137.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768179; x=1793372979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=fokU3ugzhK4FNCr7zI4dYcSwI3DDFQNHJxwQKpjE/C4KcTOXj+5hfRQmpvsnbR6A+W
         ACs7xNzeCGHY9moy3G/m1uH/OwqzXxa2i+2jA9A0UP6XSkhiEbpgEDXCO+VCs4b8hG26
         q2BwFpcWhsZt1d68Wg97rK+RVlY8CI0/W1MPVIspLJrKh+mrMJR6HrYpTUB97MgztTlG
         lYm42dfqgeztgY1h2EYZ+FNLTh/UBhqIhdgwVaumEB4TProUGKapohweKXBiXWh9bT67
         1NzK24nMyGVOXF+8hzK9yS40ACRPNK/NQjwKKLcGmEC/WXaQCiu+fON0IMXvk2MbvBXQ
         BomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768179; x=1793372979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=avCllFIPNzZXS+G2GIAFUHdn8xT63IS81zZOTyCY/+r+YxyuZik2Rx3dBRmyy6YnK0
         cmHyyzDQoaLriMc23gUSrLEpdjJn/BZ/rsmxAIjAufJYRXXmn8JwXydjxhhj64OkAyHF
         Dns++oa2EKEDKfgqHVZFtJvobYHJBV6jFegsgJPerU0b42kZ4JUpff8Fgk2VhnaF/32T
         cqb0dDDadEyL1myjuuUECcgwJeIYZF/iZ16OmhaRJLFTAidM+xZlhrpOYE5WumR/K6Mw
         unCyhPnI7rrcczfyKpw8tp6cdtCiq3ib8dBYdcYMmuoK/0rbKqXcmnWL9GKwp/8Vr75g
         rOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuFZPjKF1R7i8dP5Z6MRFrmUPWogfPboEEbD7K2RuRdOdMvh7Wi3bSK7ciu+ShVqeiEYi6c+7hq+V9M4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4vRXdEGDhOPEuvwK/A22FCT5R6zPdEFGJvmmoqliKWme1got/
	lM42FbKhTD7atIYBYx08z4OhB4oRjmKYeEoDBcdCqSBA2tLW8koG4K4JK//9qrn4bPs7N7vsITE
	lri3vVjoH1xfRyN7Gq+JghIpr6qfubpKZJlDQk7Rh8aMcdXc3hHmjbP33M52lyHAS9gs=
X-Gm-Gg: AYBFou0XnpayCc2viZ8kO9XZ0ispL1dV66qFLq3S8Mv4P6KqjyX6N2z58BJNCTv/3n8
	+1wVVRJrq/SVy+RKWoFv005pM1qykqUUzopqMIVL24/T/CinNEJJxtwy0wmL6V/zfcoaJVVC5lB
	/qIPXQTIe0BN5GmzJrL8+L5E5VGqR0bwAuobzV34G6HAfZ1ix1Fkz4gbyl2K/TjonuOWcWoJz4/
	8o/EoiEzgyRVy+y8u+OJBUD7wBhuGuAqswacgZKrxsZLmlkqdlSkjuqvyRxJvhxyjzwnIhbGTy7
	UBthSnh2QgKxDv3sCr37xJj43D+Hxj2VnPJQXgra4A+4VVhUouFGtiO66xrKmNzyEqBx+/5b/yJ
	7ceM0kvQPT2SNrn+h6s8uH7yAgSxg9DWaYDJZbdXiMgfAZqdvulkLTykJbvlvYNbp3aw8hdlCWy
	qVkFrJWmPcBQEEfToxUCfffa5bJXsxgqc2XJQ6ji0wEj4KEg3hOtc=
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042186137.14.1792768179509;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a05:6102:510b:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7ccc32d9398mr1042170137.14.1792768179077;
        Fri, 23 Oct 2026 08:09:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:14 +0200
Subject: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: s8VEiaF6gjx_7vEYWAMDjFxBc4CvUQP-
X-Proofpoint-ORIG-GUID: s8VEiaF6gjx_7vEYWAMDjFxBc4CvUQP-
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb78b4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX/hYZHSzr93pU
 JafmwcJ8r0/0Ip/vgg17joMlgCSX9yin0L0r/VYYzbvrzIU6xvbPzYHjsITQu0YZj2DcR1X7uyq
 D7reT4F8NO3NPFwYrY7CvoNiv9kgm/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX19FZQ7OvIS5d
 T0irRHe44S2PoBStJg4UQanGKsvWHqfstey5pBQ04epnzeYTmN8QvST4Y6MsJoUzNea6Bj/RL4n
 GUy+6pDQJfTCP3QV2XCaLw4J1dKtmTqkHivYAFWmn9qTw9DfvE1rTLZJjW/nPWZvsaMkhvjHGN3
 EoKg0IzwQB0nC6ZedZESN5TKyjB1/aDLi1+IvmIlpU8fXtWoln/tXXmSJ2KcnBvhHhNWzrRVyLx
 ZlEfTwwRGVTUCZJXcaEAqMOrhdoNz2/VrG/+8c3vE07Y6dpoSSwWYae/uATlpolaYi8QNYPS7c7
 SNS/2dClCiDk/Po1fT/D6ssJayT3cTvIwxea0WWc6J+IstsRMIhkGjSldc37/DznmR53AD/VXv1
 gOuMd/N2TJjS9889z7W/npJW0rF1dPLuwfT9I/E5Yycu/RC4SeHbDenM/HHjRQMUghS6O0ttxOE
 FNZT0l41RdCAti3KAMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

