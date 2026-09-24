Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B3F4DDB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230230; cv=none; b=siuR4cr9MIegqzO36M/ODmQ8xqYjkapzlNQwuv8VH+cWQxs/Pz6tVcEwZh2RpeOVOoajUiikPNfp8dokblt83J8C/2OFzI4uM+MLsbcSYY0q3sp4s4Cm/VKLS7z58c5Udq/TiWB2RGoP3OlTlF7rxr1kFYXE4RUEDo1p7DyKm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230230; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hl0gRq9RobJzkeiXAP8kZK1LKF1rdKL/Gx9ZArRXT4TNtoXxmeR3PhoIuJpYzlBFfNIA9h1G85/zEfR24TX1gev81Ycp3IY7mAHWLExqoo0qSjFv+QViTOkaOOt6GxKuEEwXhXputdTmX9OD1jBn7egsm5Bi6imZYzYUZJXFIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzZhDI07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=im4U0WzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzZhDI07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="im4U0WzZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e4SI567403
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=bzZhDI07zkIv0RJk
	KFVzL7qcXzsEHyoICLuGCy6ORCMhcccHjwrImh79sAxUta0mG1V0Baf5bSt6OVio
	xu03OP8xXgcbyP4zR1d543hyMai8mWFPR8T6stRKMBqSNfLUgJDnzXKY0of+/gvo
	dkORfrsKDIOLRdo7PpmxUL6AbwgapK5DR1VnbuTasG05P3lOxhHlc41xUYlRoCIR
	u2d/QiabYzSgxffonDOtwpqaMTSCkHbqiZ/PSGy6FXYtTbb3mMH9oYGiBllYZWgA
	SIqz7epK7FroP3Yt8Ct240LIgKtkWJWfAmeXqx/UCP3lv3ncVIeDPrMqYqAgi5MP
	Ug4u1A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8c71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2379219c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230227; x=1790835027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=im4U0WzZ3UfI6dVAz61ijsASoJRg3+AKOGVxkF5nbhpKlpIB+Ugg2P0ajuLyt7JRPN
         3x49c2iDH4k6AqigVmf40ML/0y2TsJ0QRQ66JGwXOh4+Jx6rq5HS8YmTOofj5t2C9xaq
         Ofese9RmKQY18bj7v1bri3MoanVI8AHW71i0dgZx2SBds3fr6kIu7ssdWq+MfJf5ojRZ
         vf9R2x+T7E5Zl0F+Ypj+0Kcau2US5nT3BGSQwhSw0VzYeifhWCvH06JmkC+pqdWoYslq
         OFetl33BcWuHEt4yX5XHHOU2GWC+vUgLT32v/DvqHFVgdhY5fd3Bp6m6mnoRrlpq46MY
         QIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230227; x=1790835027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=avD+ZNaK/EpgY6ihCZjUrmAxqvTG2U0bo5ktxTlnH9WLQzTEsEMBtGGTtkiqeIReHw
         IUsMeHf+oMMgXYniJqhE902tsg1FaGES7VAKz53mSfYQ58XjqV8vDdhYoHr+wLBQI5Ew
         cbXICsSTprgCGvSTv1dO2TY6RzX/DEvpcAxuYGDBTEMm+9q0HUz2mMA8RV5eh6/FlxSH
         7QjITF2FwF9JLhaG9wJjRMyLsyBahaeSnp+qtRFmwxyQk4vOnAbLdUZ2aKNB52ZhGpLP
         R+MKjzjWBEZdYO95ob7dm+4FPJYT3kCzGp5uRdDAq4fk3CwXelbrEtgrYA+ejEEDkFov
         IUEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjF/ED+QVi+XDMNdtI2VHy1ff9UU0UKVNcHCH5+IBBuXWJyhsxzw9uw2MLdPviOBNSyxQBqy6O9lYqVEY=@vger.kernel.org
