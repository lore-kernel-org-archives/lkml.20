Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710C283142
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288190; cv=none; b=jMQvYnVkkQ7gSGtV/7AlxgP1RX+mVageTg3hMeTwDwSN29CTT0HNZYa9VYPpNVRRpCAxGKs3r9syPrA1vGZ1yK1twvGMqUpJAbnBpG6z33zNITbIWE6jYBSvxD4R7CB9PtE5KRsZxMY6Gg5Asl59lEg661W7oyli6ax2lvCOSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288190; c=relaxed/simple;
	bh=Nr5B9X/EA/TPHrdPqN5lYHsqf+HIQ0e6gSRt/7NYRVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TN4iaStb2/MR7+RXAW6Hlb88b3xAU8mi08NDZq0UZTcrBCxXC/HEJP4m4WXubYWp6n12vXfZEkJ1QUwm0bzEJXMEOm8dB/tzGgJPOMk4kKK5vq84GvUAvkMedStVu7KLn1dbRQdQuLEmNsePPBzsUgbCQWS6P4WkIccNnPJ1hko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxJrSd+n; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxJrSd+n"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso1179635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288187; x=1788892987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=dxJrSd+nCz1zSAvEg62OoeSgSIIoQ7VPBbdx1S63Ph3i/xebLfQdCsbjhnGyEUOIq3
         k0MyhHtUXoKPCCaWLi8jPm5TXnj5pHiboRpI54UJpW0GIAYSAh5slXJSf4HJeHAyqR+d
         p+mNx/QLVYJOelGxBtghwuMCx3BOZ4VZWFUBwL7rM4IfKUJw0iKEXduJxnc7ggpuNT7n
         yjKav6Esuyz7qQvcoqPkWpLD/bnsyoAcENOhNm9qQlsLpFYFB4orU2jzGow7OPzj24CN
         1S2DR540+rrZwGhP6kBiBO23RGLs3T7AffCEVtcV1CM39pS8Blxpswq4Zgj6MiKQ0qz6
         gykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288187; x=1788892987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzeE/hU4D9bblLATFtWOwYmE1vpCRHRwseWHzl1OrOs=;
        b=pd7coxhvz2ccdn5u66Oq5SFuCUPy1TezF4vqiH1d/o+kFxvGgh8UrXNzR48g7AUS/5
         KRElSfncwFg8AbVKChyEDTZ/Aj2NPoQSq4ooV1ReyGCqX/8pWZZzffg7wEpYmJeU+yHC
         QuwuDuMN0PCm4k62M4K35Z+IySc6ApzUItkSynWhwZZKsbeDVUH3oeSroIwn/Qo+zo5s
         4B0XqgOMSkzC0GlyCshQPi1M+KatuBZT6gicy3AaQSQyQsekYNo4iELUJ7ngRPHqNXqw
         uGdZoQ00b/yyD0IlVYoXlXpoUgMub9JJHcbMmbhL1+jqc/V0ENAv0gRjMu2ZQ9/U0Ayu
         8a/g==
X-Forwarded-Encrypted: i=1; AHgh+RooVqhqk4ON7Fr6V5ZXkX/6Jgz5q16uzeSM1iD9bDVNP/nqmsmQ32322oX0zHS8g7GH7ntPlMiqjwuRrBw=@vger.kernel.org
X-Gm-Message-State: AFuF++kfV6Re5N/cORBAVYtWi3dlxBS6bePbPbxQNdBxMXEhvwB/Ru69
	KGKTA0okiFyuqUWlFKaxwQ4KThStWnIUND30nXE7vetl5/cXYVzGM5Uo
X-Gm-Gg: AR+sD119thaibhFJbITbSrcPAiq+FeO1f30zBIR7joABOttmXKX6XmPgtiNReA+um7j
	M2ffVUsGCi2N8qXbpcF+jhV1ldaTzo7nwl2GA7k9eEgby7Yt8A7l/mfgTYvzgAipFdERRKtkfeo
	+JEBSw+47xh3JwjqcouoYVlcvVnF2d15QLCDEiwPjXnqnHAFuFckz8HSlSXRAN3ZldJwbcPyGuB
	g9RGFpzEUeEWPxnZlnUK8s6EA4j2+oZcnE4DQAhvhDpXZo0jz5+vgETNxNnTDBltG8zG9g5AoIR
	A/eawdWLWUa1wXJfJS9/gYEiK7A+h1qrD3qBUdfBsu1BK0doPecmtjcfvG7VkcHoZifBlQDkrno
	OpggZKNvxSD2Njm4bvf83jpS8UwLGuB5pZB1PbhgG4LsmlcwMerq5eIRVcFRJMnuuZuSeMp3v8X
	3uLe4DAV6eVSAp+UuRbSod3pAJ+91RIaTyYOg3DHqkW/KY9uGREFIkuw6wGxgS0WBzTK75kwG5H
	TU476IyKqTsmW3BjGVUmsZpWEV591kDj8Bt
X-Received: by 2002:a05:600c:64c6:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49cdc558470mr204496575e9.11.1788288187157;
        Tue, 01 Sep 2026 11:43:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm822987f8f.24.2026.09.01.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:43:06 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: ti,ads1015: Add label property
Date: Tue,  1 Sep 2026 21:43:01 +0300
Message-ID: <20260901184302.8127-1-flaviu.nistor@gmail.com>
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

