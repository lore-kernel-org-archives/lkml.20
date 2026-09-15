Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2676C4C77C8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498062; cv=none; b=Mv7Tgo6k0HNlglpFmg70wLU93Zxp3rqP6cr6Oay+3SKoIg4JQjbB0B5Tf67MTUhQxUv/1nc+FTN3xH6VZGviTZhNFaZlKIQyC4cjDFW2c418O0KpmX8/DnJwLxgOzlACOcyutxpn+DWZIfAynNytjJdNFbzR8ebaXR/3S4zigLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498062; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYKAWNsiX+tK6mlOiX6F9tooRqvLl0pwGlOW28P1Er2YwWa4+WD/hWv9P5UTMQu3E5vwaOVw+YwCxtFWnf5yHkjP0bEVe7kC9LyS0LQ6CfcmVhnNJPCOzhmiqvbrYKQNJoDIUF3h4g5YMD2Vru2FJNxDm5R6ZKIONVhR4D5mrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NisZP9yV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJXQJA3n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NisZP9yV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJXQJA3n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHomZI823339
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=NisZP9yVr62mX31h
	44tfjWiDFy21JhJblUt6o/tttz4o6gMAp3coWFsWWBAqV2ID1MctqDkKr1lB/COO
	PlgFg6QDS4Z/n66T5pcQkIP0xVkifcVSowF4jc6ltm6lGmoSpCatdGM9dEeJ0Qjd
	S7MkZ7VtY6Q1hNv0uxNhwCbg1foL9u6GD9aWLgk7/00wY9VfR4+vFPrlR57JhhOJ
	r56LXBpV/WCbd7YeFXTrcS+0cYPpwV/qbfZtlRlKpkVuaiHacbmyrEEJw5fyGkHC
	0/P62DTwaKedNWu38erS6qGADh3MCBLUxtWfMNCJFA+IJ0Mx7GGVGysqXLxvdr4G
	xXCaqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jeud8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:47:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so4794235a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789498059; x=1790102859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=WJXQJA3npMhjhYZGUyedKEOKmoh1Js53Om1StR8NKAJe3JQXBJuggMNe1mssgi/+Lf
         D+7yyr6RxZpx/LHX0HEkZJ40dw+F7qv1XdFCodX69puFrbg2epdFRpkVgaaw0zpYko0p
         Y6fwlLtzyOAD1LQ1T7Jx6LqFctQKY8bE1HMgZSKRwfF6wYs2ohvrEBWEWhiSD8I9EcHb
         6HgFyh6QOtyTfl5+7e/Ml/9COqdLOb3uzEDD6SkO/N2fCbxw6OOGd7mrV94EV3Qiot8u
         39CDUP0Nbe+Ky3GUdTcWdlO7o596xaqoLyZk6vkBpZovcLtFx+SO5IZYk3fZXHHvt7Sz
         qIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498059; x=1790102859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=mzJhjZMMS5l8QkuU9lR2u1Qu7x3S/ZQZW5uLNT4ua2WGDFXpPQ2Cz2r3YKebpsM6Hw
         mr2uvGslrq5opU/HqhFwkA1+SjDCd4CCALHUHPCLR3D9GgfXm0VogRASPFUZKJz+mSyX
         kBAduQmhwifYm+F4klkuqaCEtH6WqOSg9OiV7PUVOy040dFBpWxf6dKmLylMWYzUUJUJ
         u1qBjy8wbHwwlIfOTt9n1Ry9nOcDpL4cUFsyTekM9CM370kRpDm4wds/XB3v0FuQuqJ6
         4cwnVEEXJ2S43V3un4sACvnuLSwzBQ/bK58h9UdZGJYdIYyG/TocWeljRIy1i+cu3FrA
         5eVA==
