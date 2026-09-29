Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C44F96BD;
	Tue, 29 Sep 2026 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694879; cv=none; b=ZE/KfV9mhqdeRoYrSb11U1YscHZYDvySCHbu3Wvo7QTSoCYpyFCX7UWMzZ82JZKLh4YiRUm2lgp8gOcvMrqpk29FvW695YxjmMMnm45fvF60QHVF5/0FD233TB6f9/aCye+KupySGu7LTQRt8WmtPJg1Y2QFmLVhqLls7dK3Wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694879; c=relaxed/simple;
	bh=cBmrkm0EPkAggtTwxvkfGmwase8wo6C3mxJxvL0mNZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euZroNme8Tr8zLTb91AFgD+/JSsO1lhwC2LRmnsJM0h5q5uHBelFnc/eXaog7mq1KLGDJqVHxf+tTMVkiQYr3sHRTb35CU4K/NbiyphetFRJjAXLRzn9b2lRK3B7cCQueodBGvlUCS0R22to5kSUbFZfmnXAi65umZ1rnS3lZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtI0l9nR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtI0l9nR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F8B1F000FF;
	Tue, 29 Sep 2026 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790694867;
	bh=n7ZrRQ1chnmodqK9THKeJa8hJHMiPCs9pg0BQi2fXeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CtI0l9nRs7p8TrmCKmtq7/sHv67qDSFDpaAXLUVYFOCVC3vVAcMCW/rOGX2x5xgtA
	 NF/60wtgHieH95Ne7N5E7/0QhoXUKYn1nW+awwmcXlr+sJVGxJlXr2ivjTAnHCTSRZ
	 z9QT0XPRduWmsdEzfW9hm5lokdohQtxBA/0duxgW8qRpm1NmUyI23NOryC7f+4+zA5
	 0E9QTOCHdAjH2exdZyQ3C/1OsfbhgPlBwK2pm0+YHW0muVVuzo7PhKZ9Wp6neTuAq0
	 qWTQDZK6XMTfrNdIpN8jNjDn+ZeaIEVIrtaYgQ28Mbb/6KciVUviJDNHUU+2R5H1ZN
	 WbiRoyW6NbzaA==
Date: Tue, 29 Sep 2026 16:14:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd937x: use devm_free_irq() for watchdog
 IRQs
Message-ID: <442d1d5a-44fb-4165-9a04-9b81ffd6b15e@sirena.org.uk>
References: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0gqpM7CipBeFoiIo"
Content-Disposition: inline
In-Reply-To: <20260929094223.2086750-1-runyu.xiao@seu.edu.cn>
X-Cookie: 1 bulls, 3 cows.


--0gqpM7CipBeFoiIo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 05:42:23PM +0800, Runyu Xiao wrote:
> The watchdog IRQs are requested with devm_request_threaded_irq() from the
> codec component probe, but the remove callback frees them with free_irq().
> The devres entries remain in place. Component teardown later tries to free
> the same IRQs again.

Surely the obvious thing here is that we shouldn't be using devm for the
interrupts in the first place, and/or should be moving to the driver
probe and not having to manually free them in the first place?  This
isn't the right fix.

--0gqpM7CipBeFoiIo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq71c4ACgkQJNaLcl1U
h9B/Gwf+LmLi7L4KpHRMV4uNMb+G7iruhgUAc8R49wEdQm6Rmkyo3uWGWBDXf7mb
dKPybGCA3Y6LmrbqaFfksOvVfz9sEWg7sj55xtzdhuYoDGP4yhOAz78Y6/9RfQaq
y18LyAkuN0XfYmC2FP0t8eRGkEuzYhKskObFlvCaYriSHLDUS4WNGm7ZftBP+ewT
sRRsjAlSgHC/s+61x4OynhgQ/219KGeMcWLOapCn41AgvvAsPTJSf2u/2wYeiUJA
B5NkAfvVV1FjALI8NMQNifIICuWW0MO9rsiJ0T03PM6T4xyOoZgpBq/OrELYw468
U34gvHfTY0EfAeuPqYrl4Pu7f6ha2g==
=bu/Q
-----END PGP SIGNATURE-----

--0gqpM7CipBeFoiIo--
