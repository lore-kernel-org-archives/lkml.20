Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6C5A0AC8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895270; cv=none; b=uYOS/hUMCfX0jhi9am/hYLvtLZlpX1w4q9Zd3T9MOeDj1vaZVVz93XKuTaLmJj3Uacnj4A6gpmbEc02ypGNaF8ojYqsWkBWqBIM8EUZ1wuNPt1RYQ63WVqYHYGsMxS0luSG3K4aWMf9r+J2YhqPNNcnWRhGtTQVOOS3JrEqcOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895270; c=relaxed/simple;
	bh=6A1+E/vOD7X29NvY+oVvPlZs2BNXNhPpx7MgYd5DIlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aj88XNPcAOQP4gbbmaF3DS1ZvSy6ek2GjcC0GyxGRMDMz6Tq7CUgMQ0j1y1rLhkrRyl4cLqDO1KyaD2VhV50lAV3FqOV0jBoHbpk0T58a+rHQsB8qCMapqrHvbwJFIVcqSsao+jp798br8aVLAPJNTNP6HWPY4+0/nxcVty2U7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWHzRgJp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWHzRgJp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso44834475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895257; x=1789500057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C2znoDc6QFtOLilfHto1MLA/C5JcF5zobRDR2Fyfh8=;
        b=BWHzRgJpnXvqYctyVfmeiQqdbiWdgKdoqxOGd9+3Z8OoOw/WgXgqoTHwGxfHsTkxpl
         5mX8Ds6ePsh4E7z2JLX28v7HiMvIycEN610oM6IJclOx3MRiUFmd249iqJJh0rZeR2zY
         vsa0ZJzqozus1LSaiPShqIV6yS+hOHgULU9R3KnVmQR4ey3nY1hiNDWa76aFHw2oETH/
         YzTs1WCzUBFdarLLju8/BpDSCREfFoGsebF4vFDWPyWt27IDACJVjOXts7UJAXWR9jAd
         XzZJJJdHagLQz2jsSRJ2hwmCzmH2nEeT8QrXcPiE5JAwrZBEFJvg+8DUe8XTpmAhjvUp
         boeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895257; x=1789500057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C2znoDc6QFtOLilfHto1MLA/C5JcF5zobRDR2Fyfh8=;
        b=fZbojv8icw93ZVh185rnSJIv1bAk9rSuwKjQ1kyTkfq5C2D+h30Gm8ITmFivlDrM0k
         DPSAf2FIJEkYe5RRPyTyKKu2fi0COppgRlf9X9qp9XWBk6qObsE/xGk2sN1P8xAjZCgv
         zCpOc2JUMxAFrcTp63LQq6DStWoiL+PAZSmSrZT57aHsyrS1q0AT2/kQ0aG+4q8iaEKs
         3ADZowd7QB3WvdE+hUSnureBngMQF7DW+RA6LtLFErjXqq1wT0kQj1mWz9yQaMFMv2ib
         ENAMiIn9+e3u6PhAh9IuB8SaYI64gFdNS0G8HNLSfvtTwNSzgG7h9KVDxenH827hO0kp
         mhPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr3vQJuj2r8PXljzTdDpFDtheXXKAgN/oDdp3cIzNzyHzcAvKiSJbSBbd7PtwNv+2lu/mBpNPSMbnc99Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n2n17X7QAN07LJiLhqSkecYj+5QLC5qKD+kXIKroKb2H33+DsF
	NkRksb+1MbkTIf7vQ6FIzhJmPHRbGT5R5dYiyRSVyphGG8LJf9pgWOvF
X-Gm-Gg: AYBFou2DTP7rBAxmjv2K93LjPi7/IX06xZ93tEojEIEF0MwkH2DKg5nCa7TbCIOzaXW
	T7F0oqgLh4zyhlEUO1os/w8Jk2l39M7HDyrXyIEAJp1GZGpD4efClvbsp+qxXcI6xodHj7ONQ+5
	QsbVDtS8oqYmKZbRbRSXIYt5P3ikDhQ0adIefXdD1hl87IwWvSHyeWeKeC0Isk44FFO5XaKs779
	CQ7i0jzv504sm2FuYbiF9aXZVXog+4KV/wcm8uYx6PFUt0CcvuYkflGUozrgWv5VaLspVhyXK/1
	IUHByIxiianUQsRBqbZcrFnJfWcwHiqVSmGL2Ey+KNCeB/16tdJsqlD0qbJOLHaOGZsQ4za0bqG
	KuMaVEDiUfLWDde1wMLAQVqad2qMhV7kITqCiuiPgqCflkxOv6FQSQwZWjua3HScwlYX88APuUc
	gloLfyELGrzeVTowTI4z+n8o/vg3fXOcf3KHVC9ahBtok07ArKG48MXhbwdfA3Rd2jWQLE8I/Ns
	Pg5LXLsxkBr+yFqFheXGBmKH1NNTuq/XS6e0V/BBg==
X-Received: by 2002:a05:600c:3495:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49cf8244260mr314855325e9.10.1788895257060;
        Tue, 08 Sep 2026 12:20:57 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm407885845e9.6.2026.09.08.12.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:20:56 -0700 (PDT)
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
	linux-iio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Tue,  8 Sep 2026 22:20:35 +0300
Message-ID: <20260908192036.8503-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908192036.8503-1-flaviu.nistor@gmail.com>
References: <20260908192036.8503-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for an optional label property per channel similar to other ADC
chips. This allows assigning distinct names for each channel which can
match the schematic signal name.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