X-Forwarded-Encrypted: i=1; AKwUvBw9Df2iCz0W5ppBAd5jIY4phB9UHNURA0LNQMAC3azCncKtZxlhgL8AOaubJYx2jLKFGsAgZLBvq18UMeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mj0LPJQA2tVQhfya/2oApFkHK6g9E+IVd1PO4EzdV1n6oB5Nv/
	ed798m6ANdKbAG5Ad88vRL9fOw+W2MYg0BMU2vrJdjjWgupj7VcUY7XM7hNi+9VWmoNsZqSZrsM
	sXiSnL587memm1WDdEEk31jGsdYSj7lKZ9KdWCz4B4vgNqeypnRS9gnLNAxf3uX5QxKk=
X-Gm-Gg: AYBFou2pYg7Kfu8q5CvVUnxuwc0Jco83H6Eimls6w48sKPaYL97czT1kN8r3rh3XbQ2
	J2zu5i1Sa3fAczs6YT9Xx2HOOPKx1tCHfWD4ipuQ04kVjOpwXPXR5rI+Z+dI4dLWE163QCTKt3u
	AidvBFY4nyRYNjF0VL/74LbeUb/HrnwpEekjwFfpYehP/rE4SNMKz4rr0CyQ/eaBSqxbBoo/Yxv
	Rv4J/Wga6/JvMbjWGBSmtu8R4DpZu491MAkGigwOiIYLrbnlQAquL8B6y/wGDEXkVW3TeVWU5u7
	hzzSWpBbsmdOoNJRjuAhjaIt+WBo/ye664UEZtqq8s9FRhhvM2k4KjRhIiF8K1XeSlI9dbClho4
	lIUilrFlwt5UsbflIDiK+DwZuVQ==
X-Received: by 2002:a05:6a21:3a94:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3db404f44a7mr22511232637.12.1789498058861;
        Tue, 15 Sep 2026 11:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3db404f44a7mr22511173637.12.1789498058364;
        Tue, 15 Sep 2026 11:47:38 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395caccf1sm612368c88.2.2026.09.15.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:47:38 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Wed, 16 Sep 2026 00:17:16 +0530
Subject: [PATCH v16 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-lt9611c-v7-v16-1-c65042fcd245@oss.qualcomm.com>
References: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>
In-Reply-To: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789498044; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=kiJ0uAdRIGHyRhstvYjBg5EWmCtu0RBqkf+rkwJxOCOlFLWbQwshoIWp6u4Udc6qVv/QnHUS6
 1yTyJkjiH+7CWZKhr3tRJ42hSnwOHsB6sqbzSQ2cJG8VnCwCo3W0g4B
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI3MyBTYWx0ZWRfXzeNnTyJrO2DY
 fOf+xZBGMzUvkn7XKabP49C9kWly8YK8Zu/LuJJ2GnO2dySNgppfi3s+4gopdUWdSIvTjD2Dpbu
 WCUZxVMExCkt0Dxc3EBI/mVNKSVn1m4=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa992cb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: bVj5L2QmHLeVp3ncQhUlaA3tvduWbbek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI3MyBTYWx0ZWRfXxA8awVHa7utC
 CNEX5DTFnaTDuWIhm5sB+378sHEGjT4SLI78UcIeKsTqT9V4BTa5YuhSXwH1oHD2x3I3XixN0CR
 XF4tdxjZsBoCTxbylO9mP4WqX2RWCO5pss0Pt+Kr5Ma5f4JumqAWyW8nVWSMAxg+0+SNfpufjCt
 YrYl3cX7vyp7R9nM6tWxNDyoSRgNPFDceLFiwSQfbOCyDlhaK6gA+XnOPBqp1NbF6WY8ilYsFLY
 bE7c/WONIhZvypGrxZPT5YZTxYPYN/TBsd/K/wGD+p31DQvhncXl50IS5gCfQKI2P/TM5A1pb88
 VuVGKydk9H/atiYn3DP0Cv4pff6tJfZc9RpikgTdDw6O4+Wd9P4WO32+NIfXep/+ldTzYbLwhuq
 KheMzgJIf/jely1iYHHhlB9v2vd3R53qMeE++KFsjaCWyafDUJM+1NAh3LCZ23Ko4N5k5qVdnro
 PuWpPpHx0HvrpF6svvg==
X-Proofpoint-ORIG-GUID: bVj5L2QmHLeVp3ncQhUlaA3tvduWbbek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150273

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

