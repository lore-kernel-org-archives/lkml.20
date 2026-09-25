Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6032D0614;
	Fri, 25 Sep 2026 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341894; cv=none; b=graLcyI/yFb+82hyQJfA1ivBSZFJMwUAMp1Mg++2b9CoPs2WflSjhqx311NO/CdL/nlAmiS+YGGgwQgbvoEVzcHvCmUm/6ODUYxwnRbe7VSXnK/Ko8ye1iAd3V4LccBsClgGRQPuYXEzM2MTFbXIHuEgKpuQMjaNfEd+lRvE7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341894; c=relaxed/simple;
	bh=lENP5HJHbc5BO+LSkrByvrmIgcmTuetXKD8cwa1M4xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH+F+S2NofPM1M/g3VTEQADrb40FvpypEDbh2/lzu9Veg7PSPug35zijKd5E9CKQftILyxAEu/7ZUU70Feg0AaqUHdYc6YYcyKXsGTExrDKPKqal+fa3QVA0nofqKKKgqlZUHT+j1xTZnGrfKioC2PWJpcGgzeodoynjNsaCaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aijZ4Y4m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aijZ4Y4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223AD1F000FF;
	Fri, 25 Sep 2026 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341892;
	bh=mZmEeamXZmvXJ+d85vwGRKU5//j/nVZOjtPaiXKvqVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aijZ4Y4mz7oRNa5ot1avBchyGjwQmgnYDzZpQ+wo82SDEVzzsu6juMo+HTBHLzF/u
	 +HDCEZYzQd596k5bPOtXZ7svJVWetvLfIrNGl8/it5/W3x4c/p59oKF1KPCo5lrboj
	 Yc+qqxYxy1hh/nieuwVWIdOJzYseKxyUpuJiAegIGITq9tb5GRe//i7Bpf4HXfNSJk
	 RAy9sOYyLSaXCOR7BMz8SHeKHxSDwU4ofNmUFBd85CVZ5Jwnm9Tx5BtO5LRKSEsxaw
	 zodDqD0af1j0ro4HZRaEq/OvkFoGZz6GiFealWNpQ5Pn+QryVyr1Ey7j7XUiparQb7
	 hooHRijnuZ2EA==
Date: Fri, 25 Sep 2026 14:11:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Carlos Maiolino <cem@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="du3HKe/A4rswovkP"
Content-Disposition: inline
In-Reply-To: <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
X-Cookie: Love America -- or give it back.


--du3HKe/A4rswovkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 02:26:25PM +0200, Carlos Maiolino wrote:
> On Thu, Sep 24, 2026 at 01:09:09PM +0100, Mark Brown wrote:

> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

> Do you mean non-trivial conflicts with linux-next? I always attempt a

With other trees in linux-next.

> merge against Linus's tree before sending a pull-request to check and
> annotate any possible conflict, but I have never done that for
> linux-next. I can do that, no problems. Where should I send a
> notification to? linux-next@vger?

If there's anything interesting it can be helpful for me to get a heads
up on the resolution but the main thing (and half the point of having
-next) is to coordinate with other trees that you're colliding with.
You don't specifically need to check, I'll tell you if I notice
something, but OTOH if you know your work is going to be colliding with
someone else's it's good to coordinate.

--du3HKe/A4rswovkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2cv8ACgkQJNaLcl1U
h9BNfQf9G43wyLRFkV1jgA+zTZ44qdh30goMvaZgUO6SJYgSUz8maxv/dnXrVNIJ
8RJi7f5yt/2+eUg11Ah1TR2LlUm0TlfVMQ4cNHAqvK+LnfzGXQvTeCw2cHqzbUiF
dvzcv6+FWQdOyzZkk/3mSz5L83zrQz2ww7urIvT8bC7vnYPYM0I00Bol4qlpH3vv
Uxqkkjn3BfVszB2SH+7PR6ztWHIuTsEHrVwRpBBzHToqYw3fOrgbMPG1joo1xwjP
4S9AaGYqtzBx9H3oiuyClD3v7liSxutd+x3esphUqSyqgZelCM7VVCJNpgGxljul
ZljNJS/qe40XufkdEUVpQx7mTbFrcQ==
=SUn5
-----END PGP SIGNATURE-----

--du3HKe/A4rswovkP--
