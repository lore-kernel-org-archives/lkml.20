Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408273;
	b=Y2NszCW41DngeGDJTAYbJtuFyW+B0YVbKOsqnWWwMj0WWokOuJoY/GkVndDuoQBIJ8jr
	 +ePR3y+LDA0I8K8w49orer3+cVnFoFgI4bHBQae0xFM/MiiFi/DC4mXFhaw1s3sL5zYFX
	 /745hc8dWHjYf8eMS60sX9czjvst/J/l9/XL7poMG5wyTQgPnZYZr9CEk9fvDI9zro2pu
	 E4lpmDBrGj8+tl0ESjvxaf1+KUo6n+i7CwzqsBEGqEJzkvS0mICbEb7eRJUC17lWqOSTK
	 5+iCJfmWg96gHMAneXKE1vuPh27gbjvDN1rCWGlTm+VHsxEG68VOOGweKAScEvmJO8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
	b=qusxBxCnvGRajmww3QV5W8XRmWizQlblKapVP1Xp/ByTgeLMiIu4iKhOvx0cbk5GW9eK
	 bVNQ3gHn90D5AR6Rd5l7bCTWfEZnPUIIydHVRC/pfoHzAWtAXnt8LJuSEAaGCx73hWts4
	 oRoBBUAs5OO73i2iLrKbiCBSyjIComMDXCyxAFpZ+DgeeX7DC0Umd1FeW3/6CaKt6hGBy
	 4jQk9376V6x8TTVScMhLAC+42ipYANZZyp3FCpfsDxL2d4klqE6cXwaSmIIgq2m3C4O7r
	 5Ha4hIbasqUHot+uWv3BMXX0YTCbKcJaPgbvwEazZjUWdBmFq9nr3NAhbB+cIsPCGxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D3606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44D3606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1yyVtKW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so34227155e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408271; x=1795013071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=B1yyVtKWJ5NV0CiF7ka9DSnfzre11MMuYuCtwZYQBcDWhpEP6f6UJ5spZq4Uy7MbM/
         oNtKHy0AyOdn9Ls8Oiu0sAIPTNYdKg5PRn5ldTW8M7Pn2bVwSvJ7uZgA5CeMerwaG08B
         gIJPqaXCCHRQ4Ld4niiB3+hypf2g6fzwMo4zbaJ2i/BGvbq/kxG98hQKQFoHv/+jwyxK
         kVslqCzOunlj5KMoI/v2QP4pkzWnGAmdgCO1yCtkITGNyNXn+gd/m+kfI3ddpBTid+JH
         JJ6+tI7PG3+CbNT+tqrv0Bk0m018299UuszXB99OJhoaTCSk6FHRS9Kd1F7jycJEafcA
         nJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408271; x=1795013071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxiG0vYjBvAPwvPa+T1dR5DMoDYMoXM5SR2pagqHWyA=;
        b=FNC1CK633pzNYWmGE32ECeyFxjQKyHNa5VgIm2FECNNUNTc2m5u/GPx2I2JhV7/6XM
         FkQlPVocYIGwAzurhJSa16wtOpvEF+Ok5zUrhG++VfN4/gtxAzB6pmgbiF628VPTwxPR
         VdPV4De5xBRd9W6ehWB4jQO157CleOvq8nVQOElB3vIJo/5HmAvF+F0ACLgUj7QIRGR8
         7d/VYtg96BUyyzD3HPQe/Evz4b7773N3VMw1JzMvq1Mk/aLyylcsbgWBaeIHj6YcoZ+b
         sQCT6cAKIT1TS6NesoJ93QobCj8xEA4nsCjESDJvH9Z2G7DkNXUUDTNxq968IXdYBSM9
         lwTg==
X-Forwarded-Encrypted: i=1; AL+hErGZAuhzIDNadiAdziqK34J7e1t4fGzI0UThDXN6hiQGeHCRkIWrl2JQIwwD0ErLtlVCS1056hchUeonuEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JEvISbr3rvFnZbMxSPUKWMOEXWo50cyr7KjGWxPfi4V2NkkY6
	A7Crbw+GyMrytiZ/cS3bBV/5r6WUcbzgFko2/6YoCBIS8JgEB+hMF1XA
X-Gm-Gg: AYBFou2D3JEvrqooUZNSamttOwYsLYuhlCg5Lxr4T2WPizHD6D23CuuAwUkYHTzN/4L
	Ssf1Fh5H07HNM/RHphf31/tVJj3WLoI8mxTj65afb+6ohMlyNdXCs2ehNwD3vAo9AYDhGbpIfGt
	hdbTBeSB1syvqkSZMM4TcfHFEC2N0h5JFSFSKV3WoktrgbO7Fd8jsYqF8Ved7q2tdWumkT7P4Ug
	FTiELbX/NKX7mck+DE7kA9XDaDoX5qAqhmXwMFpkNxNbGbeV8TDlo0VH7F2cGU7w1bV5bg0Gx/A
	KVkshIGDUPR+CyYienxnmMaweiD1NbNDfDh/d9ZlKHiqLssbRtaDzO7toq8PDwpxBDkTjECVpC0
	ZHUOkTUYxIJ6SNqD5q6ydBqbvUoPp7qBvxrrBhqWh9edlTc2xkBlrF+ZaIyTiQGlZ6plCZlbMgq
	/1HcklOmRHKove5SK+H8dGx7pc3zfmhGmB+KvPM2lLI+H2sZi8O7Fdiu9a/pzZBJWenCbzjRixE
	QVvp++T0FGbhYpzVAXGcsMbBtjvTc7h/ULaLNf744S67atz6jKZGAwnOcOioNoVP7D7Bq8BVJKv
	AYNGRW/SlIjQ6Z+7Ugub5EhUdcg9Vh94R+owC+lU4fX0m8RplxuTHFe3
X-Received: by 2002:a05:600c:4e0e:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba093ac8f6mr46752285e9.32.1794408271122;
        Wed, 11 Nov 2026 06:44:31 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:30 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 1/5] dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:22 +0100
Message-Id: <20261111144426.1321237-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

Besides the traffic manager's interrupt the switch has a second DMA
engine with its own interrupt line, the ring pair the vendor firmware
uses to exchange frames of offloaded flows with the WLAN drivers.
Describe it as an optional second interrupt, named "wlan".

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 .../bindings/net/zte,zx279128s-gmac.yaml      | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
index fcbdbafa766d..b9a419e5d44a 100644
--- a/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
@@ -23,9 +23,19 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
-    description: The traffic manager's interrupt, which signals frames
-      received for the CPU.
+    minItems: 1
+    items:
+      - description: The traffic manager's interrupt, which signals frames
+          received for the CPU.
+      - description: The WLAN DMA ring's interrupt, through which the
+          switch exchanges frames of offloaded flows with the WLAN
+          interfaces.
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: tm
+      - const: wlan
 
   ethernet-ports:
     type: object
@@ -98,7 +108,9 @@ examples:
     ethernet@92000000 {
         compatible = "zte,zx279128s-gmac";
         reg = <0x92000000 0x400000>;
-        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "tm", "wlan";
 
         ethernet-ports {
             #address-cells = <1>;
-- 
2.30.2

