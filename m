Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711132;
	b=ClUpd2ZZMNA7KJd4zCsyEsAO0IUhVFGBflY0b1tDbA855xjfpJoVg10ZNh6mx4YyL7ux
	 cu4TCJV2YmXM6UbqvPeum3tvkKlyuuag/lOAuTMypRZzJzF4l0tCjI6T2OyuOnfJ6aVI4
	 HKRCc36INGwqyN58zNOn06AKVkDkhpdDTCvOlsOUFJKEGlPXoGuBEV1FVpO47rjobaS+D
	 gJQX+xxV39WUNg9VVnlvokdPOrJotU8aAPNthHTZvSNvyKmv6e6K8V6YMlYszvhb3LHci
	 XjIaJEttq6dvrGAZH9ovlh2FZvaapbC8y3ugfnjVMaKY32Dpht9lRwbgQgMCP7C1sGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711132;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5G2U21klRa6bS/WuYbdKcyXo8Ne1lDiDAh1zG2l5QTA=;
	b=oRZj9yAHzzNoVkhgnQWAr2xDNiuQZ7NGkFFYj7SyvLKfS5n7qMW44EColjHVym8ZOVJC
	 BJ/PxV/7K3ck6z4eVa+kDooByw3xJoXhgGD88+Wq7fXZUVhMHOENl2PGM8NgNKJAgkA0R
	 dM0EsdZoQ8bqKbZhQlqkLlzWOv+oVcbnOJSwfr54dBecY7aWiDs4sicDI57tm8lUhrKhL
	 wcYDUQX9Act/MQr52NUmO8swyRrsL/bjiLoWLHjCEHJQ0Cb2dYtv4Srg539sycDNejBYb
	 RGidP1vvQJHRzipodxLNu6Fe5S267Us6bfD5luXr/2mowbCrsexjfUwzZD1qrp2eyFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GanND/y/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E1606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GanND/y/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C151F00A1E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711131;
	bh=5G2U21klRa6bS/WuYbdKcyXo8Ne1lDiDAh1zG2l5QTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GanND/y/SbfPpRIHv1sS6NJJzV466INwqASwl/mdcOP245Xg2gmebhiHmG6Ukxdgq
	 FauuMbZU+MEjNLs8Jr1UGx59VL/GorW9bHVNv9cX+WSzsxsRmE699k+6/5L5+wVwsb
	 SrSyFEZk3n8A7/WP09z4rQtHqtzgQWiNJb0FNbGWUU6yzaaOFLu5RV+0nXP0XuSjdm
	 Edk+ZRYel3jWcmIO6BRaxT85U/88h0C56T3pPp63d2EeyO5sMxtTiFYxKJCHzwtTr1
	 G49PSh031fDeT5R4M7v3lQvIWXAcxch/cgmwptMQOxst8KA2BxOWXr3Rxx/L3UjWI1
	 WCaKpGuZTWujQ==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-490d838b425so2432380fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:05:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwAkK0enby62YvbhyCggbf4iQlvsiyplGEBG8izPPW88IsMKe7WaRovny33XH4SCuUNaQ6G10V73eAZl9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cG6JlGrVVsp+SxPM85weRS4PMfWalFL7Mm1M3LCLnFHCmbfoV
	3EA4V9m4Sf3+tD7UFHTba/EZpndYqf1X50gC2dYKOGmFIuvGbr1zm2Am4smezoc2ZsQRBJBHZe9
	5TG3NHoe7igIJGKy41g4HAeAz74+L8DE=
X-Received: by 2002:a05:6870:b3ee:b0:49d:ff8c:205e with SMTP id
 586e51a60fabf-4a9076f98femr7400533fac.29.1793711131109; Tue, 03 Nov 2026
 05:05:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792838740.git.julius@bairaktaris.de> <b27640960edcb8e072fdd2e8d282c1deee747b8a.1792838740.git.julius@bairaktaris.de>
 <20261103124346.GJ865646@horms.kernel.org>
In-Reply-To: <20261103124346.GJ865646@horms.kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 3 Nov 2026 14:05:19 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq46pgkuy3KRQsa4MWsa_XXOozggwc99ymr_2VPfry0RQ@mail.gmail.com>
X-Gm-Features: AclHuK_3GVdIdupsfLo9PLF7Zsk-VOT8s8u3_nPLqcTZx17uLr-LX-xxpRUnjLk
Message-ID: <CAL4Wiiq46pgkuy3KRQsa4MWsa_XXOozggwc99ymr_2VPfry0RQ@mail.gmail.com>
Subject: Re: [PATCH net v4 1/4] net: make room for the tunnel header in skb_segment_list()
To: Simon Horman <horms@kernel.org>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org, dsahern@kernel.org, 
	idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	steffen.klassert@secunet.com, willemb@google.com, jiayuan.chen@linux.dev, 
	mfleming@cloudflare.com, almasrymina@google.com, bigeasy@linutronix.de, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 3 nov. 2026 =C3=A0 13:43, Simon Horman <horms@kernel.org> a =C3=A9c=
rit :
>
> On Sun, Nov 01, 2026 at 05:42:29PM +0100, Julius Bairaktaris wrote:
> > skb_segment_list() pushes each frag_list member back to the outer MAC
> > header and copies the tunnel headers in front of it, but never checks
> > that the member has the headroom. A fraglist GRO packet forwarded into
> > a tunnel and segmented in software then hits skb_under_panic() on IPIP,
> > and on VXLAN the copy writes before the member's head (KASAN:
> > slab-out-of-bounds write in skb_segment_list()).
> >
> > Call skb_cow_head() on each member before pushing it.
> >
> > Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks!
