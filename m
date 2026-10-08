Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2F0445AFB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791495663; cv=pass; b=ZiHtoBfVp+AxUebJLHQW6cSEgpj02VPaKhKhQVl/FuKl5wphZncWnxeHj0qKoCfTlRlExOc8uhRxlrC06yvcKMTYDdQM7I4xEnB38705/lbmch5SW7ly3QVSLDefPMO6wgLZ3g2whJ91qBh3kEc9FakKgnU1Zr+qSWhWSq8Y4jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791495663; c=relaxed/simple;
	bh=X79HiiRrOSQEwG0wkO/yWS47cMb3pYSvxPyGF5qUYzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijPFi0GJIABa57jUsQhstg+Hy78uoGsaeaRcFIJ3vFkkv+GcV2pqS9+9XWT+rD+LvhkqpTAMHTrowwp0iEyEgOyZPuAxohhdYE6Rgi9cfht08OkJzHPJOOvsrTqzsnRGnBdPv1hU8T1jl30+6Gf4Ulp8pxXAO6yfFKZB67arBIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n8/F/OdW; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n8/F/OdW"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-825b40f8a26so1714506a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791495660; cv=none;
        d=google.com; s=arc-20260327;
        b=X4UG+JUrjG0o1RyBsqVptWoiKIw5xeRL1Q7OgP9EPDOZ0J0Qxu0grWW+fwOtdyhUDm
         8kPWNsphCoA/vs5gnvP3NcVXVO0kDeu1onyK5i3lafGjUz+uVJP0WQpPFgQmByewS1HL
         SHAwVXxJJpbco3aqkshK4En1NwNAhoR+FwFRZFayB60f4N89Q2xRnHDzwFL4UQ5o7qa5
         Zn32XQWrjKXyAwnccJjDcfH64+z+uimAQIokuV9DmTsHoSFX/f1qMz9ORRprEhRpor70
         egFQxcfjpeS29/QnHCxC7AI2UukLy/TGKrnqSM4u+/82sGlMR4e40NpifjIuoIRb5jhv
         V38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gyBM3co0jtFEmVtQRTuXUNMSlVWNRsqFWBZpqheFeJQ=;
        fh=DMnIrsPGCUerLkJSIYFLJJAkE2Oxbu4LEeYgASKTVFk=;
        b=MAOPQX94eDaahuOxPU1bvigutt0jrWGSZBcbxwh2WCbu+xRFBrHr8GLd8e0ziBspBC
         reDoffckQTP6VTUePe42+qdIN0X/R90a9w/MohGx4nSH+OSBsxj1ina9J3Hk9V2Fkedv
         +O9wo7Myz86UgjTCzcnijDLEsfJczscwTrDLawIEWn2V4H+o7l07oxi9SoNJktbiEZSG
         T7piF0B5uo1xk0h52BAfg2F+exF3YsCOWIzyfOPAsJ8j1+iH5VaO4VRKdgNuCXQfFTkU
         +LSflZ5XoQw1rDWTBowpOtU4yDNdDSInt+jYlpgfE0ZvWSDPRVxjHEFfuUsFyD3pro4n
         h9gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791495660; x=1792100460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyBM3co0jtFEmVtQRTuXUNMSlVWNRsqFWBZpqheFeJQ=;
        b=n8/F/OdWO8oAvL71RNtl6lbYZdbxp9JJ3mCCKNu4X8FWOz55LGRUjvMf5Zhh9R9c2M
         VCmMbDMLRgyjDX2He9lDRRyvFzY92351yz21Ql9Cm7k4ATGW7U4xC5pejP6zWGek73nz
         vNYkHavnVdmWaWtupPhWl8YC/ZRFl5zo/B7CM7ou/ZNnG0JhjWgpMvUwplFAGZnH/y9h
         uSF+3Snq6RYGr99QMyjc/UBfSv6wdkkBqUd52BzVSCYjjJ0FcEmfQRRq4/uAQdS4mk41
         DHym/kFjxmRGlUD9KtpOiXsuT1LcObDov3FhHjv15GYN2kMYTRcKRQtxbnGQpNse194I
         g7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791495660; x=1792100460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyBM3co0jtFEmVtQRTuXUNMSlVWNRsqFWBZpqheFeJQ=;
        b=dYrZQisjgJxxGE3Ud52LPXvH71MmVJuvga5VBLcjBh0MFOxLihfN1n3ArGM5SLIw9o
         JCVN8wiIgl29qi45uHhWL4pV/Gfi+fUS3KL03+QDOVX4/PFjNBvFMAeoUlcSDO9fm2Or
         CoOdVVYJIYwKOo+iFGaNmOgqLL9124Mh8Jt0E27GC18lFrknY5vspRZ8L4qW3QUzC0XM
         nWnpOiOxZM042jzMztRHRzcIYaNg/uuaXV3xUuDjeoX7PJW0T/+TbmoH0ftG6/+Zsg+6
         5GZqF6ZcU/LPs+Cn/95Iy3gFWqQRtEuoZTUkECuYz7uNlojOmwuUwcDdipVfvOx8NgYk
         vfGA==
