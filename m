Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B3651DAEE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906953; cv=pass; b=AEIyBRhwLrMjL8JoRN77ryWf6BuQrAoQ0u21r1RGlN0GXHmJIlsIzynFktVe3AfgGmugA4+e1aO4Z3WxLo68IbIdSCRWJeI0dMy7axtpnJ0Je4q5X0qw28bRxPDQkI679itnkmDFk8K007iZOmY4dR+6njiIAOlsvwyjMiPL1CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906953; c=relaxed/simple;
	bh=Fl+I6QVmx6SGoeU7QJN/faQtgRpSfWj+gi8dO4AbAF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIWv82MwV+NldECLpSE8pilHseKKKYZ0wEtMhWcy+LE6MsSsCnv8jsZYq0+UCQw6O1FzhHJ0bCbGYz3apT313tuSCH4Zz3CNr2GVh1QGeqo3Jc/rSSaDX6L643m6/JAtkEdbLIPpG1yXt51zhUOpNMZzt+YjMZxS0fB+TN7zb1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u198AWQi; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u198AWQi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso3949796a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791906949; cv=none;
        d=google.com; s=arc-20260327;
        b=hZxkWoimrYbgathtW2IiLvKKrSC3ULtpNWLaeuE+whC46bPZrNMIBGGa6mmKQ8IpQK
         WsJcK1Ngg2dSGg3ogTagk3Ba1v6p1AfUAhoKHkg+M7n2/baocpm7XMISXal/e+aFv9Hf
         Z127XyQzMQKGR1S2NMn3gjZzzSBGKIyzeSIS6gWVfmMhceCQnCuQ7VhsTmLTdLWdRV5Z
         aKHXCx4FT1pSJMXp18lwQe1SurIwggeY1b0P9R/UCmhq7xvYpLiHzcYOieqyBwve9zyQ
         JevPArVvRu3bn5/pVminQA38lsAZT7pFck27JFASjCSQ6CFJv1Yl1IpA32s19oipWbr4
         CaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        fh=WylXu6BzMZeStpk2d+TQdnn/5W3OPFH/vRXSezOKOm8=;
        b=aIcrsVZfdFPS5OaWtbHPcf6mQummGplhvXbwSvo5gGJeadyPWFsmVJWBj0hSMfyK4k
         dyLuQjGrzydMAnetp41hiV3dCAS9mtgwa6fothpj7bG6wtROJyCAuzAwQE0ZxG2deQlf
         7+6nDc+xC+RNdzUZ9djSrVpSNHHR5pDT1+vZRuIRDej7DdsYyd5UMoNFp3a5ItdB4Tv7
         +fVFwXvNJjXKm0CN+phn7F6Non41iAI3C9bgllf8QeC4dMLAzMFUCthXZp6lxUUJdcEW
         6grNjJHm6tI/gsFSglczWrPT8vmjD9GHLpOOGt15XDDgi/zK6K24MmJiD2dUqEeeCyaL
         7tCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906949; x=1792511749; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        b=u198AWQim7aWA09f3k8kbTwG0Wo3C4/pR3A+sobGku7Wc/MBV5+b1q/8RuUx6gVg94
         aXSf1R9wQw3dYOr8/eL8we/Ml2bjlmULz+5lhiBb9cyn0Tw/sToIIgkniAPMgXfaYAgm
         LXDSZTLOw8+dKQr7n9mmrLeM9ZoQziWTyMGegeiX3wB9/OLsQWSaLaSnM3543ZSPGURD
         JvDrQQd1suRPyKkPFArza0l3MuXjWUC+nM7c8gWHQHMHpoKhv+yH5Ko8QCsrRPvcRbSJ
         kNZctb5FGfVNV1HKsJHRs3iA2gu+frPhdK3iotRmy08MK+4OBIVwTEnWt+3ykqQ1ky1q
         Fjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906949; x=1792511749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        b=IbHYchEy5St954mj3eQz4MMBZAn3NipPaZ4JJRsKeSoBxGiJvWB+5XAw95H3V1pptB
         EBrkTAfP3R00ilHmHuVkwMGBhizZp56eEGu7YzRsBFjN1pCAIhFfdngLa5lXJuznhkzQ
         iT2EIPIlCCsXYusY4ZI5r/cU0wh0rGGK0aSBJMVkec7fLTgLycGF1M7uwxd8p18bnTJV
         OHcxLSK+uvUTU/gJkkqgcdfJl90grUpuxVoMJvldPMqAymd/JXkKMlmIOeo77Cx1zzbN
         sE6ldC7DALUMKUdd2K1ntJXtVlU/GlFZCF3oIstJDC3vHPGX0vnBp2+QRvUEzes0du3J
         8MGg==
