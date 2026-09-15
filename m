Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B13D6491
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475656; cv=none; b=PhaAWs5n2flBo96OCL24fQnKp/z3Nz0TdOvVBuLmcFhI5uOehItnEOo/Mp2fundbgXCoWWvy7Y9x3DBF2FphsKfipo6As7rhKx96f5sHZKosJBv8AzwN15k3GBoh0h8NgzQTlmxE51/OrJCujae/IMH0SDoM4mJccy6iHDwVl0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475656; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwK/4jLanMUB8pX7Uk3OtSS0fx6phu7HLBBLUBii3FkHkgUstTB/DYnIbevNZJ1sO4tQxVlutu9ksoHazoRwLMQdjjNHKBdJ4rzls897c4sbVZBLeUOXy0UqyfQL9MS+wtyzJBC3YPfOLlpkqJP2Nv4wkE8sJnMonu+vNqhV6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXR+c/Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyiTdpat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXR+c/Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyiTdpat"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hGnI3912064
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=DXR+c/NkTVTzGySv
	K85gvrkKea5T+0Rsz0qACMz0ple9+iYwbNAb0O/h+UnNmoUf0C3OSqyAxcMJYF1J
	L+hCZpJvC2Et8rdpSBm9zZ8/jVysadIv6pLi8vcEwqo+XBoSYmIq/ndoXVXngn1b
	ACh8rCD8r6dhkrI6vY2oLIDCJwhbuHnjxeSYTehmfsDMhdprvb/nNQndZvOYaUeD
	fUOmdXrYYQStdrs0S59cpereVClilrb3PzNzlrLH/n42SzlY+hSZs9FeYhdEmFFa
	8LRPQiPzANq9+XhnzomR9dQqOkzmtVfv8RJlnZ1YCy4PyxsZNlLw4QVGE1xXES/C
	Kz0SCA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jeshv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:34:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8710450f731so848424b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789475653; x=1790080453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=WyiTdpatqEkrpbzGFlvetHEBkDcAXJW07EIPBdY5vKa53iE1DxgaMfm+9EhfvgjnVT
         8wcfv+R02in5SXUu715H5R2Xj4t57lMdtivU3NeIYNOSkvTLC7KDwmwVI4YxD2KlBdGK
         6JVuDlm9uTW4XNEocG8+nDmPaxEVPkbgFqp59N/Mx6xVPfSXl4LDNkBO4mbChCteNo7V
         ZBCLzaoRmTwft6uprksCkSYqu9f4b3bFmkuoCGgvAsLwIUW6CPs08BHeLpeMyPQnYFqZ
         uHcflaZ1Fe2atlvQYuaSbj3ux0Cq+kDrX0YErY/7km/fl2e8c/o01GQPEUvNBQuoMHgD
         mB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475653; x=1790080453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=2V8u2XgnN1Q0mFJbw2YzjbL4iX/HrV/QDMwTiURcIX5mMn+v5DIZRjMyLfVtkPteIg
         Q3pEcXeNosR7s8fvwxHC+bXhIExqtkODbkkKHa5U00NirBCFFUnlf6cKfWP3d4ZKlV6N
         HqN90i7Hk2+WNQvbh9wjr9HkQJWEMncjIPAZnIr3Nyar/ZsM3sQfyCEgftY11XjdOWFU
         nVinMd+cVVvlptxI7y9vrci/jXjV3rCh37ZlM5xR2ff00I5mgfZy9UfGOggtVRjrOsM1
         +FrbVHilmbvzjc647PBkDBJM8hJCkdNRjdbv+NJ9nluTy7v3levEjuTEEEJYZRkFOcru
         8aEA==
X-Forwarded-Encrypted: i=1; AKwUvBzteteM2jvCATKZHrfEui/ujxzRDMrtsGIYNGZTycROEnh8tjtFdURSwE0HVphMIG1815o9+T9dRV8DtnE=@vger.kernel.org
X-Gm-Message-State: AFuF++kc6K6kKkOt5xgqgWpXA1JN3q3g4alZaO4mUAl6xC447bv/mKDi
	a22xb2D+mB3z/+WdF+TjVYbg6oINzujOONMYrHcPVizakp1oTlNoxmCb0U7qxn/T29VqtUDLq8l
	HMgywtlCFXwpOitLLVHO2aLJufRBlcZnk8LwZqJrY2vZ6+PNaP+ZIqKb3/H4uc8dEfuA=
