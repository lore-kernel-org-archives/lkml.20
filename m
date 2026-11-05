Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873008;
	b=ppoHGTO4MALdyvPjBxj7R462ZfHf3Yt/wLYwpMblBAKKCu17s6nFmtFlJOfE2bvKoCWM
	 K6G/uE2Q0iJdqrsxwK7NQNXxDGMna6k06aiiMOb5KqP7fZ7tJ8R0in7h84oPrD5BYXDoF
	 dy89u7+DcuMT8aYeBEH9iJfSxkVoRSN/l7aHHDQO63MqGPKEKVI8D3tQj417Di55p19B+
	 GWbb7IhFwhh1Imsf0hzdELrviyXDKvHOSxND45RYcYybqUwF2f+cRCxsXiQPurTt/1rX4
	 3CfobRlSokYjuWvx8yMbTBJEcA1s4UQdIKd5HuWuMtboXioY59UmeWcyOP+Lxc8WAHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873008;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
	b=XUn72SnyhAF3HZb2KkFxGarXkMp+t5ANgssS8ROFFkskhor7ZrEnLxU7LzabPpP0sax5
	 oREr3iuUJcHelNqjWBCD6xFcdUetSYtxVrS7gMcamSFVqHMxQVS9vwBRMgV4+HrDcfO5O
	 YrVDpCYUJZZ1PTEn/ramquMqP1lXPUqlcmWtEM8sIU38eCgogUMBOKqU9IA0GDtrEZBHt
	 VkGivO1matylRbJRxMJjGInoJHqbwLzhcQLRsCKbpwKkinLMnrS66oHTZ3g1yg+eWJLda
	 mIQGC8FjCYvFLuqU3Gc4YIFPETzVS+oJ1tE0kQC7tIt9UNQ9t781ljWhKpBXBsZ4oxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A9606D809
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178A9606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4947435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873006; x=1794477806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=2UExbsa9ED58ik3N4Lh3E6kgsDyT8yg5sNfuTt7rbR+1qIbMJr7al5xCml2cgZ0UIx
         JGP5XZ0CGLu+bajiHnhgZyge3LIE3Br8x/bxFFZPfBp0Da7yxEqxOvB5e4gOx4paWt/i
         QxKZ8cExnIsmO1ZrQH7kE5GWWL0Z1q+nypS7TY81eWTmD1iCqeGhxsSBOmDTCFEtRuEu
         ycZsI1P+kXmQWzs/xv5GRcyenmU71dasudbseYw1C0lo6hS1XgF7odOY3HQC+F5hMCzC
         E+08hFpUg1clMg74D4Dzcmt6o/d4M9aa9D9CVVKoR/AF2ayU3J3naKqqedd1dwodZedz
         Z0rA==
X-Forwarded-Encrypted: i=1; AKwUvBzf37jZhig8uc7jzvebhOeTrAzHzH88+whfvUFuC0qVaK57K9AQYDBqajsV5Q3mUbEbmfooS7cm/L/lk14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/avNiwA6myax1BYTAwhFne5cmYuxg8eBnDKmDKnjAmJNeBj88B
	YekkUPyhprO++gDB4rf5hl8NgHbNNM92RINwS1vAiS88I3QYpY16juix
X-Gm-Gg: AYBFou2XVUT0mWJpzd5apImuDPJ9B3dNfo4LgkfOuZz9Swa8RLMl2wz1Xz+res8R8UT
	5zXJO8DuQDmDsTX/7NWIU0lHHwvrRZKjabXtrgJMFsLXs2K7M6bf2kDCFArbcC2H1lAC8KQU4VX
	huxz2xtoKWHNTbshFTivcU8ADGLDGyO9PAd9HKDG6KMUYxcFVbGZP4C/9EcCB1oMhusjRi1/e2u
	HeeBiKQigzCslQYFpy4ttr6wihZCMoaXErWtcF7jqY9e2wk76PjdPcfYD2O+xcuXcGm/+q5FYSP
	5JS88JEFBunl9Em+cHz9yF6wWv4/FkBRDI3+2x60OMxq456icTD+qjtCnpvywdQRe98hoImljoT
	SXgNQDJfCLutIJtNy2DX36MidokHyrSBOsOQuuVFS6qXJCKP+QEK8yFXgN5BAc3dDiLPOXrfD0t
	uUnkoN3Sxq+jX2PTBAL9s56dSrf87h7w73DKPcPjguC26XCdxS4b57g2GgHvXo+mG/K/+MsZnw7
	kVWH+4zcKwLXpvH1h3elVJnkJYsaQJj6XxcrznFOjIDwkjxTrEjJXEDLtE3rQdiU5vL/mb+0J6y
	f+XsVsGb7kNFKDMdcoadmATrlROnHXI5YmMOAJF5bDr7lPxVkEFll6I187cHFLZfEOgxk6a3GXr
	Yi5J/8vddGHvtwNcKBnsBYuoVPw==
X-Received: by 2002:a05:600c:45d4:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4b55de92333mr36628635e9.14.1793873006268;
        Thu, 05 Nov 2026 02:03:26 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:25 -0800 (PST)
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
Subject: [PATCH v6 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu,  5 Nov 2026 10:03:16 +0000
Message-ID: <20261105100322.37816-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

Assisted-by: LLM
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
2.56.0

