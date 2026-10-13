Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3919488764;
	Tue, 13 Oct 2026 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917710; cv=none; b=jNKRCXlokN+HbIeIPYzPGO8v0mJVIKouNCvhxZ/pjqlRnJlu5jGdSU5senCvplGg7hk1BSHJQ+1MHVda2S9Jmis6RXJR29iBYVcBWStMlSrqCBedgIsDqZn32g1WWZYefAeKb0hO8gkgeOuSRWERfqHkdnepecfWmXvPYzifRi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917710; c=relaxed/simple;
	bh=uvSVlDcLiE+iGwprcVhtMbFSvy9T4aL83XK9JLWbT2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNJ1XwFJWJbqsLB+HqSldJUo2xcuk6nNuJ4FNlxoimp4h/JlIHwLU2GVK6DRoVaWr5qrFz94Q9qXEbmgevKN8rcencwhKKZOZHImdrzBsMqxYgFNDNW0ReozOLd6U4qKZlIEiyvk7FwTeAbAXyKnBz7Jq61da9pZ2daA0hi7kS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhuFhN51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhuFhN51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B111F000FF;
	Tue, 13 Oct 2026 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917709;
	bh=uvSVlDcLiE+iGwprcVhtMbFSvy9T4aL83XK9JLWbT2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VhuFhN51lfqVJOB2PMq3Y3Beci1w1ndcfyBZ+/Hdr5/wpxe3xuKVImd5SJMoorLgA
	 g3/Q6cl7m9/rCoNWDDCIT+Pqnfy9fkD1ekjar9emNZA09Z21iM1b2VdXzOT13jZVGJ
	 NaIUAoxXpPt0rUfGyWqyFDbhU4BkcKbciEg93Ia5Y3Kga7+JCfA/JE6MyDEfYG4IlA
	 B8iEK+AoAHILRIDN0KctjTx5ZaaYVADY0dLv1R+8GhOgQnajUnC3j1FSCLwvM4wgiy
	 eKJcz2lq+oGzSGCL1p4M5gUG+Gn19A4qKxKMq3sFg4ZWGLxzkr17rCwaYxDOaYK2s4
	 M2csU+Mqol7KA==
Date: Tue, 13 Oct 2026 19:55:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
Message-ID: <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
References: <20261013184755.530392-1-clamor95@gmail.com>
 <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
 <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVPxjnC77315byej"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com>
X-Cookie: Some equipment shown is optional.


--SVPxjnC77315byej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 09:51:56PM +0300, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21=
:49 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:

> > > The Fortemedia FM34NE is digital sound processing chip used for
> > > active noise suppression mainly on ASUS Transformers.

> > > Resending since previous attempt seems to be malformed.

> > Please send a new version if you have rebased, tooling gets very
> > confused about which v1 it's talking about.

> I have not rebased, it seems that format-patch malformed first
> iteration. Both patchsets are made from the same commits with same
> hash.

That sounds like a rebase to me, and in any case the same issue is going
to apply - if you are not sending *identical* patches the tooling will
get confused about what version it's looking at.

--SVPxjnC77315byej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOfogACgkQJNaLcl1U
h9C+aQf/Wo+7uHBu12V9igZ5U+rPIA8MNUVorYpPNqVlZFrwHB+/BkvFLCZytzBf
yLGtqxHjvcIMg5Mic2Hu6dd+LvlVBmIezFGCdr4wIZUlYIAACEJy24Dmlllam+6e
AzgxcAjzk/4DDip3ih5owifI03ffY6l7/S0HmkSqbeUzodTQ2QZ4nXAScIJ+HwhG
G1gyafxF9qL5aGgf5NjP+nyYecyCmhHe7o8LlmBB1sZ9706aJ2V6tCMpAJfk/4zr
/kz3ywIvOHaTh2mDpDpHQDD/CFpkvrhcSe5ofF6zDJp9Uu6EpHBrHO82C5FuX2A7
37zQZwwk8m+EKC38+NfdnES1616Gug==
=QFD/
-----END PGP SIGNATURE-----

--SVPxjnC77315byej--