X-Gm-Gg: AYBFou3GjNuxRE2TBUml8AQit5Y2oQEyGFcM+idebnjSe7Md5xfGbkcbfHnnR2aNUFF
	BxuUyu6ezwgGtV+oNkkjC7yYqgiSccfQtl1LNErewrVWwSKqafHd0VoDGnXl4Q9qz8XJ3TL5CvI
	4LMazq6UbBaddjbRflzQkxb7pd6AvoZxQsMbHWDSk4/AsJIvi5SXwGNgXY/pOGNAGdTvW7yVHgH
	a5PduAt4xCzQ78CVfITg3Ehjbow4x23WAMbsLrmiXafaDAw+QAiMw9zvyOBKcuYaz5DJxFV7zUU
	oYEWJDANtv8V99umsR8TpqQOXXxaVUbeF21rAFmiQvnq5TsHw3+xmmp0CCLBfWCDqbPgfaEBhR3
	BXtpiNjJimhOxVcnenSZY8rvDhg==
X-Received: by 2002:a05:6a00:2e9a:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-87180de6625mr1343356b3a.19.1789475653278;
        Tue, 15 Sep 2026 05:34:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9a:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-87180de6625mr1343249b3a.19.1789475652642;
        Tue, 15 Sep 2026 05:34:12 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c481asm6509975b3a.11.2026.09.15.05.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:34:12 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Tue, 15 Sep 2026 18:03:50 +0530
Subject: [PATCH v15 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-lt9611c-v7-v15-1-88f9e9387eab@oss.qualcomm.com>
References: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
In-Reply-To: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475639; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=IAPO8LsTqDXbz6623zZAU4eY+YP8m1qcI6DLsM0OMc2Fy0L17AW7/y2t6XnOGW6s1jOqrjQRE
 MQI6XXwG9DuC5xHPZi98Luh5eDhpPazd1zQVhr1qqaExOIWwOTGilKS
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfXxSUJmwsY6KJ9
 TrLK1M5GUOFDMzJgwIblvO81Zl8LkyiVUE9mp07M1Y7KxIJSYCXcaUgT7NUn7BCwxBSoiM1qDh8
 p3m1DW0bnOu8dUE10arHzLMMbKAAQHc=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa93b46 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: CpRGGpIazuBm34ddfXLjqNJtv_5xOmYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4MiBTYWx0ZWRfXw3b8jivjzIdi
 u18+eN3Of6lhDv2yQF8S3uIlhtLxmHGBV/RRE136xsThJ+iy2ElfMItont4n0J832sXV82nF/bX
 KNQ9oWMH57i/9sMlH7hZ5Xu0P7VLAxIhUBejHcxO4CEizSNF7hR9mA6/hL8bslyjlik64YIDDwt
 kzl/CYRyDFJFje73Cq7NYAbZPXntxCI+Tr1etHGu3uTO1Fv8/3Xv0lZ5zmbo3dhJ89eolWLxJdh
 1vjMMulPkiac67zwhk9IY1BwlMZ+H5fdA7Tmy8Nw9oECIplgJhVChqls7u3bXyrzJKKf06eOyk+
 gnUPf2eIfp+njKDdDynuXXa1l23SgNgggtUhkjFLz4YdbADzk8c/nlmAAzXranGTFUeAmgTs2wa
 vwy0nCEv5XumsXIHWd0Fnx02wh9tiE35u84RpS/O1rk3pMlWiVNRP7zFKI0w13SaSPlC2+zrUrf
 00SVsDAjXXAWhcTuldQ==
X-Proofpoint-ORIG-GUID: CpRGGpIazuBm34ddfXLjqNJtv_5xOmYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150182

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

