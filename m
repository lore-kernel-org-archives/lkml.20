Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CC49F12E;
	Thu, 10 Sep 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049544; cv=none; b=CbDPXO4kqR0vgPz9MDq0gmTW+/9vRHPwPc3qkpBgvNurILbLCM46BSyFqxW9DYfEp1QG7y37quTeS/XiVx/hiaVbJl0tEEkUubABR9etsU9FxTzmCv//TJh5XdJ7wVNOHqWZzsz0e0m65OWnb1+zyGuzYiuUv9Oj1dDegiqZTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049544; c=relaxed/simple;
	bh=VP0jnsYM53A/hkThoLaTmUkvWo8biCczugoQTC3714g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WErbfo0pAmJeeWmVPXRAQWnrY+vF8xgQLPC8drVvPdhyHVUjSc8ZA8xmMRpsDGExOY4D3Ltpp7jwsoC1F8Z2u6FvnFb+A7ZUqaDa2ioKtMUwxE6Nxq7KqBLLJOLc0SlHQhfxi+3CySj2VjcxSofVvqI1UgCZj0pAkwxzlj9MvcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=hFPF0DuG; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=hFPF0DuG; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="hFPF0DuG";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="hFPF0DuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1789049539;
	bh=VP0jnsYM53A/hkThoLaTmUkvWo8biCczugoQTC3714g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFPF0DuGj7X9gmfTAsIrQS4IJcOzvMLRPEs/LgCqff4+YvX2oXsvgtBe6uzjBTB4p
	 5aOHDdVALAESCW263b1qI6Wipxw34Na9VlYLNFQaZuXzonqYvSOoil26qpuuLEexfB
	 DZfomcVNwtAXfRDun2XZEgSPMqh1ZlwnW6zYjduZO9QRWYbASX+hLwCM6gP6U1ra2X
	 XiSPMKw8S7nimO3MkXGlrFA2jnfKyQd8QEotWkxhPIjZISHljf1n4j7gLMwTryvN2Q
	 GGJwklrK7Pnjoj1z2qY2q5+KLBWwhPUYmDTXZcWYqwVSGIKix18R/OtIBCIikcPjXE
	 RsObJiFy4o0Pg==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 54E021947B;
	Thu, 10 Sep 2026 16:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1789049539;
	bh=VP0jnsYM53A/hkThoLaTmUkvWo8biCczugoQTC3714g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFPF0DuGj7X9gmfTAsIrQS4IJcOzvMLRPEs/LgCqff4+YvX2oXsvgtBe6uzjBTB4p
	 5aOHDdVALAESCW263b1qI6Wipxw34Na9VlYLNFQaZuXzonqYvSOoil26qpuuLEexfB
	 DZfomcVNwtAXfRDun2XZEgSPMqh1ZlwnW6zYjduZO9QRWYbASX+hLwCM6gP6U1ra2X
	 XiSPMKw8S7nimO3MkXGlrFA2jnfKyQd8QEotWkxhPIjZISHljf1n4j7gLMwTryvN2Q
	 GGJwklrK7Pnjoj1z2qY2q5+KLBWwhPUYmDTXZcWYqwVSGIKix18R/OtIBCIikcPjXE
	 RsObJiFy4o0Pg==
Received: from gryt (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 625451947A;
	Thu, 10 Sep 2026 16:12:18 +0200 (CEST)
Date: Thu, 10 Sep 2026 16:12:17 +0200
From: Peter Rosin <peda@lysator.liu.se>
To: Rob Herring <robh@kernel.org>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema
Message-ID: <aqK6wSAgx6p1uO1w@gryt>
References: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
 <d473d13e-bb5d-4d9b-b647-25a0b1b35364@lysator.liu.se>
 <20260814201806.GA2839748-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814201806.GA2839748-robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Aug 14, 2026 at 03:18:06PM -0500, Rob Herring wrote:
> On Thu, Aug 13, 2026 at 12:51:31PM +0200, Peter Rosin wrote:
> > On 2026-08-13 01:33, Bhargav Joshi wrote:
> > > Convert Axentia TSE-850 audio complex from text to DT schema. No
> > > funcational changes.
> > > 
> > > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > > ---
> > >  .../bindings/sound/axentia,tse850-pcm5142.txt      |  92 ------------------
> > >  .../bindings/sound/axentia,tse850-pcm5142.yaml     | 104 +++++++++++++++++++++
> > >  2 files changed, 104 insertions(+), 92 deletions(-)
> 
> 
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/axentia,tse850-pcm5142.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Axentia TSE-850 audio complex
> > > +
> > > +maintainers:
> > > +  - Peter Rosin <peda@axentia.se>
> > 
> > Bzzzt, this is no longer the case. This binding is orphaned (as is its
> > corresponding driver).
> 
> So we can remove them?

Not really my place to say, but if nothing has changed these devices will
continue to run for many more years indeed. I predict that the poor soul
doing the next update will suffer even more if the driver and bindings
are removed.

Cheers,
Peter
