Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572336;
	b=NLVzjuteu5H4FMPrWVSMsaLXyXWfsHrdEu5Ha39RPVK56pDbAL4Xcowgbj8/Ai1vXZiR
	 LnYZvstJEVNDw3+Tm129VTphrslF4zNYolB3Dqh9vl3j8roqOB28gkUGN28tqWk5gng3x
	 g4PQW1GqoAI8Cv7TzNP5Na8n7+c/uXqwTDwoIFBItgtp+NbsqNoD2j6FXZaSI55I6nBQv
	 hiGbHk8UHhnrO7SHle9PkWx9outGUIwEHFwIEQNPhMQblk1AopIPSbYRFaQlzC6yYjPSj
	 JRcqkPmbSiqxH7XwWFl9zwd/WBEu5RkP09LBQul1lSr0WEnbYrYJcuQnwaoPXCplfIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
	b=OgG3tfkLOFFcLWNEa/jffsypm5s00c7rGkv7MI4S2OlJ1I+LOOj1tD6jXd6CwKGMtq/L
	 3Pu8Bhnh90+pm7nWrxlvzPccm+O42Oun7eJpe6b4n659/G7yzHoKQjAqW504wHbnGXSGb
	 OUUIOg0xERdR1xGITKuSh5FoLWzrqd3CswHx16Z2TDYDmUdHTpG3XiDs5i/Jb2tW5RPh3
	 VgfA/lg22eORDLZP81sGbQDgR2G76QyIj5yHxkn3MHhUlOyS4kfrclKxjoFricLs9ogoq
	 tnpHXTbTdt3f+iSJmX4ujZQo5td1z10xYrKeWxy/4RJneTPhCOgq+ZOMomUjx/kDUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C3606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470C3606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c445c95d553so165959766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=erPMA1s3GrrjDIAYXKeMxd8td7q74oejXK0RvW/RZfA=;
        b=wiBADLz8AjlYYF6/ScGhSSBa9gAWnDqsB6I7Omm3olNQKDFiWG66U3cOykNzZ8tysq
         PJ2OmhkIFhIGcdCzyxOJhBUh1to7gqGyemK3o3GAmLy86UbcFjRWE3CG6gen+iwWpgbf
         ayKEAFpMfo+pGzqq6a2yaWkL+eoX7NWL/5I0Zi8I0RBYBV91DcFmx/w99fvAzCfvb+rf
         OlzDNVW3T2nPAgn03eh9zElUUXqr3j0Caa4dmTOB3fCrhFiGnr/Dxj0ZO1lnk09v6ZJB
         nldqgtxsmX02IqelNtJmea8Neu/YAb92xNl5VXEk2tMZOYnC1Rl0RlmQctSBV7XFs6SA
         oZgw==
X-Forwarded-Encrypted: i=1; AL+hErGmpduugWkx4QPqVhTpYZqUeHaAvr8/2bZ7fRnP/cfpjUt8XaJGU3cexSHHlba9T80OyuqQMAZZ2sgNQsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98xEoYXbNahUj95XikaMAwXlEruSaWMIJb/P0GvZ1uKTCr1CTn
	3vRzSWlMqCl8eV2VVbQ+UOygz5OV78uJexs8TZ+i1Ge+pcyVDxnQjTbt
X-Gm-Gg: AYBFou0F6hWMqj+Zw2W9d+hQ0hr+byo1P00hQn3TMz7K2xYjUjEVBnqa6XU3s7OThUB
	3WfuOkdcrOD4aa+65WV4QTtD1P2x9ShY94G3LeSvQLvvlRLmNGmENtz3VKvZT2NtnpQ1Ib+pu/u
	frbXN6V5uvRG4bIO7YQxc040xEutkJE2GgYCGrVqiRM5QAJ/3f0FHA71bgH5cfORn+8VwUnY/ar
	cmTYlydq5A8mPLhpzgRX6FchM6W1Mz8f3C7S6wzyndSqFSyRIKqNned9bTHuhIZ4XAM9ULJzevX
	Eojl5IAjAJrIfYQt25zWuwDDFchLkeZ0Cg0R8xFb3fdBewB4wxlogryUxxbG02I172AApKseiWs
	RA1Xl0Fp5544LZniZoQnSQC4XCKxpEAtYreiEXfqYYlVRjnIJo18n6XQxQy+EnaPeSj0VRm79/2
	DiQpQu1DfEi9pniP8KpjM2cpbSPjxEKNYMYI7k5JEH0sKaVkETLGZOSm3oS5giHm2/dg/BM2zy4
	b1RY7sdg6xCiuQKpG7rGvr1bhKxeJsKVVtwPl/PHHDwYbuWw/fxxCtof8uEZrGibZ1Nb7MjSTbh
	MSRavtp06E5NHbo2mzQ1E/kbJGR9uy9MdeEUoRtlIfvDM5MQjEIOiOgb08IfLDa52S0aARjZlbx
	5ex4Al16eCEiDVQeZX35q02dEVBF8o9TQP64CgT6ZwRcTLg==
X-Received: by 2002:a17:907:72cf:b0:c41:e75e:5889 with SMTP id a640c23a62f3a-c5096398b58mr185619766b.33.1794572334460;
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Fri, 13 Nov 2026 12:18:46 +0000
Message-ID: <20261113121852.334604-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.1

