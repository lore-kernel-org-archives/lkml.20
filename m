Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA4391835;
	Fri, 25 Sep 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338807; cv=none; b=MuSuBB6i39EU4SnQweX1Nd2Q03Q1UzN585vyn7X5NOI4sUeCyF5Tml0csowYhUYNjCV9h3Lm0L2kTjWLJ3MUNgBNOsQudnCIPugrhfYQnyE6A+JoZN3PUhqZ7cLBih82Z4KHqezr2wAx995HLDa8FVCrlEvXEg3wuBlJ4F1YXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338807; c=relaxed/simple;
	bh=bKxwCk0drGbYTq2NFZX/TdUL2XbousOKrpvm+cDCj9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJZCjE8u55sd8X+vbqCCOBlTGE2Rh6LJTzEZU+aYElcTCb1BtLso7K8egm9N1XuabaqnoAV8kfpEnhhDMQSGZJCAbumPtp4i2IDkHBfXo8lzaC9LHfEUYkWwUpsyPr52sC/1gPT+mbs17ctqOL03BvcfiZr1skT584WdmnD3Ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9P4nIra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9P4nIra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6C51F000FF;
	Fri, 25 Sep 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790338806;
	bh=eiNOBUVap5JNySn2mRnx29Z02YDzK5v8loewzAEqjrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9P4nIra4SEhZSKi1Pe9VRN4VYFNxd0M7T4OP8dUZED41cFZaU20z80xffMhAwVrp
	 QBf9G926/9p6VmtWXors/OXTSxfIotdt2OWcFwexgkfzMgP1OGWT3ViroYb+1SJx4j
	 uOu9Pq4923tQys14hP+OQxjD9GG5qcnlA9ZJxJYDgUbcyoCUMtVt6+7W7aPMW/Xxax
	 WAlKZyGHKx/JwqVRD5eBR66D1zNIhoKrnblUN+qsXKi04PmWp6Dr0ZSoyz3d64NiZh
	 aj8EmCTvgeDPSSVYBaTb47Tr1MN1tAYarsM6E3mkNyJuQEXboqmhdilCXF6wqO1Dwj
	 FuL3slbfe/Lnw==
Date: Fri, 25 Sep 2026 07:20:03 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
Message-ID: <20260925122003.GD677989-robh@kernel.org>
References: <20260922183138.290114-1-robh@kernel.org>
 <877bk9n122.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bk9n122.fsf@bootlin.com>

On Fri, Sep 25, 2026 at 11:16:21AM +0200, Miquel Raynal wrote:
> Hi Rob,
> 
> > +  num-cs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 2
> 
> I am not sure I get what is the purpose of this property. It looks like
> a downstream property resurfacing. We expect one DT subnode per chip, so
> I don't see the need for num-cs, we just need to count the children
> nodes. For me, the correct fix is to drop num-cs from the upstream DT.
> The only real use for it would be if the hardware could be synthesized
> differently, with a single CS instead of 2, but I don't think it's the
> case here.

Indeed.

> > +
> > +  power-domains:
> > +    maxItems: 1
> 
> This one, even though we don't actively use it in Linux, it may serve a
> real purpose.

The driver core takes care of 'power-domains', so how is it not used?

Rob

