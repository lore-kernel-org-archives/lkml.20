Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324448;
	b=AkfoWCZwRHHD99f5rQBeZY9Fn9ABYPQeO60/wOICwHslKaCQuY5XcRIxxIEWVdWrrbXs
	 M7usXBf9R7gflqFpUPjhkRFIidXx4VKXuP29xJVRVlr+JyD0pjuouB/1Q9xK/sLoNTc2R
	 2qIVKKgFSyoQCyhiGzJI4eEyUYxnuBYjH/XR+PPrpCkRAU5045wRtN2a83iWfVvCUESkf
	 Q6NMBpDRxw5sVUfvjii7jSjx2BawDxdhbpeKWQY8WfUYbjJZvWZr27f39CpHBJe9u5oji
	 23bHlXL619q7NlCW2KJ/eIYspiRy3ceWuKCK1sSku2lMq4H+NZA/86/JVzC7urv2Pvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=RqGRKBlv89UKnAE8+LCS4f2GqK9XGXmUTqEzxUZrwbk=;
	b=j3oJ84vbj2+IIWGBicuc5pKyHDRzgoDrppS3yfYLJMNMEBV4qy6P75d4CHMqCvYZB0Jd
	 b2OxE96edHl4H1lTYkLQHZTRjO13N4NXFct5iYW36mPwBcJJl7F4W5A4yZiHd1CQAoe2a
	 7o61kpr0O0WhhxTk1wLFp96NDv46g7+w/SaYTTMFl/BafYNiegvC6KsWlKar2iTyRQg5+
	 hdEMevoj/ZaRQMmi6+gl7Rna2nnnPxnHgg3i1NPlR4A1FtTZ5h3Q5gfo8/QHtd8yUhhz1
	 StRBiNvp84shWCLrwJcuOSreoMI0o8/gXhjeTSxcWRuXCze9JFwDvUCsarveO9b5hTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ORWxlYYo;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F16606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ORWxlYYo
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c719669a8so2390436d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793324442; x=1793929242; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RqGRKBlv89UKnAE8+LCS4f2GqK9XGXmUTqEzxUZrwbk=;
        b=ORWxlYYo1U53JkjHwRLfAW1+Qc0YBGANh9qTQGwXTGcbE/kQhD+C76p/zlmecfvzQc
         cFatHiUrF84VWhUc6/eacLzQ+xZVXgVHgJtugeFL4SIF4sOgfQMV2EJp1Inzjx5eZcOI
         MEjm/AS5eYmfg55wWgUoIrobveXolfq9MspSoJ0rJAjTHiYCam6C8zSQT60XVTi3nOJ9
         cLP2C34Slj+rfwEcaz2WZ1FKrza9E21wzD0+C60GjFYw2UmpFLPHY35NqLpseUtFPAnB
         cSSoBKOKD5nJ+bGdGRyk0ju267URf00mg6SbVItN5sYOV3SfCDA+TNAiNbzKVguIPxPn
         pAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324442; x=1793929242;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqGRKBlv89UKnAE8+LCS4f2GqK9XGXmUTqEzxUZrwbk=;
        b=ePf9WPMA4jFKoTmCJVvLGIWapAGjHJj77PrDiudNPG0RkDcGfTnc8yTYF32QRXglcN
         mMSlamei4GzZxqQcoEXbzi1bTYIYOJgJ+11P2Oc4t6UkN8hzkfOkcFiAHZ1FD0P9RV7H
         kMdKHZiqAlCRSsE5A/Fplm2lxaiI/oSD1CyThsetbfzvKbXZEqnRecz8Ssy+BIXCyVOG
         ugz3XftEUv+pPN8/E1m8PI3235FvEzydZu8D04MqmAGLdRcvspAInq4RL95yPhbAZx4T
         wC0NH+lqgZgWLQO++a790ZBw6Da/3YON49r6lqPsjJi8QovW2L6YvZWr2ZloXvca6XwX
         n6bw==
