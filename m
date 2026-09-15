Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEE47ACE2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464875; cv=none; b=MUImFMkCM39yYAPoYpIBnKG5zrvs2xWlYYt4ih+hRAaZHXEMHrMPPdDpa/AoD6oWpnIG/fmMSTjxJbk22XH+NPIxDnvVc7yv6D051yEDbNWedydSOvDygvkr5/OQTScNXipCuG3XB+fvzMMjsJnO/BoDWv2PzEof2wY0Ktg79hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464875; c=relaxed/simple;
	bh=4Y7/BnZcUFrEgM1M3aWoxe4/JqGN1qzGZE/EYeVMFPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/O9TVTv+TeqgtOZNjVO4t0J+RySsrlN3hhEnmPoIp1LzvWH45eg+dgaPu0udM426PlymhqZ0tWm0IpYSG4NA6F9YEGs9jC3c+zGzp+FeVOD/FDJZXeXfJIc3eHj2PNmqnU+2ZS9uCMsBA2YsO39LAvCo7pxj49t5Q2bEynXYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipX4Wta7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN1izOFr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipX4Wta7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN1izOFr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7p62167830
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vziENpfhIwxS6r4jU+sREIUNJEwiQP7su9Qf9cAf5UM=; b=ipX4Wta7E0PCSiiU
	6+veIhQqmPMvcWOckKaJO/XtMp2eMWnmXjWmeLImxPtQA/vcdhpPnpbohi3PoKm2
	sPh8Dp/E7/UJCAs/eXuElPNslZJwkhprsmQidkfGmfxOVrgLnmU6BElXO8ed6/X1
	TWEYSeBMEea1/79B83oaEbXe3Jr2yjgmKWCSKOukeWDcXiLuo8qPZ6yz0GNfPC/o
	o5vqvom4hIRT5Edl379a/tw8ODACks1SuIR+Hj38+4IDA8Kppf5IPIThvcaW36r/
	FBTJm3WyCV4SFwSVPd4ApRQqpdA59byDSpf7JZVb43GfROT0XEQQebk6N1YkCOPe
	cFqUtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9b6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso489418485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464871; x=1790069671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vziENpfhIwxS6r4jU+sREIUNJEwiQP7su9Qf9cAf5UM=;
        b=TN1izOFr3k6oAjQFuK0SUGa8qSk2eB8SCHtnA7vTVncgDHPjjYvg7pTWd1sK2Oq5va
         7EeH/1K3E1CUggrvXhAj2T3Ydj/qBxXIm6o+C6XlQ5jgy7mIZu7XJ5vtTDQsoYprO9wP
         FZRvJ0wZiO+VY4NA4UFuEptzdSQvhKNqYSnLENpdQEMvt7Voc7bQz0/4YK2ktNFSo45c
         nCiSgYSkWmK6ZT+Z1EC8tpTGN2L9kePzRPxhiYnA5LLq6ufHFB/K32GFRYHmfCHM2iXw
         0iCwZ98R10gpAcvJiaaEztP3iGnzbd0XlmXC1mxIc5UxOEMHRuy+2Zwdy6sSaQTzsjOe
         oMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464871; x=1790069671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vziENpfhIwxS6r4jU+sREIUNJEwiQP7su9Qf9cAf5UM=;
        b=IiV4SraCF02qhz3auKUafpvl2ndyAtMSfISMKvtbL8qUd1zj/492O40qYCS3+cTUtZ
         OgRVZnjV4/379TRoWsod9TKcaXS0jiE/R7f4brb5npE1QwDiYd3hzOajA4m4clAcuWrd
         rsI9f3NdOlo7bQpefqlweHUbSJ5ajxfpKukc+eb4SGOP/2prYaSN6/7wBhxpgAGJlWts
         mZyzPMP8reQQlLHrWh7Pv2zezUY4fawQEZqOuFvjt52cNkUXeW8wV9iAEKHC9T/hemxp
         J6O1+Eatrfi+cHG1So9GEvNTIBH04DnrVvEwF7VkqAQ5SDYW3+MOmybR2UVBPh6bRPA3
         HwgA==
X-Forwarded-Encrypted: i=1; AKwUvByx1yh2VaKTtstS2ejSIIHzR8uRky6RJhoxoIXx14o8aYUxjCdAE5s4qzdsRjsCqYwoHJmjrolfVH8mMRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kGBJatuXQKxrMS15rMJOwgZeTwt6G0ie6WrWaVwnv02afeNKkv
	8dtAsxS3lGFEg3GY+0wNfhJz0XBUOUg4aIj6/34cUW/6SeLynGz5zP0DogDc4poKNGONd4gsflu
	m7SrRhrfpdxb/R/jCGfPO7TrFw4lD/9m8WJDfcyjWa2laO6tPjXwW6BytyGRKFh1vlfQ=
