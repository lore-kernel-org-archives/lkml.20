Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA83248F72
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088786; cv=pass; b=Ap7MjV//cGSFWw1V+UeRkj2QAvgyg+aDy74XM+cRWUtBbzOqU7VLg1b3z+Gh60RhQo4tbqAlgSjataWzS+n6n8U/s/OLi+U9V/HJsPuxZ7PKS27hOV/zZ7PFegLvUA6VvjtqRNXtIgWjjTGPo8ajMBOMAcPmuGb3hdv/5E0lXvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088786; c=relaxed/simple;
	bh=3anrTnb9b6fjm1Z1Gs58eq0Nwh9F0aeBL5GbmkzMyeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVjrsahnSYoISUzla9dwKi+S5fPUi95PlmqfM+gsKXXl8GzZjUZlsZUes1fSBI+9Y1z+RCkOArPKvBSI6WMuOFi8AJm/P5jCzJvirLzSV+qe5KfgXwU7toy5stxWN3t8r4l757iJn8BdTESH7qEx1j35yK7uv2MR8T/rnXJzf8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uKaoqAfy; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uKaoqAfy"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff3aca06so24155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789088785; cv=none;
        d=google.com; s=arc-20260327;
        b=iDgnoFt1Yg9y2cShHLSRhOlBofhV6EDHltiAMsP8x9R++ihupKYTG6o1Ijh5Pp8Gq1
         a36r/M3UWA620+f22Lka1bl/T/tbeKvxysg9YzD9T9u5cerquE7/zJqai57VjYUBlh3g
         eO8mMHWdn/NJX8P2Msac9jUX4cckstJ3MkxA+zVvowjw5E7qPV7bDCprjODu3qjRkr9w
         hJuITsgjMjdVvLxLSl/b+X9NWCAPjMb046KX3n6BFqQloleaBLOlaMx3dSfnRiYpxEeI
         ae0nh4ZEs1AXRV3KUQYkdlPJubxHrgmmTrGIZSlg+QVFpc28WCKZ+c9JRLdwtc7XwTQw
         g9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kU6ol/MFIe6+8xDTyzZWs/daSwbhi6L9UOvBpCwlXMg=;
        fh=egvaBjDRctlSXjwo1r1He8I5shRw45RK26WmIMLs8CU=;
        b=XQJU/cj6o+tjUjPIvsePwwFikRKae7+rMqGqVt4ZCXKjDMTw9bBaRUhhttum2A9H0k
         n2ZR0TIvV4ilF3yNTvFupHSHbctTOdBxBeXsykjKi5btSqYjLPwcfFSK4VTNEMY1VZ55
         9MwsgA56JjZzBGW97qyLuRn0UeqMwCD7nnYEJ3H5mGXSWyhD86FK0qmtKZzjPtY60WbC
         Z88vATEP35t01ghVk0yLL1etOKrNYvKaZritBIJDN++rHSP+L+nrkMhHkqI6chCXu8xa
         sLe0IQeycUKhXKM3c/dM1QSbfX2zhWDKFpROV4MqMX7ewDtVvmUqYvXjCuj2GEG4HODw
         /RzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789088785; x=1789693585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kU6ol/MFIe6+8xDTyzZWs/daSwbhi6L9UOvBpCwlXMg=;
        b=uKaoqAfyAK1US82kJrofqYNSq/aXj8ugYa/215IRJcx/Je7PFnh9F+t8deidOgXV1H
         NbBQdiloRub5AvcYPObRPfDRdQxw6sfgRvXzP6fsYSOFGtFH+WBWqNoxoRa7fdF22qmE
         HbS7L9CCBxZZwAts9m5UajjiMXoV+SJQka7WZGWyLwATxkTgum8OFbzm2mH/HdwA1ahs
         J6nWy9d939Ux9RpM/j81/6zJPXRFsloS6b21W9n2LTyOMCIAnFtXX1BEXDnbp54zDIFx
         QHg+mcoSnJJvQKDAQ5sArlsv+TPnoYDIDb52Iw2xbA784/oWeAKGDSn5jhFplNRZeYbv
         h9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088785; x=1789693585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kU6ol/MFIe6+8xDTyzZWs/daSwbhi6L9UOvBpCwlXMg=;
        b=F88kh6exff2My7Kd7bQQXDHuxxVUaACJXV1ypTUK6TXcOCoWE0LPej3J4o96PX2KRM
         jGvakgVYYdl/JDak2vlQzhguA2lCH3wPAVf6MQyCCeqd3PuWpxJi3PVBUFTiqhf3+LUx
         uIv9Q/UwwTBEhmkm/Bme2GgJRlaPv+rWmIDbK1xGRBSW+32qEAYSyQauTxTY1N0HxuVk
         shtLh5qcAaJALTLzwpFcaHo1WqvX6Plt2CAPHyWl19jy471+hm0voJtnAiR/7jg+zhXF
         bj24zBS4aj6EYK8k29q/srMH3GPFIi05oCSa/3FAMlqkFZqGzTq3K4GL7EkvohsehteV
         dlLA==
