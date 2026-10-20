Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489033;
	b=L+2tW+dxaOMEPAyOtuUR1+zF1GihFU5euSzwAvY26HOdIzuFb6e/MTbc0fbWG4BVACFE
	 LToSJM3QDdCdNlpDccxnOaviD/fc2IkRhv+TGZx0VMRNDh9NsCeCkDiP7c4WJLMStqjHQ
	 mEee54MMOlqaiQXh8SZ11LrLcytuMbPtiFcgQ63JDhWxiIZFfJRJpPbE9j8O0/YtFmC5R
	 jfX7MNrDTT5hUvYrR5qnUTLmy/XXbqGiuHh1521bcy/bszTdNHrq/uWGlqQxoNfYBnUsy
	 /6GJZgBTql/t+cSl9lQhUehXW7OcfV+KWp9XRamMm1xlJyG3QsDUdZn6R1qT9ZokQvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
	b=Twy8qp3mIbKOoFXnRskyyJpxfJ5LDdi9znrGPeBENWGLhcruGAFzXkoxywrTk9flUHSu
	 FEadXpbAzvVVf2bJittAmotxXvVdOhZTlk+j0BrwriPhQXBZcSnbEl/LJVFCwkmK36rUf
	 B79+kT87msgpFqTfaPoubMo6fwAEbf2Y2YXuuAEhm7kIo1wrL8yjttKbjYgf9amwWAJIR
	 JBCbj3KQ/Fsy0NIKFI9IujEWzFS9016LkRiLc8AUnlz3RZvUpbuPH5U1UE+VTv/YREPgT
	 r/YVi2+qc77bCemEh3tvMHs+XOnsZgAs4wr7FqWMHC/WoAk/1fyNO8NcBAR2wiATmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v9e42P2A;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0C60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F0C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v9e42P2A
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4322d310e7so293750166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792489026; x=1793093826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
        b=v9e42P2ASSkihNC4YkrSR/E/sDVt0s2qV/m+O0r7dcErfSBASUbr8PPAvzNF8sIi8W
         tPcYDtC6my00/uciLmWKAehRS+R0yx8WtjBUIT6HmafA4G86s7RbbCNaeNqq/N/sUg/6
         4efkr9P/9ImAyEl+vDVR6JQIQy4Pe0Si6zs9TsnVsCnhbO4Pvvj+TNqtVU3OfElnx7ap
         xIEx0m0OEYj/7QqqFHrx7TWq/6ez1y7NOiu1HF9diNhOQficqQG3/r6ySMMCY+3Te8k8
         TZhj1ZT8OCglQyBklN7DIv5+TmvxgftBXRo8WJHQxb0V+31jn9q3RrWH2sNx5oh9lo79
         9e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489026; x=1793093826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hB8pffq+inNrwJYLPOGvC+P452XnrT72yy2Y6Woy5mE=;
        b=SKeZ7BNcfocZW++lVWpBlHVjSxzZ1eYXPeh0Ls8MzI5N/ob3ISk5lio1do5uMRX4UZ
         XaPIKaV7UojYF7Bj1BYwDbpiN5yHHJ5ks5Doo+S20zpcGkS84Ls7fegqxbq4nA4Suxjq
         0WbpJ78MjtAyVHvbYZWnRLxI60G9HySvFjlkhvk5ucLjUWBTzAsR7z2QtMgLIi4OUZPE
         S3xQrjgBzbYhZkSaDKakGbUZaGH1dm3YPPziAPFGodofiPy1dv2FAMCpZyWAnQ0aAxWv
         sxmct5epcXF2Lna8bBpuMv3JcxXfUFB0yds1Ctol+LggxHaONMHn6KNqgWvAGqWLSJpD
         wNIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4BsiYQ3Ps3mTMpLJMZHv+yN9XR+EnVdEaqxozFQczBjuolxB5IhwHSWDeTVR6i7kZatRrTch/kbfvVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbd+ZXkVy4O7dYl8H/rPZ53npfPYeP52Iat3v+Os4qrr2oI2G0
	0/TgICrWerF+GQhuDNamWj0Sniiqd5Ho9Q4RS78HOLhqvT5xx8+NAgEPPtwWBO1ZqzY=
