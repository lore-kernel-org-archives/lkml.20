Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5743D522C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246485; cv=none; b=sFNIE0odADg9Ixav1eDoasYQgmzoJI5jUcuWtMXr/CEx8t2hD2u69FEhlVtRP+CdELcCLvDiGLbuo/PTM3wd/wAGeOacvaGjPOp4tewJ6FYBKxIBmZeOUXOKf+be6djWPQUnp83Dw0q88X0p+HHQQOUwr1MH+J3JmUI7qE96jFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246485; c=relaxed/simple;
	bh=fKqClC0ufWdkJMlTCmT5LtWVtO8AoP4FFGpl3jSnBf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGVwNIcyr9TJrdRsQXspdn4IuENOGOgEl2BKb2xPxn+Z3rSTDtqu/LuvYPXMVN2vx6KEpqS+rsvfVShL0KxwJVApTAR/52b67qZMNTpeAfIJb8ET69LIQZGSC6uNjZf3oOQCZ37T9dwqvJkndZqek8iA2hHIVUe2IUdC6lTkd2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0MeDJRb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0MeDJRb"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c9879395so3528146a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246483; x=1788851283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QX+hj9rwuUHVOrxz2CneRYiX2KZyJ9TLYmsqsLaUBGI=;
        b=Y0MeDJRbGyPqC04qMJsh8TJaiT6UDkBejix2VFTJUJiYZBU/DT0Z0/dBB/YPbThHIf
         OhKluRYaN/XETW64Q7uTpFI5cEM/9OkLmHzdEpXcrMFueCMunegb2QQ6BpadARZmEkYn
         P1mOjVXsOgheTfm7Sv5N41Sw+bdkkNOZIHs4Agj6UN7mLJYZKH6fjf5TmlO961XQYL92
         kWsHhx1BFcpzZEta3Q/Hxu/J7j5cLSNFpheoTv9TGqEXWC7X7Ftt3wyfPYGYUrlXvP38
         cmiICAJIGIrn9MMEZ3UqoBtuW2PS7m00hp0pK6YR7kvf+W7jMAZ0qAM+HXNdUYpRA372
         npGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246483; x=1788851283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QX+hj9rwuUHVOrxz2CneRYiX2KZyJ9TLYmsqsLaUBGI=;
        b=emoN1xtUXqs7OiPlt6hQwDjrfh86f+sBwszK1c90QwEzYVX/KDgOoMtQUnLebPhx+E
         aM8MJGrikgDAybJhVGyas0/FYGO8KK7E7UDuyg/lbkEJgSMkIZto5KtA5jk/MsbB89pQ
         LlZctlgUdqyoBKSrf0IdW3LHfbF+9lEVf+XPpCnSb0jumXfOv0lx8e8uoMXDartxN1tq
         lxSYm+MBTEc08tuX6RjvyC0ZtdkZRmURbgRqqJ8SibkMaI1xjJxSodXGCkvXDWTFoxqF
         DkHBiqoVyTnP6vJXJiU2C9RjgGGAFQM/DAxcaZNPRwqd76+vTQRw89+60I0RoOrjslk2
         8EpA==
X-Forwarded-Encrypted: i=1; AKwUvBw72RY3EgqVP4jtwhW1fw0gUOOr7lYMD124TgKJDgYULulGUByudpS6n4nP7qulx4zuajqxjEwvaj+Yn48=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ/X8gtTrHB0gGFRZiNiAK01difXI0K21h/n9sQUJFrYDXDG9D
	BYbn2jbVnkHpgi9fcanYKK7GG9lkeZ/qtUwlLx3GyJqrD6jVDXtetKDh
X-Gm-Gg: AYBFou1JYhJ7gE3BqdMna7BFaWsltWlmCevAqC6S7+XrNh1gXyPIwpZERrh8kaFUGWI
	9dBhVPDv/Jxi+j/TPDtnsn1zJOzGaB2G3kTK+p3ge+mLj+JGR29FKvSMyYdxbHvn+NKs/fF1QY9
	uLlhiF3soomErHq0MrBvtVDVEQp+q+7otzAHKJto0AmxXTphelKKYX2sSkbUQq6Q+XAd/jTZhRs
	8RACwfwSNVN9NwTxQed56uKCr9VKwaMxOzMraen2MuGp1PizGmdKMyy7Ihct0WPRzPSl+dnPVyK
	Pw5KYtMMu6Bjn4WTilJEGPJwub8Tom5buLGBStOMnBhFSOa6jx3h8OVa0ArX2SiGK2tIWUj6/Le
	jgLtYSxI2VPCjUce+xyz4PnYEeoJeVzf4SQ9LVZblI/uCINhCyWcjMU8ZwGiQlr9xeKiiE5lXwl
	tCl3530Rm2ghor5PG4H2F/6+X5HoVwCCschB0SiFXBYei30JSjvvQNRmAd7xKJzZlf0HktzJDVJ
	Pc8G79RZMEOx47TjMCg48s=
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr53598875a91.4.1788246482940;
        Tue, 01 Sep 2026 00:08:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:02 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 03/12] dt-bindings: clock: Add SM7250 global clock controller
Date: Tue,  1 Sep 2026 07:07:08 +0000
Message-ID: <20260901070717.20513-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for global clock controller on SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm6375-gcc.yaml       |   4 +-
 include/dt-bindings/clock/qcom,sm7250-gcc.h   | 163 ++++++++++++++++++
 2 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
index b4ad2ad14..39a2d2839 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml
@@ -4,13 +4,14 @@
 $id: http://devicetree.org/schemas/clock/qcom,sm6375-gcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM6375 and SM7150
+title: Qualcomm Global Clock & Reset Controller on SM6375, SM7150 and SM7250
 
 maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
   - Bjorn Andersson <andersson@kernel.org>
   - Danila Tikhonov <danila@jiaxyga.com>
   - David Wronek <davidwronek@gmail.com>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
@@ -26,6 +27,7 @@ properties:
     enum:
       - qcom,sm6375-gcc
       - qcom,sm7150-gcc
+      - qcom,sm7250-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,sm7250-gcc.h b/include/dt-bindings/clock/qcom,sm7250-gcc.h
new file mode 100644
index 000000000..765fdc38f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7250-gcc.h
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
+#define GCC_VIDEO_AXI_CLK					121
+#define GCC_VIDEO_XO_CLK					122
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

