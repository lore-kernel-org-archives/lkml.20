Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945226;
	b=FmHkNAOL9bG5ysmENaZWMOMYe4M2xKgVmxomc/Hk5MvmzSAn1KaWZRCjfPjRk8YeA6U0
	 UKB2+b+gP+YDKMq2Yf5oVw0HPjKdV9W/TXzzV8Mo5qSVpBa3pUmD++EGqBjFrL4+XaaeR
	 Xkt6lOCLNE0vJ4Vh0D6p/y9+DcGKLET3ky6wH4EtdTmIHXBPjjTTxgD16Cw9L7sZRAp3q
	 kCDEGMR01aJlYhy0huOapzuODvbHK9jMV1EnRb5YIyUYuIB8lGZAGIhD+7m0YI+O4CRic
	 bl+zUlFET3WDrDxaC4o/NUVOkLXItqNdxT2RfKPDKhdYfaz/3LoOEXjnhCnjpG7/VVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
	b=VaPtYGBlYgVJ1VnnByDZ6Nh4nFEu9ig2KwPHbuIgt1IqJRhthSbSqyAzuroWxCuZdFtL
	 iCktsIfjZnsPKOhHSZ8c+V4zMw0WdOzfKDmg0R51ge0NJFx6Ar0+uYi69PDz2FHYp65UL
	 LdTTtSAYghjspwtbLfG0LD0j94Lrsvu/NIFFf/yPzyU96huUyZ9vslIEWA0XT0YhgU+kK
	 Rh5BmI8n21IwjxEfo8RqwN28jE5Fm9/R0HiQ9DHXlWLG4kXSG1qPqUt8Na0ciNDrnfquS
	 r9XpNoVkh0wwgHzIfnjmDF6kjqXfadIfF0OghAuN+YARGAbG1qLgEVFCGenNK7a8o1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcxFWBHr;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8D6606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcxFWBHr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so715170c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945225; x=1794550025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=WcxFWBHr+4j2KzHRC3TLQJ1w39AeH4QSSkQPUUOtOS4x2x7RfijiQ+SUzmHYvHzZzW
         DthpCGRCyGbQWAV/SzLZivyErV2R61UYLYU3U35rsnbG4+ZJtr2bbrzRGOXUFCLIGK7P
         FBCVDTk5U4M9DQPfvt4aE+PhtwMiBXCdzR028rbsU+47R/OBFAsVtJhyBBDtZVJB39xv
         d6ehxZ49QMLWRzXgycQudNu4ZEtYT60NSIHZWfCifeNsdbKDUHg/+znx4EqO9BYWXVrB
         f7d5gRlx8gkbv22oZV4uBKOtJXzqKRmkDADzjyTVtbx4TbFM3QHSZ8oLhVapgWddGkM8
         li4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945225; x=1794550025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELq0ou+C6nHSxjAqQFysu+9NjstawTtJSoslQjowt8M=;
        b=dG9iegNAfKBqwDG9DkjC9HUhQYANHGYC675nwRvRHiQeXwpls5yrNKhWjqd/0yfq2n
         fWyzQhfIGttxMYMhN+F9v6XAzxEUGYp3AqWBnapn7tcDINSsfzZNyWHHlXJMMMHf2hE8
         iQnEuF73xWWXRoDU8gg+UTUe7wzUjWcHKVIxc+qFE5mFOsXoXaKN2twAlfkXNZ12tvJI
         GdZinO+MaRjanKaGx3ImPOb5jtBRo3VCw/bi75ypY5zpiPF9pkBx4uixCRFYiXG9V3TP
         2lu2zU0eH334mH+lXPkRTH56m/4omaQUzzEt5FDqBA7A5aipukcT44fxiX4GChb3fLLI
         XDQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnBR15c9gadMJQiEg7JPvopcNyEYDSzXfraK9cSSHT02pDyMvk/xJ7/hYqzsu3EfQN/TvXbRzz0yagUqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MYPT5S1lD3odNQdehtJoJIi/kCLow4FrXwd6o99qLCc8/gQc8
	eQk8egL3amDHCsv7LeTYLwVU8m0m7Jj7WUG8fpq0e9IZjiQykKPpZskO
X-Gm-Gg: AYBFou279f8kVD+0mPW2A06DBvvb9w9ghKevsFkyiI5UUvx7HTRLeBiYm948rj8YJ5J
	GfDOwxQ7NBvlQqh7oLbXBweBE6iQf2nheLCTXqbo/w2WL9d7SfVwyE7h2ZSI7ROHWJ8fOgluB9X
	a0TROaKLzvvoFxTa99zbnJRra6oDmsHIPhI3bucd6ldXMjHHLvl9Z4SaWS9W+aeMkpEg4eMWsW0
	fvwnkbHmtIMK3aHKCd0tRdIQXfCuGCbMd83v6qg5XeRp1o0WSa+r5J4DQrBUDGGj1EaAqUgbkdo
	haW6frin5+sEuR3RN5RdgYRCvnJRqwtv6F9tOaCi3AWsIzB1Ojgmr1eBYUctXUjp94h60dAvjlg
	1KpRLz2fEhRf8bneIzAOimNwL+TLfoNKqBlAHuaJ/0MEDHNoDkI1ZHYJGSnwNovSWIN3v+8ArL0
	9WcH9MVzWwuXUntKGnqF15sEEwU7IlO2eAlH10HbfMdA3UEtP9bzsTjbkQTLfie4LI5giC/OKCD
	/IytoyyjuXMry4rh5UtmT5GoJ8A5H5rZHJ8G31IAjmYYLYZ9+YPQqFIaOtaILjjfnhZTD754yUM
	urWvyrV4s9zk9S8h3J1lx96nmwNyuPkmDfJhCY2eZd9IqRBMX9QJ
X-Received: by 2002:a05:701b:450e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-1b25d35462bmr1797486c88.35.1793945224722;
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:04 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
Date: Fri,  6 Nov 2026 14:05:23 +0800
Message-ID: <20261106060525.346873-2-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
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

Describe the SpacemiT K3 eFuse controller and its readable bank 0 and
bank 7 shadow windows, which contain temperature calibration parameters
and other configuration data.

Define the AES_WTM clock and reset, little-endian data and
controller-relative NVMEM offsets. Use fixed-layout cells for the
temperature calibration parameters.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 .../bindings/nvmem/spacemit,k3-efuse.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
new file mode 100644
index 000000000000..93f4301c8289
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spacemit,k3-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 eFuse controller
+
+maintainers:
+  - Jiayu Du <duge1256@gmail.com>
+
+description:
+  The K3 eFuse controller provides configuration and calibration data through
+  shadow registers. NVMEM uses little-endian data and controller-relative
+  offsets. Read access is limited to bank 0 (0x104-0x123) and bank 7 (0x190-0x1af).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k3-efuse
+
+  reg:
+    maxItems: 1
+    description: The 0x400-byte eFuse controller register block.
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+
+    efuse@f0702800 {
+        compatible = "spacemit,k3-efuse";
+        reg = <0xf0702800 0x400>;
+        clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+        resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            temperature-trim@19a {
+                reg = <0x19a 0x2>;
+                bits = <4 8>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..0a9eb764ffee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26525,6 +26525,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
 F:	sound/soc/spacemit/k1_i2s.c
 
+SPACEMIT K3 EFUSE DRIVER
+M:	Jiayu Du <duge1256@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

