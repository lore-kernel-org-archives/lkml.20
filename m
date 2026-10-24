Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883662;
	b=rAQdQllHP55ja/VITL1tkzRjoz18HslTO5ACIcIjbH4sJlzSVAu5lb9HthxBOj5vPTM/
	 QPXqlYVPVmbkKbCxs9T44bRyeEAiGuuXAx9QPaiziOqygDESTqIAjlGeYej0eCPUzJj2C
	 upJYJRXRkzHeSQIKNA8lONeG8SFwYofQISauYhGW9on4Nhnx6Q40UXVmOByubxSs/gDeW
	 ewfCbHFnj2nWjRe94AKiIUEQD9zrGl0LBGCkGRjCu/xkWEG8/8CmuZROFaZqLKuLZgqhv
	 Zr9NtEDcOm8y6OWnON6tLQTgx/EyR03AVt+YgVYUxlP9jP6Ywomcn35xV9Zi3RL/6CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
	b=CeTPT53Oick5p4kS84g4H1p68ONsHm7eSEO4P7yZq9z0S/YfEwYDnZx43qwHXaWW4BvD
	 YPDw3kirIAVyFM2+0VIz1CGVtCC0MhZPg9zbuaWWmarUb6OsnJBKBvNL5tFC8DT8/6vdr
	 h+f8ATzHgVEp2Pwjyw9s/JHxUoHgGD2DbX7NzttRPQ8BnBWO9ia5XTBSWH3CK9eL/npxl
	 0ZvlCDH6lYBrG5Q9SpMlf7tlFG5amcGDi2PgoggxNuLF2Tg34olsTEptVZsZvP5OyMZ0D
	 T51nSISEhFAJkjBreJsTnPl4ljhklRcs4Nh4SgrPYbdmg+p5TMMn/UYilqhMVQlK64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewMIEmbs;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0A606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ewMIEmbs
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso727958e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883661; x=1793488461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
        b=ewMIEmbsu9tOqj6iGT5IHVKFXdOvdSfNHrxKvbkbMeMT+n458VGwTw14rQNtJQ8/pd
         Ms7VQTQo5EjIbuZGAcXQ7o7di0Y944dfVi5jQl3GUHXWG5i2p/LavU6E56m5vvLR7RqN
         nk24TpKD4r00Lu080elWDjOFWOp9NMCEWs7k/nyFyIbECBGtDk/3jKnChnSSBMMLyDPk
         Zaju8bPvKTCLsgznD5yvnyp+5r0XF9RiUWAkB/Mq01JevH9LLrS/cC+0pbew+1EDo/zk
         V0niDYl3//VFtyAKCup3p8rShId7LnjwEBGVCXCFbtdEAil4N3aYmNmt1OIC+lUmnG1Q
         vzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883661; x=1793488461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4yYPyLDwJaAxxcWVkGzZx1PqQ1arhomrIXaNO8Hhig=;
        b=09sicduqb5nUn71sxcK3EyB5V3fNlHmegr6ruRPGKb/sepJjhTi/srex2qP8JcDRjl
         giNSsjimV2QIE0HbXJbtK10TceqBj6zcRecA3t5iEGpgCg/UC8Z+4VgThFFQbSJaApmn
         RQTBqhoE5c2XnBPL0hsOmLXU/ToYYlhQD7O81LMferzE6i2FUG4XJU+L9OhPV3P06sL5
         8EY8BrErWl2qrT84CNMtK97UyDZN8N9b1R9DZFoRVXlWCj1Ok7WRf70Oyh5xtB5LZmSL
         KgTEwnymUZihzqki80Bgol0fjQsP1x1JeVlxpcWcVsInajBg5asgFwliENlZdOBt96Nc
         gYzA==
X-Forwarded-Encrypted: i=1; AKwUvBwMXaGC9V4EQHkMMZmMSJD2sKiKgqoN+5sVETaa3w1+Vsd2tVQdgP/vUcsIQGEiR0eU5BkWz/2GDFtNoQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm96qPsv4HPo/UcFHK+53fPMy+G6FVA9M7OHgGZxt2g0DS6pSs
	zTkaeafSZ65NOtsX7AFOvkJht0k3n/GELCEUo6U+6V7zGIso15GWIK7w
