Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C83483BFF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946859; cv=none; b=D1EWtA5RM/wW6gB0IY8LaWlu8weJ92eBblJ88Y5RXLpb7oP3UX/2PXHGPrEKDlpjWUspEk7eiDKRk6JRZLPrG1T1yY38jcsDH/Id1xAtjj7nV3bLLK4YkhL0xDAMXK9YjhMgNFOe5vLJCK+BWLYaGegHB0iTWVIg6u8WMqk9uHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946859; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPR0V5cO9upc7+LYMYtagUez55Kqye7lw0N96z5IngckuPVK0Rli69dPkTkPSWGd4CXlfuwzr/G4KCOR3S7fJAH1A+UcI6TUGpW8asWDWwTg6ZRgI05PeP3Fx/wUL5PpkLgCpbNXh2JzfA0EviM4oA2XCkXr0uvXwSq8zFr4GkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8u6g5Fn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmE0UUU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8u6g5Fn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmE0UUU3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898OTvQ639125
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=P8u6g5Fna+xdaoG1
	1zetweKKwfz/m9PXotDa1trmaHCdi1jp6rEljhmnjS3qi8HFZmsbHLL61QmSg6SU
	QFl5NaGoJzyREUuHrq98XI3tS3OMyPuf5LrFCZ5PHKGperRoXIJ1YYfKSmrhkr1B
	xTzTqPr7GUTJP0hxj5j+RKTFtjPnyHggJCHdgUNshqOQHz6abDqle5Liej1qCC1z
	WQoFPHstQo16cXozehVj3evMrE2qlOHBPuQn8n7gC8qzWNpWN42zIdeQ/JaL+Ecw
	8GxCp9kbyLnOuFjxcZ0eFkEAtxQEnMNO1LpO6e7ry6/NVa5Z6I6B31kL303w52Oz
	9YlFfQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqj9keg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:40:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4a447d275so733926a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946854; x=1789551654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=CmE0UUU3Ny2RbsnUQzODuptTRQPHvzrlaSXR0zlAg2lNp9Du+GjsYEUpVzRgwbeCII
         mgYHndV6E+AgDRr7AHoRkmVhoApStGTBMjCbwAinZhxTYuwOi2SoP0L9l4pnd7+wOg/2
         8Q30VEWYGw96o7hzN0wPFhh7FfYrucxEMQe20GCiqmblaMV86EHJn/RQz0EASRTYN/kg
         etGA6Tbp6M/uBJrus9+TsG/H+7at/+MqO1pEarrfnW386bKSQ5JoKg/Eq32z6lnOIQC1
         +oGclj9U10UxPai7ddnElP+P/ln2Iy60rsRh9snJiefR7ROkgruf/Y9p+5nB8mY8yvAD
         FAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946854; x=1789551654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=ay9N8Dj9dU8Kii+zsGXuICeX/4c7WNUTS+TSGOdO9zhZ72Z9NB4e/W6Rv/kY8Hn7om
         tGK95T6WE33YbxuVwjO2KiHdDt+Q078BkuXhcUTxiX7OjjfVFhwdhCCb68emFv1YrVmI
         cQCq8PEZjPDbTFBSw8IaFzXuw0fsEF12cd2XYDMxeebkEBhj5RsHG2qsG/2j/L1mpdAp
         bGKdKJqT7q2c9fKJ6BciZ5SkDquwyljafvcLzmW3A5AguAlZzB2RjHmWoured/p1k/1C
         18qBLVpE7YLvQbMfa/IAGOGUMzTuRXq231Ne6paONoDhR1D334rVqCQUzesRQgVrG1Lo
         CFJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPnw4fKQkzXXz7tz+9HxibSAPJZvSFsS8EVpPaWC2wY6hZ8TOGN+3zcgFxswJBKHKPUakpBIYZeDhGEqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mvQOnywXKvsIlG+aROqVqEfRJs+OrGiu6l2MjHnLqxaD/VTpqj
	P0m+ueJxwjamYWK8U1WZ86ph1WiDMqesqzNYx0rsIGB2NxBqSdrqjirVM6JfVlaZCSsXa0bDz2X
	ZDRD9hmTzHza5hu6J/qQQXu7d3dTFCXHK79YkNN/XCCCghrmfEr5fkofrkZQ01BJivsE=
