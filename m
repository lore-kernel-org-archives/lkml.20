Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793425581;
	b=xW2UgeuvHCNX6066of2yqP2oaJMzXbwsX44vYx0WeJFmLn48g1Hd8iFSxOt2T+5QAd0P
	 RIUU6uoOwvLcqZei4k2UM1ooiocR00hEhEeu7lGTlbq0zNo+nTxPFA0uAsXrlTTK9FUKr
	 TbuBmP/hcur/2BhEmTQGSC4U1OdPXhZ9hC9iyFPQXdgLSIvxlqSvENuv8HbEz6MM1F5Mu
	 9Y4z1OjT1eidly4ppP9U/FcTM+9Juk/SLZPkHk/278E+HUy/difL7lW5/MSYSLraOJv4B
	 IsAco9iwPBsk6upOCCxgt+EIODAah8XwdNiA4Vxj8DEPp6xhKPeYWxL1BxFbpq1mhWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793425581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j5eFuw5dSBe3p5rkzIGZf40x6p9LO9b0fmbjNxDAM6Q=;
	b=ybdFms27JHr+oBRhk90Qi9ykUj4seQKhceyZoTqu2PJoBqjiw5Bct6JtbPNdxVzAubJe
	 E3Xvywf1UW5L/UFnm/qj9GazrHygJkzjLR1xztVJsiZGPyZwt3hzngRehiMuOLsoZyH0L
	 Rdm7b1oHYdlZFqNaMxRN8WVf6FJLNBhnXKrMdRCXiMOGnvgR9eJfLW37ZboIos8xWTP0S
	 yzrfF7fV85ul6KZvCeJbNvwPX3d4WuBL7t1fzLPH/4FeKOnFxMX/3Fan6X/o/vQ8q4bqt
	 5F9SZ/OqZ++OuaIEOmICBR1+fqj/A7e5nJgkdrBAvxWn6Y2GBMnPePQ+1awxzPpDkpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzjXr6A5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C95606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzjXr6A5
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1189586e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793425579; cv=none;
        d=google.com; s=arc-20260327;
        b=dZySmkL6iBDXwcJgqdiRWf6vf7btp9OacH+i6RJWOgc+i14JxM4AmYeKI3lfuPPAnL
         8l1adDprjT59etZm9iIg6AuhR8ya/AgvR1AadFeM967YxTRD2kwEYVTl3BBPqg80n1ES
         EVacNd5kRLIP8t0TPv+Jk+8rER2cneOr8AQ1WsLSThN6vA3do9o7Ark4osyENXN6K9q3
         hGOTY1eQT81CuNxN4FPqJiyqHnsqlOpxq0IXvncU5Gt1hHwSSoqZeFWyFvdecTfj1Xaa
         qnpcZdYGz/Xiyi+yv7Xg+Jcjv9KFAyexeER3LS6fK+KZzH7zvvMR9+2CX5YSxGX6ifGb
         E3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5eFuw5dSBe3p5rkzIGZf40x6p9LO9b0fmbjNxDAM6Q=;
        fh=nO2uy3Ulfipgqq9KzJoKlkWLLhMbVJ342a6SWlbEKJw=;
        b=L0wwiCUKx3SfVUBskLMPku2TrcbQvv4nnb7gR1czhXTzY4k0E7mAx0FWq0ZTKc0+gI
         cVoIZjbCgenoJP9h2fjOhO0e3o/905vtxLvW9eRKi8iPRuR7BbCXrCa1PCyKqBiJs61x
         ZD8hIL97W8CU2CaOtBdbj8flkPFI5nnLWsWMeTcv79YW23loyvBAAYRerjpeR9vs72pE
         fLXWc8jyUBY/xp9YG0VN8bww/zBEWgSzymk/MHfyIuD+FG8W0Om7I1I7dI9E7USYP/86
         cGvGsBV01QBf4hHjR7f5TUbaQkAjw4vo/L7MBpzBATKnQKo2mmEIN7BhrcSyrs7SAF2O
         zSLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793425579; x=1794030379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5eFuw5dSBe3p5rkzIGZf40x6p9LO9b0fmbjNxDAM6Q=;
        b=WzjXr6A5EssuO994W0bNfs4J2f2TvDG3e5OPHp4zHJaGHS/dhuhBOQxeP0woukH6w7
         9jydHAQngtjrH+nqq/pvT0KL4krZoi10rO/6BgH84LIjsxid4PUalzAI8UWpDXLyhmNs
         acGySq3LMWkPQHjZEBmfoNpxUvCJHwRXquyxHQqwlNT2m/2PSm3yiYy54RrgGS7umeet
         ZQc+cRT+ucGURADuIULNDnOeP24SoRTNCVEVrUKdoiAu61+3T+WtjIJNEFKv5Dw/3qlY
         QEcsXJArtAs5ojO9NGn+2YJMCbXGsdRrK7XTdq9fYrxGyU38lIhV+tduaXWvcZn9uDpX
         54lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793425579; x=1794030379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5eFuw5dSBe3p5rkzIGZf40x6p9LO9b0fmbjNxDAM6Q=;
        b=Q3BNVeJvtOEmDK+6QCzt8hHZEDYmv3bG+8m7zBoUNAOMMchnbO2HTSV4huqIDzKBne
         IBCldIyG7eHmvZuJ6VOPDUtvy6O1iF+N/MNBU6WiqI5dfeROrIf4lzZKVlXce0FdXsp+
         NuHCx8gqvRMQ648L8ql3IUUMz4SJ53CcH7NCfL/P4RK4UMyxkH5fIqWXlyLXer6t54kn
         6hDeeitgH27eRCgbdwFai20zmq/S+xD+IIjJNPV04nbTPZ6wt9JIlXjuFYBP95Er3uci
         j1fpbak+SdVotPC+YfpQXuYhF7x+FeT9gWztRajw4o5KwgwAtHX7tD5LBJSz/Bcy1N0q
         Hx0g==
