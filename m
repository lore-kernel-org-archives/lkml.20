Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817237C92D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021259; cv=none; b=kI3YloukwJIBn3JScHffKyPbE+jpxie1i86I5YK2xtQnjch1ZrKsCpmhZouGY18v1+njvDsw36jkBuGtoWIfXTZwMysZQUXvp9OL0QqN4BcJeUq//JWImXzB6u//R6hUlvdsmF1xqtd7NcLAYJE/LAXMG/fZ/8+IEBoACYbfXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021259; c=relaxed/simple;
	bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agQ1WgZX2Hn1lvLBU495wq+48gtpUKRUw2HHxroN3kVxuQUfQxLYweXSiF1b4E2uNUmGmfTV6VQzbBPU/UwTGAHdN03nx8stcxN4kHSw++pv+SqF1H2GP7Xqb6qlS3Fh8Hg9QG+ojRQrWIEQV0QD0Rb6kGsFfu8DT0e/S5tM8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpzQDxH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcH1l+6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpzQDxH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcH1l+6Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GxKg520511
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=; b=PpzQDxH0bFF9MsNl
	nw3mNLrPUly0WAGf7d2b14yov9KywWsCEyuq7DS9bF8nfNRkzD72ec1Ci21ElUbG
	9cXPTrxaGRrJeqgwKeXp7DrIZExH9lOoWAUAhhzMLxhHPMvfGEhfHWHqkzf0SUAt
	s8cp3xSB8sLHfwE8fYFJnytBQAZugr//+QBtglusZ7Z6xWlb74WDf6SsVdSwUq43
	GUbBWDFnidIWnpo/UuJ7N/0458mrHwK/yN380XlVyzLEz0imjOmu5VmBhy92ifeS
	7GU0M0qQVTeoEAEMDfS2fGwd7vI+GVorvGwNhgW6nL09fZwlzZtzenRow+9m2q6z
	4bkaog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygjc9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fb956002so98332795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021251; x=1789626051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=IcH1l+6Zl6Gf7pbrHzxm/NT0egkGmDGTrGHbiVEiGQYh+hBZArme28/lpFpli72ANL
         KnWMqlad9UJ5UZOoLu1CNZLHG3VSkLPgyJ1BamC9+/Pq/ZvXrNlrTwHBVA3ZSw1iVtxt
         MATtwLUOl0ODfW4pRixpgP/n8S0CRtv+IEJ8XzZiggHyNfAsrI2noqF7GakAw2SsUohi
         1PXy3ysm6JE9fCV4zDkt7GVCgbrAot1JmnmcAWSCosfI3oXNWDkDL0fd4rcjcAPlBdNu
         82DcgiFUk49EVHuMASiTQHlJWsZkb9q6w1FgFp5NDQFClPYiDW4KH+VtHl1M4lxpd7eW
         KnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021251; x=1789626051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=aK1xsqB456/efgvs6teA8WpT4Yyy/uEvcasWZalpzoE87FpvCDoXek+y8yfhXmCwJx
         rAV2U6LOQyR0iTVY36rRADl+aMLndsud8oaPTqwquI8tEXZ14IXhN2iV7QwMTpFrKg25
         gCk3XPTltcklRvVbby0XZT/Fqk8E9Muot740jftUN2u1SImFRldxnPZvyUUsD06YhzKp
         Y8hZPPlwS3o4Qlb3kzrJRsOEalH4DSEYYL6zDMsJ65nA9ECh9XSxrOeHP2esMs5Q2zdT
         R19AQZ9PGtk+xTqxIQ7j/PKr21ObUVZnPzXau4cgBu/FyXv8Qzd4R1Cue3Gfph4swSSF
         d1+A==
X-Forwarded-Encrypted: i=1; AKwUvBwh76Lz72iB06GE8tH60cpGbWMSyQJY2PJZudfKd7O2PziokgOY5GMtrp1wZ2iMSd1lcdcUro6tXXuYLLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nyoCC14hkGM34Z91zfukgP4RtT0NwFI/phpY0JxPwv7msiygBq
	WTXJCSbLyBPp7mYe7Li/mjB4bqibq3mNGaiJMR3CUX5MgPr4ZS94lx0WRARhFMu0sBd9kclLQEb
	dsLJAfkXcfilZ4wkS3Bb40a5eu1hhK5zh8G6weEotDyrfhp+n5QPXDFdU5M7Hczr/9mE=
