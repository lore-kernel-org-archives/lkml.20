Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C134F247
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028082; cv=none; b=HaHoMl151yjiCd3B9Oxk9Lr/rDX7ikrF50ELgOC8edX75X+/JposhJPMIQcz+nSNA6Za1W2Ur/UznvXUOynIExyJYFM26RXn0UWYc5PRFqnvOdCoylj9xc2Rq/rK9aYV2BKUmMeu4UB8KOMKAGeuDXvkbMpM5irKMgEoFb4Uuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028082; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnQ+RNceNICG3HX2c8JXGaQSz1rb4gvCVdD+J5TTWeXaN0pVkEhezYhlipfB8186Ipan3f8SaO4W2R5i177aa5ikzxJhrSuBzqiWG7UtWLC8RJ6e/Fw4PNf+yVRLDVqAc8BvizlLPVPseWz3nLGrRb13v+wKdQfISHpgNPm1y3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRW8l2bX; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRW8l2bX"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8253bc5a613so1139130a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028080; x=1792632880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=qRW8l2bXQ9ZgYGTaJgxUQoYiS9FCtkxx4Vh2HqnHjK4JxVmePoN1hWFVL7Q94GQQcr
         lGAUo8oJS6qY95g6BRwNebWrt/SDL89vCFHQi9fXwgBI0u/MLVqmzWqEWY1i1gpB/SCe
         COQYo0j6n9GEEcbM/JYtbLkE659AMLrHmjvTNLvW/U+DgRU98i8GBX+pS2Kya1/ynbpK
         eelscwObzwNmy4iLq2isOADRHkIdmD8TlWujQzyPw213tFA3n7Ha61SAMkhFXcFCcSuQ
         m2hF26as3bOTrDkjGvgCbcO1EH38LEqB0O9cIPJF3mfoE2ScnOnTaGyTqmQzmbY4c/Wv
         5oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028080; x=1792632880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=J6eM3EtU59nft5Z7I40yFHRmldZWu4zvOatMDwIdJ8uAvTmWtycO6fw8SicNRfqaOg
         GRcH6DApC1Bo7TlOLtJIOrUc1ObjMctJ0UJRUPrcq1T7gHBH+kApHj4ulA2zd/bxcE7D
         VyNNZSNSAQhLZ73ckd2cyrvXcp3FGAcrJI0+Z/hlLD2M/n43Md7Ir6NQPpAKbnJDzBwS
         Okk/L2NHnOAGS5TOf9VxzR9FHzDVxXw/kP9mcK7cyoURMph/3HyDE77aWFx7blQ6ULxY
         /LCNLe49SlwDHyu1DTJpYkXd/dropU0K++aIZ9vzNGBWYRiO3rLPXMLtwEbxQf8zsBMn
         om1A==
X-Forwarded-Encrypted: i=1; AKwUvBwmLkmEq3ayCPq4AItxQltrl6OJK40NISqHcCdTklvOxFo8T8DmX0lLhFYLky+tZv9vbWpgGm6YQKbjRlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9CB12Qv7aKyH8NwTqWkQ3+M6mKOM6YFprOZWcLDnhTp7SnUkr
	frCXrMmLplu/KoCVX8FmHoiJDFF8hAnB7Fcyuvp+uxOOBrgKxTg7e2qApnYK7cpk
X-Gm-Gg: AYBFou3QHNfMeAuYtfzGcqI9Q9sqszy5ePQgkQKlRpmk5xzZ7/2cKXq+s2Bd/eAOydb
	eti4eKiKIP7NK3NjgS41TTApFjgUHQ81D5Ua6366ZSnzH7BLFt0CJG8C9npepCmhkSiGE5Vj0ln
	fJApgh0z6Tj5jJjZZRHIUtf4OvNxRMKgenS8ik/olYknvkScegC4qbsZAhjRxyA5VAbOY/7OhZ0
	u5RiF04hKDELqjGIDyN9gs4VDZ+wAmFQspCt2hYZt0HKv38YwlAxn3XszxMCdHM7vymHy1XSo3j
	wYsYdvHE9h2gl9tSM46wEPTD5tREWjMqRgYbK/ZXX+BqhyQIMEuMFKhKS/elVB/GEtzk0pi2E/w
	Yf2r0OsluaW2Vb2eYZ70Ev1ppv9FPhtqaiFXIf7UbWyO8axNrPPjy0BMS7JHU7NPPuflkqp82He
	2rxnF4SdlQbFj8fA/QGE/IsOEegffAdVMW0M5JOdPa19StdgU1oP4JWvYZtvOO3BA+Q7AtPXx1L
	usX4Su2i6wccGygN/pK7gCQuLtBSMpYAs/qr8mhSeMeqtUYKOy4rxP0k3NlDOSg7u6j3qINcoIQ
	qUudY9A2u2Pzv/qHcOPmpOHndLuWkWY+oUAVKqX+VcnswYHBvlp/FyODUawEHF5wWYrRVxYbzCe
	7Sf9rdXdGWS6PKu0n9YK4
X-Received: by 2002:a05:6820:4b0c:b0:6dc:3be3:bb81 with SMTP id 006d021491bc7-6ef10492c39mr14343257eaf.35.1792028079883;
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 -0600
Subject: [PATCH v7 15/16] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-15-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

