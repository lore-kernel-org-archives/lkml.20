Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936818;
	b=Y7RKjSsc595q+iOW2+koW2P80/cHkFnqARzsXSLlf/7AxiMZnhKBXi4ud3yWXhxfEbqi
	 o6/QOgOICN4C9KONxVFpy+OK5eOJR19wT1mnQfDh8BJB8YXocLTCQ43wWOn1LB6fmGKIS
	 oXqY0V5EbZQu10auvf7yAY45F0dnG7Rn9uwmU6SZ9LwGHJJJXnC+DVXIyoj4UoraTB7fy
	 whplQnzKWaoIsChdJHRKAvhH0hvqg48PCCtlzHm9f8ZnutBeRR6wWz53km5QwAzNSICQ6
	 QZnlFZAW2xMqrFw6cYzb6XDI5uLFPVfImXPqemyPaWsFAgYcoDfqQdLFBKZmao0FLSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
	b=LqUDFQPG09u63VFhirIyUOm2t+9/YUKefV1Ct0p8ETFiVssy8F8CsD52auiZMqlC/8j8
	 PhV7aJOGTR+D/yl+JAA28HoIRUJKDFocYoX18R/s+37kEcfN65o42myVBMy9hb4sVsDhA
	 lA5AJlhRWsg5f9K4v+1VEQKY3aQr0o/qtQ0rqCudNfzQ82GfwT1duaF0HIXUTzKFKPX9/
	 YDytLDnSaFh6jl+Yv958icYsP1Rx8ZRBgHvBhKGk/qiqc+4d81ek6lJ8OSXNfEeLo9GJo
	 4Ucfr0U+gRR0v9RuHjBCbGZ/YDD0sCSbDrdoskXah5bpPenEZLOoaVyV9R0l7W3j2NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmkcjQUf;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B5606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822B5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LmkcjQUf
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so786435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936817; x=1795541617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
        b=LmkcjQUfAHAMAiD+xUKnR0eQqfUvZabFBG1Enc9Hbz40FA0mImCIjOxNXlMesC6lpU
         9obmFyCzDpMFN7kBkkuFXfsRT15Ooch6Ay9fROWpQJfd+mmd1+Ff2PAsVUuVYZV6cdNW
         jdwuN8Ci5t1QwsTOoz5TtsvxVMsbCMUe6SIRQQZZaWPcH5aOxMw4Jy3Mdhoo6pgQdI/i
         tGYnmIig3iN7ZtSqUohNc6T6OMtxcwVz7cFY8pDJVZ2kLe69L2qDyWqzKMQgLAGB2+Ul
         PLJ2IbljOqXG2XF87Xj7a0dRGBFTWHaSRsA4EeLAu8M6mDnq5H0ODMx2IMAviQDJ50Ri
         UXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936817; x=1795541617;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jL5YnKAVfbEeVw+3LXIU76AD7FXA69elwf9ngK60tI=;
        b=gaRuT3uJMeNCHk0alIQZycQe9pCoJQqBqdwfFYi+r+poMSfKzsceLg0tFsn7mMpIbT
         1Ij/Tueb9zEjMteNiUnTsTFGKFwo0gBc/qbfIhdlfOR77E7LIxZPQVGhH702Ya4ZnG0Z
         h4Mrd8kpouk5uA/PJUw3N4QYYxT0GJgmudkqlTxybgEF/rnG12GMv8zZd1zJ79q3u7j4
         CCnkkeoDo5BFcM7DhKopq8RkRWykNe2mvZ1iZt5aj2l2B0D91tjyV1oDjCeE4pXN505U
         CBQm/dV3RHVPtF5Fg3VDcAZI3vxXIPJFfO0kEp2xMK/MSM6zINZg5rXbagqLdNLftqPR
         Py1w==
