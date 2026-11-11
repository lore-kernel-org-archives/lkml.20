Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395309;
	b=l5vAVOB3IY/IiXGxCu8QfhMr3sdCT8y2NFwpH0a6ugkqAvvLZxZaXqMa/xevK5gEXXw0
	 k4HYxdPhpnVBHOlNFMmFqQpDQHiNR+ruQK5g/418Wt2wHQcTnIJMR4gFwJPiAnNrJsP85
	 24cr/OnMW5G//nFRaBMHb75+0IJG5pmGmC5SFpRGXtNqaPMsCxipTci3bb6bby/gt+7VW
	 b5+SviRl3LC8GgcU1K7o/H1NguMp54Wsa8lIms/bfaz285t5uvavcARRzcmk3uTbTO6K5
	 tMvIK94tYYlYwbmsksQ9sQ7YcMaqXfs5eiTpcpQ1FL7Xse9tn++TC7gTJIWcQwwRI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
	b=3sn2G9JWrYDxxNRmbixW1ENoQpaY8Xfnql2ZQH1CcxY1kApeTiaxrdUKJlLeWPrU0Buk
	 RcWcy7fZpRh5r/B60caR6NHOrtHDGf9+boMPPnD3E39wVk4e1ilM1vJjD8exD1aKsII+D
	 QB2NRsroDC42PM5cg9AwIQW/Q8XMr0m9hIbUHzxUrBTUBW+K75/rk1XNFOXSniYVYaPo/
	 8eH63Ax+0FCvP/4DXIkSZUi46FS+XXYAS2Z2OUByMQ3vBm11dR0MJSPGtN4F3PWBww01o
	 r7ZQ9uFxb9mDXuVa6+xGAPcQpbIiSi02GIRC5bDxPa/SX60BaoXK7cScoBTTCVQdZSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EpeXEmP0;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F960A382B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9F960A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EpeXEmP0
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso22107255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395307; x=1795000107; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=EpeXEmP08j8JChiCWtRYUhcOpi8IdhmZmPs73BLe56ZxkjkEB83UseUavbpqJR9eLD
         0kXIW5q3JDOjEhGz7oOlJahhOx2aOfYqoMXpdtdjn4hauI0kd61D0c6KLgnB9USwlbt1
         m+DwnOib5UkiRbnOyVb446NeGUd2sYRiRE7KeQfwS4xmLTJ9GB/GprAUk9jG12yw5MEh
         9yfRgOPb/EDF9bI5j2du3/vpkQMYg3WfX50/5XtY3I+KV3bi0vOvclmevzAwG9VPy38l
         hqw8JvrE4nWyTBq/KP06IMADNRz5jX/9eSuc1tpoZoTD1AmzTQgmpq/3LAbZF+mdhn/f
         pLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395307; x=1795000107;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VViZS2bb3pZ4FEd6v4FhPEGdFU0OwPB+qGWSqpoqEsA=;
        b=Jz889PUjCGm6b/D8FZ66btZRtnx/wPLRwAgdt/rtblVl0gsaBlecZK7Wj1QnQpqaCk
         VsUUlpEawJuqqUNx6aILU9WUZ9N3j/EeP039ZQkc4h3UVn4pGoVY5wIO4C0wX8ARqiHT
         caLM2+yrEpHzgaSUOW+0Ke1kpc1olpM/q8DSmOGNZaVnfdLhRdhIBvTr+tLgItYDBBrf
         QoTRHtaWXvSJf6cktyHZoGDNUOe6djo82kSwg3X5VlFgQCH4eCO9pLpVlYUV6Ma/bDoh
         chJYZyjNx8ViKgH0cB9QjERFeMsH4GexgIeWTFTcuzl4hiE2ApgL84D0cB7CpxeIE88p
         plMQ==
X-Forwarded-Encrypted: i=1; AL+hErGaJdZ0gca9JREzJvJD6L7avNV7DasSGGw9B6gyFyxgietPqOJn1YeqI4TbzWTiGFxWOoa6ImUDkccY/FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wu43rfIqWuJS+P/d+tI9S2x204i/I9hajXRs/SCDk3oMxNKcL
	PfUWdCcfsWKZdAJozzFIpB372qIdDY2KXTr8PYn5dBHjF5MpsJTvMQeGRIJCMOEQk1T2Ph95QkS
	38lRRJ6XSWIkwQkpOJU84pQ==
X-Received: from wmgb22.prod.google.com ([2002:a05:600c:1516:b0:4b8:b187:f0cd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b83:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4ba0935dbfcmr39556605e9.10.1794395307014;
 Wed, 11 Nov 2026 03:08:27 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:34 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-5-vdonnefort@google.com>
Subject: [PATCH v3 4/8] dt-bindings: reserved-memory: Add lendable-dma-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add bindings for the "lendable-dma-pool" reserved-memory CMA pool, used
to dynamically unmap pages from the kernel direct map before lending
them to a secure world.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../reserved-memory/lendable-dma-pool.yaml    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
new file mode 100644
index 000000000000..0b924d941b4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/lendable-dma-pool.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory Lendable DMA Pool
+
+maintainers:
+  - Vincent Donnefort <vdonnefort@google.com>
+
+description: |
+  This indicates a region of memory meant to be used as a pool of DMA buffers
+  that can be dynamically unmapped from the kernel direct map (e.g. before
+  lending to a secure world such as via Arm FF-A).
+
+  On architectures where the direct map cannot be arbitrarily modified at
+  runtime (such as arm64 without BBML3 or without rodata=full), the operating
+  system ensures this pool is mapped using last-level (PTE) page table entries.
+
+  The reusable property must be set, and no-map must not be set.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: lendable-dma-pool
+
+  linux,cma-default:
+    type: boolean
+    description: >
+      If this property is present, then Linux will use the region for
+      the default pool of the contiguous memory allocator.
+
+  no-map: false
+
+required:
+  - compatible
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        linux,cma {
+            compatible = "lendable-dma-pool";
+            reusable;
+            size = <0x4000000>;
+            alignment = <0x200000>;
+            linux,cma-default;
+        };
+    };
-- 
2.56.0.542.g3ef89b7020-goog

