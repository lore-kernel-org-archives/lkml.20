Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA03DCD95
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032710; cv=none; b=ey7HxlNO/FuaQlWqBYSKoB+oeB/oWINcRY7psrhrLrxxgZdoJL1+duy6nEUDkRJZAQJ1vEIaV5RnZ7oNhcJBNltqCyn4pAH+Nb/ldMx6M5d8PIud61HlxktTAyPCZt+2d9Bwhxb8ay+I7XrgPJvgVBJa7DUEWhp9oi+keWeXD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032710; c=relaxed/simple;
	bh=27AUzsKR9CssdEaQkSlsPLqzbRGUpmaiIW0xyEpwgkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyP0vD+OV+I1YvItgEEBTEyD1QJgrKsNuaPKl3bsK0hG4f3Bj3y56uWtOMQs2GHLvn8v09QvKtscVQ6M9REzxGllGX7nKhQzSxOjfDBhDfwCph/hmHrpWCxRrR4+BeKHjLf6lTRmviBGZ+L9XL32nvmAVfBdaJ441luUyI2n8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gVBzWivr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gVBzWivr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so6052845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032704; x=1789637504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=gVBzWivrFVqeho13k1tdUGlCxp1SjodY4Gt6FkLv0CS+9BYqRUHdTwUn1Biyn1oU1s
         CRqZVExen0k3lbeKk2odhR+sfYiGAgL/h8LRItGty/vVOUj5DgzCcHNe0smF4uYzTISg
         hVezGGPrTV9mfHEW91nWhcwDYucq8xQymAwcBHpS7F7ehyqOtGBb2vhrOs87uVGETt/k
         Bvfuj7ORaM6JSG3klSMi01llIxbBhzwRV5Pc2XH2JV7VF2Kh7zdvk2H8k/1XM52xYbFa
         5l46fsb6DOTCXmKUWMNlRPKrb3SmhWfkf1OKNOIaQ9zeihFs2qykabmBWGUZf7qJSh6p
         OLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032704; x=1789637504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SzfhZfkD1FSheSAa+udFpbhKZgNVoMqgCB2AIjzHwc=;
        b=hEKJ+MQpjIh+sAEMHEtgyS86hlZyIrO6V4BWFWhvOFMylRK+PeW7DL74ri3sy6qiD+
         seJy0K+sLj6MwGQ5fbD0Ps3CeBvCzSMBPCMzlR7jueIhQ1M0ZuJYhGMgMZI+vu9MAu0Y
         UPG6fov9Kvq5w2Y8XufLQDahxFHCG7Bk5EXDgJL8cVmkrw4w0sW8oHbuJjZIHWY8S1QS
         wG9uuczETuFWapAaqDkrvMDgevxHGLLjBOtxQ9pXsf4KYLTLd1HyJrJAf62rgGcTeqCh
         1rOrV2zH3ybLwhtHjeLRUBuRFsbA87kBYmHwldSiiThCnv6ncMuftF7CgfdItdjnwzKM
         ft/g==
X-Forwarded-Encrypted: i=1; AKwUvBziPh9gUIQ81nVbMUPHcoKprZAGatJYbMipsl0/2HK7D5vHIPZMySaBlKh5nXBlEWdHjPUJdgyfOjYFu2o=@vger.kernel.org
X-Gm-Message-State: AFuF++m+O4uD6CJv4Svl7MSiarHpov4q7JDbHblSKdscHN9R1MByRRwt
	ItBpElJrN7zb5swVl0UwnOHNY7Y8oygiQWJnXkRzNUs/H06KwzFsDuDEDTyo/4Z25FA=
X-Gm-Gg: AYBFou1DmlnN3XB6LhRr2XyXe4iH/MMu1+Lust1bFaW8emoJiAsJQZeLEYcMRKhlmTZ
	asybkhWLzYlui9lsI4aPS7I04s8uefjQkTArs24NTIuC52+vZV/NxOC4gObV0+SWWoVPiL/7cpJ
	qi1MpjJEbDIFGZarnA0uvFqPpbJZj115y7sLLLubaBiZTYxRNKNwZVz0EJmvOVst3iQPTL4fBRe
	f7iJjbSBeeQBxo3QVAhF4JBiEihTNqDuHV4wA/HYa3aD9AKKvFPrmDfEpLbNHsIg0y5P5tzatBT
	FMLHnP5WZuptn2y5RUAIhyKsmSmJgKTp/v8o3H09XFKhKjzfD/wlYVtklB39t/aX9ZQII22dZ9G
	p6TNT+AeU+GKBLwJs0laYqpE7lwf/lkenPtfcw0/8YLjYblufs9rqdrlB5bBmGbDHC6z1GH00Nk
	a5+cyaVehtmV7HZBpX5cJhH6BDC8o7YTFNvupNBqvfGBPCNS+grmf07a0uAk5ry+1q/xBJsEIgP
	drakHVszNYMWlDgwQ==