X-Gm-Gg: AYBFou2fz7P/vyDatC/QDhGiATNxHQ3U0y+wlQCIXhBbzobPrzYg8WzTO3qa5qDXT3Z
	ZJdfl+WXft1b1fFPw/ca3LZFHEPGOMDsGqLpspAswKQtdovjoqCGoH6OqvyJAkur1BURYGAdUAw
	dcAUh11E5+dxHJMHyduOxJYWQQBPaIc9Sh+lDLQrWc2MlhHhIKKycY54smfs8TDsqEnYrYFU9Uc
	dzbXDYvpD3p8AHStCxGi7ZQfo2dC1+cfFoaK7/w/WVnERKe/QmrxCQvvCbwh1POtJPL7Z5zP8xm
	G5z+xpINGFP1q6uxeTi9BUvQFGnpUwBm7MjV2OshWXdPYXXNK+eG23nDWAPtOAO0Y5zLQnLZ+KJ
	RVZ684oMRUcG4IFrJyCsAhdVlbUM51QZvxLw/4UujRxU6Oq/sdHs0KLSe4jNfrstPy0XWDFY37T
	Eks8YfdPlTnbKSyPzyx7ByDGP02bgVkbLee+NX8bcmhiUJIQm6Mtualk8p/wueCWRxJl/Yh3x+z
	3WrvbFVu/LXHPUo1TH33WtncKwpoeEov4rLQ3nffL7ZGeeWXuGd03VczV5K1S9BxmvYIiHzOemo
	MNJe
X-Received: by 2002:a05:6102:a4c:b0:7cc:776:6c41 with SMTP id ada2fe7eead31-7ce5cd7de50mr813317137.22.1792883660690;
        Sat, 24 Oct 2026 16:14:20 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:efc9:520c:e99d:e5ce])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b8f0csm3775406241.5.2026.10.24.16.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:14:19 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: iio: adc: ti,ads1298: add ADS1299
Date: Sat, 24 Oct 2026 20:13:34 -0300
Message-ID: <20261024231335.280955-6-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024231335.280955-1-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
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

The ADS1299 is an 8-channel, 24-bit biopotential ADC for EEG with the
register map of the ADS129x. It differs in its gains, data rates and
ID layout, and has a fixed 4.5 V internal reference. The ADS1299-4 and
ADS1299-6 are the same part with four and six channels.

TI sells the 8-channel part as plain ADS1299, so ti,ads1299 names it,
and it is the fallback for ti,ads1299-4 and ti,ads1299-6: the channel
count can be read from the ID register. The ADS1299 is not compatible
with the ADS1298, so ti,ads1298 is not a fallback for it.

In the same way, give each ADS129x part a compatible, with ti,ads1298 as
the fallback: the ID register tells the parts apart, by family and
channel count. ti,ads1298 alone remains valid, so existing device trees
are not affected.

Both families have a digital supply, DVDD, and an active-low power-down
pin, PWDN, which the binding did not describe. Add them, both optional.

Add myself as a maintainer of the binding, next to Mike.

Signed-off-by: Stephan Costa Barros <stephanbrrs8@gmail.com>
---
 .../bindings/iio/adc/ti,ads1298.yaml          | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
index afcc683db..c88f0dd95 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1298.yaml
@@ -4,19 +4,36 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1298.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments' ads1298 medical ADC chips
+title: Texas Instruments' ads1298 and ads1299 medical ADC chips
 
 description: |
-  Datasheet at: https://www.ti.com/product/ADS1298
-  Bindings for this chip aren't complete.
+  Datasheets at: https://www.ti.com/product/ADS1298
+  and https://www.ti.com/product/ADS1299
+  Bindings for these chips aren't complete.
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
+  - Stephan Costa Barros <stephanbrrs8@gmail.com>
 
 properties:
   compatible:
-    enum:
-      - ti,ads1298
+    oneOf:
+      - enum:
+          - ti,ads1298
+          - ti,ads1299
+      - items:
+          - enum:
+              - ti,ads1294
+              - ti,ads1294r
+              - ti,ads1296
+              - ti,ads1296r
+              - ti,ads1298r
+          - const: ti,ads1298
+      - items:
+          - enum:
+              - ti,ads1299-4
+              - ti,ads1299-6
+          - const: ti,ads1299
 
   reg:
     maxItems: 1
@@ -26,15 +43,25 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  powerdown-gpios:
+    description:
+      Active low GPIO connected to the PWDN pin. While it is asserted, the
+      device is powered down.
+    maxItems: 1
+
   avdd-supply:
     description:
       Analog power supply, voltage between AVDD and AVSS. When providing a
       symmetric +/- 2.5V, the regulator should report 5V.
 
+  dvdd-supply:
+    description: Digital power supply, voltage between DVDD and DGND.
+
   vref-supply:
     description:
-      Optional reference voltage. If omitted, internal reference is used,
-      which is 2.4V when analog supply is below 4.4V, 4V otherwise.
+      Optional reference voltage. If omitted, internal reference is used.
+      On the ads129x, it is 2.4V when analog supply is below 4.4V, 4V
+      otherwise. On the ads1299, it is 4.5V.
 
   clocks:
     description: Optional 2.048 MHz external source clock on CLK pin
-- 
2.43.0

