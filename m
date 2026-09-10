Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71949E143
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082224; cv=none; b=gUOxa7Gz7Cj8ohNL9x28hGNqdgjFSFcV1nNA2C32MdEfp6RsCR8nInakO490agrefC1AnYj2tVcP2gJxaJ+d8sR52H4UIoO2vR7VGMwDHq7zyvlQlqu+8omilLclxQEVaOCbfrfOl8oY9lMaLQtVuNh11JMydQFTSwLinoux+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082224; c=relaxed/simple;
	bh=BTk3PCGBAvoAeGTUHw2QCk8i7VYx7TMYwqdzeJxrQ8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qAOA8yLvPRiZ3wV1hl7UcjkPuaCKV3iZ4hmsNDULnBrrzAl4FAIvpXQoTlF2O7jwtmC0pOhstm0YC/hczdmc/TMaUJcyTxEhdBtDlrPQi/X7OuvtpT9fRdUdb0Vit+w2xYTxrVNCvtVOGDOYxlj9/Wfme/6Sywv8ku/yUpV+c2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Uzbbyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FERxaEXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Uzbbyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FERxaEXD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALbHNX988981
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+MjNgsDhMva
	2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=; b=m5UzbbyblkwHvez0OuYIrL7a6Sc
	AujQ9kgGv3dDD6uGMhZxBp31w0KorBoWUfuUN7Qr7u9g5ZyIjer45r7CHMy9LCXD
	vm2q2hj6WReEPiIWLr18Aws0UgAmh6kIObev/fgK7NZuw3BrUyYBlGEcbmQRmOJh
	Fo2os7puZZZaAPCUrGh+LcWY/Gpmfatsb63IUKPW00zpaoHZ9sv1+PiqPwvbO51t
	1hEjxnkjqf4O95XkcQDb44udgGDDXAUWq74JBkMqls/JIaKRO70N2+AlEVIpAMdU
	Cl50+m53CbIfdF3FsX6VfM9wEvxq1QamOiTOHEbXxVT3Giri4vS+NwEJ59g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8ujuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:17:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so603420a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082222; x=1789687022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=FERxaEXDJmdKNnYXgAdyv0FKPsWd9Ih+Dykn5JIHTRXIaCK+wWN1Q7PdsO69m99q63
         voK7ZyioMYY82JbgawGKXoGLyOZiXpYBqm8XF+TcdS2ZkrYGfzL8RGrCCveDzvXSQqEP
         bebe5yzvB+hPfP3c4r+sbKWXLnktwGbTlq2MUn/9WZ2PJ4bErjOLPy18ohNYxVKrI4ze
         FNSKGt7hkwVqSZRnypbcn0AnMFQNsc4cone6Ok/YwwqGiDzeuJjcQCh4w8X0MxkGJgy0
         6fTaaDbwu/vi+5b7GVxNR1Q8IOOH12JFP0PXmpMagz8BdRvD7wYvpuDjAHFpSdkfj0rr
         LRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082222; x=1789687022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=aif6TtDiLkwFL66S9SxNSJznWNSs2eHWQKqr0CCkbbLA12LPEKBQgQ4+zdrl1oPGRG
         17+3aDegYJ7kZgHe9DCJkN9sYjDMFNm1zUBFAsyjrNFtNmbN/Sxz7pFG+roxk5mI6GeW
         jrZ0of9opP60Dry6O4S7A0oW8yrrxFWUNtSGgo+1DphxpNoLIkPNbMOKaDv2RSs/rGro
         buOxW3w0MeA05nbAVra7rFCGuRUE3dLU/892Syh+KlRpIw76/LzZzhsR2C6K7iyH3gc0
         lZp/JLN++9DCygqszdNcWN6RwDq/8z/U4vBhfYs/DMP4oTIYS6SLgkyxFWBy4rzdrEPP
         1fjg==
