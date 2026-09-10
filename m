Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060773EA97E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033649; cv=none; b=BXgYGwu5EOPDaEJakfon67d51aycNtYgJDvRQJmYDF2aUT5TwU0kU9qRS5xMo4m6kbRFevhF4KGrkCxZidyx7ye6pq96DZzftLKO8RPvuxmRBXSILv/92WV58FrghQ0ZZMYvmfdg0RhmFmqJtVD9D3XOghFhKeT0V4q6QAByAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033649; c=relaxed/simple;
	bh=Y3Q30/XDZYkT4BsqAnWiL3C7rPGluprH6psQ4WloVLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz4qPwq/r6Pgaagei2TVS/J4B2SNYMTXQBBulgkJOQ4KKjAXQ+eJq+rwFfSdN95mvv0NtsfF8lGu5ICWBTRBHhLmH2b05Ymp4K5yp9+As14QWKfXfZzdnX3Kl4FIAMF3FEPo3BQFAZ6HBj57dnJYW8hAdCd+AQCnsoemGyo7mrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EodX352s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcNntscF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EodX352s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcNntscF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pu7J1290101
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=; b=EodX352sSXLNv9cg
	v8awHzUtPhjntR+J0HnsRZsWGfF6uO6PCoQGGkH0bNL/alL27I1dBJ3f2t3weDhq
	G040jouvqpawnK7F+mgePFbCaR01KPumgQ0VXbAOWACKGoazjBukCRIioEunnRUS
	Gen7vF6yHOl9m/DRzk51wExuMKle7c7XBCuBRAkTPVR47rTeTqQL9dGUOQTHEbs+
	ONLSU8uUc4xaAdK70cvHMfMxeKWEdF//bVaSCvn7n7P8gnO4LzQnWAo0idvQUpST
	1uTsWFeL5UOTpJZ65+xEUYLBJHjPHgd9LB4+zRvepqnPe7UIQXsjIZU1BV70LL/Z
	2/FGIw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydk6pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:26 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b8b593a4so6761011eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033645; x=1789638445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=;
        b=GcNntscFv2rXNrXF5kUDbkHIgKg0uZ6Zth1aFUozJwhd/tMm4byk70s3x427p9Ptt+
         0r+w5rgp5vzTH1OktllUTei/W4VA75nKRZzT77enxvrSs3r/sMnWnLEG33irWtg0X4op
         MQl4u8LsUBsaTw03LzRCWmXZavipYSgPmNyMKbcktjG+YKK5DRB98es7akufap3j4GSg
         blcr5uSSCxL74T7GM9ZtxtdVhvYOG59KempZZ770yexY7Poxrrf2BIN0eQf+c4c7eACZ
         cGCkOM+42Fy0CvqjqtCxdj82CFwOTy9H/Vbj3rJ9uMX/cnfv/lkHAHBhZasKUd2zfISm
         f4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033645; x=1789638445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1FN3QsPJsWFGmnxwmYa+KilZ7mX3aZKpokGyVEBQQ8=;
        b=GynUimDGNFbhcSK3PVe+NEKyYlY7QMJ4eVhsH6B4G0HKtlOwCyFPS9id0IkrX0K3mM
         569fFOsaCQQv9DawQrBThm8nKQLpWE8DY0taV5cmOk/w6f0uP0UbwW8jL3PjF4uCj707
         UzgXbw7MErPT7AwXdVP1jfeJStDqt4rvfSHsR++L02L6tJrgn5xNywRle9bNkmo/LT45
         qS3AiB1BIVEQ31OULM7AfY1RrZm72k99JLlldh8T2UyTXi7mo3aqkZk6/dvlDidZRtWL
         vC3rllT75LE2LDb2wzxqASSiTatQnoG6sdVPZuxrcqAKS1t6E4cChdy9NFX2aZe56CG3
         tQBw==
X-Forwarded-Encrypted: i=1; AKwUvBz9WWKXV1hZQLrqglQ36uBIsu2d35DLoJenBkSLfb7wJRHFvGNYx95AByd6QFvoau1Wy22wmUAoRGfyt9I=@vger.kernel.org
X-Gm-Message-State: AFuF++lW5UAsCR4c3kW9XndQJuIQPsdy97rREfR+3+7F1KKn7fss+M8x
	x4RDJVNKWdeUwXqPFDu1np4+Evj1Z+6SyH0dVV9gH/VvBLQUKXBc4JDzVywTwCWepJbeJfbDKRf
	POx4ecdUKhzTo7sjVPSqFpZfPXyAH0A4/h8KCCgBUpoJ17qLJB8RVV07OhODs9uC/8Dw=
