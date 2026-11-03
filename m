Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673053;
	b=uknyTP0zv+9rhghboXGCOOFIL51C3Dq7dH7m7iP8KjvMcn03UHD/cjJNMz/vvujPXjrq
	 gz5aleCKdETUT7waBmu2nxqwIlUsor9uot2c6+gTo8sCn7WrVPDF9Sv13vlnIs/YTw+Ra
	 agAQh3IKFmuFuUU2mcyo0r7oIMPyVe3PM6Gj3c6ZcDMC7PAcUz8UsaxGb3O8xoeKpga0x
	 DuEzUDoGBiBD4Zaa4At03mLLMtc8g/Po+N+2hso+bhszv+OZzJmNN5zEdC630necoLOVY
	 wuAND0XrW0gudtOcc/oHJEbtNV7Lar+/yhMMdlXAuKQus/RHEg/1yDPJLWSRvncns3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
	b=xyBq1qVGHBwsG8NyU+goasdd8C0DWjECZsZa6IpR+VYe6yBQpECTH6oNq/0Sk2xFJauD
	 kA9e9CUANFV3cLnPbpk2uJ+51WBU3rjv35RHXg7RV+iyT+/82CFwYFjKP0eTvZXProkvs
	 wSmVlwVIXG0wI1uKZDixUSunAhnC1+YWY5O5Wwm4SnwnorRPnpHVbdFszvkzkpp7szylf
	 qNVJlK3V+eR80gblL6n4d1LRxDohK8gjUkkasuSUAm8UoTMpCCRmJDPTcKJns10rLdJ5u
	 S8DPjZ/kMYjp/TWSMusnCSUEKIMMnNnaz+zaOvoFbMP2lvwlPAMXjWlGN8b7jBvaK2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qxWI18yA;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA3606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BA3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qxWI18yA
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-945ae2daa66so189432685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793673052; x=1794277852; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=qxWI18yAQF/7ypbC/cjrf7UhPNBt5hiGjrXaKC07xrDOTAGD+oNMaPO9o1FiV2cGHt
         lhvtLYIfIcNwql6S5LAgOvCAWS0ZRBu709hwdzHogI6+KpUyDGFOQDhZfjYR1487GunG
         rNNvIgRw2MAVZss29ozZDUTqwoClA3QJuQEr3tpFoQzyOc9S9p9IqnvZunmlJBEuKXIq
         7e44cd94OrEEoI5pVUXZhBNRzsHP9Wm27/NtoydkEbCsvQ35nMPicwQ46Jwci5If6wMW
         Jcy6T5XQx4t3ZM9oWsU6UoSskWMhmRbLBLFKJ8Qqwnn9Y4ly1NUbSTd9XhVcofs8Gf/K
         z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673052; x=1794277852;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H7f2+sbvco+m727gcYXPh56BlLVYSp/7lO7c/5FC7c=;
        b=eokL5ur6qOx0V9A+bBYLUOsYUlZlHmoCwBzZCM09BpazZHGtY8hR0vdcLeVowDbOWx
         +tfaseb5BG1B5ozzXodLHa8fnpDfhBTKBRT3ZPmXalwF6FOCsEK46uT2oy2E3Vw7SYN1
         Sl3mFHV1bdX1wo1EPx0s7iCo4jzs8F0/znxifc8DsMlQKQZfuZ6KGRM43KREGq6ioIck
         iaBobQ+hAdImtZz3tN7UGJJcmfPRLHNNusbPW/F8HNhA0S5IjWmGlkjkw5k67mYHySkC
         amE7rul6ygaBA9bZ6nIlZDpO8cuPvXwzC5RA4n8BZMnxbPAaCeJH2N325ZaVyhE3FU7z
         sQzA==
X-Forwarded-Encrypted: i=1; AKwUvBxNoTROXBYLZ+DfkDYxC3nYfqZhfoOZ0if44t47L+9nyNyc0DPvZULFR3x5qPyWZQuPPDERAwyfAJOvOJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFv71xNb4mIdUZ3OoPmyIV6hyrHq40zfbrikNc6re4q4S0UjdV
	Ariy9Pd3InyKRz0EXWn5/sAqr3k8ZRb+fIf07MNT72Q2GftFd4AHep/0Gc8lhiaDz3M=
X-Gm-Gg: AYBFou3RlnKKQ7gB2NUuQq6OOIVjPwSfQa4hWS7fd5T+hE5H19GGOuT6p3Cw9MkhS/1
	5kmH+ihbQDTwbE0zg5b0SiPU+cu/k94NM6IA1LO82EP8LLQmM08p+r+LMgnGP0SCUn+dyPZhGvK
	/WCZGs3C6FuObCYy/Pw8a/YUCg9BKvxPRkyLMFKjfpt6LG7nlcdJ8Lifz/2CNKljCoTOUFcuqnt
	eHguEjHudKJ/3ubc0cglp9hOPhwv8xQzgiMql+Uo4YAhp2JCW3NihI6z7wH67DLrtBIzIVI9G/Q
	IWlPKkl4ncAYB7FXgxXPIf/GC5ZIalKWi2MvWb5KTDScU0yOil59ZXOfK4HCvnn7lu8qVNcUbBA
	LfLYpvyAJtMFf8WMnR6btceL6OYrjZZ0R0OSbNQ9MoQxFiS026EakrPYixGAFeyk2edQ9y+c+w/
	fh7KwQasa90HGDosBGafp+Ulm48oDOdNK1qQnAoZi9jIoP/fRYF6u1KH5gsuZ4eA+iJMv3n+tZv
	ujR5OxERJ8vUqfEQhxjGsHzIyEe4A4UTWYHPoFjAZVZEzVQQZf0Hztdg6+uOhsUTL8v/NQDYnef
	ZQxkjRgtJU2m5Zr5Nhux0zhHTqe6DLlh3+aD/bBLue1JS85an/i4U5Q=
X-Received: by 2002:a05:620a:84c4:b0:93f:211b:a88 with SMTP id af79cd13be357-94421712a75mr1959639885a.14.1793673051964;
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ae7f53sm964496885a.41.2026.11.02.18.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:30:51 -0800 (PST)
Message-ID: <69827153a6b0f3b863ebd764645efe0dc2fda6b9.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Quentin Schulz <foss+kernel@0leil.net>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael
 Riesch	 <michael.riesch@collabora.com>, Heiko Stuebner <heiko@sntech.de>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Date: Mon, 02 Nov 2026 21:30:49 -0500
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
	 <20261102-v4l-y8-y10-csi-vicap-v2-1-0a4149d96dae@cherry.de>
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
	protocol="application/pgp-signature"; boundary="=-PyPL7slarfAow59TTGqi"
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


--=-PyPL7slarfAow59TTGqi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 21:22 +0100, Quentin Schulz a =C3=A9crit=
=C2=A0:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Add Y10 format to the v4l2_format_info table.
>=20
> Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-PyPL7slarfAow59TTGqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaulHWQAKCRDZQZRRKWBy
9PIyAQCt+smxAv2SEhjb0K1aod+ajV5VdSqoZA6d/mIWZv+ihQD/UjLohcJqLbkz
k6t3aQWhYB2RTbM8wRfVMsnXdYFJ5QM=
=W+rh
-----END PGP SIGNATURE-----

--=-PyPL7slarfAow59TTGqi--
