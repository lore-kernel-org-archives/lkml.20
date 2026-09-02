Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AFA4AA585
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369759; cv=none; b=bdTYFXV9g2TrqKAxvbgEjNDoxnMSI3cdWXfX7m7fkgaC8n1BP4UIyrbGwggAgLpJr4nVa5rQR6u/HIIC6YZ9covk4V+5SfB4ds+2hTikf5hXDoy3jnHP2k0kpFsVKnrrw8k/86ng+OigdfIvKS9E44m2klqQ9zPwfZdGuipwuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369759; c=relaxed/simple;
	bh=Nr5B9X/EA/TPHrdPqN5lYHsqf+HIQ0e6gSRt/7NYRVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNPQJV9G+fXRQvvGQN7R8tvSzLqoZtwdLXEC1I/1DZcTBaOiXqDRqtnjCwQVkCeLSb4Bu7szk6lbvr2TRFbjjXBb2exd75KHwB7u42oM9hTfHV0ZLwHe6vtmLNvAgIm5wtLMtcdau5ajhvYQcPqb+mOiRbbPz1k+Nqr79r6a72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLMcVDBq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLMcVDBq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so13836255e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369756; x=1788974556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=aLMcVDBqVHT4BH97s7g+kcrhDlAbQ9HBXtgguDvbd2RwOvgNmpcZLw9tTlsFVNq8GB
         x9jLDFyC+E9PbbROEBGHqKbbh+s9JwmhRcgmZfx8WcUy4D8gmquWRnjUa/qgQIYNl4dG
         5k324k6piC4a2Aj6rlMQPHZAdZKIS2Bdj8zGkjDVkv+OoZ93xB9Rno8dcDCvusXCFiQO
         Gydf1mJL1mx6il+N9cw5tDwhzbceBaD2XzjQXsvCa8/wh9ru13RMSNnRXlo+0EOn58hg
         rByLCDU48+lAjTZVflFYVrEtHKJX2Tm9LM8y7sOK/HAtPrQhZoc8JZBVH1iCOktfQ7HC
         aGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369756; x=1788974556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=nFp531tmWQ/zAZZBEr2z40P9K0UdoJ6eXEN8wp+wcZi+knFLOamj/HJcjljMfktqrF
         xnRBoMFw+4J8S37SFUHBaac2sgxfXVag19KJz0Z5NC7ATLbRzpqMtGT313gjAkWGpLhU
         flrf37WouHmuWnB8iMfLS4U1mT03CFDNzACl1LrP6t/hoYrn+pHW0IXhNDiGaMaCSebl
         16YXZgdIP87RCjfS5GAU8wX3rCtsRAgqvsu0WAhz4KzfDxofqdcc+CvuBfsBu3zfRhwX
         AnTknTg0D7f3/Jsg6gZMGH6qS59uJWE8KsJzEsVj7cPOhAk2N4XGKyp70mH+INxdBkH9
         JtaQ==
X-Forwarded-Encrypted: i=1; AHgh+RomA+OBQzm0X/8SlUj6T4TME9B0DqNpzedUTnd6Tzqnkv5qEgSDknK91i8uJqHEpeywuxOELzWdVAGZTtI=@vger.kernel.org
X-Gm-Message-State: AFuF++k72Z9toT3WUgk5AL5Cs8xOYJTlIkx6Z8kauuGpdlL3kAjLqoXS
	yIHIzMiS0i+MiUOP4IDyIAj6hH2jbMw6VOWSpgtnc0pdXds1kaz4Ebox
X-Gm-Gg: AR+sD113JLLHsvnRN0FCYS6vTaOMkQJSMuojp8yGiDu4ODh1PoLcWbSOK6qB4hf8gKr
	kZWKTMecieE9Xoa9e8jRTKlwB+0ROer2Pm7uZcITlnQ6TTqkW+6/LoL98hyAs+l+GXAX/5xN7NB
	L8rb256x7pxKGpO3rN1TVbjEDwGG0cgqduLh0mEPWMqrtaq9b5zcsV+mV6c+WA3LTx93jDy9F/l
	2xTOB/lsDCfvgRS81ZZLRExVEm/Ghcntz3Wz6x8i50kcXhXV1/jHX5yqryckHLhDAT0/99a4LZf
	OgBNGgp3/e7XWJ5mqDUS2ov4X3+in+phlnqIh7pi9dVkpJLG4ujpOMDTasP2fpp1q/VlRbxp9ge
	bOAe63vKwDJEPpqZEF/Bu00n2Yp/tNJKXi1CaR9ijqWIop9DkJ8+w36Dpl5s2re9rCgW1VuGJzX
	P5QwQrqYvATFwcYDyA9Rd2VQ+FXFq/BOXUfm9Fu8t+DsawNDm4FAPEWdMcUsG64FtShRlSaWdEl
	g8GNZZpOtQSjVGkA9Tgs5nJw48v0FkjpArsMvZA
X-Received: by 2002:a05:600c:1d1c:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49ce584a24cmr99214025e9.14.1788369756384;
        Wed, 02 Sep 2026 10:22:36 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.251.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm5813145e9.8.2026.09.02.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:22:35 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Wed,  2 Sep 2026 20:22:29 +0300
Message-ID: <20260902172230.5234-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other adc
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
index 718f633c6e04..777a75c21d7f 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1015.yaml
@@ -66,6 +66,11 @@ patternProperties:
           - minimum: 0
             maximum: 7
 
+      label:
+        $ref: /schemas/types.yaml#/definitions/string
+        description:
+          A descriptive name for this channel, like "vcc_ram" or "CH3".
+
       ti,gain:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
@@ -125,6 +130,7 @@ examples:
                 reg = <4>;
                 ti,gain = <3>;
                 ti,datarate = <5>;
+                label = "CH3";
             };
         };
     };
-- 
2.34.1

