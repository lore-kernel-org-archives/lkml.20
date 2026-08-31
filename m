Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62D3655DD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206734; cv=none; b=ubf1gmSMhFu0i64usN/sL9FjdVKbM5Snurb7zdZb+6IipE39iiXFWjPDPw3ltGO0FcyeMgZkY4AxCH/0dJKRW9pPp0gksGpoUtaUz0CgyJ6teJUdx4Eb2uZH4pnm1//BJQ9aagogIIVKYJtbHvXeA6djtsOP3jLYG1xvxBmgNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206734; c=relaxed/simple;
	bh=TWhgm+PnpeKo87zklKOvqH4t82IAK2P1IEnz+Uem0L0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fePA3oUso2nl8P103T8GvfGBrMZbK3hQl2+cUOc54yx3rj0wDQ6G5mIKcphE4hpRExbPCXggBRHfm83GcHnaxUQgzc4CD0dVfhWT8mjC3ssLRW0jgG/Q/QSctEgZyZt8Edk4NqD2hsz0XNx1E6dFx58pcoCxkJkGAFhh0L5itJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeHWEom4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e1QAdC4E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeHWEom4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1QAdC4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788206731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TWhgm+PnpeKo87zklKOvqH4t82IAK2P1IEnz+Uem0L0=;
	b=HeHWEom4qJOqel9rrcq9LsZLKwQUaqowQpC1Y85D2hswcNVjLOmIAONCqD9TffsVNEbwZ7
	p2ol4hE4Mriid1REniIhEUilLMq83K7ItNevmCP0s8W2IyC126dix+qEijqsabk+6Deh4n
	ZrkaLOKDrCEKpxDXcffkar0a5GFIEEU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-KnNgd_KTO2qk1IEKSz2rYQ-1; Mon, 31 Aug 2026 16:05:30 -0400
X-MC-Unique: KnNgd_KTO2qk1IEKSz2rYQ-1
X-Mimecast-MFC-AGG-ID: KnNgd_KTO2qk1IEKSz2rYQ_1788206730
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce8ad8002so54824056d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788206730; x=1788811530; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWhgm+PnpeKo87zklKOvqH4t82IAK2P1IEnz+Uem0L0=;
        b=e1QAdC4ERcBRWzGSCvDIhwPiqnWx+cqpE/Lt1EkwRF9l02UUySHAeUlBMtTvG4VRP5
         y2IH9PdfjeawzPWUYW5xuC9qCYInD9slFJy7zs31oiovGncqN4XPonk8wHmLsWHMH8eP
         hwoau/cfT8JavPnIBRejdCWbbv4kulVm6qsIcxlnvnVmAHisMo4OSLiMm/oLjjM0YDfn
         YkazxwEs2kjTTh0JYy7h0VeX2og66/s4IjLqImRZLIaQOmcwvC8a1XiAQz8yzyyTuvEr
         /YMPrBw+3ecIgmA+5wml7lA1WxzbL7NZmJYkYgyKalm/qRL7GZkLl8LefgeWq6O3fxB7
         EiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206730; x=1788811530;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWhgm+PnpeKo87zklKOvqH4t82IAK2P1IEnz+Uem0L0=;
        b=S+KncB0LMUyl9AsmtX3YOmJr6/pxh2FC4uBrAUJRYiR4GwKEQYpCpDcxG5UWQEQfJR
         CZKhbGaHGO7BAFGsSTs7KRSizJJHOCxnHoqKxpyM3M0Q7xlVdvXvDkARkBp4KeIii9Mp
         NAT+/VH7JegkcXhKmxRgMv7NdO0+Fym/6ewUxZEMHJDm+Gw7a6f6XgkU0gWzOT+NgriG
         DxXkuJvU0OSbJGN52S+Ct/bsXkH4ic1kgv08X/GnXLf11VknLOXbGl2olh3b3Vwmypss
         MhoyWkReW+F3SdLiAYpcQEyVPbXxwArpW8/kC4e9pUf89haArcXnacBxLfQ5ZcQ/JLxW
         E5rA==
X-Forwarded-Encrypted: i=1; AHgh+RpfegDLkR1td8dKEWI2KgDdN6h52SVUV1Tw728hNDP4nzHilWSqWu7+jQL5/wmOquJmHVSHmrzQSJ5gYt8=@vger.kernel.org
X-Gm-Message-State: AFuF++kIGvuamMmSY2fUUNNIUgS/LOevTdjr8u4yfFOgk+VV6Yxi6RKO
	bcZNK2RbFh0L/2sCN2Vhh4cRjuyFLa6Rt2FEjJzA8a1qH0f4375Vvm2PaQdf/8q9pKrjogPJq7j
	yv3wN6/363PqnxtudmHK3w8RHzQQ+++U5qxkjIH8UfoBnXdnud+ulbVZtsQk25rQoig==
