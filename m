Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59F549B465
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818656; cv=none; b=HWgKUHoEKstVhSX4VD8zyDTy1a5e5lhvbF/RZWdHeSlj1y2n0+OuOInDep58KZWIdfn3cRMSxiVAWkrrzVwyhrOJ5zvuFXV+vUAhhTSgu9FGXST/DNrSZ/lLZ7Xng7K/3dARy2EuBNVEuWrdq+qb+ZXbT0i7ORgGpprt9VCHuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818656; c=relaxed/simple;
	bh=t6eFtMdnbeLAWs9+Zc1CmjUrkbOAv/Qra0BQsqVHMTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8KnvFVbgderwIyP1TNPsOignAtfzXzVNoBELkrW9+5X7npzFC51VKN/KiQgfM0h/i6EPvVm3T+Shnjwydr9n+tkIqgx72JHLGZhfbCwMhA/LB6I/45Pw6vyNx5a4WuLj9Y/oj6UQvjfyOO+/bt5P4vncjyUd76xgD3WuvLrnWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZQsNU7Jk; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZQsNU7Jk"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9144e8021d3so30078566d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818654; x=1792423454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soDkmis7yB2hVDrGvKOiPMeBW9Ns9vua5JCb60V5dzM=;
        b=ZQsNU7Jkq0JZfhSanU/WYvehB3+TVpG2NKjd0LGqFHadCseDQYEFxAaCVMe36AXtjz
         PYYVHfoYe0f/x7VIMbxCm9kB2IGr+hmQN4G4YI6XjCEhnq1Q1pJODG1tBOby+Yk6C64k
         DkoS6LPtjCnB8DZ+ia92f83aAyVdKjqvmWukQOSmYNfuYGty//owapM7+jeDSR0enZp9
         vevmOOftuJyBQ2y4mOSnbITJ/0fvk8HMnwyzJ6gk1wqXSbuSZWUpfhxErk1Z2sHCLb2G
         nlrDecD+lBZaUWFcLeKqsZZswL3wjb+SwQS6VQ0i5F8zdr4FpNAkgxLVwzyYq0Qe/5an
         MXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818654; x=1792423454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soDkmis7yB2hVDrGvKOiPMeBW9Ns9vua5JCb60V5dzM=;
        b=FN84yJGdC4JAfvCuasY1jm3kj8+e1+bmWekU07GA6xLc33mSsDsx1ZFH0NSqQ7FAZx
         iJo5lkZoNKQyB5tVephzsLzoyne0ww4YDO6au0GYqkbARbs5Ni4Ys9VsSabDuiHc4qcd
         uolILOCCzrRIeJUrLYYMaRhuL0Vft2wt6ItZPkIZe2DlDd1DxxfAc4STK7mdgEqpzynK
         7tUPaBbc1mKHBZp36/0v3ayr0Waa3mRf8uSPOr4NtqMnsMFqzbLog6Np7UoYFB50HySK
         vYlEfgxLj7oAyoKcqlzQScJKkMbKmyyuZh4OhybRdNRASea5xul5eSXCZRRrUtrFTg7c
         7y3A==
X-Forwarded-Encrypted: i=1; AKwUvBzNuJjn4/HkV49elJhfGJ+/LbXhb0mpLpG+D3Kg+eU4yGcpC4cNxEry9rLjPYjQFooL1Bv+jmY/wNNfUD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaV8VM96O/2P5Ygiqkxlvyd2J9l7RzRRNIIjZ2IGyJ3la+NYWT
	8qXx2p6odm9yRjECNMHnZ4pwpFpLc5Nx6SDq/L59TJP447hYrgwsZ24j39qx6pGF1Sk=
