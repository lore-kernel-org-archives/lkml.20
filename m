Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E846AA94
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848775; cv=none; b=RwiWf7ToU83otolAi5VEnpDRhalzacvWXXhYUzZ7klUAQzfb7FMFysoEsauOuidU0HUZ5X4+Z7lXvt4c3pdGiUgxcRPEiUxN6GWioRaJecarqKbiuv3QONyKnqj2jMo5RC9OjckYLrvWKylVQQFo/HDkj8jQOIUJs4XeqqUWtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848775; c=relaxed/simple;
	bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sN9fq8zhWrivjfWghK4brL3sHwa39J6guaHQTGmDsM9fyZtY7nNsaXEbkDwcCOA4v3GhgfvwZU47xMWONQ396xMFy5SF4i004GxxI8LYjFwn3EdIQJut314fkGaNlF+lOgsB7DQw3WnFZgI1kTnGZtZzHFlGKx8A1OLjYbMgE8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRaTDKn2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knUGf4rO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRaTDKn2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knUGf4rO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RG4CIt342126
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=lRaTDKn2ImD9Y6EM
	c+HsLUu1yqskFKM6MvArwolSn092MkzomwwJWJzWqcfc6irggHPgvoJVXEPGeSsm
	Fr0NM2WEgKWpMicjignIZ3MRUe2oP9ydVJq5tvi0BE+e4mFJgUZt4CLDNjQlQPNs
	JFNyEvuH/dNSHLQjcHXrPARPnGuLBZ4s+AUp7wGCrqPFgddZ2dxuuGAPFLYJhbC8
	bz6D3VoXcRdCA3qvlbwjl5oQH9nS0dsSFG34TDPUxs92ny307LBeXnXsDaYX8USP
	6AukRjz68MJaIPeSVaq646iPhU5j1DkcmCg/Vp4FbQScfmuJbXcxG+TCFUbndIa0
	pXwBIg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee04u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:39:33 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso214689b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848772; x=1788453572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=knUGf4rOCDxuwvUa5d4b1TlJzE5+/4hCxHzLmtJHf/gW7I7+Y53C86v9djaqAAy5AZ
         /3RePjapu4ad8ZPJbRv1zXW81Z8mLiLCOhKIH3CCgIuWatiRJnm/tP6ZKii225m7LOoe
         dMD1iYlPfMU/9xx/rYJrIPsTiANAUMM1OAykY8wMsWP6Vqmt7UtALeq3BvEdkL1FlzyR
         76r/VAiZAoLNWvm+Sbyi5TxYAeWCTHbOTBj55O7K9SCOpGpmu55Uh5b+ygCrQbc7bZEp
         o7jI5fFXEBtRvAJ9HzSj1GVZbQIeUF1+UnuIX8qBXUyag6zOeMqz04/J8nUhp3c2nN2U
         AkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848772; x=1788453572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=jolPZKS2rb6+PBxswvlt3jZFz7Z2yVnYHOY5BwIX0D7jrL/R6KwXGr4CAvqvVn9upO
         ASf5/zs1SNcU72ZY9B3T2xdFNzxARwakLTJ1JrYROFnaq7xJVyXS3DelHLdGDT/yhjsQ
         ZJFCw88JQDF1Hz8enzMLoJXbCNgORB+dITBaYfsb5UHV1/JurzD20XYDMkFicfKpEGBR
         zQ4o4bA15jnhNmMquAcdqCMVElu7BftyUnufrhS/1nBeiCYLt1sIy7rCZJCysi5cNboQ
         6XJB3mQ+Vxe2nXa+A8C9X7A/YAyOdzI5a6f0I+x0F6lIT9YGHYMSRSCKkGRNTbdjYBvv
         HGTg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3EhXfI/WxI+nWorr4BFhOV7+Cabqs0TuZXIqdMGu7Xl2h3xBlELMZZkuW+FGanptpkpN3Jo4VDm2Itk0=@vger.kernel.org
