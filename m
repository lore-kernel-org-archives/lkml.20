Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8F83909B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377337; cv=none; b=bJBsTL4SZOYUGsLO5g5qjX0NRbRGUN8+ylRZshSDK22QUXEBcvlx6xXCrFP9QN/CKIHIXIMmfnbMj2P3B9sNiePtTopV0UKOrfcdYBPQELRO8WCZBJRMMpvLCHeQdgIrd+SVuiYllhwy6TJmUZpkJgozNmYGzz7D3ki5NmRtph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377337; c=relaxed/simple;
	bh=FM5tgF1f4gTluCeeCOhkUzBtb1GjjHUL6PkplRSqmH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tuO7aTL90CMmMNzHsEKkODKOFro8qTd9OqroGrnvFHLo10lTUHCwSpq7dULHuPWDIOcbkjYfEqP31mXXbYPCU/r3dho1vz+oBLu4/2IvEbNVlS9HJ+GPxqOHTC9ER0zIdiSN053vXa7YCI70GGTjoxe8NrOy+E+rD+7//86Gdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmto7AL8; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmto7AL8"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-46a4870536fso1066092fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377319; x=1788982119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=Zmto7AL8e1cB2KwsRv30shLq8Ys8TZolrWtsdzIm3rd5vHqdDEbQ4/pfGSBF+gYw5J
         rbd9q/V36mzfbrfRpfJ46KlStQ3UFsy2wyH8uFejKbS4a8+KZf5kF8j+est4kThMnzM3
         ODlC1uFWdTzLhJPiEW9MDSwQxEtOOzkjF5XA5l5zGRIRd67Dgv+GWJlWKIcbZpHrDBIe
         QxlMdO+4R53z/kHBIdO6IEcA50VSUTzlrT6Ip3poh3Pl3jTABVWe4p8Z8SEaIXgB5nZ5
         r/HABa8SfCdc/qFmVpDkWlVfGeKxkas+ooBKeSqcEO3wDDxamEPAsG1mpw8n7b6IH2MT
         4C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377319; x=1788982119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=ng/lrGAgNAocHq8Bttas2aciL5cXnA9YRO5rB6Kozy4plHMKsD9tCYAU7HqNdkP2eq
         lhvwsgubt5sYcpW4X5BYx4IISTLpzhk7F7i8zzc0+bnhbVDlH3kmIRckLdaXGwZUljbl
         GpkNwEiy+DEBWdrMk117xUgimmI6fQAiU4R2L4UYVzvD+W+3qPp4sNNKHNJTIph4Iazw
         7ekG9Qsh+1zgySLqozQXpPgw8Av+Myh4Qapra6hiDeF2lNjg1n+Tza5/GeQU9vsnNpxc
         mZE1Pns6wNpimQbp66BfK2OylY6Lt1ReDpe6LlRf47YJaMkXGDwM4T8+yYrqXQzRnQYZ
         GiLw==
X-Forwarded-Encrypted: i=1; AHgh+RpPdTb19zNwYDD3xg1f/RdreaNOfwoXDH9P3BG7o6TKVqmisXkpm55pJDva18bHy/DbdwUcNK0mdDOQnv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kiFQ7FSvVXiIYL5WLSB9sksP+JYPdn8oqUgZuaUYm+BLSQfwJg
	ACzcwNmpw7ULjNAbiOHI4hBzAPEQkLZDyN8u/fo2oQdJHXH1E/qMJECS
X-Gm-Gg: AYBFou0wG5e6cRBrwy0lgeeorKidkGiTfbIws7mL0Sk08RZntVv4lKrWM7Ec7ElIHR8
	04bofzHxh+lvELUaIMvMrFbOzaUt/ph25eZXoQNUD2ZuXZT2dWhLVC8bYNfcsgv/h04ay7NXZ9o
	CHdiy1qh+qkr1zKTz3/0uIBGxLEtQqtQHSImQ9PGHhzwrwp1m/6pOjGZJig35Dwx90cCHKp/8Im
	JvQA7LBU3WixHFEgmXOrBw1ZnF/jnJ1ShUUdgx4bpE3m3iYy6Wtd2PWSSXxrhEQ3tv4l0rlFv8N
	Ybbjj7fg0bOgwl/UYp5v25WsDSMwH7TpFU3N9n1+E0/sCQbh1XBk2BqY6d9P3qYfZ5gB17t1ND+
	rePQQagikROHBC+uk0pL8lyh8MQ+YDTFgpJDf30RLL7f8Ls1EMbxKkplQ+0dCiVf4TaX+Tu7HDB
	lBxyB7qaxt2hBx1+Zutfile4S4ioyqASUrbIZc+vmgfTz+Q7nQ0hbgO73+Szp23TrtCNYrqmTRj
	UiqQeNiDQK8GQvJHaeOYS/+UGr0253ux9HivZECAw5PX+27E6s+pujY1naGagg1C7s36MvJavKT
	AAh5xQZVoniWipNEw0ZyhPAUyH4+bsCWnKJ3NjRATAc8IvR/pdbl39Jc9mRoj6XSPqzDSGry66P
	iLY9dGyecST/q6ZF0aE8=
X-Received: by 2002:a05:6870:1426:b0:46a:dfdc:c77a with SMTP id 586e51a60fabf-46f86ce6964mr6864969fac.10.1788377318780;
        Wed, 02 Sep 2026 12:28:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 02 Sep 2026 13:28:24 -0600
Subject: [PATCH v8 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
In-Reply-To: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