X-Gm-Gg: AYBFou2zFbnw1CM1gsJvmLUowyCXNeBe15/xDec+32qjoHkjQaHNqWZADRlKVFELid0
	/vViBAGRN7mJbbNGZIymBKFVtyq0FaPjfq4xS+GHkO9X1WOLOKclo9jzGGcASZ/uY7C4zTE1BPL
	/iyZxxaOrXFdQaMiTCu04aAOGlIvDpmV10C7dG7RM5R7evIKVqZ7T8VoeYQdnCCh1u2QX3MrjX5
	Yf1SjLQT0U0vhiX1o3T3LhWuTy8m2hf3O0LHgDMuoA0DIG6/1ORAOZvWDntNai79GIqiDt6PJ4j
	leItK8No1aAyxciLBlxiUwQows5E4NsOPVG9Khv5CLdiJ5BdIhUEF2V63tXfURLvr3N6gT8ZNfT
	NCNl+I1m7ondkAcQLDCT9mPKa8jm4+7ZTYKePZnIDXBDICQJNehwt/dnY58ysI/Ezb0Xtfy6KtX
	6A0zC/AyMRCGi+FOH7lVQ6NOl747fYs2sjo+8Gy2YOwkqgVygRkcjUBRAm9QD2Usgie/bstVCOL
	t+7fKkHxjLz+omCh1VK1KHZlGsiXu7QI3FaE/2bwp81t4T/ogq4DlrKooWbRsYkBVXlmUMzk+U9
	FQoS37ehFMclaWvdbRvSJ1xo2JNwsWfJvhVOHAgmVi/hOw==
X-Received: by 2002:a17:907:3e83:b0:c46:6a50:40c2 with SMTP id a640c23a62f3a-c466a504adamr73352366b.39.1792489026177;
        Tue, 20 Oct 2026 02:37:06 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ceffesm462730966b.47.2026.10.20.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:37:05 -0700 (PDT)
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
	lgirdwood@gmail.com,
	broonie@kernel.org,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lrosu@maxlinear.com,
	luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v3 1/5] dt-bindings: net: maxlinear: add MxL86211C VDDP supply
Date: Tue, 20 Oct 2026 11:35:34 +0200
Message-ID: <20261020093655.344585-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
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

Describe the optional VDDP supply used by the MxL86211C PHY. Its
voltage determines whether the MDIO, MDC, and MDINT pads use 1.8 V or
3.3 V.

Existing device trees do not describe the supply and rely on the hardware
reset default. Keep the property optional to preserve their compatibility.

Select the MxL86211C PHY ID and nodes using the existing MaxLinear
broken-interrupt property, so this binding is checked during normal DT
validation. Restrict the new supply property to the MxL86211C with the
compatible conditional.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Make VDDP optional for existing device trees.
- Select MxL86211C nodes and nodes using the legacy MaxLinear property.
- Replace the empty then branch with a negated compatible condition.

Changes in v2:
- Model VDDP as a supply instead of a regulator provider.
- Select the schema for the MxL86211C PHY ID.

 .../bindings/net/maxlinear,gpy2xx.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 8a3713abd1ca9..53f430e121510 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -10,10 +10,37 @@ maintainers:
   - Andrew Lunn <andrew@lunn.ch>
   - Michael Walle <michael@walle.cc>
 
+select:
+  anyOf:
+    - properties:
+        compatible:
+          contains:
+            const: ethernet-phy-idc133.5400
+      required:
+        - compatible
+    - required:
+        - maxlinear,use-broken-interrupts
+
 allOf:
   - $ref: ethernet-phy.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ethernet-phy-idc133.5400
+        required:
+          - compatible
+    then:
+      properties:
+        vddp-supply: false
 
 properties:
+  vddp-supply:
+    description: |
+      Optional regulator supplying the VDDP pin. Its voltage configures the
+      MDIO, MDC, and MDINT pad voltage and must be either 1.8 V or 3.3 V.
+
   maxlinear,use-broken-interrupts:
     description: |
       Interrupts are broken on some GPY2xx PHYs in that they keep the
@@ -45,4 +72,25 @@ examples:
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

