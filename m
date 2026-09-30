Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C513D1709
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749924; cv=none; b=IiAobtM/VQRNz7h2qrcagHfRLiMqGYHmDP0gOZ/tjUOfDa2BvhvPor+p2fwQCj9cH9EfBmALLFjvoiveWOA2Ma/bqkHJvwyUefDolpli+9XbVg1sQWqTDYJb+z1cKlUFrleGpqT+VeKaPIJOeIjUgQ0zHFBkQBqP7xB+vs6adpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749924; c=relaxed/simple;
	bh=Hm7xkL/bJDYgV3jBTLLjQQp56rBzFkEvc8FRS2dyTOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k83FOfDL/sb1VFqs27d9PcpVChCvXy3LZK0sqANKT7tL7wPnhyn61FvprZNtxvs4dsKHSp6T+zQiOk2wb0njALgyOvJCt5Tb3SPp7jJixTdu3XNwuPVFS2XL7BHcL6BrVzAK2pNQxt09NRnQIcMn4ajvfMc569fnmbt5DI+ILsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0gZSMM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTcu1wnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0gZSMM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTcu1wnp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6GwB72899620
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=; b=a0gZSMM8tpzyjhnu
	A4vgWDC6OBjtyg+eF9B/NEsDBta4SNubJ6xvQJaAiP14OVx/VhbJwKKa4aajN3fC
	14VTpw4+sHQDZ74zJms9XyyVoZ4sUCeuURDP6hodhyZemS+Sd/y4P7PbbpRIq4kd
	4Knt+mGTZh7A5y7nBTdZt472mtkYfLlBSpj4AyJ8z3zDm/oZ/syBgpPYyzkjk+hC
	I9DE/XfbhTRJzQAgGokMTzlUdSBNP0XEEFKKahqNJNb67OYWgNPWhUWsD+0HAoNG
	WviTyRLPMI4kHmllfYyEKRxwpXRe2kGwDakeClXkGmKSr+o5TCj5kDEDL9GAk7Su
	RmdQ/g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1401s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so1795089eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749914; x=1791354714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=;
        b=bTcu1wnpU2id9Cq8kfco36O85G/VWGCpjD4dvTk6b48MbEjLF367/8to+5RGf0n24h
         kzCdDQuoZm+HT84m9Li4dAy/rInQBrSxdloDOIFg0kllYzyzQwfTUcPbV1+CMSna18G5
         BF7bR/WQwCcE5Z/OTl7nmJDOg+ft5q2mcEHae1TanBA/4wKpruqKh1cScbmf+jExHVOo
         Gs3wVSY7NhVVNOkiJIg1r4WM7CoReuxhOs+BlkPhtVupGknV/0H0YAxWYMn3svJ2v0O7
         qAAwUQ/3Z3YBVQ83TxOLqC2hS2B0Mwo9QT/Q7WFp+8teLeJTAr6R0l7Gb6PCryvG/QOD
         Kw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749914; x=1791354714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=;
        b=uqUl7Ua0K3vuDNuVu0QaDQU+BpnVt5REkSMcFpnYRPMjKRbG5AMlffHo+GsYctcphR
         RHp2ZavVmMXEDnHNqG7HE3gi6Furt2AoZpsmH2klPJmgH2eTK3A59l37b5db9Rp8296G
         kATCdxunf/9qdBEreO9t1RvRhcKoLD/5UYoRmkJnAWivhx7ccGB/afr9ajjcspAA4whz
         2u0DV//6Q/nPz8VaFD3mVILIs7CLDp9QtSIT5cCczs7lHd77pWHlcI4pg+vLRC4rjh7E
         FW6fcG71SGpWvXFo8QbCqeEayFMadoOxn0vI0/eorlrzEeyLmQxqDMo+/S0D+N6+NFtW
         REvw==
