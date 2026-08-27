Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A3483BFF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848813; cv=none; b=JOXtA7AGudgpuKYW/Q7aJBquXsfACBW+1+DPgvuktQHn9vfo0JVnwRV1Q9hdCA5Q55QVbAsCWdvROpClaLteJCRpilz945DLNUfTatlgQu6DHXRr2mFyKK1+WCprOtn/0DGL4Uqlix8kmRtBCoq2wP6oAStBS0jPZb/hwCu2Wxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848813; c=relaxed/simple;
	bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDh/AR42Jb//xJU0vEZYiKl5+2eb59WM2fJKJoDfYnptlLH7ilH83uxSZUjKVF+LrUuW9MbYDxEjd8hbfCw5TSIOZQP5Xmzs1DK9wAYPjER60po8vlGYzEf+QY3edTU+CIUu1TRoUAOXrmtz9on3Gss6QuGKyGrDIRVCSGdrorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0YYt6f6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoZBTrwy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0YYt6f6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoZBTrwy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcQfB3360343
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=; b=E0YYt6f6HIevJsBd
	GX+u8SCGPuzsdlWqvB+D6oHOcH6IqkT4tR0SrbSPCCZUrzxSyz5FCUnziW4PMhFb
	GDCb/MeAroaXuVKWw2H+tHiPO5lIMnJ4UoInLTLJcLJYf5PdDGheWJ0qYtL/e25a
	0n3AomPNFaJ7Q3Xk3bLt49KAdWA4PhtB5Pic+Wzy+nUp85lLqqFGEALELmgEP4By
	LQ93fZwhV2Aew6E7RORb/QGVzi0v+BzLvO45c+99GiDZeR374uexa7CZetNACcWE
	mdPs95IYFGJBkZaZpVHLiYTRA5xsNVBO8A04kn5MEhi6kP0oqxnzdOkoKhu/Ut6l
	8jSAPQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3duw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:40:09 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb641eaf5eso118274a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848809; x=1788453609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=DoZBTrwy7hTJKXTtWFA/tNaLqfN3pNhCSkWALgBY5fufdELrumUOhSVJhNb3XZMNha
         P9tq5sX3OAIs0LF16jeJp7uiLameFmhhjVNgVgBfvy4nfu5AE1UNhwQ0kJrYjeL/U7YE
         TOVlWNARefOehAleK8n3lHUT7nN3wznglWby/mbDmsrzSHXqtxZAypiSqKxhhhU33O9I
         nef2MCOBKRtk0DFm01Qs3T+1dzQUdnfbN7Q376s6sYWpGzA0bKaMPXVvt9LGHf043D9t
         DwNRrCezWDtqMUY3HwbbX8UIQVFMRxfINzFxXwsLYJenqKxsPoP5DMcgXLZ9m8B/MYe3
         Huhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848809; x=1788453609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsdXzVEg/opOUMCjXIMLe0tWNQrrcXZla2NfQwnp4TE=;
        b=tRkxp7EZwf6SYF7N+mxdd3E6VrwHqZl/LZhZxwpPcYnl25kz+KLbRhfIGaRXjEoWQe
         Op2NTtrXelsLJNH5DYJ3H5tpkNJFG9xEPZn0WyYnN5cfMgGf1Z6gnaEDmHtDqarPWrHO
         I0Qo5ahvEhNu/KzQlc+kdstSuq/9H9aouemF6/UHAB6CAbTLWhsmBRfnw9HzS4TBkwAt
         ddivlkAK0agzb3oOe7lw0lev35juyhue9g7TMrN+eoj071fURwnKBjLhf8+yMnnQ//o1
         oqM0ghi2XD+ASdbPqO1EQIGrF+VidwPXuk7bJV0DTIes3G6LO16WsyHmm9rZ/15dMIFP
         FVbA==
