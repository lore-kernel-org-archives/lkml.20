Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758D42AF9B;
	Tue,  1 Sep 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275920; cv=none; b=H5UqVMDoePldY6s6Fgk2In5i+LZaXTQ09PeY9tLJKbHPosGsHaFi+6H/zJw/NLYPIpmW3fLMh5nDHWWHRrVSGFQDFWYgZxKHHMMY62YFF6RVi2U987WGixX4Kg1X5u9Ufd7ZvrJqwUvblUZXoEeDMWlulTnRs956IKWUnq53EEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275920; c=relaxed/simple;
	bh=IvdIGrXGCXLC0QzrjJ81yrTnE0ZKJP33tWClR9PcPGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwbDlw97ulCLVYJKRVm0CcbYZYGmlaCTh0uxeObSyh00tRuJFBibSnH8CfgA3eMzO7HdjkQNiPt8tdHyIToaNUSg9BygFnuOxJ+gOnodUqpLdepoQA5XbIkpiWSSF4062E/mDhuZi9RnVdKUeSATwN8flMGFNrBBoV26GGN88l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LODuncn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LODuncn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE781F000E9;
	Tue,  1 Sep 2026 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275919;
	bh=BgVkwYznCzdwHNZ7efh/h9/PcMyFGUz0GDO3TyBDrqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LODuncn7NNL/CpjM0CsiZ/cJ+zLdBZX49N5rXj7bydKO8eVoAjzO9irnFMzjDznY4
	 8yu3WYjhkdJuATtqFSB1XdpTRl6p3HckcszkWbkgz1P5wlCw6wQeHMVFu5uVDgZAbh
	 hMi6XRMY75pcUy0ndg8gIc/IVgD8d8BbeOoBg+SHzaj5lbCxgiFPrv1OQLw9JK/B7f
	 CBr8tAneR0at5tN2YsREP1DPhNatyltP1IVFvAErqapebtRbTnkQJXXN1I0tACtcBx
	 TIBZqjhHX3/xjr5sDYI/kc2hHTW/dHf1+AxPUKBvFcnFqA6ywN9qGiAUy7ow8DUXpU
	 0DTvHN7WyjfWA==
Date: Tue, 1 Sep 2026 16:18:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
Message-ID: <7feebecc-66f7-4ac2-8c1f-0b8bf55cb528@sirena.org.uk>
References: <20260901122644.634494-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nLOlIQnck55rXajZ"
Content-Disposition: inline
In-Reply-To: <20260901122644.634494-1-rf@opensource.cirrus.com>
X-Cookie: Prevent forest fires.


--nLOlIQnck55rXajZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2026 at 01:26:44PM +0100, Richard Fitzgerald wrote:

> The work item is queued on a freezable workqueue to prevent a race between
> the work item and system_suspend of another instance. If the workqueue
> were not frozen it would be possible for the work item of one driver
> instance to call snd_soc_register_component() which then calls
> cs35l56_component_probe() of another instance while that instance is
> already executing its system suspend functions.

I'll apply this since it's very much a corner case and there's a real
problem but you should probably check out the kexec case - it looks like
it misses freeze_kernel_threads().  TBH I'm not sure the issue there
isn't on the kexec side, it's not exactly a common case and having a
difference like that feels like asking for trouble.

--nLOlIQnck55rXajZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW7MoACgkQJNaLcl1U
h9Dn1gf/b6quCbkp7PXNAnVrsgODhbGf7GxuICE9gsDUJV17kBCOQLt8ew2XNsNX
6IuICI2ArrTXPpQlxL4Q239lTmR5IMNH5a8SP9kgtI/FvK8tNGxXga3fecmsuDCx
+RhXHtL2AHQ6fygfkAfkmzN7ewsGaZaBW9jpl1CjU1V9bclOXuhtoEsx3W5gRjtg
BdF/5lr/fa5XGOdzKPvZwENnZqcd6IMSNsHSkh8mFW9THqeN8ARoyVDHIyj5vL0P
/03ADKtaTrXhy/6plcFUKISF8Sv5pMDwYBAmoYedrQtw9MjTvscQJqXzvjCWiEeZ
+kGak3nZww3c4bbi3nVWHt+h77SyRA==
=H3EA
-----END PGP SIGNATURE-----

--nLOlIQnck55rXajZ--
