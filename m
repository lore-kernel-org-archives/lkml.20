Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CC4229B0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557020; cv=none; b=C6OqHCvlY+sAq/r3H4Lk6BJYy0/8T8iwC/nD4PeI6bzlXMh1WwfCEswSO/HnILFGvbDbshbajsNs+wGKvYWvOzKAIgimmJuB930Dcm2nSzQXsU8I3Ifq6d6IZ1Iz5tSs7bhyR83g1IQD0Ca9g4nf7zjz21Jnt2Tg0X/GQmI4kqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557020; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKWEzntd1miUn8ZRvhwEqDwpULsYmxM7VahP5mq0zQYxFBYnJjsQczgBlFiKtSHHxyN2KzojzsON2qQBc6KSEF86pNN/fq03jF/j4om6aCLehOj1QhmHFfhRClJ4q6WiugJ8K1KgeKdbuUYVM1hMtASSlVSB9l1EFy/M/xVgAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hShBIqEX; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hShBIqEX"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so2055669a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557016; x=1789161816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=hShBIqEXlXU7ExGsDiGFf8YXaBrcUIXtvbFGZKB4PJCT0QLq5zQhefmyoxPKo1+Pcq
         y16NU7Tc83rgkutIiroHqFe05pzYJfnkyyaenOQruzD3lMrjSfXSgcvKA0RSsDjJxtRU
         jPDAaSeHRgEs6HnTnAHlocL1LJLyQClVIHHlVE9xKN4L5Tdkniu+qPIKYY2eWOb7+OzK
         00GouZZRRHBTOC5b1OPg0LuC4K5q+vihoqfqZIBRLgFrRZ1Pd5+x4kf6aTFun1PB2+ma
         E3Yyj/SiO53WvbLDGaBRCpin/0xp5T4spiqHU1JsI0+B6YaXIZSeQfVLxAno1dxmBPxj
         amUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557016; x=1789161816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=SyE7UrG6XdFteKin9Jqy+A4Q111pd0zqd62nFVyAanUMgmCsCQoGUoxVJf5rRckkMK
         iqQR1Iyg5vw3bJNAeELjQZD0ZPBQFLTe7Q3C5lYWuQOvDgr8SWrWChE4Nn1LlltNOSUN
         FH16X+S76k2LzpYcjgATTGeocPRRANzq5fgQlZB5UMR7WSmY+90JLgeOUvLrzseq993l
         o5b46COwdmz4RiqxhsnShfbjHJ57PMvmdFF4HneYaivA1dKZhu4ErXawxBtcb5woxcGn
         BN+iaqritekHeeOjfQTZ255iCDscu/EICCzHc1tBzPRFkNkXWxXUBbbSkjTzZt9OO6wf
         mPzw==
X-Forwarded-Encrypted: i=1; AKwUvBzv1c8/OdgPQi/MFABJqgU501+Bfms2ACUzSTTNCOhz/DsmWJWi1itStpcymLe2EtbhieILzJd0ANQdz1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lK1VNI2f9VGrjtm3EO0cKG9d/AqE7tzFx+3ZcNfdWd/5naOEsV
	ypaGQg6ZxrYHoZseRAgVLJCsIn3JdtDWP7qRaQhJ5uSz/8uNEq6ydjgu
X-Gm-Gg: AYBFou2GMA8dZxHSL4kl82W6lZEY6C9fbrAVFkwEzpezT1YdphJP/Iut7Xm0Jcj1Cla
	iBXL6WnpUBbwxroq9nqtiTBBboG+gqQWmtdzOZGkcRaz/0dLYY/uctLdzhH+g69zcXxVbQdwFI5
	fFjvVlPoDW5PE/ETrt14Rlwooslkq10ebcfhVOLgDgxBLfzUy0cm5Zh0ORlXorWz8GB/4gmLCxn
	w/SD/OIXeUZY5d87lSlQkUw6Jo71mmkJ0Vzz2zKlK4YiTs/86Go+1Fj1qiNDGYghDwt7qG9kvIG
	ZIeNrYT8NHrb4O+Nc+cSyyTpam/4a6euGIlxPXNyHZotOrsu34STxhSkk4F5IPy73GFoUz4xuiU
	YyEiPf1B8DJAELG4xVMi6W/ONeq8h0b0TmkjUGnzBGccm80YnI6kwJ3QL1I/9MriDjH+GcZf8jn
	Ag3Sio5fbzbIMEno5FSAFpNINOrK4tr40EU8BBi6kRVfp92Wl9LuIksi/5XQAjCDwskr5Ir65XU
	KCGsnjgf44PrgrircGIBq8H4XiraP1CGm8zU/M7PcvaZd03ZjZZxRolQlME5WO3SjMKnAcCFvle
	n2EaFXoBV0ujL7IkzMRy8FTsop9qxH89YM3fXiKJmVQaoib5ptFywVtnges805/xThDWjo9xfO0
	pSB33mPtnetxQV0FtnHM=
X-Received: by 2002:a05:6820:1521:b0:6b5:ec3f:4983 with SMTP id 006d021491bc7-6b71ff594bfmr2962915eaf.30.1788557016267;
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:11 -0600
Subject: [PATCH v2 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-1-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

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