X-Forwarded-Encrypted: i=1; AKwUvBwqe6NLRjMEUG1t41gzQDdD7b34OH+l0NA+uMpYA7USWXkBby7Ypaqa56Qq3To9TM1W4u1gsPgfdMZdVV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf+26DKxmd+kVK3SyEO+uv5fSUKFES91r7ryeR2xiVpwxZ3LIM
	DvOX6q/z3yAQFsiH12YJgCYQihPFTv6oJDnm2y8V2Ua+aBMo852w8/Y629q93RiBzNeISjRNsTI
	kRKP6HWPO1c/vGhVLHbuznzcM3NrvO/sYYa6xv/L/4P9nVVbzmw2+bgZMvo/ftLSdwvk=
X-Gm-Gg: AYBFou1FwO2qxXvOlcoLNcWE/fYtJ1X9dwm7j3J7qAGKvBZSMXnfbFSoJYLLDaOYxST
	968oKJmeYth026Y/IOniwNQ3DhxXlgU4PYDYhCQDTqZc570LWreZhU6y7Q146XX4olhGt0RgR8U
	ZjaLbe3j/JsEKxYAnNoTgVLunoCHTutlxE/Zan+Wj1rS4JHbFBL0woMCQbM40zryFywwxaO2pJT
	smvxSW+R5lUE6hpaaP3DcaL8eSSBzfsHhAceqWw8Ur48VKwaMgAWBd//yBpvmSKLkpuGlER21hk
	yn7S1gfyydqSgdtforRiSnRd61WQlcYE+q0zoLSfXigtMLwdI/I45ijwhGD47mX/yFHZ8uEBHaf
	FQ42z2gFY8redXnst2WaIWebOodoscX19nlFoNAb+6N5sCAq93gU=
X-Received: by 2002:a05:7300:8410:b0:34b:7892:4961 with SMTP id 5a478bee46e88-34cdbfc9dd0mr707838eec.22.1790749914440;
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
X-Received: by 2002:a05:7300:8410:b0:34b:7892:4961 with SMTP id 5a478bee46e88-34cdbfc9dd0mr707806eec.22.1790749913775;
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:23 -0700
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-1-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=968;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ZxDtWZxMUbC/u2Kxd2ljeOeNmhGjZXxpI+plpjWeHhQ=;
 b=/60bFbtG3BGukmfih2Q7zjaqyEUjxg8hCuc6lbpR0YQzJlDiv99VVI7qpImwwRgPT8ayp9e1D
 4gKhsP01ZWIA/R+TZskMXSyKNznO0m5o6ja3vBh437XOuZtD3Ian9VH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX/meCFrug37j4
 C80PlB/O9AF0o4urXlLxtudYm5/au6RjMEIB/6+IB0kFF8ZkkDcVo63eAt3Pz5PiU/n9pkDIIPm
 rgDzD6XW30YARRiMg2zE0IVSmmLAiQk=
X-Proofpoint-GUID: bUi36NRo3LdWoV1KDGRKS6qj3YlhLtBW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX44b/G01H/H6j
 Bt5+uRLYFTxi4cwoKpIl18D62I7EzfJZEx9oLAzPkXicSNaVJsyC4HF4G1eoKLKGDjzcO4tcD9K
 f1fG4Sya/mJMJOSsOUcbbKFqONqAJ39uhOh3Hyi5QhmhRcY2ajOm6vFYOBymBr/GACPTkUvyqRA
 JYyaEugGVKfYWjmTA7vEKswhGXBMdmpRfm9A8q97NAda+voMbEGSLanQu5vne+J6SXWyzJNwH/H
 7sczs/NP+ShZyZcF6kxO/pVgAk0VSelkioiHEhIp9kuJdERwH4kyy+yahvPQnOHF17hyvuoZadS
 biG+ARWCsFe58AfRGKNVqSeEfDDRV/lXWLbnYAKfIpYjTcZnFRL/U+EzObukvt5pPpH2Q90vFck
 4JoNk5EaU82sBjPrcXAoLMSvRprfoEK2pB9cXuYvFAFQ0RZGnWqFoVmd4S6QvXBz8n/CgfL5L5I
 /fatS4BvUfW2jHLPlIg==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcacdb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=V7UrHcU1DTeTWre4HVwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: bUi36NRo3LdWoV1KDGRKS6qj3YlhLtBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..5d3518087923 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,11 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

