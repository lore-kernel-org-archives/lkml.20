Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662813;
	b=fdHRm9Qo4CN/Pu2uqcfe7DKDnfIDBDX55J1tvTm/RKLFnbXQCtrwb8XONXLb9GPe/dG1
	 Xgw/1BYJXCqd85yDjHrdTTd1VEy3soDWfZXdirSwqz5x8fN4zBTo/0vAlYyQTpgsNH6nr
	 0pHY/cy2X1wTqK7D0JIKs/yds5lu8K/NRuz5SWf9qucrBaHYoUMkibbWM8aNiGo0vQ0NP
	 Y1wusb8QbpKk/c6YiYGGwyWVblMj4T9t1K3h2kNzrNWPY7CyxVirNaqvwfTmoKWxpeETc
	 u12gI+DJ00kOR9fv488sDPMSmJNpuDpOmdLWvJfAzvJxuUZK+BJZsxJZrfPpsXlDImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=usUBZn/Ipqj7HBzGGjehtnPeunnLMRu0nEynViJBuH4GmDrAH1Db6ey3+DGgdJIRG1Nb
	 cNdzsmiZKdtWXVYtFn6cvxvJxiCjYOyZV+9biSk+aXBsopdQotBZkiROR3l6Bpc3/P3bT
	 m2ZMWdyj15g2gfQbQ5YiPeO0qHmLIs7keiLVevK1b2MfipSMEIXAT8YGg1eTHcP9svToM
	 vGNiQeArgSi9W2RQxlWtzTYXU/24Lz1XXXK9/AbxroOqS2BYUFspzIuhPhDRR4Zy+QkJO
	 rTFkX2LbDBAJlnHg8YE8bGr/+pKLJFdl3a29tO+bPPF5mzELZyMRQNhJA50E2O84SIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=HBgH1sjv;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359E606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3359E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=HBgH1sjv
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so2604423c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794662812; x=1795267612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=HBgH1sjvlslaIb6CvKtHf4HH6uELxQ8+z9yzXhw44KDCXs8z/Pm3CdGt2tXKYKRBde
         4OE79M6iyaW0kjR8tuOp+GtEIPyeX+hUI4GUmlW4vEBKhDHTPB9ERIe5R3E24huRNs6D
         WKgqwMvjRsxgQ1pIdu4H5h/KQ6gxalQCq1B1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662812; x=1795267612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=sD9y1o0dZBKbgFtz8XLyLXSdnTTYu2mXz3z1f65XF3wH1qahQ9tWQNvs3HdA91zut+
         ybe/6FLHcpX/JZ9zT3jytbP9uvwZCZyc2/Xk8aojv7yvNRN5XybturDuezN2c1wlftHy
         l9tfC8NVYiCcBqqFbXDsIcj0KMPpukc4ENiWlByvTfxZrgD9bDp5MTUxzZpgskBhiVcM
         GVdwdmMtZFn8Z9BLs3knMpfSyu04u9ul5pGkRtGvjdfkGD1HujcVO5Js2se6wGWPMWo7
         EB32z46J3X6ZEAyMMz3OdxSTPlW35S5kWCSgoQcXQiJtYKaDjWeQzvOufE3MGnE1bHAZ
         LFxQ==
X-Forwarded-Encrypted: i=1; AL+hErEVOcAfRqpNeJTtRZJZE3BLosV8oWWVrXvWmREhb078MF1eX6GC5sTN32tfMX6Wk+g4YSFWVCRI0scN35o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UMh6GaWJdqycm4DVEYTvhT3ozsiLPm7amLKVEMVnPPYW8ysj4
	eSc75JLVXlq3+EG9G59MbxBUGIVHOowqKNIOtgecPWGbovml0hPh90//Q7y/RYABxfM=
X-Gm-Gg: AYBFou3chHnupyUVSYtjivrWPWePWUuY2xAkWM2Au5OVEQgF4+no3a/8KcxACjvuaYH
	5+pEWU22cmv2JMUhViFFS3iWnyqAb7rvnBkXaUXb2qRYmTvVCYqWPIPubR0YzGCMmPjpZdW1YSw
	CWPJk456y+k8/du4Z72x0V0wODy87DXpkSV1R/wpya9pXUFKoyq3GrMCx869OROknHrkxT3iol8
	E9Yv5JsMulQf+DxpC49GhCLroOsRFuuzb/6vgx0VF17G8/b6TxQ4e4/jxJ0acA752gbKOCDjLg5
	g4Mwm3L6usRKLAlablBE7sGVKqjkgM4c5FVPUzT9H6s4//BS9i2q68GuvdHGtO0CHwZHt5mPhqL
	ZCsiW14EeUXYYFzjyXIs3ittyPgIA1b6RccN9x/XbAg7Gt5pWJ/1vopizYt7lfghQOzwfa3Th8Z
	hzSW/wyC0XfEpwZKQetuy0tryxihHD55NMkVBv5WFG1YIZFx8FhvV8OVs3ncsS1dXWAjbAcnwut
	v8S5XWaTK3hMTIV0j2eFVlgJqDRH/nlrZgcso3YoNoTvqKxBMYTTA4iwZ8pK4eqa95Uxsb701vj
	YDChBC04XLza5+hxVtBinJJkArw8y2Na1eT7btF1GIhlcIJxzTnL7ZURPOb67OzAOMLhYpNNmnw
	SFTD9dkmWVfDEeiep5daCbgMDLs0ozkz5XHnJRN+b9ZevVRobQDkuxREkTldqbUJ/ztl/5wbTXT
	AnYpbMuCnKH0vIDg==
X-Received: by 2002:a05:701b:2096:20b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5031007c1mr5430086c88.40.1794662812150;
        Sat, 14 Nov 2026 05:26:52 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15712003c88.12.2026.11.14.05.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:26:51 -0800 (PST)
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
Subject: [PATCH v28 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Sat, 14 Nov 2026 18:56:19 +0530
Message-Id: <20261114132622.690129-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
References: <20261114132622.690129-1-pavitrakumarm@vayavyalabs.com>
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

