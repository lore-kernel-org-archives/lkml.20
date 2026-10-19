Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193E4C6508;
	Mon, 19 Oct 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413450; cv=pass; b=Ln3waw9qFW6iU0usM97K42Xu0zCuhiq5P3S/NC2mHuerTFb4QUiWvmOUT9KMplDkmubHqJNm8AvjI+lYV5KJgu2By3o2JrzRR2XANBS0KWn22fqxowPelxY0odQ4UT7RA6F5VuVr/2V8hvrIILU/1uXrXBq3ONpp1FxPwXnZMjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413450; c=relaxed/simple;
	bh=ayYcHvqKED0LKAZ8j3tYAP+d+vBYjoMOyXoxPbmp4YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLTI7/5gCV6iTEwCGLjbcWa6bQLy595Y92bgYnxmhjcMf3HRJ2Ya75VK2XOzCaWmKjiN4+LxpJQ18B5Cl6xt8GLvGiyh9HefnSmKlmlQdjF+0FL0ewwCFhqeE8v0lzm4raUxh3tDduFwb9vug8rWmwBPl7kn2k3gLXINaYafkHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=LdsLTAiA; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="LdsLTAiA"
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 430642018E7;
	Mon, 19 Oct 2026 14:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792413438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2esmKgU4ms/8VS+nji7FSWqQ2PhOSbytIXCmCEk7gkk=;
	b=LdsLTAiAEbgYFc/P6eKqnsRdLgZ+4bR3J/Mt/Kp6L7GzKfAHx++3IT+q9M6l7li11nPSFn
	m0HTdYGWt6f8rBsgpeFCBpgr7fX8FWcMTAZiplIMXnSknGqoW0F2FI4kcAqKPekKpKSN+x
	ih1EZb0uo9KbESN3cfoe7hVpPLKnK4Hs3gUvWeORPEDZ+81/z1CDb65NXLIcgg/FhGLyL0
	G3JygMfVVQlFaFrMrUtDZfvm/4i/qR1d+Ec8lcelrvMiGIBLpMQXlHmZmNBd2m5/r8gF4l
	1NJluhuTzNtwlg/abp+5ilSL3AU5lZzEQDjmenf4MT0ECAg1ScmaW84Pc46vcg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792413438; a=rsa-sha256;
	cv=none;
	b=PWX+GGZqpc5bIHkQq6qB+ENCklMO1DTKkwAT9hUQq6tuHOvo5+VLFTJ8ptLvLscTVyY/Me
	JczHdQp08J/ZGxt7PaS+1OmHl34FDvN/n5LVPX2IKtM3G8SMASB0PMCPVqeVGdR64donvE
	XD4SBNnEipRvPviPkQJOY9/FtYNIJM2eY4KWlziUcSu+tFT5qd+DLYwGCBTVhIjXDwIPVq
	8Up2YHxF8/Whv93/zy/HH8zEG9Ri30VtfCA1VydAWLf8U6Cojb2j988C+iRapwdkAkeVj+
	UV7u8eHgfNeuKgG0hs7Wpr6+faB+rltaBg/FXgBnapn+zvWsSidIxCfqa0WU5w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792413438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2esmKgU4ms/8VS+nji7FSWqQ2PhOSbytIXCmCEk7gkk=;
	b=T3F/+ub8P0eMMPn2lr/wcL5FcQoD8GsDZf4Ru6Anc8i4J1Sf70oSecXNtFpb1gVbw+2M/l
	wvmBCWjgKTlVLGKfG3A4msIKaZvmeTOzCvEU+qit2tpZ3C/ZybeAOM7kHYyJPvWLw+OAmd
	bPDD00GYXJpdIeSXNrsVHtNqoSxooYH/kqcXHDcunP1eLRJKGqWM9IMQQrryeR6nn1S/k/
	qP+7hgU6oG7kYuPz1XYS5UuByk1m1NTWnP39vZCAbHdM6V3zqOMf5EbkweJnQkXRKZfwNU
	ZHYrP1bqnI2+YaGG99zRG0+BJ4c8NOoUUHbAqq0tw0/AX6PHhDrbMQeg/0nb2g==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xImcA-000E1S-0S;
	Mon, 19 Oct 2026 14:37:18 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CA5F65C9108;
	Mon, 19 Oct 2026 12:37:17 +0000 (UTC)
Date: Mon, 19 Oct 2026 14:37:17 +0200
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
Message-ID: <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ax2vllpvyv77274k"
Content-Disposition: inline
In-Reply-To: <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>


--ax2vllpvyv77274k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
MIME-Version: 1.0

On 10.10.2026 08:04:42, Ian Rogers wrote:
[...]
> So completely fwiw, I speak to the compiler folks within Google and
> there has always been unanimous support for code using memcpy over
> type punning. I'm not sure where the inlining decisions would be
> impacted, as to my understanding those are made later in the compiler
> pipeline and things like __unqual_scalar_typeof are almost at the
> stage of the preprocessor. If -Os is not inlining small fixed size
> memcpys, this sounds like another compiler bug. It would also be
> completely valid for the compiler to lower packed struct accesses to
> memcpys.
>
> I was trying to reach an implementation that avoided undefined
> behavior and benefited both user and kernel code. Performance
> regressions aren't a benefit and fixing compilers can be tricky, so
> work remains. I'd prefer to avoid undefined behavior at least in user
> land. I'd also prefer to avoid config values, so using packed structs
> for __KERNEL__ code is a possibility. It seems a little sad that we've
> lived with a strict-aliasing-compliant implementation for a year, and
> we could regress that for the sake of ARMv5. I don't feel strongly
> enough to argue for kernel land; hopefully, Thomas can say what
> motivated moving the patch series forward as I'm pretty certain it
> wouldn't be undefined behavior in the perf tool :-)

Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
=66rom packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
only, so the perf header will be unaffected. Or is there an automagic
copying to "tools/include/vdso/unaligned.h" happening?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ax2vllpvyv77274k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatYO+wAKCRDMOmT6rpmt
0nYxAQDluirk3FKadzPOnKsL7WzKyv2gCyA3oy2Ri4XvF9oXUAD+NgGZ9LrR2b+4
JZknQPJFXidUdMAshHwblnieSsIUngk=
=MukZ
-----END PGP SIGNATURE-----

--ax2vllpvyv77274k--