X-Gm-Gg: AR+sD13IHgKSVvpmWnEqO3kN7Ent8w2ZKjXKVwwVsvvBIB6PUv7J9ez8oSVRHGHCerP
	cAzquajf5wDLC7HBhatUDPhfmIuSP8AbSfmBKO00WTaa0Atg5G+bjUmIVbLt6ziJijAA5TtsRTg
	yWt6xlp4EmmJQOJKSU56clVd9XupjJlG4PKUrbFbkgDbLL9F/Z/KaBpLh2u2I7jo2lOmbt9pyDO
	lX7+jaRFHtRBCRHReb/e87XUSo9MOCEByJtqmcUzXCIL+bjrK3E7Q1702czWghWBYRP1Q1waF3r
	JCLWkEAj0wO/2wpOx0wkOftV0qwHHWECG9/R+/MMMsIC6YBgylSd3tU/M0A316uNOzPjXOlAUwY
	SSKzJWq9WDW4DDbObnbStRL/EkA4PCJ9WFvz/h62wOKeDvSYmRo6Ty/+k1a6HLRZYinGCxgR/7U
	ERr43el1DP9kzLx6TkbbJQ
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3027247285a.3.1788206724722;
        Mon, 31 Aug 2026 13:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3027229785a.3.1788206723665;
        Mon, 31 Aug 2026 13:05:23 -0700 (PDT)
Received: from chaithco-thinkpadp16vgen1.rmtusco.csb (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a49asm865069785a.11.2026.08.31.13.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:05:22 -0700 (PDT)
Message-ID: <df49394b45f04e0de5ab0300a8d18f5ba6d38b01.camel@redhat.com>
Subject: Re: [PATCH] Differentiate scenarios when watchdog is closed
From: "chaithco@redhat.com" <chaithco@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 31 Aug 2026 14:05:20 -0600
In-Reply-To: <93d22742-bf3e-4e69-aed5-27137d8f49bf@roeck-us.net>
References: <20260824205051.4117285-2-chaithco@redhat.com>
	 <2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
	 <QBUFKT.6XP2A9BR6LRO3@redhat.com>
	 <93d22742-bf3e-4e69-aed5-27137d8f49bf@roeck-us.net>
Autocrypt: addr=chaithco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEapCVehYJKwYBBAHaRw8BAQdAORXHCioh8sg4JScf3G8JrmX1nUt+teTWsqlbk67dr
 va0NkNoYXJsZXMgSGFpdGhjb2NrIChXb3JrIEdQRyBLZXkpIDxjaGFpdGhjb0ByZWRoYXQuY29tPo
 iTBBMWCgA7FiEEoln/+dhdP2hiiZGQ86/NNaAhFjYFAmqQlXoCGwMFCwkIBwICIgIGFQoJCAsCBBY
 CAwECHgcCF4AACgkQ86/NNaAhFjbm1gEA9t0Iaxr6IkGONOjD7eB10PjTYyDGVd4QdJYPohP8xRsA
 /0OETJIGSr5rxRqG23AGUdlnUfzFlgm3QuyfNpGHcv0C
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0ywmMAk0QA94DymszmK7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0ywmMAk0QA94DymszmK7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-08-27 at 11:10 -0700, Guenter Roeck wrote:
> Problem is that we don't know if "something bad happened". The same
> message
> will be seen if the watchdog daemon was killed or crashed. We can not
> just
> assume that closing the watchdog device was intentional.

That's the same sticking point I've come across. Differentiating
between positive intentional closure versus malicious or buggy closure
would somehow need to be communicated to the kernel. It makes more
sense that users of the watchdog which intend to close the watchdog
while still running maybe denote such. I opened a PR with systemd at
https://github.com/systemd/systemd/pull/43552 to see if there was some
way this could be tackled from that perspective.

--=-0ywmMAk0QA94DymszmK7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSiWf/52F0/aGKJkZDzr801oCEWNgUCapXegAAKCRDzr801oCEW
NtczAQDuBs40A1K1EQdOhomprxd8gwJPgKlHd6zb+N5UZpMywwEAmTSigALQTDZQ
Xi/e4vWX8AfozunR2RkF1Sz08H1EYwY=
=AKZI
-----END PGP SIGNATURE-----

--=-0ywmMAk0QA94DymszmK7--

