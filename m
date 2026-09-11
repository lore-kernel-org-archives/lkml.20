Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1283B1E7C2E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086241; cv=pass; b=MO5xbGzgCYy+K2sPl2EF/IAo24ixMf3cl7zdqRh6sQ+qBmnv0WyJjfdZYiNWrwyKcxdIsRYvcnLBfEXIevq8W1SeMlJyLCc6JGtdd4P4qWaYWKRAMGwBFts3qNTZ0/VKcM78/I+t3SxMAO2LM3cBgTEaxCPN+0yk3emLW0XPfxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086241; c=relaxed/simple;
	bh=nmdKc/a5wnE8PDWAlKyr1buTBobwOO09KZmLFJnzqoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Un2AaD34Pnm/26E+rI1WgJvsLBnCWoyE+0SpOATyYYx/PwDMX+k8bowrRymFgkATrZu8e0V+qsDwEGBKGDoOaIDKHlXU9xvNkQjnbNdIGkmNFB7S0KQLquSHWnBJsvQLqnlw1fg5JG4KS9p/BY/UstkUKzbNMfu0H3VGTxKQSZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlGpdJLi; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlGpdJLi"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so21175ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086239; cv=none;
        d=google.com; s=arc-20260327;
        b=Y24cgnyMF+TXW4oFD3NhaFq0RUKPxT7fXl/NymTre0hsetUZ7sFd3VjPwrXAc+Tpy2
         dSJDKosaVnuir4ebfy9WwcBYDdDaPUF7qlOwtRuswW08SUYSP87xO5/qgTm5VyPludBD
         dNsuZP4+mBsUr2Df43JDShBv345+zZCNdJddnM1gAhNtcpSfMf6j2VHlYhuYpMvjzoRP
         dZphbR3lEHnUlBgccYRbqc09adOS2DpdjXZlD/9f2SGnIXMq20gwkt3tZlnsEGvyXJ1A
         8f0kPNNJjpdbJxrTY/QuKcqjwxZPwtUqTQX95p7C6b85LHTYNnm+uWZpV7lSlA0KURsz
         AveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zqEdcnUoGpZiwMUleMzp5ubvFf8h672eTAjjjl3YB6k=;
        fh=NlWZprRGrmtU51xtgSZNXisr9A/tn4qES998IyTX3kE=;
        b=cu2yrxW8V4c7HWNwca5NeJb6Qdy/hAE717Z4j+kBBNV2LssIkvxyqrIsH6qB9q4CEp
         PCusdKBi2YwAg5gxysdRNSP1qc5oFjrDc9UnaU54AiH1iZjGH1j4o+akrcc8BJ9vpie6
         pE7TOBAiy8lhFd6fJFQyg/CSaOgNmGHj+MGwWyHuTBJe4Tc1dOGdqE6HRtMAhnDQXjSB
         SFavsJ3HIlQ8UYEkcUzdTuYsiP4U9/HCjBG0LZ6Q1CQB28f81t8fgDM02s+k+9Kg7Vs0
         eJgrsK86MHb7im59bbw+Xc6IuMV1cQG0MWZR3/gzSghJPbZZAZveTvcPlaa06pNGl7hZ
         7AnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789086239; x=1789691039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zqEdcnUoGpZiwMUleMzp5ubvFf8h672eTAjjjl3YB6k=;
        b=VlGpdJLi4lUVoiBvcJWGAGO4NY33SuDUaO1V6CjjMq73IrClR7irJs7S/bK3tjCgrS
         +sUUuZTWyCrPqXr0axFZ3JpI4zSuJoowyd7P8q1MbMNA3fwGs4MWKcXVa+Bydk+1tB+N
         Z17a+n5QhmRXv/5NdhMXp6exlcXA3sxJ975OHtfiY17io3jWLiVfEk8MAbIDhUr3QGqz
         xpzmCs4v5j5hhA5KrhLgNl0hdrY3zekzA+7DBAlqchvstfCH+nXYkG7SGDHTyADoTE4K
         JFPXjTl/ahCbhEjtLICiTZoFmu2lNiZpQGrbrXC7K1MdxKl0MIWsm28wqWomiyl51qTH
         SoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086239; x=1789691039;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqEdcnUoGpZiwMUleMzp5ubvFf8h672eTAjjjl3YB6k=;
        b=QY2Jzs/hs/Kn7HfPWCcBU3zL1HK1ImSUhF7bfL4H3DIr2B3B1zVn1kuIiD3lBJik5G
         7BkXc6tWnKjNUkJv5LYM7G4sAT1Hf0BZL1RWtBzUfjaAZcqBFoGpgHyt+bCmiBVjKuYh
         /vBirVxctdttvdu9POJ0v4Mgd/8EdttoL+ZKbmcWuZHQHTIPbjROmc/CvdNJjiExjivP
         dPNbVctfCBfzao9Gyl8A9vP9qsikMbNTC128f8fRk+uJSB6N5DXI8V0SzaC5iuDdbUiV
         FMtcptbHcr5m3Mrkm0AUeohtdHX42cRfQAD9xU++VuuLcyrvh/lPM0rab9IOvZ7BZ8w9
         pwbg==
