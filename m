Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8641047DD74
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198921; cv=none; b=Pfb0yrk1KNloOaiL9KoVj4u/4PPUwkmk7WoHgmNsRm4jWylkufBIRFhdksQdNZqIZhol2sE8f3/llXIHH/4eUcwr2tRsOwRZLeg0S7m9kUygIQPo2Op3vVNU45+XNQ6xVfwPVRGhw3zMhojOUAs/+97Z0HGkwLPJZHVsEES+bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198921; c=relaxed/simple;
	bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amcyZJhq0BJs42Bt6zBk2uMgIYqVt4U1RUhSsDUykJ9pRsJlznqwI8jHmAoixqyYUDucuDBF2pLrbPg0H1S5NrLA7dRTe8H6DLq0HTrT4zMirEc0l19aHNee19CEIwpg28+uhXYA7MG3xeBo4DT2GZtRpQ3+uFvk2TjXn1hvifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdccRYB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIOGFR/J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdccRYB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIOGFR/J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695Aoe75290684
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 11:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=; b=JdccRYB2iGQ/OVAC
	8Y4tUbN2eUXcTXeG5znEwFOkfdQg9YBKOO4/S9V5hI4a8jpT0+C5lX+3QsRC4zA3
	4XdoMNvhp3l92GqgMR16gcCqm5f9GktWe+QWiDzR5qd9mikqYgxBDfsZ2H+aF9VN
	Wc+jEYEOpllL+qYH5Gp/DzinjAcoAvixSTHnob3lF2XmynutDQ0hdXrypyKQr6Dw
	NkbAJ38jALFUERa8yf44T50W3NRPTZ0zdDPssUhdxa8xlD+/GJvC2Eog++IO9c28
	JAi5aFWGAzB4Zq/qHS6YELk1N1oVEN7AfggWZfng6wFC1dfoCp8IcGXn9r7S0wVb
	gEqvIg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvewf3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:15:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so1965316b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198918; x=1791803718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=VIOGFR/JckDLCGZ7xXP8+a2QFW2bWD4OtfXOJKYiTpqqTuvDZ3n3pXpPHv4yJ/9/zq
         oMuM3udraKUnYXrA7U3t4rY9c3kOdEejW634gbKxwY6yffMe/unSlU98Ruks4jFc/OKF
         jW3ZVie7hxU75QMeasKWGL7DLFbp/oUPIo7P1HMxpXDLHwk4hgFywg9XnUPvX3Q4h63w
         N1pbyu9vkmJ6YcIaF+Q9gjiEiJuYTDip1zZFaWFr1LF5vG7fivY4L8Gm1qc16zlp7tVp
         oHCn+qS8iYXZjFZuS33T9PRvqsKf4jURGd4TQpz9ds4R5RQrM08QBSyhFkapAu0yDL69
         7JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198918; x=1791803718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=j8T1oK9rhPMcUfBbDLnOwFI/1VjqXDnCVNks9ZvhVamJ23upSxjEKMD1YSh6ueFDQ2
         1zKUX19GxVggQNDkQPlezP9Bklv/CqlfycslvKPUl+Z179rEMpBZ41HJxSA0HWfd3fu3
         wol6S8CK6xhm25AWfh6aYJUYPD5Xg4QK9/c6Qe1yOWSizVzFouNRtYPEZ5VJZuj+fmFP
         52hOikYvdN21XD0AWHRkPEkngmflFuH6TKXu7Zbkwyvvh0VetyM2ZVOKa+aK9w+a7Ajj
         u8lUL+Xe9G0OaTJg7KwuYgIBhQeLKGhRJcszBFJglCw9mCtlUfXMro3q8sl8as+lB8g1
         X5tQ==
X-Forwarded-Encrypted: i=1; AKwUvByafpwKUIxakcxF4J62lj3moWr1iIiWFdxXQ7Obw0dY774rF34nDLgV3cof0VZaPuIwNmxb5E5xb8ZHrns=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ+WrN0m6I3XCUQUTD/Wn0Jewntb2yEY1gQt5mfZaLwQSEqImm
	OOuq311Cd3V1kA5fd0UOysq1+p6NhnFrlTM9bK7iOicht/AWjAO8833h3QOAY6BkYEWYXiEP1CE
	OwjFfe6FH9tFOZRHQrki4Dgs0xXlSfEnCVbuBhjJvDqIAvcxmC1RotHX9ZV1Z6xKI1w4=
