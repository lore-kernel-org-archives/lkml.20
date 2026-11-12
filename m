Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505912;
	b=vQ6vZbUfNkWU6FNVRJb/Ip27y/6KLJKqZvULoKbKklMO8f+KpJahbEIevI2Z/mg9IoTg
	 1/GcQf01OoO+cK9tbbnHGJnNt1C+gUlZmMqYfKQo7UqiSLAiKcY37+TixLy5gmgKE+KCJ
	 oN7sn1250hlXA3J/DOWYpnBvygT+Jij2Oq7QKYyc90tEnR5G1gEqytvMHMWNRA6qWNCX1
	 yCU9RZ4DcL/DJZSf7o4VEnMq1SOvxWtLEOn9DwTSufB9RdezeFPir71OzFVUJGAlPWXNx
	 U4o/9W86Fle4WMNXyojcb00pR9TVNb4QojOSY3ym0s1tmeCSEv7v3Sz2yOdoTHyTsDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
	b=uCQuCdXtDVSchqaNTwKHGSgsM+fj2LinYOVZMlEylg1rYl0uCFjvQGzRGLlfZ+PY/4Qt
	 EB33hccZ9/C8ID/fGk+5arNqwOxKKJ+ZU7RTD7SRUDCxMijP4V1bEbFAEiBxiENgHpcgu
	 iiLldcGWrTNN1EIHKNAMj+GOSgvLeKZoJTQbxi50N/TA4D9c/CEZepViHfOQK+xWuS1aB
	 Q+oSIY/KIzVBhueLNsJ7dC8a5DCOK2SWrLxjwgkduQG2FmkH8OzWKWCp3m4eAoZCCKJtU
	 Hiu5iGWeRJh6rGm9fZaHAKidCMwwlBqHL26/QwQbfd0AZobagNJC9sZ33/JR75a1YpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyYlnzBh;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E12606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E12606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyYlnzBh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33c10faf6easo19556eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505910; x=1795110710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
        b=DyYlnzBh9wkYoBqoOzh21p1Ny3QvU7OWQrwBBQoxsNKfGFDdYYKnfzEo2fJt/KS3AO
         upwtYyF0IXDnaS2Ef90OBIoErsZ5gEdo44zHtRaMHln3w0ieZsHkzhSLCTQGKignBSfH
         GdspPJFZEV4Qqyj6TWTb/d8lYBgV5J3/Ruj54NlmdGd8etChZTlQlfRYHk9eApRbQQ9s
         S575oKHhSbAmdLN6KL0RX0UxVlUNu5fZYLBeUTGPjW8OXdByVmecPiwuEmYWyFYQhAN8
         KLWprkqSTltfUsTkoEljeca5x3dG6NXmczLITb3EkR1RQjX9QRN2HGz7XNC6x1tJ2nd1
         yIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505910; x=1795110710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2dfl244tn//FNEVdYnTrtu5nFcZVy8qcMm6ScJJItQ=;
        b=wED7pCjvoz2xIUaaD6QLPgOvGW9j/S3iNsFaSq1bCd/HlQesW2QkkwPUO9w9VNf04J
         VbuDhqFyPPGG505wePlnnpL8NV83s/LGpWe7pRA4mSbvaXD+7Eof1ocKzYaiPWtC2He+
         ti4RiHnxZVz1AeTCUzuaVDKPLdMp/4cBbm7ebx8qjhVSNIqEGjNAl94N5IK4czVD/ssZ
         fwaql58MeuQednapDUxolJ/pixUzAxuXXDkZM2cfIRSgKd86hYxwyOtHsIlqAJxvG/MU
         1hFnATf6cRmGlYFJD4tIWuwIvDqABgfN/yTA8LKvfhL87YJ68GrXJzbjy/T76asKmh3Z
         66aA==
X-Forwarded-Encrypted: i=1; AL+hErFouOYHg2fP6iJu6xrUi1gbO4XzUMafdygj6OrG5QFm3yVzPq3LAK9DUwmUPgmv0kqhFr5o6kQoz9vBWks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+n6z2R9FFBMd9NSNPk5/eT9L5OYW3EwffwJ5mCkztxY0HEH1f
	xCronT/0APZagebiFTHJ9VgjMO2kq4M24rYOW2ybh0wujyMsfiHwd6EL