X-Gm-Gg: AYBFou2Xa2RbZ+0F36In0QrHt/mOXc6E9OUauETtDxhiz5UvxnXmj/zEboRLoCudkzj
	QHDOYc0RVHvw+4m8Wsnt+11n5a3eoohBctrallbPtC4c6mNpv1LeX6gVC0oDgNX0xCqZMFZ6K28
	Jy8TwyDVqrMYldSnj6PDnH+hehaDYqs4Qp/OxT6RmhLs5XkqsNS15WKzIAQgejUelyuxM4uqGMI
	FmkwclcoSZaWiCL56qRRCC/vdSa+xrkeKgJyqadpEXj4jtdHSuYldzQRg534PoVz8beRg8gmb1v
	twi7DVeWU4EJ8JuDo9zWkk/c9TPNT9v/EeeErkb6ZwOBqHKxwGFFTblftrwQynsHVv5HHHsdMan
	BJZGc6grOzAEAD9+DIwRxSACjAxbshHYLpFPA
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352995655ad.19.1789021251554;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352994935ad.19.1789021251041;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:50:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: soundwire: qcom: add
 qcom,shikra-soundwire compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=1210;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
 b=0xilDjFBxsdVGeNOVdonbjktJDRXI1p8o8P87zKqhQ3BL1MRfRpqIcESAoPrXomaLwLXuTaqj
 HHLDsgWuXmeAjuSP2dci8Pza+Rqzo7LdtekQgCeJepulA7RSH0m9moL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX9zM+oX+XV7kH
 +T50D6jYz3vDnbrno2b0viywvfFXzJZfgMSqUtBC8iF3lqDXqleep1vDxXumHDBzsqnIm9keny4
 84Oi8bkS1RjVqaswqa8aMFQJLXtVIok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX2u8/Iwcs/Ess
 rQuLE50q+H252d6Md+Q926BKsTWZCg3slHo8P6A0ChUc5E2ANAY4hIKQGUAtVK5nHzr2nPZcxYZ
 Det8PNCSlcps4BS2uJrZTk9Df/mKOKI7gBVXPqyQ+FEWh3f86QkZJqfKjfDj9GZqvVnx4A3yu1S
 rKBMopyNtg2oxT2Wels/FF2U9m4eTw9q2bF/vcQ79a1u0tTYIu4Cr8TIDNDW0sudK7Av6IG/vEr
 334gQGbq/DNG3bmfg7JK3++/dDG/VVr078NuyW8JE2QF0oK8NWzZ0N0rm47e+SwGKni9QQe9shd
 4qSQ2Fh3TweaWLXaTcvaqAnZYpk1TLq8Be6a0QnexatkIxxZHWUJDc4QtVWgyX48igwzfDl1TqX
 +p6c/h8DNh3cLuxNNHuD039P1kkIwUkgRYw+4BzHAuD7HGZnFHmXVfOX1wkw6b2vlXHzg2evOPt
 ytWXUF+uU7fu+pD7nVA==
X-Proofpoint-ORIG-GUID: gS8eepvvqrBZ_zMPY8Yn0G0LvUFjy3em
X-Proofpoint-GUID: gS8eepvvqrBZ_zMPY8Yn0G0LvUFjy3em
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa24c44 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rFUVSjzCmDUomrWsWBIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100064

Add qcom,shikra-soundwire as a standalone compatible for the Shikra SoC
SoundWire controller.

On Shikra SoC, the SoundWire controller is assigned to an Execution
Environment (EE), which determines which banked register window must be
used for interrupt, FIFO, and status register access on SoundWire v2.0
and later hardware.

Add a dedicated qcom,shikra-soundwire compatible so the driver can select
the correct register layout for Shikra at probe time.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa2..81532cf69 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,shikra-soundwire
           - qcom,soundwire-v1.3.0
           - qcom,soundwire-v1.5.0
           - qcom,soundwire-v1.5.1

-- 
2.34.1