X-Forwarded-Encrypted: i=1; AKwUvBxjnkl7+qJAsqIvkn73HEWCnkiATuDANc9MxecWXld9lews2MpZ5a3OT5o1NcmiNPPNGkKU+KVb8UW6/9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBTkU4hQMg6swlbyc5CRMoKVOQHgurhAqfaiwFmXupGj1xggCk
	WojVGGJyAaQzesfpG/4agniAZ0vwGk+gZWx9U3h2LE0VJ2s6miCthe0NSIaMpbEP2M0=
X-Gm-Gg: AYBFou1IEjuMXEUtYRzIkHBBmTAgvmTVueDY4/0vFJzgTHNIgnfURoyP7buH3ER6LzV
	VWxpR4s+JX33vQgiNPZpGSNp+BJqAQaAsleJ33kZG/x9oIGwXIgSnhMbvkQDxWgKCNLEI2LRYzN
	L7rlBbIXKmDSJ1ZM+A5VtfQPC6KXknLVE1vCkd3Xka+GoB9j/JHhQFvQwWgCzN5eRIAKQrZ/p2i
	PrK1bfrNuzzUO7XvqMNp6dwZWbMwD3tUFET4lacZMTJDUBzuupWaNVgKsQYpLPCxggvdEKICJyb
	IhI5ZdMo4/VYANAPeP/OeA8LqYm1DBV76Nn2Tzhi8RQ4TRtUTLwop6dgV1a7/N//Fg+3SbV7sxz
	MGV9c5VDlrYlxyduqdseWS/fJVWZBWfU2V8HkM7uveGVYoJZ2YRROAAD3iRxXkXl2hK5IVTGFa+
	loUKaCeIrZ75A0eCtM3WoXvLi8q+dvKsmg7AJ8nzhQSqEYjjbpKNgIj1slOvtdbCG2ucsvghXv/
	4BXtvCaSr2SQkteW/fT7TVACMfh95FG9w0IdZ9G4cCFYDz3v75kuQtK2PufCGiUgV4UpBY2gCqr
	VXgOMln74JfqpC10WX44WBxzMfFJDrcRzrDkEeobznKS+MbUyFnvFPU=
X-Received: by 2002:a05:6214:5083:b0:91c:7997:615d with SMTP id 6a1803df08f44-91ca49f2c47mr12813436d6.4.1793324441578;
        Thu, 29 Oct 2026 18:40:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f254a1sm1827526d6.7.2026.10.29.18.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:40:40 -0700 (PDT)
Message-ID: <7e4c7707880e9092180d28484ecf674be29b40a0.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: videobuf2: add opt-in DMA-BUF CPU access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Figa	
 <tfiga@chromium.org>, linux-media@vger.kernel.org, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Tomasz Stanislawski	
 <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 	linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Date: Thu, 29 Oct 2026 21:40:39 -0400
In-Reply-To: <atmKXkOJiGJXgRz-@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
	 <673c04ad9dcc4f12685c076193ebad9e48e5f08d.1792392288.git.kmehltretter@gmail.com>
	 <CAAFQd5Djx0kjeFpzPWEgRV5_MhiJAW8tg-2C+cYxqMf45u_-RA@mail.gmail.com>
	 <20261021175900.GG15441@killaraus.ideasonboard.com>
	 <3084b9bc0d4b5593d2bfbfecb0ce272cb813ece9.camel@ndufresne.ca>
	 <atmKXkOJiGJXgRz-@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-SYeMQ3pQJ6t3SdKBYJiJ"
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


