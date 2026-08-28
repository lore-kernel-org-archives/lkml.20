Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE8F3D3CE4;
	Fri, 28 Aug 2026 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921088; cv=none; b=Ia6VcWuwwzTCn2M0T+76Cku1W+6hs07Qa94EIP4VsAnS6Vr3ap9Teenr+rnA2rO9/JYEQaUNR1Zwf+GbwGopqwfArpGtprdlL0iJJA0zV16nD/DLDYj0hjCAAFtIUJ5MHxIxiw7NbUbFPWE8VURWG1oswWH7ySFKz53oyzZc6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921088; c=relaxed/simple;
	bh=nshHP7x8WEGBfj542DDF57yX3+jGA+Amw2RauJKXdA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9WtrVyQlCFaRiKJ0QHT8X22Js+pZy9OF0JPYCH1w8GaZnKzr956eTOKNM38JvCAqHijjVCZ0/mNiEUgs7IK2YCzj+MtD6UAc0iYCeMdp2rwRdI/yWEh/w0KTyQ5sy8RvAweLLbu74sAnyGIsB7RxM0AOFtVW45q63ca9mSshPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgAutBcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgAutBcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710881F000E9;
	Fri, 28 Aug 2026 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787921075;
	bh=3kJSAH5exnvT6MOi5AuZ+r4DWavJBoW5i3pCUAmmcW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZgAutBcv7J7cIn/FStmzbNq6eeIh0Dj9WDlWc5SfDFO9xVk8tcyt+DxT2Te5DVTmv
	 iwkX1ZDt+9t5pUNddhB0IJuL/U2O41sMMivLOGQawVbvJe7tkLBy1lprm3FplsbobF
	 Cqren7XHZXNJYjHxjl6qIRMD3slX4p4e5w52qYIlSgRBDyOFAYgqvHQrQr2IsxrGGo
	 +kWHnbMsbOFtX859JvVaTZ+rU1v1PIoOJiL/0LfOoqQffxgZ/A7lcsWkAqV92IIRHI
	 BhEq3cHyn9Aj0qTzIBoqexkdJDkRjsdjF/ljiuo+IqzQTugE8g7ajAbavoYQCjt/it
	 2P++rXtSb46Cg==
Date: Fri, 28 Aug 2026 13:44:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/20] ASoC: cs35l56: Propagate register restore errors
 from runtime resume
Message-ID: <558cad3e-0e13-4520-b8c9-22be256c1b6e@sirena.org.uk>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
 <20260828113416.47061-4-pengpeng@iscas.ac.cn>
 <38c0d29b-fd36-4fbc-b94d-f99799b43c8b@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZBGa+yDY4oyJU9+"
Content-Disposition: inline
In-Reply-To: <38c0d29b-fd36-4fbc-b94d-f99799b43c8b@opensource.cirrus.com>
X-Cookie: Subject to change without notice.


--uZBGa+yDY4oyJU9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2026 at 12:55:58PM +0100, Richard Fitzgerald wrote:
> On 28/08/2026 12:33 pm, Pengpeng Hou wrote:
> > cs35l56_runtime_resume_common() checks firmware wake and mailbox errors
> > but ignores the BOOT_DONE read and register-cache replay.  A failed read
> > also leaves val undefined before the BOOT_DONE test.

> for context (as the context is missing in this patch), the code
> immediately above this already communicated with the device, with
> error checks, to determine that (a) the driver can read/write registers
> and (b) the device reads back a valid booted state. So we already know
> communication is good.

Yeah, the reason we often omit I/O error checking is that it's very
unlikely we'll see errors mid run, and if we do the chances of there
being anything constructive we can do about it are generally quite low.
Usually the bus will already log about things.  In theory we should
check, but it's not normally actually important.

--uZBGa+yDY4oyJU9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRgq4ACgkQJNaLcl1U
h9Dp+gf9FacvM9JyMdlC0gDqBfljv7IOk+g8ypEZTPSZyo+CCoa8tK+D8p+k6S2s
MjSmprbSgozwXu3HbymAWlsEu1kVTyzx44nx5O8AsCpf6EFiljw6EWN1VakfvrQN
+otjF2TuyYzdW9ZXTmuQ502pTuyP6zYjqMw7lastSOAilkNhefnt5dikoRdyqQBB
fzt3HhqS4/r6M/6BhF/OUfUxhaP8DOjWOWmAPbTaUxrTt0uJgz6AApR1ruOgSvlJ
oThobxcodV/iRaIoHlJJNWdRDPLjTxvp6mKIfY5TmENvjmhuF6Uf38nt3TfZLPJu
e9RmB+il3svBp6UxlfuFyCRVu0t5YQ==
=W1Zu
-----END PGP SIGNATURE-----

--uZBGa+yDY4oyJU9+--
