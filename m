Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5136B91A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971626; cv=none; b=GQ3HqivBxe8Mkd925X13Ghhl2p5Lc/yZ2IyCQmXiokyCkgXphc4pAgh/HMGL+zM10hkClJh6yhBN4bbNbBsQoG8NuRqMxBwVKlX0q9iL7bi6IM64hs9RozGac9xtjQ0kEYD7yYdKPKyF0cNksAkgA4bQnD3+oy/xzfGrhEEEyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971626; c=relaxed/simple;
	bh=oh5Pm1MGo5brzkk9JyE/oefAJPHOCcWpo9TZGmNPa9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3fCfe2u7AvqYTtqCIrcdXUa2lQKJn5CX3O98Xw93/KAppG0lda8Vk7AzGj4ezpY+0NST0KvoL8fhf3mvHKidyP/bTZRE3LLAwNaSd+Bfrqzf1uLmBElgzgWmmX8xX6l7ZXMtFfWWr/YQTptWr2Y0uqvkt7MneieVwqyRS9jACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eqql0gGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCuzmHgu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eqql0gGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCuzmHgu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6ac485241
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=; b=Eqql0gGiuHrDIuza
	Q80QusDE7BZgEDAmCQeP6DM6Gpt6eSPQg3s3lVLwKaaFt0cGNGI9uFmKxyxdkyIe
	E/Qefu/p+ZSDDxibWcN3Whhcfub++DeR/RWRStUhqnx1aMk/n9cayjnnzbKc0QkG
	esv4dsm741YIH4RjG4Fx4dThTTlLRXXKCSAKqk2pyuHDT1BJsYTXC04LqNigQ2TD
	hycwNB3rLqbovKXwX50gxp4OJB5xn0mteCRYa1Uk+Q5MtzC/TEa3CJyO71ksTH8M
	j63q2wfOy0Ppokx9lu6zQrHPPvmCU5tl6AT2W4lthLRw+8H9vvRk790cQc/zUOKi
	/GKMjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j96s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:20:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc7337e2a7so33994565ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971622; x=1790576422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=;
        b=cCuzmHguSVC6RA93t6GmlJ1ghQYTWeZmA9Xxled/1J5SOuGBPAs5FJPCFlo0ATzIEn
         Wnzkyxilc2eU3R+StYLv3pGUMZxC900K3hDKPwoBFIY0znOcfFYdxJutr8fre45ZctjM
         siXB5HnqkoJFcxacWXk9jtPY6+6YUUquoin64PBH0/ArMaqbNyM2HKtVcroJaw4UQRFD
         HBbXu9M0/lHnyec7d0I3COdmTzNybu/JW+PqX+nq+GkrQ+5bh5jeOET36JjqfS7HDlnU
         6b/fMhEh8qBcmAMlya+843/CyxW0GgMnxRPspgC8m5U3IyZZ7voW5VPsAtPZoW3ABEpt
         aL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971622; x=1790576422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uey2gqkHDQDDHIIK+N7Py82i/jmkDPiVZc6EZZrXCeQ=;
        b=RWYMVWE1CuYTwfbw+bfcuOb2M2VsVKPIx/w+Hz0r/W/QmQDOQvBD7IloTJm7Tzz0WR
         6fOqHz815U1v8No/C7tX+9I+iCfb7Pv/VMVUlJUli8gN59H4eU9+BXoXa1Gxfxw5C0SR
         lfNaIv4WaVUgmhM9U2W1JXWLj5D2v1vsIE4kCzfgPSTgRKx2YlNtag01myKu1pKqEglA
         ZmIAEyHW5u3JcMXyGMX9drlh8SJ/a05CgsWx9JfIuUcVFtU4kFbALcdu3ldud3y/OvTC
         6ZEkY6byDUiOdXQFz3BkMmdGjWrSo/56Tq0EcfXppC5hxb9KxXnXQllAj5tEkv0pmmm2
         KsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyfOHd7J+25m6SMAL7TC+13/hJJULmUH+AcvaOKUWBHrKcs6q8vOadNwtKk5qhO46/BBwb9ye5kAtoe7s=@vger.kernel.org
X-Gm-Message-State: AFuF++muOUnSjnSpYrTS/gE+EbJEdvTRYrZ5wNb8Y5VFe+YDy5y32XY8
	kbWKVDlNQi5EJrNx6q8Aek9eOXPhJOKBVwscs1XgTPH7T30hoI0Cq2fDcdXek5kshnUFPKv480j
	uhSQJypbWtaqIhMDUSU7MRtmQ5iD665Enu04N18LwJ3TTUT5L69YXHG+YACnBmYtsHB0=
