Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560412;
	b=u3K/LfXQhXcuZ6pomw5rYa8yiav4m/1AIO1ndXUowG9t+JjbXX+9LoMgWgB3lwQO3sCh
	 7M+FA5YggcGFyVazQnk1elkYF6PmSSe70A7Qblk9xkRH7GbP1UkWZF7q28kl09ZK0TDaA
	 juLymR7g5HVELyyVA8J+zjVwqn8hOGqRwiSZcoLkYiEmF2If0/zWdRG6+7AlpSaH0K7wQ
	 Jr7gGnzfEv3DJouGAiIILn+UsPtwSIYquS1haPY4oVHOQgyRa0iVF1p1piPXiI4GoRlbe
	 M6haAu4bdg7XvEBteD0iO6h/XM4ujalZ/IogJuShIYSGebpp5EWeShd1E+dPLMzIZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
	b=SKwy9ghp5HHmEvIAgbYxbz4Ucbujti//8/H+zAOq9FhEfXjXHoogFdB/PCQCXHgANdar
	 CyzExH0hg3UyUrBpm971TPqb6Cn3ScSUlbu/0mQ+69NsHHpxTfNPuyzRI1fyxE2245lfy
	 qaLQwtzJwNlPd0gX7BLhRog+tcO0yKd/c+DwGVZKosikWxKd4P6wYx/2/c+9hojbbIRWL
	 kYs0BcTc8efZFHVOmTiI9wVpBZogTwzwVdgdKM+7KisWMNO/HONv74ztdywyI3QW6OcvF
	 T6HqLO1MygJf1JF+ljXHFWubsZ2dquP2HzVrRj42WxjFR8sSg7UCBTEDUMoE62lzBWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wo4k2G9C;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09127606A896
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09127606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wo4k2G9C
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed08b07213so4265425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560411; x=1795165211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=wo4k2G9Ch+TdfLfKs3LSzSmoXQG/4x9YfDkSpb7CG24WR2mcPTjIJuoR6KK0Tvq81H
         9hks5LOa5Eowl5fFrARTQyvR3ttBVXQHLLqyRTJWvPgJ8Qo2Wh2JU7Ydef/nrAET9D4t
         qintq2fx9FyCfJzlqBNAWXfJtgd0kjo8hl3+yInmg4qfq1J/u0HVDFEs3UFnxR1ndR3i
         erkae8PQHbdcTmEBhagTbda6IExPwxCULbsjQYNYWy/b2NHAQpAAgYYTsE2T9ps3T2Ql
         whhWtevMFy8kw/Z8r2KlTkH+7cBJ2/TxRSYRhWTZRj+o/oeXAxEPPXSbHM5F6pUCyWac
         EelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560411; x=1795165211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un80vRFzwpcVSJmCxlKjL26KdkwkmzqjZ1VKDAH+aPE=;
        b=hVQrWNEJlSIuEZYUXkYGKa45PtnhH0DLgXvf3seGIwdUhj3I7QfjriY43kJNExQhKL
         ztuHrslLfpBjgDdaPEFXs7XN0yicEpCZ0MYCBEMDERNcA+63fY9BahdbN4mbGZb+OwBG
         0ZbYfGjYm4jzwbhScJeiKwxkDBjKyiIcivKJtnuo4CwrNRz1dfHB8vc4zASWNdTJkAoE
         91eddXZZilU2P2zqIjTATtaxzoBL6e9Jw3KFZDtXIUgbrHkCttrRM9J3QupYJrH2Jqwf
         9iHMBosc6/oKR5GsCHOcCdnF6b6y0y5ksHAdEX8Kqkb8kQ9jrS41pL6EQdyvULuD1OpD
         QzGw==
X-Forwarded-Encrypted: i=1; AL+hErFOw1OxKZ9/hA5X1/zL2ukECzILzjqzl/iz0ztNKQ7w6uIIdkgUzavUIgrwzgn7fxCzxuams5JUrWV+TIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n0I4yDfmBd93dUiY1Tmr1TUHRAzxOnaC3drQ5OMXX+F7YfWBL
	LRX6ti8efTFBx+/td+GFnM0SQXRMfJhMfo0QOoBLRTALWbAtQbO3EIZl
X-Gm-Gg: AYBFou0RtCAt9V3YUBpRgCu61R6URztx2WGFqaTJeHJ6zCi2yhIyIc+o8uZPmruEabr
	SDfAYmQLrm8z+cjoEUUDEUvnbx2t0RArtxaAZwxCQRD8/MF2VBvFhZCw26OAM9RtPL6BZpd7tc4
	dYVecWv/DStPgs3FxIA/s3Mcb8pUKi7ihOw9nrbOZI228beqjId3BAPkWqCPmPidsTL5+vcL4AV
	khQ9/X0PEpmnkR8UnwGhBU9ptc+NJwN343D78O77ZqdZKa8AfLtksmD1XesaRsM1poLEb5K1Jo0
	8O2+hSQe2WPTHKRvbz2WQ+pXdlmxWdPN77CSRbDqBNwzR8P6FW3t1NDYXOx0IPjGld1J3TP+To+
	32DEsM2PyvKhOkgNnWYzyQHgz9Ng9zUo5o3KrCH7Ohd7erkAyzdJ/72r9A/kurPB+6XytXDuy8T
	0UVHDplH/5YlLzm4dC4EMvCPU2ERdyFA9FDBwg75bVW8NgvYZznghKznqKcn17Bb1xFD9/RijUs
	f2S/M+qk/9BMBCdSyiSjMaddRBJJcSQPPogleinRK+t18xjnF0mVDUqeGCsqOG0A65JEGOaVJdZ
	YsAioq2zlHmP6zVvfsUoeG2U3s3CXT7RIrByt4FTvZWnuLrk6Q2RC5xWpfV+RvEGcVskWz/k8IL
	4Zqtj
X-Received: by 2002:a17:903:18e:b0:2e9:4bf3:37a1 with SMTP id d9443c01a7336-2ee0dd9fb88mr18714675ad.63.1794560411369;
        Fri, 13 Nov 2026 01:00:11 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8dc859sm6953055ad.59.2026.11.13.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:00:10 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	fyhsueh4linux@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Fri, 13 Nov 2026 16:59:59 +0800
Message-ID: <20261113085959.32798-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
References: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
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

Document the Nuvoton MA35D1 hardware matrix keypad controller.

The controller supports up to eight rows and eight columns
and generates interrupts for key press and release events.

Signed-off-by: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
---
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..ff4f94166f0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Matrix Keypad Controller
+
+maintainers:
+  - Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
+
+description: |
+  The Nuvoton MA35D1 keypad controller scans a matrix of up to eight rows
+  and eight columns and reports key press and release interrupts.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+  - $ref: /schemas/input/input.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  keypad,num-rows:
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    minimum: 1
+    maximum: 8
+
+  autorepeat: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk KPI_GATE>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <MATRIX_KEY(0, 0, KEY_1)
+                        MATRIX_KEY(1, 0, KEY_2)
+                        MATRIX_KEY(2, 0, KEY_3)
+                        MATRIX_KEY(3, 0, KEY_4)>;
+    };
-- 
2.43.0

