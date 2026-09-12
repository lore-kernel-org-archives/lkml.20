Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64C3612F6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198949; cv=pass; b=jjD1BcJjFlZ33CZGML12i2oLDjDSWsoJjJJkxNb8OQSzvghyYA4UO0/S5qLXMJrwxSFDDSAM/0hGv7FwnFx7ltY3B8QgIbkiD9N4K4SfFJPX1ZUZkr09dC+iBXBdu5PZVDJ/VwpewtvM1OX8o4Ah+pINugLipOpIiz+bLgVuUWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198949; c=relaxed/simple;
	bh=WRqQjY0nqBY7Sg3i9roQRCJWKcirMX5AO+S0jXiSkBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ona5B9DQcYUVgQpJVG/wT+uJrqfCz2H9gr5mpA8/coUL8NqFs1Dbsf2PaonaG7ge78mCKsrejXjStIg9G2n5YufAWlEPmBoXUuiClGvwt287SQZYEe3QGthkTNpt9IiYJfhPA5rFlMz0pCv3V3bOGBympBelct5BWqhStQK5biU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=K2ha96Vg; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="K2ha96Vg"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so595380b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789198948; cv=none;
        d=google.com; s=arc-20260327;
        b=H1KfD1lwoUrB2Tdupgp3Hk6GrG95YaZgqEZDuihPNjI0e/aH4ouHjriWbI+njEBuPL
         rczzdbzTUofDpjWmHgpJIMTVnJq5WeIbcreNmT7tdrUNwawFppjkYYzoXzmFbB56gcVM
         GcZBtqxVecOnimT4znSTh4f3tWFyQHXn/FyUt1rsN8hje8526vMNPTXjlpvLtlrFaDne
         GRzWYmJCvd+9U06bbYXbDZRdirV2NbGraDIfCsaCZ3a7eeOl4FvsEyET1JCIJWZhxmEN
         C+1Jouh4rZu3vndXmWXc4+jo3/f7KC+dHVct5vCFHYyx76y3oZhZ6liM76bV0WoxNAp8
         J2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3tJuKuoSzWQ5ciLlrNmqFia+HpadVqWjy0A5pW8ADTg=;
        fh=nz7EnNk4SnL/zp4Z1HNoGM9rOXt+WZVinkanM755em0=;
        b=S01nBv9309caFj7MyN51J44MorQ9fVzd+cZE02vdp8onxIEZ8psOc3fHpPVIqweHMd
         DU1y7D1/GQ4nxuUFI1jFylxPB29Yvz8NQV7LBjmysxAJBVle3OfRTGy66RcD39jemEqS
         KY8CVG2q/XA7sC8L8gic8DqZ1dnL90RdXqEeupi6Bq+pfg5q4ueJRL1+Pez7VXTZE8g/
         xNWuU+YV9W5vNhcyreYXNASf1iThGlbylJz7I21ARMQoFx9xjwPRpLyS48K0o9ao0wEc
         sMClmPb0XT0XCPwXBUxwBl9ydH0DaHYBH3Wca22e4Ymy8oNYBdsuJeqXCIWJD2+UIE/t
         B/uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789198948; x=1789803748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3tJuKuoSzWQ5ciLlrNmqFia+HpadVqWjy0A5pW8ADTg=;
        b=K2ha96VgLBfj7USJ7QqRxz23DB91IQe7GzVSUzMTPVJ6B+Jj5kwmDCDk8EvJ8E/RWp
         EOBGd2Ql4GqP8upRk3W6RU79rjJsG5ZR8GFo8Aep8ZuebNMuYlVzEh7Ml1ZGoVL5Ran9
         TE7+H2o1gEFTlwpF3sQyvIxlWSolPfHdihJ5SfYKiFl/I4Z99W5LVDf5NaYsGEZIAL4J
         QZZV2s4SAV4VQqVk0NidAF7ELdZyc/v5VHCHERf7VDm96gv/LOrqqx+Q/v5q8PlZC7Nv
         F7OKsSVimmPYvcnpczF8Fbi8fehChZgiQUcCk1kS7eZOATARbNjM+PE6i2Hl7axckKf0
         LP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198948; x=1789803748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tJuKuoSzWQ5ciLlrNmqFia+HpadVqWjy0A5pW8ADTg=;
        b=RkdekThUoS4S9gUKIQvVR7ReTqupdt3qpLfBRmPbtCXP8B5xio4G8UnIqLJuCAiIVz
         ZYuZ0YySElZzZId5Hiu6htRltrndwcadm9mikDHhs6iyav9UKsb0sQtzp6+Qe0/co3qg
         wUmaKIZunBKsKVdd1vyNS4vymjWuK3KOsPp6hlOQNZlSfbgDtIHNomDcRcadpubGbNDX
         3EkrVsCkOyIjcaGT9bowLzCI25kA44lt282H98XLDDW/0npJTcrnixeC+tEQCLTmJMhq
         jML9ps5Pbd15FuQJXhG8fPzPegPZLsQFa1TdDV27IprVkXkZ2lvCF8yusrSYpJrOKioP
         t9cw==
X-Forwarded-Encrypted: i=1; AKwUvBw+W/ofgixTcixRUsLp7yktV41XM9g3rH2KPt4uTMChh90WXaMN/ysToL/qn5PgfaihiIZ0aB4CdJbjrvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ki29XnaDtQrwXzZCoxzbyCpwbPE62MRdmJMQmoFHtonpyt21zD
	aPGGarnwz0//1mfAauIKYu8j12dErk552/98ZiNbHHpyWlsgvEVw9NJSgdG7obCzSSYd2wUiZJh
	yXMiuRLyz552a/UjrlZeYoNv27vVzmpeFUzn6wCfv
