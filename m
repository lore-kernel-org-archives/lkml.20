Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0345A2AC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037098; cv=none; b=MudPySuQtWqsXauRAFkdajQAo86QRHlcE8E96UKhd5fnMVwo4L4GW0V3CVxfO9oBACEVGUm83dZTSsSfuF9rUluEwepXlWVGArRsuh5NhjhovzdTu0LCYNNtu/+MEwRGUQ16mnsAAnjfYUGczT++2zYoHlpGpz8nSWP0jR91bnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037098; c=relaxed/simple;
	bh=3nicj74Hxx6yjlTiwkNZyN2t5b9AT5SF1NRF97CcdWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0vK8zQDXbgUJSKUapEdrXW58YJb+a0NAI0M8ymXJSjYsLjOqEh0f4L/jaMVMQ6hW2Ud+IrdbKfNfmFNb6FX0Q9c3z/waYe7UckVFkLCnUSGDLmh0LYWmCqMrgrs4kRo4IBWCRE7CDGx4y37C5he7vm3SeY5kcpuLHycje0d4ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GXoyKQE4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GXoyKQE4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1329307f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037091; x=1789641891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=GXoyKQE4GbsIcSe06CIjI0AGOEdbvf1zV7TJQEbdTmFH7AR2KeT31Hi+eLuajNlZEn
         1jc98iQSqKykho1DJdsfNs5OLq9uwLLva4FpqKeC1XNA7LKaJ36OEV8E6BZQFqCp7phk
         hd8Px3yvvjuws930JUHqj+zf8cz9JNMrf7Ljt0uQfzPwlrQ+Fp6fD5Cr2/w0b26Z/Ub2
         ZAPZqX5oYD3fhpY6J5oH3XQcJnx7b7GzG/dOqpwXlc+/P4hJfYjnmOvy84Q9nRpVQptD
         CEpHGE2NHt0c66v3vVpUk2yP3zw4yUTOqXi/+jfjkTan5/4uQsybLg21JOQ6IWA8E0lR
         A5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037091; x=1789641891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNdJC8F+FI98g8O8yjU0PBhO99fdyGD2hFZaDczCwSw=;
        b=adDDnOBQZy2A10tbT++0ezhrwNTk/d2fLo/ypaTA2jEUDB0rUbolNh2FOCoopUDkiI
         WSqo8WqWzrLXq9qHL0xszGrQ9wNMCq4AW+6RhFWTUQRrXco3q1KbdQpx7ya5jPz//1hh
         IRPAz6h0LOb2VLvbVlemprpQM6iNWoT1nlU3hNzmZlTW6zDB5JU96HrFkTBpP2p/XeXd
         CdSrX+mOrd9E4IMOuMTZob4Hvc3dd4SZtYgQfkx5kgmPLGlM3Ay4HOeTsGsNU6x0WZf1
         g0JhU6jpMRHKOTuOewDg5lDoexSttqgSK5RBrL24Q9J9nuz8LdrhAocA7UQhVFS/Cakn
         /G3g==
X-Forwarded-Encrypted: i=1; AKwUvBwuKHN0tTqCI2TPHSqxyrYgv2qbjvZD1Ed/7UUzv63LGzoe9tj3ueAwjbdAUKtOg+3KyMQn5qi0ZvOQt1o=@vger.kernel.org
X-Gm-Message-State: AFuF++kwxsyrT7+VssX1VCug6QY5ju+tTN1zSMQOq3C6OyhPZKm9Jq9U
	2lrm7DJnw6t8ORCKOCeBT9g4m8r+fHdTQAxGdxK/yUEamskS3BmhXwtEWhdAJjL9USA=
X-Gm-Gg: AYBFou3qTMA1GuMLxOUXi1TV3ZFBerrzGhZrh4Vu3a4qnUPwMQFks8WCtJszMI0zjyF
	wQOryuEASLzRCEGtxm77qzdZsb0FHqUfbLGfOs0qbTDBqd8zteLLhBg+NlGeUy7pbRPWH/gJohz
	cMoEYqZde41Z8aie8eiw1KjIXVIxJTs41bqhdwEjEd+lbC8vyQQxXpfWsrbkbsSzPxXrSQj3/XB
	Ka/ICyIP4A4nOcxOVCojZESpcx18Ta0FoZr/pQdjSXmFvpOi1HnGNeCNIdszFLAjsHxrRj6ldtS
	InG9PZtm/K+SVmDmR+yx9/zOgWwdkdEq9LYA4yoe9Du5G0+5UTkceJEYZNbuFPPx1wHE2TmQrkJ
	fEC0ZtoIdTMwKJzL+mW3Ca7QG/Owr8GhQHcfvQBHafgRTeLUcO5SyNtTuF4H90IPcL7XMVQZtQR
	2OU2VXO0Uj6OBgwHcPtrMpsa+KXerkkWyttVjEh+t9GqeiMLvRjHKMSms3TDkTRmij7Tbroy9KU
	3a3YM//VsY3zanKSpUb8tGZN032
