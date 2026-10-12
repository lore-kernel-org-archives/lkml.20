Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F3476046;
	Mon, 12 Oct 2026 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831700; cv=none; b=Lgjx/wl7WKH05xeMi8z1obZnQgNkoyTwCWg/pebZWRbN2FTEQMLMgnXEDF8LxefNWStyHV2kQX8rROCK3lu4eHORHI0XLGPggw4bUQUDfCb0M1DiWL2KcDA2FtFoXgBi+K7mRh/J6pcSs2+7snAcEwoehomgdC31xWfQJExlCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831700; c=relaxed/simple;
	bh=eFZtIZZ9/kfhI4yKYvCan8qdlLIP/PhCmzm7nNd4cwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSvALm7wGDuKcl1sLrXidgpYvByUASc3Wq6VuCahuNxwxCk3ZNWpH+P6cu4LwnqhxmzR1Bl/vr3KzARDjXibK1E2ryuo1iXBIVyry7gnWFQJ3VnhOWnKrZs1cvqyccjc/7X9NxI59zRDCzAjGghPsriOhxFX6FUgHEKHtmbdbPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiSHQlxe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiSHQlxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0506C1F0089B;
	Mon, 12 Oct 2026 19:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831698;
	bh=/StGTWQQaGCiE7m4TYe18FU1/WIEHG3SzxdnwszWuwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fiSHQlxeQbQYft33hy77TChcmp2sTNAp2EXecc6gOqf2dMATKoIxwSqOJejSrgfEy
	 0Y7CeSD+WEWN2NEP0Xr2u/YmIBmJB9aUQSs56euZyUU9C8d953MvpVhPHYy6PIgLWg
	 HGTfjgbhktmr84Xx1kHrTVgySKobs/qcLy5ZrqLcNRNn4JHBjttC+YkPu2pA4e81Lq
	 XUu9q35A1PanxjvcKNn2BCJXTtTEugE50p4mZVrdmOKym2cS5laxi94zLdMlOQHlTw
	 QJ/0jqIypJgo05CNY7Sl1NhHjl+ofexahZQ28hmmNUXA3IEz6SH9QNZMFgJAYtuzfr
	 j0vUcxPRKKTQA==
Date: Mon, 12 Oct 2026 20:01:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
 <asOdxWlcjSP0DrB0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQotTU+DZ8u0M8dQ"
Content-Disposition: inline
In-Reply-To: <asOdxWlcjSP0DrB0@sirena.co.uk>
X-Cookie: Save gas, don't eat beans.


--sQotTU+DZ8u0M8dQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2026 at 02:53:25PM +0200, Mark Brown wrote:
> On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> > Commits
> >=20
> >   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clo=
cks")
> >   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWDT pare=
nt clocks")
> >   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define")
> >   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missing crys=
tal inputs")
> >   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in the dri=
ver")
> >   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on probe =
deferral")
> >=20
> > are missing a Signed-off-by from their committers
>=20
> This issue is still present today.

And today.

--sQotTU+DZ8u0M8dQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNLo0ACgkQJNaLcl1U
h9CprQf+OBWi/Ll+zaga/8n1srPY/hdJeYHwblghfkMHe5muwMx9w5JPPdi7jRJ3
ICFOiYxlsxBrP6yQRaqqs0nTWrkefgWpsM7+1RwJsr6mB++JdB4rtEkwBMoDfFEN
Clg+0iHx7IjVWdiA+sjL94WcJKOoemB5a/twGlue/3gbP6zV6m2OpvdW+Rl+6G7s
EOHc/MBgdBEsyEW+Mnm31LkBCv3L6QS2Qv4HBUit6hTwja349VGpEUzuBxFltYRs
znIH1SvzMENCGHpbcnajKKfPh6B1t+XQvRp+DyQlT1/ciwechO0lqpdFHQJ2YS/p
DhfjGdotNNJ0XCjk6f7E+kqH6Z4kQQ==
=spr9
-----END PGP SIGNATURE-----

--sQotTU+DZ8u0M8dQ--
