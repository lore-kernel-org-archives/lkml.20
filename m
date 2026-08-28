Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1C31E82B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927622; cv=none; b=gBBCFVSrif0CwI1FL4EEiRINeYl2U2+LIOqBM15PhQEpGu/mRyYJCQR0bV+CJWl6ZtZNIH5DVba0zgYbQtag1WnCtG15VhXG1MZXqhjQ8pzqClQiLg4XGr7oG4q47STRpUpP5H7Xt48oHkMDMFFEGhrr6oNrJZMl1U8HFP+FIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927622; c=relaxed/simple;
	bh=IbqMzrlz9jgGlgu5Uii9Ty2qq2/6s962gHem3A+myDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYyEmmj/IROsKlxWXj6RdfVEr/8GjfX1os1r55lR1YL4eIx6Xdzdt2AG2QISGRZoTmfWVtwWcbSs1aOj1nv17K9No1CCx9/Pl4cdZPk8fVkpzmFNPa8VtGIby9AGDWKuLcLqr0NX9M+/VcizUS1oArfDK+T0n8k9xpY4t//i6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6FFl5zo; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6FFl5zo"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso801579a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787927618; x=1788532418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=X6FFl5zoD9u4203ixJrDcm4jGahhapRqbV/ESud33cwo2Kp295JzvlRHWxE37Km3RI
         2j+WGEie+iR6kUclbnnTSvvE1CgX7RkokfNGHr51k0quK6HiKvSOKwgiJ89Ewt2OjIee
         2zYBf125URlpWHelwAspmDqWERSLK0y2WGMMsiKI0oe6wNbZOyIa0v+gxvAJVhD3GaUM
         bbqiW79hIQXxhKv28de+o+a47sqGMg2CxpekrH+8devcybbRrUvPZOMx4vQ+mN2YZqH9
         m/mFrqJWm76akxQqTHTGRVXe7fkMSalgeDWx7QX9up5oAhSHUEeiwH1Nx+b+MBMI5dHa
         kEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927618; x=1788532418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=PspmABHAICxB8Ksh1LRSK5T44gMJPeT082GAMCqVy+6LeLWJwfUKPoXOJ16XaWrbzT
         +0ohrsWaSflWeorXPrAl43/xxV9ysF4WVL5oL4PlnOVHozZp3LBPXWAkQymHiflOHgnf
         k6oejSOA3gyqkF7uStLyjCoNyNLLdeOCOd6Zc4In07mTb1iVq/bx6nu2QkhO9X3hrPsT
         2D71jaSbqK7nPFKI/LaSwlZd7cQ9yP7vyuJbYU+XXMIS7O+zjRPpdhRTeIY4F2AtC1xx
         mciaIE8STU0bJdNDf1kM5uN1iukwBUPJWCV5PdrONa3OqiicdE0rsebekHdTG2lXqVd6
         PeYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3oeKo5QZel3pbMR4GNP16629bv0scGPfG1vjxTbX2zimiXfCx4hoEsXWKHgRy49RfaVHwAcGs5wPVB9w=@vger.kernel.org
X-Gm-Message-State: AFuF++luF68f6Q+oCdtHTeUTVUBgD4Ug6ce8z8xpQ05xWMF3+NBveotW
	Ctu19s5QeFX0406uQu3Rhy6kIAfmIUATmI0beDONm3Rwq/6zzI0of9GH
X-Gm-Gg: AR+sD131kFzsOa8WfRSjBxibr8U0QD/h//Eeln7gebBOrvegDlNZWTSx7FLSdzJN7aj
	rzNUarYIZ8OFdRLCC+1V3cgD7t4492EVd9LgEQyN5lsfl4R/MMuWxOCPPr8rBgMA1lDPS0z/pBw
	dUZsUW6bqYrzIPRScm9qabDfmHEe5APhOvpjFasaoBVFscqgOwxa7Wv4+w5R/NoUxutijrsqiD0
	Ob2r83dWNS7MX1cCVyp2sz9Ue6mOrGqoWdhU9kGBnHbd4kllbQQYa3Pjj8W9+xX5/ya3IRu6CfH
	cbWJbtqe/jxZMNham1HWuF7WxmrCvuPhdrVbOlsbf5SmUJAe6q0pYqNl5hMPMUdDncRIYlizoJM
	d3ig1U6uqleJrotV6tkE5XrTPDl7x3WOpAX8c0psJbrHIRpZGqSIxo1W7Hn9AvwD5N2E9Jb0E5G
	YSYpxD9R7LTcpl1KfQcioCYHnBuzXg2PGRemyQJyiKJCb/YsIx9Lp/X6TwhEigw97IJrc5qmg4q
	9u4NKd90Q==
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr15006187a91.11.1787927617279;
        Fri, 28 Aug 2026 07:33:37 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([157.51.225.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm2793476a91.2.2026.08.28.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:33:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:33:28 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apGcOAUpb6XZ2Iud@DESKTOP-TIT0J8O.localdomain>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
 <20260828-adorable-bug-from-arcadia-fcad00@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-adorable-bug-from-arcadia-fcad00@quoll>

On Fri, Aug 28, 2026 at 08:59:57AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > +  registers have a different layout.
> > +
> > +properties:
> > +  compatible:
> > +    const: econet,en7528-pinctrl
> > +
> > +  airoha,chip-scu:
> > +    description: phandle to the chip SCU syscon
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> If the entire address space is part of the SCU, then this device should
> be part of the SCU, e.g. its subnode.

It is not: the registers are split over two blocks. The GPIO, interrupt
and PWM flash-mode registers are in the block the node sits under, and
the IOMUX and pin configuration registers are in the SCU. Both are
needed, so whichever of the two is the parent, the other one has to come
in by phandle.

> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +allOf:
> 
> This goes to the end of the file, before the additionalProperties.
> 
Will address in v2.

> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - airoha,chip-scu
> > +  - interrupts
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> 
> "patternProperties" should follow "properties"
> 

Will address in v2.

Thanks for the review!

Ahmed
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> > +
> > +        description:
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to the group.
> > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> 
> Best regards,
> Krzysztof
