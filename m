Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854084;
	b=I5/oEXm9eqqmP79+bVekFp7RV8tpPtXQvxrDWG6RY61YHn3npKmsK1/Egfz/1OR1cTAU
	 xaglGmSCUgLXZ5C8NMhwzgfJPG4vA1UykfUbUMiGJlQHAcKc8l7Ud1bJ4bvkTyjLF/Bkn
	 nG3Zo0/fE14zJQjZqhQgMwfSWjrE1ueuKxb5/iSPusCJVHFLBRS9P+DAk5XWTTbgwpOTr
	 PG8nNoflsrVR1JSgMdzzzIdpy3LQGd0KXgmm9XjBMyr39K8d4jH6EM9N91XIcGZMuAsYD
	 vGQg0zixZ0gCEbmrLZ4icpQt41A+iSqwqL2EIysZGVqPvpyPWGXklZ6V8jFdB9SEM7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854084;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=fuQTjG6xTpV52Q/4RYAyZIhV3MjoR+FaFzdq7KJVtQI=;
	b=uWMxY3cndT6YrwPffR0AAIt6VasIKLN9NTSwFF4u0mRlLJk9PtvM3PQlWdz9JURLsnm0
	 ts3w0ckwg7r8jORXnjZ0mhVJ2nbeY8bxVgRSKsDXo2bpSTnExweH/vcPUqrgBhCA8YZL9
	 4z/4mTeOB8wL+a7d1BXDuWsO4hFLP8/gzp1pT7lAaQ7fBsBm7Znfdls83LLL45JH65GZX
	 88X0tz9H+3j11DivPHYyZSPrwvmX7FfupZVIDAOdYIJ6h41J+KiH3sE5mDhUbPLDqYnjg
	 zSO/i2MYodU7UKruE4SLTf9bxXPXYGGYcgZ5mW1BrJ0lbDD756jdpcmoT6gxpk0VxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=vyY3g6nL;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4EC606A335;
	Mon, 16 Nov 2026 18:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4EC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=vyY3g6nL
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CD5E4FA332;
	Mon, 16 Nov 2026 19:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854080; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fuQTjG6xTpV52Q/4RYAyZIhV3MjoR+FaFzdq7KJVtQI=;
	b=vyY3g6nLmpHL5FlYlIXADITdwDlTqVvRfW38VASkUwdy9RPQr0xw4Ec5rMRHpm8v0SnsUl
	gn5aDN6gaOBUdsCBFen5RdRnPIuN3mcGSEcJFZdEnDl0TGmdDTX4mQBpBAw45qxY3B5xFl
	ryHXpdHdD2aOh7tRdDVBgB4xBvDgl3VVPMMFms8hQauVZO9zUbK/8hE6RmWi7x7zZLUKUV
	AttWWiTmhFcFzsujTwHEdr3ApZpcr9g0ToUqyPAMI6UXxCAYGVMR/f62z/69abN0Rh73El
	CaG8OydaET6ceEN44kuSbemmK4Wqgcixy+SUhNC2EfW0o5wmJieb3JCpL0hhig==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [net-next v5 6/7] dt-bindings: net: dsa: mediatek,mt7530: add EcoNet EN751221 switches
Date: Mon, 16 Nov 2026 18:33:31 +0000
Message-Id: <20261116183332.168858-7-cjd@cjdns.fr>
In-Reply-To: <20261116183332.168858-1-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

The EcoNet EN751221 MIPS SoC integrates an MT7530 switch memory-mapped
in the SoC register space. It is similar to the econet,en7528-switch
except that ports 0..3 are 10/100 only, port 4 has a gigabit PHY, and
port 5 has no PHY, but is in some implementations connected to a
downstream MT7530 multi-chip module via a TRGMII link.

The downstream MT7530 is similar to the MT7621 multi-chip module and
has all gigabit ports.

Add the econet,en751221-switch compatible with the same constraints as
the other built-in switches and also add the econet,en751221-gswitch
multi-chip-module switch whose port 6 is configured as a DSA link port.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 590eb39d6b93..e4e81ed64136 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -29,6 +29,12 @@ description: |
   and the switch registers are directly mapped into SoC's memory map rather than
   using MDIO. The DSA driver currently doesn't support MT7620 variants.
 
+  EcoNet EN751221 SoCs have a memory mapped MT7530 with 3x 10/100 PHYs and 1x
+  gigabit PHY. Some EN751221 chips such as EN7513G and EN7526G have a multi-chip
+  module implementation of the MT7530 as well as the on-die switch. In these
+  packages, the multi-chip module is connected to port 5 of the on-die switch
+  via a TRGMII link and allows for 5 gigabit ports.
+
   There is only the standalone version of MT7531.
 
   Port 5 on MT7530 supports various configurations:
@@ -110,6 +116,14 @@ properties:
           Built-in switch of the EcoNet EN7528 SoC
         const: econet,en7528-switch
 
+      - description:
+          Built-in switch of EcoNet EN751221 SoC
+        const: econet,en751221-switch
+
+      - description:
+          Multi-chip module gigabit MT7530 in EN751221 SoC
+        const: econet,en751221-gswitch
+
   reg:
     maxItems: 1
 
@@ -159,8 +173,8 @@ properties:
   mediatek,mcm:
     type: boolean
     description:
-      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
-      switch is a part of the multi-chip module.
+      Used for MT7621AT, MT7621DAT, MT7621ST, MT7623AI and EN751221 SoCs which
+      the MT7530 switch is a part of the multi-chip module.
 
   reset-gpios:
     description: |
@@ -222,6 +236,20 @@ $defs:
                 phy-mode:
                   const: internal
 
+  mt7530-passthrough-dsa-port:
+    patternProperties:
+      "^(ethernet-)?ports$":
+        patternProperties:
+          "^(ethernet-)?port@[0-6]$":
+            if:
+              required: [ link ]
+            then:
+              properties:
+                reg:
+                  const: 6
+                phy-mode:
+                  const: trgmii
+
   mt7530-dsa-port:
     patternProperties:
       "^(ethernet-)?ports$":
@@ -329,6 +357,7 @@ allOf:
             - airoha,en7581-switch
             - airoha,an7583-switch
             - econet,en7528-switch
+            - econet,en751221-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
@@ -336,6 +365,16 @@ allOf:
         mediatek,mcm: false
         reset-names: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - econet,en751221-gswitch
+    then:
+      $ref: "#/$defs/mt7530-passthrough-dsa-port"
+      required:
+        - mediatek,mcm
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.5

