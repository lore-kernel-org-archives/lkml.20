Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910EA4B44B9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733138; cv=none; b=kYlhwSG20r6lfqmdt0auLZBzBtL4swf+oeY780tH+EyqDv39u+PaGFZnM2DIxVNX2xFmNKsnHbnSVC6UADSH/EE+rdKjzoZIxzvk6NgK0Jvl7/j7/ZbTPFojysZs0yYIITaTvRvAtiugoRt0HbESE3f+eJ3oJIs9ER0bKNfLupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733138; c=relaxed/simple;
	bh=rbUOszSa6pKBjBFNE8KJKzGBB6kocCM3MHioANGUG3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAsDxatKXr9Ebg2WS0fTGcPLKu5nqVuqBE35Hqt0e3jZdZxc38hVRFjRFTqbSmJVJpD3OH4QhHyrlR3b4xV2g2WPwJp89eC+qtdlERL4wgO4n/E9WZDlry4OySjrXu6FzpnHGwry13s9GnxSkJE+4Vx0uCAh9JudI97sFh9n1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPcEpqq6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0lcTRCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPcEpqq6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0lcTRCQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eEj4522575
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cI6VxWcYdbS
	4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=; b=XPcEpqq6twBEgiKWUqnDAa9d/KL
	E6JaXi6/w6x+P65QAhC3by8n0Faf114Eemv0MxQFZrdAVJvrmib7e0LSLNQBeXWz
	pe+KH/Eb0f9KIY3Hj8JZ5Wx4+/GnGhwWLnPYBpiQau1yTEAwYoCyNk1kt5gnhCD2
	a1rf7gwPPGG1aJjwkDNWJy6rbY2YN2hwUu1yA1wW4myx4Uw2HN9iKS/ZJqP5IkH9
	JPiSMERaVoajvkpPfucCF1HKKpwNj3dO7Yhl/eaEBzx/4lBzZYi7/JE4qaIL3gYd
	TYy91Ow84IHDyrlrR/hMCR/5fLPEO3rFHK1k0xgkRoshJDYBSQyPJQlxGiw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebt63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9a55c0cbdso171058e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789733134; x=1790337934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=S0lcTRCQGbtGaVps1FDobtoo2pgydII8BB1W+9r0bCLXqB0RZwaCT2zt/E304HPDIM
         87LkGRBAvay31DS0B9/jk8NfzfbCAtj1qk5EiAkwkkZAiYg3n6MIJMdHBU/vuj2efWoP
         Rat0wm7z8S1I5JyaRcLAPJpgDpbaY4EZLE6yiUX9+GDKjf+2PRgFeihY97oc9ieqv3nP
         dIojWLMMrleNC85D1zI+lKMX+C7HKsH3J7Z8TGj+vrKSzooxXN0XWunrX/xALtvytf4J
         +VJOKkW/zLM/XmWTKqz77TLVV5GmvVtvscg6ipnSH39bI0mMhGe+vn1S3yBCa9i/3gd8
         hyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789733134; x=1790337934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI6VxWcYdbS4q6nuRTLojc583CcZ2sDeX8I9vTB+9wQ=;
        b=hGfDgPj/JBvEiF9X25Xnipnmi2WhkHFFURlIiMZ33Qmw+6Vdjk8enkP6qy6U6WBSAT
         bEFRe9AGBCx4M0wXA0rl/4sUtNS30b8l9Zi5tOGFZ0lj/RJ/YPl3j+tdpC9RYGYsAl6x
         CpLGnk5QT+gvJGNCADHBvbkWNuBSQDAZrDQ6oBwfqovsjHj4ebHJ7+1Lb4txfNHjVmww
         DBCBASTwzk9X/65w648lJQLWZbdoh8OTcf6R8tqsPDH6C43i5WZ4Ox21vtYR+MJYPfeT
         lu53yowbhzd/Tbq9j6aWnVQwRw0Zb+rBo4yqdJ/EQ7/0d90IvTHjbKtvuUR8m5zb49Z/
         9GEg==
