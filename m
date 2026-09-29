Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A453A3AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694421; cv=pass; b=Xqzn3CRTDPh76MQZakKfUegKIPgtxUWybydvqJLnpH5lp0hUVo0GicdR0Jah/xsgD355+giE2xrZBpKDXojPGtyOb2nzFPGxOlxb7I9reNoBJMhHxuQa3ym+Sd1hLB53AkPPYHSqrM8pHPqblHiGxO12iAEnQe6BcSjcXJvgAF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694421; c=relaxed/simple;
	bh=Mf0CEE/Ndi3adNKcAPlzfcyXORehguVF2tBgfNIzSKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qb3gdyvOgY7iKJhpHBtu97LTGBHq7ULyP+ngacx0ux1oh0GBq+F8udcRXG3K6evs4N34hHFOBRh3yKEBuDKxpdnUHK4eHthNsbqdzjyhQlfCXqxyJDmXQnIgl/OVCXstzbgIZMJGYYmVNQF2WX7GRjngbafTfi0j5j5AGt0Y1oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pj0WhG6H; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pj0WhG6H"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso7661392a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694406; cv=none;
        d=google.com; s=arc-20260327;
        b=GrQxSKX8WjA0O1Mrj7NV2sNjZUgcjYOBpUHFobgAoVuNIDTE1d9NPw1wFG3aFUAIoX
         6CHAfK0CdC+ZdjvCP6fAFFnVNtRstkx2SNWf+ge2QVltMptk/pwU55CFRnU9rFKa/8Pt
         32s25aCoqONdoGAEfOVk5rNgUXYkUWdO1+00QFgr+UxsRyCVdew+o8RnWgdT2l6UV/q5
         /pVpaZMBY97sZ9a5Mf/I6FDiWeXuiQnn6oa3L9i4+7Ey5lXuRgza0gykv17mtVGmGd6v
         qfziWjzY/mIG60ljNTSRam1Fdi87MuAmkYTq7tc9O1Ozm0H0ZRZc+/fmiI2zdHIq4WWp
         IADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        fh=YV90gkORq4z96PvPXzhCLgnBMy5de7gvcUeDbylENLM=;
        b=nwWE2lTwljpMoUxggN5rQkiRMQxzwyUOgSoLY2xS42TSfc7urYHuZvgol9d4VnqyhK
         ahMwxDRb24tjequWDBG3l2TehfSCACmKFfbtfjbVr7NS3HKkaDZbLGuwS0Vycrm7vopi
         Q7WsWJskwo95dOGNyKVXvvsfpFvC3q5amskVDmtC0D7dZG8RmX54XVcMNPO/tVCbk4Ld
         PZJ8ZplY5WwWTsM77D6G0+9vhzYntiF/BsGAGq7VGLVF5tAd6dfSA+Jc+p97Oh5j4jOx
         ZNoKYw8uK+W79W0L/9axMH+Na1+QLO0399RS4LSeA3FSRz6te4GJHbKOSls5x+x8PDjh
         eiKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790694406; x=1791299206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        b=Pj0WhG6HAL73tA7TkqFYnxLoxnzJmXN68moNO7PiwCEC/DPooIJO6VM3QsSgxklUQj
         qx2R0iHu60PkIgkImq9CTX1828yJ/f/89k9YG4a1QmfGo5kswlMhRdN0cn50HickMX+K
         L2QDuCex/DtWTKxpOVpHe01mVQJsgLr0RM03HFH0m6ZBwpMz6FBbB7onW4vpIzrvg2NL
         MQ8sBJwcB97OisXt6apQ4+dW7gL/qv0VAMzej14aZ9imwJrzecrWnVWqd86c4EUHxZx0
         6PHwyoQewva+YokBDmp9HgO2Gjdf1Td/lk4fUEVqYWb2c08WLiKmWvh8vaM4X7EI6XnT
         CoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694406; x=1791299206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        b=E/TkN77C3nHGDmTgwPigAGv9ql1rNh4kGASPaw0W8OLbrlau0uy3m90TiI21q8vC7M
         02uab63MuxOdd3LEZ9j68KLAZff+vA9H6XccJm0B7igczSMfc0Q2GOtFg/Hab0pytxv2
         t/Bhn432b13lV/+gr0olA6uA+d9oPFnqpMRVbkoThqV9wbHoY+bRfVfkZOTHo5kXCXH2
         1Vui+fFnTwVq2Br80X0xDZv+JSa6vIbAGXUrh+AixjNJfmCj0x9wyYtRFFy1NWxsYAWX
         qUAw913eAzqV4JdTLzGejLKQ2gzIZZGDFLcEwWM4bCf1jBnSEg4HlaUuMYUqgj10VEs7
         WLWA==
X-Forwarded-Encrypted: i=1; AKwUvBzGwIK4V2WlQwwmN93AaV9GmGC+HNY3d0tTK/noMHsY4edAyeYaymnM9nYom0oqvRF4Qpl2Hx8jT/Aa5o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoGNNCkyiYapd7DuG84Z6qaLkaRvOpQe6pqjX8jM4pr2Y0vUeo
	l4qKmOJf3nJ9rEJQE4QiMpcLC53pQ84yQ1ob6KZbjj62wpTMcLEZXWk/uLpkf8jI8dpkNtbg16F
	59cS6G5rz6eCkY2TG1WTbFAY7v2KmkMuvcLkOYp721g==
