Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793694827;
	b=BgzVXw6cUYtWbHyfesiyUxlSKQQ6udWaiqSjyR4TzguZ7PZQRqrJ13mWI4TCCYo0trD/
	 aRav72zxkIkCxWCklblIHISM23yKc1LQ8Ok3sD21jPyksW08wbWwom0s2acYh+4YPv0Q2
	 YAyOlpfhzUhgJtdeHgmTQnbl9uSkM53hBrITl4BulQOYTn70z7SZnNdJHrfG2COuV4CUi
	 pvGOvQgxzLxwGDa32AJ2gLBzUGX9GWxUveq6pJP0ZmG3XjoqoQwSl77QcxFo9k5geTz7T
	 sWuj+zVAEsdYvxJw+dcLOjT5YEvlPJBKNtrBzGrvqoaIIujbv5LxT7dFzOVNVnzV3wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HwF4S5bxm2j9EzIyz1SC/J8IudB+3qt9yXUwER1aUJM=;
	b=P9t3B+/io0MJ1psds1m5dYTCQBjvTDlxW93YPrD0oE8+M0xdbLSYEGW+UciGOOcNLc8O
	 jWGCIKz2IG948qqyCr/UTCfNB1fOy9PwjKQydzXBjq+OOWNabT++7jdf4ZX+bZWe3sq5A
	 M55zw1kGNZ9MtxpJJdS3Sv1GQgRwjPHtifoA6pGkbv4bhjQ2RyPVRGzN2/D8TxqswkaTl
	 VCpQc2jmCllIFdqp/YiHCSS9mU7WjppRnAgHe/78WmpgECjOnVJKkGg8MSqp3y2HQPa6v
	 IPQqJJS5EohDh7Yd57WtDvA87w2DxcMW9alA/Tzlzc3aoAU1ZT1O85UrcqixikyXczg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VpKRh5iM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F196076BB5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49F196076BB5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VpKRh5iM
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so1757472a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793694826; cv=none;
        d=google.com; s=arc-20260327;
        b=mPIkBG/CnavQ4hRfk+3aWhD68bBFgXF2N6xR9vCg2tgplMYACV4GUedFMxPfmMtruZ
         XOC1JYTpfxNX2Q0j+41SW+YTAraDno7aM1ySxDCYUrcrv55mS7gTUVtMC3W+FlAQMZjG
         u1ws2pDJs8hvm0fS9DAhBJpyul5QeTLgQjA2vAHEZEQL/oOGpANmnA3lEizISJjk1rq1
         g2gEbqMGjoEAKMoPEzDPxSfSUoCLhAl2fGEj0ThRpYjvoi0P0HwyXUzKyEDm/ZLLQDOB
         suktvYpOnbg1PCt9fzMAfkaZceseLxFUBWjDHD8oS6pFAjqcccfPMQFb50VYXAL3Ej6g
         /0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwF4S5bxm2j9EzIyz1SC/J8IudB+3qt9yXUwER1aUJM=;
        fh=XiE8p6kOEBOCaFNukmermeet6Z7Q9/66j8Htovz1x3g=;
        b=YOeSfCfZcfihJyYiVlW5pr6uGVStnsITb2XFVwOeS+jgTWSAEbZ1Mzj+PDPhLwxbLr
         5htnosPA0yAaUEX3AqW+O5MtLH1A6O9/RMzehgLUmjMERCDTZug01kcybZDEzSCWLjkk
         XEiAvH63PQKIPi/rB/mLdiqsDxXh0OEWoo2zQQ6Z7Dje1o8mpRQ4dbzTCrS3Y+Oq0i/S
         7wpOQSyUQ+NX4BO2vqb5unN6YCv3Vha8QfQTbLSPTBLenedUIm8sQS4z9knoH+OY08bq
         4B8OU61dxa8a0fIUV3muGLqp85XEEWmWbrmGJyssBiQCE7Pp9sMDnBf40TjJrfHobuJX
         iilQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793694826; x=1794299626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HwF4S5bxm2j9EzIyz1SC/J8IudB+3qt9yXUwER1aUJM=;
        b=VpKRh5iMMk/uDrxhCUU+vgVGN8WWGzbo1owdw++3mPZSar70R5Xp3muHRKWC4ssocD
         IsNAJjccanDWxOjWHzQVA31b8YG1buwVNtZnkM4Voz2Ng4zrcFn5pQcZ2WaW0Pucq8wu
         mfqEBP+8X+Abmtx2BhkgfuVox5Reino5rFZUC6QDOR+GwjRRarjUxEFv5HPN7vCbFRWl
         AoGh4tc7INzidBgkx6NDuEB4l1Lo5bUQczEhKFdGeGn+0wDZsOgG+6ujrNPxXdQlfQgW
         7CkruBMfViCHcqnqyQvMKV4BNUg/MOuTHYmUZCdVWu3HU/Wl+juFJ4AAxMATWj7OIDb+
         CsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694826; x=1794299626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwF4S5bxm2j9EzIyz1SC/J8IudB+3qt9yXUwER1aUJM=;
        b=qxp87yw4NPHpfjKKsX34hpIK0LFxEqaXr7aZgf4oA+uDrFzYXFQRo9RDLVXdyWh2wm
         JkR/D/qEwc2PMxsH68hIN2lrytVNa17/3Ybj/MNWZpPm52CBDTunswPyRpEak1mh5P8Z
         1odBJl1Yk0kQw5kSrUGWnstazKZ/W0HjAqcw3Dtt/vM4wvuM3fV3LfRu+ZiswAC8rlhV
         P0ZDBuOvImbbQ/MrOoYQMQRi/BrFVQIvnUc6RIhvnQZLRYtSSHnt6TwZ8FcoyXmD375d
         DQY7RkTBXRMPOU1bmHCVc0TNbDfJ3D8uUmfSJu9Of5MX2fYzPlDc+PVuosXy7YjQby3h
         TRkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1WHSGNmfxDxRQwYvKwTSWNQM41JkCZ7hEMjUhb+wxvgRYafg38LVjG+ko3QnqIgvhu/D53sEl0fXBQYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Frv6cpBBpjS+p49y1hGJNgUcwd6s7cBn4I7NDj9x6X7jntnh6
	ATMGOKFHoUZOf8fNQctXh0H+bHRXY1VOk48GXSeC20gnIj14WNlsz/vWJHdSfKc8Te6fThaWfQq
	qQW0GcQZh0ZGX49kKV9kvxEqk3tpevBlg8GC4Av2e
