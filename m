Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FF4FDE68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567178; cv=none; b=fVb/9cRH0WKuyLG3X25g2x8vch7ulS8PGDeGUF1Azf8++oCWGy0ZwkNxckyY9dHGlreQsL6oG91w9jWVAtvC8NdcUSFup335vZbK9yP3ZNipWzILgyBxHhcvHG8fqlJI2YhlGY5MwEokcOfGqqfkhaVinaB4Pd4noKcuMYRphsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567178; c=relaxed/simple;
	bh=dNlCiFXswF1Fr7PLA3aiv3UeITCFkH2J/BpCPdFze04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLz+bORDYDdaVTFdPvMot7sw5QSS6EbmaHVFgJ3bU+mDbggLFMOOBGlSXrFdm3Uj58qa12zeDqu21j3/0GmsVkeOuaQNQqH2YtZ+E8sUPBMl1IO2uJeeQpCMOJiGHoWUW5jWiBp6oO+8JY1fo0KrxeQsS+ZYj7VYuPgoveotvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoLpqViQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCmhOkye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoLpqViQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCmhOkye"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYHaF2014988
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vfNW1OxUfVz
	0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=; b=KoLpqViQzTDVmXK7KUjPZ6v9thN
	hraQ137W61/PyR9er7bjCnsUVaX1OOw4d5qoCw1CG7QEyrv4govplP+nwtc3jrrs
	2XEFX05/0EFoBXXUNw9eRKMkm2sTolHQPH+QGrIi4H6AadqnQ3aiYbucFNVhfiTW
	2nU33aLoJB0hKSsctPXyioiVQxXQKxbeXOcxbyreQAJ2XM9dreOnLpZTQ2rkEJqm
	iDq6gFOqJ8SavpymuaQ039+Oqb1NFoFnlAKLLUqgxKFhnTgdrvHBcK2KBviPbAxL
	4E3Lh3wnZ/HgAZyRpSytBTO8w/t2n3XbSabixc2n8YeI2ua1+1uowNLEWIg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnrh73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:59:35 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso6485193eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789567174; x=1790171974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=ZCmhOkye5h17w+Gva+ux+l13UAhSDwc3QMS8vkjuPX1gf26s1BrxgjxdfVEo5JcYKl
         2s1w+0ea579wujr4BR44uL5gF1aOKL9q+YS+JqqPTSwfciGrDo4wUSAd8FAie3930q3R
         qcBunBAfi0ghwdNWothmaIqeZtZaGZKkaCv91soSRWdtYzcIPNve/gcwzFcfkT7H/xVH
         3sGhkhgkBrzAOB/lsdLGOO/hrcMBMvaV8Oc2ds55rAkS4JXs9ZED+uVOB2uUPEY+3zmC
         z/scXEuXQbOMrWjRXA5AIsTMxRch+slsPvMJNI+SCt/afvQSAlEPvxVrC+HGfcmZsRDN
         WM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567174; x=1790171974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=2GszazvD0uBfNw3rBp8cRFSogv/Hp3ijgcvmoCwaq5DStBTmjwmmJnUTR6npyiYuqX
         8Ei0UFHhjUNJgXO1SPztJdxgubt0aWOhycxzJN8PJJirjG5+bDqeZpK+UqGYVNxQRuDM
         Ok8cbXmWC3GrTNEznGMAsKtnPGj/Q4+QR6LhFwmxCxwi3CT4jWXh6zF1SgiNKvQ4ekjn
         IjesJw0eSNpqDk8c8+yHS+UG8Mr5pEWMYJ/3aao0flqzLv5LYEO7VBTxKGeGR73ywfQ9
         58eUOJrJQgzGsk/sC53K0sJOtnKuixygwfhfpmMsFvFVh6AS1u2YBZOAtk16s/EPSfta
         Yptw==
