Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE7356A38
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082219; cv=none; b=aOQvGmQ6ZmLaO86sTA0EdRkBQli5dFCWAdhSozkUxhCpSEEBlvXPpplp6/0MBFKgtgXg7d7eG+/t541E7f1kM9Xn+CfKBtMW5foWxbRGUfy5GvfgIa0vpL6c7wb/5Zg7bOof/VW2v/ZG5q0RuYdJfeZ6XMfYBalPigsHAS/AhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082219; c=relaxed/simple;
	bh=WDKdODQnX8YmpWUSjZe8tftJ86Tlnw6HDxRaNSyktGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jKRmbwxht9sBvNhqWBHzijMCy1jkplFvczepaX1iGoo+YL2kqObeIl1T+M2RR+YRIZ0nQdJs5VqoNuKse3qWpOLrWSkPgNqF168ViRK1LdNqHRVsl2zdKtksfzEnCTS2+PeTqNCwEZrGNWMC8lu/l3WBmDt/k/OSaEw3ep504S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXZFHoo5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENedKHju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXZFHoo5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENedKHju"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTWNX1675776
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=67czAuqUh1r
	qng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=; b=hXZFHoo5zS0Vdk/V4TUtRX0Flvb
	JTVEiwYs6ohD4OJ13VhvjIGMj1jBqmASKoVCLJRMzHk+fUm9h/V1+8roYn8buE5j
	4hMW9J3ZciABkgkEMbu1xDdlmS4nYLfgBK9nOXhfNp4Js9vqJOn2PiTq3lur08sH
	iAa9EwSS1IciznqvBqMTouKakCQc/0z73iGN0XBA8bS8IZxKScQ5Cg+K3TgjxuzC
	36iJ9M3d1mNObf226ZhUVK55vSt43PLX0/uutBXB8vAoE5cwdq1q1HGs0S6h8jO+
	KUbuK9Lj/VCuoThTvGf31TOK5p/f3FHTl6eVoesompxuACgcS/F34h/XizQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx2c2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso4433845ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082217; x=1789687017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=ENedKHjuMmccacD8qLbY57Png8pyLiu6aBWsLsAFIQeaY6Uk6peJLUGshGRjnzh1Xi
         3ReYPDvfOS4bASPtM6QdgzrsrV53A8PqeS0Uap6CXbpqSIQcpndTN8fUlXJOkamAGEEV
         FYt35Gj9ONf0NkJJEL/r0yGoVa59t5+f8KmNZU20Gkb1FOvegt1bGSxOBNxOLcIr7uPi
         QXo56uOWm71D/BuagJNi8ZjwiX0bxFslbTEGU9E4yb7jRuqtob6NVJhepU+wT5HEenj/
         d0BPBQ6FTiA26v8MD2eOKw7SQl1o3hjJYzJD+DOvg+tLpw4hB+cYkHURqtCDrob0YQVo
         +Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082217; x=1789687017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67czAuqUh1rqng3/RCVOZLghTGIHqPCTo8SlnOqGdYE=;
        b=eVYy7FFtAdAFGWvxCeONaIaIVu2fz4C4wpD/tNNGhcn3askOeaKgivyoWHuHSqTLWp
         sx4tDAkTuQsymx0zonVA4zTLBeIiR8IQOphXHJnr2n5MceKO4i/BYwitcSO6n50WFTHm
         gDw5zJ/DCTT5KKwMaIrWX9Bg/xXqXFIK2AZ7cRRTOfnkRmnKmrFfdoeqJiuak1Nye2mN
         99z8A9GZ5sIuM7aSi94v0wKNc5Un9urEXAmqHWo1uqUpX6BJbN81qLInOckEnTKJZFGr
         K8QiXFaAWUbu0btvt3vkQnyU0bLSWUoZWBc71PvkSr0GYaucoqOZXBE+2h0iFfSU4K+X
         R0ew==
