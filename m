Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39A3806AF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204946; cv=pass; b=kaJG+FOG6deCzg42Somy4cRNQieKNqAJqC2yh4K+xG5kYsgP4eXn161kxIDusSvAbLeLtGRdLL6B2n/6/C+MJ9O2Z3u+HosMSXrBcRS8NeANOkZ0GPkh6AxK4Mq4g8REzDNb4fJlJM7Nn18/8+IU7h4QbRgsySjm2QcWdqGZUCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204946; c=relaxed/simple;
	bh=aO9zUlhZ/cIsv4TahIImjijy5eZpJLxUISCtfDgt/zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HED+w8tu6063Vd9HHE/w6HwcQpHhfsShXvzD4jD/NCzDM29eUUyFJsqRCEIYDJREke0gJcBPt7dgniNMixus2g9x6B0JbhCyi0EcF5kcmrJj5pTKe35wl/ezGNRDrz+VlEiNcyY0jOWqRPU3gMYEg/XnsCyPFPCRqGTZInKwt4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aan9x3L1; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aan9x3L1"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530de452c33so9142981cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789204943; cv=none;
        d=google.com; s=arc-20260327;
        b=Xc0SBZYjCEqPZdUClOPPTy1/dW+O1y8wRsSkZfjcXVi6mmYNhYpOaXz77jQUZSfznU
         RdNPl3wo9FcjWI+DX75imIZ5QW7uZwEuK8uDk7tHqeE8mpO5piXLPfnaDVeodTrAQbxG
         QbE9XrFfNw9L5/hvaMd9lNbpl5WkHH9LPsqvnMmiYeq9wpu1KHSCVF3/zVHqHpSD59II
         j9GqmsGsYJXstaEyGPgOiEwmeYR8aA/7bUbWNPlpSYmwV4rm2kqP1K+h+kxkCFjqzw02
         2VdnjHdu7Bw9ck9c695X2MkmPPzoLRJpgcZMZMWJUP1bogyRXjUuUa+nSMqbhNxNg3Z6
         jCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Po/KtSuUEH8MfPngI4Th6eiOf/oind2PYZNZlItxXP8=;
        fh=7gxs+OyP6CyCNHaqblNCNzMLU3dYykmu5+Gc1oFQrKI=;
        b=AJYZOtjhDU/PBsgmXwWfnUI+NOJ2AvQ5za6G3F6m07+KuZolT4RZWYkpbBpEb2xqcB
         /BiR7lJsk1BlemM34q9LzrXYIBFXq8a46qfXoBcltRQgRu9+OUxC80EvQiKO3qSMjljG
         9tTeiSQ7KKlMhDh17xZHLusnqg13sGD/hOy3bujYgx5oqNZ4wRtqqSirxelaCzTtlAD8
         qSUGmxzoKScwyvYKOUspR872KLKvK9gOfCmLOrN5WSJ573Fvz++Z8rPzAnCQtbzS063Y
         /Cdz6EZTrqjv6JEV0h1MB01wFtxA0qiQWVL1SzPfkq6pkm39Y8eTWU4S5BP/g5/bZF4t
         Sb9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789204943; x=1789809743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Po/KtSuUEH8MfPngI4Th6eiOf/oind2PYZNZlItxXP8=;
        b=Aan9x3L1Lt5oHgui16Ioup1xXWhpqxzzNO2wiUMssNcxnhXGG13f9316vSC60/ytw0
         Tnp17vAc6ly0XcjzgytE0uxOjpeEu0RERMMIWn7x4iDgmOS7q/vqpVyY4HZVYtCFQg88
         9k2OcIS6j6Euv2kVxq+jn1v8sQl+T8azF0stGteBQ2ppEsYMFlWUeHi7F89Mp6hYolPu
         t13BGKo9rgnCb0iSQTewddHGq9OdNmnszSnIqvhR/WyDrV6MLvWmSYZKuyi2eMPj7fMT
         /8LE+1K/fOMkWsC6WB2FMaTnBOnhWvWRwWJWKVOnxZ++kxGZcYStPXLkCvpUHcmI6VEb
         RJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204943; x=1789809743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Po/KtSuUEH8MfPngI4Th6eiOf/oind2PYZNZlItxXP8=;
        b=ZinBVQLnFJCiQYUyLV2WjIi1t4SX3jA7o384CN78vVDeBpIYFw4Y71TgQYCiKO656I
         kNJuM7MVR51u1IgsW04ElhQ+Pp9fD7emaS+UjGUakogA4sSxPFcoFfLe6HNQ6CglJwTU
         eLbM6AiRWkLXUVlf9+d8M9YA6rIRJxCvIyO5xMFGMKf2lyUW0ZIs8HrOk7TWtF4ykBzC
         qBbQkS5me8oUitn4Nyr/s0s52IywdMgOLFVA6s8tiY/jx7udbEW2IM3oANSbUKRen8QX
         NfwDaKANUOrN5wuwYQAGXcMdAr8xQ3/3PgYmapLSeUDDk12+myXe85x4NGA9PzViC1Zd
         ZYwQ==