X-Gm-Gg: AYBFou3Ig76GVFK7O4loEIUfBtsy1kaijfYKBX4OQb+0Q56dhXNkb0EPlYyXkDpfhQ4
	yca+gU2agVfGpwTjZoTQiLTGjNjhFaTJSBkylGjDfngD/b0kRvBb6e7O4ObBrJl+NG9RWyRXJun
	Lb6Pcx6AfYQEnKl7Im9XFJLuCKpsnJlz15cEQAeK+wnlJRv9B6opuY9YJtjl1Pjt94le/o2eYxg
	CaUWQ6E3FuMWMixUNH0ecxjEK9RT5HOVhlz6EI+jwUFL18tx0GyYouaGJJHRsB9tkkeyOv2MY3O
	f9AZjsc7aPQJQfsWg/4ksZpce/AQR66goNlOH7t+aHua7wLd0zUcIHoij8bLvKTzvrO1hj1LEio
	1vXclcWgw+mQLBBAh5r3jKE2Ax3PD1IqM0UVP
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id
 98e67ed59e1d1-3ae897ccf9dmr9830837a91.16.1793694825021; Tue, 03 Nov 2026
 00:33:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029211634.2232784-5-hramamurthy@google.com> <179365432386.3131.15374369453099115031@kernel.org>
