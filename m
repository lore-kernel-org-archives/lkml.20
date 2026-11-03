Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735900;
	b=Dyu9tT9eh5qxVkBIT/GO09BQujT0wNOF/d/hrRWKOqc20E/OO6IBYy01OAAGKPmEdI6v
	 FOrhn/7aGTh5nUWM2y4XjcplY2LOHfcssnAEQp5ELp72mv32b2h5z+hm2d1VB8b1JLKQv
	 kYyfKSCSwMsDtoMyxLboSEPNEdl/E2CbJKNzgW7I7Ix3+4UJapTbOoq90GJ+CprM86D/s
	 g0D95lVzz3ombvkeRs5pdIQb/FF9AKC4l8kMAdrTNSmekPH6kdWaWQuBHxf7Kz6AGHVCU
	 DT2eTUhanC+LuL9CokeKcFD+8Pq1U2hhlnJoJHCkxMB3R8cY7Z27G2F6FDgJb3Ycb1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=MiR7v8ogyBE3UAdwdGXynAVIr+KTNViJqowNL7iiLKg=;
	b=PDjOEq5w2adargUIppEv7bIEoBuWDWgMe4QC8P5XC6oITUFYaFZWEW9W6lDgiCDj2Yyr
	 yAg8O7TYtMppr+CYC5MphuCEyeVV3dDoayJ2C5DB5HscbLhfxpf9IGzRP/DNjZNKDaN8q
	 SIlGl4pKV/NgJSrGDnV5RMFqdHUffDg1JMziLUq57ktZJg254V4yvDJ/F44xulxYvIago
	 3auUIJ6fUB77l/qly7BSQ+OCxos2o3IHqgi2fsTLHwXfG0HuOPVc1BqQie7CQvvRQxPh7
	 NcC9tGnsIJhbk2F1Tll+wWTf5R1q4gttoLZlhoemWkB8pLk6ISVBVfP8uflnSZDzLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BB606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39BB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f079a63b8so34085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793735895; x=1794340695; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MiR7v8ogyBE3UAdwdGXynAVIr+KTNViJqowNL7iiLKg=;
        b=KnbFhjVxnKHdStdOB0RR8+yGHHTGAo0xP4Ie6yFcgdPwTJ9TNh9LB48mFnv8Oj5ziV
         wAFtekhaCs35AWjoXHt4KiMN+GRkbl/FzbuxJhbW1jiz14OtlQ2FFJxkn2yIEXkeKmWD
         mfGN2dKO3tV375Eh+YW1W5THtchWxdumgyRak1t3tXW2sM5XMOI7oGfWC5b6CeLYfgtr
         NIt/U4TQOtHalxLg7RcqdoaQVceF3qa92p/1Kxg1RexhoXtncXv2m35A7tx4kibwv5Bz
         OyMdGs1/0jz3CghYeN/iWzeWD9C4rWu6EEt25rQQzY5LeA6SjFPNWnJIoSruUnvY4C0j
         uzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735895; x=1794340695;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiR7v8ogyBE3UAdwdGXynAVIr+KTNViJqowNL7iiLKg=;
        b=yh3HjOIiWDd9+WzM2WzXXylgiYK686srwY1VhJnt0XOeP/cI4vyZWYRBoamPryAv8G
         nmLxPGTGFOVAzo1y5vdTbT6o7ROtYOSHWTj4JQOiPjekvfZ43aMuzcgQs8Q+oA8ITftv
         IUhj7Hb+H1Z5EKe5fwo7U2dkE5e4xAf4iieFdH6hxfk/rbXoBW7hPw5FQVPn71ZFPpfH
         0HDR9XeYMkzDnhsEPBJYuoQSklpjlXB879t7/gQvBnelN5FR8AUlPnn+UpVrd5dN974o
         Xlj6/JvFbK78bGpEhdVGcN04O83JBHMmYsaF0C09zdexBK/l6TR6M+EHhO7pJWbwUm0x
         sOSw==
