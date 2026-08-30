Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CE3B6348
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099414; cv=none; b=Uw8htqVJ2ykp6JVmgi0tSv6+sJTC2Z0taZSgEfdmVqg5LZaDBYW8rxQHw62QYpDFjvX1De/BerUY+4LJ+gRb5BPOCHwi0RTOnz9kUCHOuM3KJ6YdswSEUugdr8drWIUNbquWQMnzIS1LKyH3i3wdt/j2N+NSPctE3bWHyZLzFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099414; c=relaxed/simple;
	bh=IREn/rs5zdurWmNIOZF3mPc402Ofd1OmuAqzLcxfFL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzLDQOIRiwIJ7+fB1oGZqb9+vmqb0ty8PzkXBo4Ue6O4a27HY7mKE2J0IvcUX50atKXDpd8bx2y+B/OHjp7dHvgjshB6qcEwzDloWOeGWnCEsgBIvAxYcYi3KaeiAtZnaMyk+lg82sP3KwDTn3XMoznZThSIhGaCgJ5h64/bB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4SVdEBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4SVdEBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B221F000E9;
	Sun, 30 Aug 2026 14:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788099406;
	bh=Mg4oJr5LO/AzIo+skfypsCMkyFcaXymyOHEtCwpNPL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4SVdEBwJoI84ZaoSEX0hirIip5mGpRa1QT8emFhrAknGgAyAnWlxEtMiNEwsApvR
	 /pAGi98u2a9gNf96qNNGme2DvMJ4V0bYF3NIlTfI+TiICjb4ekJulxua1CsB05RPj5
	 KiV2JqWLp61+2LzjGRe/eilXL/8shw3XOvjv1HlunRmeKCzbmNl9Di72/OdgMcZcGI
	 yE87VwMhdMja3HmiRXFm6OBAQNZpleeqvlZbf123W3/af3K9I17Rr6lcFRT/CGjSPe
	 i5Q8yuSl4zteUm8SHX9+J34Vh9NTqEDSYRyUE5a1ZuCV6IG995CKmrjCEk+XPHGesu
	 4/r77VGxlv1XQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 76A98CC2131; Sun, 30 Aug 2026 15:16:43 +0100 (BST)
Date: Sun, 30 Aug 2026 15:16:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, falemi@asu.edu,
	Radu Rendec <radu@rendec.net>, linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free Read in
 irq_migrate_all_off_this_cpu
Message-ID: <apQ7S5oUtlIyMvSG@sirena.org.uk>
References: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
 <874igcdt2z.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1eYNTaxP4ux7DLE4"
Content-Disposition: inline
In-Reply-To: <874igcdt2z.ffs@fw13>
X-Cookie: My mind is a potato field ...


--1eYNTaxP4ux7DLE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2026 at 08:24:04AM +0200, Thomas Gleixner wrote:

> Though based on the meager information I think I roughly can see how
> that happens not only in the reported version. It's still the same
> problem upstream.

> Allocation happens at:

> regmap_add_irq_chip_fwnode+0x375/0x2dd0 drivers/base/regmap/regmap-irq.c:709

>          d = kzalloc_obj(*d);

> That's initialized and then handed in as host_data when the interrupt
> domain is created.

Huh, due to the lack of information in the report that you noted I'd
thought this was misdirected due to -next or something...

> regmap_add_irq_chip_fwnode+0xd76/0x2dd0 drivers/base/regmap/regmap-irq.c:963

> Interestingly enough the code has a comment in that failure path:

> err_domain:
>         /* Should really dispose of the domain but... */

> And it should dispose the domain properly which also would remove and
> free the interrupt descriptors.

...

> Mark, do you remember why you ended up with adding this comment instead
> of actualy mopping up the domain?

I believe that at the time there was no way of freeing irqdomains, or I
couldn't find it.  irq_domain_remove() was added in May 2012 as a bit of
an afterthought in 58ee99ada293b (irqdomain: Support removal of IRQ
domains.), the above comment was added in the same month so won't have
been in the kernel I was working on.  This was one of the first users
that wasn't arch code I think, having an interrupt controller that wasnt
arch code had a bunch of fun at that point in time.  I do remember being
confused about why there wasn't a remove function and I imagine I meant
to go back and figure something out there but clearly never got round to
it, practically speaking the regmap-irq code was being used by things
like PMICs that would never actually get removed so this path was never
getting exercised.

I'll add the cleanup.

--1eYNTaxP4ux7DLE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqUO0YACgkQJNaLcl1U
h9C34wf/VfTzP+cvUTL3vEx0Sz3QZRQAMBDEJ5I4nYy4RZBAk/711LS8k8z3kCyy
v/MRfs17KOv8FlGndKpdg/U1kfopMZhiy6U1BLlElYcY6uCb7PXl/+PxPVOfxGVu
Jl2zUVCb951VUmGRDtm2yGdL/+ZNI1nhSbmfrMQBR0SjgPl7pCFBDhyT1V1Te3L3
2eTfreKuuAQWrUVP5B/C/hfKSFOHqOFDUELCQph5EZBjA20YtnVnk5GFc1R1mArK
jObQISOq+p12jglW7GxwN0oyMqZAYXXXa3tz+43uTOFCH1xsOG4asrfMEjtoNJcL
TFsDsy7fzArnktqtGYETU/kCmOlMUQ==
=gHE1
-----END PGP SIGNATURE-----

--1eYNTaxP4ux7DLE4--
