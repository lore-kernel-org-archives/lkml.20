Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711292;
	b=W4w8iabcpBbu1ZVpgMVabE+kFUkpBfj76dVQSBqHkPCUf44GAt4O3mhqbobMcTX/CiZT
	 Etly72UnDtkvbAyGMgm5td20M7yrL55z9wK7Uu6aX0YqdC9lrs5usvcenAffCyeieKOMT
	 mIS0HzwuunqX/Xxf7/3Rm/qsHMlnRs6fzBgDxve5oZOco/21OnpC6hdbDuNXJYG116/kT
	 ms/PBGNY9ScZRClPYLPtXxfXaK0b1it7LE9LtlQYj3ksExgqvlfuSQeDijJNljyz6KGJN
	 pBKovZ3V3N5pDL2LOLhQdozhcoMvr3cFI3e/vbjZZKNbtjDhtm7aoJRhWA4yIkS6NvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711292;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9G2Juop9m4yYRvSwrC6ILNCsmsnKaKioHaaLbaf4ZaY=;
	b=ZKw+TYybqy0PyF89gfZGfSCDSs9j0tTnYG4a48jTkstW7/OBBKsQfQx6S8StImdhAseK
	 k+a6VPSt45bMtYV8KytrS01YHCSIKbSE6EExPkaJvZ9VsIg5iW8OyKOmJ7rTCbmunYs32
	 PWjcOUG/r7YA2mQSIY6qvExLPw28dZqRJhDEHfLIdHZ8wC6C/y32BvXuMymHG/g2Vctul
	 4gyYlvm6iu18MAsWiyf1rXy4S0GKFLGTuXuQk9EfNGB7LIjNyJYNwmlYv7NUgv3tO79AP
	 Zb9vaffCUF+OTdqyU3oMqE9dyq8HVP/2Og2XNCbkociR5oZRq4IJzrl+U4tIQffbaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiiSDd0d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B58C60850A9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fiiSDd0d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295291F00A1E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711292;
	bh=9G2Juop9m4yYRvSwrC6ILNCsmsnKaKioHaaLbaf4ZaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fiiSDd0dNMWI2HxljcQ049PEevntMnzLhtPIAyW1iy8DiP9Hrhr8VMzahcZsuWy4u
	 jnSKcdKTgVA+YWEHeevmTy+aD3wyWGyV8yx5h9ABQO4CMZBXIQdDKWCIHbJY4ixXtn
	 BQtbaGpqpxcuqB4CeShIXKlJkgx00SnqWCb7Ppp5jJIdWscS/CqM9x723WEpBUqD9U
	 GlobWxbxr4SRHADSYNuNOSp7YhG8tvVNuYbdi2Mv1y/IlJK8vQNZ6i2TAGtPb0WJfz
	 IaHpwaCMFiE5M+exSs0mbxzpGdsGdzk8xxMHFqOEjiyHJCgEba6AYmmwKISh/PSwEX
	 Dg8VjJJqstLjg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49ddddefadbso1850015fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByq7s4IJ4jLp0/Ljt1V0CrNBuLTxoqOOOqIbdT3S2/CIwK8uPZAlblwyaonRKkEGqF3r8YEwH3qLEGpERs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XBTak6JtPrs8jNoF9hEIrXhZr2mwW5rze3XzDYxSpmdJyqYfI
	HxznawE3iYh1PL5bcex4dmH2MwXmhFjckHfp8N9DdQ6ZUzY5C4a78KWaN9naZSNa7AtuEiAOHMS
	fT8/+wsEVuA213G6R0NO7phAjIREM5FQ=
X-Received: by 2002:a05:6870:9694:b0:485:d31b:7767 with SMTP id
 586e51a60fabf-4a9077462c9mr8289053fac.37.1793711291506; Tue, 03 Nov 2026
 05:08:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792838740.git.julius@bairaktaris.de> <7b6a12fbe0853f7faf2987610e25957d2017bd54.1792838740.git.julius@bairaktaris.de>
 <20261103124400.GK865646@horms.kernel.org>
In-Reply-To: <20261103124400.GK865646@horms.kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 3 Nov 2026 14:08:00 +0100
X-Gmail-Original-Message-ID: <CAL4WiipAgQ06hBJ-bXQ-tj5XY595RWci+kf+Dd5+wJckY9O+Cw@mail.gmail.com>
X-Gm-Features: AclHuK8t-8Y9DTLhyYrs294XEo10Oog3RUVjzkCkQh2uqbx6hyfW-H1A0CmrDq4
Message-ID: <CAL4WiipAgQ06hBJ-bXQ-tj5XY595RWci+kf+Dd5+wJckY9O+Cw@mail.gmail.com>
Subject: Re: [PATCH net v4 2/4] net: gso: count the inner UDP header of
 encapsulated UDP GSO packets
To: Simon Horman <horms@kernel.org>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org, dsahern@kernel.org, 
	idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	steffen.klassert@secunet.com, willemb@google.com, jiayuan.chen@linux.dev, 
	mfleming@cloudflare.com, almasrymina@google.com, bigeasy@linutronix.de, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 3 nov. 2026 =C3=A0 13:44, Simon Horman <horms@kernel.org> a =C3=A9c=
rit :
>
> On Sun, Nov 01, 2026 at 05:42:30PM +0100, Julius Bairaktaris wrote:
> > skb_gso_transport_seglen() adds the inner TCP header length for an
> > encapsulated GSO packet, but not the inner UDP header for
> > SKB_GSO_UDP_L4, whose gso_size covers the payload only. Every segment
> > of a UDP GSO packet in a UDP tunnel, built by UDP GRO behind a tunnel
> > socket or sent with UDP_SEGMENT over VXLAN, is counted 8 bytes short.
> > ip_forward() and ip_finish_output_gso() then let DF segments that
> > exceed the MTU by up to 8 bytes leave unfragmented.
> >
> > Add the inner UDP header as the unencapsulated branch does.
> >
> > Fixes: ee80d1ebe5ba ("udp: add udp gso")
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
