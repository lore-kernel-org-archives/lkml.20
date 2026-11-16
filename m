Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832899;
	b=zAEO1A8oPNd8nOOGaGLNhsn6S3oKy4x9Mk6oHO3x1BPCZTA/tjKo6rUQBFziTw9uV6hp
	 7Nalld8izcro4COffzaRPAXQN3gGDytTYxUhCpwjgQKKjKfI6AQL4HYq3VQcIxTjJF+Ta
	 1rUDxYofLehExB1jWBHJxzVxNkbz/dc+iY4FlKTaBvgG7samDdYPh13/nLdXHEJZnWyXf
	 XTH4qLoQhMdIbIEJXpChmfIOCJYYbqdVlWLE2KiSIp0GL2ndZOcwYw0QxWdOHRR5N3Zet
	 4nqErOCWBfJguXuCvw+rIXwoJ6geBPymvyHHRVmiPgwr5sRC7tDWD9WYn1IU/DunLqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
	b=QcBOO0K/iKNn0J8i0O/fmzQM8MF63+M/ctLoIc95r0drMwv/5IBT1oKOPDRuncr6njx/
	 FJqMW6AJreAlNuPL36qd5QiolLqNLZJpQ17Mh25dKyWTJU0kZXw0Carr3yCK0Dsqx/7vc
	 xnZvnR1PGqkh1ecPo6r8xnHmfWWbzCImOqxLtu19zfwraQwVpWEiQ55gjx1bc8tbtvCY9
	 OKWYS2XekcsHbXyToFxh+hTVjopCTKQIS8pDXtaSASsOPZyCPGuC1F0zzNnZTfdQyVKFD
	 mj5OmtEoSl0pIjmNZSgzZKGvbSocO7YhVSKpMUw2hSBuanMnxm6Lm17fvj+tq7sIm8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN3B7Lud;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xN3B7Lud
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9495f083657so323232485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832898; x=1795437698; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
        b=xN3B7LudVvKrw3MwnajaarcX91x2+u1HXG/hvHMEH3ZnHJFdDpZBBcRtAqROyBktko
         X46g4lw7rRY4EZfOp3U9VNr6Ww9uTMObjYHuKm64PuVS6VZiijyYuVGHs7X5V0C9S2sH
         x1mxiPCTUha5+oNdEVrKnYfP19epAeCiRmmWntH6obG78ytEzkwYSmqTjW3Hw4HoLh3X
         A5SxyRIs01z3DowJd6F9SfiCmRrBIb9SignCreduEbMv4AiCUejw40piWsIP9NWhlFMc
         JSmxkHyWstT7aLbb2I7brvegGr9bpfFwWSZB9k+n5CKscylv6nxsyvHA5E8qXKFV3wL4
         fvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832898; x=1795437698;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zv1d6vvRKz0euN6zrXybl1bD0UkhPFP+MSK0/brc4zE=;
        b=xNK0iAbZfp1RLhW6K4hUadvF+/jpU96vocb5JrCMgV5M205nrm4oyMxrT7UYiaqzrr
         20C7Cz/Y/jguVZuEDoRpih41m2Uh+o72HnWf4XSdAtWmyCQouk7yAAPZcv7r1ZhgU/1S
         0m31Ikm3+pM39pveem+FyBYbkkgslQy7QSrfKv9R3ZoMadZ0TRJ8K7GO1SVMoA9yp7Lz
         9grnvk5yE1/VHBSp+gqMuEJmcYUlpb7qTI23oDwuw6WbKZOjBniPPMBh5cf4UBlhNrYN
         bmPBEaePnVKuZlEv4MYiJ6XYVg0ZZLXPrlSaeo3NfDoTdTi043WhzX0pk2d+YXn6meEr
         Xttg==
X-Forwarded-Encrypted: i=1; AL+hErEAsXVORdHoHQc3GaqnOol3V8Nn2E9rLnNGwACQN/WYzCjw4tTfuWN8zaTewHkfg4c/poBGAuMwa0o79AM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YDzXcxk13SVLm4gCNm1IazuZv5z9zncjm3siEZFUZh8mNBt1b
	oZlNfzPvYnmY72jdzRPA+WpJwmpAd4Z3r1d/SU3hn5Eq2qMVLP5Up+tD
