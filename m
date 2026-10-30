Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364210;
	b=zju9KgS2UO/9VAjDtB/BgOK9ItBQ3ZpYDK20l5l2UjJfW/AlUrFPpqirSb5JHsvyBQh9
	 G7TdmuDJTyJaJCi0DyJrCCVqPtd/gboj7M9bOSRQpXqyGgdiNN2A4aBl5emvkox0QLqC7
	 NfHpNJ90RT/43tf2L1U6l6U1XW0LtEkXsJSlxD6R76jtjr/Ef6ukw64JvevlzglZf+CGz
	 QARVM3K6Y9MMJomkjagt0bLbmKV9cB1nDl/BpgY9xx7zrDBOLWl4s5HB0CZweF2IrKXga
	 f3xENUhKS41CJCQCA4t8aAmNhhXffuPqz33qudi9oaZOljKXHw2LYGaQNtXBix+DLNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
	b=WLFEM4adl7dud01M0uYCjE4x2CdfbtDUWUDrFKHNZ8ruJ5EAUBYV1nNirKz1krTdKBuD
	 O3NLHYOQj8qQOklhCRwA/HYuuan5apN456OnPzDChIQJyJ0aMuxZFFhvnnoH/W4WzmcBQ
	 M7DClhwGwseD2ru803AJ3QkCQXgKXfcwte4DBO0lblSvbSPxDXDZnHssW57mPc2Ul+rlz
	 Yo11qZhc7N+TN01aZcGsv6uJG6WkeyP8xapjTDw+RFh3bZRS7almq3kTboVajPb52o8Cs
	 ybkkmBQQfdEDP/ZL3t4PyPpXaLI3cRE++lLbhaMeTApNWRFFs5GBDbxVdLoqaFIkQFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8DA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG3rV2169722
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=; b=W6gj7HQGhDXp+iG7
	4V/LGVwlaJPU8X0isqrWeqcDf2mGwKFBxnhoJ/HcvsjrANqd8rQDEY+d8I+nDAE8
	P1P6nUPSsfO3DJe7APIFi92tkM/W7oMI0ShSPrSJQIzcm8raY6k6x7bQ3cvkoJ1u
	A6z+3/OBfxLUy6e+McQYDJIZB3U8EtBSjPZ+8oDhRHQoSQQ2vJIRbasGxToEiYtJ
	RtySHqm8kd7s+DkTwIwhdGv6tIVbkPmuXEj8lvPykq+xCEsXNNtekCg0n3S0Ku+9
	PgIwpJqKxLHYaqP/BqKK0IVMcr8jBgtUxKdrmRFl9i1dHwmf+2GYo+8jnHkLhubu
	8K7E8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pb228-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e818ca61bfso8285635ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364208; x=1793969008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=cnRfjBSvvjPJz/9kBPn2anfFh/+Q2iyZ5Dj8C3Viye1Gwp2pC0IuLvKWGBAovG6pPN
         GfugOArVMvbOT/HmluJ8b8qUhjFyWkaRW0en2VmBFoEP685gq2oks1BrackWlUxwSlxi
         v1JcxJTJbi51aHhWWlcFpYIJnS0v7SBdq/fC/VSAQASEUs+D6ppMnrBSEZpkxke9TFEW
         hH+hbCGw1oEsalOH/FYykUMh0stQ/R9Z8v9kyacDtQH4WNtftuDuKOGua8XlvssMSLQU
         r48+rSVN2jXBJHTp6immlpFBBPP8Jb0Fv88i++rSPTCXTKox70RnehBUUy3qC22W87eP
         Fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364208; x=1793969008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=zoVOHvbe8URlt2XnFuKoDEu247QbRb7YF9+0tE5AFGr1zRKUTniHZAmXmD7hmj5g3a
         7I/uLzIL49XH1YSoAGsG15N5NFq/LzseSfdip3VG+HxoQJ+1PLqgriv/CnoJPg7nZt6t
         Ap8mcsSnEx9K26DfSioEhQVirGBdhrzvn81DfHlO+4SRGwS7SzpiGzXLL905DNKq1ksy
         KcS4S8F+ba3l2QTBIruoCfRUvukisxlLwE0HegAVrc9TgW4zK6edhXkLTretgcQzozSI
         A97wBGMSq4/MhQaCJ+2AISTUmRN8Ae3z6cI9nJ+n1qBKUTaeBiiskevPEVAAv8iHpqPO
         jZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+X/QW/dYlO4qyt6/AOEWqZnlsWrNNBXX4wb/eU0FXo3zV0scKrtEbl6A5jhcwil8jvdHxm66bmRjD4Xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7mjxcgrGxvewpidQlxEyk1bY+m0vOy/wjQS8scEndQjnBJn4w
	6xaluEMPgi6tcMZ6HgJnfNrmVEzQkR5JPLLYwCoj3vIJN653SEqQA/y1h22ZgK9tI+zPbeXzUb7
	GZn5UWcD2OVT2vV3NV/Z+WFwIe51pEz1uMPF3eONzia3x/q9Y7zWySIUMs0pJTebCPx4=
