Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915885;
	b=p3oSCv7DRA16n+6jxRvEad6nLVhR90Vvw4PvHmGrLeugw9yBshyI8RLO+5XZUcgPnAyl
	 xyyrar/Bo2iAaS/XaY4+H71RcHq5Hf42ivADQrJuooF4gnuf05dFFpXEpPtnGV8WqtKbP
	 pSBNWa/mM1hpfAEvIzbtuCYUU4i7TaM6oxetihvv15tXveCHGXYM20+fa5BqtMt5xnLCo
	 MYS6I5UldsBuZ4MdLaIpAd4alRsSupPeAB0o6+eowO0hE/fydvOgN5pyjxSvu9P40E8dE
	 7NNe4cRqsfav0W7LGewbf5AqiMVLBRQtrIKM3NV+UHL4cc3XDkwK8wN70YROFGRJhdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
	b=cgbeYIfQnw9/Tpcd1Xb6drLHLAWED6DfWJONz7XMRor9W8xHSC1ZrAFRSy6WeSz38hWA
	 EPoUq8l4Mf5e8mFgKew5LBpqh/wg86ZhoDD6hhxq9Si8VW6UZcSa+ooHYI229FG8fNXb8
	 BYzuJRfQt5h1L5xhHIzuJGY/5yl8GqaTiySZr+CDnbLd9Azl6KbVpAeqlvFxrpy7DNjXa
	 RET8JuVMkLvq+pqUJFxS2BfLTgrocvXuR/Dj3vFdN4txwe0qW//hVtL85BU5JxWCOYxkq
	 1bSTlzAfAfdy8Ze8HnMxaATblx3oVhe32K9qRhwhPUR6Y8DVqPwSy3T7VM7WzjGrvhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAA606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DAA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teAlEZjB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso855665e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915882; x=1795520682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=teAlEZjBHBOFG30c6jnESNVtx0dR+W7j/m6jBabIrj9T8QM78LmH+y7T2ZjbwACBR/
         WUxAffwVO+DBtGlcW9ZJ/66HIB5qLhaz/QUhllkd9YwUFFfbthoSp1PFjOph/4GyPzJ3
         GL+/yXmsuQ06TfLgAfx9pQDO4Z6bGTSmHIVWKpsLb9yj23esozVAB4Xul8AjWSkoAPJd
         HF7Pa8dlJrlKuzEdopGxYz5h+rd2MGyULvgM176kJ9fEHnPW2yVopR6q/472n72vsgYb
         UPkf+rH5dLC5jYST74IqM67p3DuZXARFVl0ztSL75fOOKOPSj+vNrBbo8pCOnxNpQP1S
         ywZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915882; x=1795520682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF/CdrmmiMioUkw+9dcdPExNxoPEV3MzGTSK6jiPZA8=;
        b=LwTJ00gInxzTIJamGwM/jXrmV9JdVD4PXZn+s133HMRUJMbct15lZ2NnrS6Z7pmgHV
         PZxGfV1BR1pGjgfnL+4vCww1H1FO8VFgduGrj7B9ILF/QfcHzddpan4Tpa50DfkisrFK
         4QMcrl7L0uNhyo7dzZHT2ERwUNKp8pL8OLm/udTq5LW0oBgG/GZJwTQIGYkJUXfyZfgt
         K4sukYj+ECT5+Q5BRvVdwKSx4DXF6Npugizw6cptD90n/zp2VnVdammV4192ZRhogSPt
         EclGpP5PwvyDlzs/RuNM7FrML9ZNL+YSspJjQBs0L2l5UN3uQmuN4A+0Px+80FqVH8Y9
         tMBg==
X-Forwarded-Encrypted: i=1; AL+hErF85Zar7taPwX6zo14WeA5bPKq3NMQsbHO/u5X2YLt634lvIpElc0nTXfRj3mk90VGsPhmGwLAy1/XnzCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5jAXHPfUn4gDjVxltrLqQVNnqQ2C8jxLLXJbdN72QLE5/Wo1f
	u8cIdrPEUxCjhDpakZmdQurXQjv5SitJ0sf5E8inP5kgXq9WtJ7ojmMF
X-Gm-Gg: AYBFou2NuyFHrSaHpCIOxuz6YikVDJYFvuieWAo3qbX7HoxMfi5CvlEQblfDhP8ge9J
	ySsX55uVZU9l4r/nyMZNgnA2eHB+SavNunYG7tWroSrLX466p25g4JTA6x/+hJkt1T9XO/w/vGg
	wbW49t/FPVh3YlrFe61Q/ArNgjwsstoR1BA0+MdLjGVEeUWmQ6ymD1jaqnmv5/1Z8ddPN7WvQvM
	/xCDSBkYsQT0l6zlgamNjvbMylShRr/nPb+WqeYn125/2SkQ35sJHGKkuBHUgC5TXxn43KfHzKl
	zk7XNbp9TkRBkj2GjINkWHlKv+ZSonB88l+XPEp2A6tLCE7OwgOrM/phjvPeyJGbIc/puQdHidt
	HZYPyB52XLBs7EdEijnCYcFUjQk4sZ1K4zfMNMFixaRIx61KWqpWjKxL5OeNMWL0HEuwx2y71W2
	NVvk/9HXsrg78gW5plTZDCnzP5MNU5PSQaGuY/k7TivwHG1A9j2EDNdSFr3SWCE3S/WXhuFD/El
	uvwS+r7/+zwEkjUOkx1jX2IzlxvSTCbaqjhoYv2nu33pVNb7nM4u3EEJ8DXx09+1pQswzddrC3Z
	Y+qxk46UIo2PariO1fBOOo4nTUe1ZqBvr/iN+k33t6J1fAU=
X-Received: by 2002:a05:6512:1103:b0:5bf:f7e7:85eb with SMTP id 2adb3069b0e04-5c17077ff45mr4913190e87.21.1794915882295;
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:42 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 2/4] dt-bindings: net: dptel,dap8211r: add LED nodes
Date: Tue, 17 Nov 2026 14:44:28 +0300
Message-ID: <20261117114432.2794961-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the DAP8211R PHY.

The PHY exposes three configurable LED outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..772329feda05 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -45,10 +46,40 @@ properties:
     maximum: 2250
     default: 1950
 
+  leds:
+    type: object
+
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              maximum: 2
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +89,24 @@ examples:
             reg = <1>;
             rx-internal-delay-ps = <1950>;
             tx-internal-delay-ps = <1950>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    linux,default-trigger = "netdev";
+                };
+            };
         };
     };
-- 
2.43.0

