Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEF3905E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376856; cv=none; b=k0yTT0ehej37wC0cdgP5HfYTHKRIsRTYbMdkzE5WKv3sjcgF/sbprqKXj4Ks5EfmUYeye1faBliIvH42QOSbq2neMJgrV97gtCpGkPCQDiXDKgDp7MZQvGoRq/C62mynjB9UFIndv+yEaXZtMxp4okusn8ht0opfJ1yuFlsFbz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376856; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZ71MOe4OQuRuWZoIb7kdHNq8mRp+qqwoIGmhmAU8pa5VKeCAbttnmsCSKpkTJKeSPBhX4htzvPZEUfj25eU9z2kCUHY7g/HP30ruZbnk2S4WZKCpGon8MXI1/qvuZktPe161+V44BJEUBik68KStFAjsJAuH4DehBuk5XfGrec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOkFAgnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jadiCuwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOkFAgnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jadiCuwl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqt2e3377594
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=SOkFAgnW0owVUv60
	CmznAb5++/lvih1mUsHpHel50135KPbEpMJg1M5f0eDuC3r5NFNMpQ3ZfCbEbvL6
	H1XDGYzZ2dt5E92WHI4UYdfY8rWHHBoBx77jD12+lSc6aFWEI0aPsapf2xucCDAJ
	7ISe0GNT/V2YOx61aJfk+1gU0tSi3ZT79iG0Tt49JgFofvkpLZ+rF9LTkdyyST3a
	bTCW3w7JpFUnmzpWpqNyk+OhDlPgvIFFDulBCpuuZ5o8T59/T+VOQVo9zHoamOZ2
	9gVI0kIBxm1NSo9ogYO+whWRIHOCoD6XhZ8h9H++ahD4iK9fUyNc8Nash1cl7e86
	zaOiWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnh7w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:20:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so2593829a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788376853; x=1788981653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=jadiCuwlYv9Oe1TAb7ZxfmMy1e2Rzil08d/Z1y2yVoNYHulkaBkOQhNnmgo8inum6x
         4N3VkoBcMbBvfpCgd/8KxlUs17lLj56eXfF53bKLT5YjdhD7i+3V45vuxZQzd4KRUFNv
         U8EJJrsitTZt3IOcdwSPHSSDJ3HE8HiYY1kEtbHUTmeDofVPGTTQEBDw+BnGmYVYf2u9
         w6KK01YFZ8xVkTosc3uEFVPbM10qzLIDXNy00YrhZr5v3V+4L4DYvQfsdt1gZsE6IWX4
         zSdVrwJL03zxM4fo2HDVUL9Phqy+CN1mYab2h4fwlQZftw3oFl8t6LxuG0r26Kz9TTqp
         ikEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376853; x=1788981653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=G8o3I8dsb3JDuNpqCafZY7GUcqoOdH/KUyK9pwYyLBemJgcCKWBusuIWOR6rCVt4Wm
         zh54wx4lLBQ4FM5PX8O/EWjXwAYSZ98lxqqiDiVVMYEDAwKRIhxEa5gl2o+c4FHcQEuF
         tne5qa/q/BS2em2RYRHpVKXX0+pN54L/pThpInI45LxXwxjbFd7efFcBdXsXj/Gx0CNv
         GPWMNwWE3sbxZ7WcRJXsgAuByNiKRbamU2TApLsMa++Ljf33oLbN0VnWPn2SiZqX3YoJ
         F1B7hvsbFdTBXVIQWb30udv9SciFOrhwkXwpjND9kxYqE1YOKjBRTwMvJASTQ5RqU1wr
         4Mtw==
X-Forwarded-Encrypted: i=1; AKwUvBySO+EYbsele5+SakjbM/hUBNfcM/VPfMz4KRDRx8qWTn5cUPuZtcKWZWfCUSJ2w/iUjxSo67AEfVqr/Sw=@vger.kernel.org
X-Gm-Message-State: AFuF++lhh5UvnlZ2IsRCS2rLrzGnJTKY7SCTZh8rBEN13DxGDrUX5BmD
	kxr7YPkuFhYPCl5H56e9vJNZSBWpztdK6BnP6ZTjH9Ed+vlumQBEu2xtfFndzGk3Bm7siaYKPVm
	OKo0GyV9fd13bbNeAW5KdpMKu9ccFT2e56MjetBfml6HKKFaPpm0Gti9eb1cORHF7Wao=