X-Gm-Gg: AYBFou0S/pmHDog8aia1/FlySv9xL83G6cxnW0soiN1UbMPkScqZb85lpGfknA5H6FC
	ez6lJwha8hi41jC7EA/Od42A0HOTMQeGnP8uX5f1IGqLP36Eg8iz4jwSG1o6WtNm9anF/NBIFnN
	6L2Yf8mr4VNxxfWwJnxohMymRAeN8PF7R3iOPqajuYIbDGFk3aXl2Y30/7MJVDsAfGmRL222tPd
	GV91F4Y/WOQ/Cx+EvzNekQUag7AewcxN6BFOpUwcmj3CidQGRgim3ATxsw5/FXHsHdIweldOrDo
	I5mx+s0tJySxBXJSsuWbC7GQ3FyahN4vKnnyahDxTEUY+yGVKcappX2REk+3lMl5IFliqLlHAeY
	W1lv4zE/BOtKlX2vzlIzm4gFnRHIVotikxSP3
X-Received: by 2002:a05:6820:3107:b0:6bf:5d5e:5403 with SMTP id 006d021491bc7-6bf5d5e6442mr2124856eaf.69.1789033645262;
        Thu, 10 Sep 2026 02:47:25 -0700 (PDT)
X-Received: by 2002:a05:6820:3107:b0:6bf:5d5e:5403 with SMTP id 006d021491bc7-6bf5d5e6442mr2124836eaf.69.1789033644850;
        Thu, 10 Sep 2026 02:47:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:24 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:52 +0530
Subject: [PATCH v2 1/6] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-1-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=1664;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Y3Q30/XDZYkT4BsqAnWiL3C7rPGluprH6psQ4WloVLM=;
 b=r9WKk3NBp3woDrr/YBMoN7xPIif0fuIef0p14R+R1KaSYh2QUnPWZh57D2YQtnbp9hFWs1Cu1
 lbQi19qnp9TCKOpVshnNLQTfcM3lEKWVu63WVbxH50AM9r/SC/V9/UL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX68qi1DBSEBpJ
 6U2nMBEyOfvNmDLDK4X52FaLaKY5N7Lm7L612ExBLAXAMs86v2tko6HL15U1v3SaDEnX0+6dCqA
 Hz7fPij9H0amzfKzkroNcXMjZiYpmMc=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa27cae cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lABkJ5illG85_PuKTi0A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: L6ZNxgu8eUL0SBsWtyQurD02b3ydNmz-
X-Proofpoint-ORIG-GUID: L6ZNxgu8eUL0SBsWtyQurD02b3ydNmz-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX8SZ8y4QSDtJ2
 Dy6thYXR+mWMDmOGke+ehZAH+wpvintvWvYlfkfkpkoqDUx8XC7CPwiN+/kW6YxoLwOmuavfcYM
 aKaWzvddFpg3z9YhEEvFBGr9Ss3QDDOVKBFwij5TfUOlv2ezxd5OzOn0bJ/Ec+5cgkzBLqeEZHa
 aJuVME5GEIOtjaaHQrrt04/7jSyJqqfRiyBZuR6Qb72Il9tlk2Uxu/IktDIMdqVoPRmTxgqPsi1
 zmtrjvBX6DXa3lOPyCNTdQqp+BptxDsgx6pup55T1T66ABVWAAYK/KGjuNyZgOAp1EdLK3k5YDF
 w/+HurjGNwKFjMxkIr0ssLvzHC0Zbi/PLtNRrubKVGG0nkTGQvCH1vwUY2JY0wcUDC+PgNbk2wz
 kff3ExdLTcshcO4camPMpk4lOiK8eGX8IOORYiQQ6ewv4EBhHtuwSJzP9IVgh6REkqWDF2HwGhw
 MD7tU5wzcnnGPnHUkFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

Add bindings for Qualcomm shikra rx and va macro codec.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..d2f68b025 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..23f00de82 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -19,6 +19,7 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro

-- 
2.34.1