X-Gm-Gg: AYBFou3RiuwRYpuoHnaxS3Dh5i0j7JohkhyEg2Ql0RYeSE92Og3VBdnWkZJK88ZIwVu
	b1ZOdU49oc+QmcG0IbAWZBZovBtM728YtlQ37Ls1K4R6QNHlWpf5UQAxBLycl7zzqSeoJc6Oqf3
	YwEjeiKdZe6I7Of0Hx10PSSjmGjFrPHDnbzfbTqKYo/e0O1BOoJYeEfpnba1v8GNkc5WczjGPUB
	BrppdvfkzErQYUI2cwWb1pOogq1td0zmSqMzZi4ui6uMTfT1H1hlhtVE+dJBYyX05WfFVMNwHcC
	w940leJr0+ZjDrGrmYDahMbnttq9uHPA1cARu1Xfo85RKyLoV8sfLLGujUnn7Jn+4kVfuF+RdE5
	ruzKYO++RbCYDrqLPe8COCkCT0MT/EleaXK0MPJrTkgSXfm45+ywzlKK2TrB5Fc7wIRmpNhdL2P
	0=
X-Received: by 2002:a05:6a21:6f88:b0:3d8:f78a:9349 with SMTP id
 adf61e73a8af0-3daed2e2f72mr16961102637.13.1789198947035; Sat, 12 Sep 2026
 00:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovCj+Pd5owGH+51rA8-RDu9YFx5oYUv8bV0zOE72QgVfY0A@mail.gmail.com>
 <aqQOj8EHUb6ZzWjR@chamomile>
In-Reply-To: <aqQOj8EHUb6ZzWjR@chamomile>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Sat, 12 Sep 2026 00:42:16 -0700
X-Gm-Features: AcwNN1XLN5elLlT8PdL_Nzk9pxZ6_ooMYs8Rf-40WoQTVCImUG3ej9Qw_PbxJGY
Message-ID: <CA+0ovCg74Rj-rvV1kcLDj4nftRaX356-g4oc02kQSk3O7b_Mog@mail.gmail.com>
Subject: Re: [PATCH net] net: reject a forward path that loops back to the tunnel
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, falemi@asu.edu, 
	Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xuanqiang and Pablo, many thanks for the helpful hints. I=E2=80=99ve sent o=
ut
a v2 addressing the comments above. Please let me know if any further
modifications are needed. Thanks!

On Fri, Sep 11, 2026 at 7:22=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
>
> Hi,
>
> On Fri, Sep 11, 2026 at 12:17:08AM +0000, Farhad Alemi wrote:
> > ipip_fill_forward_path() and ip6_tnl_fill_forward_path() assign the out=
er
> > route's device to ctx->dev without checking that it differs from the tu=
nnel
> > device itself.  When a tunnel's outer route resolves back to that same
> > tunnel, the walk in dev_fill_forward_path() makes no progress and trips=
 its
> > loop check WARN_ON_ONCE(last_dev =3D=3D ctx->dev). Release the route an=
d
> > return -EOPNOTSUPP when the resolved dst device equals ctx->dev, so the
> > path walk either advances to a different device or fails cleanly.
>
> I think we can remove this WARN_ON_ONCE() from dev_fill_forward_path(), i=
e.
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index ecfbd72d5d1a..c67900354fa6 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -789,7 +789,7 @@ int dev_fill_forward_path(struct net_device_path_ctx =
*ctx,
>                         goto err_out;
>
>                 stack->num_paths++;
> -               if (WARN_ON_ONCE(last_dev =3D=3D ctx->dev))
> +               if (last_dev =3D=3D ctx->dev)
>                         goto err_out;
>         }
>
> > Closes: https://lore.kernel.org/all/CA+0ovCgaRvbd0Udj70b2xxG8Cx3CaCpNhn=
f1V4RWQuDveZYZhA@mail.gmail.com/
> > Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> > ---
> > --- a/net/ipv4/ipip.c
> > +++ b/net/ipv4/ipip.c
> > @@ -375,6 +375,12 @@ static int ipip_fill_forward_path(struct
> > net_device_path_ctx *ctx,
> >       if (IS_ERR(rt))
> >               return PTR_ERR(rt);
> >
> > +     /* The path walk must advance: a route back into the tunnel is a =
loop. */
> > +     if (rt->dst.dev =3D=3D ctx->dev) {
> > +             ip_rt_put(rt);
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> >       path->type =3D DEV_PATH_TUN;
> >       path->tun.src_v4.s_addr =3D tiph->saddr;
> >       path->tun.dst_v4.s_addr =3D tiph->daddr;
> > --- a/net/ipv6/ip6_tunnel.c
> > +++ b/net/ipv6/ip6_tunnel.c
> > @@ -1863,7 +1863,12 @@ static int ip6_tnl_fill_forward_path(struct
> > net_device_path_ctx *ctx,
> >       fl6.flowi6_proto =3D 0;
> >
> >       dst =3D ip6_route_output(dev_net(ctx->dev), NULL, &fl6);
> > -     if (!dst->error) {
> > +     err =3D dst->error;
> > +     /* The path walk must advance: a route back into the tunnel is a =
loop. */
> > +     if (!err && dst->dev =3D=3D ctx->dev)
> > +             err =3D -EOPNOTSUPP;
> > +
> > +     if (!err) {
> >               path->type =3D DEV_PATH_TUN;
> >               path->tun.src_v6 =3D fl6.saddr;
> >               path->tun.dst_v6 =3D fl6.daddr;
> > @@ -1873,7 +1878,6 @@ static int ip6_tnl_fill_forward_path(struct
> > net_device_path_ctx *ctx,
> >               ctx->dev =3D dst->dev;
> >       }
> >
> > -     err =3D dst->error;
> >       if (err)
> >               dst_release(dst);