X-Received: by 2002:a05:6000:4b0c:b0:482:dac8:cd0d with SMTP id ffacd0b85a97d-485aaddef7amr22611052f8f.21.1789037091565;
        Thu, 10 Sep 2026 03:44:51 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm52826286f8f.4.2026.09.10.03.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:44:37 +0200
Subject: [PATCH v8 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBdBMXYah5b+O3yxBs9VZHzS2W2px3jjTuPIQfDgazg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooYcq9NPLrJjbzNHBDceVlyXxodJiDIF3o1j
 uP2FnaCXZKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKGAAKCRDm/A8cN/La
 hX4TD/0aixhIChR8fwPiI2ZsPUSeOT6RQoSd5UZ2+mVFMj1cxLeoY0/ityCYTKcdmRkcDbJzWjZ
 pI3QgldSkswPWmBrRXu6MHUNtJBnlQciA7EEaas8IcWccgXA+OF8/fzfOM+5CEejrl0/sXbPdWw
 UmsEjHx3y+t0S/jUUXAbS/NKJlhNvC+fIoNqNuj5Q8NiNilYvJWLOFMRtn/NYRkGDvL8krkjHCU
 C6619HmWZO0gfPLGGtK7rVL4VR0DsQY0Pf08Ox1DREHKcNAGFGu+6sW7HkRAQGKdANEP17oZS9c
 bgGLvc/fEmSq0l6zhAMqRHwQsjCBAvYHP108+dpfRodRrih2cuL8iZccJuHMURO7I9SaUaK6VEw
 AHIVyseMkMIKGq86sZmksCW8SmhPERhSeND4mWqY6x6hoJvE6HGRoOA5mgY43ll7rZYSvwyu0fX
 qGVyXIXg6VOeEYF8Z3NHa5gFnUngDR5NXgxkaJcgY8mvRPjlhfPYVclKi7cxvwsZNcVIwjH9GAa
 B8qilD92l3RlWYaKJEI41C5XPvwnOl/A61xzBaF+uhwIjjrNBdy+VN24cYvOzN0AbONxO0QaB+I
 wKlsP8X1ZpmZjhFFqFi9wk8UU4Gx+uHNwYphQaU14yMg1MyUjerkEYjSO4zlRWD1kcnuOtRQcGT
 E+R85hsYUQHpMbg==
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
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..edca6b1e9f70 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -70,6 +70,7 @@ allOf:
               enum:
                 - x-powers,axp15060
                 - x-powers,axp305
+                - x-powers,axp318w
                 - x-powers,axp313a
                 - x-powers,axp323
 
@@ -83,6 +84,7 @@ allOf:
           contains:
             enum:
               - x-powers,axp313a
+              - x-powers,axp318w
               - x-powers,axp323
               - x-powers,axp15060
               - x-powers,axp717
@@ -102,6 +104,7 @@ properties:
           - x-powers,axp221
           - x-powers,axp223
           - x-powers,axp313a
+          - x-powers,axp318w
           - x-powers,axp323
           - x-powers,axp717
           - x-powers,axp803
@@ -156,10 +159,18 @@ properties:
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
@@ -168,6 +179,10 @@ properties:
     description: >
       DCDC4 power supply node, if present.
 
+  vin45-supply:
+    description: >
+      Combined DCDC4/DCDC5 power supply node, if present.
+
   vin5-supply:
     description: >
       DCDC5 power supply node, if present.
@@ -176,6 +191,10 @@ properties:
     description: >
       DCDC6 power supply node, if present.
 
+  vin678-supply:
+    description: >
+      Combined DCDC6/DCDC7/DCDC8 power supply node, if present.
+
   vin7-supply:
     description: >
       DCDC7 power supply node, if present.
@@ -220,6 +239,14 @@ properties:
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
@@ -277,7 +304,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false

-- 
2.53.0

