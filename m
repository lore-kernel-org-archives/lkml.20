Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679981;
	b=1vC3+Hj4xNYUwtcAlhClMChcI+B2ScK3FdGG6C7/dIJaL1edsLJDyWpiEYa+6KsxhN55
	 fXXHylROXUgVDiLBbIrben4G8AsVgmHn1kjCV4FHdvd5QxzfA3ad6qYgjpW+/SFWFCxu6
	 xDK+D/cXAt3OA+vH9EWtw5PALyfwB7laxXLWB268pmQc7g6/Swunys1AJohxyPZVNmDBU
	 LZLEU+UDefW9dCP2AbfEJuEAjYjqt4hiFNdKl2s4t/1nIHUPi51pc9weIxJcYny6LZahh
	 CtTDCb+KST4qXxL64UrpXKQdup1DBuP+coM2af8G8XSTrxE0yKDBx462ZA22OAAfbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
	b=4yMOfk1D251MoH/mikne/v0u8N7D9PDT0XIQvmaJwV3AdzrhS5DRrpPYT3Lj0xcR8sPV
	 XxpsXlAtQ+Vn3nfZ+uaZmKBxDRXFJ9xZq4veWXSROIo0LOoni2dmNhIjD72D9kbyjLc+S
	 /UTAseqlTaN+QZrR3AsYlChJWyiWzb/5qx3B9KWtDHERZd1XDHjC7/Ct9ZMF0npoEnmcP
	 ZQgaTTRe7arA5C9enOJAnbm3tGFFyM3RrzshP5TRQeiCIK1WZyDC7boq2ALJOghc8Lodd
	 xQg6tdPyDT2eeBaCLVxkMJH7YL9KkXMkAjbSbgCxDOR3P8lYhxjywBXmjif6X1qF6Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JIv+ngqf;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12F606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA12F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JIv+ngqf
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso4915005b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679980; x=1794284780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=JIv+ngqfWT2SOadLAtIqQVqiPR+GCJMvVkujmyHqPJexcSPUUuOeSsk6eRkm+jhxkl
         MmU587GzBGtJhX3tcXRnt5ieOm9X9jFIjJwIapATWaDAupGhsb1WMnCUayuUR88AOct5
         bw8ujQo8Vcu+0D/mN3kr5ZhNACcPRR6qxD4+IYsJqAG0DA1SlqbKULZAeJwEJls9xh/c
         uOnoiIu8W8OZbeCVc/QZYjBNXj+H/Pf+c2iI3kTZBe0P/GTpy4n5TUGQr+tketQC9A6F
         b7S8sdyydDYrmjvPCZq5o1pJAu6dr53DOMDo3u7JGKsc+80Jy8PB7LGGcdt4bQbY1IbJ
         zVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679980; x=1794284780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usPhCDmdcEd8KAm2S5sieLl3+GJvxhBTURbskqwIepo=;
        b=YDPSE+o366SOvZrA+lAWsZowiPNqoW4UEDDLyBYsE4dRGCSWGyhQDlKfiadJeC5krv
         NGREAMvfg1/D7vXtoFOQi1cgJGDYZT9/klY1T+NIM84xGORpsCA9r5yasT0AafA0e1Hc
         fsz50dvcqwBElNB0p1rJTwXQrFmili2NGyQWpJTNAXC4m03xcJ4Kxgc/xpTp4xHqv+ZE
         6Jk0um6viALpURggZ8fVmxjpw2i2tC5oXPTHASIT3KOmDFL9V1UXtcphvTXsHLFwi+yZ
         e99m5bLnHZX5aN5Yd7l/uNimlN0Mfei5c5sYN3B5+yj8yI+1653Pk8K/2x7MC5E4s/aR
         QIRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2YgvN3BrBvlseb2yQhcy93ADcWwcYWI4UwGiF4hQwfWCBJ6aIVWo9aoRHT+hzpLCTATMvgPY8swq/GW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ACu26rNAXh33PmJmdc9fAABkCQvmEAq3i/YGaVk0J4cUryiVx
	YDHf+ZB/CdGJHuwYWDG0yE4hTBGXbTseVsf1RSqd7WMx/JhG2iRZBX0w3eyNNzVEcB8Ow0thg+i
	eVbs8pGiH02iBUMCefGBvhVpVzJpdxEVaEQ==
X-Received: from pfbli8.prod.google.com ([2002:a05:6a00:7188:b0:8a2:7343:1d03])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:118:b0:3e2:83bb:a61a with SMTP id adf61e73a8af0-3e928a7d42amr11416861637.5.1793679979791;
 Mon, 02 Nov 2026 20:26:19 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:06 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-3-vamshigajjela@google.com>
Subject: [PATCH 2/3] dt-bindings: spmi: Add SmartDV SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV IP Solutions MIPI SPMI
master controller ("smartdv,spmi").

This controller IP is integrated in Google Tensor SoCs starting with the
G5 generation (codename: laguna, canonically written as "lga"), so add
"google,lga-spmi" with a fallback to "smartdv,spmi".

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/smartdv,spmi.yaml           | 126 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
new file mode 100644
index 000000000000..e0512e60d932
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/smartdv,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SmartDV IP Solutions SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
+  controller supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: google,lga-spmi
+          - const: smartdv,spmi
+      - const: smartdv,spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      Core clock to the controller from which SPMI SCL is derived. Optional if
+      the controller uses a free-running clock and clock-frequency is specified.
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Input core clock frequency in Hz when the controller uses a free-running
+      clock not described in clocks.
+
+  smartdv,master-arb-enable:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      Enable master bus arbitration phase (0 = disable, 1 = enable).
+
+  smartdv,master-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Master ID for the controller on the SPMI bus.
+
+  smartdv,spmi-version:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+    description:
+      MIPI SPMI specification version used for transfers (0 for MIPI SPMI v1.0,
+      1 for MIPI SPMI v2.0).
+
+  smartdv,arb-retry-limit:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Maximum number of times the master retries a command when losing bus
+      arbitration.
+
+  smartdv,prescaler:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 0
+    description:
+      Clock divider value to generate SPMI SCL from the input core clock. Writing
+      1 divides the system clock by 2; more generally, a non-zero value n
+      divides the system clock by 2 * n.
+
+  smartdv,read-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 32
+    description:
+      Number of SPMI SCL clock cycles to pause during bus turnaround on read
+      commands to allow the target device to fetch data.
+
+  smartdv,arb-scl-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 0
+    description:
+      Delay between arbitration and Sequence Start Condition (SSC) when the
+      controller is the Bus Owner Master (BOM).
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi", "smartdv,spmi";
+        reg = <0x14853000 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        clock-frequency = <19200000>;
+        smartdv,master-arb-enable = <1>;
+        smartdv,spmi-version = <1>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..f44c597c2075 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.317.g454f8302e1-goog

