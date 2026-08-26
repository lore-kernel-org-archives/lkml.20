Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98941431E49;
	Wed, 26 Aug 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752060; cv=none; b=VcdPf07ubQODwnarpX7QeXyaxD/wMoRBcUWHdanKpIUvv+6ToqeY/4SgXzIgNJFZwiIT5KO5PkqJT7h0cThRfDfd9cRe7wlZ/V9GBIYJ73edoBfF3DFfaLGUR9t18KAvlrrH2TAWdTjl4WYUXP8duVsSoy/TsGNq1MYma45rX7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752060; c=relaxed/simple;
	bh=QAcMff6+pKvsn1QdVpc5Po0o1qq52QVmOL5jB5kjrFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOitfYWvC7W9wqySgDzOoLi00g2Gl7vc4YeQLCJv5MGMshVoSy2lRRuSoNaBndqZw4jn62jjvQnNUuSXul6UBKpoMGLzgOX2/NHQ1wHgTl7G++mYIVZFD94LXz83gz5iGF1Oma+r4jC5a7NmKxTnrcZp562mrCMHaLnEivwkO+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqdPUmFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqdPUmFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826D71F00A3A;
	Wed, 26 Aug 2026 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787752059;
	bh=rfiA2xY/1sxbBHxLTAs/jukO23zJ7xtO0RNk//A1ie8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqdPUmFb1EZ9U3xlWQKZ2HdeCQh1QiL13tn9Gab7NhuvBJMbrC/vJY24b7Gy7zqTy
	 9fYqocqiKX02E4fWAPLOzoVySQSMtr/PlQnvPqtLs3u0OOmNBnIJecX3o4qy8oJ1ik
	 gOnj9roFtnMQoh6W4nkBTTg1pUiUvDVFUHQUnxaABkALwtt16gqFs/MpH7/Q/qgUSG
	 IpAwVjap2TKunLnoloXuTUp/V4J048ke20sqnfK+SFMvzOJzWVi1CwJOuLxUgWssFQ
	 8Z/ZvuIo84YlyrbrbUoQ8vcXKfWdmwg6IphiPqqUpVNFZ86kh5XAmDqEIsQPWY1/N5
	 PQePBL1rZVekg==
Date: Wed, 26 Aug 2026 14:47:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Please include pagemap header cleanup in -next
Message-ID: <3d9f98a8-1df3-4b06-b1bf-42baba10d3a5@sirena.org.uk>
References: <aox4v6paR4IbJr8j@casper.infradead.org>
 <29f8f296-e49c-4960-aadb-f27d863ba773@sirena.org.uk>
 <ao3zvOo2nkMxaDY5@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JNTAy7y/B3qulzbT"
Content-Disposition: inline
In-Reply-To: <ao3zvOo2nkMxaDY5@casper.infradead.org>
X-Cookie: Obey all traffic laws.


--JNTAy7y/B3qulzbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 08:57:48PM +0100, Matthew Wilcox wrote:
> On Tue, Aug 25, 2026 at 02:44:54PM +0100, Mark Brown wrote:

> > As I noted in the regular build error mail it hit a build fail on an arm
> > multi_v7_defconfig so I didn't merge this today.  It's pretty surprising
> > that the build bot didn't hit that one TBH since the file that broke
> > hasn't changed since v7.2 AFAICT, I would guess that there's some other
> > implicit include cleanup work that's interacting badly with this effort
> > but I haven't investigated at all.

> I fixed up the one you mentioned   Then I installed an arm32
> crosscompiler and built arm allmodconfig.  And then Intel's test robot
> found another.  So in total, three more fixes:

Looks like that did the trick for the build tests I do as part of -next
at least.

--JNTAy7y/B3qulzbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO7ncACgkQJNaLcl1U
h9DELAf/YJVgHLNnyJD8LI2DzhHyjym8bYSEdzH/K6jZ1vjWAZGwnvlvkYgkMKXM
QoZIBh4KpvcG4Dvt4qNtczqiInNAt/tda8+ovsY9i0Rl0UKYYVJY7PrXkMv3g84z
qp93LGxe+kw0xaYMq90DUONAOZjY2yVZZy2Sg3zx6MilU54fX/kx/Aw7z5YgKPvl
AHB59JFRmRuiqhLKX0YoKPCTj8spjsV5Q43DxUezexPzvjm0v9nfzf4Giv0l2dlk
bCI8lb7G4HtchdFeQ/A1QVuhdVTBPhHCIMozpBwRqx7Y27eUg80O6bWlQnSUmFfF
uhAtLNVfFIR0kh37oW6eqQoD8tMDXw==
=4+qH
-----END PGP SIGNATURE-----

--JNTAy7y/B3qulzbT--
