Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241407;
	b=to1vZb+Yb5+9qV6/Ul8rTD9/gk7SFdQsahXW1PFLZzom5s52RprWxBRX2TXpJxAIm4ro
	 PrLxd5F+9YN3hBgkgFXAJuNMWDywxyWNLWWZqjlD/I8FlESBlgME2/7OFqLdvdomINFF4
	 67+Q0xqOCJ3OPX7hTEQH0t5/SblZcP/w1QVuAaw+ChvE85G/BxywQH6fFC4BX5qy87uCm
	 3zeHvdVpFdcJjQavq96aP/TfTfpqYkwiwNhsXKx7NP8lIQKwdi8kU42FffkUa1QPyQ+58
	 22AuE0kFGp8p5Ne3418+rrlou5E35rl6r8gziG7rce/DAfqCApEpz1TdA6r4ztqtkGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241407;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=tG5yEYutI+mpKyTMneJT8rko5YsS33pVwWvh68hLObg=;
	b=NzSDnx+rjviIei1B62vgCsT8kajjlJc/RTxiez+1riRvvojzhgBafVlaVEirO2Bhp7uN
	 nB0sRPAFn+wG1+nhICVPDtcnf9mqS5mRX4sBVRHUFYFeFYmwCOWgSNae7img4wGs+/2LP
	 rV7nFi/Va7Zijk2UaBlNkWlrByEtBvO20DA2J+ARPEa05efvFc3mp7g/cBetmwS5U17mR
	 8gMIt6T8HGNcGEjDom3YJyFgI0zeF1jWzsWJeDQu90MtAXlmRxORGbUvCPz8DSF+DMM2a
	 xgWM1NBL+bLFUmGgbNAscz2ZUIM+VQAAx8Lv/4GV9t6gAF9AdUOSlXkqg6XgzA0zjAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz87hB5k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF45606A338;
	Mon,  9 Nov 2026 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz87hB5k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FFA1F0089F;
	Mon,  9 Nov 2026 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241406;
	bh=tG5yEYutI+mpKyTMneJT8rko5YsS33pVwWvh68hLObg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jz87hB5k60+uTGtLRku16bW3/e5kRmOxfhlfOyNBjMBL1583P5K2jAVIVtYzdzcZ9
	 7CXXLkC63CRSsT4iPFW/3FpvyVHcaWcPsSNriFvaQTRBRJIo/udtienq9TqMU66e3E
	 jt73m0An7Xx4E+5iZgx5EDhnAURvWwf3WhoMSUf38Xn/Lun9ZynV54GVmpZmMia4BF
	 KO+sa6/Ww+bAAxzvsodLhXI4Rl10eCpp3gvU6SRQDxYEX5V81bLXPd2EN50ivv2kV/
	 mq9i/fBnhWoYauvqBETQLmCGAeqM9T90Cx43JvuxfAVeG5AqeetPj3grWiSabqB3pm
	 JQPDYPw6hBVKw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 361491AC5995; Mon, 09 Nov 2026 16:23:17 +0000 (GMT)
Date: Mon, 9 Nov 2026 16:23:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error messages
Message-ID: <avHzdeplLMGaL3EM@sirena.co.uk>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
 <20261105104237.38542-4-phucduc.bui@gmail.com>
 <179397468197.3073895.1522608204443678480.b4-review@b4>
 <CAABR9nE52Rk81oyoM3L5hHRn3n9OCP3PWSxA8nNt+aEPoeRtqA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHui3L9dMLkg4C6t"
Content-Disposition: inline
In-Reply-To: <CAABR9nE52Rk81oyoM3L5hHRn3n9OCP3PWSxA8nNt+aEPoeRtqA@mail.gmail.com>
X-Cookie: Victory or defeat!


--ZHui3L9dMLkg4C6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2026 at 11:08:05AM +0700, Bui Duc Phuc wrote:

> > >       ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
> > >                              np->name, sai);
> > > -     if (ret) {
> > > -             dev_err(dev, "failed to claim irq %u\n", irq);
> > > +     if (ret)
> > >               goto err_pm_get_sync;
> > > -     }

> > This will only print an error for a subset of errors, things like -EBUSY
> > will now silently fail.

> From what I can see in the code, devm_request_irq() ->
> devm_request_threaded_irq() reports every failure via dev_err_probe()
> in devm_request_result(), so -EBUSY should be printed too.

Ah, that's changed since I last looked.

> Or did you mean fsl_sai_read_dlcfg()? It does have some silent
> -EINVAL returns.
> I'll restore that dev_err() together with the fsl_sai_reset_hw()
> change I mentioned earlier.

That too.

--ZHui3L9dMLkg4C6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavHzdQAKCRAv73Ows9A4
ifrkAP9gnev+hbGO8ePdT7PHgzH3El9OJEtgV6/8NMCbTzrgSAD/RlZa/FDVWGL6
B5UGRb7dndjHNJ0rmqfE9Yhe/h0YhwU=
=fhwP
-----END PGP SIGNATURE-----

--ZHui3L9dMLkg4C6t--