X-Gm-Gg: AYBFou2SxXMY49PEWZaAICuGyIWCYw+d2Y28g9cZGsA3AW7QV45Kr6WIkEPxHbXZJbp
	yb6QBVoxUVHNq0dPzvmJCH2vrpE4D99tn30oG28vuCRlDJhuzTu8Xue2R50lXTzqYs75eH+3A51
	WfjwlI47Q9rYnt/7r9lXDkou4NYce4AlrEBFapVM3Stg2Na1ZhTeA6xccWRCQ3aqp2CK4ooc0Z3
	R2LuTJ5YbTc2m02FRxkGbM2sTdQ2UD5SV+0MnGEmsf/PLsKSQElQeURpV9LRL2DGKAbxf54DX7V
	nObTt4SEy6y6LN38K+LR/PO8iv5IyyW88oAYbU5MwKXJ3mRSuZNM+rXix72LAYInIuN0+xua1Hb
	njuuVX1BHlW/TJMagzD9fdmaogHMVTiz/0sIiotGMwiOYGlCzDU/IRAOCgAlB4YNYPkDu
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr910923285a.20.1789464870964;
        Tue, 15 Sep 2026 02:34:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:fc18:4233 with SMTP id af79cd13be357-93a2989422amr910918985a.20.1789464870476;
        Tue, 15 Sep 2026 02:34:30 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm447229985a.24.2026.09.15.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:34:30 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:34:11 +0800
Subject: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
In-Reply-To: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464860; l=14510;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4Y7/BnZcUFrEgM1M3aWoxe4/JqGN1qzGZE/EYeVMFPc=;
 b=S2LbhFLWB/I8L9vo6ucSnRxcysaoSLJ93yhlqJJuf0D+6dYcFSHB4LSAkAdBCS1aYM2JICHsi
 USv6iUeKw9LDakcq7A8ikDIZK70ksNwwo38ZXUqO6jbhwj6/YRe5UF8
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX8uDD3bRpkEBK
 OvXblx6w7D8RdRujE28jsxkquISmJrallo+lvpOOB1ogfR8Bv4xOCegQxTMQM1Q8MRJNjzXF+8r
 NAoEa3HZl4oyT1o2olnh9hFnS46f/O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXwb8h51ZA1aFG
 9hbuQFmDSYJtXl90fbvSpTvCw5rfHJ2uTsuVwvLpWJocaJxoj/4iMPFRE6HzQoY/ZmVywtHPa5T
 htidz1O18LJvGxScvhUmycRVen2Y1n/HKFdZq4AhQo//tPVQ1TKhPC44PHDeH/k8gYFaYo2yPYR
 9BRJ+8kJMQXOlkeHhiU+qIgZAJ0k/CMKujfqQhs2x/aAvFRaIqp/1iq3zyzRifDx32ma0kFAr44
 CaYHjqZoBAzmL4+wPe6a1JmN4UwxYu7YG0cVwPChXa7CiRcuTAgfEXN/ydGQz44JXPeXb1s6HNJ
 2khX5wrWshWzP0QdEKOB0gm6jmk3xTcYKIC1eCy43bdxlY6YPbd9B01z1g8O2JoGsMZONP4CGrQ
 tybv0hpFzZSOoebW7ztXywkWTTODq5dA/u9c/Q+eZ/3FgXiGjLV7Y1FGAs+voX5jj15GI6AnujV
 //OG5qMHyCTkF9UVB8A==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa91128 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7Lj6VqmjGphfb2gh5wsA:9
 a=fpGo3EBYbuC22VLp:21 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: pDnHU9J8oOq8-dGmONYCWmPO4ZANnjzR
X-Proofpoint-ORIG-GUID: pDnHU9J8oOq8-dGmONYCWmPO4ZANnjzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
platform.

The Nord platform provides:
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 10 x CSID Lite
- 3 x VFE (Video Front End)
- 10 x VFE Lite

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
 1 file changed, 393 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml b/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ba724ecffa6cee9fcaca6a116f3785d76597def2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml
