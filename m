Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BF4DAF85
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008864; cv=none; b=bFoTwnEIzU7eg4XlGjI1uv71SdRWg43U2aRRoiRj6Fyqq/OdCEvzd9CwYAi0Y87L94SvVyLTxjgwyNTFuQ3yILhOrRlFVM4cY/JS7aiDZX1x3CmtjMdSYQQLhHcYMTEZ+L2CgvdJ5n2YXtsEf5Q23rrUJs7L1aysiaiWk1iDlaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008864; c=relaxed/simple;
	bh=w5cFDvauDgruD+36S54d4kqkMhyWmgilo8XcvR7nbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMaMHX3rpeTwS01sLyUSYd3ggw1EWwKtRZt7WDcZy0/3FuJEgqm5bKM0pywVKW1Zt+Bp1cIZkBlArxmA9XUxAWn0Lv+8PZ9EbHdCx4ExTZAK2ykyn1mOUzlDqVqypbV1JQSiLc/IWrQphnmrIrnQTdmfEAqMVR0LL+jwW2QQn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxKSG1x5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iimmqeZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxKSG1x5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iimmqeZI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LG77Dr351742
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=; b=GxKSG1x5mvidL77L
	IWwyW0eg60bMFM4QNdHyt6fXxP8iZKGb9RQLOQu06dysUUhZSGDavsGlxF3Cdlo9
	gJ2I2dnJm1c2XEczW25phVZ6VAT6uDQ144kE86MY/B9GtbEWmJ2021M4L2Z9egxw
	NZtsVvcRR1AZ5mobyUMWpBCCpyq6DHGlwbKVoGjUf0rxm/JA46NqoIJ1RjefWxEZ
	uiEijYhNXk0GD3qto1CfRbCXta2N59C/aaiPhI4nGj/onP+MTBmgtgIlANIIdiOD
	ujRkBWWwXVvINOFq6JXibm25jCIeuj7pjfe6awW9tfvAV0JyyQNxEIXbobIdftQJ
	f5nTDg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsg5c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:41:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-877ef1457aeso2362460b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008861; x=1790613661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=iimmqeZILgPIzUdWqKDZ95jZWV9Lrbfm5Vs7gtBywf1FC4CRLikm+VboIzqs4oNUg1
         UBFM3CvgzVR0xpjPEZngB/w4oXARkEZyx1sU7/NkD3v2NfFgZxTFCO/15Zmt4Viqalho
         fnvzwDV9IQtrJgbwC2oMHbVf+JsSnvJyhBaGRewvVpDGXkl7jrA5krosJBICFI2/88dm
         IoVKzIL3HnUjw80BJ55zKpeONjSPFUUp5rI03dBERDdqu2NUzZBGrUXd3fl10xJrwfiX
         U23IDa4pDqo8NHpnSm3+7CXMx5/Cs+8T34kJc4dMfJtLQkSXsv7S3RgX2xVUo4RxSX+M
         uLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008861; x=1790613661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdcCPtM+tGMNytTaRpSP/GhqNBf7dWlDzoV9SQrUyo=;
        b=vTiO8t8oADyil4OWHqDS+iUmYCB+ROmrmfjEmHNDFuvjgi0CP0HQP16Ss4ImzVZYSC
         F/96hnWVUMDubaaX+R28SK/vlOxdRZLMDhrC9qE1GdcZ8JI5SS4lJowK7JRFSJI6qIcp
         W9+nOPh9i+hMSgAUQOzU1iJKHYI3dHR8YjeYty5q2sKeNN0Y+3tRoEMSca3lpZD3AKj+
         EQMrBRhtGSbUJOGRPtbmNZs+Ijpng0JsxNBcZcaqZ9oLUs/a75Q7htnVspuulPOGWq3X
         OT5IWCZi8k9fz3cS1ehMVkLJJhKg7qL2rZxjS6dSezdIs+91MOdepu5pGQdrBqkoQUaF
         6QbA==
X-Forwarded-Encrypted: i=1; AKwUvBx2mKNm46MkaiAJDJuBrh9m7SdaALmaiPIzN1sNO2l8ksNTmpc3Zn47OF2XOcEzT9jCVsxzNWH2nQ6Ejx8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4xkjNhokqY7RhZHuBJm12GdkCLBiKr9idPlH2OuPqvL6jkK/1
	T9aNPjIGImhpxwdy7St3OhU8zGRsg9XOMUcN/KSZNYzObaZZ/g+2LvI2kqp0bmUSZoarxiDMfav
	gIswCPr9vrlso1PSJKKTI0b9wEUReWossCX8tskvZMxQNLnLhCGw/1wplmykcN7rtzrk=
