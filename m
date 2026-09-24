Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFA3F4DD2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230225; cv=none; b=duyQmKJBTXTekB5lPQM7U7VIBbJ4IrdaMjg/qY/rWl0CDrTS7ak+ajsJLzo38NGAi7HUNS7oGjbzQkS13fEQBc6kSJwOPu/PAutLSOHJAtIg7TaQUjtWWqTtfPfmoBgeBAng92ziOU0T9qVdhQeiQ+4vGPszQNtpuX9wdq1rXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230225; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkagFigjrMXzouwRhk6K5V9q26EOs7cLMaReM9Dgv1Kzl9Syq6l95LY+stn2Tv+6USOB/lsQt/BZHWvEVR8FEuBKNilfyVByr88axrWKbhBF54xtAiNmhGWrXJ0irxyi4mJh9wfYyKdgzEzNSt1gYGqRbcxX+00z//55MVRyooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0NbT0FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Xx6sSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0NbT0FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4Xx6sSb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eWta1741995
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=S0NbT0FZIxcuhKot
	HDtBPzTEh4ryyTu4nJ6JZRXC2cku5E3yg4ow69g55l5WYr/a4l7p5szRhVfOrnPT
	L4GIJwkx18Ubf2ALsDP5oCF/hvgfAtuWGnW4u1NZueL78mzJBbf2DZ/9NiDNrjMf
	6ZttFXCUYyNbCfal57g/13A8PVBVpaDY6jNxmyZRrHT5kGR/CIIEXX0cf145cqv3
	9UF3vzp55UkcjYqaGseD122LfGqGX2o27/9mrVnCR4LtR+EwEA8wz0GoUcv/C+lg
	zAO0r0ErFftHetMlYJWY5mOs9sNMKBZmev3JwFDjxMX+N+gdYLWpzUJ1jysWcu81
	DU/5Ew==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbkhxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:10:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so2379046c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230222; x=1790835022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=I4Xx6sSbNYee5Is/4CVTiopl8JXUSSXAwwCL0ByhCvD5+kqcWiylnfylojdhxb7MVt
         ZfLZwTdQffCjGr59mfZ/VGqZDJRVhAciXALJ7QPpFgMkLp9ysi0yWP6VEaBiZYndjz7S
         AM6+6Pp9ym35jWcOdCY+GJvQomr515o+IaoamVIqmJYN5JssCLtEHnencoZgqL99bPYJ
         tm8hzg4NeH15EyzcEGSYsErqHl2my6iGvKuoZuoWEW1HE+g21qU6Ghw4TFYfWIU9oNDg
         xzlgXQXGOQAsZRaPN3VWCkSHVXnsNDNMKd/zBBw3srF+f6pwfVjxoui79gkB9SkgBLFV
         4gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230222; x=1790835022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=Frq1VZ3/0YdLTwymHtYrPGc+PRwd0Uub8PROyPfTb4gSK85qQ72P8kgVuF9Seg8TRm
         gODYaHXvN5NxFNXZBV2pA6sTzmHhKv+h2icUA7bstXlTc1eUPEOUA1aP0QyG/zWw8Dzv
         ZICt7YoiWOcwsbgUr7JrptmgRq016dbLVTzZnOHu9xsZ6K3OLoWu6QNZFMyCYChmA+c2
         tXsw83Y5k7J2kj1bcMZTHQocEbA0+6eDvCjIUKO7dNMWvznEOVgb4JCXn/Mgl5M8SJ48
         mfKjxPTALTEKmVAJgtcp6xX7eWywxG0/xSHa5eKsNUTjMtUVBfwr6lqNDmatayQAaXjs
         E5PA==
X-Forwarded-Encrypted: i=1; AKwUvByCe/ClEhXWQVr9O2DCar1HGbG/KAMILHdfpoXH9b00yWSucx0ZW5rn78EUwVha0v+vdiLgYrhu/EqZze0=@vger.kernel.org
X-Gm-Message-State: AFuF++m46r8QKV9ejCBgYdi/9UscBmNkoAUZ8ae6fV13T+WY1YvFfOIz
	jLCqEcPtvm9tQMOBUKRX4KE+VISWZaNYVJ11qfSAoh2xPyaTKGGwHUSqcQnDQn0AQCgxeo8/m2f
	fdfS8u8+Bw2R9DHpnCz9A8fCC51+SwfnL1eVOqmQwQJxTAfQiMZce/q11RVh9kZUz6ns=
X-Gm-Gg: AYBFou0mVj5GW22HQrfi6UgbeGMzfuDFe/rmGRYBy01FBBs5ReoCMBGFwiFGtxijOKQ
	zJH2qYKdMUWg2eTZ5zhcA3OwAGipmf1R6sOSfSt2xh3fuE9FCvTwdsO9uGIb4RIAO6SSTK6TZQS
	kOm5HAPyM/vpzxLlnX03rdfIpVdw76iQj/H6a2r3vZZqfw3inif0FsetBb3jzULdzfIHtSm/bx8
	s/58iGzG4FIyRw5A6MhK37Jz65/oiXbEwTkY98arh/ZoUJOmYhC9Ya2146Wv81dcDfJ/Kaw6KVs
	vYrfP4B8IskGf90weS8xSgzQvlkVBfSD0wAvoeIGbu9cBm+sYXJs14hWPSS7SuSAuCDhF9UygG4
	v56tqxgmDxs6XsOYIo1hcEcwbWo/4HbBtzN6HzgDWy0FbvHtutOdtyKbGXA+Jk7DTlig/ca2HLc
	MRtfuW0tukh8O4BwuYCSIZsdIV5vw7
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068098c88.6.1790230221798;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068063c88.6.1790230221207;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:20 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:02 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-1-088e7be0cfaa@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX3CshFa3U8zqi
 HNzoXvh6iuyME80gGJN6+M1AtkP7q644tV7J2MJ07gl/jY1mv1OjPlY71eSIAwMjSHrUA9+z8x4
 KBplNdV02eWcoqKGl1Yg6nNNPS87YVI=
X-Proofpoint-GUID: pimoZX-fM-OI0pfZpqz4j8rlWHYHibnd
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4bece cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX0PRgfHmm2um0
 ccfCJ7mgmoR1SZzKdnVOpVFmMW9JTiCWV966VPTAXSacyXLhhej+7g6mcnZalilNBo/x/2/A0hq
 Vz75w/DfNDDz0zrSZXtrJTu7GwifiLPiRJVJPPjvkJfGWWUitaLIep4ZFP8dnqmLNrfg8Pf/Tz+
 DzO8FgNhnQ1F+hU16RfzX32FQOQMIAxTBPdJPBHizq0hqJDWkL0x+0gM6b/HTj5ovjv67MGIDdO
 BJ+XU1j/rqKC2TeS/oV8vSUrKPbZAI9ezoqUz4OC2BTBj/+MpV/hmNf/Fv95PmzBIFcReCyFUnB
 QZfpXXrn7U85AfED6M0orsCjZ/y/hJP1knrhOx3aTQReFVB5hwMDOn8qLf2SRDm7UNaik+Bjc/C
 PabShv7YHXJJrkFnuJcp6A3JbBihm6FbreByfTzcVB+a64/bgDckRtaU1/72KHu78G2BMTUfEma
 xM+LMqiJl6X7r4rByPw==
X-Proofpoint-ORIG-GUID: pimoZX-fM-OI0pfZpqz4j8rlWHYHibnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

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

