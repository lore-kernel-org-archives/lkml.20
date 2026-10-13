Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC424FC32F;
	Tue, 13 Oct 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895493; cv=none; b=VlDe8tD/EGJSUOnsyJM4M0sYtYwO1sO8NRP2hYa6H3+//8JP+GQqTx3uzbYFRzapVM5BIXhSEBN8KMb+/vBMSsAi43odSRxrFIU2IAd5j0Aiuwu0Ammc3S6Km7nHnVueULw+9c5o/VEncKBjtjggSPjY/HIsTDosatQo4jGmxb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895493; c=relaxed/simple;
	bh=y56JZ0eGVsiAewgSslZt/UU59ukExPQT+TjzXqa/qyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mw2REP3H5DzD/wpz2w8DZU41l/pEmEm9aqXP4S7eCNWkZ9eI4mYv6gSe3eIJxnhbq/xfGYatoJ2vbXD+cSqKFHz4+UYDhShRg3ZMmOmw7cjPu12K6nGmsmdV/qokdIktYVXJuUyWfJKc+NmNkaPQH9K7aoutbrd/aMXRbqwAHnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSo1S09M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSo1S09M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C341F00893;
	Tue, 13 Oct 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791895491;
	bh=y56JZ0eGVsiAewgSslZt/UU59ukExPQT+TjzXqa/qyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NSo1S09MlDBcq3hdDy+HjQix6sFGlmFEaXUI8M9JvfwFG/Lyig40llWk98IJAOKhE
	 UVr+excoX+lU9MbIYcwdvtBk/f5UvxZqu1b+k7x2BnWyrH8qaSyvSPJbNhM/A8uAgX
	 LICjUxcpkSVul20aGFdgPTp3l04y7efsTGsFCbnibUAq3CjE1U9RwuyD4VHPIYRNYR
	 iuTY0XYdxxLRb0n19B9ftghr+zQ84P9qhxVCVcdSt3uiiwg4B4sU1sQqrlrjiGXVDs
	 BzG+rLAtoGvVSPXQi20gbYQHjyydFPddahmwOpIhRPpmHFDXPUJH6eTG2o6clE1RV+
	 7ImPlXhUMFlUQ==
Date: Tue, 13 Oct 2026 13:44:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amade@asmblr.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
Message-ID: <90b98a99-ab64-4de2-a908-a77c67a1e116@sirena.org.uk>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
 <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
 <ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
 <40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xBPdZvVLvtnMBEwa"
Content-Disposition: inline
In-Reply-To: <40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
X-Cookie: Some equipment shown is optional.


--xBPdZvVLvtnMBEwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 01:24:24PM +0200, Cezary Rojewski wrote:
> On 10/13/2026 12:53 PM, Mark Brown wrote:

> > Ah, unfortunately I already applied it since we're in the last week
> > before the merge window and it didn't get a reply - sorry about that.

> I do not see it applied to the for-next.

There's a lag between me applying things and things making it through my
CI (and often a stack of things in the pipeline so it's enormously
painful when I have to pull things out).

--xBPdZvVLvtnMBEwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOJ74ACgkQJNaLcl1U
h9AF/Af+P9X0mFAv774Kvxv9gw8u47vaQEs9ACm0Z+/fsTgyW9ubgLMMUauBbKkO
mCZWh+QSLvViSfrUhIxlPPmUNe/cpekZFL2rPjWKwBExmlbww0F3C8gHztIWozdE
5Ape27zAd85H6lBnbPP0fGEln5YTweq6+fqoLX7n+/Eg4UiV0U/rrxfGisjToBz4
W9tOXkh19+ZXYYW9AppIuljCItABoiWR18wS1iBw42CTj+OCC4w8x08UJBKd490B
e8ORwM311gMmTwHmrxHNL55/8NZyi5PuyXTwFGpQTxXAFzxWLp8KamOCffvKXN6r
st2jLFAphwF1MlJTh3ratvCyWlwlCQ==
=JU/5
-----END PGP SIGNATURE-----

--xBPdZvVLvtnMBEwa--
