Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089734750F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680854; cv=pass; b=CXVNp4Fdd6vy2mYCTbubD1euv5eaCs8MvFgcLUyWhfn2n4kesJVYb9+FOasxDUlbfBFht8S2yfxtM+WS/xueTMBzMpXfnCOfsGer7fM+BZ8vqckpq4+aA10vr2I/3yghxw1SU9e7Bp7TvH4LQnHj7xEm0QstFc0EDh0KxQhTxqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680854; c=relaxed/simple;
	bh=QmosLt4Exr3yd3+DbuV4sKo0M0/L5NTz2CezfpDi4X4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsSC+6H1k1VBnGu3MthozwEbVPdMfgsoXwIl1GBk6J6ZtoQDt3S9GvJFjOIkhPgLW60ahpmHCAVtueFeQCB1x0pCEq/cvKXv+qOK/R07ON3Dqboz8ffOXfSf/3lrJGBZNbAX91a8KnKPYO6OtKfPRxxLZ5CNe08GdRn3nWRtpUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7a8/nrW; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7a8/nrW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c253425b253so341188966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788680851; cv=none;
        d=google.com; s=arc-20260327;
        b=J/kO9Pc9isFZYYbN7FLPH2F+nhsfltZJQr+R1aN7KrJFf8JcIoY5kLf+bP6UF+7bS2
         rGiR5teF348WwOyi42pt1eXSIkevmOM7BoWesY4c+BtXkeP7VoBY6ohq7TGgLAmPZOCd
         GxMUi0YQ3+qlb7/b3V1hzqsIKH5JWp0j2JtPE2GimHvtuPVE+IGFZClGqJ61KXXdSTOc
         0It0V48tewtIfkrg3VWRx5kmeIIbGzEx6dsw3dcyvJaoohsSrl22RglcG6rzq7USgCcf
         6MuzjG9t9eQp9Rr51uqYDXL1MI/F+1BANZ2k+KT+AzAWz+B8NRdj1lNcc49LrZbgJj65
         juEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JYM+LSAut5hPxwG+oopMKaaGaGA8Dp7pKYI7iVo/2Q=;
        fh=qrUlhJVgELOfmSvZ35wG/9A7xb/cPprJeOLezLE/aaQ=;
        b=dYyxHAjlyxDMDA58y7YtzsfSfsNxUUlGYrEDJWxsgdFhKz+qE3YBqpBlo0CvMfOvgs
         yKexEG+HvzG4j2LYdfiQMwsT5sK6U75IZnDQrOE3z7UiYLm0pmrknwPNlhAOH8SbVpot
         0mOZ6NW5rjh0cbbToliPEHe4u77osYOFaBYukiOGH4xNkqnYLG4sEnkljgz8HXABjeYM
         0LBgOeNINcI3zhsQMk89JmGNBdvfL3YYeMvN0TV6RxkbJ8NqezzX/S2JQzL6Ax5LhJH3
         1KOsOLZJ0zPgjVZNTE+1NPm5Pjy86bdAOGyZ1wBcvDXty/ihMaj7kFien1kJTNPFXISk
         ovMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788680851; x=1789285651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JYM+LSAut5hPxwG+oopMKaaGaGA8Dp7pKYI7iVo/2Q=;
        b=q7a8/nrW36aexVJmCqPdyS/bSc1UHO/soq5bIxxh+GY5BC+ZaJInexvOEnLY1FtMfn
         54wlteELOVhjGTkvuqxVhOz9306jHFQSxrhH09hIBLbUHKmxdJVGYxcTaZ1hFRX7cVz5
         +GCVb9YaZWO0O28nXCe9NA3NCXw0U6XGnmPpuz37LpmW5eshW6dfKBEq2BSLKRKUdiI+
         1iYBZ3NuCazcg2BmBlCAvbMX6c880EFWjsG9+fiqFZSIOppr2JtSTAhTuYnHuB0CVnB7
         zsQutyx0ED4MrSAee9JA3IoCDhyfpS3lHDawqQ8lcC3p0xDMeSbTYHMQbdq3aIIzbLyU
         9LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788680851; x=1789285651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JYM+LSAut5hPxwG+oopMKaaGaGA8Dp7pKYI7iVo/2Q=;
        b=bXDkSzyddK9eBQ1hIaFFI+2xNK7Enzt53KTQnYZUHdyfVVz/FyNcmKACGvNPQOaAX5
         C/0Lc1/Ylltgnyoa1a3f9P72uUDbHeCz1RUqF8hm203xhzZnNDpLWxaBifViiKzRiNuz
         qgOBQFtD3yyzHxD55T53DoH3seprCmDFtmsCLSdfJJx2su4mXFDeZpk2uCj6VO3xELhL
         dT0IFvkTXdnOnfTb0N1mEPoEvfgzYHFx7cFsq4edkYxSfTB47laNDqO06WhV7uzFB1Ys
         Yviap9QaG8hoFjYP0CgKKVOM87njkqAOPmK/pwaDzw9clR9ugL7Jt1g1jOuuyha42bxE
         1yuA==