X-Gm-Gg: AYBFou2RcttWb/FvBTnkWovVcIFQLtKQ1PGkHVDYbgGgouwBlTgCY3Ocqc+9tdPnEcB
	l66/OrJBdLitCykmbNglXwfx/0sPyY/An7EcmSfQY67pNZM49W+WXYdlmkAFOJZamWkwZzFeoNh
	8vnpydqi+k0aYrkNasGjObrh8s13FiBkIYh+ue/Evsyojdzbl3rsege+oygwVLYJQrbZJ4CC2Gr
	yjkyDvD2ioUu4TxOsp3kTINvsJM7EyYVDvrYJJ8R4k1t+m7qX89dQJc8+XUFmEGjoK/3j7nXKWc
	jgNJJF9ivfEY5Bnq5pvHbI+i3P3xxQ9+l0ulLbHx9/pthxQE4joovOAQSb9Ai+fldgtpLi10WfY
	HILS/ujvaDXi6LObx77gi+7q7oQJrltE=
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446875b3a.46.1790008861220;
        Mon, 21 Sep 2026 09:41:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:98f:b0:87a:6eb:ba50 with SMTP id d2e1a72fcca58-87a06fb013bmr4446854b3a.46.1790008860845;
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe732sm3666086b3a.16.2026.09.21.09.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:41:00 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:10:33 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Maili camera clock
 controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-maili_camcc-v3-1-2f8d739ac2d4@oss.qualcomm.com>
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8MwculGGck_oBtUFMSVZkqWU4-I5tx-J
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab15e1e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6Q3Ru0MKm2Bx8LS0oh0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfXxS5fgUpb7oKI
 ppHwTlHHVHPoH1Ufw3kPGcDEY/j9gCwLbpu8/CbP1dGSic2p4xsdMsPyPLNcPfYTMkzegyLDAqj
 b3r/Z6KlGr45rw8lg5vWFsaLJDOmLlw=
X-Proofpoint-GUID: 8MwculGGck_oBtUFMSVZkqWU4-I5tx-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MyBTYWx0ZWRfX5UOu6LtAn0HA
 INLg/vId2F9d5iOV8XeaWrK+GgfaTki7/WRwfGqVNollf639Zg03rJk8PKAyCpPVm23y4MQOhZT
 BcHDHreQ4exczr9nfb35uZzpuUCO1ahQXZDFPP2jQR3HcTYCb5bRxtZa1twdstsjd4d0ElVSa4x
 E07JbALLOD98l+alBfgdYR8aoRoltov8N0h5nxg8OvkoJdj6xs2KPs5fKF0SR4t0hbqdkPMYnia
 UyYWoEinxgMAlFYd2Mf58qJjHpkMmBVV3kce/2BEGaFosMa61q9HGVqraF1ErlH1D6QmL3iB9hX
 J1Y9sB50KmbUCHuCntkwqcYXWKkCWagF+F/YS72IAxndmk9EJuQlxaA9uzqzKHRtttYa+0f8F1S
 IYAVFkk7+Zj9C2bYxt0IS8QI3L3Flfl8QyWiQi6gybSkpK/mDma8CMQD6gwb9YqiseDbfT4I5wl
 S3VYZJySslA7PdDHCxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210243

Maili camcc is a derivative of Hawi camcc with minor changes, and
hence reuses the Hawi camcc driver. Maili cambistmclkcc is the same
as Kaanapali cambistmclkcc and falls back to it. Add the compatibles
for the camera clock controllers on the Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e2a126925e9d50046d1b4ad2506d7921462f5fc0..64f5002931f24003607349aea3ce366f5a8ec369 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,hawi-camcc
           - qcom,kaanapali-cambistmclkcc
           - qcom,kaanapali-camcc
+          - qcom,maili-camcc
           - qcom,nord-camcc
           - qcom,sm8450-camcc
           - qcom,sm8475-camcc
@@ -43,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,hawi-cambistmclkcc
+              - qcom,maili-cambistmclkcc
           - const: qcom,kaanapali-cambistmclkcc
 
   clocks:
@@ -95,7 +97,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,hawi-camcc
+            enum:
+              - qcom,hawi-camcc
+              - qcom,maili-camcc
     then:
       required:
         - interconnects

-- 
2.34.1

