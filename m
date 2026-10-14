Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F747F775
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962592; cv=none; b=SqpZhmO4KnMeDnyBmdEVO8qPxuca9VOo86mEelf8+vX4FWOT3JP50BtlwdSomXTe8QmWWX2ZJ+yNKDxrR5lD5UsrsaCFYtB5c0zp9Ggyiir0k6a2oJ1SZY3SVjfKIg1NYF6nW8+rMlSpuUdEN8z4/Ak+osTeJoCiKVN+WCuZNao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962592; c=relaxed/simple;
	bh=E3PFYMvecW3iHYbCYGdAhKiumjMtP9bvopg4I7rWNEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVTuM2iXQmNZx+t9pW0goBxNYDhXKD15VnAoncVEzlHXO9uw9bnNgPY6Ps74W/o1M3Sh5bv8WDypPiJkhtXg7gkuy+/CWuWdy0Cx0FeFLbGq1+xCnD34UnSe05f/BcFQLs5bm1AVG9CxYqL5+Yhvpgx74fhN2SB+a7eCFIdoOkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmzHGBKh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmzHGBKh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso20512725e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962587; x=1792567387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=cmzHGBKhOZ/CvQR98dIKCZ6HUGtRJWrYaKPYCdWuVPQpveDqXJByPR8RQkM3Vh3Dfm
         69nchZcMCDuVeoRQd2+sNi3YbrB1CGnqDvWEZg3oQLv6LEhEp/bmT7fiBpNCDIjefeev
         UgFJgM/BaQZ0MMLHqVx8JAJp86O5UV33HiGLBY7eYsjRfeWKCfk8lrRRX1xhvJIA+ifW
         QYL9Np+spKgZ2vblTblxEKXiGLmvuKLF3UtfrgC8hXq8r5FKBphTjKVMJpes+BPg8dQm
         KtTV3gp66h8qKwQaISzlFoR+L5ZxOrtAW5sm4GNFo5epxPeJTWNDzUUNQanhR3TmW08N
         zwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962587; x=1792567387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUGfe7wFqlQiSC0eGjj4e04EQS1TgsUFwNMlSY0cEig=;
        b=TeMjAqDGjbhk91rzKpbABxXXDHu6NIgD53sDZhMyfkirQ8uPYuIppyYCAocmlpBNwM
         FPIIQ6QSxVf5u6KNACVcY1hrKy1Coh7sPhVT8ZMJcPqu8LqT3Lnk+Cetp28uhMZYioKJ
         hLXu7MYrp2kBL2NoZ3OcyvdYxaUa7VyJUtFt/e5RwbhKIkZlFAJGOChdISNK651Zyhyn
         9hKwpc9SzG2596kMvxMmjDAEAWa7kAOY87lVn5b+ApYZqjGoDddLp3OhHzZUZx8/ihQc
         Ws4TMURTNUiTsZ11D+QPe8FBh3gsh4dVhCirxkljjn81uOiBUP7UUuprvHoiXGUM19lO
         2DnA==
X-Forwarded-Encrypted: i=1; AKwUvBy+npJATLIMWRfol4kH9rR/PzJ5vJ6XxlUmL4PXKNuSXgdDw00r0ktN0rBjbrowmO2p0xLp1hnYJgsD+TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPmYqmCIoL5SV6fAPIVGMYTGoJK7v9/FCwy+eMkKYCcpTGhAGw
	To3dUaVbpvwnlnIdeWQGarT90+jFsNQNEbDeDY0OwJKXwcZN43aMzPCc
X-Gm-Gg: AYBFou2M6lp0k3pktbohwtUdAwPzWGRwcn5r/teW1uRoLG0LMEEVt61hS22PbGIusZW
	aZObaYfdXkdP/bq94tyVcZpPM4nc3eUTqLCYYbZ3rx2PZvOl7XTYmNdSrPjdWEaphzLhXCeYZM6
	qxN2b3HdVGXt2N3CB4m+SWd1ymxU9KezyPNE3xGvubdveWZbPsYTiixF/aHQfLJbsPMbnQKV5Vw
	E0mRDYjwXAJROrVEH3jDpevzCr9Gz/xyUObK8GhaFePjfdndvuF4Ew8ulnT+fdvO4RJADharQkP
	Fv6ecpvi03Osq+j3nunATRwkULdvC1zO3YFzaGJ5LiMayxjG0WPLJILJYGFwCdkssisgLhqsz4O
	GLtjG/WCgB8OYbN3p0nVgbSBmlJT/C6cZr4HmoeXmX4qfoN+aO0fx6T8YbdAZ1yVAopvcCDBfkV
	Dtq7FeMGTV9Q92G8dBPoB5BD0z1y4bICUCspSVeqIEbclC24ggGlux8B4OGtqLt7W/wTUAWd4yb
	5GNOS4MUkiIJd9SQxEtGbaB6vMDmiAL7mRXPejjTyqr6rbm2my0SJULrOFQFyY6ITD86VP6n3UO
	Q5YlXw09ivFL65v1PaSCPB/thBkORCx3H/eBS/u00GB+kaNcjfKdkDx0mLcjpbTv4CXT9FVa
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr79484415e9.28.1791962587425;
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:07 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/24] dt-bindings: net: Add ZTE ZX279128S MDIO controller
Date: Wed, 14 Oct 2026 08:20:54 +0100
Message-ID: <20261014072109.1759502-15-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MDIO register block and its work/register clocks. External-
PHY pin selections use pinctrl rather than direct syscon writes.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/net/zte,zx279128s-mdio.yaml      | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
new file mode 100644
index 0000000000..fb12414ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/zte,zx279128s-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s MDIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The MDIO controller of the ZTE zx279128s reaches the PHYs of the integrated
+  switch and an optional external PHY. On boards with an external PHY, the
+  default pin state connects the interface to it.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-mdio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the management clock (MDC)
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    mdio@9a101000 {
+        compatible = "zte,zx279128s-mdio";
+        reg = <0x9a101000 0x18>;
+        clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+                 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@8 {
+            reg = <8>;
+        };
+
+        ethernet-phy@a {
+            reg = <10>;
+        };
+    };
-- 
2.55.0