X-Forwarded-Encrypted: i=1; AL+hErGgcGCiA7DmvYl4l8knMJ1/YIjlJQ0TUxPm54W9X74CGsheydF1RxuetT1760N0mlafRranhjjHjyCn7+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kRwSc83y1IF4f/OtenqVXV6ioHmmTehD9x3rf6i1Ixwu3+nY9
	j7Yw0N3OaInF0tNtFjRWGtNfKUAabeSEui02h6jTAYE8gEav0PbfnymT
X-Gm-Gg: AYBFou1HN9E7l9X8W55o9qyRKHxJt+VjihLMjzH0l6Tr13uwFg/fO4zF6qhmof2nT6d
	YOLHbzt8s+Ea2/SUazx6MHTCos8wnAW11ps+QooVmKpBSeB5xX+NR7P5zUY+e1mt3ThIQpIVVxb
	A4dwmSsVEljZmQUSiroQJYa15+fHGEZ5wV3RnQ5mF7p/Yxrmw3VuRyCD4GUFYVXMAzWKQ0TT65V
	CDzgrCDuZzm9yS8yBxhPiUYLC0T86JG3RLpSCi36UBwuZH+hqRdTlfsMCdAf8XrmKWvbYdP6xnF
	pIAqhOagqWcArD8e+drduqPx69u2po8Eq4fWbynzLy+aiun6a18NT1YQosINxS3Co3b/mkmEvow
	MBqpXCM3OvtzO6+3D7ncr969O71rkxsXb25V3h3Svs8gqF31o8quVn7L2BAfMDYp6ad9jD+BfVk
	GPcpk2b5v8rd4o/sMTmQBL4eueFc6zsidFbQkymO6SXaILR07hAZHrhPjVKT77/ZVCLTt7qHOfV
	IfkhNr4DdNaf6hXAaRdYuEtGXaVywdbFydea7qTlIy77tRV2AudMoqR8OY2mZcDCGxlER3pz0wG
	R7G8OmqJMSgdjrPPIsn574gVV5Wzg70UcQ==
X-Received: by 2002:a05:600c:638e:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb5bf390e3mr287460505e9.31.1794936816714;
        Tue, 17 Nov 2026 09:33:36 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2e6c765dfsm8165024f8f.33.2026.11.17.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:36 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Tue, 17 Nov 2026 20:33:32 +0300
Message-ID: <20261117173333.1853986-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117173333.1853986-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261117173333.1853986-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
v2 -> v3 (addressing Sashiko AI's review of v2,
https://sashiko.dev/#/patchset/20261117104414.1182364-1-tadilhusrev@gmail.com?part=1):
- Drop int-gpios entirely instead of just documenting it. The pin is
  already described by the required "interrupts" property; polling it
  as a second GPIO duplicates that and risks pinmux/GPIO-IRQ lock
  conflicts on platforms where the interrupt parent is a GPIO
  controller (such as Exynos pinctrl), and a binding should describe
  hardware, not a driver's internal reset-polling implementation. The
  driver's matching change is in "iio: proximity: add Imagis ISG5320A
  SAR sensor driver".
- Move this changelog below the "---" line instead of leaving it in
  the commit message body (also flagged by Sashiko AI on v2).

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116074013.355363-1-tadilhusrev@gmail.com?part=1):
- Document int-gpios: the driver optionally reads it during the reset
  sequence; it was undocumented in v1.
- Reword the description to the chip's own characteristics instead of
  how the Linux IIO channel is exposed.
- Simplify vdd-supply to "vdd-supply: true" (left optional: the
  XCover5's own grip sensor has no vdd-supply node at all, an
  always-on LDO not modeled in DT, which the driver's
  devm_regulator_get_enable_optional() already tolerates).
- Rename the example node to "proximity@28", drop the unused gpio.h
  include, and add the blank line dt-check-style wants before the
  child node.
---
 .../iio/proximity/imagis,isg5320a.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..22259e341
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip proximity sensor, connected over I2C.
+  As fitted on the Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  vdd-supply: true
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+        proximity@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
--
2.53.0
