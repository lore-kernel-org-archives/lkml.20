Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436945;
	b=JdC+4ew4ccDGFXtTVzsSirMvyTYgsAs8NR7mDnStU1ZCYrxLyymS4SOPL6Blvjn5ZwFq
	 62ZQTuxtoTYI9SwMqnexmH8HboUY/WhmWT67wQsivmJo6kFfK0T+KfN0gnVmHDZO5OSuj
	 GmElrWy0CPBo/Lkv1AIWKEV1Itol4j0r9lAQ+PaFc6oER18HKDmvwSCPMOiLko3Nd29e5
	 yvTdDX44NRg57RtmCtjegL/IhU2N6nkUelgpaQsiMeOOq4hwjHKcbRMUocW2Nk96eggl8
	 OudrzWmjZ43w+ip/NNH+O5E9JuGBuenMvAKKYkYp/GtDQXl3s9y2IYQ8hfm5EAtg7yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436945;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=uoy8pB8eZJpJieanFUm0m/365Njz/Cwd1+0xU9uSGCg=;
	b=GEqJl+uM+MdxKOXUH1jQhfgaM/50VjhAQxm+SHzNyvtfJ/eJ12wkLojFCX3s7KdFGwzI
	 /fWFtIQvyYl9nsOdDAjPWExyA9vCeFT/uhchgk2+jZAiBeNeg0xklnZZNpKneNZb4hBrU
	 Rw3Es9N3s6OhHIuKGy4EE0sK01fRKFKl3fJWEWaZYARIk9TzHV0b/NGtKXMDtLo61VPLY
	 pRVBc5oc7bhLhS7myj4MRe88HvhTe2zjtXRdMmRNUzWh0qVsfx6TkXlxS7uAxmiD3NGM3
	 n99h/95Q6KAFArqcS8Xf4mK9BwGphahicrfBN+z1e/qXkQ2N9A6tMKYWi1yJ50xWSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L65D5Vpt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194DE606A31B;
	Mon, 19 Oct 2026 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L65D5Vpt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96891F000C4;
	Mon, 19 Oct 2026 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792436944;
	bh=uoy8pB8eZJpJieanFUm0m/365Njz/Cwd1+0xU9uSGCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L65D5VptkHG3+1UlqK3fIfhocgLYtB3ROuaJ9nse62/XD+vlM5FCQu/h5xkRSIo2v
	 Jbk7P4+EsXlX9is0ZOQQ2qcl/d/EJzGi3qEVYSvLeawxxClGU6iP56zcdSd9diaZex
	 UFCR7Ptgd/C0z5ybvc7p+VgudhbG1ue1Z8/9scg48uXsqntDE6FmVfE43fVR0Gm/wD
	 SNnKuGLhCUHREjZH1qUE4DIqiOdvRDvsAucuJWWj8Vmfa1DomYhbc4n+8Yqb+wX0S/
	 PJxlzv9qCBr620LQmNuszEqxxUf297RdgiK6sdVhDxqJxdW61Nwf74z6tl17jwIv4q
	 O9Nsx8Vs+UlyA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 54D691AC57D0; Mon, 19 Oct 2026 20:08:51 +0100 (BST)
Date: Mon, 19 Oct 2026 20:08:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <atZqw7pdZjMwahdf@sirena.co.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
 <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hKppixGS12x958i"
Content-Disposition: inline
In-Reply-To: <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
X-Cookie: If in doubt, mumble.


--4hKppixGS12x958i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 08:01:34PM +0100, Mark Brown wrote:
> On Mon, Oct 05, 2026 at 02:53:25PM +0200, Mark Brown wrote:
> > On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> > > Commits
> > >=20
> > >   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT parent c=
locks")
> > >   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWDT pa=
rent clocks")
> > >   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define=
")
> > >   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missing cr=
ystal inputs")
> > >   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in the d=
river")
> > >   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on prob=
e deferral")
> > >=20
> > > are missing a Signed-off-by from their committers
> >=20
> > This issue is still present today.
>=20
> And today.

And today.

--4hKppixGS12x958i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZqwwAKCRAv73Ows9A4
iS7jAQC9XJMIIptPkt6dIF7Cslg1WBwkCNvCmSm4TXYCxQ2HuQEAxJMzgKNRep0W
O6gB7ow/fXo/Dv/d4HdsqIn355HpTw0=
=3+Q/
-----END PGP SIGNATURE-----

--4hKppixGS12x958i--
