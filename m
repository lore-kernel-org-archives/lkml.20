Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CDD35F609
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587617; cv=none; b=IkPzovaTfCiHAVKFV5/ZEnJEkgEbw+URfYMz93kLnEidcLA1fGE+/sMvfj/SsjinPYsmejugklqOM3ap75U62O/J5koxDiuZ7Vr47P5pOxL9cYtU75BXSzamUpzmZmKhj9oMSVjw0HctyX4biZTX+FE2mvw4sGZNDuROj6XTDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587617; c=relaxed/simple;
	bh=2OwrC8ngY4tjaQzu5GKHL+hXuds3sFtg2SG5EfUZZGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXtrDYNwqj+SDCdXVFijY4xyJr9iq5o9Y1PnZTgP5Hkjn2cKrWoAOPkeVbYpv67a/0DiJk37aYVX0kNv6qNTjji214s1Nhg21v+Q7e/nqW4w9aQPgWwkVHg2aBy5ZHDvQUlB62knURLhtPACdWM6WcD49Q/Nf5rqHN4e/P5bG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvfU+ouS; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvfU+ouS"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-861a2ae9c51so22113987b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788587615; x=1789192415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiCaIn1GD6n0V382lVMeuTNtZLz4CdPIy/SmqTEx/n8=;
        b=jvfU+ouS7rHzcwivuNsG4oqHuX/Xg6+NvNhyenQP3OV7MV2TvBoefQHrZzr4hM2wvV
         tPGHzS275jywGcOoc6oe1CjNGd6MBYSd5J4ywmITFTDkCEJJ2oObpx3i6A01A7viy3Dv
         mrKy3c0WuokvPlpa1BgVzQJewzGq2Q4XCmydHNfzQfba5vlIM7XK1aClyeMlzaR3n/Bg
         F8oRx1pOCjo7rG2EhoFb0hL/5WTPphj0t8hbJ/eoxndogntFdxxEgfPN3xsPL7OMFPRk
         XQlWjYQq4Ms3FTO90D/2JoH4cMRxzV3nU6yWTsQY4yQE4SGvdWyqfdYRQ6RyZT11vII8
         CxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587615; x=1789192415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiCaIn1GD6n0V382lVMeuTNtZLz4CdPIy/SmqTEx/n8=;
        b=RgVJL3OCdbwh1CemYkoFscg8ySm3cAu2MQ/WeYB/m1eSKEPzLsrUg2Z/yGLbKRfEAg
         jGkaLhWM0DjvyVgdoKibj/gUlpQ9Pea5sLA7jnQ5KYHCsm48sBxvKB2kaM5VEcndZwcj
         kGTmC5hgumTO6fVvkyMLmzYmS3ZoimxsJ71L6H92lkpXHJGSTm1pThBkDPpLERqin33R
         9e4pzBNVhVmC0s+TCHSgLheE6EpB/jMfW2H2rV7sA5eB7k1AN10Ie7xgRF0dsHQ/P9ol
         w99LCQK3CzAc0HVeuPillQO2EzHZEZuPbAkNynwX4eR3rxUxuUBZT4qb2H7Y9mCkBQBs
         fUiA==
X-Forwarded-Encrypted: i=1; AKwUvBwQd3Gu4zGP3VmdgzRDy+TeDohU4c78J+97Bu5N3FxK0CgAKN4k058U2rEAEZ55mBHRem0zt/CDNUVKfM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZgLK/npJUzS15COsTt/a0HNAyMTvuvxPJBbBjF+J+YY8U87YY
	ZtpGTS9N+yRFcA0GexmdL16V+UOkIFcxQsEyfRSqPB+ofeYlEONOpTll
X-Gm-Gg: AYBFou1rqjcnF7sWjxHQ6sgFVuEPc88YQ5EHA2MYCXM7hmEqVpnMAiieP6XK4eunBcf
	cUEGubW6AuV8eg13k7wn2N6nNkXxEEoy55ZdLTLMiTcf1ZispKm0jjB5H0cFsuB9gLJcD6TPWH7
	PnX3VqVIr8y98vth7v6ZMRuxToQpkA3GqNdM1AzL8trVWXbUnHOLKwj8ZCNU2eq9z6gP8l8xEMN
	rszaOlUHP/4SJjaX864HRpGTZZ6IhSHrKE1Kq83VupEgrSskCTxMu8JWIBz5PTUtjMqLbWWlMSw
	vSy+9kAAbkh04BGLbw780c9yc3QEIdFuIupU2/txJJeXvhz+bvnMfqMRTeeQrX8omtGIBk7kGlT
	+wqxgtltAQ0mrTLKqb64zVK74O80bCgw5EvPHwR8/xWhV8/WoPXBNZpr5EUhkAGLRGouq056t99
	263xlTVCjMfvBXVVblsZpQr8qGwUxX7UrT0sdymdfGq7A=
X-Received: by 2002:a05:690c:4017:b0:873:5bb2:6c31 with SMTP id 00721157ae682-8735bb26ef2mr16592757b3.56.1788587614064;
        Fri, 04 Sep 2026 22:53:34 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::1e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714ab73f23sm33173687b3.33.2026.09.04.22.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:53:33 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: light: add as7343
Date: Fri,  4 Sep 2026 22:53:25 -0700
Message-ID: <a516f5bdfaf9a2cee9e22b80c17fb42f860afdf2.1788586814.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788586814.git.marcus.yu.56@gmail.com>
References: <cover.1788586814.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
with i2c address of 0x39.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 .../bindings/iio/light/ams,as7343.yaml        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml

diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
new file mode 100644
index 000000000000..fb996160cf8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS AS7343 14-Channel Multi-Spectral Sensor
+
+maintainers:
+  - Chang Yu <marcus.yu.56@gmail.com>
+
+description: |
+  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
+  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
+
+properties:
+  compatible:
+    enum:
+      - ams,as7343
+
+  reg:
+    description:
+      I2C address of the device (0x39).
+    maxItems: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        as73211@74 {
+            compatible = "ams,as7343";
+            reg = <0x39>;
+        };
+    };
-- 
2.55.0

