Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569467;
	b=kGSgGsVUqsQDn6t7QqsyfETh3E2G5K0ANDsxJ8s421GGaP0CTgXjgnkCLe6zyOxKsl+4
	 jGvIXiqb3pcYc0QOl53HBPyGvL8hO5UTOfTPw6hOJGJEYTRg4FmSkH8uYkbTUo6FKE5Tv
	 vr7rUlzYjPPJc7VOixawXDouxpySgnws6QlK/HP9V5r5MtbxJ3G6+7BMfISI1r9VlVfjC
	 wjIW2C7V0ygO8+oiP7zM61+tRdPKmwonXh9BmHQQ91lxEg6fy+lbLdtYMGJ7lXCKUDxmk
	 /lXECFffibpK/544iH+eqffI6oSpmqeItvPmQ6g1M+TotPGHWtipOB54PU9cJRTsHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
	b=R2FQ7UQ5BiWGE1OFxfnBhRM2zfNfXYJCV6nGrsA09dijY/iiIjPKpzdA3qVoeIyYlKIj
	 oimULRy9KNd8xGPAl3fQa56Pe0f5o/vzuLq5TBKln9D/5DWZNBEuNxj6G8jfCdO3kB2zQ
	 Hba3ER9mw6EfqxemVFTqO5jmKRMgyyxSUwIHD/v/KDoH6VZZ3pJbfMKlQZqgEeKG9Z2Ib
	 eRp3FEzeK/9PXkma20t5Z/hu8LKl9y3aH/gNZ8YBOMu6MoKm3xl3R4vpOwTnobczZVPBs
	 mPcbP8m3gTTXUPYU6zCcLG2+ncwDYzyO+GFn3mReC/KdoTOI6vN9r1oHqt1HtVsPbuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtRAEGJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWEpBPX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFC3606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFC3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtRAEGJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LHWEpBPX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7vU2411448
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=BtRAEGJ3m/gSrMkN
	CjYqTKQLf1HMYVC4H9SvxL/OIOeiYUFZx3hkxeiSk0mMpmdhVmqsiZpTdYNNqVD4
	7MGUDBiORePjw/Fm6R3rjJjyJ0Ezb81emwdQUGmAW0rYZ0Zv/LC6dgeJhb/kj+xT
	0RdNSPFOuOjKPOgpwW2x9dFO3kbheXS1PQkzw1GE6VCUEoDD7W166rgxOdKbE/y7
	egNQNhnbmMYN6UlkbQBapf1mY8TAi88qsjAQDB6HN3flbd/G7yKLD+3Ts3lgGAiq
	CBLN3uYKahCslmV6+To7cYuv33pf6/HbkDnsf3S0FxNiRNzcWWpUexiJ9H41Dbwp
	PmGb1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvc5sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so637624eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569465; x=1793174265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=LHWEpBPX3+ERwu15hVWVBq6i84t5vS+AsfuhjKv0lf0rLj+v5nKcPJkmdh0OtExNHa
         ip8lXOS+hh7wF0UQuY1AuHdVjCaQ3KqLNW0UtD7lPAL61oBInsIB5Xhzjp8OzGX0sx3v
         pE+sF0+DGXr+jcr6OyvQ47pvWed6jsKnGSvqOIu2kBz0mLjCiU1m6iuXYdRC/4PZrwur
         t6QZk+iwrrceQCvwJ++pgB9B/gGRbht5nnO23UIsBJeE5b7lmF4MiCG1yFyc6YVNc2nB
         OFBwTdI25Wdc3lbLfIHNHLuGHiCHrcMxQ87/sc0oQC4DawhIVCYarUaC5SacGWaGokwO
         iD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569465; x=1793174265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=Sli0wqIfhUysGSd0m7OoNAQrVvLstHe7CBzE0sVnmPDm7vEKW9w8a8xBEXV1YZH456
         P6ah9V5se/BHP7ZWPHyIpiaW1b03ExJMe8O2qMYMyzKqcWFLHWfkYLM0i1rLDmBlX+v+
         4o6+8Ey+mwCrBYcSR5O78PmqDhuol5vndMNIrGvJ6u/4i42C/M58RUQgSTNqNn6QvNBm
         jDgRSQ2lQeekqB0N2Oi3Xv5jZmDn1NZbGRAK4F9eacOT23d7p8hfQfzgXAY9iN6Ob6S9
         8WmKjK/b/VwjHXsL/lHHXEntWRRBYXzXuVe7fYFwrb9eV5f2tL+7JvKH+mJmngss2O+v
         ep3A==
