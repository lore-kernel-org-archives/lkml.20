Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104536;
	b=ziSEPee3eqgHACh+V2JL83rsw1HyjkG09Vz6PT4CnOAB3gHCDng56+LweRlQw4B/1wFJ
	 XRoH42p8DzxDrtkf1gax8lTSmfgPLAsaFrxNEq2eAC0zwF69+TANbRQTng/Hi6Z2oC5wf
	 Z90wOirNW+rL/vMtRQTDEkgHZ84gOAWeWn9GmIUpP9FHryrEMWkfCGSKyHDgCx2hbQm5Q
	 DOfx7GeMMuaqXS4+61stp2p3iYXxH96y1/onPVDhvuwY5GvyZZDOfUP/KkbYMREJSSlAT
	 GCEji3UcLEBsPgLSvd/AI7j8+1dL9idSWRpRRK3HgAhXhIfdhG8yONYpMN/ikqrbbxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
	b=oYb/zrqzwFXTzVF1QS0jqKIuVA2xd4QeLrgNIsGp5xBSdXFJ8SgFoqrq5BfVM2Ov6zwq
	 AR4gLLAGaBH7xzh0wuVns3QZRxndcpXL5IWAYame1AF4T8Vaz0Jxc2U5bq9BnhbJhvYj8
	 hITEePHXSTRBIMjuKywPvSt/gTqmbCqQiGL62gN79AZ0e+D8r0Z+Kd1RE2BngMK2HVhcR
	 rF8H+HuKCP7c3FXnE1rTnWLXMRfVPyC62bJN1OHaC2YPAZVd3usyH51Km0oXs4t5iwbTt
	 IHxjwEzr5Ua0fHN/sPFjxFffh/2QdtkNKpjY6FzbmNdeDPlISq4aI4s3+Q3mn+oxd7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VX23Hm/A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEA606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFEA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VX23Hm/A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsRG1973264
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=; b=VX23Hm/AGO4aelxK
	IJMOWvVlw1Edx41mxYk780SdWu+DMYYv66O7Eho0dIwCf8Cu4ek0NcLgalu0j2yg
	COYOL2RlvVR3SZJyniUqBgg2H/G2TYfZzQBHy1w1nSqKf0yc3S3RZAXYZF3cXyTy
	GOJNIAQpIgqOtL0B3PF6ED+/fBnFVedu9/4IbAgvVfV55ZF5si5IZw+ohWkf9cDh
	HOordz+58Q7EApi0Cjs/xv/UI+DgRwgZ43gdld+Idk7a0PEB5R/deATPMe0GGfUH
	F0Sdl4ChByRs/1M7XKJKOCc4m/th9xMkXb8+qjQDNShPLDRr/04bHDm/FyDTfsMw
	Sgr1Ng==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gj4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8a88d53c7a6so84921847b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104533; x=1793709333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=L3wWuJ1Uhnj6x2pKj4yaDgMSxS1pl0b399jLb1/t5PUnOlSqMI1NTHn5GBedAfnVUF
         FKVD00MWhB+r9DyTB2H2HdJzfVPl7SqB5jNHRJo5ji0y6WgYkFh/Y2eA5RWgQKGLCYqY
         nvnIzsXvdML/5GK/llioB8BPdKFKF7I9yvMx7DkYHB+WC2jo/VaSzXFm0QwrjpWg968Z
         7uHFkHvw+e0nSQk5HgzsMVPx54MRbfEJKOODjK8m4ZL+aTDgYsF4E4JiRpW63W87hjgI
         b1O68LNl/wkWIC9+qwtgsJG/6MaOlEXPpe4R17bkuUn3H8FcD8YgOOzhL0v3AnWCd11E
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104533; x=1793709333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=SOiIVUhDJc1wpSYAC+1vKA3sCFuHEAmorE7O4Z6z4LW6n5VYt/TKnMiHlW5f8fFbhb
         h9v0UtSAwQZZkbLPtwCous123gTrQAv9RVotRG0hG4PK8y6W+OftfkHyhPsAR8IQRtu9
         IToPHtq8sMfLTgD1No/ODSjOwHD2L253c15oVJ4Gyn0GD5KTsOQ+wrbF0ZAA80dmcbTD
         du+tLUA4FPRAqzBe/3pucmbavfMp5Y1iO/D8v+9TTzqwJS7MqKwUx9zE4a3eqUonjUyq
         AZehspLd5/D980p8qBaSxVHvYgwP7t7rFZCN45Q3TrPorjaPCJoU395Rmuxf3v9LWx6e
         TB6A==
