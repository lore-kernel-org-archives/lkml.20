Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D5027FD4F;
	Wed, 30 Sep 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764159; cv=none; b=fWfk/vF1OdMymbXIyCZY1sZ4L8pqpdbBBsRoQ4qijoJhfPnEtjFUwZJGROQYFE13jy+7fT8hZIrmyd6YgTKBwQqwYb1wUJ2lF5Fe2oQO9uxkzaJQAMoT8VtxY7hx3YB1n5vnCEizXANvPAcOhzO+zoLujtMS44wiwW5kIHmduV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764159; c=relaxed/simple;
	bh=1baYsbbfYZS51WE4A8LFOMrqN4nBkpMPnZggmujvd8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgdWeJfAdLEwXIeYllK3YDWSEKU9vaApCKoFdq7PUlgyFA8+9JysOe8JGQI187vuE1mTNL4QzjzC9bA/8Ndxp/ShhOvBT16Bqj4D6pmCHRZPLHMAfYoztBxplJm34DzpX2jwtrluprJRFwUl+1bRSlr1JD8uoOtpYfW7rrlT6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg4iIWKJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg4iIWKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F50C1F00893;
	Wed, 30 Sep 2026 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764158;
	bh=XdE7q3nbuxshtMAB7rZHdfhP8TS2FQKcq708Ekq6ZOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rg4iIWKJbIVfsdUOiUkToOU2NBDSUu8zLOCiRRX0FcMN0vSNQECpv+/TrfAWS9saf
	 L783MXkcRN+8tfIABRbebXvVZe5y83TJgllf9VgsEYLyccinPxEwSYex+uVAe2UKfO
	 oVHG8DqmckjZIvHIFQNlnNKIZ37DGArxMnAkp06XqBcEPtFWubjv8vt0+9DIEwmRkt
	 DKfemNBVx/oV4mSJkCPHxsGJZBO0bYrZ9b69p9uMjQuF2ioumWbqnCaTdqD8NYCvh2
	 DavmcSIuClcBuFVFOyIMlL2GYBy7cjr2FetbQ9XMdOnWf+KXD0jdtHlUZIZ2CETHsn
	 jBIEMRNC42faw==
Date: Wed, 30 Sep 2026 12:29:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org, 
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
Message-ID: <20260930-honest-frogmouth-of-artistry-b8831e@quoll>
References: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
 <20260928-paul-v7-3-rc1-edac-v4-1-4646a5b7cac9@bootlin.com>
 <20260929-brave-mouflon-of-enthusiasm-df7efe@quoll>
 <87cxtw5sbh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cxtw5sbh.fsf@bootlin.com>

On Tue, Sep 29, 2026 at 11:18:26AM +0200, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> >> +      - const: cdns,ddr-edac
> >
> > I doubt this can be used standalone, so I am not sure what is the
> > benefit of cnds compatible.
> 
> For now it seems that we are not using any Renesas specific
> implementation detail. The driver actually matches the Cadence
> compatible. But since we have no other user, and since we know this IP
> is generic, we preferred to add a Renesas compatible to match the actual
> implementation of the Cadence IP, in case we later figure out
> differences with the original HDL. I thought this was the correct policy
> to apply.

Indeed I don't see Renesas-specific quirks in the driver. I think having
a generic vendor-block compatible is not a preferred policy in general,
because in the past many times it was simply not enough, so was actually
useless. I guess fine here.

Best regards,
Krzysztof

