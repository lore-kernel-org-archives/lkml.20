Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A3535FB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917298; cv=none; b=WGudQLO/HoL0t0WSbs9va4Hz85VMu44Zuu2hk+4bARD3ZUryaP8A9N6Dcd4LG0ZD8DvKpD7CVMtTZRT2Eg8QSiMMk4LGFksb/sLBwuURdkXo/42/4HKVgCC8Z+/h1RstCIdDweUI4pov1SsN+UhaRXB+F7OV/fzQQ2L/z/ATLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917298; c=relaxed/simple;
	bh=wm55RmW1r4T1LjUU0ZliyxGlpbqgW7bOTL+XJGfRdys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7r9qYPRuk8VkDnCjfiTQmMQqElacp6CWOd6yFHe5N8/tauHdbCBDg85RRWCzVGTudwY4Oc4fjlkYx70D9GBgluvRW0cui0jUwH1Sq4PW8J9BoyFfGZ6Zx/DMyE4xfZn9D9ttbaBlkj6uOGUQ9yePHPPES3ftEGlx4XNNXDPOsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isNjyKGT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isNjyKGT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24018955e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917295; x=1792522095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=isNjyKGTYSpE0+bvGQkvV+f9bT2lGALMQoe++pSCJPQYiVeoVBJ7HYsmo8SG1EfGjt
         dq/pPTymuNcPI0UjJI9xJiIcnlS5tI0LMzVrE1J5L7X6nn34zonFxLs+SZ5PNIangObs
         XVjrNlagcZA1LC30Naep9PReM5TVSlwd44/IQ5TwewAVzmP4iTX/VEH/6L1vnAEP3J57
         amwEH2xZ+ZozhvdnbjIq4sit1QQb1SvuGrerFAwY1pbbQBZNb4BAHB+eNPXLwA+RHfjq
         D7fWd7sJm69RD6mNaoTXDOicQHXj6G5xHjw+JzamEVZ6E41x4H/y6u8esSIoVDMbFP/s
         vDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917295; x=1792522095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=CRNQagPctPj5phCk9/U9DAWYVs9Kb1i4k6fZzOaY17c/Qo2gzRk0QgQEIyxj180kNl
         gA4+FvVh097Z0YzfUTQIJlsnRKYFL6B7xQjkuM8ig4YHKayf+TOGpsvRUS3CffogFu5U
         S7Xv7g1/EnukCiOQClYeyxu3H+Nrszxxgqwwv46LKVsnKS5R7yH7OlR7QxOehgzpdswL
         iC6jlsWsp7hFSMWi9zKV8T6lsIZaRcpVIkAmhWl0l4wYrT9qPkw/bsJF/76Snx8lHh/u
         t4rxwg/BmMwrD1sRcPYb6zqOY4KSX4qAd5z8ZPKttbrHB8UVVMgdTRhizOzN2tBBOfL2
         Hssg==
X-Forwarded-Encrypted: i=1; AKwUvByrBCmpd3oj65HcqiMB6RgSqRl7mqPDIdkPz8uwjzd/hJIIsYH36vw7c03yIxlsn5CbtchbgfnDAC+Z4uo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIARFtVdZremiKZTcDEcwlRg5JcrNM41tztiZW1V/nmWy8yz1ID
	du8f3zBFD4eXuPgWIDqhDKZZRk6SrdYsI6+O5udzZ6wEl0bwH/N7w8xM
X-Gm-Gg: AYBFou3bnsTk5q1A1fZmr5QmRi+ewMyBw62UqyiX8SCa3n/i9dmkDpA1FOOOojrAZH6
	Ov91vvPDRQ1gTjXC7m4kUzLynMeb8drnr8qxu42/1kwYT9oHEchBQqBDM1UkLqGCuyR7tdOgdir
	kgUJksedxDDVbyAOhmKQTLLolWWcYxqpOijbjNYoYtCgxmmYohXDto1i4/2lyu3YpAQ7SECyWGS
	Ten0+0DXOcdAcOeIJq3dIjipehrTblbAH+GQNOdBd3OmkC/g5Ehmobw6wuqt3NuINadJ9rt0Uhz
	PHHtlmukdQ5C2kXydq7kwIXU+qtDu0Z28hyk/aTStOfR5dW/vFc7cnjpqewX7cSgP/Ib/WkimI4
	Exs2awVyywITASLXIJKFG8mMjSrSkuXhRvkXnbCV9BKWuaAA6QReB1ppT1tgaSU3OlK4XCymGNq
	GOZ409QPHQndLNjpu/vAp3hJbSmRwpfh7k+UN3HiBZnDTW3UiRIesOf9qBMR90m9IktiwJW3ltP
	7xbmXQQkyQLbJICFsA=
X-Received: by 2002:a05:600d:644f:10b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a196611aa3mr148480165e9.29.1791917294674;
        Tue, 13 Oct 2026 11:48:14 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm690557595e9.9.2026.10.13.11.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:48:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2 RESEND] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 13 Oct 2026 21:47:52 +0300
Message-ID: <20261013184755.530392-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013184755.530392-1-clamor95@gmail.com>
References: <20261013184755.530392-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/sound/asus,tf201-dsp.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..6b1c478bd03cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
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
+        codec@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fn34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

