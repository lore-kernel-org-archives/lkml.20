Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799590;
	b=XxL1AtbhTW+Lnlbs4BrP6ibR1K6p8uNSW3VGOxEZkCrgZweND237CX9OhIsNho8CdvFv
	 ss/U/HQGhx86Je6G7oFzD8ZZU8uKDH90W1QQtLoFvcaCZRuYqyABdnr3mz+jeXovzmPua
	 2z9xydfvogxDJpNanEoUzHMfB3ifyZpO9kzcgJrgb8T0mhwGPCsFZe9CxdkULfICvF9RA
	 9Ca809NRf6SiKymPIb6wTy3gEOarbV+TVP7negTZvPRqSiRWCtYFTfPKMV9oY1S5HBSD9
	 J4ONciDh2BJLD8V36wXoMrCSXrmC7uk8yPP21+4Ry9ZXBSdSMZ85IEvq0LVyhYbubBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799590;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=BQjfl9RbsQNCX6Q2tebtsFt2Sfsx0gARntz1N98irG4=;
	b=r4sBItYJviMuR+LEf/YRrPRR8LfguxAhYsGBrTfDjSNAjxDWTtIGNlRxj4ixeVO7ksE5
	 3Adx6WgU4eO88zy3kiDH22+Xy5j7Bv51ucLSFOdoM+lqhr9oj7hqW/b66m2gsIbuscN0L
	 L/tzh0G9N3WOcw/XQvgxS6sWUp1BCa1G9RLO2f0UyrD6fNmajCiHtnyP7piHGlI5g1+Tj
	 Xn/cwXk9yjlnZznatW4jBx9iQ0YBxo5MWKruE2LHxHDjHplawH0yXtNsjCY4+Qp6gSI9v
	 wBynJf0tzdzbfoUIxMYyAIzQQjWSqHy4DZjWg6zkqpUfx+XloZA6iwNeGfv3ranSB9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gMpi7Hxv;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19412606A335;
	Wed,  4 Nov 2026 13:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19412606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gMpi7Hxv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793799588;
	bh=V67Q77CGcmmhluyCdITvTP/daZaV9aa0SNLMpSDUB14=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gMpi7HxvGNnS3RfmQYk99UkzPCIhWUG0SC25A5cE8Jw8XYyolGTrKWGQ1utvNLjbz
	 vh0Nq6jP2mqcmh8OfvtAssNHHSD49aWhHlBqaSaknqLtElA8Hovfs/PFQSIFcSLVqg
	 8VB6bxtyIqUhrmQefwbnJiyMKBxhfCnlCJ+t45RUB7gGo/5sDQfkT78jKtSns7QcTO
	 MBEOzmrjFtbaNvzk4/r0aPQZqaB3fLoWUmsk7GF3ATv4Vwg7Jo5Sw1aP2kQuCHYDvV
	 0F1Xg40TJIR+wYkhhuB6zV6s89v65DKtfMwgWn2S2+NKX+wX5F5a2ID0TbAblBpgDz
	 4IOwXStK9xbkg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F6A717E0400;
	Wed, 04 Nov 2026 14:39:47 +0100 (CET)
Message-ID: <35f68881d65e0bb60cb4c6f25c027164f09b926f.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2-mem2mem: cancel job work before freeing
 m2m_dev
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yaohan Li <shunsheng1218@gmail.com>, mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, Frank.Li@nxp.com, ming.qian@oss.nxp.com, 
	dmantipov@yandex.ru, 121811682@qq.com, ezequiel@vanguardiasur.com.ar, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 08:39:46 -0500
In-Reply-To: <179378585020.73536.6089775766038265997@gmail.com>
References: <179378585020.73536.6089775766038265997@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-apRvdK517pKNxu0RZtNR"
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


--=-apRvdK517pKNxu0RZtNR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 novembre 2026 =C3=A0 17:50 +0800, Yaohan Li a =C3=A9crit=C2=
=A0:
> v4l2_m2m_release() frees the mem2mem device without draining its
> embedded job_work. A job completion can queue the work while device
> removal runs, leaving the worker to access a freed m2m_dev.
>=20
> Cancel and wait for job_work before freeing the device. This ensures
> that a previously queued or running job worker has completed before
> the memory backing it is released.
>=20
> The use-after-free was reproduced with an in-tree V4L2 test driver
> under KASAN during stream teardown and device unbind; the same
> injected scheduling sequence completed without the report after the
> change.
>=20
> Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in =
v4l2_m2m_job_finish")
> Assisted-by: ZCode:GLM-4
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>


Please, check the mailing list before sending patches, there is a v2 of thi=
s
change already. Its as simple as adding this step to your prompt really.

Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index a65cbb124cfe0..c4756e7bb1fb2 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -1207,6 +1207,12 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
> =20
>  void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
>  {
> +	/*
> +	 * job_work is embedded in m2m_dev and is re-queued unconditionally
> +	 * whenever a job finishes; wait for it before freeing the device.
> +	 */
> +	cancel_work_sync(&m2m_dev->job_work);
> +
>  	kfree(m2m_dev);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_release);

--=-apRvdK517pKNxu0RZtNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaus1ogAKCRDZQZRRKWBy
9GOkAQDd5F64T/LasnglxdTcjF2oGICHm/sFtkKS1ELEO8OhiQD/ZALowBKRMgFh
GjpfLHRMeIuxUvJ6idz9YLa0Lyn1Qg8=
=hxbH
-----END PGP SIGNATURE-----

--=-apRvdK517pKNxu0RZtNR--