X-Forwarded-Encrypted: i=1; AKwUvBxUFX6QeA+IupqAG3fVkyaEMSGXykW5XsG16YYnPqYPkB2puRE10cMLkgsOnKtPtyZh+sFtAtKScHmpZhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mImsiYE0jy2geYL7bhrdqI2BhqcPg+MZ4G3njKVlUrzB78vrt4
	Q+M0frIyAQwpVC1PMwm6FffjdqL6ISsLhjj2j37KLYdvqHCzAZ6FIK5b+tNpAoAYnInQnjd1ksO
	0aYvx+c0SSqVzs6go4kNff77iq6pQlgfJZEQkhdZPwoX/fM+Uv6dTD/DV4lt/K61icVg=
X-Gm-Gg: AYBFou0vLS1qdBejqzgtd02mGh5fXJu/9wZ0wSK28FpwHkEaZ66iq/ZvnBV0zw9tHOo
	X7ludrxALrTQC4oR5aenbOiSqLiUig1H3uvzHNGqsdBeeVNRBNPvKzOjkhxxZRUXZmK/vM6GW0z
	4bW6DIbVR69VjOY/mnQT0acLIllRH9lSGWXZcHwBR5i8BVSP2+8VLg6mKYJg45A9Te7EcUPOJ+7
	kadlnFv5RY+lC6+83Z2XPmk9VKNXXP5GDe4CKfBNqIOEYM31OQUixRjeOzIrMvAsjoXM9ABEBGU
	rYC2HrEWZtuRkWJaRyr8CXJWDbj+REpS1eGdrZel38BtyIZ/mNeSEbUjtNzU8a+HKloo8J3WHaP
	YYr9BU4hvvCsciWorQb+b1jEwrLfACe4WrCYm
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82662065ad.20.1789082217167;
        Thu, 10 Sep 2026 16:16:57 -0700 (PDT)
X-Received: by 2002:a17:902:d4c6:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd0eeb8a59mr82661875ad.20.1789082216766;
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:16:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/9] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
Date: Fri, 11 Sep 2026 04:46:34 +0530
Message-Id: <20260910231642.1794948-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX34Ho7jEWiupK
 LzEg46jhNJZDxa+uamkrlxn0Z83hvMuBt6qaXyPoKPXv1fQ5jJmE+e799KYd4ewfCWtTn/GEhHn
 kDnJ5amuGuyu5sz4Stb+AH5VU6x24hrBnWpzfc0NsAEKHWoAG9ZaOccHg/+AHhyhUlVT6qG8obc
 magh0pcbh1/gysA7E7g2YwIAjCFbI7POGOQIvy13gMQeaoGS7s/5AnRCadKnMpH2CJLILEHKUZz
 o1FOx0pdpvuYI/wVd4Rj6kqP7UGolTS5ZfvLVZurhR3SUsnikQdB2xMRgz2ZTMM/iq8COUhNxhh
 jLG2lF8A8y3aBppzZQCXEnWwiLeC26Y3g/QIkexz1x2eTRap9qQQbMFUheVLK7jWc+Oa8vRXaYP
 SJ5rjRin4LCUaWlf/JbOCEInMh/J/1TDzaeoylmxEwWLAYAvb1+KvnQ2lW7oTj0+2+3owpJNIn/
 7kw7kxA9vXWfsxHyhRA==
X-Proofpoint-ORIG-GUID: 0T7TX-7SoSN3fu7_3hNn3ttVYuMDKcXw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX7kWzIztejFmD
 NwzUcxMVUlboPDS+/sS5JE6U4lKNdhpugl+nRfY+y0eSVN5g324kc9Rx3aeQxEnUqRr1Nfiqde9
 el2filDJDujcR/RHtHKDEffLgKkMkIg=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa33a69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HnBwLnbP2RCvDO8bWWEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 0T7TX-7SoSN3fu7_3hNn3ttVYuMDKcXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:
-- 
2.34.1

