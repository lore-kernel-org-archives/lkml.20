Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586783;
	b=3c33vbxmwOk1s8q/lkwyvsksDxXpjmoWzslSQXHayyry3KkqU3z7u5aY0+Pakc+BkQew
	 PAFhf5pa19zzCgdJFLHENCenVlnJCZaLGOwKErpZver/IV6AcaGdZ4ei/XdJaQ14DdbsT
	 WmS5imjQ8ps7xsXBGJjGqKGF55BbggvRqf5dceZwBCCt0g06oluNJYlgvtDeCC2iVmVPC
	 SXA5LzpoxEAdkzkWnqiCgBH8JIJrKRRNZ9rTxCIzeJjkB571zI/J9hK97D0HhQTK/VMQs
	 fqw4jw3jiaYQg+prdob52IDXygZt/SkWPm0v57AewbhRs//MJxRYrQV0R26aR0k+8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=Lv3YKUqOLZxt014w6+rGZaEkzMHvRG+waph5rjJFTKtvrt7dPSalrDITNYbPoXMRXY3x
	 XHhgb27n/JxPsL29buljtQ7VfKjm4pcaa9MP8PJdU5eOsmnpSJyyVe/SYSjj4eKpEYFrN
	 venLwfVkK81GxklVhiJkFHVRHndKJJqeS8y/VufZCEKk+GGCeTz78EC3fFFSQn2BT+kcv
	 crAS0zdEw7gYM44FEV4H8igePXWzNpRRpmou4YXsbjOKZ7NhCy9ey+32X74SZ1eGoONX1
	 Pp7RyBCKlupezPYmrOZ2HVRJsylIHuAY3uhtkiFwwXMqo/Jhr7xyT4ogp0RjRH2THVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE555606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE555606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so405273b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586782; x=1793191582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=TFq6P6r439sMoTmALZIeItkoFlfJeoKAlxxoA82luquzE5l+j6g3th/bVRROMHmjtm
         881PAPylfPqjNr+I6KrFgKKDNbxNGmXAqWGhvMDNcVDPOJMur3DVR26mqVqdfYYFZ/Gi
         KnOiGWIBK93oHGKOopJPlU2SUCuxspDu1ibqqMK/n3Rw9bJGaNWQY2Lpl1LYfHBfmFDN
         E/5BE7aw9noyNxFU7kFOKcUDZAoJ+C1zG1ErrzhV/NIvgVFZHhvgK3odMUSdpSzyLUXN
         1MRD13U2M94QtKe9pp/d+4sVEh471wHPXhdCV5SxGqoOiMstjaTzoMf1W7j09QeqU66l
         y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586782; x=1793191582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=aMFxRNVP21nqgb1K8eShAOZutPt57JJ7DoHAD/9zlMAVFRxsQHE6Szcp4kJVRHZ2/A
         FsiBjEkg8+9fct8S0eiprgU1z3iCkZU3bLnR50iHWil3UxnDsH0wNB3CMPOXapk8RKNz
         WvP2hE45hTZjxjD9KTvnvU56jnf9EB/7s1Ii0X8DdG0YZSogoqRfPdy3xfn8w2Pql+j+
         6wQPmDqaBzMOpY4XW2vn44UU2p1oWt+TFp3Ma6oOnnQphK4RDDjVFtxEPMYYIMVTfQgn
         PleTodIEppll1UtaiyIW+ODKyh3pxMvDPpCtudQ7QGfHbocoWBTfteHNofthHlCBlcJe
         DKdg==
X-Forwarded-Encrypted: i=1; AKwUvBwKtFYdKo2BuxTPf66iihSYH1n3wRdL/A6/j8uhVjYg0F7WMHKQXikgzfXjoY0cS13oFqY2cH2sUGFGZp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjvdDzIWougfre/yQL9t3/sjnuUh3RqJldOR8MrK7MVY8jlP+N
	bKpxeUM/dM040CDIAV5rpH08lh2S83qhChbEvT4adUfgKWkVc5cBed5v
X-Gm-Gg: AYBFou38QLLJ8oJkGMUQ1EOeSmZQf71oYKfgfaXRcL6X8rnPEABstww+ChVqLRDxt8u
	ixKHfQeIsWfRwAJPNWjZhb9ktG75JrLOjgmoUgv8IOKjCNA6+9FgxRA0YEys538+qkEC/nwS7cN
	e6CMYJvrFExNHKi/B0lk6zU6l0jCCQY0IIYkHJuNNGqPyUUl8YF1fsZlY2TnfakdlzTn6xIy0Vb
	QeKmcMjFI7pKJLOVkwlDhmOmXUA3syseiUp3G7qLOY/JUrTGKtMIwC7nKmsH6ugjGfR/u9CvJbt
	ciel18SUn3tFLrzuosupxPYZQqG6sDCVCsle3MTtzmXxoGiNqjcwulRXHfLvo7nNFFf1+Y6mp5U
	iy+mNEXIUwp/QisAa/7RhXgdSk2vk9K/ExBSBjL9nzQXNqsi/o7yDU8N81/9ikAeLludMYW+dia
	dp/y00EAK0N06AAqvbuLDRREobaY+B7Gb0wid/JrhppRcnEQq9VhqLeD5j3wqB3BT6lQv142im0
	pWIXSjNMjEEG6GfbZv4IgAOOzpTDcyZoDVh39KfxMhnz1AKUFa+qCihxyw9DjEkEsFBSDiudqVx
	XAVnXy/GfHtdnlAD
X-Received: by 2002:a05:6a00:420a:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8a089df2652mr1470227b3a.32.1792586782100;
        Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:21 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: add Everest ES7202
Date: Wed, 21 Oct 2026 20:45:47 +0800
Message-ID: <20261021124552.767218-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021124552.767218-1-jerrysteve1101@gmail.com>
References: <20261021124552.767218-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

