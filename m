Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8A3D7D9F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701221; cv=none; b=c6eLB/v78AftymZxVhGALaZqpvdrecPRX7uBvs3ZPFRION22UZoV3p+Rdum3gF6WNEDQmuPWkbyujW99oRgdei8HgpSvorJT4tvUZosr9nrmN981UWCiHBHGc26+7t6AuvykJKCaMHp4ImdHqCUUIEWVdRV4kfi0WB2eb6VqGNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701221; c=relaxed/simple;
	bh=fhF5eyedH2gXD/2uR68oyWbe5657S6ghrkVsIg3OrOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bzn/I6IFCk00H3DJSic4OfOVguGOd2csi+WjqK6BPafid2rUGDdeFoA/QGboCyz6WmyOMrnQNtszR684p6L3Pln+LQQMYG5YLEbVqdkY7rJpvwrLGLflYLhz+qNHDJFUIIUmgJjsDM43f16n0C6ZM7CyWApTR1FdusPKu3LO1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=TxUc+/nY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="TxUc+/nY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso576525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701214; x=1790306014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=TxUc+/nY41pRjp5WQI0BvBfKtA+fXz/XFkf2p+7k5QG+s91Z2J3KqEVAUTcoW5/r3J
         7C2WlW8ytqnMGFGG2/FFP7PNrka+GyNDyJLnYSImNnRiZLkqhTCkDbG0ktnqg4VOwuRZ
         ssrWvKu0ZRZHtMGORfVYtck/XNpoiDo4nHhKEJjAShjVsdVc1r9YtZqEy9nOquNvUDj8
         bqbKw50sSQDwjogw8VchmzwGsiofFbywAleD90xezL33usnpm9kyiQcY0QxnZZ/nO1Rg
         3Jjq7hBIcwOKyjSd49xhOy/RmW8ippAr8FlA9dq0AvesfT31rLThlMAPCaUr0yVHLDcN
         yePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701214; x=1790306014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=VvVKwKwqRv5nJ2Ocdy8QkbEBSwOuTu/NXFsEziUkMZ8c4x4TYsoxob58H0LDkekQer
         JQ8UWaGZ/AublEAfM7zYYFbh85HEsiHPKShQXHBUzeKK1iDh36FLt1VdMfX6++uhusnv
         mGfxSfKjwCxtv8A7J9iYa08Jv/Ew5IQp4rVrmBL4Xb6Dl0lkUMSHbJdE5vgwQct+zm3J
         X3hizfj2MaDfkizwbCrr6aqJ6HSF8K+0OrEjgFaUPzlJ9WEtYI7sfneaH/PwmjSsGZ9A
         pZnZakwg9LjG5G21xguhLym9p/m5s8GNFjoagE2Y9ELvrypgLc1T//2r9W3O/QARxEL+
         pPKA==
X-Forwarded-Encrypted: i=1; AKwUvBzsx5j24SDjqBWSfzDzrvU4mvfdpt3ixuHQQUWmHZcn+OUidJHxp7Um2icV5PlGYbXB40FqCBXh8Cg4DVg=@vger.kernel.org
X-Gm-Message-State: AFuF++mM6lTby6namksNcoASkNwjqWSWslLDk+Lh9yr7qROiJ1okcDEq
	6DOoUhqpgEfytyNKNXMpUW7x6TC/7c+/7C/m+qoLIfvSfYDkLDiW5wVcXRYMPLI/AS8=
X-Gm-Gg: AYBFou2WLhZ2dLzZthF+Wc+uSGYfYZyXnNhv9PxaEebE6Vh+UejHkNnXpgg/RP15G9l
	jFYPsHmZLKvoMMgxyXEU5I0sMHx+D/i695ZTr1N0Y9oISar9wqbgVEkKO80K/tWkiJbUKDnBgAX
	Ujy0dUL7p+R3ZeMH8Jl/UL4dk0/rZcblgati6RdKirr6TjFisW3tMy8OPerP9xHGiTmJBj6rFWv
	cHvIAoTsj0v9c22N9AqKMsQlJvqlZkdNx4yn6O/xyCuHvx5QRrpeb+1+0utm2DOR0mIA2mXkR73
	Q9lHH0U3jR57x3kL4iFaxTmKHaJYzthOmflLeUg4u4RfWtBtpI/OV7VQ+ZLMhgVGaBsrndhMDL1
	NfCl4pRWQma+EYwhRtMhkdjVikVARr1/5+IR2ezfM16WjzUbsgbtE4v9PXywA1vYhAswyumrPO2
	RZc+b1UDDMAjdLe03hLMBwIH87ih44SEaUpbkPBd77QCiN4BL19ZlJp7sIxf1qG3IHgZo9jsJqE
	GsMXXKVa4TY1w==
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr14608025e9.9.1789701214531;
        Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Date: Fri, 18 Sep 2026 06:13:24 +0300
Message-Id: <20260918031326.68542-3-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
asynchronous sample rate converter.

The part selects between two control personalities with its MODE pin:
hardware mode, strapped by HW0/HW1/HW2 with no control bus at all, and
software mode over I2C or SPI. This binding describes software mode over
I2C, which MODE = GND selects.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the binding to esstech,es9039q2m and update its $id and compatible

 .../bindings/sound/esstech,es9039q2m.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml

diff --git a/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
new file mode 100644
index 00000000000..c1d03d3a855
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/esstech,es9039q2m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESS Technology ES9039Q2M audio DAC
+
+maintainers:
+  - Karl Asseily <karl@asseily.com>
+
+description:
+  The ES9039Q2M is a 32-bit two-channel audio DAC supporting PCM to 768 kHz,
+  DSD64 to DSD1024, DoP and S/PDIF. It is controlled over I2C or SPI when the
+  MODE pin selects software mode; this binding covers the I2C interface. The
+  part contains an asynchronous sample rate converter, so the system clock need
+  not be synchronous with the audio bit or frame clocks.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: esstech,es9039q2m
+
+  reg:
+    description:
+      I2C address, selected by the ADDR0 and ADDR1 pins - 0x48, 0x49, 0x4a or
+      0x4b for GND/GND, GND/AVDD, AVDD/GND and AVDD/AVDD respectively.
+    enum: [ 0x48, 0x49, 0x4a, 0x4b ]
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@48 {
+            compatible = "esstech,es9039q2m";
+            reg = <0x48>;
+            #sound-dai-cells = <0>;
+            clocks = <&dac_mclk>;
+            clock-names = "mclk";
+        };
+    };
-- 
2.34.1

