Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831414;
	b=RuTfZFKNmtgMgkDj5v+N3Wa5JHzzeJgiDsdYmI9GtJNnI2TSy0cROMWRkqJKk8xfn8BZ
	 HvUlJm4ZRSMlhaOVrBp/S2phDYxiAOhkJDUMq2oWl9QziFjo/ai4fhhZnjNPrzTbfOWAI
	 XGt2Y4k/GwJDOZ2eOCkCXsUCAAZ8Tf9/3/QCnGVp9C3u84mj2JONpZmu1/mYcUFSMTK0P
	 nSvvf4oYgQNaX3737cw1sJvjaJowuiODJZBMXNRsDfzIJL5x6rWr9fU0c8G3pwvl/53QF
	 qkKVoUQWTyD4j98fw8HzshKIDXsX1mwiPpxhRSR3+a291O0jGhlwON/acZ6Br2Aic1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
	b=wKhYkJE/PA7DIC3wOHuYY+YzJPF29HXbgN/yXWOYAUJGBPi6VoEk69yFx4y2r+TqmO8p
	 4QmM28x5k+O6R8DOWfr1G9zSk9Mf36CzI3851knURxE4/VcftzRantM7R1wfkpYjGGnGI
	 3Ob3hhES2zLnJe9AzOIL8e+rJv7k08rh5fgJQJnJaJJkwCljh5TF+fMyciH0U6HTtrWIQ
	 7zb9yfKMv6Do1L8pOwUWCLKyMtfSB//8jJaWksZ6hM33cKXFoOaRoNIIA5jKCPvjSYre+
	 cWFsBy8Z6vOHsU1dfKP27SVo40nFnwlViPf+TtbBc6wrs22Suslewn+WKDi067S/2ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2055573c8cso199318666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831413; x=1793436213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=ncOG1xgaONvXeiaMUE7R79ovJmwawvtZtfagrUqVaV6SCx3XMHlsbs6sSfOF8KdlSv
         AMAp+8v00bmNVHOUvqO2+6QzbcTm2dHjSPn6ykRWAbQI3FAj9QkqeRhtDrBSQObhk9Hl
         olSDf3wCDZSvG+bru+umoFIOSZBg2a9hsh6HLiquxNDSAK6HV0dCNDfdfnU9tJ500gsc
         SPg4ybU6xy22v58T+GJmx3gBX53Y9taqF41tXHGihH+DH8i8P1C9wED1kHKvHtbVDBhF
         pmTD3ADcqNcwMRBxtcrSY7lJvOj5zKaTPXZeJHyWNTV/kfjd0Cg8PHw9y0ZXq62r7GX2
         G/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831413; x=1793436213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=mdf2B2eYgfNEZ7Vk4iWMC2McHKctc97B9lPRDFg920GDg3+9EIknMNkyKRsFE6yXOM
         oiopwFcp9An/fS0YYCMJKAkFsr/o/8qCBbDndcDHFJdE30NNen3KhbaoGb7NM3BvhDmC
         ZfEKSb87YhbrooW/57R7x82ZasYsD15gXaPxjnEfOJggA5in/XXqCT4TtfnTb3Xaba6w
         a8IOYg4eHsnNiOuzuWq/lP0ix5PbfrI8/jvCOx441wCUKU3qfpn3ofPSjbJ2wceGoIwT
         g+v5cnqZGvgY+9layNCgmVAyKg5hCK4di1Vb0EYb+OTvXpMxvE3uwYq7SjNGI0IyUcep
         mlPA==
X-Forwarded-Encrypted: i=1; AKwUvBwsi0vqHHGQgETr1oJl6BSYqM/rw4nHeyXzFgGH1lXx6kJ4Lt1h7w3qE57dd6fuHmJ7zFwb3o+JTtK3QAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSqzT6u259ktLmCMn0LwpVzZ8CjJVZg9pdtWsxjN/PmkSJeMGt
	7++oNwjsp6ANHyi3u43kLU8wlo3WkntO9IOjoH5LOEwlji1j62qlC+0K