X-Forwarded-Encrypted: i=1; AKwUvBzGzw4b4FEoiQJdk8kQ1XVEOYPBO0/SXaFOGcXE1vGS8mTDpILkcEAkAi/7w24yQehqXjDNjPlaoLeR6fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJjzzX1a0kM3sk7tZAjghHhnpqa9/uDvMfJwecQqeY0ZCd3ltx
	C/upo9wRURCQSQxNM2G7EViD3r2YTuBhhv1MAwQwiPx5rSW5sS0lC1ZCdB8oaGr9ibumvbRGs/q
	H0c0g90W6eNzEyzs2XIUX0plKJ3ZE6sd1XHsLQ/+Z7CAmIJ53CYvH
X-Gm-Gg: AYBFou0+61GUAhHesZvdyttdHn/ex+ksdhrZhdMRhDSVgN8jEh5LQDp7RF9wLCh8fdo
	5Xkg2fcaOTcTIYAmjKTf/KvtrmRUUIiYTeT4mmC5hCSeFxw/S6IW1Ki1jiODUuzSVM4X3tg0rzh
	dwJqfuWAv0gXN2Ps21W6bD0MlKamfVG44u0Qlovh9g1BYNNlQeunRm1F3mfMmudPYArkQ+AUi1Q
	2WpmZIPoxOrBbYFfDbIKU5n99jZS+g/1BVFm0IKDtigSUzA9K23COUgPoiRB2CQcuaoP6nv71iq
	56Rbf8jwwDbviTaSizg8nMhptzXr3I+1xwQ0sVlLTq8M5aV8yJ/arIRcFDDEZNVn8RCbJAa/zhX
	Y/hDX5uRhzFT/dA==
X-Received: by 2002:a05:6402:52c6:b0:6b1:d8e4:f93 with SMTP id
 4fb4d7f45d1cf-6b1d8e42e76mr3731578a12.33.1791906949171; Tue, 13 Oct 2026
 08:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar0lvsu80miGJdGS@p14s> <20261001081056.38293-1-hyz3367@gmail.com>
