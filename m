Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666187;
	b=4Ek/mfdW40gP/tUdk/cYsMsoRwtUeChX+SOrPTG5pD6UvU++3dROyy6XYrc9gdAg07Nd
	 RkifdjamuAwJHSdP2F+WSsj11u6Xs6yd3scViWsb+BBW2Js41WgTgVJxKP/qGO2UjQNt7
	 3IgjWB67aytAmSKXMlkLuPCMD1KmD4vBZBBVSHvN4JLsbDFhdwPG/k61iVLQ/qanfg4C5
	 KCcYUMGsywDuFzCrCFvidwvpnCdUEK7Ig0jLcS8rynVT684rrAWHa4r4NgM7iGBQetRGf
	 G7ypUEdN8yaAaZqu3VgHBNCzkheJi4RCTVFK1FZy+ey9JAaHjbh4BpMWfAGHN4XU5pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
	b=0suy5hWEdoKL2+mZkI5qOizPWFHla2smV88pmn16NBJszCAeTd2pIcwj2Lf1iIn4sZuX
	 ouy8npgCcgL/X+vAOJ9iUiO4ghoX98J9zCvvXRt5Dcfokv3Lg4xM9dU2XosQImb9+aI1i
	 XNSYLzNuOeEkOxWKpYnzskIlTMlOw0Y2N9uTp1BEJsgntsupAZDDPq3wcL6+60NdpuEJt
	 eBg5sYR83cs8i71BeNpgdiRRTOJNw0T+X2Rd28gDdrpja92vxL5N8ZEniNK5THFLVS/76
	 EDN9xbeW6rEbZCiP3UoTmmYi5XMdMK7rbwHy4T5Ly+lKCiIHsSleMdv/673JFQdFvyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=h6CH2d5c;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB4F606A8A6
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB4F606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=h6CH2d5c
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso1788982c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794666187; x=1795270987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=h6CH2d5cZulXWdcrO/5m7J1I2pa8dAU4NSQNCd1KiHK40tsF63ZW/S5CXt9oCBP67Q
         /teSmYtZEopIvfYIztsk026KkPB5YaG4LitPfHwZHkTrhL5sdOzmBSwPD+i+d0JmTN3e
         wUNcK1kQMuCFQ6dY9SXOEVJ8D7QMZJ9jPane0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666187; x=1795270987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNttZqyddGtfpM6shjyHncnhqR2TNAPYpAsPVppmIzU=;
        b=2TfpSvpvDCBKJZmMCmgLUyc2dfCQInvcIZc16tgzBEZ34fXQaVowxUQ8TnTG/Uk4p4
         R0Yoin0+ALfnSIqRQPbmGeamlB/lHJwgM8VjzLZ7FjWBXHHlw8IEZUBdBioZKh5G1zAM
         AK/PTfwAA48b8TYLE5hZ6unBBQIBNf51lK3bX/ObrTerLob13PZnmebHpP9ieZFsMan4
         uWixGNItSBWgg924vFp8Cc92NtYVvHkRBO3agGRqtNt455XKMeni/LC21IOi5wGDhHA1
         PEw4cjJMDejwypj+4Jvm6PJEvuPP+e/oNmAz4kqRf34DJG5nJFbovPEf2E0SD7+TGMIr
         D7mA==
X-Forwarded-Encrypted: i=1; AL+hErHjmKtSmaY9jU08S9b6Wl8PmFk/QLTWggPjsbyQm3iiPvOM6qNH8Gjw3VOMOki6dYFSJh7wIV9jROQPS20=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vwQ11t131E4bI0cu/1oZr9PGNEZE3KXLGqZqHBPps0Rt787FV
	afWvN7RK3qRVgNseWLsvTiG1SDpGtgmODNGo7aPSQKQpMDqvcv4QuatSMXyWFHPhfGQ=
X-Gm-Gg: AYBFou1oiMMoJGZvwrxTbaHSe0GdnT0NmXb/0Px0lNLM2588oICyFwTC1UP+YJDs/CF
	o9x5MN91W6kMoIenquZJ+5qg7pU8uFgi4fp0gdjMFaX9mssefGGxWQ42b1NETCy//weQoYlRpa8
	2Xz72P+qcwclzEiGYiC3ayp5vYp/jrPw/qgzqYoDvrIkIEvHgk5rilvc5ZE3tmvZ+irJFUiMjwI
	MiRT8SJtUkUaURDnW4tXKMFn6IUjuN31ThlKcdNQ5Dpy8PJtLDFyInxNiTQmozo5XwoAavOw4j/
	e2WpYumWB7XEXopcqw2d/hU20lYoPstOMllXHfSXpNzl85UnSoKwSyp5xt86ozw55SZXQevK7ek
	B83u5J4Ywenut+vYNaR2poG6mK99lpP4ooKjEN/zoVfj2g0FaibMWY/59EywQCOa9lyYMH0NFg2
	i32V47bkOiu5dKzU2ICIu8XI3jCwcYhZNyIt26WktOVeybnNwaCzWQCD0HjYomT2M+WR0/ofGj3
	K/04xyGM9njideVcgWx/D/aHxxJ7IrDkgHuxRYI7LlONOaFKdH1RFWQhQov4xtXIOImfpuKdzmm
	hn3k5QOf41tBgsA2aFvx37skkTxzAdoa0MXNijv/AXeRXNuu1907/D/c4F94k2q8XQM4R1/ehj3
	brrfs1R/11MD3qSFEjMLjjRFmRzpTIAsV4kkEOCkazOHvqlfhqrnD6lf2UwGUopbKZA8/
X-Received: by 2002:a05:7022:298:b0:199:7dff:f9cc with SMTP id a92af1059eb24-1b5031b0afcmr4540930c88.42.1794666186364;
        Sat, 14 Nov 2026 06:23:06 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm19376962c88.8.2026.11.14.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:23:05 -0800 (PST)
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
Subject: [PATCH v29 1/4] dt-bindings: crypto: Document support for SPAcc
Date: Sat, 14 Nov 2026 19:52:09 +0530
Message-Id: <20261114142212.716906-2-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
References: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
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

