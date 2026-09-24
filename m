Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53913B6BF4;
	Thu, 24 Sep 2026 15:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263225; cv=none; b=oSO43zI4y9GiHEMNYFx4IZNK48wT4Hk2YD6645p1UpE6RHISxNPVyUSjyhj3aQfT7utDTp6IOurFpSPR9pCgcRsNsD0w++LagD3TlbftEhjq9vAkHc4+F51Xa4JqviKAxjYeO1DhFfPzVPKUFZQqCF5hLTyWA9b0onS2HlWmWUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263225; c=relaxed/simple;
	bh=wffpEIqy82bE5dzisHggBxNd87Jfutu0YdK5t6eDMKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdTzPOzjgTWZ//QloI+KzEGGC0WJAPFPfB0GGcaqalWkRgZdiRfTHTTa1y3gCc5ksIJz+ChV8kDWYxi1XY6hkOQIC66aJGH8j4ZHd0qLPHKqQrJC8x93lBUYkMbHpBunVtXv7yRrQiAtH8o9DBYnilY75ltmEuRrZvTyBlAraV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO8EWjgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO8EWjgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4492A1F000FF;
	Thu, 24 Sep 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263224;
	bh=z0AuueoF+EwbWJC1cvePLMQBYiLt2erxfL4Qv+G2e2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PO8EWjgvZqlB6qVZrDlURrWOYYJIr0ucntqQHxLVuKEice/dYl0Y8Rs/2h1WKzBxz
	 RkWyDGc4Qedt2hPfgZbGikYJ8RxxeN5NDcF5XhuzeZ4OqIVuNsp8Irb14Nnd/HrraZ
	 FDxThFEFeUwLml2Oq/gEOgMg3V0UGRFaBrfDk2FLB8PArM2ASE1KexHl7BKM3A8Nkm
	 FZuO7D0Lp7XNs7vnNsBifmGxa89ZxykJdcFzfdrTfHss5g8EhVvZzKLQ59k5nEQ11s
	 CC+qzReAKcy3WXYlkOATtBFCF6c8tkoKSmiaQPPBDXBqmA0NqX3NsYFBlvlje1IWx5
	 cw1DHSaPN/oLg==
Date: Thu, 24 Sep 2026 16:20:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Hui Peng <benquike@gmail.com>, Niklas Cassel <cassel@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <4b5d60b4-fc28-4399-acca-dbb697a1763d@sirena.org.uk>
References: <arKETtHsac_ZwVc4@sirena.co.uk>
 <ebce4bc6-b210-4e07-ab6e-25f1b2b13a8a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKDsrnozF8yLWLh2"
Content-Disposition: inline
In-Reply-To: <ebce4bc6-b210-4e07-ab6e-25f1b2b13a8a@kernel.org>
X-Cookie: Oh, so there you are!


--QKDsrnozF8yLWLh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 02:42:15PM +0900, Damien Le Moal wrote:
> On 9/22/26 22:36, Mark Brown wrote:

> >  		if (!dev->multi_count) {
> > -			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
> > +			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0);

> This should be:
> 			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND,
> 					   NO_ADDITIONAL_SENSE_INFORMATION);

That should be updated today (without the line wrap since I hand edited
the patch).

--QKDsrnozF8yLWLh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1P7MACgkQJNaLcl1U
h9B2Xwf/ZDbmh9n04lorPotBpnuPxcBDwDXTIBgDaYO1rA8Lc7f6E4SGpxP13Sl+
4eb6QbwB9VQTknCg6C2mLsDIP3tMF2ynUCrqv+lQ8OhCPVruJZIJkXwW9n1zWcBd
7kSOZWRLtTvJWtfhgCDW0Eb5ujZHa5++p7AXrVsXUy4O0RCEVhnUbUPX7L0cn99C
yI8rt+j5lA7R+3mESWM8WBzwa+N/Ugx72FwWGKPQLbDLxqfqYoZD/8QDb6ESUZzX
DnqA9sSzpXUrtcT3emzbKthHSQDtmR4pNc7k77SU3qTjNbn9eHitIsx03+PmWrA6
bi3H2DbUJZTDEIG3N/ucikOJxOkeWw==
=7gSn
-----END PGP SIGNATURE-----

--QKDsrnozF8yLWLh2--
