Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567954;
	b=aH7NgAu1qDw4pFw61nPWEbDwHydqk6yMkqdLutFT7aHFNHq4yhy3WPOW6xIeglBjc1yX
	 Ju2llR9g1TAbKO7amOQN1Ed3+k7Rh3xMylYtmaaTh5Mal1taGa/yrJ7n4bvBz3RpjU6SX
	 uW0KgwyK/dxD+wZNa4DXovuTVMskM0MLmEUeuvQB2i+Lo1KsuvnwrUJgPcDN3d3MK453v
	 WoemIqzLVWvwAMukeCTDuaZ3YmHcWusqnKNs1xQ3hByd7/eNU+xCNLWN5FP3dQu9Yn0U6
	 KlZ2E/baenoUZEQHJmOCPPZE1ziLXPL029nRHg/5koaeJCDB3B67IyLDgmeBH1IzrVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
	b=Z1EfWdtnhFwoxHXX2Okdn0ZiRvJwFHvyjnLTRPdaqP7osI2TWc9DS+W/uCT7H77eLsMH
	 YtwHRlnA9KME80aLwQGiUyaOduyobUBoZZKiKVGAhkSl/GujQDwpTSjGo1+48m6xMIGtb
	 VN65TXfGh9KW7Z1zZ8Qv4kJsb/y+AfNkzBifB+GZhRAUZP8ebtqGalx8lWdh+UT6tY5cb
	 wYGK1CDv4W+CvWPEznIUTf9j9rg8MoLzixsKC1Ynieg+EeWIUIGDsOHQyiwf1iTvVgfru
	 hRHBOJ4Q4YmqwCdOaLW7kQEgepsOo3COBM1cStGo0ba636ogtTs3ntyFYejbEDaC4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F73606A890
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F73606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvggJcHF
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1965145e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567953; x=1795172753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=BvggJcHFAroFul6B/s8V05DSEmo3NTfrJpxWfO+JxblHI8WNlizqIMLtiemMX2fH0v
         7tiNn7t3OUH8KBcRvGsku4+AQMCHOI+ZMBiovaswKSQoTqKumgQYkWHk+Inze5S+Xzd9
         Pm82LolSRrWxcFEsIkwfU2m+kpThTQr+VRWFs2OG1xn7qcQriUV+hqJC5/t3xyMMvkTr
         6kOMWDYyAozsAUZ9tnZR6dhhFK/SHb0BcO01dQGc+cgYdet0l8zoKVKEDGlTGUafIsf3
         MCfEqpkvBbO+URvD/Fca5/dzu0kJvu+4wq5M+bji1hcH/Tvvi3rfXT2jcdoFbyrwGXY6
         0dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567953; x=1795172753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adqH4gL4dB0+FWqAngd5GrykPAAcVtJ2pDUv7Soqjb8=;
        b=Kpb91uWJMasS/PO/xsGKVjUCiNioKU2H8pM8carijeXrGmbZI9Ux/Z2VcxwHdtTFRL
         FScXTEG9e5dTFfI9/MeQQRm4/SwvZPOjwnJduw+Zhy8u17fGxjuC92x7QIWO1p6bBVMP
         Nj8JqP39sNPyVd/AK2Av2ux6st3s9nfS7Q2n6QIqA+gZ22sz48TYUy22Q3Gfu0okdpkB
         eQNgAYMSS3DRW0awTqpCkDEDc+CqOU0BrSq2uxs/up58Cs/pYjK1r361JruJvCqs3j71
         5FA+u5PzhqYa7hrLvQG4JpTvYrObiiTwc0pu9pLVo7t1wdWQiB1Bt9MwNaQHBqiDOn7B
         DeAA==
X-Forwarded-Encrypted: i=1; AL+hErH0qf+H8Z9cyvwdWgqZaET39YjGJzPXtMEb+iJuaJw0tElzJntwyrmjWXODgL6NXiV5OXydKClX7hYLZuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9//rCsABctjs1Iclz2p9TeP9jtrcH8SaKTnnHmcBY5z+2mCy+M
	t6PlGSqGZN78GdQxRkeEDGn1nAVSCpSFFD75wgw/NsK9gaR3VgIpVGMQ
X-Gm-Gg: AYBFou19ZIqCLQVACPPAyAqmB5fBjqKy+KUdWrKyHHA90t2PScefwcQXkIWWICrHf8o
	TH2KvO/80h6BUSGBxxtvooRh4ayXmLj0jZyKJ9XEqwGP20o/V9bgb4t84AfbjrPuo+pamSyMRrU
	R0ZU4dvkVDK7l6gm4FWI6A8pIiO1q6vBQWu52rW7VaOkFfflJq5DbTjtUinEKIPvElhpDZ9X+Lj
	FAf8yiyynUXKajg2R+FShUd8er3HZUGgBmBE938lvzvVp2f1RozP4xrpy8/Ci/xsxkjuG8q6+h9
	L/cgBylo7wTCYYWOEW7HIp+ztgXPwu9Tx2VUMBr2z2/uqh/KFs1J/tEvK9u5Jw5f1mH3ev++R1w
	5JzaCSRXHids+T+4lIcKRsrnejfJoLPMiGPFBXdQihEKg1pxJo2lo91OabtcBGYcR/73CrOdezb
	OelO8kQuWBxRQnK+MlNb9IN10hKd1sp5QxO7IHmj/DIaWKg8sHSj1/BgfV5/4yVEm1y6XGTXVn6
	H0XqH6rY3xtTBChgJqbRy/FtUnlkiOeT6GNyUyeG46J731+aoLfzKgmKyWD51LdUVXVSmn7SUlo
	cY30W6pOIh/luzbTWXmRMEOFIKFcyyKhe9PX7dJOCrGcidHdGUrBkxfqYhafKm9OrB60
X-Received: by 2002:a05:6512:3c9f:b0:5c1:56f6:2e78 with SMTP id 2adb3069b0e04-5c170b36c01mr760155e87.24.1794567952545;
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:52 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
Date: Fri, 13 Nov 2026 14:05:43 +0300
Message-ID: <20261113110546.173624-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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

Document the optional "leds" node supported by the dap8211r phy.

The phy exposes three configurable led outputs, each of which can be
assigned a color, a function and a default trigger.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 .../bindings/net/dptel,dap8211r.yaml          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
index 4cd0f9730d95..43425fc8e96e 100644
--- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
+++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
@@ -20,6 +20,7 @@ description: |
     - IEEE 802.3az-2010 Energy Efficient Ethernet
     - IEEE 1588 SyncE support
     - Internal packet generator and checker for link diagnostics
+    - Three configurable LEDs (link, speed, duplex, TX/RX activity)
 
 allOf:
   - $ref: ethernet-phy.yaml#
@@ -28,6 +29,22 @@ properties:
   compatible:
     const: ethernet-phy-id0008.011b
 
+  leds:
+    type: object
+    description:
+      Optional node describing the three configurable LEDs of the PHY.
+      Each LED can be assigned a color, function and default trigger
+      (e.g. "netdev" for link/activity indication).
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        properties:
+          reg:
+            maxItems: 1
+        required:
+          - reg
+        additionalProperties: true
+
   reg:
     maxItems: 1
 
@@ -49,6 +66,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/leds/common.h>
+
     mdio {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -58,5 +77,24 @@ examples:
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

