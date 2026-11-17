Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904170;
	b=CRzJZSxeGOz5HBLHjncffXeV7olfk7/XjJ7bi3e2rWtRUuBLy2/RERYBIkbdVbKY6di0
	 wN19qKYIGj1yKQPHTrgu06bxya1GWGWDcideOuHUzZ/omhBtK1xJdWE6W0WcXl+qlwMEX
	 stqO4ah1JTyG9bxiS908kQG3T5LDAkyEXPnUQ72VSuKF4fNY0LGWXuiI53kGtCRQbJpfY
	 mB9Ib4sn8b47G/4d+wzc0uNL3NWybI6OzWDmwuWTeQDDF12zeF5/QHuM7XMH+bVgLod1X
	 6+f7Bk05NOIUXYm0qWGsfeVpRqK51Rv9w7Ixdp3a7w1iI0Z0+B3ksx7Ow18Rp4OTDBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
	b=0zmRvd3C5acyyT5imqGNrY2tfBWE26PeDyTJIUL3ruWsVclrCfiIEu+1hrDGx07w0rEx
	 qpKzYm/R5AoDO4anFpIm13zQDmR8sy/TGPdspz4Ww7XYyegt7wnuREcLPV/gINDVfPdzQ
	 x3RJkeAKq83CgSiXlZJ3+VSaoGfsnsTovOCF+pE+k/6RZBN5/k8LYnFrxqr9QylosUjGs
	 s8Hb7brcu2yeSANqDjxWZpSYRnEhb5qlxZIL12zEUDsFy0Ft9WkIFUXBRw0ASO56Mfdh+
	 kYxLrPQppgN7aAQ1rNlj3WTAkgYpKN9Ql37VeEHmKUAbwMd658lj90IasOzIZjnhAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiAqStaa;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74EA606A8AA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74EA606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiAqStaa
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso2181026a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904161; x=1795508961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=qiAqStaa6W3hlpe3ZAs6sHR9yMPN6PLsFW6ZzeFt4hda0n5n3P0osrYWl5X/0kzotG
         3AhUgsj6WcpJa/336qEOZmnrk1tjc0SDDNmWLO9GkuF5LjWn/4wGGPsuPkXp7j1I6g5r
         nYivVY1sZdwguqOCAAG82rh/+4U2/l0D7WKTgOL/Vteth3vv33MHDNrdkwN5EKWrJN6V
         EeqdeQewBBaHS+lSytJ5MjCiFFetHqpmjzExNAU+dkUvG/bNSyi55ZvHf+X9Vlw/fczt
         Zxv5+P9rmnx8RRIEQ/jksaZj72uxFqhsjzbVwJWTgrglAUN9yly1I3f3SzYQ9q0KAoED
         UGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904161; x=1795508961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=NzBv2BVHbjPSHJE3ZPNeYVoBIk3PsbthJpimkmdJD1D6kQOSG4fknqG8VBvH7fe76D
         TRh/moNqwivxWJ5lRYCLYZ5A7gjEIi9a8E9dG/ZWKrehrnXhRjoRqo3l6YSorrkk1oG8
         Ovz6ImTbrVv6/4qhhRtfPHoeErxfQxpW1zt8uHqMz0xaxkpYyTE0C8VaJxI/sPKCJhcD
         9JvKPzCDGgKiw2cKHAvs7xvK48BdO5HNhjxfb1mLAc9sdXkVwfrjx9ZaHlxSbacQOAlQ
         a12HKfAdIf7ELKU54yfWVykR0qa+UlAUtJLCnnJ8vs36R6mbQqPCTPFhdvf2VCJ0k4A+
         4ARQ==
X-Forwarded-Encrypted: i=1; AL+hErFniFQem+akMqokZFHa4Q/Z7tTRvRMUhcJ8uv9jwg1Yntk8ycIQBZh6+g2uG+ncyQcI0E86mb6hlqW3bDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nrsKpQN94sTHGhvQEeguR7oc7PMGUebrGQ/A7M9zoj2mzXMN1
	2O55tH/NsM+JWQtYUbDxzgJFQCNQN7RCcefwnM3DyOJWXIIgFK6iFytu
X-Gm-Gg: AYBFou2Mstt35pPeMDOyHw28Mapvb2iiURnK351OtX7T+6jZH/VXomaj4cgwl1npEGW
	KD+l/mpGXVvLs9K5Jl9zcvPJT4OzQpdwQPlRgTvGCfXrSiWoqZ5aTG0zjUK+tmEFaoOQe+7XSa0
	O3W1CmJMyKRQNwMuXVsBhtvWRmdHWl2yBxDtYeJNKLhwB8cQEQ9yuNq9h6+hwuOJG8K8iVP0+MC
	LVlJ59e3xmdWixLuhzToOowlvk3ijNuW8CTtCh1xsiNu3TH8plInCUKkNfF3+rSbEdEbTWS+NB5
	t+GgSNW29QLFqbgcBvdx96jeJruix/l8M1zNVYLaynfXQrMOnCYj+uhyU/oaC1XmhKBzCQyMEF6
	S/Wu3rRpCcdkZ4G1qmYCCkZmqRJY8HNXBlKKmuFwViQtgPmu1BnaI6KDzUMSISxgvu1Z8rj/SCR
	CAJKalQoJkC0gMeGoTo4fty74YFxzlAK45hEfRjqMH8D2InPxoaL7yIO0D464461zlqn+vO1XSR
	l8wGmTYEpvV1xslSdpmi0qzJMy56QgVwTu+FfnD5XrHrsZiChX5xN67OiuXQPQKtNGrgdjwMMvY
	rcmhaTwUVqI2bAde4DQzRrQqfueYSxuOP5BLeXbRA8D0SUWcb1yST7vIIPKphVfr8dtsq8Cqph0
	LU2rec89KtXJyw9g=
X-Received: by 2002:a05:6a20:431f:b0:3fa:f6c0:331a with SMTP id adf61e73a8af0-3faf6cf78b5mr6473329637.61.1794904161230;
        Tue, 17 Nov 2026 00:29:21 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:20 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: Fix channel property validation
Date: Tue, 17 Nov 2026 16:28:30 +0800
Message-Id: <20261117082832.1551574-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117082832.1551574-1-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The common ADC channel binding currently uses an anyOf constraint
to require the reg property and select between single-channel and
diff-channels.

However, the reg-only branch allows validation to succeed even when
both single-channel and diff-channels are present, bypassing the
intended mutual exclusion.

Replace the anyOf constraint with an explicit reg requirement and
a not constraint that rejects channels specifying both properties.

This preserves support for reg-only, single-ended and differential
channel descriptions while rejecting conflicting configurations.

Fixes: dd471a2b7759 ("dt-bindings: iio: adc: Add single-channel property")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../devicetree/bindings/iio/adc/adc.yaml        | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..f2a16b896630 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -114,15 +114,12 @@ properties:
       Burn-out current sources provide current to the channel's input pins for
       open-circuit or short-circuit detection.
 
-anyOf:
-  - oneOf:
-      - required:
-          - reg
-          - diff-channels
-      - required:
-          - reg
-          - single-channel
-  - required:
-      - reg
+required:
+  - reg
+
+not:
+  required:
+    - single-channel
+    - diff-channels
 
 additionalProperties: true
-- 
2.25.1

