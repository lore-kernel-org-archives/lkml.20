Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5647D286D60
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993434; cv=none; b=Z0pi93ZkHOX8tMeXla0xL0JR4p9VaTMCVf6HNjo+85CLblyv86S6/SN+vufaQgG/lrZ+PU3Y5DVmVhRy5WPFG91Pz3VPMVRaY2Ojj8dTHEpgPxr1UtSEnTdtTYmSyGmmezp16EcVnWwfcn3ix1UeXnaITH+2nxkjXyWriG/+Xiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993434; c=relaxed/simple;
	bh=0cSHgniriXpKHw02i0e3M7P7eWMIpRf6UznVWutKdYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5DsadLV6VXgkczesqiggHTwanqhkj1YVmGhznzmv0DWQmZXs0F8RRjrUpQ6CIoCHrTj14kazdcnDhN3CibfVUiFkb28CeWuQmKo1VncpDhnFN3BfuXwxBNU72dqCRaFVBqBLHurLGnqAQelmVQYK/+U+pYD+RguleNZ1Dq8xxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+GHvyle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJn4an9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+GHvyle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJn4an9L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbFlO301195
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=; b=h+GHvylefpaRPeNI
	tUbVlkHIluFEntsPME9GueVa9eDP6/yPdD+h1ERFnjxfsmdIYc8oBCoGt4PF9507
	rfBEIDe2u85ZoIFXtagcAg/Szet40/xjmRYSwfOnhPqEYBvpNb6pRQ1+x5ZuSuq5
	Eer/CWIwUFG0btGudZx6G4HJe9et5H8T6O/FPKgp7EYU4QjL10a1J3gb8Q5GT6WL
	wbBdkMZNkQ7Os4yGw4Syu1DBA1g+CW40J+6ka4UhZx8UxHD44qNiroFJ5b7lOd+4
	Sbvmcp3ONbQM6mYJ2FjLE/622tgVWEQCqYM5tj2sgZ2RZ6ln8lcmRQt2kkVWssbt
	m0+U/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622cbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:57:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e954d87b48so2669745ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993426; x=1792598226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=CJn4an9L99/i1aSZhsFcSZhZPNe7H7fet+JsUxZIlTffh3BaPjBfQ3bwIwVy/651pq
         y+ZvCGjkMgi6kVcuRtxbJdBzihCrKhKCqUdzSgJcyetKroOQLaD+7dxeekFtuaQq3SoX
         vUrymbVAnqjn5beDgcMRrK+aLTUEk3fJydtm6y/3TeCRnusdYiOYIkjuWz5VcHFEDGKZ
         D7p4iyf85RCyha+6OYNc1EbvobXTmXszVJyVDNVuZfeVYwTfQUSOd+qNaXbKQ9Hz0lcB
         IhC2t568zYkHcJ2UE+HYsipXvxiWe860rl3MetozN910p5O+gSGMMdJBTAJYg7DjyUpY
         jpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993426; x=1792598226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=x0o7FTBmGxfppk+LuUzuPJTejipmYudVadR1MF8ztUpo5hjBEn9czb8zJrA/CtFmBC
         kATZXyh9PwHjhhyxK4RiN1celxoYNJwgoASu/FRrheENLOdK37gqJWIj8hooIW7WCmcO
         EDgP3jAFM3eEfVaZ8zjpzHg3RRrxH6UStTJ2vk87eF+ENpIBpTujLdpOM9JOtYhh3elv
         ah9dmCSS7MNLzHfohJ5eltiL7KG55hbgayfnVwOJP7xIEayaJ/i90KTezRxd8pCMaTgP
         nebEBidu8hB2BHYW/9eI13pyHWV3MWBpPTi328FSLCDXIYbEqTKEnMkwH4VIKKlhQQSm
         GX8w==
