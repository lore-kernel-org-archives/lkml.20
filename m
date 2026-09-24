Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F2832A3D7;
	Thu, 24 Sep 2026 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270168; cv=none; b=PGnURVjmjypfOVN9je8bi0zYfnGJWxjIv4WWj7mho2nBBGvAFhp8UqQ+61DVIFiPnWCf3Kg18Bv5UXkL4GmcUwgUWP4OLjZbCtZXMnLGPf8GAgMpNaTHbMncc5fjyeTRoUzxhMp3S4BkIFwVoqRNV3XKcptjLf8E5UnXUabOUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270168; c=relaxed/simple;
	bh=l7EPunzNere6TJZFXapnJ1i2B/w1f51shg7LoArRGlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcC/hUzLmEuVrA1vacGHKe26onsLZtEL79WhMr8fQE9pzVQK9LXuAxmRnkLTN5bU0VYMQWLaHkiU2lQ2mt+/WRd/XLv0WCudJI7g9woH0ZKnfGZsxU6iEjgLwE4TNsVDmz8vPF5Wv4i44XXqkWQKfvjdj4ASIXtI1FMyR9NklkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQIE+sBD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQIE+sBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2722D1F000FF;
	Thu, 24 Sep 2026 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270166;
	bh=l7EPunzNere6TJZFXapnJ1i2B/w1f51shg7LoArRGlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NQIE+sBDeMt/YoeadQk9mIsTsTckafsht6vi76MdnUeacqf1sGvrUbEGWUHt7jx6d
	 jMd5uu4Eb5SqJdlmCTQKm5dLNqhCgGmoiH4yzUAO7gxIcJ1vcm0EVQAfYxfOyf9ijE
	 RDc7lKIMaleckJL1/ULkCl9FZ0hpZcHRvLfMz4NuHUC9LjNnlbGk3TTvIBQc/9sFIb
	 aq82QdDAkd4i2wsqkFGKa5XETnYsuGzGHFXWs9/NvAXh6WpNSxIb8KrWoIY5Wa2QAQ
	 AaRKHJzuWrc/8zmQei4wBS8y1ibWr+6kE6QGuYhysV4nxxkTOLJOH6dUgIkVX0MrCB
	 I4v2Owp5nXrIw==
Date: Thu, 24 Sep 2026 18:16:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <9f1008c5-5529-4916-acb7-81a75593aaf2@sirena.org.uk>
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
 <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22uyFBtZ7Xdfmy+p"
Content-Disposition: inline
In-Reply-To: <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
X-Cookie: Oh, so there you are!


--22uyFBtZ7Xdfmy+p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 01:01:15PM -0400, Alex Deucher wrote:
> On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > I'm still seeing at least:

> Does this patch fix it?
> https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1

I don't have the tree any more since I'm further into -next but I'd
expect so, thanks.

--22uyFBtZ7Xdfmy+p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1WtAACgkQJNaLcl1U
h9C12gf/aQ67+bp5y1NEDx5tDqCCRsjTxQOkH7d95rMPicLmNQihy16Y67eiJkPK
I5Z6lL99GkYECImspYxhbQxcddeH58gzVhNCBDG++u2dJ+Iq3MNZfFlberCIn0HF
RXfbsVwYZmb6fhhehnyqz/koznMQn2ZN2IFzYd7bF+EcnVC94C9JnH0Mnyq9zhtT
05/Yvu5FYiD2Aj26ePQAe8XsDVYMXq06Xa8iXbomfn0JD3DIp1TsFdo+z780+d1o
9BXKE2BSS3KI+5socMhxFhmNgH46XH+EPu/XH2N3Mwx67ojaVgp/0HMmdFtSY8CQ
mJFa1191yu51i9KOq7Yf+H83LNLXbQ==
=h98E
-----END PGP SIGNATURE-----

--22uyFBtZ7Xdfmy+p--
