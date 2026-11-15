Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765717;
	b=T34Ff51pipH+XJ1DmiMYU+hzB9p61Lc8GqJNl5yroMkw4Zu/SQWNTEWdM1IEV3WkflFx
	 2K6VROZmm1jkuevuAKU5X9iK+q58XjJ+u4hVNluj9WILvUEKfU/VeC4ntqVP9C5RLTn0q
	 aNXa4PRII+nBXIAs4VmyXnCnobaiBkuAetzSbtoZBv1qWtGRy8Y1qFCUQ02zDD1lwLERF
	 FOguAfCbJTWYPLGrs0Q+sOPNY5AIX8BwhpBtdoObHT0BsqJk3K1Gia/pFkxskWmj6fnC9
	 3BC56jrGBeppbppvuFZ+slu0KJ3JHzAvVMTi6XDBweKi3CwcDtdPIx3+e8VxpqUwYyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
	b=3WZ0SUxczO8gs6DAOC1Hlg4V9nb8a2fWKVjugj7dBNhajneIvr5vMD+0KlKoJmNoxRIV
	 2/KwAkaRfYgspwZ5op0vHsrxUhds/nDh+/mgI/REVDF84lNtubecfLVVp/0TX+SWZoou8
	 ofPjAG1Dnk/sDJ9tH5S17U7kxSgxM+FMBFLlKyaS7nFIr0yfLBqAr1oZ716VCCW4Q9gUL
	 CX9P3u4BBHOgrexMkh5NfCR3B0u7F71gD9tN0mNayK+Gb1A2SUs6VfeYyyWIYJaUMHa+a
	 lk6zuyvAo0Pn1YwMwVZTw+JU0HKwoYAEORGzB/srESpYWv/C4/SfGf67U/iybiBLx4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFWAQD6x;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDB606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CDB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFWAQD6x
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e94f72fb9fso23054635ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765717; x=1795370517; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=mFWAQD6xtMHKem2eI0x6NCr6QrofMMV1tkLrw+reNWVodsjsQv5b8BziZmT5z8/o9m
         LCxoowpM/leeyzHmRKtLUOEhe5yT5jhc11klCMAoOHnZMClNtgQr9mbOb0fq+MfZQAuF
         0AxUpWzO2tRP817qG1oo2yUBFDpDqG0NlHyKqY77vwJHJGcP1khfseGaG+jhJcnWtaBT
         RmuY//YNlsyl/emDSg89+H6pWlICTHugdrS9KhaSENx9zasBZhdNlJXHWbQz4XwXi9Zf
         JkS/MsUnjMfZNzX3g7wv1QpKeKt8+sUqTHzogp/PC3fjLigmrRqHAOp4zFIbp43k09JL
         dlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765717; x=1795370517;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAWro4jZVfqj8KdlpNN2UU4jTNHdFtCGeZKlMXeivXc=;
        b=gO7l45VyFyfufwBJq96GMF8WSCiuU0UtqLj6u8C8FqNp65Je0NPq5lMOfZm6rLTQKy
         2a2j1Bu1UUsAxRe8JOmJgMkH1zod4/saMoE3JV3Plaw9n2Mr+JuFgLPJzN+7uR1wZ0I1
         Erg3vfM1LC4rtHFb+UQdiRmA97rs7Xo8xDcV2DmcEX59jBByYJPQNAM6rC5yVVUQNjF/
         ZJ27F2k7Et7NRTm5tltLY7XMyiXeYTvlx7qctyYk0WTjvrNVXf4t/R3AEtq/uZIgp2Nr
         /d25NBHUB7OpjHveTvb0HK1V0MUFEMLP2gLmIPF9KT3KaWGxtsDD1U6g59A33zSkdTr/
         lVpg==
X-Forwarded-Encrypted: i=1; AL+hErEm/HFSzjrdvuTkgbRR73eclvxEPXci0wB1/xg83c/N3KLcECtQlmxxeBcoDVFWOd9epH0w/boybSUr8ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z879YaztNbAcx79qdUqC7xVN9LZrHy8NW+cXz3W4X2HiroBkGZt
	67dLIMB8C8ojgZQaPPEJ79E4C5TGhpQLgRsOZfdyNM8uEJKUXuTZtOnczMgcO5KbfZlMHwQB3SJ
	OdcYsqWp0FlJ4L4SLZjw0RrSsVglyq7Do6w==
X-Received: from plbmz13.prod.google.com ([2002:a17:903:350d:b0:2ee:2d4e:e83b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3886:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ee0dfb0832mr69763855ad.40.1794765716407;
 Sun, 15 Nov 2026 10:01:56 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:46 +0530
In-Reply-To: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-2-vamshigajjela@google.com>
Subject: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Document the device tree bindings for the SmartDV Technologies MIPI SPMI
master controller integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga").

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 .../bindings/spmi/google,lga-spmi.yaml        | 56 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

diff --git a/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
new file mode 100644
index 000000000000..60d1e1769cf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/google,lga-spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor G5 (Laguna) SmartDV SPMI Controller
+
+maintainers:
+  - Vamshi Gajjela <vamshigajjela@google.com>
+
+description:
+  SmartDV Technologies MIPI System Power Management Interface (SPMI) master
+  controller integrated in Google Tensor SoCs starting with the G5 generation
+  (laguna / lga), supporting MIPI SPMI Specification versions 1.0 and 2.0.
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    const: google,lga-spmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@14853000 {
+        compatible = "google,lga-spmi";
+        reg = <0x14853000 0x100>;
+        clocks = <&spmi_clk>;
+        resets = <&spmi_rst>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@f {
+            reg = <0xf SPMI_USID>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..cd5ae89b4f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25243,6 +25243,12 @@ T:	git https://github.com/cschaufler/smack-next.git
 F:	Documentation/admin-guide/LSM/Smack.rst
 F:	security/smack/
 
+SMARTDV SPMI CONTROLLER DRIVER
+M:	Vamshi Gajjela <vamshigajjela@google.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
+
 SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 M:	Steve French <smfrench@gmail.com>
 M:	Steve French <sfrench@samba.org>
-- 
2.56.0.611.g1030f0b940-goog

