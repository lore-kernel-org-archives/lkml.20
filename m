Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5254E3762;
	Mon,  7 Sep 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790301; cv=none; b=GbGaNHg1z9TqAZWsuX2w6mz2PlvV0qwN3MXZToUF39FqIMZVk2ffpO00VhFyVeVNtxjvQ4aDgc6lgZfo0v44yWfAjluPbPaLJNrFyJ+904xh/Td+5biPWDP8B3dm8D2en/GZt0N/QDY1XqDa6WGO5qNvGhK1pHlZ/m0a6SwBaC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790301; c=relaxed/simple;
	bh=hCngWu9i8ziuHF3by31ap3P+lwi2mRsoG4QJA3b3rOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG+iFHKWrUec48onZ28M//L7dZJsq5Esr1Lc9GmTK2RAkElVywkpTukRKJzU55jji4+sSIiec+A81SoJXDQsUrwLEotBViwxX1Y7qXpaoGvFTMM2z4IZs5Q2BrfDi2A2Tl25LmY9pddnezaHIl5Rrg1Me7vsSqS+nxomksZtSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvcRnYt0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvcRnYt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EA71F00A3A;
	Mon,  7 Sep 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788790300;
	bh=63qcMAjXUSe/cEPnW+7HGzSh4eaHPuiWxHnFQ9uDPJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dvcRnYt0TmcmzJuUMRN7lVRiwxAqgZnQ1KL4kQ6Uh1+BmKLcv3/a4za5G8pLN/ty3
	 4aadUQisNrYCbAxhF7xuELeAQtv1HipVe7unFYbLcZvixwVXUZ2ZA2i1iPrLc7ChjN
	 xBVZ8pXmnbRJiTbzBZvkuxXv9x/o4ETTTwWQHJDqjbX93kWda+NS0oHu2/TEPCXM6Y
	 2h7s87fSXufaARx7HbihlPMzE4h9VLJ2iOdZWIwR45AhHzxS4cNIpBeo8se4pnSbJ4
	 3fwHPq7q+VGkWfnauouQeMUloFvP6JIMO7Noh+CLGsL9Y3NK5XaEjvKCIB/KzQoZtx
	 5cghREwxKnyeQ==
Date: Mon, 7 Sep 2026 15:11:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 0/3] cirrus: fix typos in comments
Message-ID: <d9865815-6b8a-46c5-9b9a-f8c4809a7e93@sirena.org.uk>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wJ2+JNaOoOMgqak+"
Content-Disposition: inline
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
X-Cookie: Who's on first?


--wJ2+JNaOoOMgqak+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 10:23:28AM +0530, Hemanth Selam wrote:

>  drivers/firmware/cirrus/cs_dsp.c | 2 +-
>  drivers/mfd/wm831x-auxadc.c      | 2 +-
>  sound/soc/codecs/wm8962.c        | 4 ++--
>  sound/soc/codecs/wm8996.c        | 2 +-
>  sound/soc/codecs/wm_hubs.c       | 2 +-

Please don't send patches for different subsystems as part of a series
if there is no dependency or other interaction, it just makes working
out how things are going to be applied more complicated.

--wJ2+JNaOoOMgqak+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqexhYACgkQJNaLcl1U
h9CFaQf/U/Ks3KtRmvBeVR0sYfXc2rwOy5IpsOZYvcfOk78lECxO+SCsLADlGFPC
oLZLn5gJVWO/vNnRjI/74+9YDR9Wv3NPCibJRyanoqF23WJcVhiCcgxYH33/W6uj
ka0HvP8JketkPi8KETuMPqYC85I/lRoKQ4ek/dp5mS61n800rHmIa7Bzd1QXfhmF
O24txIIzpITw6ePJ5ytPe736qUvsJE8J5UsnqCXaB9sMRxkxVw0vETXCtOcQmuNF
igQB2X0l1Gd9AISZsVQdhAplHgF54qqYjBjal21ElATtE5qu7XdhSzLxNEb9VMdS
32uJmCWRGSQCqqZDko+AabZX2Vcsqw==
=f339
-----END PGP SIGNATURE-----

--wJ2+JNaOoOMgqak+--
