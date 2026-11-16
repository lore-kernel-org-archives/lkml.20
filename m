Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807250;
	b=P6mda0Z2ptpvnE6aMMPUrZi2fl/lPXBKU00YebpMJGjI6QdUJld0xFRUtLgcfI1xbyQp
	 8lfAtvOJEVSwZLIZDoEJRsrtpIlwFXXiMl+CUb4fzpqSEAeOP9FjwI8qIJxQJS+dhabbu
	 K1QSlJay2MvGMnoHQc/Rr1Ejj84ihNynP1Orqq2F/b++RwuuPoQezav3T8WkQyNfY0AUG
	 HW1+Qz+05tw5CzwpKcBt5WGeSj16vqABPWrzg+Vwk2ChH66Vwy2k/jBcOCCIhb7+RQ6ns
	 9VV56ECMm1hsn3AXgv6rLdj/bRA0+jaJlV3ROAgrbgnUcEb/CEjiAsniYeLo6hkzw+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
	b=Qq8WaJbW4Bv+QO9w+kgJ9s8NBxljzCWT7+WMlXk2UCs80+E8riMY7C8CF+Vyr7taTbn7
	 dqafdi0Z+usX56lkoLltL94bE/3rbp89BUyX+Iwj0xEfjOFLUnWu4RvcazJX01pa3rEIN
	 /NSwPamaI4U9DuTpA4LCmWsPvaA6pQn5XIAskFuhG8l9wz78dxNB5pnRL4tN24Fw2mxkH
	 bT0XFptDXluClW5z2iXIx2ZCBKeIfCvNQV9hNOxscio8jSw2x19NIJwOcfiAzklrXZ8Rc
	 bw256OgGSyxvokewHllZdrFWJQikGORPbJ5Z+gLEtHrFFWJZ4RMjBGeY8ENac0ENTGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AeTcQyiA;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D1606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AeTcQyiA
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6244558c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807248; x=1795412048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
        b=AeTcQyiAbWBnPbX6XYSPFcFsYeWuT+Gtq4Oe6DkxwFa6w8yv7E3YWQZaxagMAiyv11
         iKf/7p5kuWvoLJAx+gbbnxmJBSkoxDPx+eC6i+aVjQgKU17ArO4REBET7nI6LJPNniBP
         lwpIOisoFyYKZfRErZxhgkltJm6q5K0bU2dhuVCkHAaZZdRfNAXeh0fnnYzjIEdPvGur
         dHf9t+6BgsDvzyAqDLxXYqc9DdEbyo6vjFXYzLK/WZSgpWTmIS+zDrAwRRQgnOnTFKsk
         rViJ34OgLhJunM7VH4k1biortQ/oKPNtpHDVypgsxHIxRIvrPjk4ePbX7Jhz+heiXIiB
         Tt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807248; x=1795412048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6n0sXY2ihdnS4myjo8DBNolYG0W0qDR7Y2Fsakj4dZk=;
        b=Tdqdw+If2LWc/nbtufhHQFTNi+DkxOl1WxBqYFbJH0cnkyCMy2ESKAm3j0/2mXoMrc
         cuRLLbBJDcMjg0u7S0efKv4GjmicVKRFAvUgXzdDY4VPXS5838P/2LH0id0nRYiJNlgq
         6/k7fRPeVCJFsWBDu4xusljRv7q7tBwb43qyjR9ahabdJEXAYKptvWMQnp2HqhDJweIK
         YXmU3/RVdgvocGCudxEDxFN6kWNpzKx8u9RRvPb0F+d9gRUgyim8kC4pHGHvFxWZN0JD
         66uumLrNGH9/H26biD+81pTP/PV8J/wbbEGmITwLSqbE4OiFBCHQug8jq9ZNp6KGl6GL
         WgcA==
X-Forwarded-Encrypted: i=1; AL+hErGCi73ZEMHlZFm+m1ulL22oVrCaymvd83yUqZN4lX8DCsbi9AmkYSoigksm5eq6vduuPDMQ9RVx4GXaRIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9wdvIMGjw9Au6TkiwDbGqo/L21yKYyDwse7Ot5zUBHfe/NkAD
	NTNqWMh2Xdu9/QCIu1DfGZ9j3ciD70z12pi6Iap9kp7Ar1OPOBa2FWeX