X-Forwarded-Encrypted: i=1; AKwUvBwS450ajW7l4h+My2DL65dITjmL+CYMp7Mm1XtTySWSiHMk8/lWv2tnFY7GOWBoplJR7Z06rtt+ToH/MZo=@vger.kernel.org
X-Gm-Message-State: AFuF++lZB0XLRLM18UGbakL0ohxJitaKLxcXeQpgUBXidG2AyzGCPWo1
	AxhjZsMeGmAz+/BBgwmSS5Kb5CRPk91imh7RwLBk/vmbzhDw+7gWuQD4VaiH1IYAgJYI1KK6Ao/
	1m9oOCyUtV7dpB3fZg+bw3CKGAhLsNjsPl/gjOhl1em9XhI+LK1sHgkl/fHF/BNjW9j8=
X-Gm-Gg: AYBFou36iaYqtW3mgK8GMCSxKSr/MOd/PbAD/mBzR80OuevPX4FbTJyBSbjz5sDjuCS
	7U7piQFvz/Cg6j64cV7XwjQ4lhfS6LD1fdl7LdECVSy0jmZc2jT3wbNa7Ux3YlRVUEgjL8jfMoC
	l4dPJpsD1DA8mORaJDmFhioW2WACJJI6Un4yMwFUWwlJOli71h7UCH8Qn2+HVKOACkutWcI3sLn
	k8FDemhcm0c3Q5MEde1h+/3oVy2oxLjLqRjFIR0ySaL3Q+VfSJTFM8kxbeGc1GmMlm7hU7wNIO5
	1V/Pj+HpTYKDthwxopW9ZeHnhHuiDVQaUNmW12WieO1ZBbpCjiKnhX/4LCBB5jQse5OamSzXSWx
	urIuF8czeQjKUhA==
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888353e0c.14.1789733134534;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1822:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5c9b59cc79bmr888323e0c.14.1789733134156;
        Fri, 18 Sep 2026 05:05:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3ae49sm3917584f8f.10.2026.09.18.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:05:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Fri, 18 Sep 2026 13:05:13 +0100
Message-ID: <20260918120515.595782-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kv7GoHwKsR0CcOB2UKWC4ZPF1eu7AX5G
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad290f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Kv7GoHwKsR0CcOB2UKWC4ZPF1eu7AX5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX5oRhZQ8xJDVc
 GN0SI1RMADzs8SBsqv1X+76U5epP5mkM78O0yOL3gJWedm5sSYstf5Pu9JiFk38nWYKUI/jb9Ib
 KcWQJ+wLqpnZkd1BnZT1JTl5ifHIqACEKRSRceQHynH4W9V0egBhDmvyWLLZuGdvdp8sELxfLX9
 jHZQgQD3DRvuwuQNY5k3w13wCLfMPwCa4VgfsGVtTHUyi2br5BXplp6c8PmAfMX6PBVEy3PkUro
 D+Xn6rHbAQWijmCI0AFR7zuFskUKKuITV1KaTe5eLkgSydgnR/A0tP5EYowGn84ytAjM7dNAqFD
 qz84QBiFw072aitot5GsX8ZUaLz221qTWOHE8tDEsGhafU4Vm55lFgpn1aUJf/X90WvLQPbD5oX
 wL40meBM9LDQ2kOZgcrfisF6R7gXo94u5EKsi5Ruv0LL7UL7tEXQqNqSUbYgQb/7lnu9mS+GAZh
 eC8Ykx3OtxJ3rcrnKTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3MCBTYWx0ZWRfX+uGWUA0cAFvt
 mQ3efRBSSfHcT+kNf5Z4CSP/EeZIFUb6wCtAJTWyDHVKrCte98f8mQ8CR5sKrLY1ttibm2bYBeO
 6a97UZLmNASP/rF/yr29prYpab8YMIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180170

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cf9d940f7371..92326e0e7feb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -188,6 +188,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