X-Gm-Message-State: AFuF++nVQ/B9BcANcTQA+ZxIOIQahVQr2CHbXucYx+YDMX7VUuaFL+x8
	3W/va5W5/IyEN7bZw8Yh4r16wBjZEvTmsoQWP6Iv4hXCcidw/1LfK+tdUTjd/zslCPRA/nzpMN0
	WxE3Cv0zjY8hGwXA9jp6wo+bqy35x0ClxbOmAbexBm/eK0VNdVe0TWrWqYJnfRi9z6M0=
X-Gm-Gg: AYBFou3we8NNgFBaCL7Np0TbBqduFwMpXvYiJmPtUcVh0IwuWXKcLoXR6m+lhX1QQZa
	VRNsu2WMKXBshuA1MZmtLQ6zDAzAztSNwl0yTgAoWf+GmZBnQxRyQQSctG8xU5C8RykyAE1QLfB
	n8mrOW1JVlSQbjfKWDTFaHbm4pUgIBYc9pNW6huDn138e0EyLW1fCLLwrvEVxSbdjsccTMOwdY6
	kiCk11VOpXdwaGHumCn+C9AljwhxnaX8Uxicq+sjhfHrUX4ziP3R62J6rZv9TEBa5TaTvkccFAd
	khjfl1fU13r3npR0HztqAr2pvADt1YPuatFGaXQn8GcEHVTevBTE4fZCHJKC+CLqXQYSSeZq45D
	5+wIG++rds2IhatBZQRbDjRYSvbGXE1GUi3Gk1+iGeBjOudI2o3Gt9pSIo24IzkeVRBsXk+E9aF
	VyyZXH28bmw8FGdfMHkslUfY/BLRDU
X-Received: by 2002:a05:7022:ec84:b0:144:eb46:be0 with SMTP id a92af1059eb24-14503fd2d16mr1503665c88.13.1790230227140;
        Wed, 23 Sep 2026 23:10:27 -0700 (PDT)
X-Received: by 2002:a05:7022:ec84:b0:144:eb46:be0 with SMTP id a92af1059eb24-14503fd2d16mr1503643c88.13.1790230226604;
        Wed, 23 Sep 2026 23:10:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:03 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-2-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4bed3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: yoYDBv9g4IOnDm53Nh60j0yZ3juIYPf-
X-Proofpoint-ORIG-GUID: yoYDBv9g4IOnDm53Nh60j0yZ3juIYPf-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX2L5XAoHb03We
 UMPnSAivEIt9fuF7n5zYc3fVUnwJ+u5weQGKBTFvNu+WRBvmbOF/zjUg4c+dwOhwm4JwCg3t7uf
 TxPERGbRzuZxOxpvzVYie1J08AZuk7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX5DVkvRhQU7ga
 djyB9GTfrm55ObV9RHuv02q5a8FAAGIrtCO/UIpzayZZJZvPaiCQBQiiXKO5hqBNlN5eJCmZiyv
 GDgAjiDKAiCvy99vbh0FkR7ZCXz5hNuknBhonVXhxqEavE69U1rrV+7/RZRuFdWHGK71VKQwgnX
 nq4kbs3SwXj1ucBVKs3/zVeXwuBgDePP1DylSvZ1KYavJSQLz+78HzC2IOaP9hnJ+UcH6kpxMWQ
 HtwXoFSmvOXB7fZPPeAEbWMr92ceqJXRdvLM+V50WDAgkKe737Vau0TDx1rFPTbNEWS5gFLGjJ8
 xKQ5uIorQWhkJIckbUQsuUC4zwhbCHgob4NQUDY16ulgFUz4WF6CidzoWpVJmyYjyYPu9WYyJkh
 Kg+UHLCnfqabp1Xb2M7fe+TyWsOVtjcRnnpWSWu47SqDe4L0MiRJ8ZG5Cye2H6BFFkUeepfzUES
 5DziSfADEUidnNR5eJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

