Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B723B47EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531221; cv=none; b=U74/vk/Embll/BT+uQmr/UrNE6i5NW5wErGeBfD2uNRUThm1+FFwON4qzQXHb51m6SnGJFPWabf6qj6pAAOFkgDMlCgyF29pQEnWuvc5c591noGxSZbXRP9Z2JEkDkDje8ZRX/S8PeOYyrYoj4F2L7/q+gHMlVTlObyXasgiql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531221; c=relaxed/simple;
	bh=5mJcWpPhz5V4cVbv/UViMTOOd0qIceb8QnAN5ZLKMmg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ye4boiJVMHBYxaeRbQCFCcD/PE4l99CppeGOFip7s+JERk7VvwvvTHcW743jYw6xM7dRwWghdZSDp+NbS47GWk/3XJ5yK9sqt6ns+pfi/xIzhM/fW6+Y1Fhbc3m/5o32bW69mYuHk3Fq3XmEhuXiQo7WK0T047nyo4Y0bchCTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqF0jwma; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqF0jwma"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so59227655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531218; x=1792136018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0GMj/PCcw0jRmoExFmKfgop12tPuP6GJMya0pF2cELQ=;
        b=FqF0jwma4IP5kwzsKggDkN+pLFqQXtFGl0jp5cwO9x1Z+9bRm3sBM9yFNhl6OTLGvO
         j7IP8+ewM33sDskMf9eEKtJYXzmQxaXL8k15yWBvRQooZXhBhWmWehYIQPWfxgEZcnLO
         d2I3b7GN1fTvEkOy4InEbcILDxkS45HTE8MO0zZL/qO8+osqkDRfu5rWCiHaCyFrF2WO
         I0AjMwFO52oczxLKH2xAEUkg03Wurgq8QS29rPDZywg8gbhbFBWuxaWHL8hLnPQ985KA
         4BKKuu4MEjNsnI8It3UFdyiBI6IcIV8fDGU04B4FQmYhomHeRSDjNfNKWxg9AlP+y3jR
         f20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531218; x=1792136018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0GMj/PCcw0jRmoExFmKfgop12tPuP6GJMya0pF2cELQ=;
        b=BWpLRtj/1dHETlE8fvWiD1KNd/UwtP4X70VBE6s7eDjkz9H8G2pSnW9qmSw91FwQyB
         EQ8EgsEhaF1coOc6jjleJy8iSTED+siqx5ma1NvTX9+TRc9h8s5r9gBvDuD4pw7dM5Ij
         AgRkIWwmnxoVYU/OmirsfXX4bp8h/l2hf6hqSlcjZKMjYZ05fwFrc+dDJ+Jv0p1jRnnJ
         zcBHxzUaD/eAOP55uehp24zvX4860vTpQ6Wv7DItsaUNCtycz/ECad4MHmZq3yxecG0E
         CxWNeIllrw+IhhkRFuvIFslsA1zISl+94wnAcyTUL1b/1jltl0BRNMpADpt4i8DaooLM
         tqnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz99gI//9b2fSY21+NQ5WElj3kUN50syVoibvLdQz1bHMG3qVpga+awqn08yrvKysVuuAJeYmQHlnXsdw0=@vger.kernel.org
X-Gm-Message-State: AFuF++n9cxMUQLEBeqh5E4Rv1IY2P9vIRzjC3J40M5poTGV5AJgyF7nt
	qyUCKJ1YIACYCMK+NzBq0KASntOhAye2kdKT4yb1ZjtORaQuD/erLRcv
X-Gm-Gg: AYBFou2fC0KUxJhT0yLfP2F1x+HTVKiqLljC/sWAi0vUoCqIiF0hHP3fwreEQyLBZLh
	tglQB8GsBTiHN4G2qRfxeCvDB0mkSNybpAXMwQBP+JIyvAVuwKuNeZ4vrTh2e3DAu2gqJjco77/
	lPWKvtFApyjDSUgZNeNjf0uBA+us+5I6fvHDO0vnWaAJSHrTGBgPSMBR6qLO1fuKPvvUupzNn9n
	I60CrI/QFH5w0jlFCP2KEgIlF22CKofErbm39Zqufv1t0bEwgVP5HWgL80b2O/L7QXvfFa9/nYY
	0RxJxPBFNKe6Z7+f3PKup7FDJ/snIWKRsgvPgR1MuGA12oRJfMp8oXTNNYmn6TciMsP834XWtEv
	3aX5L/X6DIoFzV59kRPRhl1MO0scfk56XSYZc17tU1gjn/87ZCLtpgqIBABFWif5/euQ+Sf4YGw
	OlFZDCP2p0ugc7AdVbhQtRClxWatdh4JWUI6imFjKocCI5W4XxAl6gAWFwKdSHhs4Xu3JxoVmGz
	t9a+qHfAStCek2wRx11ZfSUIAVItec82dfR9UTerixhudXaEbbn1D2vIlxGiaX+VwyO+Q8PnpdE
	3LVY+IiMkARkiHAUUQ==
