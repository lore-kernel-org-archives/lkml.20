Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFED757EA
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789249073; cv=none; b=K+xAc53dDZ4OUdYTE+84IgdLsaaKZe6BDRRmh9dMHS+zYsPvtmTJpn0e4FOF2rD4E6n8yM36KKcZhBIJ+UiOVRpnij3eIe/ShUj7T4DMv6Ib5Xbl29UHXjn0hhr4FtE7/gi0uUGCeQoFGZnHUXiwiQc+HItL+j845obhG7zXlvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789249073; c=relaxed/simple;
	bh=/wP/ifaUlX4YnTsryPY8ZpP52sJzH4xKyqmqoOC+tAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvQT92y68RewZFTT9mqB4geZlYDkydJzjXC3GOmpvMUj6DemFI0V3Qjx88FDMHxg0IrtQQgvX2ERJfzHHY3kBB+ChDmWNeyNjEMFTspYjz5UJIh+QTwTo/Fv7Lg2VoKKdne77YBmdOuiW1wGk3kgXO0zOB8M7OE8qFLCAceP9e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndeU6AQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjRi09to; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndeU6AQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjRi09to"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI5b1i062417
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=; b=ndeU6AQ7n14Bm5mH
	uJt6386T+qEQJJC2L5Gd9Leqq1nj0ruFP/MhVVh5kSw/ovQwySCS+NeNbuHdYjUN
	7SUXyuZ4LWPh/YQB/80XuMoOI/XywhqY+C6BErsAXVLjA3v9gYxLjFk+6baVZyPp
	0A7espEo49jT3n4e22ZyNWhwUf8eCIX9WN6CAvokR6vuGOyv6zUmOIcVsHpbXZ7S
	wRk3fhv6exKGOE5POE7Syb9xHXhkIWriF1oTt4AM8e32nTlNXY0O5sHA6XkHAUHy
	ql1MGqcwfoArTJUEz8kBSsUCmrow8hsa4UI6AELmzRPnMebPHyT437XOhYoU5KFS
	NHIMDg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dhy6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:37:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so29244425ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789249070; x=1789853870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=XjRi09to/gXPZVl2/z4hnpLFpT5kNDIGS5LW9OLNEMOhOBSdnw42ZOCqyt2wTXxPlu
         Z7T8T0QsSwhrKLDBLR7YWnpiWL5d8aU4IZmqp0XKQeANq2C6gcwvzLnNTthvemcKdASN
         l8lFtHmhnoc+SApn1pYUtPhc/eZ5h707tIz7D6Mu2CDcWutmlsDyQPwbd5UKj1wnvDW1
         HOJ/OY91lvEkDxVV1pEXuprv/aLdCBL/D37pQ0WCGbKcdQ/TRI5WVbMeBzg7Om7MpjUI
         i7eaBDh7cco/w5Q/hJ7CHpX16nkCC4VXW42KOqR5MSKBFZad2Mxmeu9bhJvsa7aWmlR8
         2NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789249070; x=1789853870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUSdb7GhbdJGsEth6SJ34W7vHVCnsU2vlRUxl4txdnY=;
        b=WXVSop7ZlCOT9tO05ZI69UlSIH6NbPq6jdSt5pF2Lah6e+jEqQ8MtXr8Qf6eNltmTu
         R4tIHx1Al3mmSyWm++5y3xytnn9a/x8YHzR8Impi5wkAXVODUM2hXZ38rhfZEEqJDmEy
         qidkrH5ObfEoxoQCLYfiEUQyCtbJxrPBj4MWN50NXFwy1LLEHuvNbeKYcWDrD8PJFM8n
         Km20LCsQsW4Dz0uZtwV1H9R4j0kajM/tT2+NKoCEsXKnQSB8ssT2lI0mAWgEWIaUaqiv
         I6LpgosihtV9I4Y2ntK8AKQHrZPPTO67sHmJzSJchD1vadSDW2jfB2ecfzHiRlW1iUho
         uHbg==
