Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B344102E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179241; cv=none; b=HX+guB80rn8LWLixOdGQroYOsk4UrR9s78P0Stwle1sO0RihymR00rt4fkVLQAXOGFbgpwl9Rvi1zAc0guyhXJmWT5CfqmJZASsy2KBQKqpSTbCvBcjfjspweqScgn4dTbjz3H4UvxpsNxlE9ufYCNxVNcYkHVu66KuLmt1SLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179241; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyBz+QTsVS0bBO8eX/ET/4k0NcEzgbGTpR2YMBG8WvmfRACExD5fMQkUEcHUmKTpcLY/YmwSUnZcP47iBkqLhyTyXcBD77jlenxTcdC0HxCsx/LjbuxYbFrMxCOUtOgYFvBVxT+505Ps7kf89jKYOJfq/1xY02bHP/J35vmr62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5kXIqbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuOCg0wS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5kXIqbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuOCg0wS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBc7jW2639478
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=A5kXIqbuPJ0A34H6
	boo7mLoML76S9e+io3dj35PspePtna1xhEzhlcIm8Z/aC45JzyCHkNaxpCL3psRI
	7j2xyeKFax9lIVZBXrhn80sFQPiQBND4BnH5xuUkJTg0SmrDdEZVS6n+RTIxikfE
	M5qqOShV2McuIQYw5pROuqgHIPbCcQeuYSh6s8Nft9Mwqh+CFNcCV1R4pdlFMYtI
	OKzGG2RmPx4khe7raJ2hyN+/w7NALGschZYeTD41wOuELJDvUBbWf46lgYX0zZAx
	zr8mwVSnbUFyGeO2UmvjxxK4H7P/700iffUdTvtS1piTezM2kvT9/oqOm2FpYPrG
	aeqGPw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqjgfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:00:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so915614241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179235; x=1790784035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=BuOCg0wSGRWmBIuwPa5GHy8ewSClH0Oz+e45acgCTGfrouHHh2GA5LORuccWdtYXry
         A3z0/wMPZF2Lio5yNS3536dajhKZPPDh2c2c8pc7nwoL0ylvOetSRdIHRA3HD7gy2VXm
         gCQJ8rfo0F9TLKYftYmalYnHmw0dUaFKP2D60S2PTLtEPcqw6vBHET4VbauCtS3zLV6z
         RqNLxLTgNo8jqFlO/R0JJOGjDTZ6d6k8NYtEZ635DEUe7dkbT0LngYssOPkVAdW6G1Ql
         d0T/0qEDwovrHZNRrPnJX+9m68lAkiMaoX63MvfQpdgXSBhiXWMDZxHgczLGe9sm/Kip
         NLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179235; x=1790784035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=lSW7wk65jF7gdbpIjDdTZd+TaclgQ/4/trOys9lkg2pSzIQZarP4AybeNPCXyUD7Xs
         o62AsDrJNP3VIIL7NeDQutqCcVr9rMCgWMHEB5JMFdwK20Y1zq+KSkI1CFxvkv2V9w2T
         kPllQHudg4j1VKfNOpIFuNvNRkeeS4qSAlRlNjBwxOJd3vzUNK/gtjpHBiGYBgS1aUhk
         gu5STx7xQZlMhPYQdoAD4f7xZH9SFGM75TlZCpJxnsr1kziB74pHWnHTxmYEhhcb1e5W
         la83XQDwQh3aP1xdRLxnmBbAJYhZy5KT/fnido0ZO+ke80FbfpPFzJb8tbaXiqK24g5Z
         VhGA==