X-Gm-Gg: AYBFou0+WfKUx3SUzZ/Omo2ctwGN8p/mu1zFIrWaKt/k8SReSvTXQxCNw52HQhq3tDv
	fI0QlWllqNTmkJc4NcmD3snuWjB4+7hgclYSJvPuIesq7yWt9mNm+GJO1CmknmFR7P+2dBpLeEi
	uIvQEPyYATibvRd9qBib/Ma0eiyGFdVQwNekZ7vvWP7sUNLwegFV2kKlbGVfbm+vqFVfGscu7hW
	BA/gHPr9KX0/T7vMS9Jwe3zZJhYiB0R8mVcEsq5p3CIIeCykyZLOqv53pKyyW6PkPMbtPmmUEsU
	lWxAXuGA42N7tNeKOs5HBRoA6CqZEQsl3DfXbinK74akvDd4Y4eq83XV9pIKQnFeTckcwBAJsyC
	AZTgZ/IGXJagwoJ0AIepCasZxvJge8d9nLx9+GEBspRqaSe0eFo3BGl4Kj5GOXl45+r+zNyCOtX
	chwIM=
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829525ad.21.1793364208150;
        Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829325ad.21.1793364207726;
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:01 +0530
Subject: [PATCH v3 1/5] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1341;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dX6MizZIA1isQ45cxUBsZgjrz8paPsRmmoOT/a2mOUA=;
 b=Goh1WlR0jf3fQOa50V3RiuKdBhpRNJIYT9f0lf6o9kErrJURx/R22pq/QSA0hNNZQXuLu61u+
 0vJJ+wrFvk4B5FV65gAwLZK0YrGFNAfIBqv5N7RItutaBxCQK+0/fx/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+Ns8wBkRYc21
 N7/IUKZSlNXLZqePz4B+J3yPQMVvtv1O8tw5hWMEuhTw7ZFtozzrHOf5sUY+Cahz9YgYY2o0Rla
 WxcjIrXLgT0h28NNgHN0Nmegkp7xMHcTXK9k0DTJhc3pb572+FDPFiy1FYcdgnVRDdkKSbAPNhj
 YNCwVVdi/j30m3iGJZn9NCe5Cetltm0l9IH5P46J+Xur93hRq5ZI+xRS47Gm381l4PDauJ43uhB
 eAlBovSW6elsPSCr6nOdqM0+xJbRKYFOxNKP8O3W6u0H3MO6tE4N/MuRqgCePbnFhimpTworb/O
 H6JOINwMy5el7zByH2LrXuW1dnbr/2LIJVa0PAI97yjKgQtmKCcMQ3aRdJHfcK0lxnfFV9aRfMm
 z9vbNbtkjBf/0a/saqNheHmm+U6Q8NeFuT5mNrgKBEFrhwNB+rXKZg0sh9qyXQqgk1fqsRofa+x
 rv0ZOg1QKd/DoHbssdg==
X-Proofpoint-GUID: xxEyA_zwN_ukR6MaIumhhA6pHuYyyPAs
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae490f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EFwTI_IBlkk_uzUYZfIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xxEyA_zwN_ukR6MaIumhhA6pHuYyyPAs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX2Kg9opSgKVeQ
 3wEEvaS//UzAPTmNXTjmLSGytnRNyGrZoPkxPQEnQIWbuP7ugCxAmEiR2GpeOTv1XU97LcEIrdJ
 8LhSOk/QldcR0Cssw71Sl12+SUgTayM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

