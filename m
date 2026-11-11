Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397061;
	b=bb5OIwXGUKlkyGfFdUEoGd8K8Vv8eJHJW2lJvmY8P65eWJeeQRt04JYISXkuuE52Xwev
	 Z9SKjfCA1e3kpwtBH5O7jwV+dEoJ5bT4rNu9HSduKrOWFiYoqa0i6SGRAuF2w9EsINm4w
	 8yRiqC98aUw2AIQM7wbYVvDsWLUAYjalzhPoQvbtShynvb3aJMhH/IArtJx2Aa+bdr7Pv
	 nChZh3odfnzzMUi9dIHh2iDLnWeLqPuNgBU6jzbhgrzkxkLjIMfwCgIyLPLY7Td2rPehy
	 1UlYXlA0tlG6TV22vzGY0WJ2Sf4CIphAHXGFAj8DqGfzOXWpv6NsvgoeRHADpBbiFWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
	b=AlQeCfB/mXc38dsyaf511j3KCeZn2naU9wNPzHakO6cOZ7NGkusLG6qQg7mJbOhQbhDf
	 JftiLCIh7dbRp372IC4PXnxcljRj1POR4qV0Gew5Yv34tjuCzZKAg7f92bjwZu4bck9hE
	 Cv48wMrzd5mSLuEhl/37vCF8Lt4Wk9CRLNU/vqADQVZA8OWMu8bGqw9zwtK0eupJwCf1T
	 HwicN5JcApisfqjDntlbySX8Z3sU/qPLJ+s9DwKASP/SmwcHWr7tHjtsgqJyIjrspzdcX
	 8xQsQTwnMLUB3VswVGqxYc+CNGPeFAQb7mMdshejG4kMI+37x2Ynh24tVYRwmrLHctQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlC5Gblx;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CA606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0CA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlC5Gblx
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f22a8515eso249513585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397060; x=1795001860; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
        b=BlC5GblxeuC6mh7E5mlcHWaa6FbwL7M5zsHQyzNo0ElWDR1HAb/10OXHf4NPTjJrYZ
         28qVLgXYI0cEYMl1lacrKBU6nz6AUicANfMZJzE7tO5nUNNb/YLGhvSTEHQIGzEOAuHd
         nVuqyNnNQTSTYCKjeMB9T9GmTGazkGf9pwsNZ07qbwteqNGC2d7g3SsUnHMTDJ/U9yLA
         UNk/kC7bqqiC/S3ciUXpdExCDcSYSMdftZTBSKD4owXddH4eUYyHOmIyppHH6JwIk37s
         OAcw2gv8gQOn9dcZudYcQ7SMmXcsyH1a+VEFKbwnhezz+4FwBTNzgzrVoz9I0rpjutiu
         fZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397060; x=1795001860;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWmJbLCR3Z0PWF883WQy0SlXPcx6C4wxGpgsQpGnChg=;
        b=C/6S03Wj90M+e9dpbUZvMG5FBEcXjccBjWeOmtWe9tea1nSaMMXs9N/pVzGP3dlVFf
         EQJAE/SKjL7UkzJlive6gEGO3IR5d3z05lDue1a2RiW8L6/KLd2PKT9u9aDpOyTb0uBl
         dYKDW8BgJV/k+xNxmAGR0yYelIuyzDrBEz3me084YRqO4zo2leSGp6Lu7+rT+AZdfqMv
         7TK96BmulJo7w241cObrKF4GJvrSWywk23upireVDnf8V9Z1c4vaNHYa4E4SPeO5dV1t
         L8ES4UjozK1z0/sMly4DzQVYx1ttcA0Dci2xiyiCXeLuvs/v4Thq557Ks1jnbREMLQ9x
         PPFw==
X-Forwarded-Encrypted: i=1; AL+hErHTBPuDMz0VxjRmXiadYVKk//NgLCQPnYL5+8B+OimyJWZ1zxx88pG4noMGMzS9YWKDiGKTJs2q4NPhdjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iloi5df+oax73pRgkkDEfY+f7ZJftvgK9LpLzdUgeUJujZ/Nk
	VoKASqtuoUSZjmgbeFJrNuLv9VHTLeekkxXLft1o3L83K3Wjdlz6glPq
