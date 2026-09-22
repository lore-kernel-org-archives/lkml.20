Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6748EC85
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115122; cv=none; b=NIGdH1Vigy2EkxwAFHAHI2i2AczFbiDTmkXLAgZZjc2k8H2ysJqIXa6MZqvQ1iBZVCugwAyOD7RFtyHzl7qmKXLT2Fr6hkkSowicZOTyT2TF4AR38emya14VyKgxE0zkrCTCRywrbXJAgZrDaGN4wnXVxDBTMf/qaC2AJ1ZTkv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115122; c=relaxed/simple;
	bh=OmXjFGhBNzHuev1ToYpS+/g6gbD2jZQAPZWQtH2A5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6orv+rcOz5O8MfjjogI/NV48GMokQ3B8td16XDWSc62EPcZZnIdyQYG2dY0lOayOIRugEpJGIabyLSF1QxpJ7r93RxXOQsrA/xs02P3ZFPDWcZyeG+Pm5VaKudaS06IXt4CcXK92DlCa00hV8ngxdi+uwXp4lSDIkIvTZjj5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XL9ocmPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNttmTW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XL9ocmPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNttmTW5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7DVh368062
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r+t6o+vTCc8
	nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=; b=XL9ocmPxDx2FBkKtzxKORMHiqhk
	APcdi7DENvLSHZkDrEG0l8rbJTWnL2a0oWDRFvTIbbAnNR8ZF1bAPD5aKuWgJIhJ
	8tlfTYRe3LjbnX2fdPjQBw9aMUxEQD2+7Qx1IxXWWVeTBIg+ROZ20hwLtwM8SVj/
	nYBSwikFKTjiiWppIzEInK02yWnclIcAM+zmwgHXBH46opw1kevrvp5Pp11jfCbE
	WkzYTQSJa6wRt3sKKxFS9cKhiRDoRUPFwYCKBBmyoYfA7kLhiQslAmfuHZlc+FQy
	TMA9b+UiCmwkmBoP26DDMsIpQPDd8KBl6WrjsgLu/8oCv5fD23VVJSwS57w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntb7ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1bffc2eeso78900185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115108; x=1790719908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=PNttmTW5tbcTQ4e5qq5S3Grm5oKcWuNYUWGqAeCWBHH+c3MeQqZ5CXa+iBKV7pS2QV
         C26W4R8rCc1c7lfPEqAMTU7R6zmq7CgbATf0BibU2n3WmzmbsppDa7RXi5lFYvIYHe9y
         A6skkLoKQ2BfLc7OnmfktSg0Yo+P3Dgf4YT1ngrWjQrB4IYNc6G6Bfeytazm0XD+9r/A
         lN7vq0hBYOFAe4ip50tgsn+pT6dxo+pyDhcKTNiylvesav1FIz8JfPx9TZw4t6w/6fw7
         PtADa3KqzkhX6ndv7Q1US24iLGwLYqxIJ83Gwr7JpuRDWAb7J9MHTcns8BMxBGIuSVLY
         WLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115108; x=1790719908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+t6o+vTCc8nNWCoXMqzHlRWb3sKkFrmjSbHzmJ4QFQ=;
        b=MqZuOPqYINhd84DLEju2xJ9siwZ9FtZI/n3og6i3wPAfoYavLCRh/sigl+PdMD68qF
         nXpjV1+AE7n5WdUdm5uy80rrH2rqJKG0WQ9dgZqWs6tosQwYTF+7r6so6MbaSJITmiW4
         prKdQbTHGZ1ko6JCKp/fHzVPriMMc6aoSk2Uz+mKPHjHkwNZAYVhxIq2CIOzuv7HXcR5
         92ot6eqz93gxBi0zH6pwGwWLO9sNePkqGoOLXeCBD3DFcP0/+N5KaD/QoNsZU5h3XF15
         n9yALkqq2/xa2diPkX3+L6/dhKg/4QSIw5vuPEVEPNKbVWxfD9i2dmKPWUR7wUMEhJ08
         TJTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMOWydg50zGz6BzGQHyYy0wxojWzRr3PxUKk4696oiIGsqT/4j7eYnvY1aDz429e5VfaZQWVJB3IdWEFE=@vger.kernel.org
