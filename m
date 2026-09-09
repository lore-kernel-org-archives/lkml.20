Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DE471247
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942669; cv=none; b=m1smxM8SeDLPhLQu0cmlJ9OsBwmBQ0jpq3PZNLI2r+h19CsA1xRD1jvoWI3maaxaX3kmnec79uRVhf0dVTMs+9KNGCYX7cRJysaU4NAoSjXGFjiq15MdKg/tacvmMTRC5GBHmocjgXUHyvu63tyFlGtUZev2W4girCR4p+B51LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942669; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vla89V85KjhJpVzoGMmWImfcHCripxxH0f4NOb5Q/LSb+9T7W0aKA4wWorHR239enNlcS+6h6pBiebRpYllrt/g83++Id10OAE7yOuOqo0loMwknb+rowG8o2zBN5QqLhjF9y7an08U4yNXeo4NwASXi8vIzsud6jLlsoGGi1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3vpeS48; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3vpeS48"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3136422eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942666; x=1789547466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=P3vpeS48JWiWyK4+WoYhfjKUJEDSRSkDAcP5BIff7quilpBnEMOrSh5bnHDHZJLQ/I
         P4MEsf0O78UAzZYWmUkJJyUkoPLzKNol8qFXvklseN09ejGC0cSXPcy7Hp2quNgcvLDr
         6PRfh7QBAcUmoHbryWxEwTwzRj6XV7T5WsrNRuFitTfZK8KZ7qwM1xIk9vi1x8o1m9GH
         IOFZQizDn0ks2MVTbyNrGj471rQRKfAr5ct5aJcZ+omfKvecNWVqRqDryVAP6FdCbxZT
         gVSJkcNF8Ij4uU5O8XznjZPaYPeLmL3siwEl5ZlYRBhRUd9/cxeTkikd2SvG7aZk9yni
         Ll5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942666; x=1789547466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=dnXKLCxRJ6NuSmmU4wJoK2vt14faE6Wok2Q4qQAbJulgBUPpob99KJT9jpSziCnYGV
         iQ/1kyDJvQ4pV//mSTKikYXFrISA4C5li7vhIBOxGdK3jNh7vloWLH7y0oQRTu3oZHA+
         xgwxxJasuVsZIR3ENL7p0U+abP/tFn3eFZwsANEL63466V7JovSdPF1VFCE66QHRGNtN
         dAcy/sAWZq/DyBdWvM+V/VXaiEItMAa4L4pSsWR3b6ibvG4GBn1eyEry6zdSFkcWzUXg
         z1cOLsKX1+c4H0Zp+wqUoPnnbwt2OG1f08GgvAciHEagA/aJAvsysibXEa8rmbzITZSy
         /k5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/TTYyy87AEwA0h7HYDAfpM65BIRgwrI/Zq5hc2ialaLzCDG/Kii4ZStDtjnchu1WrJam9HKK210gFLxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kpS6GP9O18ZRVd23twiF+Ww2u2oyZRsJ8QVkPsZGWq6A7Ekqvz
	jvHCZPVY+dMm2jSbmGoMYdElbIlX1zvlchnIloV6A7gIfDg05O5E2lSr
X-Gm-Gg: AYBFou1jThuSPbWy6takUUhXb34So0R8ieOsyJExM7e/Nvb2Kv1Zp5N1giHlSvCN3XB
	brmsySDW7pn8s/B+q3e/mUiDvq66KdvWQpn+Xq4dyl4j3XSEgmExxUwAGKfBcK7PZgRApE4vkZg
	asZBCWKACHF3GQzwUHLwyUWK7Sw/qWSJ7iIHdlwuJ66wbnW4oLGmkYJLn38ppy34Jj0rdDB3U97
	TvhcxI8dfrjS2YIWEMGOcpWcXD7KkYqqu0fUok013P//ApwuBXnfwnIFyxnnLZgUCnwybkwrmA4
	jDryCCBcfYUhRcJz0pYi9kwk9x3usQWZhp9duaa5rCGJfEtMVVKwxjjUUBNvXE2o1b+kXqMT4ES
	Up1EHpBNr5s5f2T3IISARYUnFJTSZDRq9xXz9hyT8iNxrj1pTw2WCAPK5jD+vj0Von3mfRpZs97
	tWS24Z5B9KHCcPPPn/P7PXibDgEhykLnUqyr9GvPPlwTtgJ6o0NeDquby6tzCw3GP6cWFvoajzS
	P5CkpwYZ6RQ9s5qiZuk2Rwqn0Y4/VEtw21pf/nuRJGsbFkiHZcoBl/Ods67UXkoQKevtPgFFlNd
	uWUDIN5M2gzjmvGj1XnBNsMHCCF4TJkHv7boRaicOPhG3p1H+0Qq0H4V7Onal/kgLG8hqTdDLCj
	VV4k2yB+j0Danxdkfe7+xuYQda7XP
X-Received: by 2002:a05:6820:c84:b0:6b1:a0b6:72d9 with SMTP id 006d021491bc7-6b6fd3d694amr18766040eaf.25.1788942665879;
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:42 -0600
Subject: [PATCH v3 09/15] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-9-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
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

