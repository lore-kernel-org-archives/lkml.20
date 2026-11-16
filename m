Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838530;
	b=QnLXcFJLYGJKNcPhKBxMA/v4sQEUI+XI4WUkqPIElObADv0Hrpxqn7G8wRYCb0cLt5PP
	 zu12a+80bjPmUiWqELI4w4tJlr/z0ghhzzfDBl5WuRJqGs5tb2EinSGX71USj6LT844R8
	 mrbxDgy64ntfRsi56KyI6uEmriTUaMllku2F1yOhGiddclJ7zjPqOnGiyXde/4eGHv054
	 Ws2cvRC/v1IKf2ocjHTutyYMLpldkqwhQjhq/BMrKF3i0jQt/4CLXOMO3PTCddH3rWcrr
	 D1MFpdFagL56nfXGp2f6uCmaVOc3D7pf0xjoemydCDF61MEvlpdLPGw8CO+UkIIzDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838530;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=57JBd6NrRiA+/jRFCy9q5Qihc1Hdg/pxYVEDsZyfeXk=;
	b=GQORF4/p08rFMcfEBL+acy9TIB+9kWV6XRLlwp9y3wZ9mMQGKeXg/XIOhu8H6PZUgJ11
	 XUs7a2qn3pKDdfs/CEtd/LnXBydglx0Et/DDes1qILT0hmepLz+/xtHiM4AQQrTqgjsLY
	 P9yOWDjzvO6c6aMkoapNR4aD33aIWNDTtTmiyLpnXjB+LqYQJCed5iF72mejq9sCHym9J
	 Nz4L+mTi1b3mMljiTSw+3SpKTc5xoWzSWtSrVceVCkhnSMsbbgRKLVLnfRXc4ffSSTBLS
	 9cff1wkWpBuZJy8f23zumwrVyj7fp3y4XvvTmp5JIsp8pzLUlLh4YMv5DaZxnOVrCuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMThpOdK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F6606A32F;
	Mon, 16 Nov 2026 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMThpOdK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBFC1F000C4;
	Mon, 16 Nov 2026 14:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838530;
	bh=57JBd6NrRiA+/jRFCy9q5Qihc1Hdg/pxYVEDsZyfeXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VMThpOdKIvCTkjd5IzblEqkc4xNi3tGTWkBPkMnVEgyRynm055uP7j2hhaZQ1Ygc6
	 HqwAw4t5g+t9iE4e2uXQrLgphwNdjZkelxxGzXu1c3qe39LeyPKpjXkk0T+lKyW5lJ
	 rVd53W+2CxXMRdWvsf1g9RutCBp7nz/GoMoclEeAy+SwavqtAX6h/rDuvcmuhbfTV+
	 G6gpxZu7UXNl7p5WvR+UkegONQNdmDwSI/6iFDjIpNNk9t6H6w0YmeBHo71XtX8Y5k
	 /txwG7dXet/CppKAtIm8Gz3iLuHHKRew7kZ1nwzM9BTePkZ+W1BohRqchH9RqB2lYK
	 raABhBOK45f8Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/8] dt-bindings: soc: synaptics: Allow SL2610 mux controller children
Date: Mon, 16 Nov 2026 21:54:39 +0800
Message-ID: <20261116135442.4827-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

The SL2610 system controller includes selector fields for routing shared
peripheral signals. Allow a mux-controller child using the register mux
binding and show the shared MDIO master selector in the example.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 .../bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
index cdf947cb3e0f..b53a62bf73ae 100644
--- a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
@@ -45,6 +45,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle to the SoC system control registers for CPU PLL bypass.
 
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+    description: Selector fields in the system control registers.
+
 patternProperties:
   '-(pmux|pins)$':
     type: object
@@ -136,6 +140,12 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
 
+        mux-controller {
+            compatible = "mmio-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0xa04 0x10>;
+        };
+
         i2c2-pmux {
             groups = "GPIO23", "GPIO24";
             function = "tw2";
-- 
2.55.0

