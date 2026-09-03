Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CA4E80B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449936; cv=none; b=U56Mq+mjBfyrYxwBO9QLtUmmlMuYbvWOEK4VpVropSfQsNa2aBRUJTWi7n8Lb2/ZX6UGpt31Jdjd8z/P14vdbO2to984JURc4Qc6jPU7RQx/Zb7epq+JpB4cmLTZ4aBqvXhvAlFiXtH66V0zKo/Bve4BK3vHuAW3ps5bThHNtHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449936; c=relaxed/simple;
	bh=RQEdq61Vdn/o+GWlDrjCXx8XW0FGNdrwBRRRrc0lBxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H1CnpSdDULIe1oONoNuBvjstoJ5OEAL1CVXILcCT8tC7cRHvQBcqQcM1L1U772xewoy/YqtIN4+Afdq3wlLV2C6b8ck2iO13E7/Ge5xkDcvqZZey3YCrxyM5TwBqvjC+c6IreH5H3YeDtnpijZgrcQI4+xXF7l4sfQUTbdSXfy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClDr0Ue7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqOcObVL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClDr0Ue7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqOcObVL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAMKm539090
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/Yyb6SfNxf5
	UrztU26ZfRXa88f6Zm1ZntKgsLSKgarw=; b=ClDr0Ue7WdQ37SGzjXYbzK/TGGd
	WWS5Z+t13MxB1lc8sknSASSzuXfSmF5hGXNHY5F0bI46gFmInq+yATE8fLp6skay
	l/KQ6arrkCgBSjBJiK59XbTdcH/H8dhsaQodNURqXYPWha2hHK1AwNx/e9JyaSUb
	I4SPGvQ1GVpkHTcPHXxT640sOvkDRfIhP1s0HAGTRFkdnyac5b5+vm2EPFTeyp3m
	37E6P2Q6k9FHpittw3mr3lc37Mg9NmqmIXc44Op/yxjS9/9xYRghyM+JYiKa2o2g
	mUP+YCrE3gtI5pDRl5XqCayGW4IJ001ltNNn7Xa+NLH6UWdN/ZeHSo0oCjA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx1cyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:38:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1159614b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449932; x=1789054732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yyb6SfNxf5UrztU26ZfRXa88f6Zm1ZntKgsLSKgarw=;
        b=QqOcObVLLjZqIwmQH2a9vVsXBqqWHr0VrPNasmx5nUuyVdj8ShP+97k/HxfEeEMLgC
         V1wgzKP3RVrw4QNvKh5L2MS8gBb0WJshtuoz6fZpQZIgVoLNlwq5QwQ81MRhkwEmsjEF
         Q0k22dBZdG21j0PK19oizqgnqLMJILTBPPkbQLAnXrnpmhhCVy/fgjnabAV7I0Sq+Foy
         rgp4ZWxdonVF3dISP2OSBvRSZB4DKJW4HKFh1QHUoov20R/UhkIgQyj3SU5TLLrm5DsI
         rDl0h6bRfgqQk4xm8padC9O4XDU3X7tROw5jQweKk/7q68L8PrwORBFfBOjRgSn/lnc5
         qljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449932; x=1789054732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yyb6SfNxf5UrztU26ZfRXa88f6Zm1ZntKgsLSKgarw=;
        b=CvdEhC31geU7lmUd/0fCl4QLuO/KqWJAvs+Y2LxFCIQjnFnRVF6A8FFUVbvzBHky+1
         HeEjqUckWuoLVW8JEsRrVp4zJ4vfwFS3oEEOchQUzFvitJE2BqlsJmufGYJ6wCBM6eJy
         vIObMpLtpWbPgEDAL4FtueRZCwhajMKpno3FTxeZfmG4tMnkwQRVLDW6tpzVi5ARlPGD
         M1yqmsjvLF68+EDpYGjhuRZm1DkrssI4woxY0xiGqL+sV4Jusz52+CUjZFMrUr2/y3ah
         cSS9ouTZ0mAprardmtdjOoewKo06WouUnzmLZ5iaMw3uBvsD5CwxvYirEDuKwCWljCH/
         ZShQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsQmcA1pHQ1vb3QSxnMuScFPZT3dvy9ySACHo/cr6PUOIxhqJ/ByIR0qNnLdh0QhasKaRTQRzR2bnyzlA=@vger.kernel.org