X-Gm-Gg: AYBFou15dbpVX46bOIzhHUel87UN+RsEaf0/JKp7G8IZjpcRp/Iz1doDgIO2fiEg37y
	clDXViO0Fg5bjbigrLkhm3O2ecgYnTbsmhoTQUUV3LSlMJYItOylRfjDzNNwpqTa4ZhdqmXPX8O
	oajfihLqIN38dpO51KNuwEI3SdJ4Ag7Bno/L5PPxSumd6kLl7y8qZ+AJCbbKqQFW84gxoHGNWXD
	8GtE+IQv5yqGD6W6buP+sBSq95aUtEfPDrvKz9uAD4mCCJgJI03L4z2XdWpVYdrLOv7hICHPETD
	0T7dRe0PY69+P8n/CcIhCmY0dkUnN/bXl9ZjgdMWbQugbPD6egn4J08ziPZ+IFnEGZstsJi+eRk
	Msd/HeojPMVL9VrmhvjqtQapxFQ==
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr51191021a91.11.1788946854015;
        Wed, 09 Sep 2026 02:40:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr51190960a91.11.1788946853579;
        Wed, 09 Sep 2026 02:40:53 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm42929198eec.17.2026.09.09.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:40:52 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Wed, 09 Sep 2026 15:10:32 +0530
Subject: [PATCH v13 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-lt9611c-v7-v13-1-aec234483725@oss.qualcomm.com>
References: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
In-Reply-To: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788946835; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=1Zrm1DWc9VDm4EiTRoPkODjI+IN+ghKTwjeCXg9g5LbLQ6g4pHs6BACxqX5PTZXz1RuR1CItp
 7UF5lIJV6uKC8ckskVI0aBQBp0KanSM6SdRVh+n1d6MbRfufVYmXbU+
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: UK_4RIlo00JrGDNGAwzZGcpIcqTB6fqu
X-Proofpoint-GUID: UK_4RIlo00JrGDNGAwzZGcpIcqTB6fqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX+Do4jJkSf0lP
 qsudaszEIHkpXw8cSVCSZZiehk0JII9BDjUsUSnjbHXeHtczve+mJ2dyszVwyofEYzKsYizi6eq
 puSprvVd9olIokz3wvIEd8qxBZTS5FqZgu+yuXNH6EUB2okbD3mBYoBCDNkTl0zx1BRwROKZapZ
 jrNImdAkK+zw3S23Ehb4BlM7+vOardQ8nL4TL/d8EjjQLzuy4qLRRRMZhn4vuaIZsKRAqumXxEO
 lAKjv8ZMuQ5qJ6a6g109f9F2x++yy2o/Pw1NCJQUBt8UDQIHuq3YoSiGz9z2tPCtj1GfPiGZgvs
 RE5l8kfbey/G0NH04oNoMV4WAiyiF0mAWOlVTOH1dsZvJmS71PpupdHeCWBv5PJ73Qi2jXDvOdk
 eSjgcIIiH+RQEEH4H3O0W2tFSozkzH0aR8Wgfcd2U3V5cJ/OY2bNEzUn+DUIIUecyGebaRm3hwH
 L2p0IHsr9cXa0FLzW9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX2jA3hsWmJhnu
 jzcV7DP1/PF08Bsnunnn6bmruAYlWTbXL5Lz6354zogYGYPk6Rp9He/6/OMfpRyqOoukpK+x3Yz
 hO9/aE3MAimn6gHvDUNB5f7KLkQxvkg=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa129a6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

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