X-Forwarded-Encrypted: i=1; AKwUvBxu//sRAnryqBiyBuMuWPxBhjJIpOjLgDP2qXPGhaZ1GHDdWTl+0YPojO8voSGPFNxzMyLU05oo7k1Kt0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z83CNAbJ15MmyAjX0u4Pw2kh0zmPyHDFwhm4XtKgI3zq7e2Zce6
	c1Es9d0WDtfj5+AGlmzLyELDvt2BvkUVScZx6s32bjr/Vd76g2wmgkpwZJp+u2lhGOU=
X-Gm-Gg: AYBFou23RoOmomo35R1zIjn4Sf7losuGqKFQdccgi4uUFAv0RyC0toEV7idD72xR7Vo
	MbpHq/QXK/AmT8caGmZggkg/CwN2tIE1dP3NSMBX1xGe3ozg5sZ8dGOYCCmxsIF4vwpqt5RaJWo
	aPzbVJd5X//jylP2ijQLPs6d3QRYSm6o4kbHso4z/ULzFV2l2QvG3kDSUT9NRHPGzAldcEzibzQ
	wS40pR8T6s2N3bKY/VcbVWUfE5KDaAUBz6dixJcxYvne5PL++npAvOO6BveGiRVNLNDy8MsXSQ0
	bFOnYvPZeIWdxY/2Ocz0vOlWvjwkk3FB4q4z4rAiWZqsPacD4K7pYQF2RyAMsJ2j4OW+6jgYvV6
	/n6tlGO8qg4nGckwo5xFak3d2p6p0Z2U8YRSRQksdiY/0W/KQw+RrECaG7ATAXLGdDFIGDbahvs
	ZGE35p635K8UVYao7EGbfpbWBkszyZFJHVt5Jhr5cb8hX5ctt1/MvCnSlnOz94bg/YueFOOBkQE
	WHp1d+66dkoKR3ouTl318K+sItxT6UY+6W041jq7cuIjIkxY4MwVBcbrDjtTyVZL2KUGvtPWRy0
	5wRF6aOLvE473IaoGUQ5I26Sthgi+si37hbXxfI2zilx22EBl6LIhCQ=
X-Received: by 2002:a05:620a:3705:b0:93f:19fe:e6ca with SMTP id af79cd13be357-94421745e9bmr2481703885a.43.1793735894598;
        Tue, 03 Nov 2026 11:58:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48648e3sm14608285a.35.2026.11.03.11.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:58:13 -0800 (PST)
Message-ID: <30feb9f9c859c39a8e5e5fc5aba7fcb0f20cc820.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tristan Madani <tristmd@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>
Date: Tue, 03 Nov 2026 14:58:12 -0500
In-Reply-To: <20261024205711.4041369-1-tristmd@gmail.com>
References: <20261024205711.4041369-1-tristmd@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-m6t4otkvc0ZAfwx/Sa22"
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


--=-m6t4otkvc0ZAfwx/Sa22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 24 octobre 2026 =C3=A0 20:57 +0000, Tristan Madani a =C3=A9crit=
=C2=A0:
> From: Tristan Madani <tristan@talencesecurity.com>
>=20
> v4l2_m2m_release() frees the m2m_dev struct without cancelling
> m2m_dev->job_work.  If a device operation schedules work via
> v4l2_m2m_try_schedule() and the driver tears down the m2m context
> concurrently, the work fires on freed memory.

How did you tested this ?

>=20
> Add cancel_work_sync() before the kfree in v4l2_m2m_release().
>=20
> Fixes: 7f98639def42 ("V4L/DVB: add memory-to-memory device helper framewo=
rk for videobuf")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index a65cbb124cfe0..311e2e08d066d 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -1207,6 +1207,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
> =20
>  void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
>  {
> +	cancel_work_sync(&m2m_dev->job_work);

Seems quite insufficient if you compare with the actual implementation in
v4l2_m2m_cancel_job(). Is it really possible to call this without having
released (closed) all the context first ?

Nicolas

>  	kfree(m2m_dev);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_release);

--=-m6t4otkvc0ZAfwx/Sa22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauo81AAKCRDZQZRRKWBy
9DboAQD+g0qmmTqL10aTTYNwr7O71NtKH/nesIag4peMvjYksAEA89aQb5aBypy+
2Lk0A0j1TWtGJ6Yo5ZLVnzWHxCy2hAE=
=e7sF
-----END PGP SIGNATURE-----

--=-m6t4otkvc0ZAfwx/Sa22--
