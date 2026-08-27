Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04603384CED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805870; cv=none; b=Kh30uI5BISmbb/FUXigNaGJ19gfD4n1qMFDC5eLOPJxcPFIsfFI/m+p7lVXenpAkLexNxuw4kVOUKgLogeug7DIRwN/cf9cXF8KA9gc8tVqu71SyMDuh2vgZ85JQ6QQncVxkHI8asIVqc4R45VIJdhow7obl44b9kGyoWM8pKQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805870; c=relaxed/simple;
	bh=HugAla5NxeGvUAW6ybPWIq/99Qvbl3GRpGgOPmECK8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGPlr5W9/qy5cfaOu4U8Zo6CT8oj9zuSuRfTTsdsrcuoM0hpWHym0Z5Ich2zF2jQI3PidVO8/TcP0NkNh/qjyYLl51/IgvpqqFrixX1+wDbEdhE0FbeCu2c6Iwq6ix/mLrvQ8jjx4AH66YOxmDzeJZqk5lbNzWfI4Q3FAHgJPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=W99GE4/m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="W99GE4/m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so4863675ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1787805868; x=1788410668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=W99GE4/mLJikhKF5uyKeqFtdvTHTL9Vq3Y4ouZKbeOrkbtsuxnHtr3mGhTN76mTm7D
         4X6IEHJgjRdePHsKajt34buH4PGV2csDofbFLVrLv2+MTkD5jScs/OfpRazCLNm3UXWg
         hfYebmn/DghZnt+3S0o1On9igC7PrwRR5Bqho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805868; x=1788410668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=CanJ58ItxS8K4kpmPd/eqrgYXe/t3iMTxTfEdFXLHLzx2UgYLspwGfr/KzmAHd+tVz
         vGNHY35BXQLXaWci0xDKMx0hoac62YTO/rJDiDKAVY80HndwXrRTqPrZW9ewt4w0ZuvL
         wvGERxgQjCarr40P6d01XaImQkdT8y0Wk1Goxc0AD5WvJdpnwT2WKAeKfUjZCiOMMaSc
         h923Tv38m2Woqsirqv4LzQE50cXDNXr9PKHewIH1vdFHm9F3VcbkMsAiKvVrPA9kzBNW
         iKN85LqVzOat23wDDWyV6S+xRcZdOAImxYX//3rXsAYvir5AeJTQN8tyvDN84kLZHWcS
         8jeQ==
X-Forwarded-Encrypted: i=1; AHgh+RohjxA6yc1ldwDn9qDeIKEox2mgwcgLA9r4GzH1YJ3R0Kfg6irkex4muYsSVC4Q/F0o63vVZa4OEAA2uUw=@vger.kernel.org
X-Gm-Message-State: AFuF++k8p22YHRAVZgw1V4b5HhkuHwSlijdY+UFZzlxMzoNT0W1HPgdf
	kWx5mFVpYZoSvKj/HVUFDqJYNCRo9Vx9hYcTyVAkAPYa9hrFAmlFCSNBm3jcjsbtMujMEtC+ZeS
	bQcW5
X-Gm-Gg: AR+sD129Dl9IoPZVhWl4eoORfxa4lH73IF8M9SejW2EU2i8Cf5n2KHc4YeZ5YHkc4A+
	HQHOaae/bW9tXj2CFTjE/6VXZ89+QDRrgni9ChPXCO0FiRoyuG6zTqsyCB4zYVrlFUC4q9GIZwH
	S7nNHrT97974Za/5pjHJOPMlKcFaUZAZulvlP0dTnNYouQbA7jFygJvvABlVGxBFqMaQEbkchhE
	7Owpnrts9O69xEfR1tNKNtSEMk5isfbykfYCiBYij0NeqvBqzlKE5T2f8cOSrOSiDubCoVtUA/Z
	/4kYTYPHZ+zWNEEoGp3wbnlhCoKp+Du3Nm/NUOYYZWef+TL+Y4YDvMxbnUWfupw3j4k2wsdTis5
	5bw7161VpC+jgCpak2S1vcPoAr/qS5z2IUw8MH/4mJfQOQbGl+4WrKLho+wVjSxAfLWHVHPUR6l
	7CR9i3zUTuE9RkGUXEQupenHbsHfHLZg6x0ug0QuWEBNFYalB7HQxQktn/Fs5VAiV2n9t1gkfzO
	TIfqAJj86FbNxGofmaV6MPnXGkS1KWxTlhL5zWBEHhJEM2o588l2q2lFZTAsuK16Nylh9I0qNjT
	TGNHeIKDO+opYbOwNnLBOIvXl9Mn
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr242482965ad.2.1787805867775;
        Wed, 26 Aug 2026 21:44:27 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d63bb23sm14554224eec.7.2026.08.26.21.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:44:27 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v23 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Thu, 27 Aug 2026 10:13:46 +0530
Message-Id: <20260827044349.826534-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

Co-developed-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Signed-off-by: Bhoomika Kadabi <bhoomikak@vayavyalabs.com>
Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/snps,dwc-spacc.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml

diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
new file mode 100644
index 0000000000000..a337f7b473cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Security Protocol Accelerator (SPAcc) Crypto Engine
+
+maintainers:
+  - Ross Bannerman <rbannerm@synopsys.com>
+
+description: |
+  The Synopsys DWC Security Protocol Accelerator (SPAcc) is a
+  semiconductor IP designed to accelerate cryptographic operations,
+  such as encryption, decryption, and hashing.
+
+  In this configuration, the SPAcc IP is instantiated within the Synopsys
+  NSIMOSCI virtual SoC platform, a SystemC simulation environment used for
+  software development and testing. The device is accessed as a memory-mapped
+  peripheral and generates interrupts to the ARC interrupt controller.
+
+properties:
+  compatible:
+    items:
+      - const: snps,nsimosci-hs-spacc
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
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto@40000000 {
+        compatible = "snps,nsimosci-hs-spacc";
+        reg = <0x40000000 0x40000>;
+        interrupts = <28>;
+        clocks = <&clock>;
+    };
--
2.25.1

