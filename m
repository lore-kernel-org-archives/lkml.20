Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1802D238F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088312; cv=pass; b=Qe8ded4vDkOpT9wWwtn3SU0+YGcAP+zX3/AfvLw/WyslqMDmlZVzHbBDInHxI3O0EplRxsnWJcicD5HqAohsC+Tmh1f5WOZheLdNdP/4ur1eIsxsXG1ESKBRTtpbbsdHiomlk+grmnZNKM4x/vUQV3hDaI1UeVYfTkI7MwTO+xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088312; c=relaxed/simple;
	bh=4drBGv6YyhxyX+VShit8G9MBohafzwBZaOD9UZFnRQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEOMhRXX5BY/mrTfkopgGLjr2jX8NT+5k/pKMNh/X6bPx+ob5VkOJkZMOppZg/A1CItcHhRyqaVtjXS0iWqygIZNSwIC7AGxU6wuubTxaLD8sNWDobHLh9FUOakMhewBhWk9dXuXq1DR78sPRMRHE25H+lluK4lib/0NmZBaKls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kw0wluWR; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kw0wluWR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so24965ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789088310; cv=none;
        d=google.com; s=arc-20260327;
        b=k82jDxwWL5Ql6TYSuqnF2J3twWZgXwJ/6H5/uSq5A5+f3eqZLK1FwTjDHt8j+1LaM1
         BAsCtLa2wVBTWO7y8myWG32Gv5I1m3Zt2AdbOZ5TT40r1gWGhgtv8G8Be6tdVIzu5E8/
         lSJqsmUnOHyuj//AIUQi3b52joihy6KuqqkJQEMNO6v5lT2T4bpPK28pu/f/vvuuYtsw
         v/BJiILkUkAxMx2VF9A6HPoEQLUUxXy2SqCZAgwkgH/efDLMwmD7V3I8l4Zt5aY6+Ea3
         buGsbArnqH09g7K6eX2dgOi5RpiCGkan0jCJDMr8jR5GRwEH51qAguOE0qqOOYT0J3Dv
         N2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMOObWcWSTTmBPNIJxB9A2ZkbRi5NCB7Xm1BYtKAyac=;
        fh=mdBOUtpnK2UMV5IIz4pPauK/zZO03YViEUpShFlf3XI=;
        b=M8ot6oSI9rD+6q+VV6lPFPvK2pM5oPw4usPMa1fK8krONmbjKdFl3g1wmw1393Ya3U
         flopnznSN2U3z5Ci1wqWhBKBtSQEBztIRk5eg2Wd7s6g7W7E9gdG0Z6g+hpRQy7plSXY
         TcrypbtFqI9azjFepVZ2bhtlA02j2RXaonVCllOxtVKfSv4vepPfy3095CD17Z1Mq/2m
         uz1Od45Rdb38LK5laIY3b07Q6c0JKDkKh2xY+jCbJKbxw+2qCR1jwfxjJHlZhiPvo6Q/
         4ZbckQN005t8dGSQT++OuzMSr04UZ4VBOJpF2akC+ngzZ3+9/cLmv8wQLBUeWc2f+uia
         CFHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789088310; x=1789693110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMOObWcWSTTmBPNIJxB9A2ZkbRi5NCB7Xm1BYtKAyac=;
        b=Kw0wluWRedRrcMdEgZz1C7knjgl71xNhzL+jxjanDdyM3D7bOb+S26t01D7taZgTPU
         MQ2YH3d70/sl2e70XaiN6xocyXFTC/VsIioObNmqpSaaxSIW+E69a/DJuCR77GsilF+L
         XqRdSRtt3Ey5Nv+W0OBTSndKKZ4/cseeK/HULMHhPFYAXyEBiKGudu50KA0nvUgc3BTj
         0QNtoZVoFccm1VVOtosWf2+lPAzVzLtHzSF4aoRSmEvgNweAXgrNkO2K/OwPgip03OEk
         kHcC+qZe3q5E3h4s+AINILraJaQwkX+wbFr5wPAnwAKXGWOvSqTW3uYebqsKKpyQRTcA
         emkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088310; x=1789693110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMOObWcWSTTmBPNIJxB9A2ZkbRi5NCB7Xm1BYtKAyac=;
        b=iOZoxiTWW0fb0QKPKjeD79jq8EASXwuRwGdXO3At81Q/xXKygS0ibjDea5mnv4ETl6
         iJhvOtGZtSylHG3V72JTkUtsMGgFd2wSNYYDN/+o88N55GvaeN7LrWia6vKMaGVdkX4d
         pSPvlD9INQXFoNcmcpIk3iTpjzzRO5gP/UeV7hv8sgPq/WQaHThJwjpa1dV4szMzqkQb
         8vwq8pFdVHnp51eYPm19hHIPHcqfoBq2ODFpWskFIgPIOaJ2E2sjQuUqrsCTqrHipTg6
         K3szm9ST+Y7qARdHgggWSyF+7R7v8Q2ISvnwwWV2thqNKmIDRajv/QAPhgtAV77P28LM
         4z8A==
