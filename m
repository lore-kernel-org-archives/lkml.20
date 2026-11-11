Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387649;
	b=BQ8/1Sj/9h9ilmOEZWrqDi6K3GH6C7qEqeUEH/dOKXuczrgpMDDt69G1HK1lWAq7SFfB
	 0qxwpwPeNI7iQQSxzInTcbjXnNOY4OJgj+34o01cAUbNEkcz7842+QefMUSmqD6pcAl40
	 2y9ldU3QEHCAA3/NPcIDHVxZ/b5pRqoyqYQSUqTKaLU4LX7ChYmBvjelSrjl1by2Y+u+t
	 2NU3uD5EC8jVd1g8dkAYx+Omg0QosUThntcAaP8vGKeqVW4T28PSZw5eNHhEkYiqwazgQ
	 mECaOtNRrOIrfm/qjqbPahV5IHwHmfhROFc39LSKph/appJTAiteoxEuKG58OYV8btw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YwnkBq/sQXzLyTa3e267V+Hfsvd2DxUq3BpvzIujRj0=;
	b=yDXDQx9wlY2GQtH0HoTnRk73ehqUZNt0WRvbAovYJvluE0/vjPl0eaj3OAzGHvLdN5DJ
	 8nyS4UziH3YOZWLrWYduR1dtrzY+J2TtDFPuECqznTTgk8cFkUn5cwSspLOJSQTH87qMa
	 HTOspzZp4tu6CiQSW8qTD3O8/y0514z/L1Cd32Y86SzE8PFqxvpVmsQdrUtl8sFIuxsQN
	 Ps/Y8bohDjQ1m8qwPFYBSKdo6FhopMEVhcCpkpAKYi7e+7blT91ZBE6CpKIpArDZh++Fh
	 FRkSB72Q9H0twiBlvA01NCDFjr441jJ7vVck6D33A98hqJ/3RvWwIgj3JUynoRmaDyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QgFrW+26;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24A606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA24A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QgFrW+26
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1290555f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794387647; x=1794992447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwnkBq/sQXzLyTa3e267V+Hfsvd2DxUq3BpvzIujRj0=;
        b=QgFrW+262nRWRUmjI/Ub6n8ucABrLSwkaUNnf+ZuClBAvKn2wBYCcgBeEdKzPluMQV
         vsuU9U2ug5emvnG9uX+OQnclGNYDvPiagGJPL5AZsO5SoShxqxDWSli8oMIMR7r1gN5q
         3eB3r4xgB/EM2LLgfvEQGuBU37IHsFmB+RXq9+yjNGH7AfWOOCDcjbtvSAYZnyhNvrRR
         NMUxzTezEJnrwQRagQ4PIunUmbKIgu+e+Gx0zgRblM1Qj9wR6T/WBKabxDiaTotMRBo5
         ase7uO7yDcMDxSx3Q2372/motdGCmwzawQx6ECdpazy7010DAhszswa+oRARarD5QcDy
         rxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387647; x=1794992447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwnkBq/sQXzLyTa3e267V+Hfsvd2DxUq3BpvzIujRj0=;
        b=E6+EU2RhgJ+bb2lMTwp2TUsvjQXb0AibXPoCPK1IkbubRexoS+oHh6mbsExNsnbJv8
         A28fw2wIJpkWv9H8nb3mHxQIUOefiiqOgE4ODQdhCNs93OPDlQEleLOPV5dAaoqsb34W
         N5kjTPMme/b8J0Csfo3djgq2JN1FdF4futm4GL4KbfYbAD/CQG1asiLIKHscTcIk/Dwi
         +A0Nl64fRPkTnJ4LjC8MIBhAYO7/LWBVZmkIIUEeRZi4Q1U8XA9z8wSwT75z3gZxcSRP
         s3Se0GS3Nm7Vq4+jb0BGXkklV/iQ1uD1nrISZRttyta+3SqeWI0N/SOMkg3svyPUuD9H
         BLKg==
X-Forwarded-Encrypted: i=1; AL+hErEHy0ZPjTFWijfYbiSrH8XzcQOj8rigL6T8z7DJEqTt6wzo6AuCu2Ci06KhU9Xc/Ib51x8/6ZXcUaw9UHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z85pjP1O3bySyzJ7hwQEXq0/Kbt0GmZ2nCxVG8XalBT1WUF0Rky
	6LO0eGuGebdzLpluoVETcO/I60Y+wWeblOTmpcpDYax0MdOgkRNtHU8DqDQP1os0BkY=
