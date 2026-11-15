Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794722460;
	b=LIANeW4CMgPdhDK8B3C7B6u6cTGfQr/koEQ110KmjVjIE1kI/l6faQkHfk9uMFdKmypL
	 3mJTl1SQmhG2bw+qRJOwKvPcLigweXHREbBypBABkUz3WyDOPoeyZiCwD6yC1S7FR679b
	 DIGXcQ8uCXC47BzU/FhUidT1Eb2iiEcnsDSqHdrQJzfhL6b10Y8R1COHWZRlwmWHLE9hn
	 Uxw29wvFEFD8AZDTOQiacGiqHJ2CD/xU5SRkNgCotRYAUoj2g/jhNet+AS9VUB1HNs8lZ
	 iZsKeA6x2f/vTEyVQSIby0Vecu8cUTc9ZuVWHSYetTv7lQMpKy42o2rfS3Qkm6SKROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
	b=GmhXFcTFjIim7ria8nI8k82yX5+PKLnYiDusLk+TW1H+M2CutwxosAQfJ8nW57nob6ti
	 7EyZGdMafskohCZUCSKx9qkeFaNUF8SCAQ/dXMBgj5JPG1XRP1TUMnl38VS7acTLgqtUu
	 STVEdbQKw+WaW/OG80aBgoQYaiKXZ05W+Q9XpwTmNtVVKzJ6bPfvor7nHAimttQUQl1zc
	 ehHUasJGM22iBS8AZb9uUQ9SeP6mCKj1Fd9W11SFoBX/QPiy+E8au/edisf6dcPaTt7Ko
	 HZNHnFoNnC/inQ1BojCRq/aQjvsuZhLm3nCdkbzR0xd1qRVf4tFjh8KirUtmIBVGqYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AySxjepw;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B30606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B30606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AySxjepw
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1718351a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794722459; x=1795327259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
        b=AySxjepwHPZGrkDowx8EnSp0zug319xmkETWuYn3bTpq+EJxJPH8yQzwb5pM3ylK9B
         gYXAjXO2Ext1+uLYbWbvqjgmPkZU5jdcaycLY5YywGhRiUPhxmtgyQ4BLBYT9tbSoUWI
         tJGYwNglgEhpmpzLLVsVz4e97SGWd29m5t+Qomh3OmnE+IPeOkAz0gTAqX6K2x1+7QJS
         3yiymLWvy/Ntm4Wy+NL8A0fYUvwI3iGucJuHSqHnYHnKgRVp6nhsYJszB73g5Ibpnx7j
         pw4AakxfKv0N4lqIslG4XHtKThmecL1u4zYQVryifJbNWYtUa5QmHWoBMDOyLCUxadIL
         Z2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722459; x=1795327259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sikHWDwwcHY7wUeIPuVUS6zZeaVy/rjClvTT+uODGBI=;
        b=U7rVXIL3L0DQT3CC3uEfJ5d4jFFMZfcm54fb+94I6GN9iBGLumr83A+7SmNxX63myS
         M+jGGQ2Aim1zkb9rgzigY+XUJ71ZKFwujpZK0uQbI+7tb6ClfLGg2Kf6/v6ZiZ8rNGnc
         earZbmbl/rxCGfiafuAo6X/kpGzrCoqKNuU5ijJxQGQahKPXhQOz1tzfgrByYkHU0i7e
         DNtbfEdFNv9Dwu51UIFQVXhHP4JuSH128kRNIBZVQW+87AfAreDBqnTJTASlH2hCCr7I
         /9rVPx8/bWfO7B7PY6ZSu5Apb38CUzg6NriQ6ZyMABTolTWIyfp17rWN32Ckus9ODU8V
         NXlA==