X-Forwarded-Encrypted: i=1; AKwUvBwPsNypLhJ9pubXcpIe65lIeLh2vbI1Il3vDs9KVEmsDQxWWS9YEsXHyc/GwC1O/BV+a+7kx5eiqETtBdg=@vger.kernel.org
X-Gm-Message-State: AFuF++ngFLF+hZxNEr0HCac3AOFnYSNRW91ZJEOYOzbutwACV9ZahDHl
	1TFEYDskfaPqOzaoZxP0SA1o3rI/hA8bsURLfcz5IGZwBQ2Nsdvt6lWQImuwE3qfc3U6jaSjd/Z
	Zvz60d848pEuXAO8VWtUMfNASHs8Si7butEkfhA/a
X-Gm-Gg: AYBFou3cvUapmhXORX4kBjJyDLIUlLXqhAw0ykOPQykOK6Tfxbj3O2uj7vSgyU3ClO+
	me1aUWuurCkcfAhzqVKPILeLUirpOd58VI28eG+tKyM7vuml4wjMb7CURr7HuHDXQjba+iLU8dY
	X4YmUL+af4apGH9O26InODWgW2WgWbZHDyHFqFjtnzj8r6ow6wCLGLqpVLrhppnELBdEteiUEhK
	4v/GpgcdG+vEOobQf041uATQG8pzFq4tCzVj5DaH3Taj0GYv2zb9UderiWM7E5zS9jXERQ8CJ1B
	ZGvH6eLf9gcHQ5VM4IPhv1pXkYoYRLn3Jte8qJIl3ROBqa3u/88poWZJlyWeALew9gShd57khDM
	Mm+WA0hESYzyb5r6L4OUbD8gNBo2E8T5OZg==
X-Received: by 2002:a17:902:f686:b0:2db:a1c:be59 with SMTP id
 d9443c01a7336-2dd2f53925emr1750545ad.7.1789088309766; Thu, 10 Sep 2026
 17:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909191136.3811892-5-hramamurthy@google.com> <178907843138.219967.17268659724650641980@kernel.org>
