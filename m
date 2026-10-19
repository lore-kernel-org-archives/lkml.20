Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427132;
	b=r6RvEOk44fXEQ0LWIupn6//y8wXkCF/VSjg3npZlSujpNoVWhKLGDrc6ClxKULNXl1/n
	 pgEzrrMWXO+XMNzFpr/fE3jv8hjoVRblPJ1eFfhImS5VQp4HIJp8l6u8aMTamnzTwLa/m
	 IFWr1Csup7B2ovoo0gfZcwb+d2Rn0wl6nxcFkb9/uJHDEVT7M4UyPgw45IelzIr1T2pbI
	 2EnD5UlUqfghjWzdH8DZTg5jYtSGm1SaAgwnTI95a7GOT06QZkCC54LV3iCrBbsLksxqf
	 5AQlc47S3jlVSkiIUZVAhGraSaDG+zG2Vjq0Pycoyo+ZlGjTar5xOpP2nyjqRUmTSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=w2dpj+Ywgl+OzEsCUXKH0d1T4Z48ljarMNmeDaaavNwwTKHbsx1qTlEXX0MT5DIAbxgC
	 s2d9lz/FyWfAW08s10F8VONSUBtco66jSMTR9aHhvxxsPMPaXvvwMFu7Y5omac/kP4/zD
	 lNrVIxAjhND5r/mSxV27LxU/YScpgbch4YJ5M0Pdeg0+F6U2LSs9ZmY5oYHo6TVLZ+CLl
	 zppdZAhM5QEwZhUM7vOq6tKnICMNEzZOxLdIWW42RpyIiJGQ0GEMXs0BFhOFKu5o7pyyW
	 p1eKo+Sv77s2CSFWJQ44tojU7lpouFE704QG1xU/m5NpEiTHbo7+BPthCRnmcVcJtwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=dGv9qhFk;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42D606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC42D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=dGv9qhFk
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so2747136eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1792427131; x=1793031931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=dGv9qhFkilxL93XAvfjT6XnAjwozvu2TkGSBtYbO8asDblaqAKYJyZvPZgRNfHusoc
         uXdg/5cpOIn3JtK/S9z5jhqYBvYBkQHf8N36WWqkTu+dcXTwyCkZbNH7kh8ehv+N7hxk
         YkHq8uxVL426exJfkSGhWZJJPFNwuCc0n0HVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427131; x=1793031931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=AktgJSYR9lHwH19QK2uEVj7pC1MTAS7j7VUboBZ3fJ7aWevnCpWbI+SQPPsyj1llCG
         X5WA177N7VSBaBrgeVgfhJ0hK0AXxLYRDYRZYO431SlL9zXAlw3+0krq3KaBBUh7Fmpe
         F0UGKjxIBWnvSy9+zUA+9mtK4rawwC59dZAQsrDwWP89X3eTmyNp+2QpCMbw5LeDUtn4
         2YKV71jBuFX8/BV+4Sq6vaZqKdzQFiXDSquRMof8b4gM+lOe4i3ODLs48ePHDfvE9tpP
         6atIYF5tDgWnOSx/oF6rbtutqCkUCHa8Em40dreobVj78uGLcbMgSOe4dpcKKFubYQ0n
         7GeA==
X-Forwarded-Encrypted: i=1; AKwUvBz3Ak3skG3KAIIjkqcGOVnB4lNI4sUdu5KTvj2lBaSMYM/D8ZA1zpYrBpUtqqWDdN00Z10E+vid46+ZogU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNz8WCsXok5/ovk3kg0jAf/eQv/1Lefn5h0AIrfP42e4Row+9w
	pSror89cY3EmEhY51AGHSFxOTvkGZ0+iplPR82dIKdSrbO4dgJK0opoZJlw6xZWcO8k=
X-Gm-Gg: AYBFou1ygtlvYYCfdxkn6KLlFiO9ARFDcFdKJ/9Ily0qP9f50ph/unkiBd9sRym3k8X
	+ZpbhM1yWFPUO4GWBUlSDZgiL8I+CmF6KCe3SsLz+Bo+JtWDMEn3yir3LHcUdkWxL6acMzEcl4e
	m/tzVJram8mh1ml05XBEX64tTQS6Mc3CZ3u0JF+A5OkNZrC2wYmVLOebPcGdyho/iiMK6awwu3C
	GEqVvxEMPBCVDAs9sx7lsMMUbuU0WmMcjTdj/sFU5oDN7Ndy7RkLeQiUSEf406h+plx0fj6p4oF
	8rLoJ1xHkhJXYqO0JpXtmoM8Y4YQritL9eDcRBVWl+RlZBszA/xvHLlKJ3Jiq9Bt5XcITpMRw4v
	XSPEn4KqYOqwc3xta6qrhgvveZaVb1E6rr7dYJkS1uax7OrPRLAJeww7ni3ymMfmH/agbyAHck6
	lnr5zpWJgbWLOYBvCAUSREYQdAM/jbV/uaWrXMb2v6pvrbGH/py5SFTFc0aTUSElr7Kr6LlyQZS
	iGe1JhEBQDfbwi+naxWcnCuzSwZZU0w8bG3zocKHoNx9pM7KOR52HatiwY/I1GwRx5T/yl6LMiI
	54N/4Jv4w0n55BgibKSKBsLT92DVHOcrA4gIpw==
X-Received: by 2002:a05:693c:20d2:10b0:35e:1807:cedf with SMTP id 5a478bee46e88-3619ed0fbc7mr12378533eec.1.1792427130572;
        Mon, 19 Oct 2026 09:25:30 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm32218885eec.11.2026.10.19.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:25:30 -0700 (PDT)
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
Subject: [PATCH v26 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Mon, 19 Oct 2026 21:54:54 +0530
Message-Id: <20261019162457.1000115-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
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