X-Forwarded-Encrypted: i=1; AKwUvBxDSApSFgsgHp8M7edg154HsnJE0ClnqMjiYQTqtnVfYndoJDT/b7FCIwtZvRlrTedSgk2PqkXps4N0+HI=@vger.kernel.org
X-Gm-Message-State: AFuF++ngwZNqPnKH+3HrzdhN36r9WdqsnNiN2LyUYCGbm8Xlq3caXevP
	49iJGI56SVH7mQcqpQff41R9IkOr2Tqi5q2ZD+BqDtWWaO5FWkoi/dY3jaeUIiZto5CYVZweqgU
	yTLhottsZwMKV63n0povrP1ZvvWhM/QMunBCpXCotqEeel0F1sDSMSjW3HcpUwj0QAP4=
X-Gm-Gg: AYBFou1kr5caBeUCtEC47N0Who4J/XUGkcyskbg8GMzyngXiR/zSeZmNSxF6uVCVc4t
	T10cx/GMGw/A+ejgx2ZaLz/iC7A9mUWEeL3NONIVqK0GdG50awERH3Vho9Xyb0s+5NqxUG8O4E5
	x/1UH2qxTZ+cLF9CfLmgGxj/3TkpFh8niaBSUQRbsrdt+f1Tinsa5Ad+R/Nrx+mEQ0qambVT7zn
	re8D8g8zBqMEAQVpRIYIVmmGmrru4lFkMTZd8GcGQVxqCsIQKFhESF5qVrNXVT/WpTl5bRzTBVN
	irMTE8jYFzUkkQfScfCst5fK/MIRPZOU5jBQnU5/UluA7KWvmx6Nxe67SGH+cHa81ji08y/dFjw
	/6oDID0gfSRMP4MofyEVX7mKGLA==
X-Received: by 2002:a17:903:2450:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2dd2a1f027fmr180077715ad.6.1789249069785;
        Sat, 12 Sep 2026 14:37:49 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2dd2a1f027fmr180077375ad.6.1789249069284;
        Sat, 12 Sep 2026 14:37:49 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f0feaasm14987841eec.21.2026.09.12.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:37:48 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Sun, 13 Sep 2026 03:07:29 +0530
Subject: [PATCH v14 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-lt9611c-v7-v14-1-534b43a07662@oss.qualcomm.com>
References: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
In-Reply-To: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789249055; l=2049;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ut+CndQz/jrWa/IvwRM0rWOCvN47R5Wgsw+GSTdue28=;
 b=JRLIa9O+Ei1CWlCfGQPz6+ldSMZTkwkNehDcLrQzB+KYZxgsyNjtmjulCQxx3H1ujtNe6o8rh
 fOVukMcWklhB2HVccFqqXiUWD16hRuhCc6yobWytRzDS+8pXh5vKbqF
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: OaM0VqlcYgpfjimlbXYQyXHuhr1VrLoL
X-Proofpoint-ORIG-GUID: OaM0VqlcYgpfjimlbXYQyXHuhr1VrLoL
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa5c62e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfX2tfD+NZgFQbr
 GRvAxJZSUTV78poY3hulK8Z8bdkCcZwabpwzq0e/rWLZdZxkKvH6Xm3EcINK9K1YQS+n4xATMCn
 HfdHMoDWHWLBUJmePpnKb2nl1dFNsV4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNSBTYWx0ZWRfXw9OTV2ouu3qN
 ZINOe3S8OmcfqnibFpruIn+irZBw1WkGKPmyN2e3MSUjeVgIbZSdVLITJZL3jpjwJtyLQhxjCvP
 80r2yMgaJ9OwkxtOiX9eQBHxmc6bRUqN2+egQ0TJlQ0QtTPDf/0Mve7clEwpah9wrCet3WV0UMn
 xLNCVl63VKNrXHtWfDk5cSlpzpR7rLb5fyadIZQYy+amF1kauE5ia/p531cbwH2H3wqmLlT2rCk
 yMfDvWY2Ibdv+U+EXGHLj5/TP23JfIQ6vQi8RFsUMf4GxgAPrc6Imj48ehbioAJ9EyunHX8yHzh
 GGYOnh1hVLUdSL8EoFna3lv/KXJRtgAfunW1P2fywd1v0g9fh5c+9Dx82Lv+4U6r3xiFadgSfFk
 W6tVb15pd4ZyhZmZSQAXRNodaTKrZhgVnXAMkjzpBE2CvO4tmUNU/bxDceJ2b9hkLtvg1WQGPbb
 hTLTLefN/AOaMMYY0mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120315

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

