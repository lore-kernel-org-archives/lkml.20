Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5B4A0F12
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963960; cv=none; b=lUnTd8ZtcWZBs6M5/hUiuyV0NqgLTJ0n3ibhFOPjB3SVxyeAfyq/fhUGhKGm4n6+i5Go/0AsiL2Bk/hnbSLg/1EAQ0gYiGIC1mkmv9SlJXU4aA59hCanFEKZTvKQKaXsl8Wec216o9cBsEBYVL7BlFvpaZU5au025ysVBcpd7J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963960; c=relaxed/simple;
	bh=k1r41giEFofExMQ2e6Ka53lnCCUSRqj2gUqcvshC6U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJxai5TKY79cgNgpozkRt+gEXpNIQj7jGxrBaR3YBCbj2fZygobZsmlX1bTGMEasBekKxzvLbXYpuqpmJv8bIcnVTlWj1wGF+vPc66LbtnW7JRKm36p2K16fkPLVLn23wp6f7P0kvh3X3GerOjFxPXky/GubuF81HHYjQWy/waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCrkmq1c; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCrkmq1c"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso2964006b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963956; x=1792568756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=jCrkmq1ch0UBXo2ID85PoS6bxtXQrfTVszzjjTN2lEmBiInG9LNSwlszUMt3WPpM1e
         jqB1/EqbGhG5lGLJ2uG3diphDri+A9MBr88CF7WeSRtuq9S+5ZI9GA3f/zDBONutMQ4e
         KoUu0zwb7tfIGGRV7ebOtrriStdrJVBIS0zgvEqSJMz41gQLwTDp3v5sFVmIkNMoYxS4
         HiTREYgnTGu/p9qgrZt+PeK8jYXXtxjrkS9COCVZOq/k9+S1LwoUiiMZzc6tdBmMhZ6U
         7kMpqJMnC3M50Pjw2tagu0bIKbusnt6CJ9u8jLpgstPY+IWdtvbdrDR++fveesADxo02
         tD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963956; x=1792568756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/Mwahr2z9hW7MyIWREn6uWQ3XJrmLHNA2tUduWF5gQ=;
        b=sGC4EHhGP2L0vX1gHY5lVEttShrmYwFYneK6A/hWnC+y77dX7tN4dIpPPfYN5E1+sX
         rxNc+wfEpS+5xNF/+sIYK3B3qn+xw4pZjxoeablGXUGqU8UOqq/+XQOfZgS9T4szj91h
         CXx8dxVj/j3FIP4gkTqXOugoOKFPHuvo6gvULjHSxQR9rsDu5Lzg/9LTU4KBJ8mtjIzQ
         WrhPPLMwKepXFUa0tS80GrrPFDJ8myQ6gZymOQBQWwQdxzyhffGeYXNVZlumTmO+lv9q
         qWu8sO8xFMD1r2nDMPa7iZvhuRJJuA6hmbN2eimODgHJjgI5/vDMO3rQ4f7ERohUoAWi
         vkLQ==
X-Forwarded-Encrypted: i=1; AKwUvByVVUqCXY+F3E3Io6b8imY5wglubOsMUwzERs6I4JJeFjl4gFz8bub3df8PwjpLJI6kqQ/d7OAMDZKyz68=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG83MRx9sO2h92bPpS6iru8etFIud/estG7w4aDN2krI8mJNA9
	MMfNaIMuC6VvAlRbO7MeE+mXfbFjEkpVfIWQQKEeTJG/RNs6qwM3OVNQ
X-Gm-Gg: AYBFou1zIFBbbKosPPmWGoxz7eaJoifDrZCy7jhD83V/f9YtJM0ay5r0MvK01NFOx63
	dG8eFKWCWU6+bxRXIJFbJaTgo2uVvQ/T3/wvAblOzcj8Fgh8PqEcHZ1/fCG2lwNceshziJNe7X1
	GR768yZ0Us9OdnA3OlrTv7u6DtZbOu8YSN8XPaoenlyVwzmsiz9R+lD+ZKboIaQL3A8XEFyhrQO
	mMEw8shcKzTfrleH/jEYO5wy8sY6dfeLi5uJS5szYjf3tDHFn2xeofNGMzTLwqEpYGpxrRK717x
	p4rDT3oGvSPO95xe90BZuaN8WfltHaV8+3UN9rPl1RyUU6kTQ0p3hf3ju7zs0tFGCi2dC/z85o4
	s4mh3TtLEmEhAPVbemvt3eFs5YYzTT3zfFVCpFw7As1kV/o1ntz+7MieG9pQCxi7xhDOMU2Kts4
	by4cEc1JmNrjFtsWR6/xBXOmmtJ4ZB3p0pL1rQczpJBJp26iQosIvRwWl3G/L9Tp8SSuSr
X-Received: by 2002:a05:6a00:3d4b:b0:89d:e946:8c64 with SMTP id d2e1a72fcca58-89de9468d0cmr338050b3a.57.1791963955830;
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b74sm797660b3a.4.2026.10.14.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Date: Wed, 14 Oct 2026 15:45:13 +0800
Message-ID: <20261014074516.240247-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo SG2044 uses eFuses used to store factory-programmed data
such as ROM patch, public keys and other factory information.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
new file mode 100644
index 000000000000..d4bffe2724ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SoC eFuse-based NVMEM
+
+description:
+  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
+  public key and other factory information.
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,sg2044-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: Core clock
+      - description: APB clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse@40000000 {
+        compatible = "sophgo,sg2044-efuse";
+        reg = <0x40000000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&clk 0>,
+                 <&clk 1>;
+        clock-names = "core", "apb";
+    };
+
+...
-- 
2.56.0

