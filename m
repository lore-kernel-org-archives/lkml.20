Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793247590;
	b=3xZ+9jCK9fh2ftKbNVEwYF5G8YVxcebcxZWoR1xWLWilxo2iNTAgY/PVIl9GSG15h4ib
	 sloIp7vW1xyGiLIUfSeQlr3lzjEzLaLAKNFackWfLTavuMlvZIOyLqL2fRY9F5I+wjxEq
	 iUdyp5EvX9EiZhXMQleq/zAOjMQcmdD1jH0qg8O0shz3JeWgDV5qxRn6TMA4G/Vr2adfH
	 W8tUI5Ibe9LpRyCTESvRpQY8GlMfunlwhRhyvM1Y1Izl1aPLTqg6NdYi9zZLRsqsEOw1k
	 pVb1GhG5aHqY1P0X4x5nk+btn0QcCrXZN1fh7R3iiq7j6x1vO6bQTq/ShVyQnv5piXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L2k3UmlSrdqSAZ+HJXhHNb2h+Di07rclplpAGL50AO0=;
	b=ViLP06qb5AeGRdP35LbeOI6/AlzKQV8CPxvSZ81X+37jOlt9l8Xr357Yn11REjB3KBKF
	 Fe959V+ZGoGN8BaUUaEnvmnT/hpIVMkWQmRxmk67n6C4Lvgkzk6uzGxLPDz9qN8WEWw2j
	 eeLmg6eQ73AzVZTxv5AY2bt9O+j0FXnzMYw1XJRE26sdmZ8rlNF6h2JMTtcl2QQCgNofd
	 MPa50eufG7PEKVYaGaqrM3+32x5hgtzRyi+/O62774aqPNhd2JGbH2TjQSOyLMalzX8kE
	 fyNeVQ2ep9gUmPuseFPhIL4PbQv1YgvY4DvUoAaQen4UGz7ZGZy0CyNGhjI8lKGkISg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEB212IE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E4606A331
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEB212IE
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1743029e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793247587; cv=none;
        d=google.com; s=arc-20260327;
        b=C6e9Ip/tSCl+9cO/Mpt6bACOhllMinQbv3gWiBz8eNuWrQ/zlFvZALNLgV3a4TnWIo
         uqpgJ9pZ4EI6XqFJTwTac5ZxmCKHvCgK7Gpdjsxhh7NJPlC0Tys4/XFvsNFdEQWvzRwt
         W3yLuISGmbPLdtwS2bGYRyhX/eMdyhVpb9ZyMVXQIzoLbNv+2cg9loWR2+Y25J+lYInR
         o6+KqcXmBhjsjd9CsKsQJaxufyOFVPfiNqm7FM1tjXVV3NAV8wYTuM2estVftNnaKNNd
         ubtXAJ+1rbmyBPb2N3FT0+ouywdrrOcj3sKfMN8BWd0rtvMBH7LU0pLRdm2I38h4d6yY
         dnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2k3UmlSrdqSAZ+HJXhHNb2h+Di07rclplpAGL50AO0=;
        fh=EyAP+KFZFW8QxYa9U2WitMiQwiQ7JP5Y7xmkr0BcrAs=;
        b=UAmQagx8cMHb3ew2om3wQGWKUFiuvFBjITppoBBW3tjcpp28Pf4y2a1tQ3G6ITcUQq
         bfmcaxr8VjyG5b/QH5VF9LCRmhfYVKtJ6r4Sg07qzabpTcdAh/zZeE65uc1YtYq1lgNY
         /mg0DEKnJUBj6H5HsAawup7dopVIQPo6Nso8hdRataKJWwargPJC7bv7x/B9AYXQDjLU
         fNKO+wGo1DptLi8j6BPseGHNm9CSTsQHLNwGABPGh9VQLb0eFjbP8DuK0pTYePDNpj4M
         V+HKur2zYVRGOvyfmtaocaR95BJHVkqV2dlH2REoTKzMVberQaef8xSvVGVwCWjNlYIF
         VeJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793247587; x=1793852387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2k3UmlSrdqSAZ+HJXhHNb2h+Di07rclplpAGL50AO0=;
        b=HEB212IEFBUQDlu2rPkuO8dx0ut1v7W3ydXYZjWbXnLUNYBMlYQU33QP/tTkIkL1r/
         5/wvnzexmSUOKW3reekBXet0zBuiHkP5bbRbd1eh+S7JIfNq8Qi6dfPSxzGsTHcSpkXc
         w/iPpidZ16f20j8+CmZI2woOCkRiONaOFhaTJUb4G9D83tuUfotzDK3VLN7fmrzHkAVq
         eCFcvG3IOjpUP/7PY0Yj9Wp6BYiB4je+4NvWciSZN3YtZ8oBhlO++iPsNPUIHZzIpPrf
         4Ike7PVongnfxMPzChYKRQ/tI4ZIbpj8ILoPuHlFK+I+fM4/R7W1MeBQERqLEq7p/aaW
         M24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247587; x=1793852387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2k3UmlSrdqSAZ+HJXhHNb2h+Di07rclplpAGL50AO0=;
        b=G0b9adzRivsey8UMhkjuGuRxz5a+KI/e3bZlDvyj70dAQtHoEGAUQ/I8kYC4WxeMSq
         Lq37hloeFzIZQ7mJG2WFXxNXILM+C34U7WuGBE8D3oQp7bKOB+Ei9QzgSIYN0MMv8dva
         mJ2ey7RsXSCwd9k24PI5tAaEACYM5cltfhokEGoaJfCwItECLbZNgJVzHQjTWbaHtQgM
         /Kg9Zutf0+rNEdIxVNBG/+RNu2UsTmIDyTFCHc7IJUpSm96aTCmkTIpgaWis+nwq6tGt
         lpBoF7GgK1X0deFDFuagCnypmKfEOuHDiJIwxla2qUzyro60thUCOtE/LG6GczvJCs0f
         wnjg==
