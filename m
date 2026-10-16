Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA7E40B0E2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149648; cv=none; b=HYKz71qjD8hIujmRL+cECha7JDPF7D8Qu8KvgRhRP/obikZZj7Iym7JvfeHAIssaGla28SpK2Tptd3cbTY7zSUlfVYInE/G0TroUPrICBsM4QXXl9tHxbVR9BNDLNgs/RLwUhEU2xE7cgvNXMGxUmxCxVkyu85HobrBjUbUTyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149648; c=relaxed/simple;
	bh=+OdSs83QXKRZeXBku3v0tG7jLA8SyVPmuroYMjYCBl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/6yb4Sne1gUVXj5Tb0CoJNUuQi/xQ/uhhwun1nxl/xMsrkqtg9Zs2OMOkNoOERCaCi8tluGeM7wmDM2d6Wx1Asue8sNwwV/0VMMzTKFSmpXtj2e1IYbjkDschQBQvelEZEnZIKxFDDgZ7y8RKScVQgtqcmor1be/RzAKa/bGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=eNjmrs5l; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="eNjmrs5l"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso1099924966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792149645; x=1792754445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nP6Hen4ha32UaSHEgIpuQsbgsTYGlvUW0UsDEzDl+hQ=;
        b=eNjmrs5lbIqzIJ8J3huCanjBIWaxjFGuEudBBZEpadeBVSF6NNWLmuN/aqs/plPnzq
         34iCDo16j6BEewJz/hEbuZ97OdcddusLkWcrOtqDSeddl3KY4aF8ZsOh+KoNrwNlagQo
         lgofYV7gXr4IqgUChJKZ/YQc7tlvTMOIVhFX6o0psOK9SW+1lKg8hBsX2Vxavf8yUYxc
         fN0m+EjONRqPJtss85P6/fiBsZYVN5xSax3YyqaGMP2EDfArUJ8X/dhV4T/B4SnsFnf9
         Jem6bvuQyUTeag+MRZTagzqnT0sZSMQ4TS8WJ7gzk06sKWYoCrHkLBRyS95TDQBe3UDs
         kx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149645; x=1792754445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP6Hen4ha32UaSHEgIpuQsbgsTYGlvUW0UsDEzDl+hQ=;
        b=TD8k08uOiIPPmMwUuSLa1/Rha344wwoPETl2PFnyh63oukP8rLv1+SRGsT5oP7T7ok
         PrBPg7QTLlxrwblY0G+6V3SSsUHlWLGHCqpw5mA9/dXJk6VqmnbpVdkng28qAl4H8ux8
         WaV4aQuX211XvLpIat7ROplyqJHNPO9lfYa/ySnaR0YD6F609OVzyL/Z/d16bPfpLEDV
         V9K4ffL0tfEOgul1jcN2oyYuUTMQR9OlcVMwTtU+A0R3CfmEr5OsKyAup0EIXDpPOXj6
         GoxJQLSFl3xNgfw+9gQc+r23XO+elyYUDXjQ+FpO7B3e6YkxD4TNV5y5GMOk9E5sFb7v
         A0qQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8KPEnwp0eJaQJgtEYgQ5e/e5zL0BGiyr7pHKLmVoinVQV828Qq5v7I/eV3Zev3ToPiWJ3UiuCPAAlj7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6vlHZv/tvu5PxkkWmq6A+3UeWyHNLZ4IoM0auMMB68vK3wj5O
	1OWCxFQSJELHvHmR7xw6/ew9sC+uuDCU5bHuvxbv66/tLF2QKk4lSNKHcbPcixo7OZ0=
X-Gm-Gg: AYBFou0kN6qftOLa410UE/Y55+pD65rsS+Y5/PO6pU6uRicf7lGevw/+AWT5DqSlPQ8
	Ffx1UBpnpn+ObSfO3nPb9EmRmsegrIcnzpYNB8/Erm26h4Ew2Yn9QT+GG/oMr48aErhUYcDcalm
	iPAgQFYjA8yaaCPBjn9bdumwG83ghIm7L2HmSgd3wQCIfdKujhFwjeEx6oUzhoMt3dD1sK+9h8O
	bznB/qF+ZbRIqOhr+8mDUMcGIx91vu17RgpY38NfNiD9Nub3hvIOzxB2sANTtXyHAWUpMm0RSGr
	uTexOZUigxF2zhxfyHxi1/U34L+tVfzQ4ePtziDwiHmn8z9OAW6onFHf/NaVezMWxprKxbsDb9x
	ntCgcUkHjdkOcxMGETlTSrVrz1/rAYtgUcjdRPYfeTLxbtqJX3jxRBfqdwzAFXUhbcsFO7mZvVw
	CaFUOfOlsGuoGtNiQjB8/1xSuy0VGrXJERVw3QV8BjEGmDTpFMMAsDYSeVyo2PbKd2ruf/3rFGp
	FErp7lH9RL4InugNr0NIIyd9/YYAVqlJgSRs9yfN4rVWVfN74GriWHpKcwcxy70XEO4v0KMkVFL
	3lxVYbzoxeIO0szZKYVAKzS1hUs8
X-Received: by 2002:a17:906:478d:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c4104d5f1abmr63177666b.37.1792149643725;
        Fri, 16 Oct 2026 04:20:43 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-194.xnet.hr. [88.207.15.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm63947666b.11.2026.10.16.04.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:20:43 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lxu@maxlinear.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v2 1/5] dt-bindings: net: maxlinear: add MxL86211C VDDP supply
Date: Fri, 16 Oct 2026 13:19:32 +0200
Message-ID: <20261016112033.949026-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the VDDP supply used by the MxL86211C PHY. Its voltage
determines whether the MDIO, MDC, and MDINT pads use 1.8 V or 3.3 V.

Select this binding for the MxL86211C PHY ID so the supply requirement
is validated.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Model VDDP as a supply instead of a regulator provider.
- Select the schema for the MxL86211C PHY ID.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..a0dfb6192d81b 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -10,10 +10,38 @@ maintainers:
   - Andrew Lunn <andrew@lunn.ch>
   - Michael Walle <michael@walle.cc>
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-idc133.5400
+  required:
+    - compatible
+
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
+      required:
+        - vddp-supply
+
+    else:
+      properties:
+        vddp-supply: false
 
 properties:
+  vddp-supply:
+    description: |
+      Regulator supplying the VDDP pin. Its voltage configures the MDIO,
+      MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -45,4 +73,25 @@ examples:
         };
     };
 
+  - |
+    vddp: regulator-vddp {
+        compatible = "regulator-fixed";
+        regulator-name = "vddp";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+    };
+
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-idc133.5400",
+                         "ethernet-phy-ieee802.3-c45";
+            reg = <0>;
+            vddp-supply = <&vddp>;
+
+        };
+    };
+
 ...
-- 
2.56.0

