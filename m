Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792603060;
	b=uc147oW69ruO5Knkz5taXGT/OQf61RTEgoPJ6stSOfSJ6z48RgfswZmhTN+zQm2ga9rE
	 4bEbuPy1fy4Q+oFI2ncTkczCEgq7qTuoiaYX/daFZHPrem185Xnw9piedbMnb5aNnFCgc
	 DEP4cXhADXcorIJ7E0OUpj2fOkDWoMoPV9kw5MCWwwcgsii4fRZdVOfKNDaDmGkn6oK7w
	 I52UtTQGi5r43mkMB6yC1QRmt/RFoqLWOeRJIEEO6VOvHZABfNlS68tXsxEOTbyHiBpDB
	 rx79xYPglat14UFSAKkVr3EuJfCWptv9t5RN6uynaNtuV1VrE7B438yTawgkGKYg2Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XRup6C3XRPCSpEmzli28tq/JP1tN3ECHcE7lVuoPftk=;
	b=3/ibpxRf2QmjXlnCKcc1/avBeV5oL2mPBYs2gfdjkA2zQIpmvamCJsh3TNAe8hDZ9gPe
	 0GRYOfyLcncalzVTXPAewyOLhyPrm/DXvwXaS2w2YsnVaMPzk22eup5z1YZzHIQepI927
	 prH2tRlrOtLlmoQIo3SIYSm3Wwj3RDLQgDfhmrjaLrgb8pvP+MaBU1OiU1+JpUFI/Fvii
	 9Avvq++SQqKbpDEbUKvZrp02SGRCSdfc/a7cQGtCtevNnKvDDNcE80DpzeBFpMyAgPYr/
	 YGJThFJ6HXSAnCmLQoepSb7PgIOuHO8/04afMkUf1zSeWlr0eSYkS8h28wAkKs7t1ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE54C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso540a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603052; cv=none;
        d=google.com; s=arc-20260327;
        b=LR3M+EIj2i83V/obt5cQKDAbCk1HVlp25m2Ll6S5qYAL8qCTNtf+Vv/iEVnMtB/ao2
         osJEhwx7q9xocS8qQKezutN/So6pY76D2k21bqX7RKFhTyPA4kegsnZDpZom/YRO3UKp
         pzSzG3b02V9LguTgkldt2r8rX87/+Rfb7GA5uX8UQSrZmC6c6y+rOi7PBjCnvj5Hmkry
         sJ1itmVT9mApcnfKChj1ur/HYXoUaWH0/MB+XhKMXstDmEBjNimTHW1YICCzXx/Dcw63
         Plzh8eEUHf8xCKdBjn0Z+/TooxmLqX5ti3DMFmrCtQa3PnWgCncXKqFvAoj8QZcbSkbg
         9VnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRup6C3XRPCSpEmzli28tq/JP1tN3ECHcE7lVuoPftk=;
        fh=2FJxTvVUunUbom0GLQTOc/vY/x3u9zD3YTargjYIf48=;
        b=pNJpV6mIdPemeuFbH2ahNyJKS84cK1Al0bGcRBKscT8KvuQ1D88o989LRztLvU+nrE
         AQAvGvTj7YdSeP/KyhaegzRjF7lHKo8Jk+xI3cGuIkSWhutaK8AEsiWztiE+0Xvrn3D/
         rTCnoFJjcc1jmzhhjJQQtjFV3cloqxIgRRXKbx3AilOhYft/Zp6ZWIYCZJsDZWydZ9iN
         I+VqXHFMQrYtP7x7+3WCGaTN6iizl3uDpDvzRoDEGhTEO+Br+XHm2JOiNafhv+WUdqLK
         cGrS5jqk0HLXSAnSC777W+QbM92SKpcF6X0evr8u6TUaXtJoCrSWAPlZswtAfHKEhNRK
         vNbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792603052; x=1793207852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRup6C3XRPCSpEmzli28tq/JP1tN3ECHcE7lVuoPftk=;
        b=HY/AavLi1D1D7Dx7qtYdLLnvUaSCh8Dyd0y5DqAqezDILat5p9bMgUFGCCZ/vLZSMw
         a8i0kgwDVTP3m12FUGNvDYdeBYpUxCUCkRJEWSxS7fkV5ylYluUXalk76SU26plnsvjv
         8XRVD9hrUmxNLgbY1iPmu1E11oDtZ9A/62t87hArGu6M3j+lXNRkPg9OcMv644OP2sTm
         Q9iNzJOt17lcMYg/u9RXNViXDBtwDRYVSEd22fiBtfGGnbmZQ2AieoYDDYEmQsPrnj2J
         Ajqa9ZfFo2Wt66sVRRdtAFvXmcOeAS0kZFaU6kjk0Qi6OaCdqUDwzTf1CrZD5FXaua3T
         bInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603052; x=1793207852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRup6C3XRPCSpEmzli28tq/JP1tN3ECHcE7lVuoPftk=;
        b=M7FSY6VCA2SmqAEglw7+QY+t3T6UDLesU9Wv1q2tOgekALtetEXnyiHtgS4cSvxnYl
         Vh/GNMH3L/uQE4Jw1PH45GIeHtVcMdz5zuEL2ike7dTgNYTC7XKGvsIDHVmE89357BN2
         IgOGNHokpE4WQ3e6vTlDL2D4Phng1mLLf+8yvwsS37ibXpJ7pyKjLtjtLCjAaTEwBwtl
         81/k91mK/tSPDosiwAAvRrkn9ow6IoymVVJnkKieCjjTn2ZWhF+jWH6Qqi1Ak2gtn9gC
         91+kO+hiH2Vr2kA9kLqmpDaWRmY7yNo1wqlNuCHMPmFiei3+1b0vaEUaFhDpcCoghoCq
         qDTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbzga37+SLkHNMk3e8tWdeTTDgZrUcbVuafKXpumXyjW1uYEqCGE5MOdnJPF3axAh1u2u9Hsj1vG/Bdv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDP38ZhTribZTfMnxNkQVSX8z1WgqQ/MDeKV6G7xk0jh2IegIU
	nmM1eS7PGAkfSSqOcz4XqYUyKw81Cm1tA1X9dqD4nEHsUMagMI/k7OkbFXuc5HryghdSmAiVjrr
	VtrUBTTzaGWZjXTOR0vVdz0iiVxZJgCNF5zDya8YG+lGuEApIebSzvxno09Y=