X-Forwarded-Encrypted: i=1; AKwUvBxLu5YVTX07C5u8H0IX5V3pX98rPCPIffy6qftUkPyngG/rY8Eqb2NcsmiY4r+PlPf3aB86gwqnDeL/WTg=@vger.kernel.org
X-Gm-Message-State: AFuF++nAI+Q94EXwJz/U05O5ggNnLQPDeWj+fhqxy4UtqfzD/dal4kxz
	ieTrowACneNZg0NqPRVojQeiIps+aW/HE1yzGTKq1ZtxdOHi0McXQexya3mrl/93Fgggbv2eemL
	+S+ziGGmEAF6nwJwkfgCXxwhqmIUEzwTckOblwmubX78OjHBSbh17vx55GO2G+tjZNsM=
X-Gm-Gg: AYBFou1LjWSR/9Zj1tWX9BKrXvNz8zNufbxyofyL5E55MIUYjgGDAL5AbkiHjmRSZz5
	j/C+yznJViTYvu/+6pSLVdbCSPxrqIAKeEb0efAxYgE/NQma6wUh0Uc6vPHQ5bvu3Jw4pKYaeOB
	voLGoTYckbDbAFcYw9sQze2D8BkaKT+Wx1vuWrDa2688BnS1nFgvaS0thXBr/oRs8IO/6EIMMg5
	fuwpESck2wjhE9PnO0Ukpnvfg86JxnRT64NXPjsSFsBYgfzGHsdfL+8L31vZhkl//8l4jpL3zFK
	nBVTnidajQTKNxSFBhGT7e8lyqCVwDSgvotWWe6IAXGZnDG71S88ZEDNoaBxlk3aqyZszhxxGSU
	nqKpXZ2BB1otthiRB//NwWtSnvPQmqKgynF+PFEdpFujvl3H5fKtKlUwMbQFL
X-Received: by 2002:a05:6820:4c16:b0:6c3:ce1d:8e15 with SMTP id 006d021491bc7-6c7d1fe8056mr2678783eaf.25.1789567174366;
        Wed, 16 Sep 2026 06:59:34 -0700 (PDT)
X-Received: by 2002:a05:6820:4c16:b0:6c3:ce1d:8e15 with SMTP id 006d021491bc7-6c7d1fe8056mr2678713eaf.25.1789567173870;
        Wed, 16 Sep 2026 06:59:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm6507940c88.9.2026.09.16.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:59:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Wed, 16 Sep 2026 21:59:17 +0800
Message-ID: <20260916135918.1017527-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aE5HnGHIs8Ypy5ALqIaLaFA26uIz7Co1
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aaaa0c7 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=WZGXeFmKUf7gPmL3hEjn:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfX0Sc9s1sqo+Rx
 BvGxnYIG/QpWPNNg5MiMbHRPJZjxnIscb3d534u9KHjSTD9Y8dDhV0S2p7nsKWmZzTszYVe9pDP
 uTxBx6fCcumYPt+XXVA/OpjrmKCzCHc0K9J2vIb4ziLA7y6uRsQqjk5XlYm8VrrIMyxuBYMzwns
 q7/4fqOeFfQmagZbo18swjg731+c7xgm5CQ3z/GoFg0QgNEJXBzhGCrvTJcaPBPeQX9ivkSVlAs
 txie69HapmPTMwJ0W0DbmrMpUxCDUA0HFnLqLz04zAxJciWTUv6hh3zoVP5ArobkmUSRwrJbRks
 +DXn+ZogdwwOtxWfcVTdMJ8WtkZ8hYGq4+RadBS7p53k669ObPFOPmCJM1qQ1Zcb7QoliH0/2Ku
 Wbk4uqaiqg9P+U8kScM8i5MVGj+dd9lQVfS8Uh0AZXv2nuNP6I6WMYhAhJhe2sNjYd0bLkwRr2M
 qaytIPGgUKnB6mIx1TQ==
X-Proofpoint-GUID: aE5HnGHIs8Ypy5ALqIaLaFA26uIz7Co1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4OCBTYWx0ZWRfXyBahZQWYhca+
 GdRvkFQUfqbbYHxCW9vgouXb3g6W6eOT36pmkUrxhVvR/9z9SEETCStJ0P2nO2+wcN7l52Q1Y/4
 hdOLO5s7jVgRmHOZOpiE5IWLCq1Anz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160188

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

