Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368134A263A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420215; cv=none; b=uxkvTJGo4RAelhO4jzVhZFJ8pJE3vFGmQjydFmrDvCykuHx9U5i5wprllrJWXOFS3du3EMbYqeBsxqeXDKM5KYwQmqvmVEhaY0OboY/c9DN3+gMF2iUKu4vubX6m570hhkUqOXgefGCO3rzqfPPjLB6m4s+jnA15M1GvnrEVVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420215; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrSOYprOPSa5RVZidhNIXp9PMq0jtNu70yhzmRUqmfzPY8tA1dyq9fHpsmNmtZOHFW09d1G6Y4Pd4NjsKSBHVVw0lRpKRNoec8hkcYpoDURHui/Qu+9bWyFRyUWiIqg019gbGzdnX9KrKYz5P4eJCgBmLg2CUOvZqK/8MdxfRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouj664Ec; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouj664Ec"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a2ffef2so1042875b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420212; x=1790025012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=ouj664EcdpP0t3B/OjlhZAUIkPQnmb3M1wgCNnYPfS7qSsxM3bRei1GQKaRLkRlA62
         oI/1kxXvPM4Rayru5ipeUPGlYgWGC2IiWT53O0l+L75+gRtfgJg+KZXdMxfwJc97sc34
         KNGeZymhUg3i/uzjl7tFi11f6kbWgSbs595MDObX1dM6lF9PBTwBgnzdeAInzUMJbUfi
         ygJ3A7c8r74M2wjM1NE+32BDOZdVnPu8ybCtSvys40O49hIDGUpA8UHgJLkM5BUJoGk6
         e4OxT9S3ttsIVNWUJzq2T0Js640tu3bMOF5waqJDlSSeHo5Uj/Q0RWPVbnPEZG/ffNL8
         Vcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420212; x=1790025012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=ZP4zk2zDF9eCsq/RgHixdretwQWQDc12sPMZco2Sk+WA1ZqjeFPdjQJ5szYbPSSo53
         TvXlwvdQlWzQAA7+AowD74FuDQtdmcqAI8KVZ1rHaoJj0+hHqwMorD0zHnHjLbvX81nP
         09Tdo3Sfly+NQqSsC6VMNS6sGGj//huwQvBJvqhBYVOekDzufQiWxTNi21l3I64V7aGl
         4y1VC4lsasW5Aq4OyOqgsJ2rX1zkXKg+L4ghoby/DMIGOIQF7/i4Z6VkVsSbcRaBKIlv
         9Y0WlJXSWzC924bTfdiurw14yQDgRqUf3T0ARYXLvpJw9xpJRt1qfHzQCazEs8Ynr2C7
         Jb2g==
X-Forwarded-Encrypted: i=1; AKwUvByyndPepDDzyDnwnzsMwsus6qHdageCq8SzMjvuKxJy5fmlh66E4pY3Kk4YDdt7VYWb/Y/F/bw5kyhaFA4=@vger.kernel.org
X-Gm-Message-State: AFuF++loct6RLJEwNzOSwwptk1baK7FA8iy6YFBsi87au+G2gA4KjSpt
	GzKSHjSZ94ervGnmgHSXYdTE3lPx7sEKqA/ejAJgs+NFCO1fOjzrlovH
X-Gm-Gg: AYBFou3F/18ef9S+oSy6phw6oXySPXDyNAW3h6h0Op8NXnBE+V754zgB67JoPff6Yzv
	aTp0a4Cv9mQmCS6DvZCOD9VzHeg/PhG1X49V/I7r7hkFMg6Gv0bX1sARCuMrevgcvzSNmJbSRbj
	7NLiAmbQ8FOgrMsVn7f1QYhBKKCXmLcChfb5LUInOP5hzKAa3ZtIgj91VjpZL6VhkG75TNuXAhT
	YOcMD/AfphIlyswrI8etAhNSHzgmIIM+0CJbcdQ0r7VM5AQkPXynBRqr+NK/UkYOOz8AC8SgFCw
	eN5jGhaHmPCVZPmKT/YL5R2R0FeBO6etRyBAFsoWmr+FBEzME9yNQH19aFgc585C+ZrC5FW+AuB
	WS1S4LGkeJyQ5H89h5QYamWYtnQOmgvK1LzKtNo0GFvBVgZZCVtyCvAgQfGVROPocG7aVp6mT5o
	ybdnd7/f51EFQo4IGyn6QlFoA1Bw0vgjbCoSOMBwDZNPwHUH/xx4Q5KbCyvZbMr0YwngnwWwTjy
	e1C6EkRTX5FUD6anJpsNKpV8E/cJslGFRMZ4J0vTXak7SGe8RgWJ2rk9MCKC4OXpNbe/k9BSJ+E
	xK3i7QedFKJrEaEZ2FI0K1+WMGyLRWZbuyf0xf4isRNNcKePNxYTPv29GuA7gXUC2qVpb9elY5R
	P7zlK69Ede6u+hFqoBif5dl5L1t/H
X-Received: by 2002:a05:6820:1609:b0:6b9:4557:2722 with SMTP id 006d021491bc7-6c53f252fa7mr2388952eaf.3.1789420211667;
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:58 -0600
Subject: [PATCH v6 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

