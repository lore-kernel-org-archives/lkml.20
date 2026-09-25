Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514053B71C2;
	Fri, 25 Sep 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353115; cv=none; b=HdVSBzjfdciBM//6r/vnJEaFctNbExYyDFCzfUql/+PDV/onW3l431mMnssqe6EfEm3X8Tu/4gO+mT3Z/nccrBEvc43Gw3W/BsFR3Xvd55T/uJnXkkmUu6GBU1xKfboL9bFzEIC6l3pgu7bzhHqBcstEpr5U3ogp1ZXDiB6B9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353115; c=relaxed/simple;
	bh=nepsMJqaqya+RdPsMR2Zx/r7D5TnbskzUdbNoW1W1nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJeUdD1aJGMxpIbXbFbu0xBgRsZt9OKbgEQAGh8Wmzw4f0h8RoMz2d12DHlldG4pYrht2cg98WuYYSOcRUCHJRMpZvk2/LP9kvXw78Fsqvqaw6K6+qilWH35/sjiO++DzJYVpVJ6y8/6g5nyY6r1fEl8pJuCL9S1wIEbf0zIqig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJtFsT+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJtFsT+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B0E1F000FF;
	Fri, 25 Sep 2026 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353114;
	bh=PFdr3oMOYugfvjblVBa0cuadRVP5302Yx+yU4gLdRmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TJtFsT+PIpVihOdpT5yPjdbVMr8zBEWQQ5/N1fCJpBGNPm9qhXAIAxFpWDVd0Mp8Q
	 3t73k72yJ30zV5Hp0cMVWhh/jrOn6TmaWIofuDeIvk8J5PtKE1Jf8mXGJFbn0ioj/3
	 S1P+Z84/ygv1WtbV0ZfsAl8at7m8jlIihdFfRVy1t7AgyY/bNjUD7HrBCWMXFfGUg1
	 VMnNkEt0N791uyUNsYFH5TfUTDP6NH6xWQ1nEoO0AtCIGcp3DX+6MzYoTy67rrrbeY
	 mtQXtzPj5Zc+aXjQhBRzMTGblXSgpEmIH8VrKwapCqpn7sH50Nftls50GBqcdmBcFq
	 FZ2dW5FW9jHfw==
Date: Fri, 25 Sep 2026 17:18:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: Re: [PATCH 6/6] ASoC: codecs: aw88166: make volume control usable
Message-ID: <d11d2b20-74ec-408c-bd06-765ccdea1504@sirena.org.uk>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-6-11f74cb5fe28@gmail.com>
 <721467a7-6b7e-4234-8321-660eb43f1f9c@sirena.org.uk>
 <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GLpr9e/E4qATSc7z"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-ofi9J6SZpKih5pogtH4aL_HDy3WmUQJ=w_nVd=YskTw@mail.gmail.com>
X-Cookie: Love America -- or give it back.


--GLpr9e/E4qATSc7z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:05:42AM -0500, Aaron Kling wrote:
> On Fri, Sep 25, 2026 at 9:18=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:
> > On Fri, Sep 25, 2026 at 02:47:34AM -0500, Aaron Kling via B4 Relay wrot=
e:

> > > - Invert the value to match userspace expectations (in the hardware,
> > >   positive numbers represent negative dB attenuation)

> > That's a very bad compatibility break, if anyone has a profile saved
> > they might get excessively loud volume from their existing configuration
> > which could be distressing.  It might be better to rename the control.

> Mmm. At the risk of sounding like a broken record, is this any
> different from the accepted aw88261 change? I wouldn't be specifically
> opposed to a new control as my use case, Android, is very tightly
> controlled and I can just update the audio config I ship. But more
> standard Linux use cases that rely on a standardize control name would
> be stuck with a non-standard inverted control forever.

Why would renaming the control do that?

--GLpr9e/E4qATSc7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2ntQACgkQJNaLcl1U
h9AcpQf/RBzYECiH4yBSUN+ZlMingxbhFajYAdk68KedZrEqPh1FuIo+12Mj3GfE
gGQvGiaCMOGiPhTeBBgCoyjaznWbdtP8Sb5GA6M7tM9AP2tWmrALPbPZoDotBJ3m
EkvpFMe/l35HhYceiNZgVagI+IPAcR4HOHK9ckx0vi4/agqbNyDaH8lPC5rNe6nR
KjKCqQC/UJV6fSCLaaWpgk//J+Nv49nrddQ4j9TwBM50BSK5OuiExV2HrwR4OOVR
LuCORLi5kqqQPuNXvU6aS1tMZL5pcDUPohsbTmv66AId4wUHB9SPiH9X1WHyvybk
6t5JRtlTZDa6UTjOSMGdj9c4yKJzew==
=wykq
-----END PGP SIGNATURE-----

--GLpr9e/E4qATSc7z--
