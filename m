Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616605;
	b=VVROWbAmlyenC04Rn47dIYC84gD/e7NfCgLjt7H3Q9QijC3w9PSs6mtg7bzbe2ztkcjq
	 0JYh0PaWM234rSNoPc4r7w7XIG5YG6D0wR0HufU0MApQ0iO4UnmeYgDYMVQ6p1JjQclRW
	 tXoWqyQpk34qxcO4u105TeKaRYKrIJ5rtrIOoOpmM1jmHENu/iW/M+F8+TYCtEWvyvMN7
	 tepuAyevK4wNDwIwkHiqg+kP+WMUCuxglabFVlS1j3RcboHctF3nbk02lUUdYmuFQPQ/r
	 HLAMGDV3Xl8MlnUkN7X3Aiy3iG4kitMcoVvwa4ipTxET4iAmH21kjHRrXZdSN1HXUnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=rvo1oLlBWLz8SC/wpkS1QHxq0y/4tjxHxfXQ9wd7SCo=;
	b=SMRTRHcjoWYxzq7v905lybeU3n4kcBXoE4Y4swoxFwurwOflLrEQmphHW3B+tiLXixIp
	 gK6Q0peX6Hafw5NdTkP7j0Dxyc3AaS/g1vjLrH/AHVQmymCjpfqXGJ85ZAwQ7PIk2FhIh
	 /EHXkQWVRbnOFHRMJ1iaO7WL+sJzDRsClX7T2uR5TpI9Eyq2XU+Q0HtAliSDOKvXEPukG
	 9L7IGM7Elf8YX7GZoyTaztqTby0Lpm4wRr9VKDpuXWWn/tQ5ukwvmmwzdr/nNkw1OE43W
	 SC/DI1sDH5OHQEOgTiUSSi03gYihNkOihlOi2NeQiNeFLDek1tGo1XuBGDDeWY5N40Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=C0DTCZN2;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CBB606A334
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1CBB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=C0DTCZN2
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917997ab0d9so11360076d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1792616603; x=1793221403; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvo1oLlBWLz8SC/wpkS1QHxq0y/4tjxHxfXQ9wd7SCo=;
        b=C0DTCZN2vLmyCbYqSnaxEAbZxHAULbVCgf48PCOOh6ea4a0jVrOtBfVd/M5+F/NFJp
         ygzGlb9ZZqoH6U1EsqmzXcI30quO3Rru9pNr3hdPR4swrPYZBA142hpNUl+SvjGd8+WO
         oHdoEC16/CVI3hBAygTRlM4CwPbH1qvR7d3XCLPj+qhEIyY+3K0cASqryDrZxpyQqi2/
         CJ2Tp2dEYFnrem3Nc8HsQUo7yz73L/jFWK1nAefPMXjf04O0tvZHHHLWl2YcGbELUlQi
         TJE8BgCWIGF11/57JzaUrHfzIF8IslmL2GVNxeOJ0t483h0f0+vcy8MSMXn7oDIIfExS
         p78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616603; x=1793221403;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvo1oLlBWLz8SC/wpkS1QHxq0y/4tjxHxfXQ9wd7SCo=;
        b=D38XdHLBdPZieRzXiN+uxQyGerq+OzTyxrs5HEbaUdY4PEiqYtMlFXWP0FbYHTuiKe
         3p6k3Kjp3vpRvGsb1v7bHZJKiMRgBTxkeABvrPXfWihC0zjS0vZ9OmFrdxhgpOR7/QWE
         I2BqIFDasZ19Ak8HmHs+d9//MmnsVafIGJmQhRs+IIAyL+/BRRGzKsugShJQ8si+CL1Z
         IGRlEpwDPoPlp3bhvfpzL+PNZ4Ny0iEt+kGK3w4HtKBQvm9nnCHonSEM0YuESevkJc/Q
         TVMXXEdbFB0UEAcSGR7sFUdbj+rb6hQEG+DIXLcMj7jpjIeQVRCLApZb2S9aCbdgMLsP
         tNtw==
X-Forwarded-Encrypted: i=1; AKwUvBxtBvkMaObhhUBFCHJ5YzaHR+Og9iprciX30GM2nUGGeJAi1+J5t+B/7/gWCybg1fQWe4CnmQbLtiBkfH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3UDoyv1hN2WZstUme5mxC+FrNrcmn7dqqPDcoPDebQ6SW2sUY
	g0tRXDS5LeETZGiATsXQ5NrLm8DUsKGC5iwR2foGee2nkhfJwNf5ZyIW+b2e2fP6mro=