X-Received: by 2002:a05:600c:198c:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a18e4cdbfbmr17253525e9.29.1791531218222;
        Fri, 09 Oct 2026 00:33:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm55116365e9.6.2026.10.09.00.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:33:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: devfreq: Document support for Airoha Subsystem Scale
Date: Fri,  9 Oct 2026 09:33:28 +0200
Message-ID: <20261009073330.18175-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009073330.18175-1-ansuelsmth@gmail.com>
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC contains multiple subsystems that are scaled to a
specific OPP taking the CPU clock as reference. Such subsystem
can enter idle or performance state based on the system load
and power consumption conditions.

Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...

Document all the required property and provide examples for the various
subsystem OPP + subsystem scale nodes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml

diff --git a/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
new file mode 100644
index 000000000000..2cf7f23a926c
--- /dev/null
+++ b/Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/devfreq/airoha,subsystem-scale.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SoC Subsystem Scale Driver
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha SoC contains multiple subsystems that are scaled to a
+  specific OPP taking the CPU clock as reference. Such subsystem
+  can enter idle or performance state based on the system load
+  and power consumption conditions.
+
+  Example of such subsystems are GSW (Gigabit Switch), NPU (Custom
+  Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...
+
+properties:
+  compatible:
+    const: airoha,an7581-subsystem-scale
+
+  clocks:
+    maxItems: 1
+
+  operating-points-v2:
+    description:
+      OPP table of the related subsystem supported rates that referenced
+      clocks will be scaled to.
+
+required:
+  - compatible
+  - clocks
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/en7523-clk.h>
+
+    npu_opp_table: opp-table-npu {
+        compatible = "operating-points-v2";
+
+        npu_low: opp-400000000 {
+           opp-hz = /bits/ 64 <400000000>;
+        };
+
+        npu_high: opp-720000000 {
+           opp-hz = /bits/ 64 <720000000>;
+        };
+    };
+
+    emi_opp_table: opp-table-emi {
+        compatible = "operating-points-v2";
+
+        emi_low: opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+        };
+
+        emi_high: opp-540000000 {
+           opp-hz = /bits/ 64 <540000000>;
+        };
+    };
+
+    bus_opp_table: opp-table-bus {
+        compatible = "operating-points-v2";
+
+        bus_low: opp-200000000 {
+           opp-hz = /bits/ 64 <200000000>;
+        };
+
+        bus_high: opp-300000000 {
+           opp-hz = /bits/ 64 <300000000>;
+        };
+    };
+
+    gsw_opp_table: opp-table-gsw {
+        compatible = "operating-points-v2";
+
+        gsw_low: opp-200000000 {
+            opp-hz = /bits/ 64 <200000000>;
+        };
+
+        gsw_high: opp-500000000 {
+           opp-hz = /bits/ 64 <500000000>;
+        };
+    };
+
+    npu-subsystem {
+        compatible = "airoha,an7581-subsystem-scale";
+        operating-points-v2 = <&npu_opp_table>;
+        clocks = <&scuclk EN7523_CLK_NPU>;
+    };
+
+    emi-subsystem {
+        compatible = "airoha,an7581-subsystem-scale";
+        operating-points-v2 = <&emi_opp_table>;
+        clocks = <&scuclk EN7523_CLK_EMI>;
+    };
+
+    bus-subsystem {
+        compatible = "airoha,an7581-subsystem-scale";
+        operating-points-v2 = <&bus_opp_table>;
+        clocks = <&scuclk EN7523_CLK_BUS>;
+    };
+
+    gsw-subsystem {
+        compatible = "airoha,an7581-subsystem-scale";
+        operating-points-v2 = <&gsw_opp_table>;
+        clocks = <&scuclk EN7523_CLK_GSW>;
+    };
-- 
2.55.0

