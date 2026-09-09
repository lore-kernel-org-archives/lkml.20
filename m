Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8D3A9623
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938304; cv=none; b=hVSiTI/nVJoYYDybi6mk11LvUyErvP3WRUD6Eec58nW+Rxwy67N/CiK18ddRsqTnxOei+JjopNXC7eLu1DmCOBGwKCC9nIh6enTKA9JXPFeZRN9uLy4177GoIZFzwG277kgdpR7Gxl13X9cTtYPuQBLi++Wk1zkSZ/cFaWKxbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938304; c=relaxed/simple;
	bh=2K9T5kmE6AKc6cTf1uKYmWVZGg7n6bUGYCpV3ZbRfJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gynm/Q5ybaMq5tWopVb+lLBURCVbczC38YXCc7c10rZBEUCkd+y2wLsaERuhl3pQ/VLFUFGd1CZm0cMzNYHEG8uOEKJc4HBGA9XacZsVONvpGIzSOJsMjHjGuMmgZlvqSC9AGovdMzehsr2f/wni1Dt24HuMwHQnBKj2r67uJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSZ5VOzB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klOZL0pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSZ5VOzB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klOZL0pc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893rCUQ163960
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 07:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kN40n70u6apLNjkgulgrvq/+94VQK142tMzMlxCBJ0=; b=mSZ5VOzBml4MnFEc
	vTZ+cZCuIpezkCcuChB33lORiRIizqkS+lVRP2f1HH3adr0M3u/QEn9zYi5E/XjI
	sXYjr9vaQ5pPP608fHyBEOHMBfZq6yLQLgBaDP4j1sAdtwK+8VHtj9wAB2SjP7Rc
	sO1+nMwGPxMmL8AxiUnGahPvZ4Beikt7M1ZiTx2wzPNialgPKOYytDy1vLjDN+CD
	mSJwBIt/f507IRQc7svsLRxw5Mfk0Wt+mWz+dFS+zF7lepooV4pKSJjatxTfzyMu
	G77oRIwVR4Krrj2kDYAl1W/RjwZYyVYjbdBAO95JXr1UotpOn1pbthoMyeaj2ZKp
	aRpjvQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjyxm0qyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso2752353a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938300; x=1789543100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3kN40n70u6apLNjkgulgrvq/+94VQK142tMzMlxCBJ0=;
        b=klOZL0pcteO3c+4RKBRsQau3T2gpS7OCj5jRN/JNcYheUhQqmgA+ERu7jRm//tkyKw
         /hI5HpIqy7UeZqAG14IYr+gxtty73IewskPR+vn9Qgf2Dg2DeV+bVRIEKUqnoa4CxHs6
         Aw+HSg72AO4PFpBiGdv4j5fUBR5K726rtj1pclkKNuwHXP3CzXVgqCiUmG7HvcDziNg4
         6W3+ltd7mGJSfv4VsIXDyNYOJDuBnzOzf6FRBYpY4falNqzh8r65xWKnFlDPspAxQhpx
         RnUrz74ig3d8MLHZAauqhD9fRbzgMZveCOE8eNyPiqL6hDY5Ov/4BPVHYkmpxtf+pHWR
         Ui2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938300; x=1789543100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kN40n70u6apLNjkgulgrvq/+94VQK142tMzMlxCBJ0=;
        b=F8ztyU30em6UVOr/CrR9NsuPSfXo5W/gHNOPaPxEom5Dz8ASfA4zsN95IKKz5j1aFn
         hvQO09ZuWcOjo8BBuIWUhoRB5AzK3MIOvuzeJOpxpNWQ4LokCl7I0T1BQalC35TORw1t
         khM5GYq1h4fvczS1cY2jgU80uhWDgM0wzZQzrjl5vJ1xKLMvwl9NUfLlH4pp8YpNbVyA
         N/sqjubcyyYuRZyvLwaj9ZbvDuMEDkuoGqeLZ84bnXTy/GmM6pav6OV5SP+QXQZvZjtg
         HhcU5TC1e53pk0eRaXEiRXofvCUswbkEea0/jvhlCabqV7KrUWCwso1I/2hyOgWyTma3
         P+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwxgclBf8/xU4A0Hpa2YUzN3VrOJfdMUdErOiWM1g0RpvEi2jDnA1AyEQ3IJxoAPnOMWU74z2mACEt6pxw=@vger.kernel.org
