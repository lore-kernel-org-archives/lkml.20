Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D60480DCB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390854; cv=none; b=Xe/vZFltgjaT8SR+rL5Y7xgGGBYpiXXIyUl3FgWMLrJw4fzZDEVzL7tLWy6JyBJYTbYb8YbFhSlfhw2pvNpXuEzIh82MB5gK9+uB0vDcClZsdeRGAGxb3wri9+2fpG3xshlNa5DjFIOUsV2Clvn+bPjv35laTGaVNhW2UmOo6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390854; c=relaxed/simple;
	bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWxLmWmRFMS7exJPZIaMhO+i3Yfe3QYUDpz9Mt63/l7VD4yU4kiSl/okKj/Zv/atn4onIRTEa0SWGi1sloxuRh4169MFe3ryTpkuQj2L0MVB1e01Fdzs15Qn0tDkymUbHS1hCrZIYmGPZXVMJmmEIeWaLW7Qm/ct+H6GCf/2sko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNojXurg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZmV0JKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNojXurg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZmV0JKL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Ww71025791
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=; b=cNojXurgA9MU+bRR
	Y+drk5sC+6uKxo9U3KWD6nWH5P+ximBn88815WdQl4ilNmVCF3NKpzZsGclrZQmf
	mlpNKGGPlm9a5fLwG412NlnobA0fLhIBYJwym/PPF4XU0hAqGUgINC/NBgGtf1x4
	yjzwJPjrICk/+KyJL2BFMl67XTpuldavuF7731wtbF95D3G7IovZKFguuw/6ms47
	16SgkD5bj3PbgTfgN/GN6WPobhOU/kBjG87wTtLiu38QGLYuQJSPjNLWk3iqIILb
	IofDQ5qAHdBzWjkBo48SG8XepjFaXeVnJVQhl01KKFk3ng1wXlnTt/MYIkS3hNqq
	nCZV6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5s0g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3d832827so40503005ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390850; x=1789995650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=UZmV0JKLIvoJX7/9hLjhQkf6a0AskRPWUcfUxoS1m6NkAIPabkz1B31D94/1EOp0mC
         OyB/NzI03yre7qtGXF+Cl4sbyEOJWte4SSnX1hwWygQ+YNWPp50OcnPRjpj1+14zFGsE
         VzsSsP4fDqd04KmyqyxPc6w+YVaLkHHKA4XqDcemGPnBAPiJuPmKjj6yhNRL9n6veY9+
         58dbJu8+ZS52erOlE+BRrSK9xQJOF+EO9fWyFoVcR10yoOpknRLeiuV+Hv0IlmzaGBJa
         8y0Pcz9y7I+damwOMaVLfu9qDT+bHDB8TQWA7dnb84TPcS2WXj7gFqIIR4txLYD4SmLK
         PbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390850; x=1789995650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijQGpz4rs8FjLuQnD7R64L9WUl2bI0uODBu9d90WLPw=;
        b=YyAoVQtROl8jiOgCiGyryKpjX8VbuWmY4wSmRTfyIoCm9Nvj0DsHahIr8dlfhtdkqH
         GiAD9Egfb9oWgk4+Z0Ij90ZvW2R7dkekFqWtWeFA1GrzgfklJG+5xDUyzBjBAOl4x9tr
         Sw/SYMqJONPwxEVxcGCRsLDG9xoO0hPhwWIPMgk62GbLyZsp/Gsofr9K2PqZZ3QwbWGf
         Ir+QARpLq8ixhLCCqZDp/BuOJi2qLfkUUtlCA/j5nbw2WhEsRAFdFkLom6zF/aiExg7I
         Rx4lSXHbgocB/HGsqJ7tVqkE3A4nsaShpm3TJbY9xAQyu8PFia36uPUmaC8th3viLkaw
         tWoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjwFN7FxyKphKHeoc/Ugkzi9TDzY60sfEDAGXJH/FP1V9zNe6D2hlsjxy8wPBb41obRx7qYvrmDxsVlvA=@vger.kernel.org
X-Gm-Message-State: AFuF++nlvoof8TtCQIQ1WUp/x7iIcCAMnBUAXrcfiIu2aL5pMYui2Tcp
	cN/gbQdNzZcGTtEhpFGecbff4PHu/lZtjyDa8peUK8E9cbj2D2RTUIxxB7HhDHHV0PT5bbXblkj
	GVogSkUE6YZRxY+SMWmK3wrIyR2TOWjcpixQ+qdiV90ZXJoazt3MnsdCTN4wfknX5dto=