X-Gm-Gg: AYBFou0Ck+VLjQm8WMcEZpDk1YQKty2KSFJCD5FMkEXPeWlBh5ps5qLTvSjab2qyfJC
	68OumixesNJQgesCiwnobvV7nXQ5eYfpylbmwoqZ1MdCN2ApgwI35gxTopu0RRrAIQQ5Phn1lDC
	XEvwyatotKi0AEt32RrgvCPEiq+lBG3Rjh96T2Fl6wFNLmZnJkdYklPbPxIQmDyir1a99jNAb6a
	POcpgJk9WnZjGgbXZE9gGUX/aqDBsPhcmBXlTtv4pns5Z2VtRDd70bAQMi6PcEuypenubNWQWJG
	Lkf5zvuriI4SHCdDxTlmYiMRV/13p+V14X6PnsOCGqJ0jM7bg6YnWIH67pAvQNGbtX2wb0duGJZ
	wH8jQGIBzZ2VZgJlBqH/5m+SfzVQ3P7VSHhMonsipD5qbbOS26VHSj3ROWhbxOQqR6c46Un7wlQ
	4MxXSGcpYjVi8rou3z35ERsvQ+Pa5p0kFHYa3BM5CCsvVgbQ45boweKfguLu69Jw3b9y1lzp8Rd
	nE=
X-Received: by 2002:a05:6214:4a04:b0:91b:979c:57fe with SMTP id 6a1803df08f44-91b979cc6b4mr714656d6.25.1791818653565;
        Mon, 12 Oct 2026 08:24:13 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH v3 1/4] dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
Date: Mon, 12 Oct 2026 10:24:04 -0500
Message-ID: <20261012152408.3729237-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the clock controller functionality present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - What was formerly described as a "clock" node is now "clock-controller"
    - The clock-controller DTS node, which dropped its reg property in v2, is
      now a sub-device of the config syscon
    - The config syscon is now (also) compatible with "simple-mfd"
    - The clock-controller DTS node no longer defines a toshiba,config-syscon
      property, and the config syscon no longer requires a label
    - The clock-controller now requires a (parent) clock property
    - The header file is no longer included in the binding example
    - The binding example now includes the definition of fixed 25 MHz clock

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 65 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 34 ++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..24e07d4aead32
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including a clock controller) via its BARs.
+
+  A total of 21 clocks are implemented, though two of these are not
+  controllable.  Access to the clock controller relies on PCIe being
+  functional, so the PCIe clock is assumed to be always on.  Similarly,
+  the PCIe controller relies on I2C, so the I2C clock is also assumed
+  to be always on.
+
+  Clock ids are defined in <dt-bindings/clock/toshiba,tc9564.h>.
+
+  The clock controller uses registers within the same page as a
+  reset controller, so both devices are defined as children of a
+  "config" syscon.
+
+properties:
+  compatible:
+    const: toshiba,tc9564-clock
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - clocks
+  - "#clock-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    tc9564_xo_board: clock-25000000 {
+        compatible = "fixed-clock";
+        clock-frequency = <25000000>;
+        #clock-cells = <0>;
+    };
+
+    syscon@0 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x0 0x2000>;
+
+        clock-controller {
+            compatible = "toshiba,tc9564-clock";
+            clocks = <&tc9564_xo_board>;
+            #clock-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 77bd64bae919f..b19c62eabaa7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28166,6 +28166,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..2106e4199ed45
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __CLOCK_TOSHIBA_TC9564_H__
+#define __CLOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_MCU		0
+#define CLOCK_INTC		1
+#define CLOCK_SRAM		2
+#define CLOCK_UART		3
+#define CLOCK_MSIGEN		4
+#define CLOCK_PLL		5
+#define CLOCK_SGMII		6
+#define CLOCK_REFCLKO		7
+
+#define CLOCK_MAC0_TX		8
+#define CLOCK_MAC0_RX		9
+#define CLOCK_MAC0_125M		10
+#define CLOCK_MAC0_312_5M	11
+#define CLOCK_MAC0_ALL		12
+
+#define CLOCK_MAC1_TX		13
+#define CLOCK_MAC1_RX		14
+#define CLOCK_MAC1_RMII		15
+#define CLOCK_MAC1_125M		16
+#define CLOCK_MAC1_312_5M	17
+#define CLOCK_MAC1_ALL		18
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