X-Forwarded-Encrypted: i=1; AKwUvByeYSofBwJP8xNRAb9uu+1zJF8+tA9L/70XPXv5dGUWppdwepHdVcExoVa379mChwQNHfWxkDSHUJbgJuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSnh8giU2JXLAhvFluPryRF/ziYi2dFD9ihCjWOzk9BpHYAotg
	XW7Crn+8vAmYBdtUaQcjsYyCrRpY6ATTO51OJtlBQa0429DayFDpfEdl0h8OLK3kMg3ZPAXyvDr
	cX/vfTUvwpNAhYnOqQ/5+QaB6ILtUYpA=
X-Gm-Gg: AYBFou0KX1V9+mdP2uEFLazCmRR5FHeYpf5vmnpu02v8g2nbCnVdDeSVFzsZ8rVoOhg
	5YuGvcKRR/yV99epQfZUO6Ydu10RCzY/6NIUraoTSkinimmmAWnpsnJAqbddQD8iOsn+/RxWcmb
	PYOO/2zdon9g3NvH8EgtWFhEWieFsIy8Q5Eh3bFOTebBBHNdZGURVs3+xjMlb5zgrjxKz1J48N7
	CIaprhr8DDCX+EZyUmOix50vTIhbADKYwHvNqAG5ZoyQOxh3KxDfJoJtOJu8HCxSKzG3qdATl8k
	k7sBhBxDqb0Han5O9QTNzNjZQwABrhyA+PkRnKyIz8v/qHqIz3vcW8R2ALcfahdiZd4KdIVLb/l
	WAhCNWP7B6OtKn5P907Px29H34NR4BqYH4ydG
X-Received: by 2002:a05:6512:1050:b0:5bf:d189:9e62 with SMTP id
 2adb3069b0e04-5bfd958ddafmr1500570e87.54.1793425578921; Fri, 30 Oct 2026
 22:46:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029062214.3407223-1-anilkaushikwireless@gmail.com> <179340003139.3131.11274717768928642724@kernel.org>
In-Reply-To: <179340003139.3131.11274717768928642724@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Sat, 31 Oct 2026 11:16:07 +0530
X-Gm-Features: AclHuK9xBmY8I8Gu_dRZTmuh3Gi9P3Qwr4-iPGqbwgY4aeTzBzCleg55CSQtfMA
Message-ID: <CAG0Mgm_kyXA43dLYbihf_KGk4Y33u-nog9FE5Cp6DgfApMJ05Q@mail.gmail.com>
Subject: Re: [PATCH net] genetlink: Reject joining multicast groups no family owns
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com, 
	nicolas.dichtel@6wind.com, v3rdant.xiang@gmail.com, aliceryhl@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:10=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is incomplete because of a check-then-use race.
