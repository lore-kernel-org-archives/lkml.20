Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8C4BB29D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005006; cv=none; b=Pi98bWHrcjDPkpuTPNh/yge52Nz5REHInuIV9YXxTMie1GKgMkM7rDUCBWhE7P/s90oeFDF7fyYEpj2eEJy9hxmiBbVb2/Uz3zenGaxhZntVZeDWZeYIUrexdbKBDm2yqfF0LlObb4+s0/XMDUl/Ao29cVSF5sJPUi+SH7jAenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005006; c=relaxed/simple;
	bh=Z6cS8aJK/HbBm0d7OT7Xq+/FQXVHHZKwWRt5CJiiGpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QH8h/XRMkjscbA0pIaz6cKrnyE5Kec4ZMCdRNkLI0kfr9eTjvuFlj+KZfb0zi+s6QCA2Ji0PPtrBq8Hc6UUtbQKiAyWGRmoF/UBklpC/eCJtbBPMTRoT53SHgoRbmnB8cyrwtN9pRhhG/cAQBEEyLP/d6IlgcrX3iyio0VsVM+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6FyLu8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKeMEYQQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6FyLu8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKeMEYQQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAqNJ1533752
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=n6FyLu8blSR0foVq
	M6sxjbQJRCDeuqQRZLMgjpIbW3TLMF+hkkRo7ZlobsCcehIlHx4BaQ72jWyzpw3Q
	EYIIk2/u2r4dyy3C8LzqhVzdD1eFceotWayOUWHpR9lwQNjg21a+Tw/+1HKeFywP
	tF0GAV1ohHZ1V58JkNvaFte8U2TwYeHowhi3Lfsb0+ViywgWn0KsnqkyqOz34ZX+
	HSr3k6OZDQR+tdVeXsQX1O4PcTIjiiNXDmjT5rntD+fRp7zKmK1wsaDaviTej+ad
	byyPRUuIYy0dHlBGCff/+D/1O8yHaJOiAVgu6gTY9tTA8EnFjNLLyyxF7Xmrliy5
	mmJgtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bbdyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78d25a8ff32so844812137.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005001; x=1790609801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=PKeMEYQQBHrAYPoobmsHPRtT0HRTn5GIEdjSGF2OrQtXPswPzy7YmG+KFHMhw/RO6C
         HuIzt7BU5CvRSCLp56/gG2RGr9t+QOYUbM+RGQEotTw9SOUFsNTAlpt1+2mG853pjCCH
         VCMtyNlArY4s9IDP/kWRury2tzxY+MVS+xUEDQvq5tIaAhAkPThUjfd4JVraxyGZW4Oz
         vHpWOzgjs3jEOhI6dLqSTGQNQtvpLDHWLS/5ew0T39dsgPYFS26wBaYCiKfscfPfBoba
         oSVU5VlerX2v7ZZk2yWrvcARu+oQgtqdWj1X1fao6+MSWbLWVS0e5eVOqxGaRudlLLda
         mtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005001; x=1790609801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=cSsD+13T8wIJmSNzxVAIdP/oJbHsBcxEgcIqxMUnxZ6Rcn9Nus19fxlsNBG5JOJI/z
         EmlPunx+xj3OdxwKZfYEyRzQGSjJX9OS2UbsjGM2FLNcr8IMMqKjo8bSrMeI+dArdh7r
         j0h34RL/53AtMoXkP8JgS+8CLPG9d5MzRsZnltBAsFJ8l6yHa0MJpg17wOTgGoTyME9C
         D38RrhCILDJxGMzwy3pqF+bih+N9z9HEsAor710pHKkMuRqjadI1VZi2bGVWMREd+Dba
         QNriatJ9g1GKDJzalD6tilBr2bjlFWO8vzpenfrtWxCnOu6pqn4wuxSgqx4vLAPEPsgP
         jMfg==