X-Forwarded-Encrypted: i=1; AKwUvByNz2PMED7qRWeMu87YhrNW+z4irWsbx5OGkVRKNxSLhfWGA73Wkw3C5AxjKsJsQH3vrJtp2oDOa6HoI8o=@vger.kernel.org
X-Gm-Message-State: AFuF++nHY86tJbqmoaUgVIU4z6CtL2DO6+oVwbeemnlBVJp5RpziadDl
	hbuWd87xZM0GVNsT7FDlv9C8oDib7VL5FUOYRFKWdYr4KLlM5H+c3Q0k0evDuYSeU2EU9faNfQl
	X5W4LPlUhLIbtCxEhWTYUQZS55YGqCHLk3SbPaITA
X-Gm-Gg: AYBFou0DG2NPzVH8YJPg1m1cEFLv6plOpkjm4LqoM7JoXuSzeCcvJfnk2xRSKC/TQiH
	NodInw6pI/fV7bfnFR2Iekp3T/Puvhnts7IK3hjNHTMbtnCMp9+488ytFV8/CpngN+UqqmxPTGg
	/7ksVlfmJLn8+IVX2bGIdfilvJ+O0Lv7x31m+J21C3SLpj7gFwLka8jnzaQ1GkWQfvvM0aA5Gj8
	2mpjp14DquCHLbCTyXpJaGcEXous1S8yw1UPMzc9ukanwWaXVHt4rua9Boswb+uSiMsMwtqkz+L
	YlLciPHqevd7ZCy//fp3W/tAJhmMoGIbgPvTF2iQViT6FiH85s21Ci05HdljUo52Qs0oPvV6MlO
	BRzR6/QYMabV7WyPdo7nxUDCU166C++mgtg==
X-Received: by 2002:a17:902:ea09:b0:2ca:6bf:5bac with SMTP id
 d9443c01a7336-2dd2ce1d368mr3248775ad.8.1789086238978; Thu, 10 Sep 2026
 17:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909191136.3811892-2-hramamurthy@google.com> <178907842956.219967.4077695444710153181@kernel.org>