X-Gm-Message-State: AFq9FYKz/LDo3Jpm5jyc+mLAx8H+23dauJAiL9hSC27FCswu8adiOtMH
	EeKqANN1jIv0QwJDIecqffOFsV5CNgoIzlwQ4gv7cBq7iG9dKipxfVlt+MoJ3U/1dY91WCx8qXI
	bVNWiRpAtbjyKrwgt01w0m5j0YthE3SBVdDQc5GaDGuc4xb3URNxRu5cU44qaRIcTDa6bZrDKmy
	4=
X-Gm-Gg: AYBFou1DH25GgMLhF1c6pPP6/0BSjRdY/0L5xd8NRrElN9HiFsBTbVPwWY57x2g6g7s
	7JD2eOFP0tev1MIIYaHJGrEISwynWUT8Y9nGTHKdLPUJcO2e+kQzW3bwTf2HSj52kmCQymB7lzH
	XxUHM0rWv4h5QapLLAX8t3kuJYow14qnrgDmT9dkkYkiWlPrPpJPviUkQD07vj2kjJXl0gZD6WZ
	rDRaBnmS5er1Ggnq0Pevk/uNzGEG78h2t6n5qHFzhsOJijgIL6We7z7N3QEGvxjINcu9hekCiEj
	RAyQAHHj9Exv97TlQmzGHiGTG7vVY8XFO9x5w6Q5f/ub27udLoeCmSQlUG+1THFbTWXFKGbnGIo
	dsPMKUOVoPPaibeqMwA==
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735317b3.28.1793104533296;
        Tue, 27 Oct 2026 05:35:33 -0700 (PDT)
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735187b3.28.1793104532917;
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:20 +0530
Subject: [PATCH v5 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
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
Message-Id: <20261027-regulator-off-on-delay-v5-3-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=2793;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=SkU7A3R3m4sw8tWJhnTvVEYAWww3+TtNojEuitZAp4s=;
 b=qJmtjaVNa8jv2KFepU0XpawCcRysOXv2cRSh64uRpTXnmJ+BmwrOq64bK4KncXlYiAxeP5i6Q
 QK9IQSOkMxwARHafhkxG/xk1uJgr3ZNPIolDb9/5OSQykY3W2WbciTQ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae09a96 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fIv7m2FGvZx8uhHzWWEA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: _e4f2UjcRhVbdQfEC9tFSoMqM2t5nVRh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfXwZuQbsGgMJKq
 xjsog2e1GVIkzNH5FwIjwXzCChQWA4w5r7xfKgGpWrCGIel62qe/4QwO3ygbsSXmoQ35SQNy7rE
 2CC39RkWRNBjqqXCvzeX/A0Pnn2Qpts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX/XM0i+dBn3FU
 KtU0AEDulU3JMhdR9qeFjZwK7MP/7IxLB0JJeiAEuGRsHni5+ckcXcLebdJrLg2VOk+stfiZ3KP
 oqAlU8kT+RGEAYu84SrtNRgMN28acdlQTFai6c5uXCAl3RGciFaWtQ87D2VXby8j3MBChML386D
 +QwsspaqYhNCC/kosfXkAyDQrJeAthsDbxHl//4M3dwP89FPmxB37HIFueXb1FTiFm4MvdqH4Nn
 zObrc9xCEfxYLlWiExktWktiahEUMOkDrg077aiJ++LvwW7eEqM4B3eLyYBa37b6t/yoNggL46d
 eOf3Oy0/OQ//1x9T5fAfdB8NwXwTIPJ8OyHFmU6glo20RIuUfsFnDOPXlZ52an1Tv/anfE6rqNv
 PWd6m1xnhPb6NsqoEv4B6idXSRiJgqmWr1fnbMH/H0v8EMhTJ717stq5oXwWltrlywEZ57yWlH1
 iV5riIKsEt/326z2i2w==
X-Proofpoint-GUID: _e4f2UjcRhVbdQfEC9tFSoMqM2t5nVRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

Add 'qcom,regulator-off-debounce-delay-us' to describe the time to wait
for an enable vote after a disable vote, before actually sending the
disable request to RPMh.

Some consumers toggle a regulator off and back on in quick succession
as part of their normal operation, a behavior this driver has no
control over. The appropriate debounce window to absorb this varies by
which consumer(s) are wired to a given rail and how they use it, so it
is exposed as a per-regulator property rather than a fixed value.

It is placed in the qcom,rpmh-regulator binding and vendor-prefixed
because the underlying deferred-disable mechanism is specific to this
driver's RPMh command handling.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..a028f1a9c194 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -135,6 +135,15 @@ properties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: BOB regulator node.
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
@@ -144,6 +153,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 

-- 
2.43.0