--=-SYeMQ3pQJ6t3SdKBYJiJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 22 octobre 2026 =C3=A0 06:04 +0200, Karl Mehltretter a =C3=A9crit=
=C2=A0:
> On Wed, Oct 21, 2026 at 05:03:19PM +0100, Nicolas Dufresne wrote:
> > > I think the dma-buf API doesn't give us what we need. Cleaning the CP=
U
> > > cache through end_cpu_access() when the producer is done writting to =
the
> > > buffer is right in some use cases, but not in all of them. It assumes
> > > that the next consumer will access the data through DMA, which isn't
> > > always the case. What I think we need is to track the state of the
> > > cache(s) in the dma_buf, and perform cache management operations
> > > accordingly when needed. In the uvcvideo -> display use case for
> > > instance, the dma_buf should track that the CPU cache is dirty when
> > > finishing CPU access, and should be cleaned on the display side befor=
e
> > > performing the DMA. In a use case where the producer would DMA to the
> > > buffer, cache management would be skipped as the dma_buf would see th=
at
> > > the cache is not dirty.
> >=20
> > I also second this as the only viable option. Its not only about uvcvid=
eo, but
> > any memory imported by a driver doing DMA (which is not also the export=
er). That
> > includes udmabuf usage. These days, cache artifacts are visible with In=
tel
> > display controllers, and Intel mobile GPU drivers. Note that GStreamer =
properly
> > signal CPU read/write using DMABuf sync ioctl.
> >=20
> > For most Intel laptop user with GStreamer 1.28, these example produce a=
rtifacts
> > on movement. To me, the solution is to track the cache state according =
to the
> > access signalling (either userspace or driver), and let DMA user/consum=
er decide
> > if a cache flush is needed. There is a obvious challenge in keeping thi=
s state
> > coherent whenever there is multiple consumer, of if some broken applica=
tion do
> > concurrent write. Result for the last will always be undefined, but the=
 dmabuf
> > CPU cache state should not be undefined.
> >=20
>=20
> For a persistently mapped attachment, where would the transition to
> device access happen?=20
>=20
> dma_buf_map_attachment() may only run once, while the importer can
> submit the buffer many times. Would this need a new per-attachment
> operation before each submission, or can an existing event be used?

In my perception, the mechanism in place, attach/detach and begin/end only =
work
for very specific cases and breaks in most other case I can think of.

>=20
> I tested that distinction with one persistent V3D attachment on my Pi
> 400 and Pi 500+:
>=20
> - If end_cpu_access() only recorded dirty state, with no sync before
>   submission, V3D read stale data in all 64 frames on both boards.
>=20
> - Synchronizing the attachment immediately before submission produced
>   64/64 matching frames on both boards.
>=20
> This only covers V3D, but it seems that a dirty bit still needs a
> device-side use event. Is that the model you had in mind?

In my mind, we need to introduce new API. The problem with the being/end de=
sign
is that it only works for specific pattern. Typically, on begin_cpu_access,=
 you
want to do specific action that ensure the CPU will see the right value in
memory. One of these action could be to flush a device write cache for CPU =
read
access. But unless only the exporter see these calls, and unless the device=
 is
the exporter, eveyrthing we have fall appart.

With the new trend of always allocating from unified memory using dma heap,
udmabuf and other non-device specific allocator, both device cache just bre=
aks
everything. Just like, an importer that need CPU write to be flushed breaks
today. This last one seems obvious, just flush, but if the data came from
another device, you might just kill the performance.

I think if its just for the CPU cache state, to let importer that needs it =
know,
we could introduce some sort of a bit mask (and some locking probably?) to =
help
solve that. But we still leave the concept of device side memory cache brok=
en.

Nicolas

>=20
> Thanks,
> Karl

--=-SYeMQ3pQJ6t3SdKBYJiJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauP1lwAKCRDZQZRRKWBy
9BGDAQC/E/RPY2ek3JSbLyrgIL8MsvucTMSh5z3xFEul5NU+/QEAzGcRh7x7KGrs
b5Pdbz0AZo4N9fWgABBMs+tBtTHRDg8=
=XQRj
-----END PGP SIGNATURE-----

--=-SYeMQ3pQJ6t3SdKBYJiJ--