X-Forwarded-Encrypted: i=1; AKwUvByN5RFxJs7oHOwrLcqKSlAfmoDlY3vO6kLIfPZ/JBjd6shtjuGDHdLfTW3l0E3oPf1ZeMh+w+YMZf57iNw=@vger.kernel.org
X-Gm-Message-State: AFuF++m7fw1M8jm2xo1W4czKTCDXDs1uOsbkd4wdcgoUoRUipky2RrHY
	+Yk5phzU58S+G56esJSLBoXIsJ6DteD9jfX/P7Eg+dODc+uHQOqPdu7tgOOYGkkqKMdCxAfAURg
	8H0/ymz6bFxUsTfUe9kueb7KL/RdKBfydGpqrLl/6
X-Gm-Gg: AYBFou1MwKMIU77XwE74Oe8T8nW7q8Lcd4MDZyFMXxi9ZBU8CCUAbAlhJfkr25caCHz
	r5fuFv4LhhJZLnyccW844eY84WJbYxgx8O5ugzYYZZMGu1YOhQGxwD3d6WsWh47mbJ+gNVJdNZZ
	hcDj/tAQ2ek/H58ShwewL86BIZmxE7mQ1c8LX9WDm99pPqC8I1svOGuLeMucC0RU1xRs8xSdGqC
	JQMCOiVmWZnhbXGp864Zgksmg8cPgjtg2+mXK24uMYiOAtaEoK2Uv4uyA0EREILbJ93pBE0/ATh
	1pCa1dx6JHJqNK1LHqFrBtsIYcW5NI+shX4MhnCjjqwFyq1QKxmKOLWbMwrAYzuThdGsvVFuLfX
	C1AuOHuArfLwOZw==
X-Received: by 2002:a05:6808:199c:b0:4d6:9273:251d with SMTP id
 5614622812f47-4fc46c91169mr7379369b6e.57.1791495659715; Thu, 08 Oct 2026
 14:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005210403.3206872-1-kaifengw@google.com> <179141784973.434549.3492874220530662715@kernel.org>
In-Reply-To: <179141784973.434549.3492874220530662715@kernel.org>
From: Kaifeng Wang <kaifengw@google.com>
Date: Thu, 8 Oct 2026 14:40:47 -0700
X-Gm-Features: AclHuK8cv6b3xgUvgnZyHMF_wQUTwWKnGRkc9RdLBmCevhccE2Jkqa50GwksMzw
Message-ID: <CAKkY-qOKHkuPfMk+1vhQjRymPKcG5P69CWFLYv46Xp6BiTXO5g@mail.gmail.com>
Subject: Re: [PATCH net] net: devmem: check uid and netns in net_devmem_get_binding()
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, sdf@fomichev.me, bobbyeshleman@meta.com, 
	kaiyuanz@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Could this break existing devmem TX users whose TCP socket and netlink
> socket have different owners?

This restriction is intentional. NETDEV_CMD_BIND_TX was made
unprivileged specifically so that an application can bind its own
dmabuf directly and transmit on its own sockets without needing a
separate privileged helper process. As noted in the comment above
netdev_nl_bind_tx_doit(), bind-tx is meant for the caller to transmit
"on their own sockets". We are not aware of any userspace workloads
that split bind-tx and TCP socket creation across different UIDs or
network namespaces.