X-Gm-Gg: AYBFou1ODJs9/DNvtgkoYzSLiWGX8UPnoytxMyAPDSsDVCfFglL60h4Dtoc7dFJdKAe
	SBUM3y5BAxpX7Er4XODo9FkX0cAErNmY2pgKuPYd7vysscW41LwpLQP/zs4ZH+sZJQq/BFNHkvr
	WOJbytkJULkF7Q/VaQjQB973WTn2d7xYIjQiGOAyyj9HTnzawwNCcDKQ9kKvyt1BGq9+tm0XrZD
	mkcoXgDW/JOI+ieW8kC13Tr49xNG1Hj8o4RE5NgbioNqrIuQ3NBNDPD14OMG6TgGI8eWnuVXJjI
	iIOOAMc4On+vS8wjbO5ZYUOqw06vk6OdlCm7Aeg/mX3WK4Bt1Lk+m/l4wgEeUR3HNcIDxtre3vH
	Rnj4rIMo7AaufZb2/cnSpXjDZwsun7QqcHqDJL5ZAhqdJjOMo1vU46QirX7CY1Rt0yhiVUwmL4B
	vsyo7xg1leMdMifrGohJY8wjsWBpbX6kPQdg==
X-Received: by 2002:a17:903:32c5:b0:2dd:c100:80b8 with SMTP id d9443c01a7336-2ddc1008163mr79089415ad.51.1789971622227;
        Sun, 20 Sep 2026 23:20:22 -0700 (PDT)
X-Received: by 2002:a17:903:32c5:b0:2dd:c100:80b8 with SMTP id d9443c01a7336-2ddc1008163mr79089125ad.51.1789971621808;
        Sun, 20 Sep 2026 23:20:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:38 +0530
Subject: [PATCH 05/11] dt-bindings: clock: qcom: ipq5332-gcc: Describe
 clock inputs per compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-5-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0cca7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GdSppTGlZM03nT4b0GsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX2ro+70uLwqBJ
 mpkVzjUc/85QNwIyeMfroAk8fEeLjGOHGDPRd4YGFR5QIlc98eYVSKfEc8yIxAE7tfF/E4YmLXw
 uK5f2Mhn7+LezwcYC6V9dZkwgEqlAuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX+W1vPSH+ytae
 kYhjegQR/XuisOdLoCmwHJ0JIebaPiVPZb8G9MqxLjQ/VF4vHe6idtZAn/2tVFi26I/9pX3H0vy
 NaVX9OwMOXTt37jXt0u+39Upcm8gmosgMtaPrGxOa1SIFnwcMqTF62gRg/DaItoqBFDt8LrH9e/
 Qcdb1/s1Krw6jI/1XBCcHh2G7S30AVpQMhfJlfe15xWfnQt1K/J4hs2bxfoXbYOaHlXbLjWQWtW
 yCqFChFXkR4uW+p5eMyPAuEc5hsfmIJKDU/aJY37DwzfY2GizN2cjRHR+ew7sN8WYfV7YGFlBQG
 2R5QXl++buQZfI1RP69EECFIMrQBXUeTESNYzrq//z32s2JReVL4pBCAQGqhkwXMyZm+RXaSEzg
 8CRT98/cUG9mMjYEM7P9vxvVFhO3Kk9ks2aFJB3WCsYz6n01L+Yjm+c6sqarq9c271jXeJAmK5W
 V14klZUlNdIxQbWl/jA==
X-Proofpoint-ORIG-GUID: DrfjVdgVwtme3-EaC9OBGLvZKkO1i90i
X-Proofpoint-GUID: DrfjVdgVwtme3-EaC9OBGLvZKkO1i90i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

The IPQ5332 and IPQ5424 GCC blocks use different clock input orderings.
Document the clock inputs in compatible-specific schema constraints instead
of using a common clock description.

Also add the 375 MHz PPE clock generated by the CMN PLL to the IPQ5424
clock input list.

This keeps the binding aligned with the clock ordering used by the
existing DTS and GCC driver implementations.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
index 1230183fc0a9..fb39dffca988 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
@@ -25,14 +25,7 @@ properties:
 
   clocks:
     minItems: 5
-    items:
-      - description: Board XO clock source
-      - description: Sleep clock source
-      - description: PCIE 2lane PHY pipe clock source
-      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
-      - description: USB PCIE wrapper pipe clock source
-      - description: PCIE 2-lane PHY2 pipe clock source
-      - description: PCIE 2-lane PHY3 pipe clock source
+    maxItems: 8
 
   '#power-domain-cells': false
   '#interconnect-cells':
@@ -52,7 +45,12 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 5
+          items:
+            - description: Board XO clock source
+            - description: Sleep clock source
+            - description: PCIE 2lane PHY pipe clock source
+            - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+            - description: USB PCIE wrapper pipe clock source
 
   - if:
       properties:
@@ -63,7 +61,15 @@ allOf:
       properties:
         clocks:
           minItems: 7
-          maxItems: 7
+          items:
+            - description: Board XO clock source
+            - description: Sleep clock source
+            - description: PCIE 2lane PHY pipe clock source
+            - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
+            - description: PCIE 2-lane PHY2 pipe clock source
+            - description: PCIE 2-lane PHY3 pipe clock source
+            - description: USB PCIE wrapper pipe clock source
+            - description: 375 MHz PPE clock generated from the CMN PLL
 
 unevaluatedProperties: false
 

-- 
2.34.1