X-Forwarded-Encrypted: i=1; AKwUvBwpKe8Z5fxp7eIvuVruWrAd3uqU963dFFtm1yGTYtS0N0sVvnKUXbLsflenwJqWzJr4eufvMgBA7SRmjYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL25tBdKBXIloV4TVBBRZ+LNtXrM4chWm4Gi+saacEMMahD8cYJ
	Jl09KTsppTJT0HrWdPxLHJlEoDdXKnQkqH3BwAMAK0Digtj38m5W2/FPUrYcVEKM64y2yHufMZ1
	zFNExQT2wwLQU2qFL9eIbwBmYH2A6jO8FZOrA8vxLJw/IK6a5qEBWUVR6cgnLazSwJ/8=
X-Gm-Gg: AYBFou2v0TGPJbIZ76bJ51JHliTHvFAjvVLUJXwlmt6zkq2b76G1SOMJb6QDSDrQhBv
	JFIiJdZwjnNSRh6ICbaT3lGeqSFxduXOUkGEoRk3KtZXmq/JcUO6r3Va6WhqWDuZm4WpdQ2I1Jo
	yJftaN7nCJamtYUeZ/AL/qfp67oERCNU7TrFiUY3mhtLy9fu60CkfE4U7pDf4g6IN8SyaTPjFBj
	hvfEZLluIjTyd/bjhS2IbPX2PsKufjHkIbvjPSwiV6BYZS0hc1qxT3ab0rhWKhdCniWbBeVi23y
	5P23ZkAuy+B80OqrPbtvA2rrzl53BDtt6+bqG9qhinYs+vtt7kuKlSOpdfL3VPpA8zK9N7TOwor
	dhW65RMBmAnTnlIJB6fECG1zT
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr2283872eec.25.1792569464663;
        Wed, 21 Oct 2026 00:57:44 -0700 (PDT)
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr2283854eec.25.1792569464146;
        Wed, 21 Oct 2026 00:57:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm10244209eec.26.2026.10.21.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:57:43 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Wed, 21 Oct 2026 13:27:18 +0530
Subject: [PATCH v18 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com>
References: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
In-Reply-To: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792569448; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=BJvp6vToztQ5YRn9Fv08ZCiWFwNdk3c/ERO9nL3RNMq+bhIwSWIAbBQzaiSLe28miYMqKNVad
 2yII30O5k6sDq6pLqpuXHAK0AiYjYpna3Xb2DMeCCvjcTERj327FLY0
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXzRy2TUF7D85k
 EQYU+plSws/maMBfc93pin1+x+DjdP9+KZQIWIPPVAF/K+FWlgB0xn5+75zlNEiytwnf/FzBYvj
 ePilwiyj1rV6wHqlxh6zXk1n5cMTtZf4msf6WCt2ejtnX5twj5bKOZAKwZ1y8sA/BR6rXNOB81c
 QpiUd2Dcslx283uTYUCY47wGdu7+3RjrX6vrD0YYA6PZS1oxIjqIiMVgpZikDSKQ1lITh2bULzT
 U/dEppb/re3T7GU2mBzKbE+j8cC7cJadHF84INPQixVJ6L0r9IDUc+S7/42CDJv9B7iE4MdQX3d
 0WgT8+zKRcpcb4WL7Fo+CJmJetptEkdt9/cnT+jALgNSA7BIkRq59CyYdeSrrUy7ylIf1mSiRTF
 wsBLGYktEafsy1rBw2dCdYVKkvcafRROGGEmJQkY5osEBIiAQwNOkAZCYBUXDM+8AKfbPOiI5rV
 odzGY6jiypjDDnID8OQ==
X-Proofpoint-ORIG-GUID: ea1N5DY1GwJ4My8Nd157azc4SDf4xv2Z
X-Proofpoint-GUID: ea1N5DY1GwJ4My8Nd157azc4SDf4xv2Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0LidTNQMb2EI
 4xnTu/lnxTwfZ2JKV1cxWYsAMMtYp8/bRQlIi3c84Hr5u6VyM1nIrvcvE7bhOka+q8YUN4ULEtV
 H6bd3bJ0iYZmeYVYG7+mzqR6rN3nYZU=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad87079 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

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

