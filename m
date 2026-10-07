Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFD481FA1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366198; cv=none; b=rBxrv5jq4KxIfbVmKt+js3Sp17G+LjUqKLbINZT4pPL3/pcLn1ChKFIXbBFYyp1lpnyIswVwmZe2+0ibTj7dA5IN2QMcmfD/XbNtU2KNXKRx9U7FrdFF3bszo5me0hUlQMpvspMG2B8wzFD9QBAtjCmtDn9bPp2zricy8arjIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366198; c=relaxed/simple;
	bh=kiFe84dyPezmzLEDiTg3RDtzBXfiX84mT6KO+DQZ1UA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNQAcfQpDl+YQzzVCSPhyiM5TB/tAaZ3XBsX3/BlAxV5k0Gtx4XNK1bkZvzWIzuTmPU6sDhP9qfqvW6GOzVYgydeMrZfskOUbi+NRb2/KkY0AebeTCyYd4q4Y2KyRp9wVBBj3Whyivt4slI+lTJTZuFlImKiUfpPEdRLm6RtmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6N7f0BF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6N7f0BF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2048051f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791366187; x=1791970987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcB2VgVQ6zTdQxaTfRiH7KXquW4kD4zCj2MYVMkIYy4=;
        b=W6N7f0BFwpPQV8Yavt+IkpBMy8GlnhZK5n4C5LVcI9wOHe3FMg7IqpcUgnTBXC6Ai4
         UP56WNzYo7pplgJxBFHmuYReUj4SE5LqngcoMKYSqzG1G16T+5hL5lvAJ4UvpovGO5vf
         221rnK2eR7g8dS9A6PJcfuUJKiCNsu/qzVrQpHzb2+LwJfBcvvWEA6XskoTA+4nuMCyd
         p82n52LMDVv0/ESz6IqzX4O+l4DwIW559z7jrn4apF0fEYcZG1GajsJWUMVM18thBlwi
         E781O1NWskrxTXM2SJ2t4myUAIDSWhGyJmwDnm8Z62JcgpbtwwCVt4e5WJMCCuthUXFz
         /Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366187; x=1791970987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcB2VgVQ6zTdQxaTfRiH7KXquW4kD4zCj2MYVMkIYy4=;
        b=YmxVv9VhewL84Anegqh2bTc6xkXDTkRI9qhk9czoTV3LzUWNjjlLb7b1O4QGqrU5ML
         sOO6VWtct4J0y8q1x2w48BuCc8/VcK9oGENyOV1pJHd7N26YjswODsmPzdMzu2h4WVav
         4Sei4HzW8zYUSpV9Sp8d7tIN4gjP2vmQKfMshtzqkjZldkmDqBIkFxRkqBiGrxqn3upz
         ZG5iUV2QHubaK3c7gF8HtGX8EaYx4CC6zNj5gc2zMG0Sv/PJxM8qUPgIxuZ2fokhfj12
         +B25+V1IAmaBBv+9dZOFw28gDpfb83jwwE+vbagoaGSfDpmAiTU/jpBrRUuYTmUJuNTj
         Zglg==
X-Forwarded-Encrypted: i=1; AKwUvBy3xkBT0MsAQ35RwjURRxwPJLEMnOKSSnZfskAuJYs417j3x/AcgUTEHudo1MpcgADEmf7XAXdhcENciOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYII/D6ylOMZYGcVJllOB0aAySMxFsIy1dxV/ooi3IrYxhN9GUlR
	5ZoOGfudDT0FV5xBr0fMzgUYxo+siJfB9vZOtS5w+awoaqgn1IPrWKjr
