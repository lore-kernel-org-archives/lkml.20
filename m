Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C24DE729
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562277; cv=none; b=VoilkR3Nrn/qerBNcdieezARyqZgqBSeFOQEBhW9YXHleN1i0vLBrH2qvNOQ26lKKP9ZCugjvGOdK+/6Ec/sGTYWyvTdH5LJvhCBADbkJTdpaD0KwUvVFTysph76oq4n331bx8W0MpVhrY9H5B/hPWqk73B1u05ECsUdNB4B72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562277; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmBcPbxFcnDpNyzwc0eEc1GrQGwvjQS+WXz3KmCgJjj+fJ5V9V9SZG5gjWEhlpvPmiT9ycYfiK6AdDsr1WfyUhFtxjHr4qUqhbUk9vQUE5doTnDDqdbAZsb0y7wSH4cSf9zgY2k3ZD+ixXBm3MZi6nWljZS7Q/hyfbD2AgZvTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf4uIxRe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf4uIxRe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487048857f6so3883898f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562273; x=1792167073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=hf4uIxRecs4IjO0NfSMyIrWk5qlQSqlHTdUiLQhYbbR8nG2EDg7YQnXeQzxGmXYl76
         9qb1TLXcdgYm2zyMjVl9JB4yg7J6Uk5GpAY96donflSkQ2NEtxkFSf+DpaD2dEAC7sYe
         oQLQVWfi22udYUc0E4KlFl000kGiZi4riHLjxKZJeW4gcEtsw/IDmSQRQv4Exa2YzO8S
         XG+VWYi2J4/ACFFmK4j0jw+PcjiqmPWndzBlR0rmycQyVPEfC+mix0WxmgTv9UYJmh1d
         hI/xjHbfWao81LhDdR4aw+mkK5BvYXRI6DeFOMVuiD0t+lNjqfz5dSbzHwuGUqvdCrzW
         0g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562273; x=1792167073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=tyVHrbOUacoG18eHd4Uxt5KDGzhlgD/soqWsH71Ocbf5dEDYGjOppJpZJi5QUqh51X
         uh62NbVlT8u+YMuHbLXRWW5iIVW63vePaakHqyNXfEWt/El+tx0hYBVCe6mO+oGDlTHj
         qGla35qKVH5HYyhpDngdgh2tjtPjp2/NILhhLpozAfbdo+mXzqpbeu2ENKkKl4mapKDP
         pWnIxCKjXkF8voigZtlT2kq2U0PmkGRThtcQOAWzwvPiFrFKxIcn4uSbncygojWnxkES
         UfSDfHJ2aM5McUmsmjXAOE+BvZCKs90MPHcCukTlBeG+kBUYgzxsY9xwL93w6uyP3EQn
         jr4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQ43HzSVYOroJv9jLWU7mpSoivnP/qKw8q2Y4P6tS4p3FotqAJd6JZlzJzY85TBmrYay8jLkrYuKBNbq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/KsQn4Z/4TjFIfiYSH4Xfnd2NOGyVZPqgLSqhkafC4YJWFJW8
	4iiIYn3pRbqabAmAbNUMAJ2v9x9XXwEfoaTHqnvLcJiKYT4c0yhEQa5M
X-Gm-Gg: AYBFou2XU6iD/6K88RZ0W6gEzCpwVls+uoMZcT6HzxXEoWVfpq9Cn64Vsm+gb8ZTFFG
	IhZph5RrIAw2sfSxe0AP8r2wxnLR2bIozKEZYGBNQydNvn7Ek/W7NJbeh1vMdyV3QC6tydDxWzW
	3sc6FSoNwDntYWII0CwihO/NKtQaXjB5roa9qVQ21cfUt7DxKHaN8KtyzXne7JUE+fX/ZG9hKXH
	Xun7E6QjFXMafPAqAkLQm+Ni1oPPkDbPOjplTkytkypQlipJpjbS02KrMxqNRCre6TeDINayoAf
	RC3K4RYxPeJ5JjHg8GfHjvbJ+LdpaZDiD2NRHAUFeHe398TSAFNGErJs8XnukR9yBxgo8ZMRVKw
	TJluigAOyWMn09g66fSRfObXHus4irX/A7tic/SdZJXd2/t79AZQdNmoIRFtLWf7F/fmISaxmWX
	JLrFBmp/tkdny29PBb8hMwO6mCGnerMP2qFi+gXRkDONzVj0KcAF2JCvc8oLfAatLvQISNEzIRb
	wwnC4AGwtnWWXoT55s9akr2ywW0OEjOljqfXtYaoQb/DbcuSATDB33l8wcWXy7VH6H/pTZPzVOD
	1vF0IfjNC5pbp+6uCQ==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr3915875f8f.3.1791562272816;
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri,  9 Oct 2026 18:10:46 +0200
Message-ID: <20261009161102.38961-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0