X-Gm-Gg: AYBFou1K6lym8FwxEuX+VEhAfbc/VtcRjsSooGTF1QdiJcljXqXNsvTkOZmYG++xUwQ
	eeuEmfX7FNz4TnM/FxUNXKvBpIr5lwKbg+v37DI6h+kDjmwczyeSyCnUb69hFL9XQ4nDcfJPsLk
	jroIq2A0iZ4mvFXPo+bI15KrOyzKzpoK/ZaB787lfWHBX6AduqCBDChiJAmXv9HPYQOxcDYEq9M
	uS6xnIFkaVFQYbYVfvcfQrzVZJEayiXeT+7MZanIyFKqjFebO4ZaC7a0Ntfi6xnmFh0Fl7coC96
	+XvCQvEUxDwk6dSukddNxSD+4/B6P/Yrjwkr/JbVYE6LxDcXYbY/I4Sa4SadpgQrLkWHCpcdL6o
	3hBfUBtg17Sx3KzOKoOd0Zf8x4Ws+oZhCkaSprMJ/SRzE2Tm5QkHp5se1rJdsfKEmqhzX4SCo2S
	eivNMi5PTCTa+m0AAIrCG9nUGSF/MIe6sZjrRbDZ9tbsk7hwc+XY7PfhUWKeix/QuHfiI9/xCAG
	RT010bfMWwLByhswrm00zrPgzST1n9cjDzhrJvDU8Tk4apmKpJdv0sJJvBum6f/PmKwjutTnO2j
	gM/lFQpeSFjPUempW97ith9T3+/hYQRlE4yDMbyNvQYfaZvXykQM2I8=
X-Received: by 2002:a05:620a:4444:b0:93f:3e45:a419 with SMTP id af79cd13be357-947b002af5bmr318209785a.38.1794397060199;
        Wed, 11 Nov 2026 03:37:40 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7dc398sm462686385a.35.2026.11.11.03.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:37:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 06:37:38 -0500
Message-Id: <DMSCO4I434TK.15MMEZI0V4UZR@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Donald
 Hunter" <donald.hunter@gmail.com>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Jiri Pirko" <jiri@resnulli.us>, "John Fastabend"
 <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of
 psp connections a validator
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
 <20261111005533.6436-9-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-9-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> psp_twsk_init() sets tw_validate_xmit_skb on tcp time-wait sockets.
> today, that becomes set whether or not the socket has psp offload, which
> is not needed but is harmless. psp_validate_xmit() passes such packets.
>

This can get sent as a standalone patch. I would probably tag it as a
fix too, even though it is benign. I can't remember why we (I) didn't
put the validation hook under the branch, but looking at it now, it just
looks like a bug.

> but a validator makes a socket look like it has an encryption offload of
> its own, and the tc psp action, added in the next patch, relies on that:
> encap refuses the packets of such a socket, and sk_validate_xmit_skb()
> drops a packet with a psp association whose socket has a validator.
>
> set the validator only when the socket has a psp association.
>
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  net/psp/psp_sock.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index 609b06c7af65..664955bfb4fd 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -330,10 +330,14 @@ void psp_twsk_init(struct inet_timewait_sock *tw, c=
onst struct sock *sk)
>  {
>  	struct psp_assoc *pas =3D psp_sk_assoc(sk);
> =20
> -	if (pas)
> +	if (pas) {
>  		refcount_inc(&pas->refcnt);
> +		/* Only for PSP connections: a validator makes the socket
> +		 * look like it has an encryption offload of its own
> +		 */

comment nit: for my taste, having a comment that starts with "Only for
PSP connections:" two lines under an if (pas) branch feels unnecessary.

> +		tw->tw_validate_xmit_skb =3D psp_validate_xmit;
> +	}
>  	rcu_assign_pointer(tw->psp_assoc, pas);
> -	tw->tw_validate_xmit_skb =3D psp_validate_xmit;
>  }
> =20
>  void psp_twsk_assoc_free(struct inet_timewait_sock *tw)

