Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A493164C7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894204; cv=none; b=VInEPk2EypqoJQbMlH6ZEdwjctHJKcM0MYKWCcBpNk3/jrtXBmwPUhgfwTAxR1ty3RSX5/Qi4KjSB/MdPkuDxWRk5GCXP6s7NkqkyZzigKGSBpct0h/BzpxHYZdTD+SrRLIZy48tRTVol8nwDxoPQFm8BoKnStMTihackObDmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894204; c=relaxed/simple;
	bh=yQoh4B3TH/uFnMoxO5cD/A9qDqZzEegxSBACB5gc4Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ad5r2ULpdp4iYOZHCCfmFzT7DzbktJW9oqCWNMmPwbdFfkZZFQZMR1vJOiL/H32RL3ogEAgQgn4Oi5tvm8DoeyBqkkWu07XNWr8LjIC3RDcPTkpTwOkCWxsc6kqy45BDZ5uUA0SPUQ349KVdp3iypcreYqDSiS4rjQDvXyC4uEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0s2ntfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqbdAq58; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0s2ntfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqbdAq58"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Wed81893887
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kod6a/x8RN7
	WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=; b=f0s2ntfdhpYrztm1M8tc+HRyYgH
	kz21ZPCTw4SXolNiE5B81DNM6lfTeUA2oqnnq8WzRmbeoG8ykxLh4KFT3axcUuwt
	fsgEbGy+CLpU8RbcFziUDbcs4rISgyqilfUwc06gLrwU7eBvQQOoR4KRh9YEEpum
	HJHoDdU4uI5XmVsOxAYo4m3CrDklE0u98oMOEYESGcYMzCbpyXsLDEkUQUeFDKJw
	i5px1QNUxmGT37oCGdBWlugSuW4bLAunO+YDc3jNYQtgZvPucGo1HweaQQKVTCA5
	czwW13ch72Z/tje5jH8v9Qg05fKcFGkTmCcXL30LMDXODSKvsy9c9CKgwCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrntyut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so29795465ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894201; x=1790499001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=hqbdAq58B0dFxES+cxwlwXSyYjCjwh5d1ohlquYzrJYAh/wRFmKt//sYt4pYeOAciF
         l6Medw2U29pJxMhGPvweK6rQ/MxFoyXgglzixhGUJTU/ME9cvfFvh2sSCSI07Se34YgN
         yw7msg3eKh1jQEeohsUxAEEUS3kX342/WHttEHJ6xrcVDjjMOb7LIFQjbxwcfHfvwbxq
         Dqj0O7xARknI0mG6AfNmu2ca5cu7rqXiUpNVASqeI3DQY53jtvKH8ScilvQKU418nyzt
         BzI6D84youiAEKTke8kljt6GkHAzS+5Q2HlfpVt1zCST6LI8BxsG4mMry2hJTqInwc3f
         ix1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894201; x=1790499001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=to/ZsnP5eAHlNTks/G8aUscaeQTM1wujgnG+GEg1OFYDbS6JHV2xfoaYWE+0WAKQ6+
         b4yDYUtO4IR4zM5mfBgEVZ2iRxsSg6TAi81UjvGhy4wKyTwGVbyeUuRwD+LdUKRNpkJs
         Ae1dPNk5z/KIAUjN9mpEgg1kiG/khZD6HJH1OkkmvoKVaMiYapbbeufRmvU23YikOGBF
         Pl6IGLnwG4CKqe9OriaN04lg5FB/EdjiVE/HVn2dXhCAEX1gas4jRQRCxZ7kKTQLcrd5
         oIxSnkB/DcNZU9OeH2mCA2l+SVFkZEuoE8QOORWGKZ+C6G+/vo5+b54iWTMWGC+3C0VS
         5zQw==
