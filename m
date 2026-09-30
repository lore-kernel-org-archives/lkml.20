Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899204F3EC2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773348; cv=none; b=oaLci5cwZ40Nd1w9GIs8yKGwXcLDOJWTcZBFJXgIQpJHaLBJPJyXA/garUL1yhQpUs7KJLtdx/9fXF334UM/5zoxVIrExHntz1KLEmAi9wVX+WNyp4vDTAMDiQdKnRInz/vaU6DVPozjVBMafnNi6Do3N+02M0OeS9+fv6N2BC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773348; c=relaxed/simple;
	bh=1oLmRXw1aiff56t97MyiGav/WunYNGWzsBca3a4STBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gyem3yfiIt0j9sPFRKwh9CQuhg8sJHhIxSFCpLhyNE7oASMDGJXPcxpVk6WDoPvD1mCwzmNrPK+8gB+KaG7rSnTtcxKvoQEhb86xQsdwKNGOHAuhfW7RWd6cdhJ3dbySF2DFfHI7oVMBvvbeNMiT96FJ5q9U8cLQ4LPETZ/wuhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQB/Xu+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMX4plLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQB/Xu+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMX4plLC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7att319184
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=; b=VQB/Xu+hjhRbYze1
	7uWeE8uD8dtOSe13EUfXkCY5CHOs4ywen3CQXfAxLRyBNzYW3XMfgWVUcmjBA8qJ
	mJhNM7cy0bhAaZS9e47hvVQj66DVFrZyV5i+TSrlwAhRUV/0Qk03b8gFLDWBRPUM
	L6URpiute9puGt3lWnepdYv1J5KZh5ybVRTEEx/YMVhRZRaUqrL/t/cLcgnLEIbF
	QpSCnv6ektqhKfMDZyn/O/fLuq1t+/8WYgjnQDg+M7pEzX7Ex7AjLFrEJmsXKhY+
	VNs88j0waaf7/MhrfahZHFfzjkiVPHAge50cUmrrQ/rKYQ2foEprl6ouo4e61IAm
	jDZxog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfabsxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:02:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so8800229a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790773340; x=1791378140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=;
        b=GMX4plLCTX2CApNf0PhAKpCkkqsAwpm8jycexTAw89Irv6MpvYcbhzEk0s1GQeNwXI
         Dx+/uIbj8Jz8JPKCkuIK492jr+9u8ABCJyUkPYeKFCW3XnBpEwwVN6hKnKyWXTigY6V2
         aNc0V5hztuDopip5KBgilTeZBvqWnjxxaQkUBIa1AaqRsqJO0OKkiE1KJVbmWF80lVJr
         dVzGmbecZSZGsL2rXNxpu6AAmsmkiRsh4mdjPXFwwiRFvvdW9g6cRj54jZkZD8CuS1Kk
         vbvIVjLVB95YQAQ/mD6D4mX+BYP6LUN3r4xuK6e+/Rl+J/X9gOvoECpbIjrMF5Ju3Bie
         /jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773340; x=1791378140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEbaopQ6+wW59DlyxlN8ULrKUgq+VC36bqIr6pLubcc=;
        b=h0LP1D0PTR+PdCWw+obqTpNqsk5Y+kIYvTvk8i6VSYg2qVr+w9FcOOCZF10QlA8a7d
         NfF5dyNfYRpK/RZ0Oia1unl3d86fgIbY+cbi5BG8iZAmZct+4Bjse8g7/DnEebsP2AZH
         v9ASCIVuF3++T3f7zLWm6daYCRkoDj9gYdMCz3FiIWGjiqXSa6npqVZwWjz9OWWSnuLk
         IZOBG6a20FXPCWZELysbJgGVzNKxDuW2E/BHX4C7zLdRUCb6OCXONMiM6ldW6Yp8+1kN
         1Zd91FACWJ//e5lMEt+zBOcHK6VTC4K6PxL8Zdpgz2jXrN4JtPxFd9KZCEo92VLPA065
         K2/w==