X-Gm-Message-State: AFuF++lUVcHRzPOSu25f6mk1TVGTNzid1g2Ti9m6791oPwWHI48qiZp8
	qiOm6uXOwKEUf7pln4ssAdjOkf5eO+DhX52HpGF2EZHYWxUbDSlJeVgjSfDiaW3bS4OxosOA9hf
	oO6FzTrgvj/bOJ8Zo4NiTVyOO/ajvZJhTnmjnzvRJe+jjaZk8threWtNk59dzK/rHZLw=
X-Gm-Gg: AYBFou18wwOv8udVc4PxoBZfpWAKFRHD5NFNTwapAIDo/aB6vaym8FQDno4Rtw8qIgr
	ew+C0uNaZteu++iHOCn2aSeS2m+6nllCxhKm3VcI2EM2CtoM7pAF/XTwqle0bkDXp8JbnvEXhT9
	nwQZcz1ToCe39UzlK+V0IcHnbPnFVgudrdFIYFNAOfFIXEwfTtix9dH2mSBHkFPF9R5btquxKmO
	zMMLOak0CAs8SQKhs1FOeNg1Zbk6ioXTQ1/pxC+Wp3I0zWpEcH3tJdzNvfJ0+CIyAXhn8lUY27k
	tnWclSPq++t8vLbrd7DJCL5QA9h3u4+yAcjMt9Inh/5HVoG0h0jyplGlRgVfNdEN7lZJX+NV/qM
	3swT6MTEvmia3FfXABn4JNvn2dfGpGpXGRbMAsBwmfA458pCwO+Yy1ZLBco3Dho7ZqB9WQGGL8a
	s=
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129891185a.47.1790115108177;
        Tue, 22 Sep 2026 15:11:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27cc:b0:93c:22c9:68b2 with SMTP id af79cd13be357-93c251d5db2mr129885785a.47.1790115107736;
        Tue, 22 Sep 2026 15:11:47 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
Date: Tue, 22 Sep 2026 23:11:24 +0100
Message-ID: <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VOZjIwqn2DGKCUQAyL2yDSJK2e4_nDGg
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2fd25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1S9TnuZ4X9D0nYt2MHYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX+Q4IvuoWA4a5
 dIRa/sAmIoS7lym2etx4sMa0JQ8uKPdl/Yy4OSsVfHHOjVKuwGZ0eo8STr8JskwGw3b/9vQPawN
 woN3cTY2LqyHzrhijqsHts7flwacTBdhCHnvtiIk+RVQHpGpYnpuxvm1UBGJAvMpK2/SrPjgJoh
 +HxBcZDckmhPYlV3wxkivwEsBt8fcs0BUY1N9C46leeJINLlCJyUKxXGLFxWRn7ZFhzsGJfHv3B
 YSzLv9S4c8ysQ30ea1dR6C3/7A7R4O/i+3/F+GNMqqreLxXT3cW7zy7BpyRkQxutWeUZH4a/RVX
 WFa4JLR02lo7njeKaggYMtoQ+FGp/Gr3cKgxNTY48PnLsyKWnFUx4Y2TvahuU49ROF1OPRChzwr
 uQMLCtw6qHIldjk75R55JX2X2aMkqX9BjBNthdZ+hDEc3G5GuPzVkxHGg7FcQAGj+g8++JHHsDb
 O3+yyAO/TcxoOOeROaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX/OYVWkS23nY1
 qQd1k1CEeKetL6vyLo0wLXiQwsQeGYPts2Q41lmdagSu2v3JAL/vDZgZUY5q4yQ6buVvtHHeTXy
 HYHwRM3HSOuFqA+T579DPRVqKiHAPHI=
X-Proofpoint-GUID: VOZjIwqn2DGKCUQAyL2yDSJK2e4_nDGg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

From: Alexey Klimov <alexey.klimov@linaro.org>

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec support.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
[Srini: reworked the patch]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..d750da31ae3f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -148,7 +148,15 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    properties:
+      compatible:
+        contains:
+          enum:
+            - qcom,pm4125-codec
+            - qcom,pm8916-wcd-analog-codec
+
+    required:
+      - compatible
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.53.0