> The mismatch returns the same -EINVAL as a stale ID. How would userspace
> tell these cases apart?

Returning -EINVAL on mismatch is deliberate: since dmabuf_id values
are allocated sequentially from a global xarray, returning a distinct
error code (for example -EPERM) would allow unprivileged users
to probe and enumerate active binding IDs belonging to other users.

On Wed, Oct 7, 2026 at 5:04=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The patch narrows who may transmit from a TX dmabuf binding.
>
> --
>
> net: devmem: check uid and netns in net_devmem_get_binding()
>
> This commit stores the network namespace and sk_uid of the netlink socket
> that created a dmabuf binding. net_devmem_get_binding() now rejects TX
> sockets whose netns or sk_uid does not match. On a mismatch it returns
> -EINVAL, the same error as a non-existent binding ID.
>
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index f4d60654ce7fd..9a773b1ce92de 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
>
> [ ... ]
>
> > @@ -220,6 +221,8 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
> >
> >       binding->dev =3D dev;
> >       binding->vdev =3D vdev;
> > +     write_pnet(&binding->net, sock_net(nl_sk));
> > +     binding->uid =3D sk_uid(nl_sk);
> >       binding->niov_shift =3D niov_shift;
> >       xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >
> > @@ -390,7 +393,9 @@ struct net_devmem_dmabuf_binding *net_devmem_get_bi=
nding(struct sock *sk,
> >       int err =3D 0;
> >
> >       binding =3D net_devmem_lookup_dmabuf(dmabuf_id);
> > -     if (!binding || !binding->tx_vec) {
> > +     if (!binding || !binding->tx_vec ||
> > +         !net_eq(sock_net(sk), read_pnet(&binding->net)) ||
> > +         !uid_eq(sk_uid(sk), binding->uid)) {
> >               err =3D -EINVAL;
> >               goto out_err;
> >       }
>
> [Severity: Medium]
> Could this break existing devmem TX users whose TCP socket and netlink
> socket have different owners?
>
> binding->uid comes from sk_uid(nl_sk), and the new check compares it with
> sk_uid(sk) of the sending socket. sk_uid is the socket's owner. It is set
> when the socket is created, in sock_init_data_uid(), or changed later by
> sockfs_setattr(). It is not the caller's current credentials.
>
> sock_graft() does not update sk_uid. An accepted TCP socket therefore kee=
ps
> the listener's sk_uid through sk_clone.
>
> In these setups, every devmem sendmsg through
> tcp_sendmsg_locked()->net_devmem_get_binding() would now fail with -EINVA=
L:
>
>   - A listener created by root, or through systemd socket activation, whe=
re
>     the service opens the netdev netlink socket after dropping privileges=
.
>     binding->uid is then the service uid, while the accepted socket's
>     sk_uid is 0.
>   - A privileged helper that runs bind-tx and hands the binding IDs to
>     workers running as other uids.
>   - Sockets passed between uids with SCM_RIGHTS.
>
> The mismatch returns the same -EINVAL as a stale ID. How would userspace
> tell these cases apart?
>
> Should Documentation/networking/devmem.rst be updated for the new
> requirement? It still describes the ID as:
>
>     The netlink API returns a dmabuf_id: a unique ID that refers to this
>     dmabuf that has been bound.
>
> It also lists only SO_ZEROCOPY / MSG_ZEROCOPY, plus an optional
> SO_BINDTODEVICE, as TX socket requirements.
>
> The comment above netdev_nl_bind_tx_doit() says:
>
> net/core/netdev-genl.c:
>  * shared NIC RX queues, bind-tx only DMA-maps the caller's dmabuf so the=
y can
>  * transmit from it on their own sockets without affecting other traffic =
or
>
> That is not quite the same rule as "same sk_uid and same netns".
>
> Because of the Fixes: tag, this restriction would also be backported to
> stable. Should the commit message describe the compatibility impact?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261005210403.3206872-1-kaifengw%40google.com