X-Forwarded-Encrypted: i=1; AKwUvByLWZtyRzYZGdFkTTcu7fJC3LmwyPaYUcENfl/88BR741nA52OJV+eosEDqm9UMAnMHsBdgDv7j2hg2TFs=@vger.kernel.org
X-Gm-Message-State: AFuF++lIktH0dY0AzIWJvghTBcwkjXihJsk02rDNuesnbmn8LzeRU6ei
	SfV4zdyMMCZy+nLuSBM3mlXxObIe9PgLjhf4kf+FC8p/cgSeMOSS8EyZpc325sNaCFDeVB5BYp8
	xfZ/lFa2B5OT7NGzIKrGCanGilt5mN/tnipMhwTlE
X-Gm-Gg: AYBFou3+IrCU6AHH08TrMoxfTyblvBy7Tm0xlPTJPlc9+jNPYt/QRcU6eaXp5+3fNEx
	2gSp30Rv58w2FOoqQf0owSTCCGxha8qlbNj/hcAHt7OqUMr1JiW1Os9JvXy5cYxfrHzDcrnJRlW
	XeWhUlD+etv395v9XmcQnoVLl7t7ll+qsVMCCcQ1qxUC6YLBp51sQGFrYdh2vEGwMTvuU/VyADe
	sxCxw/1j0IaLv5usEDGHw2aY/GXikdgeWUglUlPFgVB2GTLQbREgBaMYmmVQM4LG7dFR0Ga2jDm
	wrnopes4u7y+b+QP1zciyq41cdSCd07ap2ZdEJ2sVaKHx8pcPt5iJbA7dwONLDfRxWqd1k5NB50
	zf2tJrf7ieg9iKP7Lw7WrWDYrBYpolk5tm4Ya2hrUug7SePNxGQNGF1CXDWC/EpZA64s=
X-Received: by 2002:a05:622a:13d4:b0:530:e080:93be with SMTP id
 d75a77b69052e-530e0809981mr66816991cf.46.1789204942535; Sat, 12 Sep 2026
 02:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912055304.1415016-1-cnfourt@gmail.com>
In-Reply-To: <20260912055304.1415016-1-cnfourt@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 12 Sep 2026 02:22:11 -0700
X-Gm-Features: AcwNN1V9Y4R_ylpJWfxtuU1JoTDq0Gs2lcrzQUAf6_3bVo65JvmOfd5F0cefuwQ
Message-ID: <CANn89iKk2smjZ5OVJGQBw+F1KJ8DDdfMUmquSKAUq16rMcHg8A@mail.gmail.com>
Subject: Re: [PATCH] net: ip_tunnel: initialize `options_len` before
 referencing options