X-Gm-Message-State: AFuF++n9Alxqxr0VAciyy7SkaIh5SjT5Zm5+forEmptV6x60cS1ze5F3
	052T2d96WtwA1BuciN0oMECxLbtrSAZzm6AmKTRLkGh2XZZ0zVXMalqfBJP6Fpg85JPchbwLHpd
	COLcU81VpmI8Hksp97IQzCuR7p3W8mX1JUz1HYXYg/8jjiJmXEDjqIOAJUQKUSa1Z/W8=
X-Gm-Gg: AR+sD11LA3Z5uBhPFW5y7fkYw63bNTPFklp6v/pNZPuc0YNAq9ztPw03510gpuzZovh
	gYIETe/a38hblbuWXsTP4Schsdc/8UtNgkrBsw7ufucVx/MHLyhntP20CR6FrCbZbdn6HxNGUkQ
	Ae8UEEA6otdDUfsRdMBloc/gA0ZjI3J2OZuPsod2V9NbNtLjW2WcKDINlJloPNUeTO+wLGmteNs
	82R7QbtROognFSHETk4/Qdlv6I/GAjxHVvPxa8Zd3DHcYQ9rppFu555NEhI0ohvY1Anjm3+ox+1
	zdJokSx/XEuqHVul4IHTlwu+PILzhu5qHrs4qsfsXqLcBD9JHesh5dsat4+thl0Ke6m2WYohvAn
	lQzjPzQuczIsasIlGXQB5zYZJEG6nXPXjOKK70UDx6yY29S986IrtJKl+KRUswCRMZJ2IZBZKXp
	5BMj1sKH69XYT5tk0mNg1YCsk=
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747551eaf.9.1787848772162;
        Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747483eaf.9.1787848771608;
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:09 +0530
Subject: [PATCH v4 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-8-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=fwLGC9BZJIM5/cbpxIquX/TnSdBSPeRCEgbOicDICXCkapdsB4ssHBS5BUut2kAvBatwP8yAA
 assKcfeMqvABvnEGMHmDn+jlO5WBEyhGQF3ncvO0mJgMRD5KdDrNKxg
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX7lpcTtWlEOIr
 uHkBS1GPIy2xkeSMkkx79pNtGxemEsab3D4xEaOjhrUODp0OuiVj9o4ld6LV3xOwqwDZnGKZZSt
 hmtns5UzVrtD/J/c54dgiHjSc4NBMpctCXXuQA0HJRD8xkeewFYzNcvbpFhHQLUG/WDlXuK1yCq
 kYYzgBy68aXayJgbQr8EIgHIJBykt1iKn0z5EmHl7/qIunSxqCTJh5/ChGjpe+bljgYxB3IiHP4
 Rzf/j+LuQNCbNmXOAXY0Zcn3sNcp96Y9H3iL0rodRdaCw99YPWgi/xEJox6m9uBp5oyx1P+J+4R
 fPuubjTyQQizVA9WSO/P45EiGV7smfu/fy2EU4hdYc38oAM25N95YbryAXLKUo52Lx5XYnw4cps
 HEhqbqYRHjiVAnVq1e9bKczNVNC9UyhXqWXhRTOjBTdgYCOjQ3MaK7zwfnimIQTTMdtf2ITXcxP
 yRfauDehr4K+vVHGxTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX4+bikBfrx1LW
 0PvPJD2o2dreljPfhJRgHZX7EJr19ioSgX60Tid6Cb9WPe/48IRHiRZc/KrsWyr0WkazYEpGeqJ
 rlfcCrUl/7n7nHfiJhtzSVevfiyN3sE=
X-Proofpoint-ORIG-GUID: 8Nt3_0XKCLsr8nUuVMDCBHcLjKvURf1l
X-Proofpoint-GUID: 8Nt3_0XKCLsr8nUuVMDCBHcLjKvURf1l
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a906845 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..2250526dfae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_cti_trig1_mire, qdss_gpio_traceclk,
+                qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