X-Gm-Gg: AYBFou10GM6ctsDEVNzhYKXt+KpTXN4lTcf+iJZeTtbKRltUV747njrQEwjB7QPkn0d
	Bnt2yogWlEblJwlK30JA09KAWvfiJg8NTS182OLHYjCegAbslKuXQmN527vojKDnnpo7LHr0TD7
	9twYcJZO1AAY4WNIP8yr1BywVQ3DbsSReNlvHUisqzvFH2+iPCPzjdYSvP26I4dOwCg8Jq8BUaq
	ToDjSZp9eu4lGd7uv8kTC9m28wsn+krmeEBhuZSV2ZLX0qFtkWSuHvPpOoGpy2IEKGCfj8G/u7T
	0OcKh4cATqleaBU2LvIDOMFtbb/2nXP+n6bdL/1VFsQmzfut9TwnVQHkjU6aBC9d6ceWQXo6SFM
	YUPtIQUEvMtbj5TK80mvVtZ/kCAIdHPjIpSipVJMfypxpEXZ4elNfvm7STDjszIFjCS8aiWhdaH
	tQILxVOW6GyYkeYP6r4wwZImWFo09YhKqABNs2rjqdV2wXJ2jskw8LStyd/NDVJK5JcmVq+NNqq
	m4OaBjc7W1WqinrggeZSXVQnY0gnLf3hYQRZlyM5dEitD1JyIvfLIgjKuzOI9nit4F3IJu4x+Gh
X-Received: by 2002:a17:906:c141:b0:c40:c6c8:6bd8 with SMTP id a640c23a62f3a-c46bde0a0e9mr153005466b.20.1792831412672;
        Sat, 24 Oct 2026 01:43:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm64608566b.21.2026.10.24.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:43:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 RFC] ASoC: dt-bindings: Define '#sound-dai-cells' only in the dai-common schema
Date: Sat, 24 Oct 2026 11:43:07 +0300
Message-ID: <20261024084307.116715-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Define the '#sound-dai-cells' property only in the dai-common schema with
an enum of commonly used values and a description on how to use them. Drop
all trivial uses of '#sound-dai-cells' across devices with DAI support,
replacing them with a reference to the dai-common schema.

This should resolve any issues with codecs having multiple DAI cells, no
DAI cells at all, or incorrectly configured sound-dai-cells properties.
Simply include the common schema and switch additionalProperties to
unevaluatedProperties.

Non-trivial '#sound-dai-cells' usages can still be overridden in dedicated
device schemas.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
NOTE: This is currently just a concept. The actual patch will be very large,
as it touches nearly every codec binding. Therefore, I am sending this RFC
to ask if this change would be acceptable in principle, and if so, how it
should best be structured and split. Thanks.
---
 Documentation/devicetree/bindings/sound/dai-common.yaml   | 6 +++++-
 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml | 7 -------
 Documentation/devicetree/bindings/sound/linux,spdif.yaml  | 5 +----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Documentation/devicetree/bindings/sound/dai-common.yaml
index 1aed2f0f17756..152f319d8f382 100644
--- a/Documentation/devicetree/bindings/sound/dai-common.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
@@ -13,6 +13,10 @@ allOf:
   - $ref: component-common.yaml#
 
 properties:
-  '#sound-dai-cells': true
+  '#sound-dai-cells':
+    description:
+      Use 0 if only a single DAI cell is available, or 1 if there are multiple
+      DAI cells. For special cases, check the device schema.
+    enum: [0, 1]
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
index a67b79cbe006b..f30aea4b545c9 100644
--- a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -13,13 +13,6 @@ allOf:
   - $ref: dai-common.yaml#
 
 properties:
-  '#sound-dai-cells':
-    enum:
-      - 0
-
-      # For Wideband PCM
-      - 1
-
   compatible:
     enum:
       - delta,dfbmcs320
diff --git a/Documentation/devicetree/bindings/sound/linux,spdif.yaml b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
index aea6230db54c8..62c035b739d38 100644
--- a/Documentation/devicetree/bindings/sound/linux,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
@@ -18,9 +18,6 @@ properties:
       - linux,spdif-dit
       - linux,spdif-dir
 
-  "#sound-dai-cells":
-    const: 0
-
   sound-name-prefix: true
 
   port:
@@ -30,7 +27,7 @@ required:
   - "#sound-dai-cells"
   - compatible
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