To: Gris Ge <cnfourt@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>, 
	Kees Cook <kees@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	"open list:NETWORKING [IPv4/IPv6]" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:53=E2=80=AFPM Gris Ge <cnfourt@gmail.com> wrote:
>
> The following command triggers a kernel panic:
>
>   ip link add d0 type dummy; ip link set d0 up
>   ip route add 10.30.0.0/16 \
>     encap ip id 300 geneve_opts 4660:66:11223344 dev d0
>
>   memcpy: detected buffer overflow: 4 byte write of buffer size 0
>   kernel BUG at lib/string_helpers.c:1044!
>   ...
>   ip_tun_parse_opts.part.0.cold+0x10/0x10
>   ip_tun_build_state+0x116/0x2a0
>
> On kernels built with GCC 15+ and `CONFIG_FORTIFY_SOURCE`, the fortified
> `memcpy()` got 0 sized destination with request of 4 bytes length:
>
>   static int ip_tun_parse_opts_geneve(...)
>   {
>       ...
>       attr =3D tb[LWTUNNEL_IP_OPT_GENEVE_DATA];
>       data_len =3D nla_len(attr); /* =3D=3D 4 */
>
>       struct geneve_opt *opt =3D ip_tunnel_info_opts(info) + opts_len;
>       memcpy(opt->opt_data, nla_data(attr), data_len);
>       /*     ^^^^^^^^^^^^^ 0 since options_len is assigned afterwards */
>
> Fixed by initializing the counter before the options are referenced
> matching what `ip_tunnel_info_opts_set()` already does
>
> Fixes: bb5e62f2d547 ("net: Add options as a flexible array to struct ip_t=
unnel_info")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gris Ge <cnfourt@gmail.com>
> ---
>  net/ipv4/ip_tunnel_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
> index 5168d546ea2f..8fb4742aca92 100644
> --- a/net/ipv4/ip_tunnel_core.c
> +++ b/net/ipv4/ip_tunnel_core.c
> @@ -711,6 +711,7 @@ static int ip_tun_build_state(struct net *net, struct=
 nlattr *attr,
>         new_state->type =3D LWTUNNEL_ENCAP_IP;
>
>         tun_info =3D lwt_tun_info(new_state);
> +       tun_info->options_len =3D opt_len;
>
>         err =3D ip_tun_set_opts(tb[LWTUNNEL_IP_OPTS], tun_info, extack);
>         if (err < 0) {
> @@ -753,7 +754,6 @@ static int ip_tun_build_state(struct net *net, struct=
 nlattr *attr,
>         }
>
>         tun_info->mode =3D IP_TUNNEL_INFO_TX;
> -       tun_info->options_len =3D opt_len;
>
>         *ts =3D new_state;
>
> @@ -1005,6 +1005,7 @@ static int ip6_tun_build_state(struct net *net, str=
uct nlattr *attr,
>         new_state->type =3D LWTUNNEL_ENCAP_IP6;
>
>         tun_info =3D lwt_tun_info(new_state);
> +       tun_info->options_len =3D opt_len;
>
>         err =3D ip_tun_set_opts(tb[LWTUNNEL_IP6_OPTS], tun_info, extack);
>         if (err < 0) {
> @@ -1040,7 +1041,6 @@ static int ip6_tun_build_state(struct net *net, str=
uct nlattr *attr,
>         }
>
>         tun_info->mode =3D IP_TUNNEL_INFO_TX | IP_TUNNEL_INFO_IPV6;
> -       tun_info->options_len =3D opt_len;
>
>         *ts =3D new_state;
>
> --
> 2.55.0

You forgot a 'net' in [PATCH net] . Please read
Documentation/process/maintainer-netdev.rst

Looks good, but please add a comment on the assignment stating
it must precede the option parsing, otherwise a future cleanup might move
it back down?

Or maybe use something similar than tunnel_key_opts_set() in
net/sched/act_tunnel_key.c
for consistency.