X-Gm-Gg: AYBFou09MpfCT/zGFcWFYvHZI65j45L5kV9qikvd0+JC1RaiOIVv7rA+SpHLg4u5yIg
	fWu2I47awqYVmSOQ0NiW2jlcBIlcjmKb8/gT/sNLQoSbNG/E2a2RoJ2DOojJUiB80dskk5wpw2C
	I9KTgNJyvB2q3kyvvuj6cDQjPQ21ikmILcaQiLWia1IzIA4YIK4TcYeHdfWUrVDF9Vx8vHPsJU7
	KDc3M/pYZ1x3cEjxqA3XORNxt931Mc/EcWjtz8kHBamJW5938mABeL08FxHK9cHtUxbovYyrcoj
	whLcG/yLW3HvQfVUklu5OvP36v9i+HGFwArpwf12/QnfFxnCaClbRDmal7oAl7ryeseX2Bacmbl
	9aOgPAetp87iRddZN0RmxX+ku0xgnECMzKMC9EZVWKQv/GJW+27JV00OsdIFcZGoGNmc=
X-Received: by 2002:aa7:c2d5:0:b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b3e8a7add7mr150972a12.4.1792603051505; Wed, 21 Oct 2026
 10:17:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015558.4124825-1-almasrymina@google.com> <03a741b8-f330-4d2c-9254-153934ef0960@redhat.com>
In-Reply-To: <03a741b8-f330-4d2c-9254-153934ef0960@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 Oct 2026 10:17:19 -0700
X-Gm-Features: AclHuK_EJKqmd9KTi_vMc4o-3Uq3hWi-8BHGxz9Vq_xc-8LR-KADjsUH5zxRkyM
Message-ID: <CAHS8izPfDdqb+GLJu0sSPP4ZcwJ6xk_4p5ELCkjq4o98t6GAUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] netmem: rename non-pp ref helpers to *_inc/dec_ref()
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Ralf Lici <ralf@mandelbit.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I should have said this in the cover letter, but this was intentional
Paolo. Jakub said that getting this rename in soon may be preferable
so that we don't cause churn for backports:

https://lore.kernel.org/netdev/20261020151352.794bf03b@kernel.org/

--
Thanks,
Mina

On Wed, Oct 21, 2026 at 7:09=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/21/26 03:55, Mina Almasry wrote:
> > Rename the net_iov and netmem non-page_pool reference helpers from
> > get/put_net_iov(), net_devmem_get/put_net_iov(), and get/put_netmem() t=
o
> > net_iov_inc/dec_ref(), net_devmem_net_iov_inc/dec_ref(), and
> > netmem_inc/dec_ref() to follow the object_action() naming convention.
> >
> > Use *_inc_ref() and *_dec_ref() rather than netmem_ref() because
> > netmem_ref is already the typedef for the generic network memory handle=
.
> ## Form letter - net-next-closed
>
> The merge window for Linux v7.4 has begun, and the net-next
> tree is now closed for new drivers, features, code refactoring
> and optimizations. We are currently accepting bug fixes only.
>
> Please repost when net-next reopens. There is some uncertainty
> about how long this merge window will last, so please check
> https://netdev.bots.linux.dev/net-next.html
> before reposting. net-next _may_ reopen on Nov 2nd.
>
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#=
development-cycle
>


--=20
Thanks,
Mina
