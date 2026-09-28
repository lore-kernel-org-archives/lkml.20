Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CE4F4750
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624759; cv=none; b=izzIqI6+2ahYmhY3GFDs5NonhyplfmXNJsj8bG7I1PmCDNab8dEm0+8/1KWrTDR+/AvwaVP9lLLw7RP5ip0ixP8GhfCCvDMm07eEmhrL7NwLtCKCIcPfiJYD5axU942mDgmrcNIKPYTExBdrdKLPUY85fm+n6kX1rF0kh553I7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624759; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k992nCIl/Sv6YGbEqWFR5atATNLPwWiaMzF1xQBYAHUBx2x/40dgO8VqSxJIUZr6QWsLEceL0g8RmuGxEpbv7d9/A8QY4kAZOvZ2zryX7xCaUU+NBKFqriLCjnhLa6oSj6GMtvAVBr3KW7BdFPNxnhvBW7v4D6cSulghYQkTExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUSodHcn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUSodHcn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so2905882f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624755; x=1791229555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=VUSodHcncvOyo+vSbAMjoM4QCFS7HWvTAQhxBtD06zZTCiGmjML3GiWJTuQKHkLATM
         8GTD0fwxUXAo5S5py1FogWBFah9RT4fVa3VlzwCedtn3o/ycZTAXgpxT5rBhhR5hH93q
         GHG2YytaUBxEsyW/UticOkpr/2FU9mf6yIXsGbqH1QPSNLKEjKkkNtFsvUNzAkPdAupm
         gTEffTMTeKMlG8NSHRcH6Wshue6GOCPduQResboF0Bk3m4zYru8OfG5ueio9y68kl9jr
         sMA+4OQdr02xWNiR6QtuyAsPIywwkyIgl1WnYJqoU0kjr0wLFU0xH97W/RDwnVGUWeDf
         QHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=DljA+Q44G8b0pfX3ohsfiO2qdTP18BIwhivZeQnc+046TmNQQAMpf/cLW+CPMCtmvI
         9LrpphOZuqGwof+HNk9THzJ52xRxcIYmT7ByEfN5wop4+xXSN18I9OxCk3trW1P04NLh
         sXeIdqx+AVRCshFWR86ZuhW4hl72GUTiZy4a6dbh6OB3FMMVRX5BsatJCpA5V6iRTIl3
         za0ax/5BYgoUyk0LjdyaTt30KL4hOCScDGoIs0Y7QLG3+choR0Ygh+gZFi4R7hPbMc/c
         k0Mm/tfaPUs3kohgZbL6dj/aY0rwdzAU6wElIEQAtDsq1S1AX0zrbg4ZCIqOS3gtSX/i
         XDNg==
X-Forwarded-Encrypted: i=1; AKwUvBzIAZ/1hgw8uYhb/Pc1yqqe1rHiQxvljP3qVuGju2lcj/UjRZDrYWrMEMiSZEK4WTEGBp338cBAkYJ3fl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqJ8oHFANl8ksCO6wZGKbbeifsE0R6kGD9o05K/tBAC0fl3ZPt
	bPbRoeGQVSusEa22holSKJaALGk30zr1ROwcgb7N3967wsNgCqurGdAF
X-Gm-Gg: AYBFou39xFJzJ3HoSekNOyzxlyhBw7NyWlM+38IPRVztnibmjehnW1j/OsIUf4udA8z
	LBdMeIf4ws1U5VZBSmEO81cRPdntak5QT8uABJy2GGOZoY+EqcMuFKufviTS/vlNxZ0kZmLw1SY
	D5IkBkS+Kbrsf+qvjo/7CH6s5RXGxfA6afkpnwCiM4Wl1VECD8jAbxFGY4sksGy/B0oOtpQpyoI
	oGh9vVYz/9/eOn1MxQ6S9SOGMJyX3G8JPTt3FjwrdbT0cC7hkszqbtlfvbQVmXvd4f4ce/WLrx5
	VMXYKjV9RScNFo3GL1Qwdk3N4BYKHE4rAe/S5Etq8Ant0FTI9hQelSFmnImiHgdByfeEqy3uE4b
	cpPLAhfkbL7+OnFSdjlREaKLsHHl/GnfRpHKFeScNsrFvX1HGKd8LijPVkaD2ETkvUkmfhqQXDU
	uigbICP0bSfQK3yhHaVma9+7DUAUPtBzbRNA5PYb1t3r4Byw1ly72leg4SaHZ48WNphy0qxjeJf
	V8pwAeaiMZxet5OPZyXWNcMuRbMiMC4YuJmRjV+UsUfqTaIZq+XLIik1nmF53Iz
X-Received: by 2002:a5d:5f49:0:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48af1fbe9demr313504f8f.21.1790624754940;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
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
Subject: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 28 Sep 2026 21:45:00 +0200
Message-ID: <20260928194511.41878-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
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

