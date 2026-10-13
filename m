Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A734D9F7C;
	Tue, 13 Oct 2026 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888807; cv=none; b=ppJGGKfVsco2drqrt+HDMIezyOm/B3Xtz0b5imccwxRWm1or7rnW1qxzdQe4qgO2w2h2S+B+gqcLDJ/znQcNLPQIruvEfXgOrUsGWrWKrIaRD8SzPHfLV3dA8r7tga2ceWvyafGp/+8LVlDm/qQdMGUEWet4KEivEXq7P0iMXEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888807; c=relaxed/simple;
	bh=LSjuzUEAq8Wk3tQTOOwKYqxu4oAa3MOlcx+xHkKIvtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/HjMBJgryYgYSyWtYKg4jgFQB/qVtUjq+SkCek0LKfnZcvJoxo1Ao71NOSjO5XZNEHcBWhCNpYrLh2ov7f1YtacCRzg5NtQ8a7FpSzrNP7co1Ck7M1aCPGEIDmv4rc+xWMkMVe1F5z2X+r+uHpA6r8R/jpmpxH4vvvZgzVflUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD5PPs/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD5PPs/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD3C1F000FF;
	Tue, 13 Oct 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888805;
	bh=LSjuzUEAq8Wk3tQTOOwKYqxu4oAa3MOlcx+xHkKIvtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WD5PPs/THEv2joNRH3WUmDo9s5GnnDNgZOHkdN1MKdFDJ5P+RoF3vjre+MLj9Lzde
	 J/r1l1cE80Fl9tsP/pDuNmpPqveMAwrXPluqdOOErmr/fvEars2VcJqW2VVWr5AI3y
	 6MMR+oO+uLU6pQ40J7QNyGLpQsrZwsU0lTPqV6zF1W51Df5YqsR7cWYXhyH6+WuBoP
	 m8W5IH7aEK4mb8pFHkwmPcab99tX+G0UsbAkYveF9q+TGB8TwKPPyKew7x3z3AMFeN
	 GD0jbDXaH1lR5Z/471/RWxvYtIUr01Hjd0flILYpnHy/xPlHNefE/dHNV6hPyES7aM
	 vtFinet7XTULQ==
Date: Tue, 13 Oct 2026 11:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amade@asmblr.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
Message-ID: <ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
 <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3CL9J8o+SSu9pZ3m"
Content-Disposition: inline
In-Reply-To: <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Some equipment shown is optional.


--3CL9J8o+SSu9pZ3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2026 at 11:52:45PM +0000, Kuninori Morimoto wrote:

> I would like to review this patch, but unfortunately I'm busy this week.
> Actually, I'm now posting cleanup snd_soc_component_xxx(),
> which has many steps, and is now under progress.

> I will review your patch next week, but I guess some of them (= not all)
> are conflicts to mine...

Ah, unfortunately I already applied it since we're in the last week
before the merge window and it didn't get a reply - sorry about that.

--3CL9J8o+SSu9pZ3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrODaAACgkQJNaLcl1U
h9AFHQf+IFmoF0+3WVE3eyIy0t8RAwZtBuH9xEuxRlH9R7XOa97Qo5nmEiBpjp9W
onlbEWX4w8FW0RN69NIReP/OGf5hO5zoCeTfUJfB5Bs4inS8UVE21UMCeUMQuqIH
TKP786SM8cXYx8nz1AOaQfnYj4wS7EpVXEg9pPpIL5iNsO5pbzUytmgoLGBB0Rnc
vH+vfp4UzzDZPszfh+IdabrtuTZ3VPgoT7S2UuWfJdgAjwU7ZEvdiwiG0MSTVBTi
+dAoclL7xD2f9Oo6HQazprRBpyEHk5IB1fc5lZiZoqniAUY17AeMIEBLQ9cxxOi9
JZEuU15DHb63VxvyEx33nCfs8iWvAQ==
=v9/1
-----END PGP SIGNATURE-----

--3CL9J8o+SSu9pZ3m--
