Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED43B6378
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823441; cv=none; b=e5+VMXG1fRIIGBPihi0ZdivsoI5JuskNpy1cbHfs3KMspk7MbHf/uE0FbX55u2Txry+j/DsDLQzk16IiLj6dTf6/KK9KQ40FBZRvH9gtv67H1WEqgTlMBb5yZl7qq8nLhPZxBvCwB8Qxhk8U+TAGnTZXYsukfuiat2mQae6Oe2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823441; c=relaxed/simple;
	bh=dpsrGmthbDdJViv27CwZRLe0onq0Y1dVg1G5SbJ/e/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABctzaFw8m5T6ZYaWg6Vg84idaS4D6w7ytLKwXQOJVLHfU6ZdeqBdvu/z6iTBMLHvXAt5S68Yzszkbb6ACELKyLZ9pgMgM+kw0YNgteTCnXA0yI/c5LuOc/6RadGGpqBlZKyMRWSxe+kQBW29QMqDDI4CGQ8JU2feHnihaPgPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZKc7c0Ke; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZKc7c0Ke"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533861a59b8so25217471cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791823438; x=1792428238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HubQDXY8rf/2H64/w0p0PG60Zk77KAD8GwYfI4yp4xU=;
        b=ZKc7c0KeeEyrPdh03OZMhaSnynWpFiMyFJ7LwzvZL7ceSjfcJfnKbZHI5XG1aaYpP1
         9cgP8OrE/5mUadW4hVuWbrEuh5royEMOy822lEROPeMQTPPZFsiyPbbxdJZSh//uk5Fu
         ZzKdnRjGL0vucwWMjN3smMV3LLNO7Jw39B3SLIwJH52A4k/udZbSlzYCTl2JtQtFDc5y
         IUrXWuU3aYo68ZIihmy1Bj83BdaDhIRqvm560blFlWPq/REp8F2TIUqL91ql8HwXtB81
         riYuoiea0mhgM5f79+Dq0TAJHLvStvnyM0iy7RcnRwwjR4kgc+EFUDoE/v4W0cAUjNBw
         O7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823438; x=1792428238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HubQDXY8rf/2H64/w0p0PG60Zk77KAD8GwYfI4yp4xU=;
        b=QTVHlWyLDewmjktVTgkV758PAdNQHFuSjFjQhAbmoosGufMOzBcOUusKthHwGsWZoz
         8vqJ2xbI1uweB7YQ2o5kWSWyjz3UnSzfiAY/q/PJggptj4d918b8bxyrelSfhypR3kbB
         O04R7f8i0f1uElmARQMmgLN/p3fVZLLlucrs7ThY9pFmJj2jN+b6nzfP07wp5TY1bvoG
         +pHfvQgzxy1DO/5NZLEoO2XMtnAO4zJhw+XW5Z5mFSUOTEugI2jZxDNsUydHx6lX+748
         SXf3U6C9qUWjfEcj2bem+ouTz2h/jF0QA6rHVO8UP/W3ijwC/zx+qfv3Rv9mB7nvm3SV
         Wphw==
X-Forwarded-Encrypted: i=1; AKwUvBzV+Z4Jw57+OVHmn8zchKOzWQmftwVqhlJlJMV6IhPkW9kRizupPUho8OuRCC5SC0UvcTQZsa7bnW6r1mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjzvdyMpTULdKF+yScNCWU32T4Iqr7GDFdK201iAfXHESOnTEY
	9yf2powq+NxWy0lEoRYqFR6pRbUp5A1J2tuU/Ep7VjREzCU1q7Rv/x+wVmK9QfoVzCc=
X-Gm-Gg: AYBFou3AqxsrDkV2mrsLKOccG/XzNHolkR2JnCjBkaQDxZ5820Ek/yWwrpNGNsYVy9n
	DRZ5HhwawW45aqNHvyyzC7Zdtocl+P8sR+rjiQakoI1io9cr+gVJ87gblqYGf9EWoj8MHsomtm3
	0tZkcN+gRXrqRAEK2QnANpDKkahRU0caag2O3HwKdRdVa5rTlLsOO1rTiGowizzDxbYksLQrUz7
	QK3D4zv0VW9kWkIszH2B7e5CTQVi0sqitmWXv24HC6p/F0VQvhLJhm5UBtezZK8qM3EIrDOL3m5
	k3A0q+RsdoyJdsICQHnqjfudgtGuOoddeofsBZRXz4wEMweJgLUlKao6kqFTscFWL9HxpFDF5++
	FxifVWSrb+Dcck1pjOMp86YF15RTgxKqGQJiBDOOyG2qnWrarw1EqqQspiso2qOFlnBPuKIOnmy
	f6KgkCuEd9dASugGDjUZcJ9RzgsBRzKxSIBW/5VJXVEY6erF1Dm2B92ktuD2LP9dNeUeoH5Popv
	JDV00uKAG9VyQ==
X-Received: by 2002:a05:620a:270d:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93ebd497208mr1734898085a.66.1791823438385;
        Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm24998885a.40.2026.10.12.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:43:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH 1/2] dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
Date: Mon, 12 Oct 2026 11:43:52 -0500
Message-ID: <20261012164354.3872326-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012164354.3872326-1-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the reset controller functionality present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/reset/toshiba,tc9564-reset.yaml  | 56 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 include/dt-bindings/reset/toshiba,tc9564.h    | 26 +++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
 create mode 100644 include/dt-bindings/reset/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
new file mode 100644
index 0000000000000..1908e9539abac
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/toshiba,tc9564-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Reset Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including a reset controller) via its BARs.
+
+  A total of 13 resets are implemented, though two of these are not
+  controllable.  Access to the reset controller relies on PCIe being
+  functional, so the PCIe reset is assumed to be deasserted.  Similarly,
+  the PCIe controller relies on I2C, so the I2C reset is also assumed
+  to be deasserted.
+
+  Reset ids are defined in <dt-bindings/reset/toshiba,tc9564.h>.
+
+  The reset controller uses registers within the same page as a
+  clock controller, so both devices are defined as children of a
+  "config" syscon.
+
+properties:
+  compatible:
+    const: toshiba,tc9564-reset
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - "#reset-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/toshiba,tc9564.h>
+
+    syscon@0 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x0 0x2000>;
+
+        reset {
+            compatible = "toshiba,tc9564-reset";
+            #reset-cells = <1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b6d7ee1638..d0eb44079fe17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28180,6 +28180,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
+TOSHIBA TC9564 RESET DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
+F:	include/dt-bindings/reset/toshiba,tc9564.h
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/include/dt-bindings/reset/toshiba,tc9564.h b/include/dt-bindings/reset/toshiba,tc9564.h
new file mode 100644
index 0000000000000..5fcc9a06d4ff6
--- /dev/null
+++ b/include/dt-bindings/reset/toshiba,tc9564.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __RESET_TOSHIBA_TC9564_H__
+#define __RESET_TOSHIBA_TC9564_H__
+
+/* Reset IDs */
+
+#define RESET_MCU		0
+#define RESET_MCU1		1
+#define RESET_MSIGEN		2
+#define RESET_INTC		3
+#define RESET_UART		4
+
+#define RESET_MAC0_MAC		5
+#define RESET_MAC0_PMA		6
+#define RESET_MAC0_XPCS		7
+
+#define RESET_MAC1_MAC		8
+#define RESET_MAC1_PMA		9
+#define RESET_MAC1_XPCS		10
+
+#endif /* __RESET_TOSHIBA_TC9564_H__*/
-- 
2.53.0