X-Forwarded-Encrypted: i=1; AKwUvByXV/wV3fl0QzuqFrC0aD+PSIRLUUohk1HRbk3R20wo6xbmBR5SVsHBBHBCXIdqIoLDIxf4j0UdhzykV3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRkYYcVY+BZxU2n8p4DCd/s9kBlNpVXSq0/0HlFjU7leOakWg2
	AcNjaFuga6LyAtGkGGgVugbd6DHLbFlPGasVCveAfmWreTWZzk8VsySsWdhO5Hu7wDR0OUIjKXf
	MOJ0LrnpEUO1KMG8i5JPmxUYTq1rmbIA=
X-Gm-Gg: AYBFou11rC2hjZdSlZX87vWPZSvlWSjurVJYXUV3mM5d+DKSfM8++vikrSJH4ZE+b6J
	oEErW4GhLTFif+Z4tWrBqXl2Dm/76qF9fuDX+7lpOMB2Iu/3ozNRb1q3rC5FDXuSlQL68RMBLt/
	/LgffezrFeWMuqRGADQNvVpI3cjmuUvFUlsGHnS7FioJIvRtt4Xa8OOnlVthGo8sBSwIRitYQXA
	nLs/xO7cM/S8pjkRV553q2pL81uJo20jCS3xvKS6C9E4J/RKeFNj9jOhdjf9G43Lmv2qXWeNfyp
	Ey/U0yd7oMpIj+WdMisJiZTCHe1thhMg/oonO4BAcNtB1eSTyVkINyYU44kz3ITfP1oU4WIDgA2
	R9HpNBsRyhJ8cv58dhhJkVi/lvUnFmWShSzbCCKeeanC+WWegNXsq/9zjRA==
X-Received: by 2002:a05:6512:6c6:b0:5bf:a46b:5546 with SMTP id
 2adb3069b0e04-5bfcad768b6mr1683276e87.64.1793247586539; Wed, 28 Oct 2026
 21:19:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027130623.3136658-1-anilkaushikwireless@gmail.com> <179324692107.3134.14443689892607921337@kernel.org>
In-Reply-To: <179324692107.3134.14443689892607921337@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Thu, 29 Oct 2026 09:49:35 +0530
X-Gm-Features: AclHuK9xKynmmPtswLR8RyT2-XkrOflzEjyrGurfI0hbR5tbnbbT78k1otsVn6M
Message-ID: <CAG0Mgm_DxY=zZwBW3xEeNE-1LC93OWPkO4HHw=qF2Qhti-Mf4g@mail.gmail.com>
Subject: Re: [PATCH net v3] gtp: Require 'CAP_NET_ADMIN' when joining the gtp
 multicast group