X-Gm-Gg: AYBFou30iVHnguZ6PIsI2Uf+Yg0TWgm7I2OriAj85jeuPztK91Odav/2mOl65clbY0j
	XWY5/hHjbJUTpsZ4Gl14AjOKgqK9pCOnwQBPBPFZh5qGu96aTogVKYwlF1kKm9zZxAdtH0pjTNj
	kgyYgCqv92AEkHu270inmzmVnIO1vzkF1XTewG+h0pD2q1u5xjUr93ZxqlYlSY/U1smbSnD1oz0
	L4sfDTMITP2Fyf2D+z+o5QCfZhWny5Lex/fj2h5gHxjFeyeZL3wtXeP0oUEiJERxNHKrKh5cjch
	e2LHWvCP2wk84DcK8BcBRU+AawYUSgfrmCJ/uwlSshsXThrZEO/8KZsIrNb2pi1UTOoQmu/YB9y
	MGjB8MtdSvXvr
X-Received: by 2002:a05:6402:1f44:b0:6aa:c3d8:da1 with SMTP id
 4fb4d7f45d1cf-6aac8ecf448mr11925620a12.9.1790694406120; Tue, 29 Sep 2026
 08:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025855.2523147-1-hyz3367@gmail.com> <arqlFtvlN2LI6cT2@p14s>
 <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
In-Reply-To: <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 29 Sep 2026 09:06:35 -0600
X-Gm-Features: AclHuK-ZMOUPEe4SsrWen_F7RhJdVsoX8XiLCVHlS8LsKTtnYzyq-BKQjbeFtos
Message-ID: <CANLsYkx5VVWsmhaYfMe=gj7nO-8YpOknMvM7gKZ-xFEbGg=zMg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 22:43, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> Hi Mathieu,
>
> Thanks for the review.
>
> On Mon, Sep 28, 2026 at 11:34:14AM -0600, Mathieu Poirier wrote:
> > Good day,
> >
> > On Wed, Sep 23, 2026 at 10:58:55AM +0800, Yonghao Zhang wrote:
> > > Auto-boot for an always-on remote processor registers an asynchronous
> > > request_firmware_nowait() whose callback discards the fetched image
> >
> > The callback function is rproc_auto_boot_callback() but I don't see where the
> > image fetched by request_firmware_nowait() is discarded.
>
> It is the release_firmware(fw) called at the end of this callback.

Right, this is happening at the _end_ of the callback, but the
changelog says the firmware is discarded and then rproc_boot() called.
This is not accurate and needs to be fixed.

