Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973340;
	b=gSQeEyCauZPRpScret7PwyCpOmC5c4II2+L1DvwF58clfvG0/erUofcWmjeeVXqcAFay
	 S3o6tJR054ph56wqCNirpHjM993h4KLzKjYPI67JdkIfJn8oWwLlz1iNCOeEIR6Az6hwI
	 HN3u9OyXG6B6spfV9u+DIeepGl11TPGbBCynjWwu1FeJTjl247dOyVlEL4vzlu4qm7RHf
	 Qu+Qvw/+YycDewyzScm25cUEcLTO0JLjwI3KMJMkoYZXz1Ws2lpBQKCuoA20S7Tfp1M8f
	 /reLVf3iXnqp3ct5fjG37h3M1RMSeVrt+KfQVs/cB3wEfBDV5tnQ151lu076dLlKbEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=elddosf2n89uRAeLSrMM73EcpxeU3eokqnv2bm7YWVk++GS2jg/y7nWYyfl6KW17RAEK
	 oD5Fmap5H1FRp2ddn/OfswMEYd+ACjJ+deUnBGp2T8+KsitTeJjQkaN/mgBt+tjgvpD0i
	 lM11/McrGYZBmPB1PnsOCtJhwRzL3Jai2IhcEpD6ErhQhmXTYwzLIdPFKZMfhdFtN9aah
	 55fcMNu/NDeB9pI9TwPtZVgHayTwUUTTQnhGebFZ8ZzcKFZevwcARYljJmIIAsrX1Igyv
	 wKBh1SK8h4kT98LvnJtZG3UHxjlXNLcmamDiA7zDfx/RKc5gTpOGhSSZBvYwAUoDXAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB4B606EEB2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB4B606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NCFwPK6f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkjHaswQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoO1s3034451
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=NCFwPK6fDMZUeEWu
	t2YavRajsMg7gc8nQ6+sZicIILKC65pRTJ5e3G/AePMj1kccWyxK5LcA+Ag4Xs4z
	Atqi5Fg+6AMPROVKn47l+9r4e/FzEdBz8/wU/HN+YZnPgLccTYi20HUWyobeUGXw
	dYj5mqKL07Gr6TqDIVGg9Rv7vM6mPt96fDixg+Km7/wyGSCPpeTfH0daw1pESJ2o
	oIXC7QLjczJBN29Ofw+l62rsRYvxMVgAtDUqTw8JPOUjodR/eZdbra9zUSSs8HpB
	b8gxCfbaftkWY7W5JMlHrv2oQlTVXfbazT7Mo/5oR9UMhHgXp+7EyMNyx5fnXRHD
	sJKXGw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paayhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:33 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99be6943b20so122720241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973333; x=1794578133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=bkjHaswQTdmQfelP8tvgty8CPdkWVMxqsvNDHNIOF1ljLc02MnZaE3RMsGCmP3Y2Mw
         V/o2py+3OK5xfngJYd4b0gF68AKT7Gi4sCHaEBdhDeE90PlSsujnyozWAVoYChg+yE2S
         L1x+/Novk1mbUGdw5yN5NzNBRrlKJk1vnD+DjKN4GXwuEisMHA5yPHHhdVPwuMqJv2zS
         35ts2FidSCcedTEj50FWuBpbWV9RUCahw0fEm7aMIRZHKKzDfI5OAi13i935XnvXc6xC
         gyfoEXrVMMtqPt8t8O+iqS5PjI4FY4ebz9peSrAHU8Hj3Yh8XHSnYQCR4PICJuCn3Hvr
         wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973333; x=1794578133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=krFuhOe6hI+ffhoddtqHVTcHw58veNOGe9rBsq3zJU27yy11hTxjixiwnK86O9E+/u
         VBmrbQwMbivmXB5jSSN2NLnqX033go3ykdAkIgDtRJgOps8hGuWsRcpLdf09X1Ju7Nja
         DuT1C/huoxek0nw3mWAZ9mpzUn+B5ZGIepWLnIJ259z4bKtT+/rxJBceg9mQLnJfl+Y8
         K6O/NOoo2NZ6cOwXDof+9K0rmsMCUddckypjO0tilxrG9H0s53O4xOh85RFKA5kaJjZL
         zMc0KinFb29XSTCKJYOWRtxeG3hKIdS3Jg2g3sP2djQC7yCVlAY5fZ/jfPu3rKKiCNZQ
         Uc8w==