@@ -0,0 +1,393 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,nord-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,nord-camss
+
+  reg:
+    maxItems: 29
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
+      - const: csid_lite5
+      - const: csid_lite6
+      - const: csid_lite7
+      - const: csid_lite8
+      - const: csid_lite9
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: vfe_lite2
+      - const: vfe_lite3
+      - const: vfe_lite4
+      - const: vfe_lite5
+      - const: vfe_lite6
+      - const: vfe_lite7
+      - const: vfe_lite8
+      - const: vfe_lite9
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_rt_axi
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: top_ahb
+      - const: top_fast_ahb
+      - const: top_ife0
+      - const: top_ife1
+      - const: top_ife2
+      - const: top_ife_lite
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: tpg_csiphy_rx
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 26
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_lite2
+      - const: csid_lite3
+      - const: csid_lite4
+      - const: csid_lite5
+      - const: csid_lite6
+      - const: csid_lite7
+      - const: csid_lite8
+      - const: csid_lite9
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: vfe_lite2
+      - const: vfe_lite3
+      - const: vfe_lite4
+      - const: vfe_lite5
+      - const: vfe_lite6
+      - const: vfe_lite7
+      - const: vfe_lite8
+      - const: vfe_lite9
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected
+      - description: S1 HLOS IFE_LITE non-protected
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-4]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,nord-camcc.h>
+    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9b32000 {
+            compatible = "qcom,nord-camss";
+
+            reg = <0 0x09b32000 0 0x2000>,
+                  <0 0x09b38800 0 0x2000>,
+                  <0 0x09b3f000 0 0x2000>,
+                  <0 0x09c32000 0 0x1000>,
+                  <0 0x09c37000 0 0x1000>,
+                  <0 0x09c3c000 0 0x1000>,
+                  <0 0x09c41000 0 0x1000>,
+                  <0 0x09c46000 0 0x1000>,
+                  <0 0x09c4b000 0 0x1000>,
+                  <0 0x09c50000 0 0x1000>,
+                  <0 0x09c55000 0 0x1000>,
+                  <0 0x09c5a000 0 0x1000>,
+                  <0 0x09c5f000 0 0x1000>,
+                  <0 0x09a92000 0 0x400>,
+                  <0 0x09a93000 0 0x400>,
+                  <0 0x09a94000 0 0x400>,
+                  <0 0x09ab1000 0 0x4000>,
+                  <0 0x09ad1000 0 0x4000>,
+                  <0 0x09af1000 0 0x4000>,
+                  <0 0x09c34000 0 0x2000>,
+                  <0 0x09c39000 0 0x2000>,
+                  <0 0x09c3e000 0 0x2000>,
+                  <0 0x09c43000 0 0x2000>,
+                  <0 0x09c48000 0 0x2000>,
+                  <0 0x09c4d000 0 0x2000>,
+                  <0 0x09c52000 0 0x2000>,
+                  <0 0x09c57000 0 0x2000>,
+                  <0 0x09c5c000 0 0x2000>,
+                  <0 0x09c61000 0 0x2000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_lite2",
+                        "csid_lite3",
+                        "csid_lite4",
+                        "csid_lite5",
+                        "csid_lite6",
+                        "csid_lite7",
+                        "csid_lite8",
+                        "csid_lite9",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1",
+                        "vfe_lite2",
+                        "vfe_lite3",
+                        "vfe_lite4",
+                        "vfe_lite5",
+                        "vfe_lite6",
+                        "vfe_lite7",
+                        "vfe_lite8",
+                        "vfe_lite9";
+
+            clocks = <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&nwgcc NW_GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TOP_IFE_0_CLK>,
+                     <&camcc CAM_CC_TOP_IFE_1_CLK>,
+                     <&camcc CAM_CC_TOP_IFE_2_CLK>,
+                     <&camcc CAM_CC_TOP_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_IFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_IFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_IFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_TPG_CSIPHY_RX_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_rt_axi",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "top_ahb",
+                          "top_fast_ahb",
+                          "top_ife0",
+                          "top_ife1",
+                          "top_ife2",
+                          "top_ife_lite",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "tpg_csiphy_rx",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csid_lite2",
+                              "csid_lite3",
+                              "csid_lite4",
+                              "csid_lite5",
+                              "csid_lite6",
+                              "csid_lite7",
+                              "csid_lite8",
+                              "csid_lite9",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1",
+                              "vfe_lite2",
+                              "vfe_lite3",
+                              "vfe_lite4",
+                              "vfe_lite5",
+                              "vfe_lite6",
+                              "vfe_lite7",
+                              "vfe_lite8",
+                              "vfe_lite9";
+
+            interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu_2 0x1401 0x20>,
+                     <&apps_smmu_2 0x1460 0x00>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_IFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

