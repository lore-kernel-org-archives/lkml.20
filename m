Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6B3BAD81
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285270; cv=none; b=FSdjR3EnAxzG84VFnKCcVJZYly4FmMN75WnpgvorfJsoKzAzlhMypnndZ1YXxzAuWi9MljlaExI3USCBuQQEQoTun0KaaxYUzyWGMCGjfbCTp0hQGKWtNaTpx+sbOoWs8GBg8MsPsQRa/FFU+eFMVLs4JetWIuOZdIJ3kNhFtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285270; c=relaxed/simple;
	bh=zGHk3MfhmiAb4EiIwnRAES6AmHNoERAFk9ME9WyBloM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ujk7teO6h4C15PddLNWUmHeJ6IwqWxab3OiDODThmll2CcU32iHi/nOkzOAXIAeYcUAE7kyMqOnglvSfudQgRbAJoR0nWMKvvuZvAhqLSPZp1fCJdRO/F8QCQ1vxXGdQsDsSlZp5MCfKfiL5MyvpOVKQKkRskoylBHk71w8NZ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Air0l3m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgvpcKMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Air0l3m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgvpcKMc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARGDh1543908
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=; b=Air0l3m1Fb/GFS56
	4WfyxfDAyQRfD0pxrCNoTiecMzvTGATiFX94hFDntblThnpkxDUD5DDzNcsK8lOX
	ogzHKB9AaU6Ty3BzML5dzw3BESoWxv29qVv1LsRfajMSDHx1nx2Xy0TY8S1EFvpr
	mfUNdQ4sV6KgeWq5N7EFGquOn476B+DgCxWFAdsHiR5OjO9SLPcopiKpUK3SC+bW
	61KLv+poburXs6u3vUunbZSgyxQbEvN1sS7M8/sukWfpPw8fc8Qob4rpU89xLmkJ
	/CqV5Wtqzzml5SeWFzuyVl/W7yNBqW3MAlq2NMjLyadtEfU8Z47pxq3GAEnXV6LE
	KthVqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4gwk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:14:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3237311a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285267; x=1791890067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=HgvpcKMcz1/2kBSuSqPO4FDGVhh5eG/Heb2t2tewh4WW86VVA9IUfNupimTGaWbTY6
         y4us1EHY7qkOhugKMGgluQY0+HbSgd0ty1AUHUP/Wio9W8s+R3vM2LY7LScRoSGI+MXa
         D6eo4UJ8px7aLQnMvLQz9qmiamjHmQsquZSeKLhsIRs/VQ8YhdPYRXdRwu/8KD5Y2WZn
         NXQkRIor7wczLRSbhaXOlS3zE4EghWz+xURvuZJANVpVOy5mW9nyL0jiiVzDHn+iiCx4
         BmeHoVlW+jGEJ/hzHYwGiqWxod2tRZOEyATFTQuwDGxzMqFE8bY1qWJM6kjjfGBKM0HN
         FhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285267; x=1791890067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=fzg4WnKEfr+6mc7v1UUxhOlvwk82wIGuvxezyIAgaaXR9LAvhLEfY27zN4MZ3dYjYU
         8Juo8CXEgEZIdxsKw2SgNld30SnT+JacnYVOCZhPYvO65WyjNlGb+C+d29Ttui7KWzgt
         ny3M7CLh8i22VJOCF06e8RMrAtiI1UjS2VAKVQE4jFJqQcQsm9Kw+H2kqcClUCMfBN1N
         ckFhFjXtk2Uesitc4JZRaaIEBWajTZvJCePIx54CwJlHC0CSr5nHIsrMmXFw0FzRWgX/
         /723Ic8aNnE1Q9na/BSBwGhj3sa5heSv5BTHfSccT/RNvAp2NQbhzGmpFiMnlRQOh7OH
         FSSA==
X-Forwarded-Encrypted: i=1; AKwUvBwp2uFbYRryL/6p/gxDG7goJtG4EoClY0P4VrRBXc8YHw0Y8fLMNvb+c13P8Y6MtE7FPN24jzlyFSLe3Yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwpT4oKvhBD9UTGOzerkKi3RmeE03BIn7trohBfBKWdkHZ29Rv
	6MhmGQNQaVQfApxWBv3tM/5hSE0bb7M758NBqlEQfmGYmBrT/rhUt9K/9VECXKXAkuq/rN6GQ8l
	66Vl8B/0W0lyNC3W1TSpuU31PfHPfjRyJIHvVImYRviVKWRLzI2oyO0SCsSoBJz+ZDMc=
X-Gm-Gg: AYBFou2gcBldTcTHdGSGImsjBumlUwaovUudmlpI3wMXRXQec7xXA9akIXcyMTcJ9an
	GqH9WP3I1aWdn/Kd22EPIJEKPl9QnC3QBwobBRo0dQ94lWe2e0mfgdbvzAQUGDJIsPB+ipPodUN
	MiV9GxWTfoLhcs1V7YkX5RPujfpch8qgQuq3nujqFHkIPSU6/eso2FgtIPe5Isw1kWcuF8M/lTt
	2otWEuBw9teey7cEEmc/sY4zycj/3Ks9E+RLnVw2c1a/52DicHFVu3zloOJPUvOnxAK/lqtLXcX
	uc6Dn7kjpGXwpQ2SoSb8geTWZZxw4GQU10nFPBYsR43NFpr4GcT8t3zBIFV8VtizS3x3VAJdKsS
	7d+BvsG9PBhzw6xDnRaYSAsMsSJEbqlY7SA==
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394116a91.23.1791285266996;
        Tue, 06 Oct 2026 04:14:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394102a91.23.1791285266258;
        Tue, 06 Oct 2026 04:14:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:44:03 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX9cVAqx/whQG4
 5tIglXHohMFaXj53NF2nTGOUlY5Hi83+PgdWJmytkxK9S2s84/pXhgpHXZjtD/0GPREnNBzRCFp
 1piyIAupExqsOeKh9npFGEOPnfre9n5AJ3RnGtYEiOTgtCUEeEZA2vCtMJsG9G9muFL2euYeVH5
 +LTljL8pU2iALD2GpJ5C2dxiZytf1jdqGJe/OA6juSrOgR3D5031CjTvI1Q2f0cHI1TfCdTPgcS
 9exPt80MN7TeVa4albV+W456zvwPjvj77Mm+CBLrba8VqAjvrsRb4yZ3RvaNXgHfRUj0HUhC079
 H6R5uujVEtkF//5LE/BT4r03QmEUvjHO8BCFgmkibX8BHt41h3tYGHorLCP1EJL35s1n2BdTHzS
 NyXCQNa8zid9msXZ1B1qxOrX5g7M2Ud3LCfoT3N+/pYSYnJ9lilha8ZwfM5kLYQoVm2q4CVqHsI
 eJViacN93nhNwuqFJ8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX2ylro5D83fcW
 eYEQ6lMbgrk2VSIN+FTkv+6vVBhBzHU/wufoz7kVy53d1H5JnE7aD8SVOa77lgEybMXn1I3v6Wk
 2Zyhox+nz07lslyxxDKemA24xgPckzo=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4d814 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: W3cl9nY-TSSwyfQ7mDvody73BO-MzJfR
X-Proofpoint-GUID: W3cl9nY-TSSwyfQ7mDvody73BO-MzJfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