X-Gm-Gg: AYBFou0kjDcc4rh3m2lvUUhmyCz1iH4/cxsZCflxIUM22Su6j/220VLXZAyoifhl7vF
	cyIE5odmGP+9V8qAdT1jPPtd+q6yGdOAzLU2x08K60rHv7/q/lSeWqJttrP3vzoTZ8BsynN4pmn
	2F3aorA6UM0WbZ2oQIwzrG/SYZ8VmsIQxzd1Q905HwW0bzEsZVBr0phv78bf5E88upDv+pEB/fS
	xHbsHqkzXBfWOmWpnAdWTOpktAH3HrkhEOVslMuauFLZl1+zVX+mofQzi1cvnnxKvU6wIV0qhWS
	YL4hGfu49SdWDHanGgUDXfH2kTDZtg882FYLN8fisJZSq3wsxekjuN14EbDmXVafkslRy83XPlD
	86wD5W0B33hDOKHYxOKo2IX2PiJYHVEEZ0pB0ogZ+fg/dJYel1u6j5bgatoyuZGnorG92bqNsDY
	0Zwxn9g/Ms1yiB/8YPjVec8/SQ5NmrGKz02eFHRJJpEhjO65f80ZpaCBFu9wH6Y0ubWZlfEXAer
	CH7XHdlHie7TMY6N+Uo3FAjAq84eCevlknLuXqx9ktAayfkHJxGDO3GdweOh6XgdEMYtj2QODxX
	EHCBsQ==
X-Received: by 2002:a05:6214:4606:b0:914:45c3:7920 with SMTP id 6a1803df08f44-91c12ee4515mr55915706d6.31.1792616603478;
        Wed, 21 Oct 2026 14:03:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10bd5d8csm33919576d6.24.2026.10.21.14.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:03:21 -0700 (PDT)
Message-ID: <3084b9bc0d4b5593d2bfbfecb0ce272cb813ece9.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Figa
	 <tfiga@chromium.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-media@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans de Goede	 <hansg@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Tomasz Stanislawski	
 <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Date: Wed, 21 Oct 2026 17:03:19 -0400
In-Reply-To: <20261021175900.GG15441@killaraus.ideasonboard.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
	 <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
	 <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
	 <20261021175900.GG15441@killaraus.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-juzhAGcbo9MJ5wmh/cX5"
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


--=-juzhAGcbo9MJ5wmh/cX5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 21 octobre 2026 =C3=A0 20:59 +0300, Laurent Pinchart a =C3=A9cr=
it=C2=A0:
> > It sounds like this series focuses on uvcvideo and vivid, which likely
> > means that 1) alone would be enough to fix the original problem. WDYT?
>=20
> I think the dma-buf API doesn't give us what we need. Cleaning the CPU
> cache through end_cpu_access() when the producer is done writting to the
> buffer is right in some use cases, but not in all of them. It assumes
> that the next consumer will access the data through DMA, which isn't
> always the case. What I think we need is to track the state of the
> cache(s) in the dma_buf, and perform cache management operations
> accordingly when needed. In the uvcvideo -> display use case for
> instance, the dma_buf should track that the CPU cache is dirty when
> finishing CPU access, and should be cleaned on the display side before
> performing the DMA. In a use case where the producer would DMA to the
> buffer, cache management would be skipped as the dma_buf would see that
> the cache is not dirty.

I also second this as the only viable option. Its not only about uvcvideo, =
but
any memory imported by a driver doing DMA (which is not also the exporter).=
 That
includes udmabuf usage. These days, cache artifacts are visible with Intel
display controllers, and Intel mobile GPU drivers. Note that GStreamer prop=
erly
signal CPU read/write using DMABuf sync ioctl.

For most Intel laptop user with GStreamer 1.28, these example produce artif=
acts
on movement. To me, the solution is to track the cache state according to t=
he
access signalling (either userspace or driver), and let DMA user/consumer d=
ecide
if a cache flush is needed. There is a obvious challenge in keeping this st=
ate
coherent whenever there is multiple consumer, of if some broken application=
 do
concurrent write. Result for the last will always be undefined, but the dma=
buf
CPU cache state should not be undefined.

UVC reproducer:
  gst-launch-1.0 v4l2src ! waylandsink

udmabuf reproducer:
  gst-launch-1.0 videotestsrc pattern=3Dball ! waylandsink

Nicolas

p.s. since Intel GPU these days is also affected, you can swap waylandsink =
with
glimagesink and you will also see artifacts. One may blame Intel, I believe=
 they
made the choice of performance over correctness in absence of capable HW or
dmabuf signalling.

--=-juzhAGcbo9MJ5wmh/cX5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCatkolwAKCRDZQZRRKWBy
9Et/APkB+aV3rNqA9frRLxXO+16dYuS0kBW1ojM4JNmBmGIr6gEAo6QGPTHCgiKQ
72TDoedSkF7QsuqeQOHdxaRy+atLJAo=
=WHwY
-----END PGP SIGNATURE-----

--=-juzhAGcbo9MJ5wmh/cX5--