In-Reply-To: <179365432386.3131.15374369453099115031@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 3 Nov 2026 00:33:34 -0800
X-Gm-Features: AclHuK8zM-JZ_3yaCoKIW6N5v6Mma-fZLHgYVCQdxl4X3qkS-7jYnU2RPPScwO8
Message-ID: <CAHwYsip2mYupJp3a7JhWCHX9e7U7hHGmqrAGSxzRDBuN_RJJ+Q@mail.gmail.com>
Subject: Re: [PATCH net v4 4/4] gve: Fix link flap after ethtool ops
To: netdev-bot+sashiko@kernel.org
Cc: hramamurthy@google.com, netdev@vger.kernel.org, joshwash@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, willemb@google.com, 
	przemyslaw.kitszel@intel.com, nktgrg@google.com, maolson@google.com, 
	jacob.e.keller@intel.com, pkaligineedi@google.com, yangchun@google.com, 
	patricion@google.com, awogbemila@google.com, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:18=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The patch removes `queue_work(priv->gve_wq, &priv->service_task)`
>   from the end of gve_queues_start()=E2=80=A6
>
> --
>
> gve: Fix link flap after ethtool ops
>
> This patch changes gve_queues_start() to update the carrier state
> synchronously through gve_turnup_and_check_status(), instead of queueing
> the service task to do it. It also takes netdev_lock() around the link
> status update in gve_service_task(), so that update is serialized with
> the synchronous path.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index b5e2f39a903c5..bc7d7c41948c3 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -1494,8 +1526,7 @@ static int gve_queues_start(struct gve_priv *priv=
,
> >                         round_jiffies(jiffies +
> >                               msecs_to_jiffies(priv->stats_report_timer=
_period)));
> >
> > -     gve_turnup(priv);
> > -     queue_work(priv->gve_wq, &priv->service_task);
> > +     gve_turnup_and_check_status(priv);
> >       priv->interface_up_cnt++;
> >       return 0;
>
> [Severity: Low]
> Commit 3b7cc73628ff added this queue_work() for the link status update,
> and the new synchronous check handles that. Does removing it also drop
> the service task run that used to follow every reset recovery?
>
> gve_reset() clears the reset flag first and then disables the service
> task:
>
> gve_reset() {
>     ...
>         gve_clear_do_reset(priv);
>         gve_set_reset_in_progress(priv);
>
>         if (was_up) {
>                 gve_turndown(priv);
>                 ...
>         }
>
>         disable_work(&priv->service_task);
>         ...
>         enable_work(&priv->service_task);
>         err =3D gve_recover(priv, was_up && !skip_queue_setup);
>     ...
> }
>
> gve_schedule_reset() could run after gve_clear_do_reset() but before
> disable_work(). One way is gve_tx_timeout() from dev_watchdog racing
> with gve_turndown(). Another is an RX NAPI error path just before
> napi_disable:
>
> gve_schedule_reset() {
>         gve_set_do_reset(priv);
>         queue_work(priv->gve_wq, &priv->service_task);
> }
>
> In that case, disable_work() cancels the queued work, or queue_work()
> is rejected while the work is disabled. enable_work() does not queue it
> again.
>
> Before this patch, gve_recover()->gve_open()->gve_queues_start() ended
> with queue_work(), so a leftover GVE_PRIV_FLAGS_DO_RESET was handled
> right after recovery.
>
> After this patch, the service task is not queued again until some
> unrelated event, such as a later gve_mgmnt_intr(). When it does run,
> gve_service_task()->gve_handle_reset() would perform a full gve_reset()
> because of the stale flag. That reset could happen long after, and
> unrelated to, the event that set the flag.
>
> gve_suspend() and gve_resume() seem to have the same gap. They call
> disable_work_sync() in gve_suspend() and enable_work() before
> gve_recover() in gve_resume().
>
> The other parts of this look fine. A missed device REPORT_STATS request
> only skips a stats_report_trigger_cnt increment, because
> gve_stats_report_schedule() sets do_report_stats on every timer period.
> A device RESET request raised inside the disable window is covered by
> the reset that is already running.
>
> Could gve_reset() and gve_resume() queue the service task again after
> recovery, or re-check gve_get_do_reset() once the work is re-enabled?

Yes, this is indeed a regression introduced by this patch. When the
reset/suspend races with the Rx NAPI polling error path, the reset
will be delayed until the next service task is queued.

We will add an additional queue_work() after the
gve_turnup_and_check_status() in gve_queues_start().
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029211634.2232784-1-hramamurthy%40google.com

Regards,
Pin-yen