In-Reply-To: <178907843138.219967.17268659724650641980@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 10 Sep 2026 17:58:18 -0700
X-Gm-Features: AcwNN1VDb-6nUoUNVsNwOs9BNQUF7tG5NDKWvlmE8TeyMwOHffTvadhBRirJUzo
Message-ID: <CAEAWyHf63MgBXY2UvdyUx4M=Kb_73rBmwD2rUBGfAk1XOFMPmQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 04/12] gve: introduce gve_adminq_get_device_properties()
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
> - [Low] gve_adminq_get_device_properties()
>   (drivers/net/ethernet/google/gve/gve_adminq.c:1148) bundles=E2=80=A6
>
> Pre-existing issues:
> - [Medium] gve_adminq_verify_driver_compatibility()
>   (drivers/net/ethernet/google/gve/gve_adminq.c:1264, moved verbatim=E2=
=80=A6
>
> --
>
> gve: introduce gve_adminq_get_device_properties()
>
> This adds gve_adminq_get_device_properties(), a helper that runs the
> VERIFY_DRIVER_COMPATIBILITY and DESCRIBE_DEVICE admin queue commands in
> sequence, and moves the driver-info allocation and fill-in from
> gve_main.c into gve_adminq_verify_driver_compatibility().  The commit
> message describes it as pure code movement with no functional change.
>
> No Link: tags present in the commit header.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net=
/ethernet/google/gve/gve_adminq.c
> > index 046155ae7d669..f420a8e1dd3df 100644
> > --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> > +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
>
> [ ... ]
>
> > @@ -1143,6 +1145,27 @@ int gve_adminq_describe_device(struct gve_priv *=
priv)
> >       return err;
> >  }
> >
> > +int gve_adminq_get_device_properties(struct gve_priv *priv)
> > +{
> > +     int err;
> > +
> > +     err =3D gve_adminq_verify_driver_compatibility(priv);
> > +     if (err) {
> > +             dev_err(&priv->pdev->dev,
> > +                     "Could not verify driver compatibility: err=3D%d\=
n", err);
> > +             return err;
> > +     }
> > +
> > +     /* Get the initial information we need from the device */
> > +     err =3D gve_adminq_describe_device(priv);
> > +     if (err) {
> > +             dev_err(&priv->pdev->dev,
> > +                     "Could not get device information: err=3D%d\n", e=
rr);
> > +             return err;
> > +     }
> > +     return 0;
> > +}
>
> [Severity: Low]
> Should this helper also carry the state handling that gve_init_priv()
> currently performs around the same two commands?
>
> gve_init_priv() in gve_main.c does this before calling
> gve_adminq_describe_device():
>
>         priv->num_registered_pages =3D 0;
>
>         if (skip_describe_device)
>                 goto setup_device;
>
>         device_info->queue_format =3D GVE_QUEUE_FORMAT_UNSPECIFIED;
>         /* Get the initial information we need from the device */
>         err =3D gve_adminq_describe_device(priv);
>
> The queue_format reset matters because gve_adminq_describe_device()
> consumes the incoming value:
>
>         } else if (device_info->queue_format =3D=3D GVE_GQI_RDA_FORMAT) {
>                 dev_info(&priv->pdev->dev,
>                          "Driver is running with GQI RDA queue format.\n"=
);
>
> A caller that invokes gve_adminq_get_device_properties() with a stale
> non-zero device_info.queue_format would keep the previous format and end
> up with supported_features_mask left at 0, silently disabling jumbo
> frames, buffer sizes, modify-ring, flow steering, RSS and timestamps.
>
> For the record, this does not appear to be reachable anywhere: at this
> commit gve_adminq_get_device_properties() has no callers, only the
> prototype in gve_adminq.h and the definition, and gve_init_priv() still
> calls gve_adminq_describe_device() directly with the reset in place.  By
> the end of the series the concern is resolved rather than left latent:
> the single call site in gve_probe() does
>
>         priv->device_info.queue_format =3D GVE_QUEUE_FORMAT_UNSPECIFIED;
>         err =3D gve_adminq_get_device_properties(priv);

Like the AI notes, when gve_adminq_get_device_properties() is actually
used later in the series, things are setup to run properly.
>
> skip_describe_device no longer exists in the driver, and
> priv->num_registered_pages =3D 0 has moved into gve_setup_device().  Woul=
d
> it be worth a note in the commit message that the surrounding state
> handling stays with the caller?
>
> > @@ -1205,20 +1228,53 @@ int gve_adminq_report_stats(struct gve_priv *pr=
iv, u64 stats_report_len,
> >       return gve_adminq_execute_cmd(priv, &cmd);
> >  }
> >
> > -int gve_adminq_verify_driver_compatibility(struct gve_priv *priv,
> > -                                        u64 driver_info_len,
> > -                                        dma_addr_t driver_info_addr)
> > +int gve_adminq_verify_driver_compatibility(struct gve_priv *priv)
> >  {
> > +     struct gve_driver_info *driver_info;
> >       union gve_adminq_command cmd;
> > +     dma_addr_t driver_info_bus;
> > +     int err;
> > +
> > +     driver_info =3D dma_alloc_coherent(&priv->pdev->dev,
> > +                                      sizeof(struct gve_driver_info),
> > +                                      &driver_info_bus, GFP_KERNEL);
> > +     if (!driver_info)
> > +             return -ENOMEM;
>
> [ ... ]
>
> > -     return gve_adminq_execute_cmd(priv, &cmd);
> > +     err =3D gve_adminq_execute_cmd(priv, &cmd);
> > +
> > +     /* It's ok if the device doesn't support this */
> > +     if (err =3D=3D -EOPNOTSUPP)
> > +             err =3D 0;
> > +
> > +     dma_free_coherent(&priv->pdev->dev,
> > +                       sizeof(struct gve_driver_info),
> > +                       driver_info, driver_info_bus);
> > +     return err;
> >  }
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but is it safe to hand
> driver_info back to the DMA allocator when the admin queue timed out?
>
> The identical sequence lived in gve_verify_driver_compatibility() in
> gve_main.c before the move, so this is only being relocated here.
>
> On the timeout path gve_adminq_kick_and_wait() has already rung the
> doorbell and gives up without quiescing the queue:
>
>         gve_adminq_kick_cmd(priv, head);
>         if (!gve_adminq_wait_for_cmd(priv, head)) {
>                 dev_err(&priv->pdev->dev, "AQ commands timed out, need to=
 reset AQ\n");
>                 priv->adminq_timeouts++;
>                 return -ENOTRECOVERABLE;
>         }
>
> The VERIFY_DRIVER_COMPATIBILITY descriptor still carries
> driver_info_bus, so after gve_adminq_execute_cmd() returns
> -ENOTRECOVERABLE the buffer is released while the device may still
> fetch it.  Can the NIC read driver_info after dma_free_coherent() has
> returned it to the allocator?

This is a non-issue. If there is a timeout and the device is not
responding, the driver resets the device and frees the AdminQ.
>
> The same unconditional-free-after-execute pattern is used by
> gve_adminq_register_page_list(), gve_adminq_execute_extended_cmd() and
> gve_adminq_describe_device(), so if this is worth addressing it looks
> like a separate change rather than something for this code movement.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909191136.3811892-1-hramamurthy%40google.com
