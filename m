Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354A5427EB;
	Tue,  8 Sep 2026 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875441; cv=none; b=sXPOhvnfNPPOQ/sS9hhQclsPnhboqEcW6P4Jka9Ns7Fie5J4BXfzcUiP/jf2ajFUQN7AECHcWgFjcQy6J/uk2CQgFzSpinDOYcH4pvoa+pDqDbHfezYZF8YKlsHV9L7ugzK9FjbwIgG2MZJbbA3TAq+blZT50kcFqWh5ay95GDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875441; c=relaxed/simple;
	bh=Jd+NtUA5mJ/AsggN7py4RFbrmv4DJVUcbKJ9FoxdVM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UIFxbT3UJlGhSuZ/tro2i4sVNYrEv1y+HsmY8y7k7OLNzFo2kGsZeBuXYb2UGL93Lh/ddWpXlJoGbUjiNOZNfB1aWsEdeph2feCop6SYr/vZ8eyFkJFUAY1dNKXGFhL5n6xFRPg7TCmCaEI1yPEzsuY0x6ggafuEoVGWPv9Ltog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSJwv7Mb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSJwv7Mb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC82C1F00A3A;
	Tue,  8 Sep 2026 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788875428;
	bh=Ypcd7yY7vmcX83+gZqkee0+O9dXiuC/9T0z33M3cUFk=;
	h=Date:From:To:Cc:Subject;
	b=lSJwv7Mb7mimvTKptRb6W953vcSK3IIZLRxcmOkNbU+und+J8o1WzUuqRCxHEuQoy
	 P1B1UPrZX+4g2Lwhk+NWQR8H6ru91mt1Wj487PKX61+hO1/Ebb3MGsDjm9vkcEJpA5
	 w2GAyUh1S9BP7VuOuAxpwTVRPhQJpqBTPWkIKgJfOiRyUmqo3FK5qLe5QS0PGh0Zzy
	 iQezruoWh0tKakmKSsUVt5Wq/J0nUfTWVthMa1ul3S2ZljKrxBmhEbOksp0vQKTvNb
	 0UECf7r24gUqP9wjbP3UcPjk5mvHwdG8QUPX0AMCRl62UQKseL4i/v8DeP0AIatV/v
	 MXQEvQZ8QC1cQ==
Date: Tue, 8 Sep 2026 14:50:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <aqASn9YDPLpu_vb0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rlzMlQ66gZljiiQn"
Content-Disposition: inline


--rlzMlQ66gZljiiQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/tmp/next/build/sound/soc/ti/omap-hdmi.c:408:6: error: no member named 'card' in 'struct hdmi_audio_data'
  408 |         ad->card = card;
      |         ~~  ^

Caused by commit

   699e5975e2a53 (drm/omap: Report HDMI hotplug events to the ASoC HDMI codec)

which has been generating the exact same build failure in drm-misc since
this time last week (it looks like the promised fix finally appeared
there today, though there's yet another build failure in there behind
it).  Please take a look at your processes here, there is something
messed up if not only does it take a week to get what should be a fairly
trivial build issue addressed but the build issue gets sent upstream
unfixed in that period, comfortably after it was reported.

I have used the tree from next-20260907 instead.

--rlzMlQ66gZljiiQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgEp8ACgkQJNaLcl1U
h9CJLwf8D5Jj48mie3CTsq1qlg6Aua5XtQrNuAT+gsXGwprFZ+T+tpMa7HmwAspk
O5drF2SX62eNilqcleFjsuoavMPONgAhzEBpkULE5lR0icPLlRaJDn+KENhGFV5c
FoMSp6jLw4AxC00kNGPvKhjBOFcbZ0NGrurQrHAkyMSqnJ2plE8vA8HnGwlbogYo
JDb51kpROcjTb0Px2KguzWiPvL5ffEJ51FFvjDeP6MJ+6PlGsz0hfQU4h9ageb7k
wYEDUjw+i3WK7xm1UqXjRMhN0iYIog3BViYkSBesF0amoO/iLbd3LWJQN9UKZ4t2
XlyiWvoYvjLTUugjehzgz9EZ7U1mIw==
=KlRh
-----END PGP SIGNATURE-----

--rlzMlQ66gZljiiQn--