X-Forwarded-Encrypted: i=1; AKwUvBzfnj4rB92g9n1BdXryaLpHytDOWY6FQV3mZZoS7ni1PfasTbA7CmZoh3R5V1eLwmrXyikZ+LczgldeQ4w=@vger.kernel.org
X-Gm-Message-State: AFuF++n5lw7wy0tsPevtpGRtuCvbeCLriY8ir2pGkvGu8rjVH8r1kNZ1
	lvJYG6oK/EPezsGApCBo6Y9S7A1LVh3opTAawFkIXMyosAMZ6cOfsXiNffpS06aS01THXWszMB1
	NftJYjYJRFUKxdl6DUXQG1OVde6WOVKkeVDrf0OcvlRDs/b/Cv+1xdgfDy//x1dmXovM=
X-Gm-Gg: AYBFou1vWlpp4raiH5VvWMWfzZihjlgTXYU9n4N7yOlo0TQmRTWkSyqfZYT+AcnRS17
	a/duNCKSKCULBRf6zM9XTrIXT1D6CW8mrLhxhYDhp/3BlU0ReKuXGmenuogn3zDxjCvcgLfkQar
	56POvihrI93uGgwRyePPGP9HJim+zU8LK2fUYwT6beGDt/+QxLnRHQqlcb+JXXlZkALQn4nDKTO
	FQX0q3YqN7RvZM7ft8xywLnUXa5zUOYAxGuLQhMWllvMd2uHo1RzhilWfn2DVLELS0+DAzbmJnR
	IAOMAzS2vCV7/rBtTuP2nIp8sKWJA+JL3aGbfP5tRE5ZaeOz+yeMaiNcr2TwPgxTnwz7Avdt4j2
	ING9M031/OcA7uDkwzzlszfL6jvOFrPrAJ0WBDSwHtAsDM6q80SrTddWkIBCTV54vvSrg3sLnEU
	of+Z+dJzHlVibU4gKqSxRN5tVchwGmo2jrgE9TjsT/cbYJ7j4smHM=
X-Received: by 2002:a05:6102:424d:b0:7a4:ebdb:cc0c with SMTP id ada2fe7eead31-7ac1a8b6edbmr2871914137.6.1790179235346;
        Wed, 23 Sep 2026 09:00:35 -0700 (PDT)
X-Received: by 2002:a05:6102:424d:b0:7a4:ebdb:cc0c with SMTP id ada2fe7eead31-7ac1a8b6edbmr2871877137.6.1790179234906;
        Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:24 +0200
Subject: [PATCH v9 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-3-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lhADbFF24Y-M28CHilMG0yWGG04XzBu0
X-Proofpoint-ORIG-GUID: lhADbFF24Y-M28CHilMG0yWGG04XzBu0
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3f7a6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX8lvIOWU5f+0J
 TNDJhLIoj4IwuBiFHjM3r60tGsZdchSMwWxZPoRWgI0omc9nIz1uRozDAjncq+3wFyONsI2nNvv
 4ZgyErIg466V7riSZJ+KZwp8DT18LUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX5LZDYALmcUdx
 1v85x1aaKb0nOYfUXa0CbDG2k37gU/GF8Y3GnDqOMkuRoVOXE4wAyooRaYN0RSVlZwNuXOBKh5l
 L3vmEzaw/66cUoD3yXS6X3IBibWve2yJ+bc6Acn0XOZzmXKkShIByPdbkwToKuDjQIKr4goxcIr
 tvyhp/yWi1O+pzpoFNAjFDmDOrTyJcDWgAzWwIcgjuYzCF/Um62/si91q0IJPfXL2XFTEO4nXXO
 i5q3BMtAjiI9U09kXBwydT/LDda5qjK9cnraD1iIKECcV/LFbYaLCo36UIpL/2qaCELknt1ZLqv
 /76dpEhG+gPTmcvRxhHSreD/mUBCpB26N/L9d6ETrEYvuecuH6T+6VbglYOplXwnU3AXZRlob1K
 D+um7pD/UgAPlhJsOPwbftH6TY4zUaBHfyjSkN7WDLiSv9U+MX30f1JwEDVAgoYHtLVtuIBFHlQ
 V0niOQk1yIgyJtqRPxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

