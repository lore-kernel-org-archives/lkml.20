Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24484C8C54
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770996; cv=none; b=LiUIbV04Z5mcVjbduLZChPoXRqjUn4yS8aBmXUbRdUGxQaVY9ayVLbKCtga/EH00bPBTOYz+4rspoLESs4xFYAPmA5FKB67W3idlNAd8rIhwce1JPcf5dJgSmO4C9AuUpcazIaAjIiApS82qnPYvXrWwjK9Ykr80D+yMIh0Q0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770996; c=relaxed/simple;
	bh=hd66VCJ3K0RoXkl/bUrVexrnvv/K041uRHih0HcPJLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q9ozv3jjZndW2orgpmNdCbIAFgFhVKOWmM7V+UNyLqS6t2wGb+rLu2bvsUiQ2H2He/peN/YjKEQosl9FYeqCREKYPFmRXDFWBc7cbCl25p8EVyMIzJcK4XqUW9sgJUIjQ7WStwBZxa6UomSvN+JRkDx7ZMtFf/ZoPMt4Dy688s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=AR7Kjy4h; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="AR7Kjy4h"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so8430863a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790770993; x=1791375793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTmXsnC8RxOPoTRudDkJpI91DV2+W3uFeKU9KvirJ9Q=;
        b=AR7Kjy4hQnaTlj9ensLiGt5clD38S8VlpsFB7IJErtO77C5cjJHEOnMSMSOC9C++d7
         BJpfRYlwt+RcW37w8I7uwQh3EFVCiQiE6hL+oZk5bgL2eAZzprPebRFSTYv1xMX6VH8Y
         zs3do4A4lQf6ij6ZkGnVT6Nwwswg5nF6adcKdiGivpgLXKLb93kCkY7xZS0IsdHSA67C
         yewrMpJJl7BixUSB2Dqkb+QkQxRmYLx5BzRdeXUBocGZF2aD/Lz5BpB1oq8altRT6o7w
         91UnZey9R2nZwBU+HNZBuldEbm2M74l5rfhn46RvBF4AAjGHo7kV5oNEvDhcCQO3zhsA
         3ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770993; x=1791375793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTmXsnC8RxOPoTRudDkJpI91DV2+W3uFeKU9KvirJ9Q=;
        b=oa/HzewNkPnHTcxy6L9yx1HX2Bdo43DrXWZb/b/FCFAX7My8HgZsZVgZXb9PByAB9p
         u2iVpdn+6jzTOXxMZUHNdGiIQpkBXX8klhN5O/03dNF/RvLhHddUzXs/0OD0s1cc5kUq
         8vRn28abg3dDotVSYhPPxv5yCgna4781Hi8J4wBPO6P4iQ6SMl6GF7cWgd3AYjVlfSfD
         b8h7qqdsF1G0iGbcCCVj1Oo12nSRpsrTgUA6EcDbxPb5DbQHzwuPK8p7B/nSeAastmDm
         LNJUTI+Dk6ALk6QM7/NzNlUXMXusqvVsHdd6RDU7JNp+qckHRLE2zysPzNKjHvAjyB1k
         59ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIaOpOaOAOLbXgIONKrMN/Ny9mw1GFv2w4Se9K7WB9j8I3QXJI8ns/B4L9NUCzBiS/8Msj90ZS1eOS4Rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0wPqtvpnPl8LQuxz/2ETBRJ8d1gc/IJQyhPv+Ac5bsFOOvmNn
	B1b2DQURvzxIqSQsqFpdSewNJk9D71dIhHy+Z2jzGfPWasA9dFcV9PpdoxcYzG00ulg=
X-Gm-Gg: AYBFou1/0TW1azDUKL5FKgj/2pOUbnFhqmHHd5zz+ZSVeDI7MZ6KRN/gV4z3OCG8uFo
	JUPzB6Mzh4W6joDQlJIY+UcVwuveDwH5l4f2K2DUeDheonn4sUkHJ71rz07F7QeRiU82e6pdvtV
	tlbt973ftc9oJCTPkAHiJpe/lvLE93WkK8vNJpQRiSUFqsditAQPIPn3wD2kPKflFrTgRHPyIpi
	lHC2Rd5sayfSojhnTVRYvKD3Uz1R7JJjhHhV39iJV2Us817AckjKTXLG98tl+CsLRFr2Vfsh8pG
	z7pObShXeee3dE4gF0w5qzLzbMBqDYKV1SUz7zA92jKcpV2El1Gt60d7ZZmM2RscI//4sOxN6eU
	D4DL+QzXhOfWtFK62A8tqUA/z0sdXa20EeW3JM2hJH6WTc5c0jXDbFHipIgO2neFKXpV/zvjE8T
	yUdqnSyUcdpLe8pfMnaExoAqbYc3lLBBdXqkzmkIhNss0w6/4vtq1mnmTfH6ixb3TAHKMUXrgd4
	/6J/jXM5YFasn++1DZ9lp9MqUUyDLP2LD2mGOtAAqkzTm3AFzZD6xtVdQJChOFr7PcbGv1UBSH9
	dDA82HF3ZczSbUWO9f5aTWERLRAeIQ==
X-Received: by 2002:a05:6402:23cf:b0:6ab:373:54fd with SMTP id 4fb4d7f45d1cf-6ae1993bc30mr808003a12.44.1790770992881;
        Wed, 30 Sep 2026 05:23:12 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-187.xnet.hr. [88.207.15.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e5a3sm744042a12.20.2026.09.30.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:23:12 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	lxu@maxlinear.com,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/5] dt-bindings: net: maxlinear: add MxL86211C MDIO I/O regulator
Date: Wed, 30 Sep 2026 14:22:13 +0200
Message-ID: <20260930122305.293686-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the MDIO I/O voltage regulator exposed by the MxL86211C PHY.

The regulator configures the MDIO, MDC, and MDINT pad voltage
between 1.8 V and 3.3 V.

Restrict the regulator subnode to the MxL86211C PHY ID and document
the board requirement for VDDP to use the selected voltage.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/maxlinear,gpy2xx.yaml        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..0645e885f1747 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -12,6 +12,29 @@ maintainers:
 
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ethernet-phy-idc133.5400
+      required:
+        - compatible
+
+    then:
+      properties:
+        mdio-regulator:
+          type: object
+          description: |
+            Initial data for the MxL86211C MDIO I/O voltage regulator. Set
+            this to 1.8 V or 3.3 V to configure the MDIO, MDC, and MDINT
+            pad voltage. The board must supply the VDDP pin at the selected
+            voltage.
+          $ref: /schemas/regulator/regulator.yaml#
+          unevaluatedProperties: false
+
+    else:
+      properties:
+        mdio-regulator: false
 
 properties:
   maxlinear,use-broken-interrupts:
@@ -45,4 +68,21 @@ examples:
         };
     };
 
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc133.5400",
+                         "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+
+            mdio: mdio-regulator {
+                regulator-min-microvolt = <1800000>;
+                regulator-max-microvolt = <1800000>;
+            };
+        };
+    };
+
 ...
-- 
2.55.0