X-Gm-Gg: AYBFou3/sf91bqg1Ars1juFwxBr3122lXaCwFAZZkG5z68ji9Iul+oVVNknbQuWE1Vc
	lPSoohUS5E74FugsoHWlZTXhmFcfTpPfpEUKk3XHkPBviZpu8Mg85ZPgvZPIji0U0jBBqNWcU0q
	mIIP9fg/IBqYcaVt/4YEARtWWRlK5fVJueO1Uc6yOuypNBynMYlbt84JMJMNnL1BBIyDvByKade
	JMqXwflYXfR0VHG51/RzTPq1CehI01pPjBvnjcshiKWv3E7pQvMqA4T5hzWUYuVhXqJzcx8iybV
	whFbNHe2OjIM0oE5OzEJuULk0DvriMWG90lHleX1UoWkGmbMLWIBsP5tguSHnf8aB3bw/1e9c9X
	jvldV5zzpiLLcr7rI/5+hDuszw3CBz4GE+tDT25+7ulYmzk8UhvHqZbJy/ztsDUSQEFMiPS3vCu
	QvXdsVJzDCtrgKCHXZjqEvoRAQyefT+O5fOhjHJm//bY66C253Pyjhsd24/8dn+GqcRZOum9Les
	pbH5FN4TesC4r4D1zj21bnDvJyxxNCKCD+D/RdsZj1ZzNsssLhEtgUXpbp26JFvjJg3hvJ9SncM
X-Received: by 2002:a05:6000:2886:b0:48b:fdd:fbe4 with SMTP id ffacd0b85a97d-48c72889c8fmr2930515f8f.21.1791366186990;
        Wed, 07 Oct 2026 02:43:06 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2dcsm5072334f8f.42.2026.10.07.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:43:06 -0700 (PDT)
Message-ID: <6ac6142a.fadcb60d.16e2b1.f951@mx.google.com>
X-Google-Original-Message-ID: <asYUJuNkLNMrz0BW@Ansuel-XPS.>
Date: Wed, 7 Oct 2026 11:43:02 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-2-ansuelsmth@gmail.com>
 <20260827-expert-ruby-grasshopper-954aa2@quoll>
 <6a9e82dc.8fb0a6ce.a0d71.1d0a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9e82dc.8fb0a6ce.a0d71.1d0a@mx.google.com>

On Mon, Sep 07, 2026 at 11:24:41AM +0200, Christian Marangi wrote:
> On Thu, Aug 27, 2026 at 11:52:13AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Aug 20, 2026 at 12:14:54AM +0200, Christian Marangi wrote:
> > > Document support for Airoha AN7583 clock. This is based on the EN7523
> > > clock schema with the new requirement of the "airoha,chip-scu".
> > > 
> > > Add additional binding for additional clock and reset lines.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
> > >  include/dt-bindings/clock/en7523-clk.h        |  3 +
> > >  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
> > >  3 files changed, 88 insertions(+)
> > >  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > index eb24a5687639..edecc635807b 100644
> > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > @@ -30,6 +30,7 @@ properties:
> > >    compatible:
> > >      items:
> > >        - enum:
> > > +          - airoha,an7583-scu
> > >            - airoha,en7523-scu
> > >            - airoha,en7581-scu
> > >            - econet,en751221-scu
> > > @@ -50,12 +51,30 @@ properties:
> > >      description: ID of the controller reset line
> > >      const: 1
> > >  
> > > +  airoha,chip-scu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to the Chip SCU providing the registers required
> > > +      for configuring the PCIe related clocks and resets.
> > 
> > This is the clock provider. Clock provider should not be accessing
> > registers of other device to configure its clocks. Either you
> > misrepresented clock hierarchy or devices.
> > 
> > I did search for DTS to try to understand the big pictuer - nothing, no
> > results, no upstream submission to Linux kernel.
> >
> 
> Hi, you can use en7581 as an example as the implementation is exactly the
> same register wise.
> 
> The register for clock and reset for normal system and PCIe are scattered
> between the "SCU" and "chip SCU" registers (they are 2 different register
> block, the name is taken from the programming guide)
> 
> - Chip SCU provide register access to some clk gate and clk rate
> - SCU provide register for reset, PCIe clock, other clock gate and PHY
>   SERDES.
> 
> Upcoming and current airoha clock driver all follow this pattern of
> declaring one of the 2 register and use a sysconf for the other as the 2
> register block are tighlty coupled.
> 
> There was a similar phandle in another series adding support for pinctrl
> for econet EN7528.
> 
> This phandle is not present for en7581 just because it's hidden by a direct
> call to the syscon with syscon_regmap_lookup_by_compatible API.
> 
> With AN7583 I'm trying to fix this by making it more explicit.
> 
> Does this makes the situation more clear? 
> 

Hi, I would like to send a new revision of this since the clock driver
needs to be rebased.

Any hint on this, is the syscon phandle OK after the above explainations?

-- 
	Ansuel