>
> --
>
Yes I agree. genl_bind() drops cb_lock before the membership bit is set, so=
 an
unregister in that window leaves the socket in a group ID no family owns.
v2 will add a patch that clears the members of the group IDs when a
family is given them, as suggested.
pw-bot: cr

> genetlink: Reject joining multicast groups no family owns
>
> This patch makes genl_bind() return -ENOENT when no registered family
> owns the requested multicast group ID. Before the patch such joins
> succeeded. If a family with GENL_MCAST_CAP_* flags was later given that
> ID, the socket stayed a member.
>
> Link: https://lore.kernel.org/netdev/179324692107.3134.144436898926079213=
37@kernel.org/
>
> > diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
> > index 5cc1037d4917e..f038f04ef4ead 100644
> > --- a/net/netlink/genetlink.c
> > +++ b/net/netlink/genetlink.c
> > @@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
> >  {
> >       const struct genl_family *family;
> >       unsigned int id;
> > -     int ret =3D 0;
> > +     int ret =3D -ENOENT;
> >
> >       down_read(&cb_lock);
> >
> > @@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
> >                       continue;
> >
> >               grp =3D &family->mcgrps[i];
> > +             ret =3D 0;
> >               if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
> >                   !ns_capable(net->user_ns, CAP_NET_ADMIN))
> >                       ret =3D -EPERM;
>
> [Severity: High]
> Does this fully close the case described in the commit message?
>
> genl_bind() checks ownership and the GENL_MCAST_CAP_* flags under
> down_read(&cb_lock). It drops the lock before it returns. The caller
> sets the membership bit only afterwards:
>
> net/netlink/af_netlink.c:netlink_setsockopt() {
>     ...
>                 if (optname =3D=3D NETLINK_ADD_MEMBERSHIP && nlk->netlink=
_bind) {
>                         err =3D nlk->netlink_bind(sock_net(sk), val);
>                         if (err)
>                                 return err;
>                 }
>                 netlink_table_grab();
>                 netlink_update_socket_mc(nlk, val,
>                                          optname =3D=3D NETLINK_ADD_MEMBE=
RSHIP);
>                 netlink_table_ungrab();
>     ...
> }
>
> netlink_bind() follows the same pattern. It updates nlk->groups[0] under
> netlink_table_grab() after genl_bind() has returned.
>
> The owning family can be unregistered inside that window, for example by
> a module unload or by a module init that fails after
> genl_register_family(). Can the following sequence happen?
>
> CPU1 (unprivileged)                  CPU2
> netlink_setsockopt(ADD_MEMBERSHIP, G)
>   genl_bind()
>     down_read(&cb_lock)
>     family F owns G, no caps, ret =3D 0
>     up_read(&cb_lock)
>                                      genl_unregister_family(F)
>                                        down_write(&cb_lock)
>                                        genl_unregister_mc_groups()
>                                          __netlink_clear_multicast_users(=
)
>                                            (CPU1 not a member yet)
>                                          clear_bit(G, mc_groups)
>                                        idr_remove()
>   netlink_table_grab()
>   netlink_update_socket_mc(nlk, G, 1)
>
> After this sequence the socket is a member of a group ID that no family
> owns.
>
> Later, genl_register_family()->genl_validate_assign_mc_groups()->
> genl_allocate_reserve_groups() can give G to a family whose group has
> GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN, such as psample,
> mptcp pm, ioam6 or cifs. Nothing clears the existing members of G at
> that point. do_one_broadcast() delivers based only on the membership
> bit. The CTRL_CMD_GETFAMILY->request_module() autoload path from the
> commit message could still trigger that registration.
>
> That is the end state the commit message says is fixed:
>
>   "A family registered later can get that ID, and the socket stays a
>   member: nothing checks it again."
>
> Would it be more robust to clear existing members of newly assigned
> group IDs in genl_validate_assign_mc_groups()? That could run under
> netlink_table_grab(), the same way genl_unregister_mc_groups() clears
> them on removal. It would cover both the original case and this race,
> instead of relying on the check in genl_bind().
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029062214.3407223-1-anilkaushikwireless%40gmail.com
