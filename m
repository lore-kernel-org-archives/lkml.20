Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217239;
	b=s9TUEvHw+Y9UgFt8ZdL6MJdxqbN8EyfP1/8U6S3vf7A1vjIJF3OviZSU0+S96LNNFdfn
	 mmdu10SzWyOrY/h0cakrX5h0A+5Qq/MU502mpmGiItpCW0wsFE6NFDkJxqcu/x3dRXl53
	 qHokUjDqiFOo82RyomXOpNH5A6PYyeKzyo7zCxp46EhdI23Vr7qDG01zw+ORy7KTBnWyI
	 06EdaWX8t1T1h0SYSfR7YSWBoRSLZHqxCGlZqw/KFP7Vdr7M97O1uPOJbV+CKOwbrhRj5
	 bS98kVzhzKtb3Kn29QYd/aw4IpLhGb93D4AvAcTNYybUaAqfz4ckaOuUy10KCYS4ppQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
	b=sGl8UZ73s18vjgfHTzYRNaBPdzTBo0dNlYaT8t77Far0xU5DxE2APCvp/aeVAG/IoNcO
	 uqgc2CPV9Tc5LiwEB/cqib2DRygkGaDYSJfWeu440FmsGqzV4WIvzXJref5pjMQtDzeHv
	 6kH6y+aovBvTehzft4bkdeXqgKa3f2qZbi898JzEB2YOQiHSckIx3MCdBrjaxr7vML3AG
	 WagK9d8AMjlf/fcoiZ8pNsVjWVbOEErp0LtvZYeQHxP2GiWXloBexaYAUOAaJtI3V5SZP
	 WnqS05yyMCSU5TKc8Zy20PLXC3uf0cU2md5yY8Ri3k7TGBAfvgpDhSD7p01POd0d+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gA8NHJ+U;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB8606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gA8NHJ+U
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-5332a0f6dbbso17566731cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793217238; x=1793822038; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=gA8NHJ+UM409Pb2djn7TARhTXL8Cvgm60g/OVah6ioaVdFYAw9AWWw5+4lTvqA+/41
         D3tAZxairdTiOAek/OnzQdDPfkMR9FgKyVvUYHpGhJp6RPvLJtc1YlXnynSwQomIktOa
         2/KoZ9qgHe0ePSfxYWHcNRO73O0clP/E+3XMwoNncVn4ITtF+9xs85IqlW9JnMaFh2pb
         6th30oqcaa3ixdINLDMT7JGLkuVhrjZBNBzF3bBY5a8W/rfDQnLmmmdQoEgIfxwMCqC1
         3dOJw4ViPrqKVIBnJ6Il6g8D5HaIGG6V0NQ24WTI/Gwd7wxDdW5lMwPH9N+F2xDzO7Qa
         2dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217238; x=1793822038;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=phKb8/4tQ0bmCpPz1J3v9/cBf7c7pcyEjY5D+9gIYjQOIu0YipbWDUcVPny864N+zj
         yeVs0sqjjkcC4LdF4nvouq/HaKl+n5FYzveL2r+islCnY7sSszioZD9hJ6RXJrUYpUvP
         DKzrafP4qXj1/8ddTrxBQ1kvVdVj6tjN+DhoMicy6hR6z6Th9XdK/E+cySm3R8k9ZpB8
         FtqlxmI9UK95paYCrhdrgvV0vbABLwFX2ZN2jLFptjmY7plaAoR/8yMuKhAlyd4yDYDz
         KpYAUHXY0tzvruXjQx1FPWkJAfVoF3X+pc01bjMpYcxnBKWQRvRMXVbpq5UsTgegzjyg
         pspg==
X-Forwarded-Encrypted: i=1; AKwUvBz2X0HaSnmMiE5YtlK4WAASYo08e5QscKU2SyGJeUpFL8KI1ItIRt1g0Y+zSn3m360aaI7HwNgWm+Tq5vM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0B9KxneCOOiVhhqnMz2M/nDlQDc0kElBTSepHicvZvg9nCpCw
	xsKcmw+D/Ugnbaeurqc8IpOV+Aj21lDOTH/991J4+C3xFzfhYhOjwy5wXTjo4g09y5c=