X-Gm-Gg: AYBFou0qAw5lhM4sErvzN3yHApUZBJjKjG2irNQFAmv2ZlOVUhhNOdVMAtKhd7y1KNm
	tzEu4oY5dggfJrfp7ecxQXr4b35ZYCSBjowQ1trASXviXuTbnUFK258bplfc4W0erlle4p42ZwF
	h8aD64RCYUmS8nlRx7yTPK+ZpuQYWjt7xExFW8iM7e8mlKPND5p+Pzu39NDuQGzXNF0xhA52/8T
	O6HqQwBh1w6flyNPSLhZ+MQn9WxrOsAIvGt0hZGNs0FCVRJWreGBpkVo5uvaiK/7l9FB+UlJ/dr
	Gn2lxyKdtLjv7EZm/UmvKDrCtbKQrOwSiL85H64yZLD3j8cO50YxlHvw2W4AenMxvP5g93n49zC
	eF6nS7MzKQo8l3QGy8ss8QONV0ri+Yhq8RZP6f7UJpAfmG2OqLQwPW1C5MzRjrGLIq8yIpXaIqE
	7VOQ5WBtj9Zv08D1blYlKVVmXupXMQwTBmgRQTHiM+YF+AoyO/C9fyuKkFnGDJ5N0FgjF6t5SVa
	5YOsGHmymcHmbg4SXqeIOCY5z8/5hG/kDvkprfccys8aKvkWCYAhvs/p6br5GwhNG/yE9G8FxSE
	WrOf8C4EnIZ3TOaLdMVhDrkCQ3rSRKQrgunYLQ==
X-Received: by 2002:a05:7300:fa13:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3767ff8b6abmr9115049eec.0.1794505910440;
        Thu, 12 Nov 2026 09:51:50 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm237865eec.21.2026.11.12.09.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:51:49 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 12 Nov 2026 23:21:22 +0530
Subject: [PATCH v3 2/3] dt-bindings: bus: ti,omap3-l3-smx: Convert to DT
 schema
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-ti-l3-noc-v3-2-7281b1af8030@gmail.com>
References: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
In-Reply-To: <20261112-ti-l3-noc-v3-0-7281b1af8030@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794505884; l=3177;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=VcMCFSKS70ZEJ/l7njJYWZd3HaftGHvosq6YFQyTzvA=;
 b=usK4kCKCiLrAjkLKIElQde61VHfsg4025isQ+OOd12f7m6pXAqAZWbLOfsmCKQkDinGYlCr20
 akwgiP4GRZ/D+tAtoSlRP4eKFAX3e41m4Nf+HIK+CDCdjnn0iPhJZMN
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI OMAP3 L3 interconnect from text to DT schema. In text binding
this was grouped with omap4+ L3 noc interconnect but since it uses
different hardware IP (SMX). Add SMX variant in new schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        |  5 +-
 .../devicetree/bindings/bus/ti,omap3-l3-smx.yaml   | 68 ++++++++++++++++++++++
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
index 161448da959d2..66548395fbdeb 100644
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
@@ -4,10 +4,9 @@ This version is an implementation of the generic NoC IP
 provided by Arteris.
 
 Required properties:
-- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
-               Should be "ti,omap4-l3-noc" for OMAP4 family
+- compatible : Should be "ti,omap4-l3-noc" for OMAP4 family
                Should be "ti,omap5-l3-noc" for OMAP5 family
-	       Should be "ti,dra7-l3-noc" for DRA7 family
+	           Should be "ti,dra7-l3-noc" for DRA7 family
                Should be "ti,am4372-l3-noc" for AM43 family
 - reg:	Contains L3 register address range for each noc domain.
 - ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
diff --git a/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml b/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml
new file mode 100644
index 0000000000000..11f0ebb0cdfc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap3-l3-smx.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap3-l3-smx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP3 L3 (SMX) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect for OMAP3 is based on the SonicsMX (SMX) architecture.
+
+properties:
+  compatible:
+    items:
+      - const: ti,omap3-l3-smx
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+  ti,hwmods:
+    description: hwmod names for each domain.
+    $ref: /schemas/types.yaml#/definitions/string
+    const: l3_main
+    deprecated: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    l3-noc@68000000 {
+        compatible = "ti,omap3-l3-smx", "simple-bus";
+        reg = <0x68000000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+        interrupts = <9>, <10>;
+        ti,hwmods = "l3_main";
+    };

-- 
2.56.0

