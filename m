Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C834E2F08;
	Thu, 17 Sep 2026 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789676437; cv=none; b=bsTHXEW0RNcvSEhj1e1BrmNPjbhcgOdhdBkXJ+Xz0rR3M+G8AgPMD03woFk8yn4tUx0bHSqxS/ZDlv7cugrPstUtPcuNDE31UuklBhEnn5ODnOZ9DZACtd7WA+WvCSEf61hEok5Hxe47bz1sLJSIPJ7M99quB2XjDUSMIUjPUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789676437; c=relaxed/simple;
	bh=nd/5HHPlftnHrZur5nFfWPN2o5+TjuncJnp/PjBNr1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH50xPV/WIWbexfH9G7MvftuHfG/6rY0xD5GVIVcv5SISjYVRYDsHIJjx9e4CyVAl1pH4KMcCI1B7z05Hkfhn0fqeS6J3F8uxY+DEjf0WFWozyeUGmoLLTyGQOzD95o00q8WZWo7L2dkAZElZQ5jcY07t8JmxCwFCdmKXCmQ+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D05oQnSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D05oQnSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9261F000FF;
	Thu, 17 Sep 2026 20:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676435;
	bh=YIF1moLIJmH0hmQuNnZvZenZoFAL+5IW0p32XBdrGWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D05oQnSwImIYzqmLloEHcygB6x4HNjUYnYr+Xy1CIyxl46nnFHH7UlwyddW82F4z7
	 9JVdekkSgM8bzMfsumBskBOrLc+UEIUmYyWKUWrJIXLArAXasdLqS5qLK6pPFHPZYZ
	 Xt0SIvw3V2J7wEgo7VveWjtwuWb+6eADFePD2S7Lnkn+AXaVCClAl3nuEZ7qlVLkEP
	 zlZJaSqRH41FfjDznPJJcLVwpaN/7c6rUZtuPxrMPAV9sWhEB3QKtFkWfkYRlFYdG9
	 9va34t7eAG74D6wFfFstLUC55Aq3+RzRSe6T/dhurEY3n50QawgN3vKE+WO3/WAeyY
	 fHRZO8jeibwBA==
Date: Thu, 17 Sep 2026 21:20:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Murray <ryan@aurorasilicon.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	james.schulman@cirrus.com, povik+lin@cutebit.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] ASoC: cs42l42: handle jack interrupt I/O and
 resume errors
Message-ID: <688587d8-c48a-4948-8a2e-c6c343bc8042@sirena.org.uk>
References: <cover.1789620318.git.ryan@aurorasilicon.org>
 <c7b09816b41cc3246153de5023c3542e940cdb26.1789620334.git.ryan@aurorasilicon.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRMukn3XEA+Lorzc"
Content-Disposition: inline
In-Reply-To: <c7b09816b41cc3246153de5023c3542e940cdb26.1789620334.git.ryan@aurorasilicon.org>
X-Cookie: Whip it, whip it good!


--nRMukn3XEA+Lorzc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2026 at 05:23:37PM +1000, Ryan Murray wrote:
> A failed status or mask read leaves part of the interrupt snapshot
> uninitialized. The handler can then interpret that data as headset or
> button events. It also attempts register access after a failed runtime
> resume.

> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return IRQ_NONE;
>  	guard(mutex)(&cs42l42->irq_lock);
>  	if (cs42l42->suspended || !cs42l42->init_done)
>  		return IRQ_NONE;

> +		ret = regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
> +				  &stickies[i]);
> +		if (ret)
> +			goto out_error;

Don't combine goto and scope based handling, there's cases where it's a
compile error and it's just generally asking for trouble due to the
differing approaches.

--nRMukn3XEA+Lorzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsS40ACgkQJNaLcl1U
h9DRZAf6AqRh9xPCyfIu5kl4UMfwAm3rb0dhX0MmBTBmhDwndv4VdcLdE1PFSOtR
6VdgVhw1TK5rgmeCD/TAnCmlqJdppqYGu0oQ0OEDgMJK7Geq/iteJxOD6BgDJ058
BqYKLjWmIPuiX2R64MNQzMvtmJzzKZEiRyc98rAPpe5u1unzdXezl8tYh2wH8vMO
l2d+3vFS+gJP5AZqzYd+LWEGNV6JAvC8d52OHIIlbnbws//OaGDGzfBIydsseS7y
nsddMw9EQYFSMTYupa9gl9ZnaasIjR5Jz7ZZ+2/OmjkJKi6G+6oPebfGgG80O7Vi
1A12ngJJf1mBRf9dQ9ZPvrVNg5qrLA==
=QV3F
-----END PGP SIGNATURE-----

--nRMukn3XEA+Lorzc--