X-Forwarded-Encrypted: i=1; AKwUvByXwwgUo9ySJ2q8Q2yONVrvKPOm7yJ1+gMptjaFIHTi07rMPxXIEA2WOcecztXonaSNPqU2zgSAMALh9uY=@vger.kernel.org
X-Gm-Message-State: AFuF++lGSveEqKDUqEoMz/s0vluy/r9F9W7V0TUyAeAXMhRunUjnjdhH
	bt3RlVveU96GXKv24bO/Jx/Rv1PKhfOF1hrFp9spapU5UzIQN3e8m4zb6xGv/VfhmOUyV9A+LzJ
	Ym4s7kVenHQx9Hk2LCz9lcJeSolblkqysn9vQG0CY+RjJ/DOzgco+I9DE0cyJ69cq4+E=
X-Gm-Gg: AYBFou2cC0c+UtytYgvSYhvrplfzXhvvkgSb0koRoLRAVaZfdMAhZb2AFSILqqQXU0w
	72pRbIvm3+UqVyVF4MEnyJ6QqzkwRIKYvPC1CMof/wSopFnt60DTm833o7eBdAJhmrGC+cRXZLA
	WnXS0lcFvref0LN9fYuJ+C/0aYfwjaWnlJv7HLcL1STQtpMZ8RQQELvgc++lUj9JSfWdXzyvGWX
	xIxqkXWNn28DjjqzQ6Y14pqpFphvt2G6HOUJ889sDtNg/6ZWOXlExPzMEapaIvWFPOq7lJqxPS1
	FKsN9nNpGwtR+r94iEoQDbZbxBnXfqmJX9QzPArUktwcYCxxMvm0S0iEpbuAK6Rlp1mpqF4VMuL
	hm3nmOxzjhj5dfp9OwFyPrpNo7A9PdgIwf6kMFcze5d4BN3ufVy+CINwutAyq
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657975ad.32.1789894200478;
        Sun, 20 Sep 2026 01:50:00 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657495ad.32.1789894199649;
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Sun, 20 Sep 2026 16:49:19 +0800
Message-ID: <20260920084920.2201418-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaf9e39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=O22JRHuKkM2UMjjIyrMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX4NIkIsXzeEuA
 jfXvhtbiTI3qsBimr1VzAPtnd0/UhP21Gvz5LzY/eed5DzVk0+PFbQuMmxljRIqH8JYGntALJhW
 xkuxgVLP51l3Is/UJyZ55C74Jfe2cHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX8JySi+6wm/Wh
 ZF5eeE99E1vMbsRh4Xm8ZmnqZMCBg5IwGQYClhU/niUbPoSDfb9lEcFZUYu+1Pp4Llq1ja53PUx
 IYfGXF9Qff993wY5V0sCvzkiJ6mjDiOdojKXUPmIj7Hr2pzgD8r0W0SZcN+1QMzQUKrVwDNvb4x
 prSOUY7Eb4ZdVMZDuExX7UcBDOESLYvKV+QBljwhwKZapgJBg0Czvxp1eTzNjRPoMUY9v8Cx2X2
 K/7RxPDtIwE/5U3rLaWWfLPb9qE1L9sH02bdWoDew/ks2Ppwhwp81XWc3LTHhm61nxysUAI3gsl
 Falr2ehG4dWozPUtnJB7K4POsMuiDOi5AiNAO83tGMGEkseYO4RVsxEePs7RN7EWmLXnfw1WD/m
 j9+2AAvB4nfTG/+vgXot9WPnq+10gg4lnfSAt5JiWhDRFXv6kh4KhwZzBX+XRdipuZft/3QLek5
 hb9ZSG6uwA6WsKo6u3A==
X-Proofpoint-ORIG-GUID: e3SFAad8crJpmo31udZ6lHcBSqx_1ydJ
X-Proofpoint-GUID: e3SFAad8crJpmo31udZ6lHcBSqx_1ydJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f93027caddb4..07ce0fab5ea9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -413,6 +413,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

