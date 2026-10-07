Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA091D5ADE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404161; cv=none; b=HeephRZz/pIUn+apYbwxZrOK7N6ykLRYv7JQ+E2/EGgl+jrHk+beEjpzDo3DT66492dE1/9I/89bFWThwT6Ina5mjC+W17RBMMZf71wdChZpnD1WZgfE7Kv8DIgHEbod+gu4e0ye9o0DzQcXc7IEfe+/bzrk1dz0fE5tUGL/PCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404161; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhJexyggq3iok7ck+eHOqz98UfEDeyp4ZMJ3xHLXpzf70PMtDfCySSfRbCtqDpu+XG/v7D2uzbHNjxH/n+b8TZ/0bNHlh7UwnP11cqf4DeVSGJzlOMdoUs9d64fUa17vBPnYVx9q7iUSAK54ZgPQj3fqJq7ouMZeifu4n85HNqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okbFaKgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrByA0uT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okbFaKgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrByA0uT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697JNKQA1024846
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 20:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=okbFaKgXiY5tFYdV
	V5t5Zvwz9MMrzDnmoRjyuLQ44mbmeJZ82YdufuIJMYv4Traf1wQ/VhpUUhbi5LU/
	vbCkWQ4NDtMxk9dnq95ZE5LnL+E0VBVRTo/tlIWheaRXw741ad/7PjeuruP3rv+l
	e2UyEZidqMzfimkFbp6+r7exfItxXRK0kbivhvo7oMEbL+mQo/xc81A03I2QVOyn
	8RzArM/4iq4js3Hwc6NzzsN1MGLxlO5ZukhBsS2Tg9yPCU265KTFL2k0Bi2itZyo
	V3bVe3cpfAMDDCJ4VVrStGiXTAc7kpxPPMnXjkZ4zwdlOQeW3/QiIYZ/MWDb2hgk
	gfdU1A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5td40nkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:15:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso6515281c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791404158; x=1792008958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=YrByA0uTtVGMFRrWKVuVvkcZTj58M5foBHMjCr86bUWM1wZNHXp4oXnfYhxPNbg6M9
         D5WSVAE1Iaw3HIG7p7xPp/7yAa3I/IghLth3JjpMhqfM3dYz6yNz5F/XvOKySmrX7xfJ
         KXGRQpG661+oyTb0hg8i554JNGaAnLZRSPvBMXhJQ1yI78FYbJjdj3eAcI1PLT7OrgO1
         dj2qafEvpfZYCqBt6cjLCJ/BmTEg7pjFzeb3zRqF+On53t58OAQYrBooHEJwhz0Vq3/t
         AMdXIz8A/WqRvYtfaQ1LXFW+ITumc6xm8WXgKaPhjz75wXlACea5AKjyVKb05ybF+FLu
         eSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404158; x=1792008958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=OIflvXzrRIL4gZw+Gouhqo6qL3tcxZAoVIUVHTFEYAKdGJqQEh9V72lc7wiMZN78PY
         rRjkJZsnBuC4KVz7t6G9fe2wy+xFbIza7IqLQ7QYZmZ7kGCzusKZ8J6Lwsi1EzDImwGW
         8UVG/E6asI22o7UsJ9rbt2JPVCsoIWnd1ScxScpL0DOPIz3rTJDPNb+47H+9OAFqRYKz
         v5P1aNufXVonjzKt6Bei75jVouM/XccyrJySvNCLPw5XjXz02x8BohQ+QT3fEgLi+zn4
         n/g/A1DaVFpFdEf9O4pzkQMXYKEYY5jUTjjpkyvOIsWV/q4zn8QndvytA6ab9LMHJkoF
         tvBA==
X-Forwarded-Encrypted: i=1; AKwUvBzCdzRAcqwpNzZWOEJknBHF/qfN1HhL5urRgZNKOFMP0PBiy993RyQkRKdLiTHcrcWEkW02HRNM1i1TqWw=@vger.kernel.org
X-Gm-Message-State: AFuF++k8Ynot0TwbvIyfWbCA6XZ9E5p4rftULzztbqg8V9/mrXxMSs16
	8tqgLCLPbtulb4poqN9Uomm+YDlZYsni7fbkTsVQcCQ1EQF7eWB9xobVXcDSWfMaQmrRDoejAIy
	w0Mf3DvvYhnZqhnEjp1rotfSLt9wZ/TE/t7rPmf4tfU+FLN4t0iUpkU0VLd8jAjO6pek=
