Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896391;
	b=OHuAtU30u5Vh+BIJrtKmAAXJZW+LhByNh+azQYD1vY/Wk7z77sGWHBl/5jbWX7PYsJXd
	 XNjTqQRtHmTuHF9JEkyxJtpnYp40dV52M+x1NZGnZ0dac6GMECh4tnUxhT7TzqyZ5F3tr
	 AbM7j65VR2s//RjfDe8J+NkOm7roB4+Vis9IrBlfUptFT/TdhfOZ3OBY1yU6GTJp61owm
	 R/LHxG1COnxKRqvAXtlS+Wg+HdFEGgk7tT10SrXILy0tuU7HJ9verFzD9RviSqSfF2MvI
	 oggp1Lwqtad2aIfU4E2SvD9nfUmIbbNYkqvnVdGljnRzK8u6IkHxhmf1Du8Y3OXaI8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896391;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MZ10CjHLkasQl+vinGEsxJnLsC3+Bw0YdHexMNNkQmU=;
	b=P5uEWTj3WiCtqz+xDWgX7pacA2DWV/VUUBnVRvyHIRk08RlcZBidi9bKjv0hOej41dx1
	 JWOvjDXMwnCpkIGiWBByJeGSe0EhIYaDXNiuS0dCQE1gq6pUCg/LDEZTSVIfoc3KON1uQ
	 phAW/MX7oIANdY7Rfg51YSq2v1zg+1mbrTcXr7TAnMsFYVOE+AfObreR7SWqUo+fUh9Li
	 ASHQ3t2adk2BcugY/D9XhBVyZ7JzN6oY6qgx/blwTEZ1IqKC3P74XUawh+no7WcfLtkR7
	 YJV8BiMalTur9q8ajP9v29AqP4rknCIXTRggVtwWOO6TO982aZw8WKPbbBZErzSitKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DkhnlwMV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFE606A331;
	Tue, 17 Nov 2026 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DkhnlwMV
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7379C201BC8;
	Tue, 17 Nov 2026 07:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794896387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ10CjHLkasQl+vinGEsxJnLsC3+Bw0YdHexMNNkQmU=;
	b=DkhnlwMVAPi/7A2N10pPlyhzpXQ4xmNWS202cgBx9srn3tufGJaQvTEaKhWTKr7JONqosS
	RoJVxfRFgI1YZVbYPFLtP2xvHMA7KXJN1zEjosyOU6R7FtqqnkGPHYcY9EMHCgwuU266fC
	VzFWoxt7tctX8XwGaZDZU+LD4pDF5LZJ3pZchzyNoKGXBkBQ70P8l3uhTrDpafvlNmY4r3
	CQVPbgavIuTCczUs/gmOUBNFPEwWhj9vOwoqSwK1oggPzzKI9ET5vVVS3UAIfniuD6yN+b
	knBfI3mm4VX43bUXuMVEE07pWqExjpeVCf9e4Rh821owfwmAMBj5XwjKTI8Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794896387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ10CjHLkasQl+vinGEsxJnLsC3+Bw0YdHexMNNkQmU=;
	b=S8kPNiGRtFjZJke+9spnpLYGLDSvjsKRYmKsoQ8FfeLjzdrmh6JUGYKUwIDTylALTUPOae
	NEcYRZGBrk2AgbZ+oiPbpBrmXOTgFVuGbq3GS2K7s9TjbBiGwD/R5Yd08IXeB9NvPob67z
	xXfXJA7r7xn480a1FhtHP9tHSSSEhFMtBgPJdAFfFPXsOOj9rZ8dhHMpnCBWNNny0uMiEJ
	9giF+L2weI2GwOwfCLFR+Aji9d9AP0wK9MfZNGN8cQLm04P+bLXxAndWxYG33KVDiD2yRK
	HEy7dYQSpFZdOBt9lpt701lCwaW3NypD+VnVvglSqhau77gJd3ixZ+HSYsJCWA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794896387; a=rsa-sha256;
	cv=none;
	b=C6zkUXbm0tdl2hM48zaf1N15XTIizclz/r4AxXF26J+JAmoa3UckAjaxeGKfjquoa/gVAE
	rT4yjeRXGnMW5xrISf/w6dicpKUnbAD/hGyxlPqTCkLGXlDIO1umU3AF2cqwIuSVAUolMo
	aWfU+6Tf1V6h0IgM3hFwiU9SD2qhCva0ofH4CYf2WUPz+60nsMrlkjCxwQCr5Uc1k+kbkp
	k1B42DuBgYfVuYKJa3oKNpUIEQvu8jluCYKVH8qrTu2Wsp8YF1Ywp1ek4LeaCLkbrh5pq7
	drvkFgDPCZM4Z6ogd+EH9PZQ1bkFp+FE9E5agtj3Rw4fEJ/syyBZGBDPqPKOcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Tue, 17 Nov 2026 07:19:45 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
Message-ID: <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="r6lajstzb33fsmda"
Content-Disposition: inline
In-Reply-To: <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>


--r6lajstzb33fsmda
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
MIME-Version: 1.0

On 19.10.2026 14:37:17, Marc Kleine-Budde wrote:
> > I was trying to reach an implementation that avoided undefined
> > behavior and benefited both user and kernel code. Performance
> > regressions aren't a benefit and fixing compilers can be tricky, so
> > work remains. I'd prefer to avoid undefined behavior at least in user
> > land. I'd also prefer to avoid config values, so using packed structs
> > for __KERNEL__ code is a possibility. It seems a little sad that we've
> > lived with a strict-aliasing-compliant implementation for a year, and
> > we could regress that for the sake of ARMv5. I don't feel strongly
> > enough to argue for kernel land; hopefully, Thomas can say what
> > motivated moving the patch series forward as I'm pretty certain it
> > wouldn't be undefined behavior in the perf tool :-)
>
> Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
> from packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
> only, so the perf header will be unaffected. Or is there an automagic
> copying to "tools/include/vdso/unaligned.h" happening?

There was discussion and I learned a lot about the nitty gritty details
of compilers, optimization and UB. But the problem is still in the
mainline tree. What can we do about it? Is reverting an option?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--r6lajstzb33fsmda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCavvx/gAKCRDMOmT6rpmt
0q4CAP9qhk0h8XQGUXdyf7Xpor4hMyscjGtwwrqSiON0/AumXAEA6w9RqCONzVsG
6sAW/xoC1DnTXRQXOFSYRs2maiJAZAk=
=Gy8G
-----END PGP SIGNATURE-----

--r6lajstzb33fsmda--