X-Gm-Gg: AYBFou2RpO/nHOAHSkVvHDlGvZdqxtuwRhY6GY5V94n1pk/Z82bCmUKOskPKECQRjMO
	0Y6Rt40F/TJUjaSeaqVFGR3SsYLTduaDtttcprVpBY+WJc67mYNNQhYstELBFCxP1LVPbYxQcqD
	ZCwImN4Xkyac5WGN+44diOkqOZQYh7kP9SkljbDj+AkBe5FMU5Dv4wq81Cr7dbT1Mq7JqFsBJUN
	v0DQ4oZvnRT0VPhYRepAxbWQqLZuBcMTbda9/1yogTTh//C8NA9hapjX3yRBaUCfyKnc9nvyUka
	D/JjNQz3XyJjU6GH2PR/0dG29AjwG+HOJNWou/YrZO/ZANjT7Q7kgAkqKRoI1hvNz4YOjz5m6cX
	ElmJdf4SX2xdvHmX4iQLugMdrow==
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr9746808a91.12.1788376852644;
        Wed, 02 Sep 2026 12:20:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39aee152d1cmr9746767a91.12.1788376852175;
        Wed, 02 Sep 2026 12:20:52 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255e3172asm244765eec.17.2026.09.02.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:20:51 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 03 Sep 2026 00:50:33 +0530
Subject: [PATCH v12 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-lt9611c-v7-v12-1-9414d2b3bd6d@oss.qualcomm.com>
References: <20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com>
In-Reply-To: <20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com>
To: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788376838; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=2hTtGImPuU+qA7DGdNcu2lcBT453JsqV7PTHRhonrjm9Dk/v8pn8b0et6mPTe20juVXHfeAen
 U71thqd0FuNB91PVvSfjVruQKJaZb4v348Bvv8z/l/RRZigwERGO/f3
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: 0sabLyv1qB-WKHLLaVBfZ7tVRpbL8WDd
X-Proofpoint-ORIG-GUID: 0sabLyv1qB-WKHLLaVBfZ7tVRpbL8WDd
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a987715 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfX0Gw83A5ROjXA
 mXbhvvoO7zmH9RBOYQ/MfnaQcfLe05qsXwfyFCnb84zCM/KFIQtZZvLAReEvKqeVBYxA/TRDhBL
 uszDLaQhWO3pX4k/Tqbxn6PH5TeRZ+gdQFErn/EbHG8ayeM+3D1ZXviScvGRxV2s8mLbccJHxwT
 b8Feqydxw1AO8c7Bl/HwDEa0fi012b1R4+pZ2TuTxwJUDzGo9xFKaQdWv9E3HmIeLItywc/O+1y
 +hQwcLR9YJJN0v1HgJrntEAkObZoc20/sbeF7XcYY+o18nDQpMGlqjJ4YysKwEO/xTayK5qzhEJ
 DMquTi6Hk4Vmilhx3gAbAQCodTm4wIeqlXOOP+ihGduRusQHcFCAsv+tAO4EdGntQ924I+JSUzw
 /NNSwBiTuLG5h/2wuVdQor2xE54sXKFIH3tF3Is9kWHTfH9LNIzWLpoFcZCZsCMSoBwuKVDEvvN
 vzCY966Jjc3tDDF6IcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MSBTYWx0ZWRfXyKdfOXxcyFiR
 l0a8hA7xfs/cP64hA5waiYEaD16x/E7NlR7TUjn9F7hy7xu9KQlyHXZZurHz1AgokIvag67VsPZ
 bF93l+XT45K1mYReBSXrW/KxQ0v83kw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020171

From: Sunyun Yang <syyang@lontium.com>

LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
mipi dsi and output hdmi, differences in hardware features:
- LT9611C: supports 1-port mipi dsi to hdmi 1.4
- LT9611EX: supports 2-port mipi dsi to hdmi 1.4
- LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sunyun Yang <syyang@lontium.com>
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt9611.yaml        | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 429a06057ae8..194aeaac601f 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
+  The LT9611, LT9611UXC, LT9611C, LT9611EX, and LT9611UXD
+  are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611c
+      - lontium,lt9611ex
       - lontium,lt9611uxc
+      - lontium,lt9611uxd
 
   reg:
     maxItems: 1
@@ -78,6 +82,16 @@ required:
 
 allOf:
   - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: lontium,lt9611c
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
 
 unevaluatedProperties: false
 

-- 
2.34.1