X-Gm-Gg: AYBFou2PnetDAvVpBWrxLrpM16JpT5cNz13cCu8MCgL6tYioPcmsfAyNj33OMSipFul
	RaY/s4+w8Aso40k3Uy3kXO8sFOlYpCzl3b80ECuDSWYyBc7lmIF6GJq3ccMzvwItqnAuWNHrO+1
	h3ufiz9Po5aItKgQHScXmV4uoAMxijL2CswU1TESv++8uLGstR9ex92fJCCDuaMvmLD3Fk7ahAr
	mcJeHP0uHP7qFhxWl88Rr5wOAp0j9MgR2oREyYoZHh6m8CoKkB4uzxXxMMrPcsn0qFcnGTY6jLn
	mUNSUILZrXbYQ4ayVYdLHdO/lQciwXpEmVzrwAdmHFGEtnyr2220WcK1OOeRQ8YdXdaudBaE4f6
	CmFG+S6xgiUD+6Ql2/7QOJnf1UlnFmLkCzWBIZ8LIF/jaedZAvodBIbV/zOadY20ZwDJzcsGB3N
	4AvRgkfKL0AwQ/2GI1KC7tgQ0adRVOSAM2vk/hjlpY+hxhSMVZ96KqObPsjEKtK7i7edWWUFzJd
	0s9peF0bGwTMhtVHky7qAw8c9pmQCZlxtltFRTdTIOyOhTA1R/M335A+gloRwDWIg3ORbE0XZQS
	vys01NPXwk3hl5d+9C4bg0pP2ahl5ojopFnkSF9HErq8EfFA7hqwILihUqDLhxE6JK6uREgr9Yq
	SMaOSdR8hy3pDdw==
X-Received: by 2002:a05:6000:1a8d:b0:490:369b:f50e with SMTP id ffacd0b85a97d-499c5e3c18emr2760492f8f.19.1794387646810;
        Wed, 11 Nov 2026 01:00:46 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm10111142f8f.18.2026.11.11.01.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:00:46 -0800 (PST)
Date: Wed, 11 Nov 2026 10:00:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>, 
	Zack Rusin <zack.rusin@broadcom.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: Don't use UTS_RELEASE directly
Message-ID: <avQufBv3rTXt6Qvj@monoceros>
References: <20260504073422.1130008-2-u.kleine-koenig@baylibre.com>
 <de7acf2e-e07c-4a94-92c7-ae0c9311c8a5@broadcom.com>
 <al0N1wqMD-_z8Uf1@monoceros>
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
	protocol="application/pgp-signature"; boundary="jhq54vmbt223qxdp"
Content-Disposition: inline
In-Reply-To: <al0N1wqMD-_z8Uf1@monoceros>


--jhq54vmbt223qxdp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/vmwgfx: Don't use UTS_RELEASE directly
MIME-Version: 1.0

Hello Maaz,

On Sun, Jul 19, 2026 at 07:49:26PM +0200, Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub) wrote:
> On Wed, Jun 10, 2026 at 03:04:07PM -0700, Maaz Mombasawala wrote:
> > Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> >=20
> > Sorry for missing this patch earlier. Unfortunately our maintainer Zack
> > is out for two weeks so we'll merge this patch at that time.
>=20
> You're saying I can expect this patch to land in next around end of
> June?

It seems I could not. This patch is still unapplied =F0=9F=A5=B2

Best regards
Uwe

--jhq54vmbt223qxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0LrkACgkQj4D7WH0S
/k7xywgAoFiBZrmixZt1cJntBcFzf6F7Y/OG9W2YC9N7bnNGlDP/9xzRto6i/vTd
D16ck2HLeqNQSwjlGmhoeFysUbRopzDBcbl5PLPJZRvU2rVgc7jeR9MlV455Q211
BOLga84ViCisAH9T0WQbUGK5tNxJKZaHRqHfowHKGKWaZYPKKOH2QJx9mtq/rgAl
glVTyV1nrCNE+JeUUgNcxGQqfJykfPCbZAGbvtfSzJSwt1l8FWOIhLUclh66QeGU
s9BUgiJ/4eVEjMDdpMQ3hWB1JM9hDjASjHSGwF2GhdC0EfvWfJ2QJM/C/be1Cgcu
tUt7R+jebfIPYdqIslBq3AE0o3lSRw==
=0ZT8
-----END PGP SIGNATURE-----

--jhq54vmbt223qxdp--