In-Reply-To: <20261001081056.38293-1-hyz3367@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:55:37 -0600
X-Gm-Features: AclHuK9k6982zEoNoGluocWt9T3eTL3nhoi7JX355Oac8ApeVuUVqsbrnakim8I
Message-ID: <CANLsYkxz2vNE1rsc_sRQVC7YJHw5hyB8YD-zFi1DujUd5b02cQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: core: Fetch the auto-boot firmware only once
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 02:11, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> Auto-boot for an always-on remote processor registers an asynchronous
> request_firmware_nowait() whose callback, rproc_auto_boot_callback(),
> calls rproc_boot() first and only releases the fetched image at the
> very end of the callback.  rproc_boot() does not take this image as an
> argument: it fetches the very same image again with a synchronous
> request_firmware(), so every auto-boot reads the firmware image twice
> and allocates the buffer twice; on kernels with the sysfs fallback
> enabled, the uevent round-trip is repeated as well.
>
> The asynchronous request exists only so that rproc_add() does not
> block on the filesystem read; the image it fetches is never used.
> The core already defers rproc_boot() to a worker for detached
> processors (attach_work).  Reuse that worker for offline processors
> too and drop the asynchronous firmware request: rproc_boot() fetches
> the image exactly once and dispatches between a firmware boot and
> an attach based on the processor state.  The work is renamed to
> boot_work to match its widened role.
>
> commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> processors") noted back in 2011 that "we must wait until it completes
> before we try to unregister the device".  rproc_del() now does exactly
> that: it waits for the boot work with cancel_work_sync(), which also
> closes the theoretical window in which a pending attach work could
> outlive the rproc instance.
>
> The changed fallback behaviour only matters for legacy
> configurations.  udev dropped its userspace firmware loader back in
> 2014, as recorded in
> Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> kernel has documented since commit 02c399306826 ("firmware_loader:
> enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> relies on or uses a fallback mechanism in userspace".  Auto-boot now
> uses the same synchronous fallback semantics as every other explicit
> boot source (sysfs, cdev).
>
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
> Changes in v3:
> - Drop rproc_trigger_auto_boot() wrapper and schedule boot_work
>   directly in rproc_add() (Mathieu).
>
> Changes in v2:
> - Fix the order described in the changelog: the callback calls
>   rproc_boot() first and releases the asynchronously fetched image at
>   the end of the callback (Mathieu).
> - Fix typo "proccessor".
>
>  drivers/remoteproc/remoteproc_core.c | 66 +++++++---------------------
>  include/linux/remoteproc.h           |  4 +-
>  2 files changed, 19 insertions(+), 51 deletions(-)
>

I will apply this patch when 7.4-rc1 comes out.

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..b88bf179507d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1662,51 +1662,23 @@ static int rproc_attach(struct rproc *rproc)
>  }
>
>  /*
> - * take a firmware and boot it up.
> - *
> - * Note: this function is called asynchronously upon registration of the
> - * remote processor (so we must wait until it completes before we try
> - * to unregister the device. one other option is just to use kref here,
> - * that might be cleaner).
> + * Boot or attach the remote processor in the background: rproc_add()
> + * runs in probe context and must not block while the firmware image is
> + * read from storage.  rproc_boot() dispatches on the processor state,
> + * so this covers both a firmware boot and an attach to a processor
> + * started by another entity.
> + *
> + * Note: rproc_del() waits for this work to complete with
> + * cancel_work_sync(), so the rproc instance remains valid for the
> + * entire lifetime of this function.
>   */
> -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> -{
> -       struct rproc *rproc = context;
> -
> -       rproc_boot(rproc);
> -
> -       release_firmware(fw);
> -}
> -
> -static void rproc_attach_work(struct work_struct *work)
> +static void rproc_boot_work(struct work_struct *work)
>  {
> -       struct rproc *rproc = container_of(work, struct rproc, attach_work);
> +       struct rproc *rproc = container_of(work, struct rproc, boot_work);
>
>         rproc_boot(rproc);
>  }
>
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> -{
> -       int ret;
> -
> -       if (rproc->state == RPROC_DETACHED) {
> -               schedule_work(&rproc->attach_work);
> -               return 0;
> -       }
> -
> -       /*
> -        * We're initiating an asynchronous firmware loading, so we can
> -        * be built-in kernel code, without hanging the boot process.
> -        */
> -       ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> -                                     rproc->firmware, &rproc->dev, GFP_KERNEL,
> -                                     rproc, rproc_auto_boot_callback);
> -       if (ret < 0)
> -               dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> -
> -       return ret;
> -}
> -
>  static int rproc_stop(struct rproc *rproc, bool crashed)
>  {
>         struct device *dev = &rproc->dev;
> @@ -2348,11 +2320,8 @@ int rproc_add(struct rproc *rproc)
>         rproc_create_debug_dir(rproc);
>
>         /* if rproc is marked always-on, request it to boot */
> -       if (rproc->auto_boot) {
> -               ret = rproc_trigger_auto_boot(rproc);
> -               if (ret < 0)
> -                       goto rproc_remove_dev;
> -       }
> +       if (rproc->auto_boot)
> +               schedule_work(&rproc->boot_work);
>
>         /* expose to rproc_get_by_phandle users */
>         mutex_lock(&rproc_list_mutex);
> @@ -2361,10 +2330,6 @@ int rproc_add(struct rproc *rproc)
>
>         return 0;
>
> -rproc_remove_dev:
> -       cancel_work_sync(&rproc->crash_handler);
> -       rproc_delete_debug_dir(rproc);
> -       device_del(dev);
>  rproc_remove_cdev:
>         rproc_char_device_remove(rproc);
>         return ret;
> @@ -2552,7 +2517,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>         INIT_LIST_HEAD(&rproc->subdevs);
>         INIT_LIST_HEAD(&rproc->dump_segments);
>
> -       INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +       INIT_WORK(&rproc->boot_work, rproc_boot_work);
>         INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>         spin_lock_init(&rproc->crash_handler_lock);
>
> @@ -2630,6 +2595,9 @@ int rproc_del(struct rproc *rproc)
>         if (cancel_work_sync(&rproc->crash_handler))
>                 pm_relax(rproc->dev.parent);
>
> +       /* auto-boot may still be fetching firmware: wait for it here */
> +       cancel_work_sync(&rproc->boot_work);
> +
>         __rproc_shutdown(rproc, true);
>
>         rproc_delete_debug_dir(rproc);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a44368737b39..d77e24539133 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -231,7 +231,7 @@ enum rproc_features {
>   * @subdevs: list of subdevices, to following the running state
>   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
>   * @index: index of this rproc device
> - * @attach_work: workqueue for attaching rproc
> + * @boot_work: workqueue for booting rproc
>   * @crash_handler: workqueue for handling a crash
>   * @crash_handler_lock: serializes crash handler queueing and deletion
>   * @deleting: remoteproc deletion has begun
> @@ -277,7 +277,7 @@ struct rproc {
>         struct list_head subdevs;
>         struct idr notifyids;
>         int index;
> -       struct work_struct attach_work;
> +       struct work_struct boot_work;
>         struct work_struct crash_handler;
>         spinlock_t crash_handler_lock;
>         bool deleting;
> --
> 2.34.1
>