X-Gm-Message-State: AFuF++nFwefb7ZGMJfwmUMwORmkaTzEoF0yGG740RkJzoNyzL/PSsytB
	XCURD6SqgWbuQCbttvLhB+G6mahhTW/8u7Kx6lqMkBNpbT1pVybyGT/9IgVxezT84TZsSFwpoOS
	y5Kkd7wWYedL/UAmAByYVPuQrkhKhc9SosnikVQgzJRKPwWgOLR3/uXK6qE7r3iGaPH8=
X-Gm-Gg: AYBFou3DvHuYebehqZXiSV2HHH/67fi2hQVk9G/GRRPIYvPAW/cO//IvMYIO0OqtQG/
	bIsfVNDllykjOKQFiUzeWyX3NVhWfVhZxSn358KKnivv2wVuF/Xh06uA99hoabGIH1aUeypFvVr
	X53zbZXwXZ/URg+z2dt836uS1MeOQwJxFeSYt9YGxNrK3k2VOd45aFt+Ta6iEtindMMJFPbo+PG
	IOhud+5jWuaxbJtF54HVJc6rEazXW+yG/goHYbiYY4HPRfHCbikTmkhXs6WSbVd4AtIiguu1aSk
	IS1xa1rusLppUNdkfHOVjbKBSKzqW2YuvHVObAhRdI3GQZLAI6GGji/DawaHe32clHtV+9y6hvK
	U6Pm0CXjLwGm+vcJG2iu7wJ3xTBwWfWyPKCWYq5s99AWdQSOIfcNrn9jLUtK3eaZP
X-Received: by 2002:a17:90b:1e03:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39b260dda6emr47143604a91.4.1788938300065;
        Wed, 09 Sep 2026 00:18:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1e03:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39b260dda6emr47143545a91.4.1788938299525;
        Wed, 09 Sep 2026 00:18:19 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:18 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:14 -0700
Subject: [PATCH v7 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-1-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=2K9T5kmE6AKc6cTf1uKYmWVZGg7n6bUGYCpV3ZbRfJo=;
 b=TIbuviL14IKnmHiaybEfU93QHh6HwtpnEz5DoIhsDEgSib9CbVX+uBTFskj6N6Z5F3FXzqESR
 6XtXl7yWP6dDlQf/fAnxa6NUBuiUv+gt/vbZY4NEzmhyWFV9vF7t182
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MCBTYWx0ZWRfX0BtKR1vRG1h5
 IrOyO7/O2adr4j/iq30PIHq0YbWozXotaOktP+eBHCYHbF8APaOWjW45CxntMiVJ0VZrjmLQqvu
 ruS5hg+og2lX8AttCE7lOWVYNEmT2kpftKBjY+/FxeFh9H7Z5FHPWyfXC4NvEvKov9Epw6kZMnG
 9+Ike07Cb0RXv138HfirHHNwo9FhVf1/SqnGHid3nGgP7PT0YudZmGboboB/w8ToQ/lw+9xspvi
 TzNcmrrhLK72mTtj8GXsFdILEEOjf089f/vX7L5gjbzSYlP/hT26mj1jFBeZykiYpYYPIQsYwa0
 sNraIUxK4VvyppO3wSb7yS9tXt6iB9lKG4h9z9bAMRd40kmJfAncZJG1EPs7/a0dIur+Fao6TZh
 QYATAC1v7ImPkaktYgdWiNuFTWBxxDQ5pK07qeDBlQkjAWm9aGoJkr/8aLGK+HZx59jMhCDLirj
 SX7SKRXDJy/7RqteOPg==
X-Proofpoint-ORIG-GUID: Mi0w2RJTRiSoL9ADzfEbMUonoY1YDR1p
X-Proofpoint-GUID: Mi0w2RJTRiSoL9ADzfEbMUonoY1YDR1p
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6aa1083d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uQHaS-aCY8rbBHERCpsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MCBTYWx0ZWRfXws6Vkb1wKkSB
 vhnQyxuIWdKizxgia6JzTRnc+D+8RBVl/A0NviDDpZtNdZ+AD3Sm8IZiE0uzoL0aASh92PA2vXl
 WvL81aMkm87Mk9f2T+4eAkhCgrpDRUg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090080

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5ccb571520d1..939739123e75 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -176,6 +176,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