X-Gm-Message-State: AFuF++msm+wwk4CfaD4eC7FaeUBPql3yZ0Y9wBmF3rde806KNjvPzhPH
	ZsgLRdzDxuNBFyojq9qShT7i3NgvnaJ/Gtwesn2uxaE9MEZrBoRa+7ATZActR1/bGJ0u/c9OdGl
	T0omrgN6h8jBUm8dqA+mgSrUw5oeHHLWLLoHG9dTJv0SgsNQVWUIhc9nW6UqZw1ccETU=
X-Gm-Gg: AYBFou3XevA/opQv5TrGizEk3RIMA7MSGIvm6O6mL0b5GIB9upk1txlTbuylRGI35HW
	qUtpqK0YqhWGBHtL2FYlSzt+K8z4o1WgV0onp4I/x55eDIkx+Q796wsYs9PH1BA4garSOKWwuKV
	bLgvvZ0K6htQA5hYu73e23CAW0XQmG6LqOXXtWRLjfdetndCPWz4JriVcj3qvpYUrFZG2kcUNiD
	neBkYyDbMNHPthYaOXqrBDX7ufCV6kEu4m1rhDmXWm16sYMKPtBKquujxjqPZzBFgoqvYxVU20P
	2u60Oa+l0qvYaRWN/RsE4pVTPk/VwfyCv2qZS6QzEShDCejZnRwq3VjT3Pnb3cNgZMnvYiuBKbe
	+z0j72suqimO5wXgStORi45uJ1mqJTWTA
X-Received: by 2002:a05:6a00:2e1f:b0:857:73c3:4466 with SMTP id d2e1a72fcca58-85ffeadd0dfmr5735125b3a.21.1788449931375;
        Thu, 03 Sep 2026 08:38:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1f:b0:857:73c3:4466 with SMTP id d2e1a72fcca58-85ffeadd0dfmr5735074b3a.21.1788449930921;
        Thu, 03 Sep 2026 08:38:50 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm81069b3a.40.2026.09.03.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:50 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Thu,  3 Sep 2026 21:08:23 +0530
Message-Id: <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P70cKcg0-Upsi1JJbPDJpb6KAWtJtfGz
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99948c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: P70cKcg0-Upsi1JJbPDJpb6KAWtJtfGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX+TG8bCq8ZXWg
 6xPJdlAnB9AVMlwY7y6sOnJvISiDysJAavkNZhKfuvIve5bGz/KNr32gpmf6wm+cS+z6aPzuJNa
 Te2p2RUg5YMLGfhjOU7y2yI8rS2huQeHjnHSDy61EmDCUyAtYZxerl+fcYQAM0/1AUjHECiI/ut
 gBp8+4xKrOW86WXuOG8eJMuZcBhcvL60i2h1qFRNZKhMr7UEu/fwpE4rIVLMt34EaYKH9kPumL1
 +drQL9O1HYBPF4bePI2V6l9Pw52/aiYnyY0jAKRLvaRxramXCgh8o035/pkmYeqTT3o2Gfw5FxV
 GcEN677sNctHDH8hZ76u5Bc9wj/LVM1EfXasKdCY2PW/hQTDPrpL5XX68CeUYdm5pMuNoUNEtfP
 04MSbLVql3JI8Euft9Ywr11vseJEGsjpkmrYc66Il41lID6FnYqJct4VhNTo2SXl+f0wOkceEt/
 U0z8TGLeVH+a4ixT7Yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNiBTYWx0ZWRfX5hWXwlYhO24b
 EjfQA0RvlB9PJjHrZJbZg5Mlx+JTpqushHy+b7Q8mUFgDdIw5K4gk8LKpc3mg3NMWBild1fzxmg
 oYn65fRYaVxNNXWaen1s6YCfpJnglpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030136

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms, while excluding the clocks property since
clocks are managed through the power domains.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..c6db7bcf4981
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 6
+
+  power-domains:
+    description: |
+      Power domains are provided by SCMI (System Control and Management
+      Interface). See Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+      for details.
+
+      Exactly two power domains must be specified:
+        - "power": controls power supply (GDSC) to the USB controller
+        - "bus": controls clocks and interconnects used for data transfer
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    description: Names for the power domains specified in the power-domains property.
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    description: |
+      Reset provided by SCMI firmware. See
+      Documentation/devicetree/bindings/firmware/arm,scmi.yaml for details.
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+
+  # Firmware-managed platforms do not use direct clock/interconnect control
+  clocks: false
+  clock-names: false
+  interconnects: false
+  interconnect-names: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