X-Gm-Gg: AYBFou3xR4i7R9px9l2xSPzU+4vui4Jb4b5vlDIUgIJeM5fDsyM34hqgEnbpy2ceEt+
	9h1O4h982UpxL6Ky5fo5uO2jSxl/TpqOyAQFpoLrD2OnE4tvYSPMx+pU5YiCkIsqqNPXk8r4QzA
	FyNcbWGZCHzhZmv5aGchh4icACMjFBtoTVjjfToftHfjsNxNYo9VmFyV25MiXgzpP625As2npsr
	PI1EcQOFLnc+Z1hYUwkZ97nt51muFZgRCZw73RJfkDDgevGIIu93cbqDzMLNfRhIXWpgEJ28LpY
	r4/j1/bpj3UZ7vIe8f5Lq/NoUh1QquNpjfqkBAb0dVQLjjU1GT9w9GoXWYN3MpNVNa6q6sw2prF
	YSGUinAkdSGf5nA==
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592257b3a.53.1791198917824;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592229b3a.53.1791198917325;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
 b=8dMnpA2iR7nzgXHo8slXfvbXOSdq/qSaosPh8fJpx1LYoTmysgFV/AvhXaPlspOK8Aecn5ST1
 ARvZjTt9zjgBlyuL709/XpwMjT95ChVZNZDgE+IoRkr1JnNI5CI9WjO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: THVeUVmBo2VVa4e9pHJmRB1n3JFfN40y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfXyLe8bNEgY1RA
 DMbuXWHfzH4EwJQTFRLe3X6zdMS8GgvkxD0/sN8pYfk9p6FXF1uJ6D646WzLwjPle84skukD946
 y9Opetr/pv+eG0WzAntBlP6+DvsoiZ0=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac386c6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=asbD4md8-q6e6i43ReAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX4X8b3xPjQ9EW
 qqqZJBrXZie5basN7LnS0K6cbFZ6p4VxpUQKRO06x4FvXYzZ/X9UmY603YH4oHwJGD75s5y2eSI
 ZKice0i+jWBrDbd7ABlDrl0TmJNz5iGC1RTOrLHVvFiG4ZFTmIiRbaeGGSajzmRWFVCTLDzbzmT
 VTWMdj3CRG+b5d7CiCXsXnmiuaNTmwpUvwsrYkyrPJL+HgrX2bSWbV7GxvcUbI7GDEMJxWkw5tD
 MvwnxzkHPgioUJJc/+L+G1BS8yEEhiLHWkNH2RxgietiG9dDWa38UnHOD3oo4fT+0M+3deMJFYo
 X0XzTAopWe2IvlzLqCVzknGuo3fo/q6szrJsnkYsMPol8IQ6dTbsbtX/21Rv1kr09UvQ7IOtVZI
 UWkT7j8vvb+Fu4gh1wQninQOmhIR+laYyy3/Bomqb7VdSvsHOHaWzivLTjMHP02z7c56tamDGzy
 gjcg9BAxQ+Y0XJ7dUCQ==
X-Proofpoint-GUID: THVeUVmBo2VVa4e9pHJmRB1n3JFfN40y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

The Shikra LPAICP PAS requires three IOMMU entries. However,
qcom,shikra-pas.yaml inherits the `iommus` schema from
qcom,pas-common.yaml, which limits property to a single entry.

As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
with the inherited `maxItems: 1` constraint, and a valid LPAICP node
fails schema validation.

Remove the pas-common schema reference and specify IOMMU entry limit
for each Shikra PAS compatible: one entry for CDSP and MPSS, and
three entries for LPAICP.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..4196f61a8ba0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -32,6 +32,9 @@ properties:
     items:
       - const: xo
 
+  interconnects:
+    maxItems: 1
+
   memory-region:
     minItems: 1
     maxItems: 2
@@ -92,10 +95,14 @@ required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-
   - if:
       properties:
         compatible:
@@ -112,6 +119,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +143,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

