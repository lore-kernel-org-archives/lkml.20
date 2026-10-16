Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388653A2556
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122359; cv=none; b=t3yfKOkZvxf9XtQFdJso/hYQXb8rKzAXGImqrdc+2222RBt42pNPltmmbMJY7KKb7M3/dAjjnah9Cw1Cmruhk7lz0+5fVlRAsDi0iMlZQR1qpi1s5+IM2SRsRQnK7cSkQHg+7FCvfROcSyGQzhNpCiI7dcKab30V8QejsNQ8M5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122359; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqfIwGv/bFr6E1c3iKlWJvLnh4AQbRXoqf10ZOxVyOcF/8WUgN2ksF3HNcNpm6CeQf9ePIp/V1Eh/wKP2dW05rJmJ2iy6IxNChBFyNwEog3k6TzfZvV1k1HqlUKoOX/Ke26u6oAc3pRTHgzdx3PLpBnczkcwxCmoJok6Hm9oNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0vf1sN8; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0vf1sN8"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f48c750afcso1858166a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122356; x=1792727156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=N0vf1sN8NkmIoQtAQDoHqZEFGrZdIAug4u8lL6LP2XRsioIzFNqoEvu+CGXZqm65qQ
         eM3lxPjJjb33vnggeQHlcP8bcRcukpIwOrsJH/19tJ9YHZkJwHjh5rT0p9/5bPtgqYNl
         dRKp5Hl/HJpWAxVvSUNoW5SuWTmEmvfD9eJLrNbCxhAxjRocUClHreR6BH8/sa7GfDMv
         AWlrjTnzr2yBgjhBUhBuey9IjZe6Bk50YYCeIJhlPMojbfiaxeKaSNXTDj6+SOdtjklp
         FI9x56fAmnfm3x/44vk0dpRzGyFwuF6AQiBHxK1cXKQy0LQWMm1AKpoJoiIvS6d0WjqC
         2bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122356; x=1792727156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=ZZVPOBMtwAa5VMo+z7Xscxwq62j68hNqY46l6RULWbQj56s2YM/7KIoCG62fbaYpeo
         UTsrb+dxiIr3UW2NN1CDi07WolbpnMYmqJXYKILJxSRCotFyP1p10KOHCYsU5cpTfxuY
         FfU9R6PkLXiVr2LAzI5DV3JuAmGBaX0gBUzXYFKrp5Sta8dgQiz6OnMELJBVZsBC1aWK
         fRSCDMV0iDOykV+EJjgcwCJS+hNzyxBMUlasQmNySewfcm50i4iiuSZyCjjREk7I268l
         QzfjmOnUA3EA3MXX1BNDxnDOMBWgXI4Qt/422Nw+QKuzjEATQhmYp9vaC6KIxLO6/vUp
         rQOg==
X-Forwarded-Encrypted: i=1; AKwUvBxlU4fwlCH60azE15LRClo0qT08p0RHgAodOUnG3S8g1zMmbqkVumTbb/317FuJEo38NoifwzWqrdztLxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWfO7wp8zxh7Dd99j2SRPsgu3tfXgIRPibg9m+xpX00vMlIct4
	lLZNAlbq8c/+U/IUbiPaBL8nXXvUfTpTcepHu1bhA8tf4LnzOpP/hXAM
X-Gm-Gg: AYBFou1M/bb1nxhorloE5AJ8aKZj8J38s1pBEEnxrBRv78OlqDzZGk+2r0dWG+/sXmO
	ndYkWvPhMVwy6pQXuOC3kleFB+nQldypJr2mE9VxklouXafHa3TXzJx01rTbhKZ4u3aTc3kcfvJ
	PQtOr7cPZkIXA685mkendhP6QNax5Scf1aWxaoPPck03Q8MIsl2kMK0OQlyHV5d0F4jvdtWbCgp
	Thb2QKHmcsXMGknzNjTFBQDeAfCuQmq95cF+8AHvQ8tI4VsZoAMgeO7mw9sE+DK1SHliNy120AI
	0lQmcF6Wkr01Ucn1o2i8sA/+3YY/ofXkX2xf9IEwF8znET100BKDtO8k8CrLAof2Syl9oT5/6Yj
	VKzyDQjE4dsok9PM9XFLAgb4EtNmy5DMuTZlISkZ4cEcnB7dUEH0LX0LaBtYMonwWO+tttZClOb
	KJJFoR5wl+i6NFEcOvHDd6sSnyHDt/ZBv5SaJvwOOXWjydwxengepNZ6ow9AFhqedh2F9zp54L9
	PHqrgeGeRlqLIz04GWYQ/lngK4S3eYLCkTZRuwlrswcizFCfBNJDYY10F74nqJBrlhzXi1vWxR6
	0+M07DUsmDfx3hZJWKXIkV0xHrZTziYPOxvKTys4mZLoNT+XYciz0dlZoMCxTDtZM/NqrlJXiB+
	PdKceYxVPtlCsgW+6yh+6KA==
X-Received: by 2002:a05:6830:43a0:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-83094e738d8mr20216845a34.6.1792122356017;
        Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:31 -0600
Subject: [PATCH v8 16/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-16-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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