X-Forwarded-Encrypted: i=1; AKwUvBwXLfHhr6MMcRi8I/Gm4o4RGrNXLKgx+myQFobeuKivATmGDx59dTPQO2LXG90nCi6zeNWIo0QSlPgr2iU=@vger.kernel.org
X-Gm-Message-State: AFuF++kKYtxo3l8eNoDKAr8obeueiC3qylAHHKfNpUnlq7ey4xSto6TF
	BTD2j0gwgkI8mmuuTDUX1YL/Q1p77lQTAEAkpnrhjbrnyKRQmNUJbh11WEJNFHnA3KJrTd1N0Gm
	kcgzvNmwuZMbSUs2/wxnZrtdRftLAgnQArW+0IA65mBXrHlGoELI3POjYosUerXuI2UcttT/+cX
	A=
X-Gm-Gg: AYBFou0wLeoMnTg2dPEsGFVIjXFia3Tp9Ndoh/pTBgHMCFC6A1srgyB4X1/ZAK74+NG
	7LPlBJ+ZYHeKDu5LS5JwvMlp8d5x4vBZVx5K+s6n2HFZ/vRgptA+PXjaPBQUhQXgLCZSB6J+LMA
	ebl+Vjr5c5RZmH0aFIBf5PUdVXCxWJtfHPh9mDlWikpktNx38LGfB6mycAfmiR8+FYwHob7qAEn
	18Pp4E/y4mWE2uF0c5mzrzdEh2wKpuj21Xrg57QnkPHsrAosziFFkcmYQ96zKavj7lRzWg7QuXr
	aoweHcoeg/Pt7xrWj/cXMUVpgnKeQye0kyqyKi33DA0haBPtdGO1/mEGL4VVRcJnAPfEuHwbRLC
	kGIwxmo6E5U61jaEkigmNC9rcz2qten37iHqstOcfazSTXo5cb1xHtVVPEGi4TyjRXPFZzQ5Lvf
	3V0w97brsIKyppKHqIdgojrxVcYYONAkg3DXiBMjkqqx9LN7b8xKE=
X-Received: by 2002:a05:6102:a46:b0:7a2:4b76:6b65 with SMTP id ada2fe7eead31-7a55d69a2c4mr5106496137.25.1790005001093;
        Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
X-Received: by 2002:a05:6102:a46:b0:7a2:4b76:6b65 with SMTP id ada2fe7eead31-7a55d69a2c4mr5106428137.25.1790005000601;
        Mon, 21 Sep 2026 08:36:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:22 +0200
Subject: [PATCH v8 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-2-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXwsjFTVQLCsQq
 l8lSeuxvEXknNlefMqPQk3Bcx/HRdDUh3y35/pM6TrtNTCMsxOf51o1V4lLRv1krX3Q9XYv6t3z
 tLnEZYDoN/6htLmBQp5SriOVQDJQvTPwdpVAOTCGEqYWvdS8uHAZMLZj63ks4M8C94Lsgd4JVsh
 8aEtvJGqhcsw8v8TAw4zHp85/tymEY62j+WEG6UwP9o4yh4N3ZcHkUJ0j4KJbXXRWFGK0Do8Y4q
 LQbRtN3bQ6jqCDCSQ0MPzzbVw7wVf1aqH+VrEa9bi7l2FCB1FUdYoAqVCflD6I6SS9tkiTlr6Wr
 7ucjywHDCYBhPlz/ohKRsFnyarBo/IkX/OVmKjtKwV+o5o824cXVoghi1/wmrdY/KkrzZYyNha0
 uhOWjI6gmJWhjRxq9MBfxM9SoVRlbBwi23uqIp/PLaf5gdDrUes8qFdgg3nlapo9+k6ONrZnVOs
 4anItvs0q8uIXEFuYHQ==
X-Proofpoint-GUID: YxNkjq-4AFdxC58kov812U4vVnjO-kYo
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab14f09 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YxNkjq-4AFdxC58kov812U4vVnjO-kYo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX0cxbLGKNZfhO
 XR4SF9q5r3ErqqhLzcjJXDCPYwgPqlJuJaEpjpcKpJgduPBzrTexDgodTljmVsFgHqXYwhZOFpY
 wRbc6UVn9ALL/NupTSdT4Uw732nAU+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
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
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

