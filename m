Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441BA385D87;
	Mon, 12 Oct 2026 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847006; cv=none; b=L7b0unXsE2xn3MnynvaihZVST+3lEOHRJIFVbsLGrnM+OTp/gH5OXArOzuXWAbHgVvD3lEUtPTZYKFneUnCXht3nmhPUacn2eN2otktK6ce14z/4tsolkVtv0UtMlhKz7YVx7Anmy2jGz+S1NzFIq9w6HJ6U80/6r9qJVYdUpv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847006; c=relaxed/simple;
	bh=3sl9bB83+LOPofI+yHfFvuD+l3/3A/7SHzH27L4h19w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgS8c/8zVJbKjidMkxfkOq4LiZHlr+VfZMY5iJXx/o6SfkAqZeLf+sFnj+cQuknmiadkJk8NWhHXe5Kl8NoeT8drZTdqv6m1AlxipWuG2j7MtQFtDm4Scn51hkfRSawdKcxRnDfEz9nBqIcL8KcAToXPXAR4l1WJx6oh6Nz6kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYx6qKTD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYx6qKTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390771F0089B;
	Mon, 12 Oct 2026 23:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791847004;
	bh=zzmW9wCYTQoOlcq0U2T+K4uBnkW7AVavQQwITnbWB3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oYx6qKTDyJpVy2se66Xf2k3D+zB7eks2fu5GxGrQSQZfV1+5ymIo9gLJVoRxjI5Ot
	 w3GM1nJ2ziMFRHJCSb4UmTV7TiKfbxFIAFacO8WyoywoUiOfuk2UV7Qzh1Njkh4lnE
	 +xSvDR7yD4ZByd4ccwgjcyxumlFhNGZGU3y7h0YK8ebXLETHEyPl1MX2R5KEaDFbC5
	 ntlDCep1YAywtdCidBrqjMAznJIxi7CvKNhLfu+pGDRljbdoq0jcyiWOA1+NgERWZw
	 u3j5cti0ndTNT2VKChrOXsjrmS7+aCm6rFfOOmBksGqwtp1Xbjoz5jCwmt2D9uAOVX
	 LAdFcYMopGvSw==
Date: Tue, 13 Oct 2026 00:16:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200 regulator
Message-ID: <828d3e2e-f204-4bcb-99e8-341a5c799335@sirena.org.uk>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
 <20261009214404.722628-2-mmyangfl@gmail.com>
 <20261012-taupe-grebe-of-nirvana-f32c6e@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TgNrPhrAn99G5uuB"
Content-Disposition: inline
In-Reply-To: <20261012-taupe-grebe-of-nirvana-f32c6e@quoll>
X-Cookie: Double!


--TgNrPhrAn99G5uuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2026 at 11:11:33AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 10, 2026 at 05:43:39AM +0800, David Yang wrote:

> > +description: |
> > +  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs in the PMOC
> > +  block which drive an external converter.

> SoCs rarely provide supplies for themselves (they are rather called
> power domains in such case) and above wording suggests this is actually
> something external. It also speaks about PWM but binding has no PWM.

I think this is talking about something like pwm-regulator.c.

> > +        compatible = "hisilicon,hi3798cv200-regulator";
> > +        reg = <0x8a23018 0x4>;

> And one word is rarely a device, which adds to the confusion.

It is possible for a simple analog block...

--TgNrPhrAn99G5uuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNalcACgkQJNaLcl1U
h9D9wgf/Qem+IVfXX52lhrDKT9el0dn3Z2e6uRfS94urq58Pl1LRmDlWgGKd0XXY
Lk4OhuCtXqsLaBadv/BHnFF/1YuxnTCFdIGrH6Y919c7KdQBR5fyAhL0kW5mxn0k
Kw/V3Hz0sux8Wc6myYoLuuXQ13Q9WY7OMvsSp6Pu1lyGwl6D3lrEJMa7YlnZA4tq
1lfsQUvyLyBv3KvfJb/y0tQffTBb6vKSFyTISCdxqYQbZ0dtYC/9RTgTbsnznLjN
TMmw0msnmKRDMNtBWKe56KvI5qxiniZx/veqCc5T9V61aljn7FfK8NVnf0IxDBxn
9svpcc1DdW23Qf3E252v+mOBePekZw==
=yDfI
-----END PGP SIGNATURE-----

--TgNrPhrAn99G5uuB--