X-Forwarded-Encrypted: i=1; AKwUvBx4ta67Xks90D60/hukUjXf8aQP8MAz3kwQM7vOYfIS4JkZuYhUjwd+TIoGcgoqKJL2OHLeLV7uUCnzx1U=@vger.kernel.org
X-Gm-Message-State: AFuF++mm9LAz2NunRojNPVupE6O0brIOsYdYSI9k0Q8aH5qM3GV8mgy3
	560l7wRihzt3xctrB6pliD1qo3mx0+BTrPKp7PxO4yMwL41KHNx5Nk+NMNQBjhaRRUuOZPlPIU7
	NbPEHAQspjGS/fVn69qEUmD2HVV/8hUM=
X-Gm-Gg: AYBFou1KyazqRzJGPzQhDhyt/MG8GhihycAWu4jhsW6zwKYg4ojqG/XgDelxLCj0XMG
	jXPnVRorsH7WZfMaQQI3SirbXju/zG8dybu2rRUNIihTMOM5vTkPpZb1h8xkbD2oaxCaf0J5iOv
	1VlSEHU3mp7tzGw5pubC3a8tpKl41McMZkOvkIKqDKn4CVgvhb+TaTNOs4+qPySKqyG67QexycM
	v1xtEx+A6kRrT3aPM3OQWNWyd2HXzCTYw7wO0jvlPFuVktSggbGF/DRXptuJZ05go88/Mv4tLib
	J060ptmHeUtLzKvTYsgD/CIpDSsiPw/OdZmLeMrkcwV1eKoE1EdYQLZotJCkTJmWx2bP6MoRA+K
	7tw==
X-Received: by 2002:a17:907:3d44:b0:c27:420b:7c90 with SMTP id
 a640c23a62f3a-c27420ba0camr143467366b.48.1788680851220; Sun, 06 Sep 2026
 00:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906034939.3746540-1-bestswngs@gmail.com> <apzpbMAdqSa_SkEx@strlen.de>
In-Reply-To: <apzpbMAdqSa_SkEx@strlen.de>
From: Weiming Shi <bestswngs@gmail.com>
Date: Sun, 6 Sep 2026 15:46:54 +0800
X-Gm-Features: AcwNN1UgO9RFEYZ29bttWZXxvvnUa5xtH-e-azRguJk4JvDmub9GiasshRFPr7o
Message-ID: <CANgPUi13MqJ41Rt23zXARUp2UW6K20TJkSbmSEhj7dpmfCsGEA@mail.gmail.com>
Subject: Re: [PATCH nf] netfilter: ip6t_rpfilter: handle routes without inet6_dev
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+459f67f4d8af8ce6@bugs.sh, Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Florian Westphal <fw@strlen.de> =E4=BA=8E2026=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E6=97=A5 12:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Weiming Shi <bestswngs@gmail.com> wrote:
> > ip6_route_lookup() can return an error-free route whose rt6i_idev is
> > NULL.  For example, lowering an external nexthop device's MTU below
> > IPV6_MIN_MTU tears down its inet6_dev while fib6_ifdown() leaves routes
> > using nexthop objects in the FIB.
> >
> > rpfilter_lookup_reverse6() dereferences rt6i_idev before evaluating its
> > loose-mode condition.  This lets an unprivileged user with a private us=
er
> > and network namespace trigger a NULL pointer dereference:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >   0xdffffc0000000000
> >   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007=
]
> >   RIP: rpfilter_mt
> >   ip6t_do_table
> >   nf_hook_slow
> >   ipv6_rcv
> >   process_backlog
> >   net_rx_action
> >   handle_softirqs
> >
> > Evaluate loose mode first because route existence is sufficient there.
> > In strict mode, compare devices only when the route has an inet6_dev.
>
> I don't think we should treat rt->rt6i_idev =3D=3D NULL as an eligible
> result, even in loose mode. Maybe this instead?
>
> diff --git a/net/ipv6/netfilter/ip6t_rpfilter.c b/net/ipv6/netfilter/ip6t=
_rpfilter.c
> --- a/net/ipv6/netfilter/ip6t_rpfilter.c
> +++ b/net/ipv6/netfilter/ip6t_rpfilter.c
> @@ -61,7 +61,7 @@ static bool rpfilter_lookup_reverse6(struct net *net, c=
onst struct sk_buff *skb,
>                 fl6.flowi6_oif =3D dev->ifindex;
>
>         rt =3D (void *)ip6_route_lookup(net, &fl6, skb, lookup_flags);
> -       if (rt->dst.error)
> +       if (rt->dst.error || !rt->rt6i_idev)
>                 goto out;
>
>         if (rt->rt6i_flags & (RTF_REJECT|RTF_ANYCAST))
>
>

 Thanks, agreed. v2 will be sent.