X-Forwarded-Encrypted: i=1; AKwUvBywx2tsKbO5jgPUmmmS2G66o5OuUyh+YyDUoCEurHNaS6wz+3ETF8VhKFENUdXFvOjNdl8X1RF8c1C/2i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QqhSw16wHeGe6g1bu2HYT5JQSJD0SkyQuKEYW20+ylIvVU1Y1
	OqeGT7l+Bv+JihYw2HZwE0Uc4mDoN2UZdYtLUJSmkOA47cx/76urR5+pWRrWrT8N+/cXM0lYm9V
	2a3L6mnaGlqQm5h4tfekThvf/POypPiAP03fU9Ps6G/Ifeik6ad+WIBEiupwE0elTf6A=
X-Gm-Gg: AYBFou0wAf1WWZj7RUDzherDTvcADqb69G6PTsCzVvxXrzZxG5YW7/eCj9pieC47Qz+
	IO59VWHS2kC5HbyAdDlgh9/mkMaJmVM29AZEXMeqFBNjwTeTSxtw+LngRBsz+12H5YgE2p7IbwA
	t87UyNjyBrKm5RcOhnwaGWcggG0qMCVLgpINOTdxYZNTtVwqRktGHI3YPAKVya7x8VjT1sEyrDK
	V5YETQKedV7uownnTfybkGGLwCXeMv8Jc++zXrz8+wLujxDQhO081p1NsfzA1hwkyBx6LuqNkX2
	/KERuq8/d+5fYTZKZIucjZvKPz0Zd1P2yzwueQF5DVIKyxVfYn5wwp7/IGTg6vFpmpGtRMC5s98
	HKk/EeUTfIS4Em5dJ3qk+gBuZBjXlWh+VMOYJ1ieHcpcS4LMeOWR3VTXD5Tc0qKtOnCkRZ43anC
	ZPwn94aTGC5Dl/kpugUNRP+x4Lo6SQ8Tl4QtNttoktlFyYGdgA4cu4MVaVKZWmP4G/zm3Ka+bVD
	aKaQtWFuOqBmB3cBY9jwBVQ0AbB
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093463137.27.1793973332848;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d2a165057bmr1093455137.27.1793973332363;
        Fri, 06 Nov 2026 05:55:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:19 +0100
Subject: [PATCH v14 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
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
Message-Id: <20261106-camss-isp-ope-v14-3-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: iYDfc7kROHgxSbJMTJbwwT13mx12010q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX8KDQnxCN+TGv
 GyXDvDIqdH8mJ/9kmEmu6ieDCv6RL0EMsyO0QcYxPZitgKkdtMz3IlPFcpfUk5EP/lQL5D0sdut
 5yr3cZ+Q6JfVIRZw0vTXdVhynPNcLXRC1UjO9sbt9971sXcaOipyx3egy3OM+7ZDUWTTXhXzYYN
 EJJVusmJqhp6f42vYTeWxg3ePqLqJKrPa/ntfrPuz4AWwcHo+AVKWw1PA+u5Qv1l5xXCZCZVR5r
 0SZHXa7Ij25JVCeozoSmFtagWKc655TTQkt/l4ZAgJMm4jAFlKAr1sV49R05Kulr9SaRkYZ34Kb
 u7Oofk95/CPGzF6eJ+zANuu9kpGYFhWXIzEdhMhFBm7crcAKu42qowjiax268lfBTYXqRNVhF+u
 nQzga/keNCAAQ2J/3N4oNx3OYF/9mp1ElWIE6ohn8cj+WlEzqD+M8MnL51d3CXtbm2GaGpSZcmr
 lBMXJMXfVGC+AkeJtXQ==
X-Proofpoint-ORIG-GUID: iYDfc7kROHgxSbJMTJbwwT13mx12010q
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aeddc55 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXwQizbvl8nt2z
 w5SjHSAibxOr+GRgrMEFcvdtfxdErZa4i/HuimfYWUQHQPgDEJ0wo/cFDhtuWNZ4eyOFlOMe76Q
 OtBpJuyfupPlPZzEuKU47hskqfut5Cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