> The image fetched by request_firmware_nowait() is never consumed:
> rproc_boot() doesn't take it as an argument and fetches it's own copy
> with a synchronous request_firmware(). It is that second copy which
> rproc_fw_boot() parses and which is release at the end of rproc_boot().
> The asynchronous copy is only ever touched by the final
> release_firmware(fw) -- fetched, never read, freed.
>
> "Discarded" in the commit message refers to exactly that. I can send
> a v2 that names this release_firmware() explicitly in the first
> paragraph if you want the message to be verifiable at a glance.
>
> Thanks,
> Yonghao
>
> >
> > Otherwise I agree with this patch.
> >
> > Thanks,
> > Mathieu
> >
> > > and calls rproc_boot().  rproc_boot() then fetches the very same image
> > > again with a synchronous request_firmware(), so every auto-boot reads
> > > the firmware image twice and allocates the buffer twice; on kernels
> > > with the sysfs fallback enabled, the uevent round-trip is repeated
> > > as well.
> > >
> > > The asynchronous request exists only so that rproc_add() does not
> > > block on the filesystem read; the image it fetches is never used.
> > > The core already defers rproc_boot() to a worker for detached
> > > processors (attach_work).  Reuse that worker for offline processors
> > > too and drop the asynchronous firmware request: rproc_boot() fetches
> > > the image exactly once and dispatches between a firmware boot and
> > > an attach based on the proccessor state.  The work is renamed to
> > > boot_work to match its widened role.
> > >
> > > commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> > > processors") noted back in 2011 that "we must wait until it completes
> > > before we try to unregister the device".  rproc_del() now does exactly
> > > that: it waits for the boot work with cancel_work_sync(), which also
> > > closes the theoretical window in which a pending attach work could
> > > outlive the rproc instance.
> > >
> > > The changed fallback behaviour only matters for legacy
> > > configurations.  udev dropped its userspace firmware loader back in
> > > 2014, as recorded in
> > > Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> > > kernel has documented since commit 02c399306826 ("firmware_loader:
> > > enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> > > relies on or uses a fallback mechanism in userspace".  Auto-boot now
> > > uses the same synchronous fallback semantics as every other explicit
> > > boot source (sysfs, cdev).
> > >
> > > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
> > >  include/linux/remoteproc.h           |  4 +-
> > >  2 files changed, 21 insertions(+), 48 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 263e12f022ea..f329dc478170 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
> > >  }
> > >
> > >  /*
> > > - * take a firmware and boot it up.
> > > - *
> > > - * Note: this function is called asynchronously upon registration of the
> > > - * remote processor (so we must wait until it completes before we try
> > > - * to unregister the device. one other option is just to use kref here,
> > > - * that might be cleaner).
> > > + * Boot or attach the remote processor in the background, on behalf of
> > > + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> > > + * not block while the firmware image is read from storage.  rproc_boot()
> > > + * dispatches on the processor state, so this covers both a firmware boot
> > > + * and an attach to a processor started by another entity.
> > > + *
> > > + * Note: rproc_del() waits for this work to complete with
> > > + * cancel_work_sync(), so the rproc instance remains valid for the
> > > + * entire lifetime of this function.
> > >   */
> > > -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > > +static void rproc_boot_work(struct work_struct *work)
> > >  {
> > > -   struct rproc *rproc = context;
> > > +   struct rproc *rproc = container_of(work, struct rproc, boot_work);
> > >
> > >     rproc_boot(rproc);
> > > -
> > > -   release_firmware(fw);
> > >  }
> > >
> > > -static void rproc_attach_work(struct work_struct *work)
> > > +static void rproc_trigger_auto_boot(struct rproc *rproc)
> > >  {
> > > -   struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > > -
> > > -   rproc_boot(rproc);
> > > -}
> > > -
> > > -static int rproc_trigger_auto_boot(struct rproc *rproc)
> > > -{
> > > -   int ret;
> > > -
> > > -   if (rproc->state == RPROC_DETACHED) {
> > > -           schedule_work(&rproc->attach_work);
> > > -           return 0;
> > > -   }
> > > -
> > > -   /*
> > > -    * We're initiating an asynchronous firmware loading, so we can
> > > -    * be built-in kernel code, without hanging the boot process.
> > > -    */
> > > -   ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> > > -                                 rproc->firmware, &rproc->dev, GFP_KERNEL,
> > > -                                 rproc, rproc_auto_boot_callback);
> > > -   if (ret < 0)
> > > -           dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> > > -
> > > -   return ret;
> > > +   schedule_work(&rproc->boot_work);
> > >  }
> > >
> > >  static int rproc_stop(struct rproc *rproc, bool crashed)
> > > @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
> > >     rproc_create_debug_dir(rproc);
> > >
> > >     /* if rproc is marked always-on, request it to boot */
> > > -   if (rproc->auto_boot) {
> > > -           ret = rproc_trigger_auto_boot(rproc);
> > > -           if (ret < 0)
> > > -                   goto rproc_remove_dev;
> > > -   }
> > > +   if (rproc->auto_boot)
> > > +           rproc_trigger_auto_boot(rproc);
> > >
> > >     /* expose to rproc_get_by_phandle users */
> > >     mutex_lock(&rproc_list_mutex);
> > > @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
> > >
> > >     return 0;
> > >
> > > -rproc_remove_dev:
> > > -   cancel_work_sync(&rproc->crash_handler);
> > > -   rproc_delete_debug_dir(rproc);
> > > -   device_del(dev);
> > >  rproc_remove_cdev:
> > >     rproc_char_device_remove(rproc);
> > >     return ret;
> > > @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >     INIT_LIST_HEAD(&rproc->subdevs);
> > >     INIT_LIST_HEAD(&rproc->dump_segments);
> > >
> > > -   INIT_WORK(&rproc->attach_work, rproc_attach_work);
> > > +   INIT_WORK(&rproc->boot_work, rproc_boot_work);
> > >     INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> > >     spin_lock_init(&rproc->crash_handler_lock);
> > >
> > > @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
> > >     if (cancel_work_sync(&rproc->crash_handler))
> > >             pm_relax(rproc->dev.parent);
> > >
> > > +   /* auto-boot may still be fetching firmware: wait for it here */
> > > +   cancel_work_sync(&rproc->boot_work);
> > > +
> > >     __rproc_shutdown(rproc, true);
> > >
> > >     rproc_delete_debug_dir(rproc);
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index a44368737b39..d77e24539133 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -231,7 +231,7 @@ enum rproc_features {
> > >   * @subdevs: list of subdevices, to following the running state
> > >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> > >   * @index: index of this rproc device
> > > - * @attach_work: workqueue for attaching rproc
> > > + * @boot_work: workqueue for booting rproc
> > >   * @crash_handler: workqueue for handling a crash
> > >   * @crash_handler_lock: serializes crash handler queueing and deletion
> > >   * @deleting: remoteproc deletion has begun
> > > @@ -277,7 +277,7 @@ struct rproc {
> > >     struct list_head subdevs;
> > >     struct idr notifyids;
> > >     int index;
> > > -   struct work_struct attach_work;
> > > +   struct work_struct boot_work;
> > >     struct work_struct crash_handler;
> > >     spinlock_t crash_handler_lock;
> > >     bool deleting;
> > > --
> > > 2.34.1
> > >