X-Gm-Gg: AYBFou0AXCMVK2Jhz2W6vErl2QHW2m+sExLrJpXZwoFnZowZVkJ4YUg3G/nZsN9heRZ
	n8LZW9/x0Ux8Jb7SuAPNGo9i0ODbNyI9hQzxEgxF3aYo7dNIVYmelz6UwamJ+2Pxw1Nv7+Cxx0X
	BBVnGx+ylGXKjn2wH5GFfv6bzTEDdwt3Fjek4b2PH8835e3m1omfvqifl5YokrygsUOwR3BJoW/
	V5kUd4pW6rTpYKV0IjUUs1y3q4V5iT1U2v5I0sy0kG0xb7oc1OHN2Zj817p7f8KXLmT6hJmci1s
	5/WrbTtWfQtr5559MvY4ZW+eUkzbHJUrCkp6ZVnXs/+mNy7ZqIT1NbP3c9coGKlbQe/+Ii7pxNt
	FFO7/pEM9xVgCviFNR1PI0WxV6bG8WaUxOkwFkNuDeff/DNYHgZ7Lg0ZFyjkNsxi9QItUuMa5G4
	g7T9Udf/H7O+JPl6LQyDtih343qd2UTimdNOHFwo/0AWaY/4aBD2pAZoPzT0jVcV97NDMNQFOpE
	zoKnvlfCToEHw6JVuj0iNbMoOmq3ZCGZLA+RVXWXOtX1hVff4HtPUbKARtVKcUrpm6MJmR7WRzX
	Fg3DGYyAlRVXAP8uVbi5hQ5jHXG+0zoJMw==
X-Received: by 2002:a05:620a:2903:b0:93c:a40d:e3cf with SMTP id af79cd13be357-9494b9c78a6mr1739169585a.1.1794832897831;
        Mon, 16 Nov 2026 04:41:37 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870ad4sm830567185a.26.2026.11.16.04.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:41:33 -0800 (PST)
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
Date: Mon, 16 Nov 2026 07:41:30 -0500
Message-Id: <DMWN5R6QVUPN.1KP7SYYHHU71U@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Daniel Zahka"
 <daniel.zahka@gmail.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "Wei Wang" <weiwan@google.com>, "Jamal
 Hadi Salim" <jhs@mojatatu.com>, "Jiri Pirko" <jiri@resnulli.us>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Sabrina Dubroca"
 <sd@queasysnail.net>, "Boris Pismenny" <borisp@nvidia.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 3/3] psp: only give time-wait sockets of PSP
 connections a validator
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261113185553.171059-1-toddfreed@meta.com>
 <20261113185553.171059-4-toddfreed@meta.com>
In-Reply-To: <20261113185553.171059-4-toddfreed@meta.com>

On Fri Nov 13, 2026 at 1:55 PM EST, Todd Freed wrote:
> psp_twsk_init() sets tw_validate_xmit_skb on TCP time-wait sockets.
> Today, that becomes set whether or not the socket has PSP offload, which
> is not needed but is harmless. psp_validate_xmit() passes such packets.
>
> But a validator makes a socket look like it has an encryption offload of
> its own. The tc psp action in the net-next series "psp: introduce
> socket-less associations" relies on the presence of the validator to
> determine whether the socket has an encryption offload.

I don't think this is relevant.

>
> Set the validator only when the socket has a PSP association with a Tx
> key, as psp_sock_set_tx_key() does for full sockets.
>
> Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  net/psp/psp_sock.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index a6b1c42dd626..1df65505f1c6 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -314,10 +314,13 @@ void psp_twsk_init(struct inet_timewait_sock *tw, c=
onst struct sock *sk)
>  {
>  	struct psp_assoc *pas =3D psp_sk_assoc(sk);
> =20
> -	if (pas)
> +	if (pas) {
>  		refcount_inc(&pas->refcnt);
> +		/* like the full socket case in psp_sock_set_tx_key() */

I'm not a fan of this kind of comment, but that's my own preference.

> +		if (pas->tx.spi)
> +			tw->tw_validate_xmit_skb =3D psp_validate_xmit;
> +	}
>  	rcu_assign_pointer(tw->psp_assoc, pas);
> -	tw->tw_validate_xmit_skb =3D psp_validate_xmit;
>  }
> =20
>  void psp_twsk_assoc_free(struct inet_timewait_sock *tw)

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
