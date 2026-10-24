Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815250;
	b=pEK2BMgonQeEcZ/HfSmWD6tlKAjkdclzTseDyY1Ph29KNA/BMtt4KgkApUbjGuB/znf9
	 a8GWND+7kIS4fTgGRTdUzNSWjovDroO/6Gj9PlSJHNSFWzMD44dhabZQJ+IdMRrYht+mM
	 bd8qPMnAir4YW+7qDACz05TgnIh8osTrf6wSuXOto14in0txGacj6+xowqQPMI/m0dDvY
	 uNtCNkHLyRBLYN+vJv+1rZwvyrpimJ0w6nLYjEBhAsI/p8plaD1PbmgrM8J9dVNrXVcpQ
	 aSANRoqdHZvE4MZ1y1Hdc2CR0FNsPRYcqsrjLOB+C3K/VfZDPHa5ksBg8U2oxaaRjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
	b=FbY1PcbruXFaKsvdllDW3jxybVslf9Z94d3FbMM9VEGfoD6uFEXbEX/MQvl1jYG+eMFV
	 gDW+CRjlcyFtge9c8CiN0wBtJ/HJvYNpOEBDcjYrBwBqYdIBJqjWVJL5THUNcRL0Jjboj
	 JFWmBD/WzBdzotv41+jCbzXJpyv/n9KneCFLUZcX8tJxKifDw3wXpq93xo2lCwxA0S8ty
	 Qq/mUfan5YgTj4E/Yww1deLyJCBGEJknxNPATSf3abapVpwIwJ7niyvG+8+JLOlRtLcdz
	 LquzCdtMx06YECChrjqrPnbpQCoLTU9xdqxfG+kMcWzN/LvKm8fFgPQp9x1BxBRDrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD187606A328
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD187606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so14879655e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792815240; x=1793420040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=Os21mwMzsXCBmyGzcSB//pxKjuPPNQtlMHyV5HZEUycbuYFqplMtYiil/yIIRDD4pG
         ZMktH1avkIIZQbOBscNlCJXS3t5TwzwSKx0D0Vuf/RFdmXjn/UDizoPF8yIA5X2mayuI
         tIqo7OKFrmQ7wEzGip7I2QEQfMgwmGKZYMuzp0ktOkKyz8lL38MwKqAV6N7bwMpyh11u
         MCclCuNeyrPpw82x/LYLrCenNArl2/8gGzvUa5sz3eb/lU450+Dde5i12jvnMAOKKSms
         brtJ54qv3K27dCno6dJLsRGhttNn84om/r0VBYapQ5TZObqGQvPMnJ/c7AOAmE43axe9
         SdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815240; x=1793420040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=uvdJCx9Bk8/7YoKFvC7gmbVtspcfQHWFA9KIhgqwaSXzFZbV73buH9Hj6rP6de/LTv
         CNQehoF84lGlWG0OsHBVe1xQIzPtmMDIqd7JH0157zjv0jJZxeLafLjNDSsh5PJ/qFIb
         TVoFUi/nw8dTG22iCHU4hJUiT3IDXLyCUFrIkSxRvoNrJa/QxaLrk4S51xYt6bBEdlZ0
         d7RQcPHoJg11QRCV8IWW5Hm7x8Mx39j9kQS4anffQo2LShNJe9fXkY3hiQmBuK3ZVjwV
         cYGVngFA+pZnUgf08BBit+VaGA9iSVGM5IspsR3/dmqXtF+aYYwxdzwpDu0iUyB+wtnA
         FIIw==
X-Forwarded-Encrypted: i=1; AKwUvBzj+KrXGg88OFGF8adJxDZJoYIMCnwsz/W19ZEMCCpS01+9MsrBmqvhXYqWzVCjXzq4ow+JKK3vY8fM0dQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWIA3bz/j4SmxaUDzXLAS1zOFemeNpcrbDbdfQIPvxGta35zmg
	5s6NRfTQVWpq9GYaW0kbchunAG4cvrqcdVVDhkHjIZHzZcx98wTt2mv6cL0W2D9kocc=
X-Gm-Gg: AYBFou0c0kXRI1tsli6l0wrelTaVGJE6NVpBe0r1slW2+6z76JsbVQ3jtdlYxl7iJR7
	EOt5AsA1L1bFLASShD9Gg2TePMWiiIE70IAXv8fkOKeRosGgmXuvH9X9GtHeuEj2l4dqGNsBwp0
	h9ERnPO/LgkFNrrUbKtX9vWRdFJaqekPyvdsV6YccjInWzM9CMLVfdbMevQmzA7HQwk8pLDAo5L
	6P/rdX4YL9HrR1Ya9W3OlnyTik8C7E3OnMEivKa2I24XRrkDY9KDiHNeidM2QdsKkL1zEJGWtiB
	s+4GYdqPZ8t5S8PW+ZCy6aOymQ+NPGsoTPIzWwz8keuXEGvHj+Mi1o4rhqKrazU+TUZKt+rLEDV
	cAR+NRSVHPKsu4MWGuuZg4ZMWX4fvTJoqDSHYgN/ofo0zRLq4Zl1w8ESfjgpISxbblJAtQq9J/t
	E6LUwkLqcPI54c9k4tVNyKjii7ZDj6L2l9u/81K3BF8t15gewjfsykpnJVMmmx/0lKyeVwKnBs2
	re2+2wUnBXTUJFyVcaZwsqr3ZD2qHrfZ8z0txO6Nt079NwcjMhJW1LBz5Onvw7pKSg+Zq0/YA7e
	WYDYlQ474tw=
X-Received: by 2002:a05:600c:8581:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a35da23c55mr463285e9.14.1792815239806;
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm26332265e9.11.2026.10.23.21.13.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Sat, 24 Oct 2026 06:13:56 +0200
Message-ID: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: none, resent with 2/2.

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