X-Gm-Gg: AYBFou0Kx0EKgQRurEugkApQlFyKZBfqhxsZ7tCbwdjbTSP4u0vD96jZugjOtNtoFVN
	7plsZvzfCcOOg0hfJIyBwGmaVvagiZ3SRPg3CB6JRi879u3W7aPXDWFiXuUck6qinckkq7aJn36
	XKEqTiMiryh2//umMYj7fNKnuBoTiTfn6tf2lkQaE7hfIOkg8KT+I1Tolb2tzp8bbXJ5wtdm1ll
	ukcCMJT+z4i9CjWmKLdS+QgVNClEfbPGCh2HPhqdaJNJRNoQbnu2XubPaA17CkCJHXCf7fty6Ji
	A00XlIbfm+apQ2QEGoiTGRoT34iMsA9wn2OO6ZpXukDxQYoMX0DMk6lFUCFpeT8WoZ1WUvB2KjB
	eGNbBaRmuwBMgDVJLiLWNHAVKHSFXBezIOuOPLSbZT2KGL0IJ/23CTlNPTqxXrS+Me3hPtRC3Xr
	Y=
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45496195ad.15.1789390847650;
        Mon, 14 Sep 2026 06:00:47 -0700 (PDT)
X-Received: by 2002:a17:902:eb83:b0:2da:dcd8:713d with SMTP id d9443c01a7336-2dd6c6fd8admr45491345ad.15.1789390844637;
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:24 +0800
Subject: [PATCH 1/5] dt-bindings: media: venus,common: Extend clocks and
 power domains
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-1-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=1679;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Fta+Tz15bh+Fp6unIraecN96k8cXVodoMPMtZjdanRk=;
 b=iwSNuOPqbJv6D+SAiDEBHreRUNDZk+Ew/pQIyqqMSmmBcRmRvQFx8uGMijxycCtrhJkTwDgqa
 oygkshC8yPgD3YxXiTvlzNniyUi3PJrp78lXAPC/2S7xtz8gG19epPF
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX4zLtx2rZRM9j
 oICYYDW0ba51Sd0ERO8gJvUXNcvw8HscpNZyIdbugtBZTBooMTLi5xoIyK1CwrTFshmcTM8GWgs
 o5xPev1hN54LrysYSa50W30iIb1mgvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX+IM0plnSoyfW
 wqG3t6FE1YpW44lWoTrVynwMWY2zCYdlUzRr15bonKkP7GaDGmOFSmX9fNSgF3dTO9yo+DxWuWE
 HtivdosUWo4Y1WXwa+HSjzhyWuKdI9BaF/37KG4gDDb//Yjh9nLFphT0vQAd+ZswGyFaPlMblVw
 NLfWRL3NY5j6dMR3Xf7t6hFTb3JzAUwAYQHJhggOsYjlccJHvrBZ8npTDr86xKfmbn9nwVb/zNZ
 dc6S4HR9gayK9f4eu+Vsk4LIricQjaAhRCVuJBWGNFsxrD0McAgUVZpiqObcDe13YAPU/gY1oxP
 TsjGuDPF4z8IBBp9yD+wbmfmSJDA0btO84/GjcuILuQqBIrq4fA4OBg6tA3pkw6gZsgQSAOscIc
 szuEeHzY77Wm6dcgmV03PGnNPxGplJ0cRbo6FjTVoIPDT2XCVimed6x1Fn5XEhFPtJg95L3dOpY
 t3gwCOn8Vr0G5r3xnqQ==
X-Proofpoint-GUID: cIKuRkALaflDXm1m00rTzETt951TrGFk
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7f003 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t3Xd9w1G4aITJWInbQMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cIKuRkALaflDXm1m00rTzETt951TrGFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

Upcoming SoC platforms require more clocks, power domain entries, and
IOMMU mappings than the current limits allow. Relax the common schema
constraints to accommodate these platforms:

- clocks/clock-names: increase maxItems from 7 to 8
- power-domains/power-domain-names: increase maxItems from 4 to 5
- non-pixel context bank: add minItems and increase iommus maxItems to 3

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml        | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 68d5e592a028c5eecde04ce72cd5ae6815ba5c82..795ecca21bd6bd05b5e0dd610c749857d22ad1cb 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -20,11 +20,11 @@ properties:
 
   clocks:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   clock-names:
     minItems: 3
-    maxItems: 7
+    maxItems: 8
 
   firmware-name:
     maxItems: 1
@@ -41,11 +41,11 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   power-domain-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   '#address-cells':
     const: 1
@@ -64,9 +64,10 @@ properties:
 
     properties:
       iommus:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
       iommu-ranges:
-        maxItems: 1
+        maxItems: 2
     required:
       - iommus
       - iommu-ranges

-- 
2.43.0