X-Forwarded-Encrypted: i=1; AHgh+RoiyfSvkYXEoxdZOMClhiiJqFtC8tDGiMq8tKFeQCqVyDB0Krir5J6NHx6rwc0vZ6ZUykYOzZHMJLsCm7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mzVIz7FGr3v84lqGNiWTV7w3lCjIOkwU3VDb2toFnVD/S3G/ih
	GMwAR0eegNT4dMpqUHCcYD6V0fqv/JQz3CjhCUtOCkT28ZhivPIB8e+P7l8uBUYIPJEiXxqmler
	CrsuNHVFnDfxuKHQBXgpPXazVoFaBuASLTmABm9sa4+JSMiGDbnDk9UCYI7WiGtXLPhc=
X-Gm-Gg: AR+sD13XdmDz3lIR15MvLRuMqqHHU15KTjW/WPMGwxX84MqFhldIurnz0YlAxCNj1AN
	qjaPom0KW9D7JE2GXhVAMkarHG++aUYe8Ej9bNi3+MF9x1da3cb09hV/6eGj+pikjF1AyC4CF8/
	3w3VbS8XRRXtat24Zyg5Dms7rvCIERqgYiIibkQi74jjDpE88YUQUDBHHlWmbY99EKKqrr7fVBk
	fXJ9vPnl6OY2ID8Xk/BG4kpd6mVGzakUmKbe8/XYP5wu2kL7tUW1+MXsZj0IQEn8lXy0i7AwSNl
	BL2XOIasGo89aZ9mNQUKBOKM5NSSgNLfd9I100BY40YUXt1PeUJSSc6IjPLFDNx5UTkNZFS82+d
	wZgDOyCm0fcryLVlD4phczOiHOLdMSSuD2Gi6Dy93VpbWBCOGHIL7pYmYjtNwmanbo0V7UsCdQQ
	I6O6bZNgu9AcR/30ToivdT9hg=
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14794083eaf.1.1787848808672;
        Thu, 27 Aug 2026 09:40:08 -0700 (PDT)
X-Received: by 2002:a05:6820:208a:b0:6ac:b6c0:2c09 with SMTP id 006d021491bc7-6b1a035992dmr14793990eaf.1.1787848807924;
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:40:07 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:13 +0530
Subject: [PATCH v4 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-12-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=922;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=+/+CnJFkK28UfCOUz91D0FsS6GYOqD6AEiwdg9UDtAE=;
 b=pBrBLzP9TMaCVUrFowgcMyIoJfPSjcRKOakAZG2f0A8c5CHxwMisU/O2fCHoDFLEHgcn+UTEU
 fPRnjvgpBYyCB7YGXQ7XCauoSDwHWyfAeGfsWsob99y6XN4Y7qQhGLh
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a906869 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_KRvd0mH2JNXacczCDAA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: R7MPFF4lGoR_PNKQUWBGShKjvEBmwaNg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX68oZYlqtj3TA
 A0QrRdxfhKq8vytlsM0ILMhsddTuiInrqvpK5yU0Y6Jpy6LuyXoXP6gowjpnfpkK+5zyWN3P2I9
 zMZP++sWuS/LCElHsQDu9MgFieio8PU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXynPQoZ6Q3X6D
 9wS4Bddp7xpQaTkMT9yejfBXZDMPS5kXIy/BMBRjGQerZo0dg/Nlym3MPMHVFgGakQyxnXkr2MS
 8t5NY69hqZnRvIyawRZjDQqOYj83AREV9B2AtVG08/eN/Z2QAZG5+LLddGXxiysOlAzvDnMB4aV
 8yz4/8sRQZ565DD7p/zATtcbnDIUDyk1wS71b795r0zt6MfLDWZvTbcb2YejxcNKetR13nbtdjW
 W9Q9OgGUeel3bErLtca02WyFTsSPjlpPHsHQEcs3VBbHI4NUbvEe08gv8rQlu7NfrF+H+MGgyO8
 HK3VASQ1J3tfGS1vMljHh9ct6we3Xux9lBYcNQO/xCdZimfqOU+Wv/FqV+bX3y63n4kY6QOZ+Rj
 bFIZSRo6tkJAsVh17Qcjkz+IPcZ69uCkKv9Zw/WuZ4t8DBRXv1epadoJKxwtQZVwp2XMkCFjqik
 dWgj7TN5Bw6PEvjqe9A==
X-Proofpoint-GUID: R7MPFF4lGoR_PNKQUWBGShKjvEBmwaNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

