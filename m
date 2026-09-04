Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972A3ED5AC;
	Fri,  4 Sep 2026 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537410; cv=none; b=svICS1iDnJX4VjrYyg5P1TiVSkeMu4wjQVC98J8Ra3V/9/f1j8AZi836nBeQ+HhBkGnRagDkDVz8+3F2QjZwJ/Xhd0DsBk6CfFocpTXV0bHOuq9DqsoCbbaq9M+rWnREJwSeyOpT4dGHI8rJ5zLgHvg0CiyIwR/2JBvSNHzBZn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537410; c=relaxed/simple;
	bh=Wqe7V5jigU1tEd47oUdV0pAEqaxtM+usXsDQ8qTONt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTRGClaVf19ipfR/zOnw3mNP3/9IRzk7oyJZYrvAgmvG0hoU68FaRcIjs2WUfdgaWDEAZ0rJ5GRQ8Kn0kbzKifStM/xxrG3e+gmlw4IQaLzWsEh2W7LuoAKpnKtooDj0eCK9nCkvh7uwd02WqsvJ8wUjS1H9aN2QiisaGsnVBSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxgXaINm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxgXaINm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E7B1F00A3D;
	Fri,  4 Sep 2026 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537404;
	bh=4g93PhMijTSLmg1+oQtraAOOBVjRubRTVEKa/SIB1qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZxgXaINmrBPUiPnVR4hFz8KDLQM76R+1J9YHHt3zSIWttEfY1cHSOiEIz9mgZ9YQb
	 Pu8j3HO5v7K+VyBVIcnKkzmSvnMl5ac0luRGLIqfHvLDUWQwhWdMrxE1aWD5xIJZLv
	 SGF5ErLW8z16JdLwboFMrGkyCSkqmN4PkGyrBkP7aaQ5NFkjDs6MA/SI56JsfMbcWD
	 cez1etoKQqLHL+rhrWGvebFy1wkpyZJ/TqGtUB0HXcA7gTIzS/oRzNxI/xQ2cqWT5K
	 9bJiWS6J7o/tSaUTzU7HWc5ByZ68/RL21uPodZznhKEOvUBjhImRGsKM3Zxv38L0bk
	 jlRxahh963/Cw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4B7D91AC528C; Fri, 04 Sep 2026 16:56:41 +0100 (BST)
Date: Fri, 4 Sep 2026 16:56:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: doc: Fix bracket and wording
Message-ID: <aprqOQm357605zoD@sirena.co.uk>
References: <20260904120737.758809-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RXQjFobGZcgVdBUO"
Content-Disposition: inline
In-Reply-To: <20260904120737.758809-2-manuelebnerli@mailbox.org>
X-Cookie: My vaseline is RUNNING...


--RXQjFobGZcgVdBUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 02:07:37PM +0200, Manuel Ebner wrote:
> Change wording to make sense.
> 'above' -> 'here' in placeholder which already is above the code block.

> I guess the line is to show that there are more DAI links _above_ the code
> block. But it's already above, thus change 'above' -> 'here'
> Let me know if I misunderstood.

>    static struct snd_soc_dai_link dais[] = {
> -	< ... more DAI links above ... >
> -	{
> +        < ... more DAI links here ... >
>  		.name = "MODEM",

You've moved the bit saying more links into the definition of the link
element that's show where you obviously can't have more links since it's
a single element in the array.  Again, I'm confused what you think the
issue is here.

--RXQjFobGZcgVdBUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqa6jQACgkQJNaLcl1U
h9CzEQf8D3WFIxa4Y+cYPR2KZbEiFQn7J1PO/eqdUkfw9D8yg42gM+6t/tiJCR55
S5Fj78mxFBdH3kAVD8crzKQREjnrOiGl7/8yUINsv5NU78NAOhZot9ANXeTxs/dk
Wp+C4RwWjT7Vf1srG8OaFRAy11PBkR1HDq+I80HtUxdQrwFQ5TayxJwSLRw75PpH
S8jonQXJX86FZ3OnxJhVl29El6BnvoFGMPJ4L1ScTcElENo5W0GVKNl8UU8hBx0b
N18gxcNIrcOHm2cMAxJxv5RR3aX7boaKbo3xWMs5OIaPbee3+m1SSNN7Hs1YVplR
RfghGwtlvtask/nG37Ap/UyPENZEzw==
=5+xh
-----END PGP SIGNATURE-----

--RXQjFobGZcgVdBUO--