X-Forwarded-Encrypted: i=1; AKwUvBzX24LkcXiwKDt19r4xjllqkpWyajWWuRWIyHuuqlkGd2NIwQdKT+yAhCBrPli1hQPiQMOwPvX2Zylw6XE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvxUOOprFDApS3IgIXhQ4U5Hkxu+3Hb1jsBvbeJ8AcLhbz6Cao
	nQElirU2RDLR4Ph7BRU9PB+smlJaztsQdwCc7bfd1Z33AhMJLhmX8EfnOeSqQhX7sEC169AFgHd
	Iq1fPa94b+zJEi5u6AhdolfaK9PMJjL4MrXBNt21tK2LNpCGsuxzgfu4yq2V1boGCtYU=
X-Gm-Gg: AYBFou0eUQ7hAxdbg+yTmoayxp7BRIINcx0adMNakQtkXr+yt6rj0wC5VJ16xMreUEC
	GNg2J+jLuAjwZaSVxxW6nbTWlpDaJiJOUr+v1JDZZVF4BSpATG2JhdSDesB9fF3rXeHsTtC5mh3
	Uqn6oAJ7JwFCiP6tiQX8GH5pyI5IYv7rrS1Dfq9sFPHpMNvwz2Vw3qY5GSpYU8mskTQRRe8y1DI
	9DVXXQiO8kG7uzpel1/VmsafQw1toD0IlbYn3UxQxUsF5x/vHHltIRoOQSDpreKE7GmDwUdu4JE
	RKjvQKJ47jPrFXA0TVkRZre3/XQgHnYFpbjaelcIPB2K3o++zRIui4dueQZy8p9B/feDCgP/HKv
	peUt35Nrcfl2XnkA=
X-Received: by 2002:a17:90b:5848:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a4d1913a7amr1186263a91.59.1790773339907;
        Wed, 30 Sep 2026 06:02:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5848:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a4d1913a7amr1186211a91.59.1790773339389;
        Wed, 30 Sep 2026 06:02:19 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cdf25c6csm3426058a91.5.2026.09.30.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:18 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:32:05 +0530
Subject: [PATCH v2 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
In-Reply-To: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790773328; l=908;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1oLmRXw1aiff56t97MyiGav/WunYNGWzsBca3a4STBA=;
 b=qvZIWrmd6WOFbbn5yUQ7Okm7jBt5IvJQmfCDnDf77OvcRdlaFzEt+T7VxBRYDOFEt0SIwU47c
 ZBjZVyzcGW7DE7SFM8AQIxWXhz7r5v4l4J1bQGgmVoVB/n7kqROf/54
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX5Ym8+pwGNSMa
 xPP8d6ZhwM0iTzYNWOUUWxAKML1WqkQNm5oR3Ieb6dmn/W4n0aepzRVPe5Fo8y36JAuOSNpR49i
 jYXwbswnlHFbzK54n3CUvvCJZPboDmrytQ/JoM9BWy+GvS6CAxvVApk5W+OpG6Ria+rDwYjAoRI
 LUFbAR3x5h/F1nOq4+oLOxO3CqqfykTEqyQwNsMQiUd09akOK6tgBU+hXajHMnHs+wcxw4H7dzy
 mHam8obI9Oy4plU3iIoMFYlckp2ksg3SxtZDT8PZbZcwpUKQfnDmQUajMFVdCcfLIHJLc2Gdw03
 K/KvlB8pdDDGFCOuCQycn1d1ELohSyh4bGvT0JeuvAyRRoM9rk1X6Qj1FFWkKnH/CpOQqWQo2so
 xg1vsJzH98glU/PzGgzrQQ/xond0Z88+wuFNEGD6lQiUzceAOo6tm5p4CRkbYafXvtVgRj9XWaB
 1BbD++a9zwj/qJ2ydPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX+QGY98SKD7HU
 mshUj+jpo2g7ZSBp83YJZtEEcTVfyAJ8RJpsYug3uP8k7IZ+lB7UXWoRGnjwVCYBhommqXuxK1F
 wJvEPB5nhF81p/6xPSN2XGAtwUAPyd0=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abd085c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-pL1Pet8fDdhfHljwFMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -8nNOj0AZYhRxwDta0aCW72Wa-jQjnpC
X-Proofpoint-ORIG-GUID: -8nNOj0AZYhRxwDta0aCW72Wa-jQjnpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300051

Add the SM8750 compatible string to Qualcomm watchdog binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 4ff61102e407..8cd8331608ba 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-sm8750
               - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt

-- 
2.34.1