X-Forwarded-Encrypted: i=1; AL+hErHldo6rgWy4aOAPf92k5WuWF3pUKx+WnApUbENlyy1CkeH5yFi/Z+q71J7eiRkKOOKOYzynqEThEUeiowA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FtR6MxRznt2/HkQMMqW+cWomZ3m5mQ934EsYCOQyyoLe4EsA7
	wDVpKCWHE69Ev5ApTQ1uAsRWMVc8UzE0+q98gFBZp74Ox6P4al10Q7DR
X-Gm-Gg: AYBFou3rXndm+LloRaVzC+xt67xn3eiC+L4YOZ7mjLYEi0BvBcwqnry4hqeQBZTcgIa
	9Uzv55zwRh7yP70xIFrTpd4bJIr37jGBPT7oFLbxa50Y70EmtCk++g7OKou2507iLCfCnHh9i7/
	KM57cPiytI9CAdoTELPfWhdaRdXI8s9mBq3KZykFLfuhxJCOXWYCFlfI81jkAI0ZFvA+jx092Mo
	1xAd+fyKNN72l52QTQXkCxHqeEE1KhtxsEhiHkSiUUQH2DeCMq4qiI2Zd+yOKBswMxioKSPpEiz
	6inUkb3SN3qFOmSPqpjxCn4qPGrSTsLmGQFk32LZz5xQkor7XMs2qNWJJwqtqh/xRd0NXpsRVpu
	U8y1IKB3yJ+uI2XSZHKPif7moW0vD9NaglKYt3Hpgu69BWdsAnj91ha/Rp6Mp9714wREu6ByUdq
	o0c9u1DvqQfKqQDgWuBuOOkfjjuZyWkfmZ9gZFz7O4E+zlxf5iivpVsvw1g4MnnSfEoUkjY6d+R
	hpSxRimkPrYXvvZC66jjeiGN5c4Jtrp3yAYyNSRvC0lF08Aafy3BSqC1FMmwjgR/AcPEFi3L5OA
	VzKMqCho3BHLOwAyLerXegyKVEMW9TkQy6Lsq999Fah7i9EbWlILaKsfyzO6mfD6g7w6LRTwwKP
	vGA5+l7fJP3xzJXPi0AcUUw==
X-Received: by 2002:a17:90b:4483:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b1b0a4c331mr6596624a91.37.1794722459394;
        Sat, 14 Nov 2026 22:00:59 -0800 (PST)
Received: from not-op-Victus-by-HP-Gaming-Laptop-15-fb3xxx ([2001:4490:48e1:a6d:b698:9913:39f1:6954])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm10988889a91.10.2026.11.14.22.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:00:58 -0800 (PST)
From: Akshat Chandra <notmissinge@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	andy@kernel.org,
	Lukasz Kulga <lukasz.kulga@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: chemical: Add Sensirion SGP41 binding
Date: Sun, 15 Nov 2026 11:29:39 +0530
Message-ID: <20261115055941.362185-2-notmissinge@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115055941.362185-1-notmissinge@gmail.com>
References: <20261115055941.362185-1-notmissinge@gmail.com>
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

Add a Device Tree binding for the Sensirion SGP41 VOC and NOx gas
sensor, including its VDD supply.

Signed-off-by: Akshat Chandra <notmissinge@gmail.com>
---
 .../iio/chemical/sensirion,sgp41.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml
new file mode 100644
index 000000000000..28528a695cf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp41.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/chemical/sensirion,sgp41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sensirion SGP41 VOC and NOx gas sensor
+
+maintainers:
+  - Akshat Chandra <notmissinge@gmail.com>
+
+description: |
+  Sensirion SGP41 indoor air quality sensor measuring raw VOC and NOx
+  signals over I2C.
+
+properties:
+  compatible:
+    const: sensirion,sgp41
+
+  reg:
+    const: 0x59
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      gas-sensor@59 {
+        compatible = "sensirion,sgp41";
+        reg = <0x59>;
+        vdd-supply = <&vdd>;
+      };
+    };
+...
-- 
2.53.0

