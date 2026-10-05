Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF61F35C69C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182219; cv=none; b=fD5hqDT+C6ljtCysbjegdiE1k9TuGf1zOVC30oeuxuQaS4aO4NLEgs0ej2pQrs6eZYEEheQ1eX1HQ0RZnDYnZ/WWyd0yJl5IvuIG1CaB8itM3Ry4tz77BVN1/G0tmgJcjyvDz9gxupwUKug+nr/2WOwDMsTyDhLznPAwesCczKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182219; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmgT0g06QcgxTh9XJLmY6WVdXDozVE1zDNfUliKVWukROPWjPQ8KmIUQBfhJ8rEInXG849lSbhFXiEUkZB5DoerZaSO3wZDNGSIMAhXpNxcS1b2Z+rgfdBuk2uGyzXfUaq23LGDSEfI0gmZJ/s1Pu5E+9D64VutHgI8OnrtAg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6+2YKub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2g8ahZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6+2YKub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2g8ahZu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510bgb788386
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=W6+2YKub+dtcgsKC
	60NutTAwRP/Nb+CSNv8ouCZN+D8Fn1acPogtffbmu/BelSgz4J1sktd2EVrpT7+3
	A1MnZNeF/6waJNF1fHEloBtS0MKPHk1JSTWbyxChd96V4s4ql5G586ufXf7UbWEJ
	1z9GRzJ0anWJMVrXLIGwLJB+HkfI5PMhUoDVlngvinDELctt1mCck186vDBpAo/Q
	jTCTQMNaOYimapBq1eyjAcN1NwtgJ0yUpRG1SnTbJrqlf91N+c5wScJLkixkZL5D
	+BV70zSB90LsjAf7S6meQHK0ffwn0AQbYdlbZBkIFpsoOBNm7lVVYVj0+jzvVMtR
	sNYEvQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4sk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:36:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1493b09d6bbso847704c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182216; x=1791787016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=O2g8ahZuM2Vi1Qogy/J8kJqGFzaH3KBDeXqbtb8E7CfxdlAM+AcQ64sIKG4Bby30As
         RIYcUd6qhAQBPsLXxneanL0m/2TWfrEmKrcHxPLFsopzGlITDAbz5qAY95U1bXq7nV1v
         jVXOMY+qCRhIZVW4IRX1kneyxsfddAXFNR+IZf7ObKhVABPs5s0XAL8GkM87gzl6/pUt
         3NW4cJuUsllHKA2ZBrEBiS/tWei6+nG5HM8HyCu7hkJbkCt5gLw5+esCIIWIAeIBlGzL
         FLOUErC7Wj4lK72I11+vAPXrETuGqhmWgQ1VkjdqgFSfPYQCuOf6nr/UTKM+023aHjlB
         NE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182216; x=1791787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=J6AwIfBJMoi73jiNcXO7CkhEs8AFZsCqP7Y2PHd1jIykgY+A63PUMQmg/b7NuR8jFl
         MGW9u+MYsw/W69Oz2cA0aYyrFDfNGdBn/uKwLUJxzdT/fcKMHFSi3KExkFOVmWThXXeI
         3cxQm+sjS6KMAv3THbGTiaxMWjnJgse8Drbm1NQZV+ZPheeN5k1Hm8Ce6iC5I6iMOP27
         /2/XGbDmKV3cxEx4u2HetlbszfReti+SEm6mZU0V+mt9hkrj38oPjPgdw+F7NEQl3lmY
         t3DFnmhMWr7XxGlFBCCm2gi9BGk3tQGWVNvJpkqdWPs+V9RHoqXFiaMhxfeShDgHByGR
         tlXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT2UmZaIs3Uk1gc5Mm4sbjYCFpeeMPGdZoHkX38pC793YSBrDdEwGUkaPVdT75nIqSprZk+i3TAR/OP5M=@vger.kernel.org
X-Gm-Message-State: AFuF++mfIQNIYXNswfN9TnqpL2h+MhK4+6KgEJMOe9arWzw2CaAzvbOO
	5LYH9yG8vSwtwsg+sPTPwpjVJf8EFE9PHX7L/MMeh3wY7ok1tK49t8l7RlvU6FWfgxUBZNyXgIn
	6SgGhoQKM/lnmVYnon4DiFTgTCSmL0OybTZaeQU0rE1DZITAAZSp4/SGwDxHXIQ/l5f0=
X-Gm-Gg: AYBFou0mnGNfyQMnjznGDajGNXrs415QPkTuTyn3duGHnneS0i5MKNtyYGECWsCgS47
	9bD/LbUceMwNridNR4UrYAWL1UYuqoi/azoqZySLm93kjXliNal5xGt8aquDazzQ3VQV7aExBKt
	1UdY7KFt1XxFrPe88SQlE6RxMdTxHSHx9QUkigTfL4fdCJZeZyPyhbic2c8EYE3NBJa8GUG6evL
	aqZQZ2dauS7OZ0i52wyDYlMtFCrHkkc2VLe9i7ZtrtM0mDfyJmT0WR+sBpDWPsfD2bU9/8hPm8K
	qccwsY7y3BV+aewDUYRngPY75NEmfKujDXjy3xkNzz5bNPzNakuKQdLUFxe9DpY25OR8mfrHoWJ
	5pnqeCjTSXKOiCSRvNmRtCbND6KcuTSGxrn21XhxmRxaj95XRf7czwIrNqIuG3B4yVWhEEFoNqc
	8Dh0+VsbC2/DJujCzfHagM2K5QSl+K
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474730c88.29.1791182215618;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474707c88.29.1791182215094;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:26 +0530
Subject: [PATCH v4 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-1-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX0N8Q794UKPd+
 SMF/x5Ez1kf2VF1q4F3vOOP+nZ8y+bUZz7RCe8irq3Hlt0dB/30jjEXDbQFbbkbaqsp9GftCRSk
 Rnk6E2GU+bfDOE+G+wAYMOFZGQmJ2Iewp8toMtCfd2g9nWXdQdCfYxRDLW1maxpVvyNMiKf1QcN
 Dm/+lNGfQq4a3LE9VYVNlKi+DwYx0K+YnzhCUL2gLvFgsNoAP6Y6OqiAteBEfPqky2R+Sfc5xtp
 fK2wkAQD1Q2QmVxwcsyOK6SKIzNpR7k5ozjZo5/1L/kSylARoEYL31QcEyv9UajCwXmsH/K5vd1
 LW6NIoiZ537/blbnXw2zxMWF9AC5igU++ohCvFOS+V8wCHWJWIG5WeBBfdLYZg9CmuQzZ+B0euc
 6i+/wXVNwNheLVPKQdig+OPuBQw8JFAZrhQuAx/XlUFwrBY98GJZTLXld+NFOCdSc+3Qt9Iu1IK
 86xaVg9EuqB36dkPF7g==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac34588 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: QykHGm72TMkTOUlzRe6cLKbYRPT3WxJs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfXztN3mUSlFfrj
 k/SFy4s5XtpGJhhQFrEiYd/a6rRwU2iMccOXySvFgTf7uMnNeb5QSal5YLxBFowZEh3WoAXQo2p
 mpDeHj+PwnvcfUzEeb/j2FcsqeJV11Y=
X-Proofpoint-GUID: QykHGm72TMkTOUlzRe6cLKbYRPT3WxJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050026

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

