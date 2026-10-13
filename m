Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724A5218BB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914277; cv=none; b=dnL6aLroqBWMb4HVgMu4RgWre6tzMhH/SJZRNZTJ4GXhTztaxwGu9F6nQwJ2r89hZlqM4gejxzQvKcI5RfqLdaFwuc5YsCyUjS+IMs6QMuRq70cDZiYr5Qnns4Z77ne/vpBSl1sGlo+sZDtDUhHvODIV571DJ/wHPcXuPjiRZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914277; c=relaxed/simple;
	bh=wm55RmW1r4T1LjUU0ZliyxGlpbqgW7bOTL+XJGfRdys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLummHE0e4wInmo98xMrDodhtSPwGstPqtibH+xeErbmddrWEUjA6vEUOAwk7GWCsDc8V3XTB4oKNP+WtURhixS/m0bJbU/9omPkpxwNNZfLKrjOwWs3D7QDYG4AsI4my32mTnWdqmmkelz2Ka4mJCIa0cgklDUpKy1ecBpwmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxbHHyVK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxbHHyVK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so26232195e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914274; x=1792519074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=nxbHHyVKXFsVoF6y9WIEPwKGIaVTFcXfQQYD2aK0VLExhPeOoqfoe5bz4ZpgdgdqN4
         qesS+BAHvkTenMtgTDDtE5czPuFdY7plQrJL1nTg+3QMgPRuUbAnFN/5EDvoS3yt7Zdf
         C2X+PeJA5RgnkVenDnQl+p32PRvf57PkuDM9pef741AQIc2Zw7T7bqAKlsvh4f+lB6HK
         sWIuiGFUakGjWiKfJA85f8nksWzZiCANicQ+y3nuy3Zj6B5Tm2/ArKV+zSBvOHCOGen0
         H6YxsSiUXikrUD1u3KaulV+eYHsuctAqcYlwL0ojI+cuswFxYEYwfMiEZLK7aByuchbE
         DbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914274; x=1792519074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VnJFyDbgbe0UcJPjrh0IiME0j5eiTKrH6NBa3PdA/c=;
        b=Xg0e1gtonCYt1ZgV61UZip8LhFn6VcP70tL78sbEXdbaDGXoIx10EJpuGgoygaOcgr
         z/Ql5U6wKIjOaIzB/OqpLeZUoXR3+qmwqQkVZlsLEH54PuW2ClClAjozroATTC7CrHi/
         Db7jF2lwo5CihvazPXvwg13TpNztyMuIuQfClZTounMsOWaCHUMVdhhdpaEjYL60+a3D
         2ZTp8dSxJNqN/swpLBwus0Ccw0k/ty3c72Up04ROTdPiwA5OGBE1NI30SXUrovTq6yeU
         AIT1rZ9la7BlfRGF3g/wzFUIHabYptMKNbnQg8WlCwBDAEgci3lVcJOrgS0fzLHmkUy1
         eFkw==
X-Forwarded-Encrypted: i=1; AKwUvBzlJPZ7rlHjKFuzksM8tqyJ4qmeztUQ0YzDMtDm2oncoafP8YNk3W87ooZLX/YmJNWa6Y/cVDpAViuVpbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBFof+q9N0qb0j6RZwYuadvVH7VJzcmuMbmitbHt9pj4Ihy6rH
	5H3BU0xnVPcrgGjeZpEsrv56HTU2hkZrcIFRhT1p094rw6T7tlQr2q8T
X-Gm-Gg: AYBFou3M//kujp4EUa6af5SGoxRtPA9llrSa6cjoRKmwBM9kljxgPYyEX85ZUzFLKJi
	OyaHD+3X3sxHGiLjiyuHgm8quZcbVKeyBRVp5r/dh2Ip6apwMCJf+nGPE0rKbmYLRcXHQDBACIR
	t9KMKKk5dEi45IH7ENjPONBl2GGGW2PQ9Oahm7k1dgIUG7GyCAp0jflvjD/ozuPYnepLlG/72fI
	gfjLD+w8Imp+aTXxtWkt6dK/fb50kSsbGm69kkJBTPmHni78Uk+5ciaKEIrQSyJkBfX6zr1/nDm
	rQfjdDIcH685i2e2Tq7+WFxjf0IB/f1xHRmV5w5AD95sYwAgh/6ozPqH1LRmCAKR6Vrj7zAmJkA
	DDLr7dhkwj/p5QZRzlHXUP1o4b4iP9gjvLhQs6kzeZV8S+3WNp+UrmrKm4zcNi7ctewZbg7QHG5
	27FYYMG+V0U8iSvGvYXR5HZ03UspzynbpPZWQbMLHrXuS8KPof/E5NTk5Pg/KfIX3oSNRcu8Ct8
	xBaEeupHTdHx/id6UM=
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr237083775e9.12.1791914274140;
        Tue, 13 Oct 2026 10:57:54 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm447804745e9.1.2026.10.13.10.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:57:53 -0700 (PDT)
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
Subject: [PATCH v1 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 13 Oct 2026 20:57:31 +0300
Message-ID: <20261013175735.473704-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013175735.473704-1-clamor95@gmail.com>
References: <20261013175735.473704-1-clamor95@gmail.com>
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