X-Received: by 2002:a05:600c:c48f:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49d258cda4emr58183465e9.6.1789032704515;
        Thu, 10 Sep 2026 02:31:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm54965505e9.8.2026.09.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 11:31:10 +0200
Subject: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6eSLEgss9n7JCsvVnaFzT4hYnTeTkd6TBh6eqWPLl0E=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjwMfjSAPRNpZoCxaIrK3onAQOeCgr2fiRTu
 ejAQpLKhbCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ48AAKCRDm/A8cN/La
 he5CD/0ZJJKGnyLNZ+C4njPLmH4FrE2JTONJCh6Q2ouaK6jRE1+pKnhUOJ5/b9ZA8VUJX1ehb9Q
 VJEGB4+eQNZG9vKc4z0EsBnQgj2s9HIG5v5GyvSskGy1yqQ6PTyoOdWGKvN+6ZlCT2LRmJkqYxf
 qvV3vH2H79OvEBGTGWZgjFmJEYOyjpAITKCcfNsD4gVAkohoVLbOMa90BVA1LH8MeRUyxFMDNC1
 PXfKfC1rvi2Mh1x2wC6qp7Kc/iGMzLweL8MmkOSzEOvDUHSNeoNqrqQS4u9N+jJRssKjXxGlU2S
 4Zdc/aHaFkKBTJoOXpc6B6bhBp0du2h+opFJURQTpHXo6sx2J0MpnVQ3ZX9yHCDDdLkIHdqWMq6
 MRySKTofNx592rOO2KYXplXC2bTsKcvXhfM7KQ/EKu9LrgAa+bqTlGx4S+k1cVjz3+kSCMQRjX1
 ZwQGK8t/oUOB68lyiJNEYCYGpiyVqLxEKqHbsNzP02paU9t5bN35DjhIcuqTNlCGSEuIDKnC+9Z
 DuVZSwRcUftsAF2WKl8q62wJ85l4RdFXUhWPN9GWR9LC+DJO0B4/5n4iVwTTNJog715QSMjws/A
 ErzwlN7r1+IKfRJbZGUpGOoSyu6FbWGyh2YZ/bSa153RVVr9np3Yo7/paNDGW7c4854M7dtgDg/
 qslxEgM3551cxww==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts.
Like other recent PMICs, it lacks the DC/DC converter PWM frequency control
register, that rate is fixed here (1.5MHz on DCDC1, 3 MHz on the others).

Add the new compatible string, and add that to the list of PMICs without
the PWM frequency property.
Also add more input supply properties, for the split DCDC and ALDO
supplies.
The PMIC features *two* switched outputs, hanging of DCDC1, and the
manual calls them swout1 and swout2, so follow suit here and add those
names to the pattern for matching the node names.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..38556c32417b 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -83,6 +83,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +103,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +158,18 @@ properties:
     description: >
       DCDC1 power supply node, if present.
 
+  vin19-supply:
+    description: >
+      Combined DCDC1/DCDC9 power supply node, if present.
+
   vin2-supply:
     description: >
       DCDC2 power supply node, if present.
 
+  vin23-supply:
+    description: >
+      Combined DCDC2/DCDC3 power supply node, if present.
+
   vin3-supply:
     description: >
       DCDC3 power supply node, if present.
@@ -168,6 +178,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +190,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +238,14 @@ properties:
     description: >
       ALDO* power supply node, if present.
 
+  aldo156in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
+  aldo234in-supply:
+    description: >
+      ALDO* power supply node, if present.
+
   bldoin-supply:
     description: >
       BLDO* power supply node, if present.
@@ -277,7 +303,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