X-Forwarded-Encrypted: i=1; AKwUvBwL8Iq6c2LBgvXaDlyp3KPPHmleoHNsDiDAeoM4iJmQUphEVbyJvbCqYE05UTB4lQfmE8q0S9vClpylLI8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2AM5Yzi/iXiUt60eEdyZSLLkRjIAHfMxyOYQc49kmooc6gkcA
	o8+18I/sPMiFWKSaBJMiAyOndvWBNvd3+Gj2Kjo6cqSLV7PDldqTt2eGMNDy3uqjhdsNpgyEC8J
	HwPtsw/xzdFowxM5xB9780rzJr+6zSdoTFI9fXyf3T6n0l3vHI5usObEFzVLXu0zXThI=
X-Gm-Gg: AYBFou0b0xaHWkjESynbym13DQruA3x04Fja4r+o5g4EOLnzbVWw8YlvA/3g4KucIlf
	vB145K7YLemQIy7Up4QaMMvgNuPsdCFdxSPQK/ul8IIqvFNaXUWVxZg15hV0hzA7kpkZ7ai7W9Y
	Pec3jPs73MA9+UueUHataJt18+IzHs9n3BrgYUuIkvUHg2qmOZuO0RY7mpkpUZZCPp7fg/UczQB
	7jaKSi8858AIZmePi5+GjD4sRT5n3rFEG9T+XuRFo7SCs6+YJiMdP2s6zINye1JQ22gDZ8WZ8Au
	wIOiUlXVBmm/v9NPCtUMPrtKclFxKys77wnP0BkbPRYA/1TyykhNsF7CLLeiJqKztIU9VsiEyRv
	tH3zDoeFrZhG7qtyKoHFo1+dj+aQbxMhPZBp7
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593405a91.25.1789082221760;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593327a91.25.1789082221250;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: sound: qcom,lpass-va-macro: Add clock constraints for shikra
Date: Fri, 11 Sep 2026 04:46:35 +0530
Message-Id: <20260910231642.1794948-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pFEyOB8REgr6f61ozzSKyzHoQ9azsOTf
X-Proofpoint-ORIG-GUID: pFEyOB8REgr6f61ozzSKyzHoQ9azsOTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX7UsnjXArwYzB
 r7+FoiQVVz/fWkeUszn0tm2i1PRCEIns3+65pt7U+rAwhk7Nd7Ro0KTXN/Kljp47YxUX5UtA1uE
 swP/ieW7iAaSEb7rgOO0yDus+7LETkI591h9euCXbfTVYdkB+f1LzNWoJdpFYkSaDApO3xnD3gP
 Z4zcBnQKbX2gF5TNie5U9ZsPKLxf7+/4qv1KlbY62C1PI2BNbUMwdhigvrKadKhSb8CBeWthSZZ
 q1wfP/K8guwrD8lZz0JAhQYjx8bYdcoBN7KJQ2u1kT/0irtqX1YEtTKI/G2IXzDcZVK+/XLgr11
 0HMCGbs7+2EgSFBrrR50UXj+of7598a2P7FORUNwV9IVwOu7Nv8VBuqCMog5kcpt9W5hY5LG5cR
 eWa6D9eoGyC11RnqusuYuDC3xd7b8+duO2nCrBpfWRT6Y86X17xbgLOTFmb0U2XxEdL5fL2V0WU
 1dg5zDNv+UXq9lj6f9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX9Smh2PBL6j08
 KC0KtJ26920MA2bV419A7wYE9dQEYuuhwCI7m2Kf1NGgGTd0dUAj8oYzI403b+TxtYWWcImRv2u
 e4q3PRMtSAuPiztJdLYAcoAPE3UszIk=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa33a6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TQ3ku2UXUW4xEZd4FcAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100293

Add an if/then condition for qcom,shikra-lpass-va-macro specifying
exactly 2 clocks (mclk and npl) as required by the Shikra VA macro
hardware.

For the RX macro, add qcom,shikra-lpass-rx-macro to the sc7280 clock
section as Shikra uses the same 3-clock configuration (mclk, npl, fsgen)
in ADSP-bypass mode.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml       |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml       | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index d2f68b02566b..d0227c3114c4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -69,6 +69,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7280-lpass-rx-macro
+            - qcom,shikra-lpass-rx-macro
     then:
       properties:
         clock-names:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 23f00de82cd3..e47ccc46d3b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -169,6 +169,21 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

