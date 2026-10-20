Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523804;
	b=OdcDPTSFj3uC4lzKiwZL9PI+v0TmlMdyEdh99bAEg7za3T/e3f1CorLag5mALMIorXoK
	 osuPgS/XtU5+UndDV7ZTmkjYjrbgBX3YwluDsBvl0mHQVmffGjrjBKAOHd+08W6A10+Ey
	 hE8e9a6DB5QFE1Gtyo5nU7irVTTI2Wdy+iBz6Ee6/23pcCjLVaOB+grJ09yve5O22XGjq
	 y93/JR/tmOgUQkDTpVUT5JkQ31OXyabZWP7xOkq9Pjk0DOCTznG0TOxOo0EMtcabA6ir9
	 ZDUoIbjSyugBcyxDpLYQiQk2KTlOShYDrIPOCgwlz3VAS4x9dfAAUJ9Ti/1Vsh6sFIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523804;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=xjeYmFOMQk/3GAoCfGCaNLcjZofvqHQmiwq5oS0Geio=;
	b=wLy5/TVELfi/jdihPlp+wsVuGhnQPrt5+dkymg+cS0kyeGwHn54kTdYqDW/QIADwg4aR
	 QiKlkka1bG1ijSco9Ggp7S4YDC0V0Alggcz0TsHsQbMKOzYGDW8kpXnftNM71l9Aj8vw/
	 FuhT3GaanJ66wjns+CFYd11sLRETFcpcBvDEj2YB0M/f6nxCDKF2QznN51KTQR6gM7Rf1
	 4wkU78ZghuEn5AO9H29HzIRZuUU3wODbKZHqqVm8vNZAyMOY0CaykRH+tsLrCKK4ZHgau
	 e0IecBRvbC+EANOBTrjfSZIgH8ISY1dhwFC1fZVifmaV39H7XQqRImiKlilXGyROqAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cyrfkV6h;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80F606A31C;
	Tue, 20 Oct 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A80F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cyrfkV6h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792523801;
	bh=xjeYmFOMQk/3GAoCfGCaNLcjZofvqHQmiwq5oS0Geio=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cyrfkV6ha0jjFMC5+POuSqYp6neXNS/pXveFeVRbShCDCb38yDNkVerSyJNGuoQGi
	 Bt2r6ru44Wi64MWO1m3HbRFDMGtJ8Lcf670Ig1xalzZDu1qkZUtg4QD8ElLXIOS8+U
	 1m0Zcjzcx7i5T1oyUxVX1aJxIOM4u05OjEbRJeH4+YKvlsP19RWTWkHvX2HP7y/xMa
	 n1InUcFHW3rd1v2D6w9BwppplJf81RWQIdoR5jJWBbamRDrqEecwkYFC2eR95AIPY8
	 a7XgNGg4AvOaC34ruKFD6G8ZvInLLzUtPvXO6VYk5VprCqWDqzK/CTllf6FORVIU8a
	 oDPuD4W5zwOLg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2AFA17E01D6;
	Tue, 20 Oct 2026 21:16:40 +0200 (CEST)
Message-ID: <ecdc24931abc4f84bc0bd8e2025f77406ab476b2.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR
 deference
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alper Ak <alperyasinak1@gmail.com>, Markus Elfring
 <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil	 <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Tue, 20 Oct 2026 15:16:39 -0400
In-Reply-To: <92af2072500ec68990cc643256929044bc54e184.camel@collabora.com>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
		 <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
		 <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
	 <92af2072500ec68990cc643256929044bc54e184.camel@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BR4+iphLtmvgPqa1gXEC"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-BR4+iphLtmvgPqa1gXEC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 06 mars 2026 =C3=A0 08:50 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le vendredi 06 mars 2026 =C3=A0 09:32 +0300, Alper Ak a =C3=A9crit=C2=A0:
> > Hello everyone, look like this patch hasn't been applied. Did I miss
> > something I needed to do to get it applied? If there is anything I
> > need to do, please let me know.
>=20
> You received an Ack from the maintainer, and got a tested buy. But the pa=
tch has
> been submitted while the merge window was closed, which is fine, but mean=
s there
> is a small delay. It should be processed within the next two weeks. Your =
subject
> suggest a theoretical bug, so it has not be been prioritized over other p=
atches
> in the queue.

I discovered now that I missed this one in latest fixes batchs, be reassure=
d
that its not assigned to me in patchwork and will be applied soon.

Nicolas

>=20
> regards,
> Nicolas
>=20
> >=20
> > Markus Elfring <Markus.Elfring@web.de>, 13 =C5=9Eub 2026 Cum, 14:38
> > tarihinde =C5=9Funu yazd=C4=B1:
> > >=20
> > > =E2=80=A6
> > > > or ERR_PTR() on failure. The return value was not checked and in th=
e
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 error pointer
> > >=20
> > > =E2=80=A6
> > > > Add proper IS_ERR() check after kthread_run(), log the error, set
> > > > dev->irq_thread to NULL and fail the probe to prevent the driver
> > > > from operating in a broken state.
> > > =E2=80=A6
> > >=20
> > > See also once more:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34
> > >=20
> > >=20
> > > Would a summary phrase like =E2=80=9CPrevent error pointer dereferenc=
e in
> > > wave5_vpu_probe()=E2=80=9D
> > > be more appropriate?
> > >=20
> > > Regards,
> > > Markus

--=-BR4+iphLtmvgPqa1gXEC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCate+FwAKCRDZQZRRKWBy
9BeSAQDW0t6Cj3OGdRCTBjrIt9t//SdJmbTrc8WCWvIibwMM1QEA2+bG+30DZylX
4Kz45a4ynzrDaaR48DTk15Fk7Ql90Ag=
=F6RW
-----END PGP SIGNATURE-----

--=-BR4+iphLtmvgPqa1gXEC--
