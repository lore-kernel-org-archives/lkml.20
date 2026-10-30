Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381168;
	b=0V0Tt/aKplwn/ZWELZG6gXnlWAUaiYXtqxwZylC7f8HFqhhBP+npSoDmLiB1FHBfqW5y
	 E0q/z1TxymkKaBfLM4OqMYju4UrDCszmWDehSdQM12sP+vsThDuf8ZgZLa/oH/ZsG8opK
	 pzCVMy4o+vQZ/SpKzzgP9KDaEmI9QJkAuLsBGuMg282Ci3n4svbps8Ps/1yXVCp+uNfRS
	 LbfK4GDPnwVxXqOPqNTMwnTey1dqRejtudHZf1qXF7XYalX/NuUU8/lcyw5EuAZH0lcJl
	 s+hVyvFvB98Y9hhEbfDpreS6v1Nt4FbkZkZTXRXiRIgQ23Tq6ovWxju8C016HtoPUnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=1W6DcAY8/C7CKzJls2dQGuIFOehj9xJsQUh5kzRvgtly+XZG4TwHWhbwGdUrT7nKNUE5
	 1Z5dZ5dIyzzYPdiCBqasu/7R4wZI4pt9KT6st/ymD+tyhxw1ztJmsdIRbgS4jecspIHqH
	 lFejTXJS6g9JuJIVUTwugB8lBknt7Z7mKXdfVYYjav88ZGuE6PkxqNUcSHSVVYSZVx1aV
	 EoJshYgyOzRBInXL9VBE9N3CtVbL8J0CJOcmHGwOoYUzO5ruVWLDfvsJMXvIogut2jIRa
	 C2khswJrmEw4WC4uV7kGjphkrvgN7DJVYXgeS3q0JBbam+1Mlh3BnEkok2q5vVWl8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=RDrve0kD;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1E606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=RDrve0kD
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1679334eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1793381167; x=1793985967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=RDrve0kDSFOB88oNjlZWHltoE1NtVglhxEUK1bTd05cIdtrx0kOExT68SonxAm1dHd
         /Zywur+Zp1oyY6nNdKGag2Ddui4xQroPQ16FOYSDb+0szg502CCa2vyaC/Je0dgYBZs4
         NYRuCEKftml3xiOArK1TNpYHfWSOJVb8HAlm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381167; x=1793985967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=d3mB/hbYc5cesyxzC+yXqZ2JjrzBZ0Iabe6qqs6KX2DZalBHUuG2juYshWPB1JsIQV
         cpZQGBCYc9fBVBR4gD8Ri/Mv5KHPCdmaJ4hilNF29RoRduc67/MsFg1JRv62kVwpPomR
         wEqH7oHy8lbIij/J2n95CvV/htzpG4o13jC1N1gB/LhiaPb8Ev35q9csWdgtTOcw5Der
         EvHHLVsJZoSzmi36Bv7XA6mSVIeJTrmMLfngBqea/WPLLn38K2VJBikWAnqgk3NlUbjj
         snZbi/SkYjqLXwhDEXCnXJg9dokOrI9N2V1DimDt4FgwO9x+9Q5FAVkpwGpDUf9z/WQ7
         QjdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaW50dDDnuJ269Kw0zz1RkoTQbAEuiU3JyV/Y/udyTY1yi3kSGIJG9/gxb1qOtur0VhSV8fyS08YETTws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJra1HEcEwiLkjDzvtxtBdWUbEM/4QbJtI/qYMeAEXia39xDwyD
	e08WzgRQGHDJbYkjbSA4Sz5YSQEevC+BolhbZ19X0sezf6W/qo/4KchoXj69/kEQEgA=
X-Gm-Gg: AYBFou3xEusrPC9BsqHnfyt4G/RtG7697/bHmi8CqFWcM/u8zHbyrcu6Xw1KsiJ4j79
	ddRw4fTXfaXmLku7rnwkRkYqamzGh8K+IhmgRY40wbIpD0rs5/Ucx47rk+kxNrLHuth6bHVWTOC
	6O8/KobwPk9itFnxD/LKfQPqFTk7jXoOeEdnLgFEUgEvGQ+PT8Gw1Io/lXdH4LLPoktLfMQPvDr
	WxMmpYQOZraYWdZb3vh3b9fNH7PQPE7DS3LGVANL1eyoUQRR+PB3pwVXztEI+l/gr/ABDtivdzN
	gnaD/+6XkiY7p21PmUJGmRPNSgmf2w4rIAvYhn8WaOSPg4DiwPa+/9ZYYrmeMqLQu4WpThzbMBB
	ToQ3AaPW0u49E6ltOAq5TCmAGuB+de0I7eMKxW8JUCHuWi28jlXRTeKDm6/cEi9/7UB4W8M6yEB
	KUK/pcycc4Rjsa6HMaZOS9pn9nTYN7xTNvD25y+DZGkh++qVQiskIJNzutylqmVa7NGRg6FNq1G
	Ba+gufvglaDkk+4tBpiQOJF3AYkMfjZRKHx+a+kHChVP7pHZ/ALSC3GD8JKlyjcHKWi5mYwWtDg
	8JejYeZ6mixdT8t09pIe5c+yuRuTaHviLdbtVN7P2nbG4WmBslJa3Wv0shq8fAXFwfXbZOMT+Zr
	WpFKg582prsQpL2pB1TSh/RIurE5OJ4pZ4rSJhmoLQjouSf3PIz7sDdTqkN/9UBbmzB+Z
X-Received: by 2002:a05:7300:3aaa:b0:369:21a:dce0 with SMTP id 5a478bee46e88-36a42345883mr4194608eec.6.1793381167415;
        Fri, 30 Oct 2026 10:26:07 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm7641152eec.10.2026.10.30.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:26:06 -0700 (PDT)
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
Subject: [PATCH v27 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Fri, 30 Oct 2026 22:54:53 +0530
Message-Id: <20261030172456.274744-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
References: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
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