X-Gm-Gg: AYBFou3Z7QG35BA2LNX+Eowt5MPgL5ZuK3dZ417fp5MrLwUNgMmh7sejsgIXll7zGgb
	MWGzTNKgmHndoGWMEqDNksAYcFaLMPjDhv9m8WAvetX9FFeVW88TwJuUAdOaKHYhc3d5RyawgIR
	hgXXVtzReDbN2JsVEO4oPxQGKyQktJBWpCInh9DvezHxdaYC52TFCcyV/YQvtg4qGNNpv1069Wt
	/GIXChQV44nsKls5k//3rAHijkpYx/oeo9rjoab3NntNqGaBQwTUaTpJ49fzAV8+j87GLjvtlxL
	oR6M9rNEAzcIZz5z3M0I6QIhX2oHnbNKzdu6OIpaRqcscDlXPJDn9AEWAHO4u/vcuXkupunjZVQ
	dVXZQAGW5oCV9DB34RlciZSY9VyZMFsOOSgL+qPOQ2/YdQsM4oKszGaWam0die8L1976b8FMYka
	C1ydI3aOQYfMsKQec+J4B+hDumVsyP1hlkyfTw0vTlTiFKhBvoqP1AkNC42iHxJk8cih4zCttLR
	VckdQtPmUScBWw/zPkKT9WuEvRzgwSFZC50J1jVDgJyUp5/HsDZG2OaRsNEufWV7Yr4a7R2O5BS
	GSHFZzxMNGPsy7SjGbDxMpi62cUgQMS4gCT2Qcx8/UnW5fKi50KHQR22b4ofLc7tpR2S9J+6f7b
	70N3l
X-Received: by 2002:a05:7023:88b:b0:19a:dc0e:c20f with SMTP id a92af1059eb24-1b50315f87bmr10004547c88.44.1794807248063;
        Sun, 15 Nov 2026 21:34:08 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:07 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:45 +0000
Subject: [PATCH v15 1/8] dt-bindings: clock: Add SM7250 global clock
 controller
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
Message-Id: <20261116-sm7250-v15-1-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807228; l=7988;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=TlI6xL/+9KtlUI581KVAiDRwoKRxLc4msMoZX3ID8b4=;
 b=dlOn23LxZqecVvvPFglD2yyKWYVC7pvwRGQjHnzjD6v4AeS/I2n6FGAsNbVFqCayUoOFCI+/e
 WaLBx6JR8QJBYVQVewXK7cEUTKHDCirCmWaAI/9OuXYXpLBHQb9qJWE
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Add device tree bindings for global clock controller on SM7250 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |  13 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        | 163 +++++++++++++++++++++
 2 files changed, 172 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 5f9aae728..f62aa0c59 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -4,21 +4,26 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM8250
+title: Qualcomm Global Clock & Reset Controller on SM7250 and SM8250
 
 maintainers:
   - Stephen Boyd <sboyd@kernel.org>
   - Taniya Das <quic_tdas@quicinc.com>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on SM8250.
+  domains on SM7250 and SM8250.
 
-  See also: include/dt-bindings/clock/qcom,gcc-sm8250.h
+  See also:
+    - include/dt-bindings/clock/qcom,gcc-sm7250.h
+    - include/dt-bindings/clock/qcom,gcc-sm8250.h
 
 properties:
   compatible:
-    const: qcom,gcc-sm8250
+    enum:
+      - qcom,gcc-sm7250
+      - qcom,gcc-sm8250
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-sm7250.h b/include/dt-bindings/clock/qcom,gcc-sm7250.h
new file mode 100644
index 000000000..ae81f445c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm7250.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL6							2
+#define GPLL9							3
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_BOOT_ROM_AHB_CLK					6
+#define GCC_CAMERA_AHB_CLK					7
+#define GCC_CAMERA_HF_AXI_CLK					8
+#define GCC_CAMERA_SF_AXI_CLK					9
+#define GCC_CAMERA_XO_CLK					10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CPUSS_AHB_CLK					12
+#define GCC_CPUSS_AHB_CLK_SRC					13
+#define GCC_CPUSS_GNOC_CLK					14
+#define GCC_CPUSS_RBCPR_CLK					15
+#define GCC_DDRSS_GPU_AXI_CLK					16
+#define GCC_DISP_GPLL0_CLK_SRC					17
+#define GCC_DISP_AHB_CLK					18
+#define GCC_DISP_HF_AXI_CLK					19
+#define GCC_DISP_SF_AXI_CLK					20
+#define GCC_DISP_XO_CLK						21
+#define GCC_GP1_CLK						22
+#define GCC_GP1_CLK_SRC						23
+#define GCC_GP2_CLK						24
+#define GCC_GP2_CLK_SRC						25
+#define GCC_GP3_CLK						26
+#define GCC_GP3_CLK_SRC						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GPLL0_CLK_SRC					29
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				30
+#define GCC_GPU_IREF_CLK					31
+#define GCC_GPU_MEMNOC_GFX_CLK					32
+#define GCC_GPU_SNOC_DVM_GFX_CLK				33
+#define GCC_NPU_AXI_CLK						34
+#define GCC_NPU_BWMON2_AXI_CLK					35
+#define GCC_NPU_BWMON_AXI_CLK					36
+#define GCC_NPU_BWMON_CFG_AHB_CLK				37
+#define GCC_NPU_CFG_AHB_CLK					38
+#define GCC_NPU_DMA_CLK						39
+#define GCC_NPU_GPLL0_CLK_SRC					40
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				41
+#define GCC_PDM2_CLK						42
+#define GCC_PDM2_CLK_SRC					43
+#define GCC_PDM_AHB_CLK						44
+#define GCC_PDM_XO4_CLK						45
+#define GCC_PRNG_AHB_CLK					46
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				47
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				48
+#define GCC_QMIP_DISP_AHB_CLK					49
+#define GCC_QMIP_RT_DISP_AHB_CLK				50
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				51
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				52
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				53
+#define GCC_QUPV3_WRAP0_CORE_CLK				54
+#define GCC_QUPV3_WRAP0_S0_CLK					55
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				56
+#define GCC_QUPV3_WRAP0_S1_CLK					57
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				58
+#define GCC_QUPV3_WRAP0_S2_CLK					59
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				60
+#define GCC_QUPV3_WRAP0_S3_CLK					61
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				62
+#define GCC_QUPV3_WRAP0_S4_CLK					63
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				64
+#define GCC_QUPV3_WRAP0_S5_CLK					65
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				66
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				67
+#define GCC_QUPV3_WRAP1_CORE_CLK				68
+#define GCC_QUPV3_WRAP1_S0_CLK					69
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				70
+#define GCC_QUPV3_WRAP1_S1_CLK					71
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				72
+#define GCC_QUPV3_WRAP1_S2_CLK					73
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				74
+#define GCC_QUPV3_WRAP1_S3_CLK					75
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S4_CLK					77
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S5_CLK					79
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				80
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				81
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				82
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				83
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				84
+#define GCC_SDCC1_AHB_CLK					85
+#define GCC_SDCC1_APPS_CLK					86
+#define GCC_SDCC1_APPS_CLK_SRC					87
+#define GCC_SDCC1_ICE_CORE_CLK					88
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				89
+#define GCC_SDCC2_AHB_CLK					90
+#define GCC_SDCC2_APPS_CLK					91
+#define GCC_SDCC2_APPS_CLK_SRC					92
+#define GCC_SDCC4_AHB_CLK					93
+#define GCC_SDCC4_APPS_CLK					94
+#define GCC_SDCC4_APPS_CLK_SRC					95
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				96
+#define GCC_UFS_1X_CLKREF_CLK					97
+#define GCC_UFS_PHY_AHB_CLK					98
+#define GCC_UFS_PHY_AXI_CLK					99
+#define GCC_UFS_PHY_AXI_CLK_SRC					100
+#define GCC_UFS_PHY_ICE_CORE_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				102
+#define GCC_UFS_PHY_PHY_AUX_CLK					103
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				104
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				105
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				106
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				107
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				108
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				109
+#define GCC_USB30_PRIM_MASTER_CLK				110
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				112
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			113
+#define GCC_USB30_PRIM_SLEEP_CLK				114
+#define GCC_USB3_PRIM_CLKREF_CLK				115
+#define GCC_USB3_PRIM_PHY_AUX_CLK				116
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				117
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				118
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				119
+#define GCC_VIDEO_AHB_CLK					120
+#define GCC_VIDEO_XO_CLK					121
+#define GCC_VIDEO_AXI_CLK					122
+
+/* GCC resets */
+#define GCC_DPM_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BWMON_BCR					3
+#define GCC_NPU_BCR						4
+#define GCC_PDM_BCR						5
+#define GCC_PRNG_BCR						6
+#define GCC_QUPV3_WRAPPER_0_BCR					7
+#define GCC_QUPV3_WRAPPER_1_BCR					8
+#define GCC_QUSB2PHY_PRIM_BCR					9
+#define GCC_SDCC1_BCR						10
+#define GCC_SDCC2_BCR						11
+#define GCC_SDCC4_BCR						12
+#define GCC_UFS_PHY_BCR						13
+#define GCC_USB30_PRIM_BCR					14
+#define GCC_USB3_DP_PHY_PRIM_BCR				15
+#define GCC_USB3_PHY_PRIM_BCR					16
+#define GCC_USB3PHY_PHY_PRIM_BCR				17
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				18
+
+/* GCC power domains */
+#define UFS_PHY_GDSC						0
+#define USB30_PRIM_GDSC						1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			3
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC			4
+
+#endif

-- 
2.43.0