To: netdev-bot+sashiko@kernel.org
Cc: pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, nicolas.dichtel@6wind.com, 
	osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:38=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
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
> - [High] An unprivileged local user can still receive gtp multicast
>   notifications (PDP add/delete and echo responses) by joining the=E2=80=
=A6
>
> --
>
> gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
>
> This patch marks the gtp generic netlink multicast group with
> GENL_MCAST_CAP_NET_ADMIN in drivers/net/gtp.c and with uns-admin-perm in
> the gtp netlink spec. The goal is to stop unprivileged users from
> receiving the PDP context add/delete and echo response notifications,
> which carry the same data as a GETPDP reply.
>

Yes, this works, but the gap is in the genetlink core, not in gtp.
genl_unregister_mc_groups() clears the members of the IDs it frees, but
nothing clears them when free IDs are given to a new family. So it hits
every modular group with a GENL_MCAST_CAP_* flag, psample and
drop_monitor too.

This patch is still needed, and it does not change. I will send a
separate fix to net that clears the members of the new IDs in
genl_validate_assign_mc_groups(), like the unregister path does.

> [ ... ]
>
> > diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
> > index 86c8c88b702cf..1dd32e979cf59 100644
> > --- a/drivers/net/gtp.c
> > +++ b/drivers/net/gtp.c
> > @@ -118,7 +118,8 @@ enum gtp_multicast_groups {
> >  };
> >
> >  static const struct genl_multicast_group gtp_genl_mcgrps[] =3D {
> > -     [GTP_GENL_MCGRP] =3D { .name =3D GTP_GENL_MCGRP_NAME },
> > +     [GTP_GENL_MCGRP] =3D { .name =3D GTP_GENL_MCGRP_NAME,
> > +                          .flags =3D GENL_MCAST_CAP_NET_ADMIN, },
> >  };
>
> [Severity: High]
> Can an unprivileged user still get these notifications by joining the
> group ID before the gtp family is registered?
>
> The flag is only checked in genl_bind(), and only when a registered
> family owns the requested group. If no family owns it, the loop matches
> nothing and ret stays 0:
>
> net/netlink/genetlink.c:genl_bind() {
>     ...
>         int ret =3D 0;
>     ...
>         idr_for_each_entry(&genl_fam_idr, family, id) {
>     ...
>                 i =3D group - family->mcgrp_offset;
>                 if (i < 0 || i >=3D family->n_mcgrps)
>                         continue;
>     ...
>         }
>
>         up_read(&cb_lock);
>         return ret;
> }
>
> The genl socket is NL_CFG_F_NONROOT_RECV. For NETLINK_ADD_MEMBERSHIP,
> netlink_setsockopt() only checks the ID against nlk->ngroups. So an
> unprivileged NETLINK_GENERIC socket can join any free ID that fits in
> the current bitmap.
>
> When gtp is loaded later, the call chain is
> genl_register_family()->genl_validate_assign_mc_groups()->
> genl_allocate_reserve_groups(), which gives gtp the first free ID. After
> that, only __netlink_change_ngroups() runs to resize the table. Sockets
> already subscribed to that ID are not cleared or rechecked.
>
> do_one_broadcast() only looks at the socket's group bitmap and netns.
> So the earlier subscriber would receive what gtp_tunnel_notify() and the
> echo response path send through genlmsg_multicast_netns(...,
> GTP_GENL_MCGRP, ...).
>
> The same user can also trigger the module load. CTRL_CMD_GETFAMILY does
> not need GENL_ADMIN_PERM. ctrl_getfamily() calls request_module() for
> "net-pf-16-proto-16-family-gtp", and gtp.c declares
> MODULE_ALIAS_GENL_FAMILY("gtp").
>
> The commit message says:
>
>     This fix blocks the unprivileged users.
>
> That claim fails when gtp is built as a module and is not yet loaded
> when the user subscribes.
>
> Could this also be closed in the genetlink core? One option is for
> genl_validate_assign_mc_groups() to clear existing members of newly
> allocated IDs with __netlink_clear_multicast_users(). Another is for
> genl_bind() to reject IDs that no family owns. Either change would go on
> top of this patch, not replace it.
>
> The same gap seems to affect other modular groups that use the
> GENL_MCAST_CAP_* flags, such as the psample one.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027130623.3136658-1-anilkaushikwireless%40gmail.com