X-Gm-Gg: AYBFou3wA76iMOQ4nlJSzJj1CFs08Mo2y+64J3uX5J/SI1B/nQPvPr9Cfeq61wI0W+2
	berK+LuMChcWnpjobV8XeqUt9RaTRFovpL7jN2EV/YKrQ5t8FK6lDiqak2Guo/pi6+bn6s06Z71
	0YwH8eAD6KvhU01HTxaBhkSFxUBSlyFGXI5IXFi61CgQsBOkzgEnTI1mR0X4Sny0L3JnHrDsGvt
	vTmXWCswNebDwc4QRXvb4jaHXSjzlPF0MySEwhieSyDViN0e44zR5UTsL0SH0sYCI/O7RqJlfHH
	XCmg2E6sz0Bj/SHuM8SAcNUGlvPlST7kHceryerHyxMLHDsOQa010JHEyUTZkcSPfiAQ/RzjiUR
	fUZYbneT6i0artPd8mdZtong9Tyk09c8Cayw6YQ5bpLrkYrUEMRT0JbuaDk9PSb9llNhxueSc6d
	cgkCpn5HWL4KEnIp4SEDgK7f0w1hP7XhO61zLc/AkHmI2V9uEdAv1Q8mPf69lTPavq1F+1ynphO
	7qProR8owcUk0GOj+M3mT7cZhivEn3aAujSqp6Bvd92vW8E6smKyGIC06jwR/plES2J9AHg+8sN
	m62hz/9QSO93NDCHcwyl6hinPPMNtXpDBIPKKOMU38IdVka/HYryFAmc/afzWL1XavJUVahKc6u
	G
X-Received: by 2002:ac8:5a50:0:b0:536:6abc:54b1 with SMTP id d75a77b69052e-53fcb509e99mr60729391cf.28.1793217237708;
        Wed, 28 Oct 2026 12:53:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf49c9sm113417671cf.3.2026.10.28.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:53:56 -0700 (PDT)
Message-ID: <bfc4481a817e761ed9ccc265484dfbdfc1e59490.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Torsten Duwe <duwe@lst.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 28 Oct 2026 15:53:53 -0400
In-Reply-To: <20261022190026.6cb0a534@rocky.lan>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
		<20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <20261022190026.6cb0a534@rocky.lan>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vP+iZzvr5GpVmxFar41J"
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


--=-vP+iZzvr5GpVmxFar41J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Torsten,

Le jeudi 22 octobre 2026 =C3=A0 19:00 +0200, Torsten Duwe a =C3=A9crit=C2=
=A0:
> Hi Sascha,
>=20
> first: thank you for driving this :)
>=20
> On Thu, 22 Oct 2026 13:06:40 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
>=20
> > Add a driver for the JPEG hardware decoder Rockchip integrates into a
> > number of its SoCs.=20
>=20
> [...]
>=20
> > +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> > +				    struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> > +	f->flags |=3D V4L2_FMT_FLAG_DYN_RESOLUTION;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	/* The decoded format follows the bitstream, nothing to enumerate. */
> > +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> > +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> > +		return -ENOTTY;
> > +
> > +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> > +		return -EINVAL;
> > +
> > +	if (fsize->index)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> > +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> > +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> > +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
> > +
> > +	return 0;
> > +}
>=20
> Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
> so maybe try to be more permissive?
>=20
> [...]
>=20
> > +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops =3D {
> > +	.vidioc_querycap =3D rkjpegd_querycap,
> > +	.vidioc_enum_framesizes =3D rkjpegd_enum_framesizes,
> > +
> > +	.vidioc_enum_fmt_vid_cap =3D rkjpegd_enum_fmt_vid_cap,
> > +	.vidioc_g_fmt_vid_cap_mplane =3D rkjpegd_g_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap_mplane =3D rkjpegd_try_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap_mplane =3D rkjpegd_s_fmt_vid_cap,
> > +
> > +	.vidioc_enum_fmt_vid_out =3D rkjpegd_enum_fmt_vid_out,
> > +	.vidioc_g_fmt_vid_out_mplane =3D rkjpegd_g_fmt_vid_out,
> > +	.vidioc_try_fmt_vid_out_mplane =3D rkjpegd_try_fmt_vid_out,
> > +	.vidioc_s_fmt_vid_out_mplane =3D rkjpegd_s_fmt_vid_out,
> >=20
>=20
> You are populating only the *_out_mplane members and not the single
> plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

Drivers only implement one queue type, MPLANE is the recommended one. There=
 is
pixel formats for single allocation and multi-allocation that userspace can=
 pick
from. So a driver can do MPLANE and support both NV12 and NV12M formats as =
an
example.

>=20
> And for color, the colorspace on the decoded side should be
> V4L2_COLORSPACE_JPEG, not sRGB, I think.

Should actually match what the JPEG header says, RGB jpeg exist.

>=20
> Would you mind to give a hint about your test setup?

I believe Sascha has been testing with GStreamer, the element is called
v4l2jpegdec.

Nicolas

>=20
> Thanks,
> 	Torsten
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-vP+iZzvr5GpVmxFar41J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJS0QAKCRDZQZRRKWBy
9FbtAQDQq1LHLIEYGFdpJt3hiBBdUv17DM2qsOM4AzolcnZ4QQD/ber/FxSYvItX
/Z3gWh4nz808VmJqoajvRuATRpq4NQo=
=niJB
-----END PGP SIGNATURE-----

--=-vP+iZzvr5GpVmxFar41J--