X-Gm-Gg: AYBFou1qrrnoAVsWSyE+Jrs+1+cfM4JnFpJrW1/vwZ1VzT2xMy4vctYmOOYpEzP//5q
	Hp+zyhMjUY1ipsems5zSKKhtVF1kkZABjQquP9jMZlcV67CvQex2r4927JVLjThKaV/ZFviakGx
	oypRJKYQ04vWcz4KalNMCiHpkbxlLCqKkJX9v7Kbq3Gcmw1bPi6VdxOti29hjnxH1unMAxYrzoG
	p7VgQH0vK0JyQcaJdT5X8KwTWBF6QUrnFWICMf9xwZKhf35+0vYeYLorzfaTCXHtSh0ckWb0VOE
	xhS0EP7av4fXpYwFjsqPpGYKBaVIhYFXS0pLGTp+AYT4Kt4KgdhS1wVCiTTRtuACH7xV4RMcQo2
	yz5OTu3GBK9bdteO3H6WdGRk6JQ==
X-Received: by 2002:a05:701b:2312:b0:15c:20b8:796e with SMTP id a92af1059eb24-1620513f9afmr3182434c88.22.1791404157973;
        Wed, 07 Oct 2026 13:15:57 -0700 (PDT)
X-Received: by 2002:a05:701b:2312:b0:15c:20b8:796e with SMTP id a92af1059eb24-1620513f9afmr3182324c88.22.1791404156209;
        Wed, 07 Oct 2026 13:15:56 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm10627380c88.13.2026.10.07.13.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 13:15:55 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Thu, 08 Oct 2026 01:45:17 +0530
Subject: [PATCH v17 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lt9611c-v7-v17-1-1e8f5f2b2f19@oss.qualcomm.com>
References: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
In-Reply-To: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
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
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Sunyun Yang <syyang@lontium.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791404141; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=Xz3fTcEcug2JwD0kvv372xc3PpGQ6WmYvJi83xr9hB3oY1nVq4ZKJHXmkIiVmFch3uW2X5MmV
 i4XL2XhiBXnCmUSOuB1QFJNHpRZKU4VNRH64IBWZHKywbSFLyYdMchS
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: fA1ruIcBGSQ_hidpZM8hzxTzdqzqOjsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfXyc3Pggmj6GAz
 CI1PY5sMnWJsZq+mku9rh9N97zoQY19FOZ6hQM/kFQUVJAgffbZmp1V/nTgA5nf54GYGTjJQIUe
 +B93wPuOV7z3gjX884K/AOF1zmkvQR1UjRMB6ZYeYF7p8dkhsiU00Jfn8XdcwzlPDpvd2+KLvLq
 dvvA+9/wLWhqTeQ5qYJPx7KOFLVIy8J8ri7BlMLtVGY8+avf1gyNw1chuwnqrK+hbc9lNkXeWCO
 qO6+/8Q3BD5JkmXyUQV8st+54YBZQT4CxgSt6bMNTmj+3Qkxj8d/sg0AKFsO4ohFL9SuD03HvL/
 mTYDIiuZoazSvkMcPDZAKbBWM07oy2+ENuSjRc25ULbWlvLshTA3Q9cuBxj7nawo8eWtXzWdR3x
 YxNPnKebNFVWck2qRso4XD2NbIYHEDwCPRX0e/3iJKBWN+VmEYL8ADIpsqI9LDv0jlDEPtoJfr0
 jEjdA5A6LCa941qD02Q==
X-Proofpoint-GUID: fA1ruIcBGSQ_hidpZM8hzxTzdqzqOjsL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MCBTYWx0ZWRfX4hmZKwD7bxfa
 1jzCndxBmm08EfC/aOGDAIa6vvVW1l6xCmoCxNX3GoG2wlcm1lXT+qpZZ48aiiZpCaYND7c3L0r
 LUg5Fw1NB914REvcMLkffg+nkWgHiAY=
X-Authority-Analysis: v=2.4 cv=NY1zRGD4 c=1 sm=1 tr=0 ts=6ac6a87f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070080

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

