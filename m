Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309275;
	b=eOueoHIFIJN0FB9yhwnxzkU46XpBD6N9unwAkVFqRclcHU5zVivroAXLjtZvVIgy6KSM
	 YKsY5LpxSiXolHUWiycyQfNV4aOu91vTRpdVW8X1MPlGCBJv6WGRD0+csaPzfLuIMQydX
	 tAiDhIYT7YoIrHM5cja79THnIkSTc02pYh54qEfGbpb9QmFeVbmq8s1TCiIcnwa5tYb2f
	 +ddJpP7/5HWuO1Tow7AITuwR0fAzwF/KMkx8xuukfgarS2bq0gmhmAHTlKa+YkHINnhEk
	 Cvppd1Msns5BSWDs1Z0e47+lamDA+gylCFlFmJK0yKCev6jGyuUTvPfNTFh5LZjdvZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
	b=qIgYbOqd0eihGkTLZa2DYakENUCgu8WANY7NUJFx4gn4wlI96CuDnxEz8eGTJVAP9Ofr
	 xjxtskcQAPTtw6bwj5q6EiD5J5aPgdiA0haEswAC+oCdA+NF4RrXkCz8Kv2tIYTdRIVhk
	 KQmxKUhKTrumWWuvgS2gIYko+IOfj5nkDeD/+efkYZHvGuZ8hqxn/A6h9tYeQix75FVyL
	 wJwf1WxYawrKwDq+DzyZBUxTABXyZBw4ULDr9yp4AeN0raX6jHaXJTllT5pDg1hRaqtrv
	 eqBk7NeXTGbDHCkwEtH6ekAZm1t6TRnaz3eMA9BeFW2qJpyxrHrQeuCVMaAZn76hC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0A4NBtI0;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C53606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0A4NBtI0
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso945416a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309274; x=1794914074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=0A4NBtI0eyXzfDdgbJFJ0O+X5G9I6rwPW7cDcK3TBsChbEgP3ATozn1s+AimSSjxqm
         eRcFDjUgqeGUyIa1o7Yi0YEHLGcr1EWbADhlYgoFlkAxVmKhewf8cghrZc+4CQrZlfRz
         U82qtl5cQHGi/el/C3+TstzdjXim7pE8wXX5j5Hue+TvObXOQ8dRuSjoDUrdhYi6x7LZ
         rEdNhPcZmY9t9wRc+pwsBOHq0hgtzUxSvIAE7szblCSWxTOwEZ1oHQuCqvZdh0X4aEhj
         k/x7KzleGiiYPI3F7IFpbIlzCyxyI0S7/fcZhCQ0JveNxGBFOy8NnIVMiN/kzJzdw9uX
         GmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309274; x=1794914074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDiweiYOObynXPO198CmBSeMUJu3WdkZCa738v5k3/E=;
        b=ebEW8OnUgcGTyIQc2GjNQErIkBgSzRxN0A+IPUXKv8jGrdkXP2K46jT+VdDsKJBKIB
         B8HhndFfq559XUt1doOJ9CvJuv7CDAodxPYIcTDgQWkr2/QnLrEyofGxS1CJbpsIw5WW
         4GeNL9Bn3n3KeM/Y+2hPuwLaZxCNW1yPkHMelAWJC7zdj3OAYCjWRuCNQALCOfYO62l8
         s0Xe+T0H79bSXnXScahc77nWk9B3uD1seCUO9BGr4898Rd5+7wFe2G8UbA6A8SSouxmc
         o8xtl8L1nKdpvXji0lX2m6WPZnwBp6BuFspnxgpLbrvZTROQggIL+xdAXThARExL6zXC
         0OeA==
X-Forwarded-Encrypted: i=1; AL+hErGUj4hEfr68zRvMa22d5O9YPcu9b8OrGrT/FTauzED/vpP/F504rRmc7cHVUhSG5B9IkwlsrUZ9poRYXHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v/wIjtIPC+NHLhEkoU8+iFvMlBWH5oVZz+QS/BJTFVxA/s3zA
	UobpsZXg2B4h52t2aUJZupemLLYlGWjuYGSKDKhfzG84GZaYkKjp7rGu
X-Gm-Gg: AYBFou24txAsd9MB3Zzo7QY+l5l+fYyynQyhQNB3vj3KY6L5LG/9c2omdUaxmdwOcdp
	BC5kXWuToYOE+0sgAY+3dAKQbBirtBq85n3x1YYu526LqykJdvvCgEYGslL6GUC8iXnUvBi6oo7
	tuPHjFSxuS6wUmz1jnFbfKTIaloxKtN19mrXqDWTLwo1d93NjncAp8zbTWBCi1IJoJg9JmedSXu
	IU6vzUJJnv7FqnjMksUQgI+9ye4jtVEyo9Qg+GRYTHQANp7Rp314pM4L5JUilX2ZDos0L5u5fLu
	1MnHuYVtOUbQodsRdjGjgNCcrK0IgIq6eRl5BMiDnSpelSPtjFO38jLCf2dXzi+YhY3EjMvUOS0
	tYp6J7fSsbclryFY4RZREgmFT7Mn/0Rc4STqVeN27x9KQA1v6+dnmSbmNTQGl8F5euGkZG93UVB
	h6r7tG8/W2XQL1Jlzb425f41DpMxtsZvHNaugOssts4+pdySaFUSdfZ9JckW+9+zCX27Wf2CwtD
	AaZv0892PvirzBvZHNP+YHkr/VCOHY8G+SuWE7QP0Pw8KNYcazhNFHCZT/KulXgNqzGoIZtG6Qv
	k/u2YWJRQYRhEbt2B+ZJCJFfSnXUCQr5xc0jyv2cCv9/a8rE2SDkq2hblfJN54N0q0NWunYuVfC
	dbDQZ
X-Received: by 2002:a17:90b:2e87:b0:3ac:4e18:238e with SMTP id 98e67ed59e1d1-3b166d05111mr2527465a91.46.1794309274191;
        Tue, 10 Nov 2026 03:14:34 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:33 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad controller
Date: Tue, 10 Nov 2026 19:14:18 +0800
Message-ID: <20261110111419.89535-2-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
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
 .../bindings/input/nuvoton,ma35d1-keypad.yaml | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
new file mode 100644
index 000000000000..be678d0b38b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
@@ -0,0 +1,73 @@
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
+  keypad,num-rows:
+    minimum: 2
+    maximum: 8
+
+  keypad,num-columns:
+    minimum: 1
+    maximum: 8
+
+  autorepeat:
+    type: boolean
+    description: Enable key autorepeat events.
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
+    #include <dt-bindings/input/input.h>
+
+    keypad@404a0000 {
+        compatible = "nuvoton,ma35d1-keypad";
+        reg = <0x404a0000 0x10000>;
+        interrupts = <79>;
+        clocks = <&clk>;
+
+        keypad,num-rows = <4>;
+        keypad,num-columns = <1>;
+        linux,keymap = <
+            MATRIX_KEY(0, 0, KEY_1)
+            MATRIX_KEY(1, 0, KEY_2)
+            MATRIX_KEY(2, 0, KEY_3)
+            MATRIX_KEY(3, 0, KEY_4)
+        >;
+    };
-- 
2.43.0