In-Reply-To: <178907842956.219967.4077695444710153181@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 10 Sep 2026 17:23:47 -0700
X-Gm-Features: AcwNN1W7h8BCT1HfUY5jlvBtlhd4Vt-El5VfmDAA3SO96n8igRuwiM-3v0cCp9E
Message-ID: <CAEAWyHdw=W9P3OWwc+=wHe4-=kMKquRddkoSX9om8PW-mfjKjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 01/12] gve: add struct gve_device_info to hold
 device properties
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, joshwash@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, jordanrhee@google.com, 
	willemb@google.com, nktgrg@google.com, maolson@google.com, thostet@google.com, 
	jacob.e.keller@intel.com, debarghyak@google.com, kees@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	przemyslaw.kitszel@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:13=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> - [Low] After this patch, struct gve_priv still declares `u16
>   default_num_queues; /* default num queues to set up */` (gve.h:856)=E2=
=80=A6
> - [Low] Stale comment: gve_probe() still states "Features might be set in
>   other locations as well (such as `gve_adminq_describe_device`)."=E2=80=
=A6
>
> --
>
> gve: add struct gve_device_info to hold device properties
>
> This adds struct gve_device_info as a single place to hold the properties
> negotiated with the device, converts gve_adminq_describe_device() and its
> helpers to fill that structure, and moves the code that applies those
> properties to priv/netdev into gve_init_priv().
>
> A couple of questions on leftovers from the conversion.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethern=
et/google/gve/gve.h
> > index c280ff35ee771..021adb9108dff 100644
> > --- a/drivers/net/ethernet/google/gve/gve.h
> > +++ b/drivers/net/ethernet/google/gve/gve.h
> > @@ -797,6 +797,34 @@ struct gve_ptp {
> >       struct gve_priv *priv;
> >  };
> >
> > +struct gve_device_info {
> > +     enum gve_queue_format queue_format;
> > +     u16 default_tx_queues;
> > +     u16 default_rx_queues;
> > +     u16 max_tx_queues;
> > +     u16 max_rx_queues;
> > +     u16 default_tx_ring_size;
> > +     u16 default_rx_ring_size;
> > +     u16 max_tx_ring_size;
> > +     u16 max_rx_ring_size;
> > +     u16 min_tx_ring_size;
> > +     u16 min_rx_ring_size;
> > +     u16 max_mtu;
> > +     u8 mac[ETH_ALEN];
> > +     u16 max_rx_buffer_size;
> > +     u16 header_buf_size;
> > +     u32 max_flow_rules;
> > +     u16 rss_key_size;
> > +     u16 rss_lut_size;
> > +     u16 tx_pages_per_qpl;
> > +     u16 num_event_counters;
> > +     u64 max_registered_pages;
> > +     bool default_min_ring_size;
> > +     bool nic_timestamp_supported;
> > +     bool modify_ring_size_enabled;
> > +     bool cache_rss_config;
> > +};
> > +
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net=
/ethernet/google/gve/gve_adminq.c
> > index f05f4895f4c74..512349c5517f4 100644
> > --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> > +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
>
> [ ... ]
>
> > @@ -190,7 +190,7 @@ void gve_parse_device_option(struct gve_priv *priv,
> >
> >               /* device has not provided min ring size */
> >               if (option_length =3D=3D GVE_DEVICE_OPTION_NO_MIN_RING_SI=
ZE)
> > -                     priv->default_min_ring_size =3D true;
> > +                     priv->device_info.default_min_ring_size =3D true;
> >               break;
>
> [ ... ]
>
> > @@ -946,77 +949,105 @@ static void gve_enable_supported_features(struct=
 gve_priv *priv,
>
> [ ... ]
>
> >       if (dev_op_flow_steering &&
> >           (supported_features_mask & GVE_SUP_FLOW_STEERING_MASK)) {
> >               if (dev_op_flow_steering->max_flow_rules) {
> > -                     priv->max_flow_rules =3D
> > +                     info->max_flow_rules =3D
> >                               be32_to_cpu(dev_op_flow_steering->max_flo=
w_rules);
> > -                     priv->dev->hw_features |=3D NETIF_F_NTUPLE;
> >                       dev_info(&priv->pdev->dev,
> >                                "FLOW STEERING device option enabled wit=
h max rule limit of %u.\n",
> > -                              priv->max_flow_rules);
> > +                              info->max_flow_rules);
> >               }
> >       }
>
> [Severity: Low]
> With this hunk, the NETIF_F_NTUPLE assignment leaves the describe-device
> path entirely, so is the comment in gve_probe() now stale?
>
> drivers/net/ethernet/google/gve/gve_main.c:gve_probe() {
>         /* Set default and supported features.
>          *
>          * Features might be set in other locations as well (such as
>          * `gve_adminq_describe_device`).
>          */
>         dev->hw_features =3D NETIF_F_HIGHDMA;
>         ...
> }
>
> A grep of gve_adminq.c at this commit shows no remaining write to
> priv->dev->hw_features (only dev_err() logging and a read of
> priv->dev->features in gve_adminq_create_rx_queue()), since the only such
> write moved to gve_init_priv():
>
>         priv->max_flow_rules =3D device_info->max_flow_rules;
>         if (priv->max_flow_rules)
>                 priv->dev->hw_features |=3D NETIF_F_NTUPLE;
>
> Should the comment point at gve_init_priv() instead, given a second
> describe-device implementation (MailboxQ) is being added on top of this?
>
> [ ... ]
>
> > @@ -1595,6 +1618,8 @@ int gve_set_num_ntfy_blks(struct gve_priv *priv)
> >
> >  void gve_set_num_queues(struct gve_priv *priv)
> >  {
> > +     struct gve_device_info *device_info =3D &priv->device_info;
> > +
> >       priv->tx_cfg.max_queues =3D
> >               min_t(int, priv->tx_cfg.max_queues, priv->num_ntfy_blks /=
 2);
> >       priv->rx_cfg.max_queues =3D
> > @@ -1602,10 +1627,13 @@ void gve_set_num_queues(struct gve_priv *priv)
> >
> >       priv->tx_cfg.num_queues =3D priv->tx_cfg.max_queues;
> >       priv->rx_cfg.num_queues =3D priv->rx_cfg.max_queues;
> > -     if (priv->default_num_queues > 0) {
> > -             priv->tx_cfg.num_queues =3D min_t(int, priv->default_num_=
queues,
> > +     if (device_info->default_tx_queues > 0)
> > +             priv->tx_cfg.num_queues =3D min_t(int,
> > +                                             device_info->default_tx_q=
ueues,
> >                                               priv->tx_cfg.num_queues);
> > -             priv->rx_cfg.num_queues =3D min_t(int, priv->default_num_=
queues,
> > +
> > +     if (device_info->default_rx_queues > 0)
> > +             priv->rx_cfg.num_queues =3D min_t(int,
> > +                                             device_info->default_rx_q=
ueues,
> >                                               priv->rx_cfg.num_queues);
> > -     }
> >  }
>
> [Severity: Low]
> Should the now-unused copies of these fields be dropped from struct
> gve_priv in the same patch?
>
> After this conversion, struct gve_priv still declares:
>
>         bool default_min_ring_size;
>         ...
>         u16 default_num_queues; /* default num queues to set up */
>
> but nothing in drivers/net/ethernet/google/gve/ writes or reads either on=
e
> any more.  The last writer of priv->default_num_queues was
> gve_set_queue_properties(), which became gve_fill_device_info() setting
> device_info->default_tx_queues/default_rx_queues, and the last reader is
> this gve_set_num_queues() hunk.  Similarly gve_parse_device_option() now
> sets priv->device_info.default_min_ring_size and
> gve_enable_supported_features() reads info->default_min_ring_size.
>
> A grep at this commit only finds the declarations:
>
>         drivers/net/ethernet/google/gve/gve.h
>           822:  bool default_min_ring_size;    /* gve_device_info */
>           849:  bool default_min_ring_size;    /* gve_priv, no users */
>           856:  u16 default_num_queues;        /* gve_priv, no users */
>
> Since the leftover gve_priv fields share names with live gve_device_info
> members, could later code (for instance the MailboxQ path) read
> priv->default_num_queues or priv->default_min_ring_size and silently get
> 0/false?

No, MailboxQ won't use these fields. Since this patch was already
quite substantial, I wanted it focused on the introduction of the
struct gve_device_info and its usage in the driver. I can send a clean
up patch later for this and the comment clean-up comment above.

>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 9cc343a162712..d3882de584e36 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -2507,12 +2523,34 @@ static int gve_init_priv(struct gve_priv *priv,=
 bool skip_describe_device)
> > +     priv->max_flow_rules =3D device_info->max_flow_rules;
> > +     if (priv->max_flow_rules)
> > +             priv->dev->hw_features |=3D NETIF_F_NTUPLE;
> > +
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909191136.3811892-1-hramamurthy%40google.com
