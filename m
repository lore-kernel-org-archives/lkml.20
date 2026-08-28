Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08243368BF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889061; cv=none; b=hu35VKUIkkE8ejrZ5PN/85PPAdyh3AL3XzWrp6cZL18xT01uDhjoh2aabegABrBXZ47KkJKw11F1EzHK5vF+i2vI070Fwo1GkjYrp6Whr/Oh3isHoD+aABYeIB3prWe9rGcahRO/Yd3KRvct4vZkUss1KVS7MYopIqSzVb1D4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889061; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNjAzbXTWXjMRrzF4ZBIO35udcfazef9MAnJRNBDF+cMJb80+AJ9qmbGEZckyKyUo58HqfFhH5XaOE05TMAUV6xT7pZnLRC4Lreng7GrRwaTtuOSqgY7mwzBSsmNVv+hw/AA9rfJR7qGCOL5/NRJI2zuFMlsZXDIu4qtAo58ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfXbXjLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9+AF2+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfXbXjLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9+AF2+J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3JoKA2391372
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=HfXbXjLBQshQXz+sWpgbSt5CBy+
	nWvpdQt2vf6TqXkMgRKydXcK+lsJpRfD/77ydiR9RpFY6bnw/mWNdcGFuxdtM/zn
	70J2Ld1MNsQXUGh8Mk4DMA3OPRWJbbSzNEsa5YsvcUtl38pizj9VJUeutB+YHcj/
	/IQJlVIdf/PNlaSj19H0dxrbkc8bJoo8kZEljZhgwkypA+KI++Wzk+HiCjke2GWR
	LvS7MHiktn5sjRgDcKFERJ0iYDefY02cDPlPuirYf+4OgF3hpopIHh+6YJDG5dp3
	Gmr7yMrO+jX7cxfsiw5ee/GiKvek+pmRPJIO1PhadpqDaSYz6cvd2W+MZXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgvbesk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso6863295ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889054; x=1788493854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=W9+AF2+JFcNRqsqG391aZwjjtq8nPJ8dFIGEXFAlL4ZtAhGmH4ehnyCIiPvaLFr+fY
         mckMzr91Di94eNJUzYI32O5SfRK7vSNJhMuVzyq1YTnjD3lTyVhOrozv6HpBcBGoB3ZU
         /0fG++i8/4xG1BW0gqX0JgKjZmj/gr4RyRaEDjfs/ThY3oxBmRXlrpQoBS2MQ6e3P+zO
         hqX28nnz3COA2j5+fbdaLVMD8ZKov5oX71V/ZX5OPcvpbbFuwLM50KbtDzjAjks2QnWJ
         ozQ4x2WHa4xmpikHgQgW9yyREaSqDtK9siN56e6rbIVDzS4kYnCZum3nj6FPZ2Rrx4Jm
         AkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889054; x=1788493854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=aE8FIWVqgUMcigohK69/oOwBIOzsGbRB5pWU6PVYJWZ5q6eA2+W8TJbj8tccVs4De9
         jSIjW3PVC4Pxrp5MOi0OrS/gvW3U/Mr4bePe5Mf41GxosHUZilRVq8fc+Vzli5frtjfR
         A0h1T6sA/pg3t7Cyb5/pmkonAgwPR3DoxcfJIRUNGKImuAckMiovZHuwUy1NqR/k1uzG
         G+Y7E0A6TP2XEWULpLFWAASUsJwJJcG5r0vXnBLuwSce+yfpO2Muuva/OY6I/4YDbs+I
         qDh4jhECMeJ6AYF+wEI/QoERDiIPgtLU/ohBclPRydm1kTrl34LTl7FyQMIm7tEzb/sb
         K7xQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1kcFJqobJrUxy8XtBJaqeq2eMOXApEx3PwNwr1O/OXGyOUnRAltmOrKkdj1yU1GZY220iqdOZlcCt3EI=@vger.kernel.org
X-Gm-Message-State: AFuF++nT7LXfko0SgYoxL/kmtPeoCoBbIIIs1bIREs4zExL/Wp1B9Xb5
	tVwrabfCZHJzYRBAz2UA8zLBvRj8jpmzGmI4w+HMx316KDHU3fpHBj1//r9+NNLLsIGReJIS+2V
	blWcT/Uo9nbHwsBE4COtsIL/rXQIzHEtifSbtJ7Q/3R40kX9sM9vwJuTowZhWxg2Jykw=
X-Gm-Gg: AR+sD12P0N9mL2fXpHD7AkJa9quGXfvU9IA/M0Fq1Vv0dm8KE+znbQ65TMnaqon360k
	31HcIlQps2nONGJbCwDPlkGeuOU3Qi84yDJtILoy2NecRM0wlu0Me+BjO603V/XGPwSRNgkCUeJ
	o3BQYo6M/AS0KCWu/8WhaqnV8snH7y90qni6WidhWDHVHTgyzvAwXwl0vWVYrO5Wj85DFdf6Y2z
	0ZL74/63Mns8+PU9OyJ32V5Jrn68e7Y/dYzqXkecz7csYk6q7b8iB8HmZhwLTCJUljuQ1n8RLb4
	P2Img1CAYvkUdGEs0ypCj9R4YDIcc+mklvXmAK0gOOtTWGUP3l8sn08bVJ1U+RWigPMU+N8Uulm
	DDXN9L2X0oYZgxf08cEbTP1nJbg5uzRVT5W/m1D6f/Ta37qv0epELXT4oGeEc
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74007625ad.6.1787889054456;
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74006905ad.6.1787889053979;
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Fri, 28 Aug 2026 11:49:56 +0800
Message-ID: <20260828034958.3165-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JLxv2FNuPiYaHWJKX2S8wcR5ijx4nXWX
X-Proofpoint-GUID: JLxv2FNuPiYaHWJKX2S8wcR5ijx4nXWX
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a91059f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX8Sz9ZjgyJC8W
 K6YntREA9N3ku3sl9fyZA3FPXQx21UOsCZWWyJ+zA+OECFwuutZaF3MYxJMV19QfMYbVhn4GwRN
 74CXbtNm1pB2V9UCcRVqrFibC4Ou69iaAYHSvVE/Ee2gXak2htwNnUMy8poPcEDU87LVubMFaPB
 /o2+d92TYiO55O/9lL4bSLEo59rwOo1/ZGEVQV84HlfKrme0HUGQitzPgv2VDii+UX2ErXMK+Xn
 dAK7ZJtxOF9Wm2GP4LKjJ72jNZvPC01PHm9eOAn6zAdsm0VLqWNsqwwJNiYbyz3pukc0d7TGYP5
 iAsvV386/iPS0vqTIw1uFlArTfDkUGgSgbZPKFzgZRNpzhLsDDegouZ2B7oxJkPFtwSov5P6rpD
 UECwEx2od8qDZqfYDz2h7EceFIBAfiuMgEh5i2Cy40qvuyE9wnmZ+xAg3PIBSManyhQSN/zIO4y
 LZTKo/FV8PfmaXJMS8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX+l9B8HUqmygq
 JdiAKjJo3l0s08HziMDTLYjRy1ZaCi2wZm1PjADySSLAK8VMdzzi6CZav55tmdgtYNeA9VQu9lc
 wlpHVT0GKsR7T3J6RfsohRmfQKf8/fM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

