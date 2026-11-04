Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753019;
	b=HUg/yRJhNATlvzUxduTPT5xbiEdyIk3q+tVTWtxkxHx7UUlCmKGJP4HtUAYmMZmS0ftK
	 QUWPNDtRKlOT+pEwR3eA5mjmzkkm4Eg2Z50Wz7U6mEhq1MTx/dtqmR6ikTMu2k6TFRCE4
	 VUJIJArHJHgaBZ59ko5pOSFw4DqUhBIJU2JNWojgy5juXgLb3LZs2Y5B1i3vk/opMHch2
	 /A5EdlEpcJ1CaNmnwfc3svDA7f5MTA0GVO0IQyjeYkHxrsUC7ZfwAt0SuP93ema200g9+
	 SL2UXy+AgRfrOWIPDN/Hc5j5a2+p2/lUYKopjgoaIGizK+ATOFQ82N6pvfqzolhodOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GJmsUCfA9ifxE6S9S2wXh1BgJJ14biPpsYcozlXnQF8=;
	b=emz+jQMt0O8L+MMrT37nXEKpIRYoqO+QhrEALebSIZ9m5eSotPQ0lUXHyqNCshxTvkip
	 odcR8nTn+eWwIN8b2SEgYWd/gWNvjQi35br4ZUlSi2fisl4AhaJhG/mjLBlhtpJlnLqHW
	 lIIbRxcNtTmswhABCi4rWynIX5e0vV/nDS7wjOYtLJFPEWEvLs90Sst/vX7dxWmSm74I9
	 2/2ofbZUP01K/pDNf+S7z/1p2ZMewgs0TxemSdzrRjqj26dcki1ULGhlAHnyb4DzgrWz3
	 1JaJCkRch1g6HoNE+wDaN9X0aVW+hnwTLHJkEi+WTiJbPjYUSpZFjHeHMGwBJxy0b5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qh5mjT0v;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F8606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25F8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qh5mjT0v
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48eee44b908so135819fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753017; x=1794357817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJmsUCfA9ifxE6S9S2wXh1BgJJ14biPpsYcozlXnQF8=;
        b=qh5mjT0vrjKucm4mSJqKh4njRTmVaTzTGIESvGr1XYhpjoS879WHj3IqJCC9W3DVzp
         l+jOV9n5VICpLAXTdcmWs+46X59N1zhEObM9D7QDxTg7hZfoZLoZNo8gSg9/UtCWS4Pk
         GdJSdmI9ng/Ezj4rXEoUV6ip2YqsxcXsrNUbm/YCO5RxXzgniTzXlTMfQwGwzJP3W+7g
         2U2bqqV8rwKLO9Bf6KOS9SbAA81OjRDDcMnN/hpseEaL4k6DI5IUn3oZmYRGCgodEt5R
         FgZcpSEnrj6Mm64020fRz/mMBR2cD4RMica7Jatw8IFXoV2LMHdkZAK6IaSMy8mTZFjs
         LA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753017; x=1794357817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJmsUCfA9ifxE6S9S2wXh1BgJJ14biPpsYcozlXnQF8=;
        b=sh5R6MMIWwtnajWmxx0lBZ9VAxLhEr76fv73pJkg1imcRiYigTLzGHMiWfRtg034fZ
         anLsQmVBgfx3TXKoTpbfK4R+KhfWcoiMqQeMRoKwW4wTayWbkjV+1Ubk+09iqoFOL277
         Kdu45z8E8M0dWkKYCjNFkmdpEFnaSms+c0giqPo8pl4kGOP6+ZoigPXgm+EAQ9nMybj6
         c3lG+MujCKEHt7/4oM5c4b30xM1fi1AYw/Jay3JbAOWRs9IIk675s8PQKg8wc8Pmt+ah
         qjqO2hNrGVRsoO0KAytTHZKGP13iZupaTKu88eZIgDfwqe+0N8pOYSH26bFenwGwtmkF
         JvSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKqCHnQVftGzu2tUF0myz0JGQqHTZ1oi1e6G8DI/+bq412aa+eBidIm3yf08ZVd9brmGqxw5iN13C5mz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T2opC1n1Ij4bKmaao7Hu5aeqnhe6AEUST8uY3QoFwcKGACTh3
	/c1tkgDO0CDCC06KJPohPeTj3R1R2h5E8d8e6aDMtG5y9n75Ol4Wf3evK2EBK4Y0+f8=