X-Forwarded-Encrypted: i=1; AKwUvBz5qq6t2lZCBz+o1Qj5mXSjEo8emnkYGSi+FB8PSNxJiAra+tMpCzHg7YQJBCXf8pYvJi6eYgA5mUU11YI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFCjDTQ2eIj6PK8aUa2qwPMw/uwUT/5R/xB5Fmai4KxNx/VRe/
	MJhGrHFMCpsE3wJ4afY5G8zZA4a95yjY7luxYBdygnlCHJPJnnYpqBgYrthfDfelvOGJYDgSGL8
	1r3Iip+GHdhrouZpP40lQtE13DiQarVcr0C9YQbzb
X-Gm-Gg: AYBFou15pl2n4JR0xMrXZ8qlFgmkh159Gt/sPDGfIsVadT9CB7noquk0KcLgTt6m7ml
	2u6KrC9AcoeA7G+IRrL7zr/ATzblr7VpDLjTLmcxFMx4trq+jxi/fVGdpQ+BtHuScoK9/v8Aom8
	rH0NISIOO0n8zeYG6UoKsngxDcwvNfYqGGWkiK2iaL7Ts7y/mtbuswG77p30fxCQ34Pv1HqL1hu
	RfDk/WBFpxj5XW3OwwOdTwa3i0049G5mL2MJbgNvuF5+j8BkNTWrPAQdfS6GfN0GRdce3GJ5DvB
	w+TNDC1ZfMVxjrrWzg2kY21PhVnru8PUt+9iOjhb+Yn4TYf2V477RWTOuLFN/q3n5vuSkj5YvN1
	vYV3I7M3SbjPwShgV+40YSHk=
X-Received: by 2002:a17:902:ce09:b0:2db:2225:d2fd with SMTP id
 d9443c01a7336-2dd2ce422edmr3459955ad.16.1789088784189; Thu, 10 Sep 2026
 18:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909191136.3811892-6-hramamurthy@google.com> <178907843311.219967.13433516854329401694@kernel.org>
