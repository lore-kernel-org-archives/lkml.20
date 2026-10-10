Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D654AA008
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637248; cv=none; b=nVtS6qmLvOvNWJRcrSMMgDV0xYMrkd23aTLCIytv1/2bqyPby+4F5rF0IlXm9CUH+dan6aDSIyrLTW7Z5otLs/za8S36uhoZukKlTDD9csX6FDraYGvWitPOz0ar05FDWScVTUL/gWsMBN4nhrhaJgpy46De/UTo6zXLul5RccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637248; c=relaxed/simple;
	bh=/kJNZEmu/mnNWyTwoYfvKuuDXYXzcDN9UduL//hSIR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEaTZJzojOClfMe8EsMYBXuECl3MErcAo2gK1kWI1uqmAfNJH5IdJ/Usc7nYid2///Ge5RVEff7pYEfYsSO6gVy45unzT1c7xe2v0BR8ADoFTt6eL6Rf72zehgd0foVAWAyF8Gr+QvRd4gr/Tw3NJ8BDWcN/wkzGZXXqP9J+8x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQLzfq71; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQLzfq71"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso1897755e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637238; x=1792242038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=fQLzfq71YawWUn8Lf5nmGCm1hb0uHEmXIxQsz6/N4HM7gm7zJUTLLEun4wJMfLtjDh
         Du35ffIlSVkEz9wVcMvMjHR1+3Zi4PI4tq0IulWcrap+Ok+c7eXbe4tVMxbxLoX6SjL8
         Tn/vk9esOW6iApVk5Gm3cvVbt7DLF7+tr+YC/CENfVeCwLFvAUXctmDrc/+eEvDFCxF+
         sB+R+xPiT7Qrd54/QhDiCyHeWBaugOcB4eLIJHH3/yLN+W6bBqExXKKkqhqV+PUnZMWo
         7jqrGcpWwFUUQLvocmf3VNZHwg35j037SlUI1xN076/goQbd5eZRYIYWEFqe88Ol+3gc
         R9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637238; x=1792242038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9MYQFCxh1yQ7ROqRBAiqvcdcm8W2x8q2IXByiIDFhMY=;
        b=onro8T4eT/SJHzXqIUfe3YIggKLA32hizFtAqkZIeqW4b4aF+03RgmKhXPWUSf4qhB
         BxjeWO5mHSnrR0CzSmyMz20S0RlrNJJFfyOLJfLZm8UWGoVVjx4sGKaWVcFLrmnmTXch
         OgO6ZEofKqM8ivuITrZ+FrgG65LOVmmbZ72wUOCfuUe0EoTw6pP4Oj/f31APTK7+QRud
         +R3qMsAdalBp+VVykxZGu2tiddmPw3gIn12ZYdFErcpbnwDO75ar5p2ceW3cbizRE3jU
         dV+Rj4cehEUWhzqp9S1eiFqy89KuF5APMNnLrVfzza9whYLw5D++Prn/7mx0tGEkokqZ
         W1wQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3YgQrLhRHF2jshDAhGZYLptzFsEEL6YCGWb+7wF2wMmSuDLA0VlICgaL666zyHXRp/sDmwKvIZ0XPz74=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMbYQWDHwEclh17jXehVcK1X6ZgkrC/ro/pJX5tEV7D5TBroyU
	M8lTXy3byxlqvfFDkKSxtOvDQ2nhv0S67Op4rWPyRluJMkaMKl/wv/AE
X-Gm-Gg: AYBFou2R0QhBNkjDydppQjeoJgQx+1/nKN+sTNZuVMySwm0+A6xv/xkendivhi+cbuY
	JKfQQlfum92RDZL4BtlYVRECV/eG9A/QVqDQCnMJsW84vqgLd6/R5URtD7HCQsWA35Bgsyq20mB
	Q03DLhO9XxdW5D0HpAE2Ns7lrNXY1q5azDCtHdDBZ0hAEJGxc03oXT5yfMjQ3q1fZWl6v4M4QM5
	QjuqsczgsuFOVqIXUzBNwEFvb/LSrFmT0wE2SzwbO3b21T5mte/6kZDhj1Bc6U9ppq6bSUv1Z4A
	5Hk0+LGUbqqSoXE0vfBXMWF5ntDaWl8Nx/LZrl2ywglm7h8f98kmreael0dRrUTvXcMSRbEMkJj
	7mLx7EJJcFdhjfhPZd7u9+NmKXZuZOBUxFOukIwhKpUqiDT84v7tYZufmtSrNQx8NvBsnSj/iBd
	G1ZHD9sC3HxUqgI+aDnlm/kKjmi0dTWZQYTsWDgKJRLlPs50iQfG944Dz2RkurVSzoDR92Sy/Vg
	GLHVom7ROky9nTVqLYjW6QO/BHtkmQOWfHcqVSyHsqyiSWiNvLcutq2OJT+UDN2VzkEFlQjOqxn
	6ZhvZ71I0188Sf5TKAY7+VMSojRUmbyMtvZ3WqUALiD5M8+tPkADTGB5mluv1A==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr89706675e9.27.1791637237809;
        Sat, 10 Oct 2026 06:00:37 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:36 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 08/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Sat, 10 Oct 2026 13:59:46 +0100
Message-ID: <20261010130024.177503-9-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the register-clock consumer and GPIO banks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0