X-Gm-Gg: AYBFou0WEeVkPrHe4AC8IQcHY1X41/tTyxV/+Re2iU+bA9IXY44K4oaptrX/vPzos8o
	cjqzEZljlIvAKd4PNPXcGU7ZUIc4iJWUL/CnB8VVjvO+xKQT7Olmi2xAosqpoOfmmmM3HgMDejQ
	wF4s5Honub92VA4Zfj5fOn5kQ87efG/aFfuVnyKttWGOjMpoYZ6N5Wd+uaI5tg2OOvQ0OgJUcYI
	nX8unaQGkMTiZeysQEvaHQG4SVeOtFhYmIF5LsOmLX8xtY/R8co1eVU5s/i5URhlF31Ts9n5eKJ
	WlrdZz1yxfDV2CGWKqyXObK6Kweq3GFlxa+irLDDm4Cf4O5pjhuY/WfA7U8CqGt2G+h5tsglkbf
	1xCBbfzIWPty6V+RUJ6G0uYSSjX+ZLKFVOVcTHq56EvahP8Eq/EquNDAyw7wOPNItnYlKBYgQn8
	vu+t5kIvavQDgGPrFFHV6RQza2Kbh1oWsND//vDqRj3+GtfNtr10cQb3kpE90ll43hh4C2fER4r
	DJeOei+HoRnS8aOONw9VUQiEMjsf80OdXb+o0Z4Gpfo69CfXduCeEiSnaeWjJgmW5wCCI/vsKZd
	QHMldOqu2j93tB36sh13iIzR4lRgIKxcjc1TR27LbYVmmmeE15sxdeE=
X-Received: by 2002:a05:6870:6c05:b0:4a7:83dd:599f with SMTP id 586e51a60fabf-4a9076be157mr8419340fac.23.1793753017556;
        Tue, 03 Nov 2026 16:43:37 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:37 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: soc: introduce toshiba,tc9564-config-syscon.yaml
Date: Tue,  3 Nov 2026 18:43:28 -0600
Message-ID: <20261104004332.2141282-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the system controller that implements the clock
and reset controller functionality present in the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
 create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
new file mode 100644
index 0000000000000..5a241a9c915d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/toshiba/toshiba,tc9564-config-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Multifunction System Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, as well as a reset controller.
+
+  The clock controller uses registers within the same page as a reset
+  controller, so this system controller controls access to both.
+
+  A total of 21 simple gated clocks are implemented within the SoC.
+  At this time, support for enabling and disabling only a subset of
+  them is provided at this time.  Similarly, the SoC implements 13
+  resets, but currently not all of them can be controlled.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-config-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description:
+      Clock ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
+
+  "#reset-cells":
+    const: 1
+    description:
+      Reset ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "toshiba,tc9564-config-syscon", "syscon";
+        reg = <0x0 0x2000>;
+        clocks = <&tc9564_xo_board>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065d..2b1b29169e0e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28339,6 +28339,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
+TOSHIBA TC9564 SYSTEM CONTROLLER DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
+F:	include/dt-bindings/soc/toshiba,tc9564.h
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/include/dt-bindings/soc/toshiba,tc9564.h b/include/dt-bindings/soc/toshiba,tc9564.h
new file mode 100644
index 0000000000000..66bcdf837f958
--- /dev/null
+++ b/include/dt-bindings/soc/toshiba,tc9564.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __SOC_TOSHIBA_TC9564_H__
+#define __SOC_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_PLL		0
+
+#define CLOCK_62_5M		1
+#define CLOCK_125M		2
+#define CLOCK_250M		3
+#define CLOCK_312_5M		4
+
+#define CLOCK_MSIGEN		5
+
+#define CLOCK_MAC0_TX		6
+#define CLOCK_MAC0_RX		7
+#define CLOCK_MAC0_125M		8
+#define CLOCK_MAC0_312_5M	9
+#define CLOCK_MAC0_ALL		10
+
+#define CLOCK_MAC1_TX		11
+#define CLOCK_MAC1_RX		12
+#define CLOCK_MAC1_125M		13
+#define CLOCK_MAC1_312_5M	14
+#define CLOCK_MAC1_ALL		15
+#define CLOCK_MAC1_RMII		16
+
+/* Reset IDs */
+
+#define RESET_MSIGEN		0
+
+#define RESET_MAC0_MAC		1
+#define RESET_MAC0_PMA		2
+#define RESET_MAC0_XPCS		3
+
+#define RESET_MAC1_MAC		4
+#define RESET_MAC1_PMA		5
+#define RESET_MAC1_XPCS		6
+
+#endif /* __SOC_TOSHIBA_TC9564_H__*/
-- 
2.53.0