In-Reply-To: <178907843311.219967.13433516854329401694@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 10 Sep 2026 18:06:13 -0700
X-Gm-Features: AcwNN1Uk7_qMvIJF9mycrrKKlRnRcORMjJ7A-sPV6chshJ4vmGdQiU29r_8muRM
Message-ID: <CAEAWyHdVGwmQzL8uki7081YCydV4v=vL9cXjz_5XY2Kn=ad4rg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/12] gve: refactor gve_init_priv for reset path
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 (1) =C2=B7 Low: 1
>
> - [Low] In `gve_reset_recovery()`
>   (drivers/net/ethernet/google/gve/gve_main.c:2561-2564) a `gve_open()`=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] Hardware-state divergence after a failed queue bring-up in
>   reset recovery: when `gve_reset_recovery()` gets an error from=E2=80=A6
>
> --
>
> gve: refactor gve_init_priv for reset path
>
> gve_init_priv() is reduced to only populating priv with device properties
> so it can be called once from gve_probe(), with the new gve_adminq_init()
> and gve_setup_device() helpers taking over adminq allocation and device
> setup. gve_reset_recovery() now calls those helpers directly instead of
> going through gve_init_priv().
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index addfd8dc1a1a2..2fe280cf7e680 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -2566,15 +2541,32 @@ static int gve_reset_recovery(struct gve_priv *=
priv, bool was_up)
> >  {
> >       int err;
> >
> > -     err =3D gve_init_priv(priv, true);
> > -     if (err)
> > +     err =3D gve_adminq_init(priv);
> > +     if (err) {
> > +             dev_err(&priv->pdev->dev,
> > +                     "Failed to alloc admin queue: err=3D%d\n", err);
> >               goto err;
> > +     }
> > +
> > +     err =3D gve_adminq_verify_driver_compatibility(priv);
> > +     if (err) {
> > +             dev_err(&priv->pdev->dev,
> > +                     "Could not verify driver compatibility: err=3D%d\=
n", err);
> > +             goto err_free_adminq;
> > +     }
> > +
> > +     err =3D gve_setup_device(priv);
> > +     if (err)
> > +             goto err_free_adminq;
> >       if (was_up) {
> >               err =3D gve_open(priv->dev);
> >               if (err)
> > -                     goto err;
> > +                     return err;
> >       }
>
> [Severity: Low]
>
> The gve_open() failure in gve_reset_recovery() changes from "goto err" to
> "return err", so it no longer reaches the shared label:
>
> err:
>         dev_err(&priv->pdev->dev, "Reset failed! !!! DISABLING ALL QUEUES=
 !!!\n");
>         gve_turndown(priv);
>         return err;
>
> Is dropping the "Reset failed" message and the gve_turndown(priv) call on
> that path intended?  A failing gve_open() during recovery (for example
> gve_queues_mem_alloc() returning -ENOMEM under memory pressure) now
> returns silently to gve_reset(), which only prints its own message.
>
> The commit message says:
>
>     These changes are only code movement, no functional change.
>
> Would it be worth mentioning this behaviour change above the "---" line s=
o
> it survives in git history?  The v3 changelog note "don't free device
> resources if gve_open() fails in the reset path" is below the cut and doe=
s
> not mention the lost diagnostic or the skipped gve_turndown().
>
> For what it is worth, the later commit "gve: simplify reset logic"
> (84559f54c263) restores both: gve_recover() sends a gve_open() failure to
> its teardown_device label, which logs "Recover failed! !!! DISABLING ALL
> QUEUES !!!" and calls gve_teardown_device().
>
> [Severity: Medium]
>
> This isn't a bug introduced by this patch, but the same "return err" path
> leaves the device without any reset after a partially completed queue
> bring-up, and the refactor is a good opportunity to ask about it.
>
> When gve_open() -> gve_queues_start() fails after gve_register_qpls() or
> after some queues were created, it takes its reset label, and because
> GVE_PRIV_FLAGS_RESET_IN_PROGRESS is set it skips the reset and frees the
> ring and QPL memory instead:
>
> reset:
>         if (gve_get_reset_in_progress(priv))
>                 goto stop_and_free_rings;
>         gve_reset_and_teardown(priv, true);
> ...
> stop_and_free_rings:
>         gve_tx_stop_rings(priv, gve_num_tx_queues(priv));
>         gve_rx_stop_rings(priv, priv->rx_cfg.num_queues);
>         gve_queues_mem_remove(priv);
>         return err;
>
> gve_register_qpls() and gve_create_rings() rely on the assumption that
> "this failure will trigger a reset - no need to clean up", but on this pa=
th
> no gve_adminq_free()/gve_adminq_release() runs, so nothing writes
> GVE_DRIVER_STATUS_RESET_MASK.
>
> Can the NIC then be left with queues created and page lists registered th=
at
> reference DMA memory the driver has just released?  The baseline code had
> the same gap, since its "goto err" only logged and called gve_turndown().
>
> Here too the end of the series appears to close this: gve_recover() route=
s
> the gve_open() failure to gve_teardown_device(), which calls
> gve_adminq_free() and therefore gve_adminq_release().

As the AI notes, both the issues it has flagged are resolved in the
next patch in the series.

>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909191136.3811892-1-hramamurthy%40google.com