X-Forwarded-Encrypted: i=1; AKwUvBzUWvPV+q19O3V7QW6aKxS41A0Rl3NnEf6WBQxUo0kRYadQL+RarhzJpa+extHcgGW73llWzLL7MZp99I4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn90JdYcxcdRcNuKSJVtThddD+nU6uuzdkvn2qeMht+28Lkl+J
	p5IFXm9dgaGMEFWmvpsLbS4aKJuXAFS4fxJgyTvM4wDu3wPgovxj7vnkjy97Fx2CCfidgdYisdF
	iyFpTn5jMnugsFHQPuY1bEIts/ZSgLR0OfD9DIV/TUd3YmQnu3AN2l5V6qlrDdMKyqKQ=
X-Gm-Gg: AYBFou21MT2wEoePfIG3A77cGEmCjAIPWnUnmElJppex+g4JddpZDkaAFfG+7QYu2cf
	mumOi7ooXs3H5C1kuxNDxt6OSfmYrCHBAf/y/y8VHnabGRW6ZRORhhggl7y6mxFPMNmHOsUtrP6
	LPx4SE5ypFn30euPQvnu2Ejc1InsiIGrhQEISzRa3BPJunrPro6FRl4FuPZbwL7g0Oa050mxeH9
	2z6L1pS+sQlj1z5YqfPF3bqwUWtm/eWwNH732TnKdyL5k7+BD2euETyfAfUlnqbdTm2Cp2W0RRb
	KquvwrxU2YeKjJWuhIY2VhEiD0Mk1/U/OtBI4RSoMSChwWkBFjA0Rk8Im0qUTecfn+JPF7dF7RV
	xB6gtge7r+LNq8RM4s18+NuuXvrvM1AIBDA==
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136043885ad.19.1791993426056;
        Wed, 14 Oct 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136033535ad.19.1791993388546;
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:16 +0530
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: AtmR38YwB-4CslJ9QOeImNRPp8asfDk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXxNA12xSoODIw
 86w7ejBIU+RgGu3FwUlP8dI1ujvAJ7d62ilsERPjrkWwvqi04XPqqcMjoGRA8/4z93OBzoWKtz+
 RnZeUX80Wt58r60WC9bguV7R0ciLwTRi7CgYJ+fDcVaADGm06jSJZbVNQamecVp89Wz7CwfkXOk
 dlBFxMmIykYgORekVvBWGfnWrl/bDIf01zT8wd0ogWW4MIVyTIffQ9/AhQIARs0PaTGCMBGz/Iu
 +V6s3Fos/h9cEIFPs5b4rlRbsYZRD8p9ZRtKEgv/H835ekKaf2T+QLhLp3AD2UcqjQwDicaIQ/l
 1hRBS+h+y7GE2s67ulL3h1QSGy8hZyymcaMxWC4FosZ3mhQhlLQm08CRkAYmOtXFNrDH1OdzQte
 5L/bmFQFj46bDQSdZQ3sU6nC7x7sTLQaKTyGFPpqSgXvRl+zI3tJ4Qa82Xb2XCMs+WY7tU0Ip6J
 He6oK+L9zKvkGjK/kAA==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfa658 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=whjmla-fUz_WVyb-YBQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX2mEi+LqJrAyJ
 MO3dHi5CnpMAdeZ+Gw8FQtLKy7O9ArhvTq1+pKY8kR7qrOxzoLnxBiEiVUxt9MYOKJJZDtTFBb5
 zUsvVVWcINQ5ypq5VeWaXCEHD4hyKSc=
X-Proofpoint-GUID: AtmR38YwB-4CslJ9QOeImNRPp8asfDk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
on a dedicated interrupt line separate from the existing TRP/DRP cache
ECC interrupt.

Allow an optional second interrupt in the LLCC binding, add
interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
are present when compatible is qcom,shikra-llcc.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3546cf7c2519 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -64,7 +64,17 @@ properties:
     maxItems: 18
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
+      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
+          on platforms with an LCP/SRP block such as QCM2390
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: llcc-ecc
+      - const: llcc-lcp-ecc
 
   memory-region:
     maxItems: 1
@@ -234,6 +244,20 @@ allOf:
             - const: llcc1_base
             - const: llcc_broadcast_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-llcc
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
+
   - if:
       properties:
         compatible:

-- 
2.34.1

