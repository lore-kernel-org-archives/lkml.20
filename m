Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3E418361
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065054; cv=pass; b=EyiH8AID5yIiUOrbBilgdNZ4z8wcO51Iu2R+EeuQkdu8axda9jgSEWWhMHNH634IEpHGsICwG99WwCoe7pIgHHvsf0uX9zc5p3OZr6I5TEKwTO9KrOE3cWYj/VxgVHrqrNPl+HtQ0pVD0/zTKwz3AKSFgbyrvYNJtzs59krSHHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065054; c=relaxed/simple;
	bh=j8oOfovRmLewVX/ZIXchvTplxAiNODpkmMBMcI+S5WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXIz/6OpqKXdqKGy3vWLbQroYUL71eiKtV/HP5XuYHkRggN2HUPwcTNgV/EJAQiq/D+oiYlQv6Gp3p1QTAWFbkBk54w99Yj9FYx2ieHz07HS+PE33LsvrwSVzfahFNoDNcSaw1H95m7YElfThh7SgGdPKGrDDy7NDfpneZqoHNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlTbhVxO; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlTbhVxO"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-67109935888so3795648d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065051; cv=none;
        d=google.com; s=arc-20260327;
        b=Zjq41Q5GQMPUd5XzGLDZQQlOv6RDkTW0zykDxtK657qaxCq1Ktpav7nHe9up30aUKL
         ZjvhHjVkbfV/tOrrtqcd9qZYoaVm0lo/wO2w/257Ujjx+BCPQUuqcdSdlUTvbYkZX/SS
         AEwSf1U5DWXldY9YbvllFdk+kM4uvoK+2Gu8jqWp9Fuy4EsT4AJYlD8oMn1wOG6ctC9y
         V9eItl9uR54G5DjCzGZHiyTykT2YLu2MP/FuTbAnh52v8FQDRtAoMpqoc3dNM/+ChBMJ
         r4dtpmMy9y/nGJWrH7HQu5SBc/LRXmuSgazrL7L5BEB+HO9srCgv7yGOD8uhXbV+T7Lo
         cChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vBfgPYH3xqS4b5IB6dzOxOSHigmrLH/EHKKr5wvFYwc=;
        fh=2tpEfbB1gGvRc4BAaOhCZ09w8VXG81B5LS8o65/7XNo=;
        b=VkHT/0OGz2l6esgtZ0plhNXNRoZY+E20Rtad1GOow1ku1x5IrkHS7Uf54XYpQILVkx
         geHrmDDsMf/1v1xJFgUEwJphh70tN7ceGh2VhwmyU7XPujHcf2a8pNYKBO3+TeCpkZcM
         1nUGGkyAo/eAbkWopMqM5arIFNfASr5hqTypQSVw7mcXt3qydvWB7wZHE6apAFQX4Smh
         Nza4mnGsUJSL9ifJvSyAodc5gJTl5PUmFyirZdoVl4qh+/pv5F1HudS26H/7ByR8UVhE
         kJqPUTM1AoFctXaJdA6ydw+PcHaf4FhGmW1YmO87Spwm71BCtWYOTQCLWktu0uX5u6A5
         J7Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065051; x=1790669851; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBfgPYH3xqS4b5IB6dzOxOSHigmrLH/EHKKr5wvFYwc=;
        b=GlTbhVxO2A6vPW+hwN87bN12BcwLVeelMIFP2m2Xg7uLsR5l+i3M09HKoai/m5vc+y
         hHkm58Me2TK6RpmpdTc8M5BSIMz1NqkqFaBojHpA0J26sLZsomrQ4Y5bcWTr8nwu28wA
         QyU2AjKjVgvwqU/Yic5cq/VfEN98FWHZCFyo3JvUxF1fYIIstXHnBEn+WGq4jhW2Lshl
         tDmA8zGbFQM8RmmduyT75awLNgzIYbKjJGVcHVdz9Ss0Tyjue/smRa0WuoW6HUEVn2CA
         1BOi1eGGZKpjv+FneCH4r0+d6ec9LF93UwRP600heNMVVmASSs7zOs/dh3Pc1eJZ6DWU
         o9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065051; x=1790669851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vBfgPYH3xqS4b5IB6dzOxOSHigmrLH/EHKKr5wvFYwc=;
        b=xnI3s/UMWyzhwZzH4qo0w8HEwmRhXNaYG/js95MAUwi0Yv3r3G0gIa80JeZ2Lctiuk
         1kRt2l0CXxLRbXwtbtGg+bCXzCwNm91rNfFTddoyCgZ4sz4oEI3K9y2n7DjR+DQrR1qB
         nQ7hzd+MUXP8p+KCro+FsP4nWV5B0fhJd8riKObVK+DBxpUgONcvqvfYPcuxq49Los+7
         fDFRSqDW8PjCWDJusqfztZNpJ6CAcWYzQaNPu100MmzibXhq3vsVI5mfd2gaodUIKf4N
         9Cd+1+WmsDEDlvBBwRr/8LrC9zEZf6cM21PSXgQSnb9U+HWsgQuqRmbitXtBG+L4jI+x
         hJ5w==
X-Forwarded-Encrypted: i=1; AKwUvBzr+O1sTOtVA949Y2DkNazut8fVp2NGLoQkOpb/hho2/Z/nRzravzRTy0+mRjmsEaTgdqiGPt/12jCzaYo=@vger.kernel.org
X-Gm-Message-State: AFuF++k0FOxfnDClBXynZK9w3y71YHibiGAJuzNcri6WaL9q0KiHwEF3
	+XHPs/eiWjvCqJZnw8tMaWrh9jFFtagaF30qwy3z1PAQ11M4iSMTuPNjy6dOCtrHb+OO5Y53Pxe
	QbF2L8hfPny7lbziWRZ4TKQQW05aPh8U=
X-Gm-Gg: AYBFou1cGB6Z3Yu2989YkGeThtj80FEVew7Z+XZI6h2FG5zlgH3gB2lZ/rj/vKS1t3d
	5UwSs4qJy4I7frvBFt2xOp+G4uVHmabwXI5FFfRvVXAg+9fQql3AN2SVd0p0c2p/PlLiZ1grHrY
	cmqMiYXX2w/I9qaDYqxwsmuDm9HncyquucCo2bTZjkWMKlEh52phmX+XnKWjI3ZqN9EMh9AnPWh
	dK98/AOxqFB2jC4meDykYXnl39FYhMQyQVQCALbycNW/B0xgyxi0VRzRDcHQNu6DsdID+OZPAQP
	3sO/ncR5Sgd+GnUIePjzU45HyfEhGB0PyT8lHabZlLZrE5YbWECsty52uAZAyr3L1wv+K0Alh1W
	Awfg=
X-Received: by 2002:a05:690e:1181:b0:671:70d2:527b with SMTP id
 956f58d0204a3-6717fd6a661mr4552451d50.62.1790065051220; Tue, 22 Sep 2026
 01:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921073847.63505-1-lgs201920130244@gmail.com> <dd60ce64-4af1-479e-99d3-1787a06da882@intel.com>
In-Reply-To: <dd60ce64-4af1-479e-99d3-1787a06da882@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:17:18 +0800
X-Gm-Features: AcwNN1VVB2-e-7AnvOjQHk0rNG0E7RaHB9itWJcRpS2P7W5iTDsETsT01Vfbeag
Message-ID: <CANUHTR9F+D1C49MLiiy5z1snyKtbBtdU1cnuhsgr0cysp+yOcQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Czarek,

Thanks for the review.

On Mon, 21 Sept 2026 at 17:31, Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 9/21/2026 9:38 AM, Guangshuo Li wrote:
> > sst_acpi_probe() registers platform devices for the SST platform and
> > machine drivers using platform_device_register_data(), but does not
> > unregister them when later probe steps fail.
>
> s/machine drivers/machine board/
>
> The above paragraph alone is sufficient, please drop everything else in
> the commit message.  There is no need to write wall-of-text for a fix
> addressing a missing error path.  In case this wall was provided by an
> agent, relevant Assisted-by: tag is needed in the tag area.
>
> You can keep the very last sentence if you want to.
>
> > If machine device registration fails, the already registered SST platform
> > device is left registered. The same leak happens when
> > sst_platform_get_resources() or sst_context_init() fails after both
> > platform devices have been successfully registered.
> >
> > A registered platform device owns resources allocated by the platform
> > device core and must be released with platform_device_unregister() so
> > that the device reference is dropped and platform_device_release() can
> > free the backing platform_object.
> >
> > Unregister the created platform devices on all failure paths to restore
> > the missing cleanup.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: caf94ed8629a ("ASoC: Intel: bytcr_rt5640: fixup DAI codec_name with HID")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> For the commit title: please update to:
>         ASoC: Intel: atom: Fix (...)
>
> Provided both the commit title and message are updated, feel free to add:
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>
> > ---
> >  sound/soc/intel/atom/sst/sst_acpi.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
> > index 73624e1b138a..a1f16083bd3d 100644
> > --- a/sound/soc/intel/atom/sst/sst_acpi.c
> > +++ b/sound/soc/intel/atom/sst/sst_acpi.c
> > @@ -352,7 +352,8 @@ static int sst_acpi_probe(struct platform_device *pdev)
> >       if (IS_ERR(mdev)) {
> >               dev_err(dev, "Failed to create machine device: %s\n",
> >                       mach->drv_name);
> > -             return PTR_ERR(mdev);
> > +             ret = PTR_ERR(mdev);
> > +             goto err_unregister_plat_dev;
> >       }
> >
> >       /* Fill sst platform data */
> > @@ -361,15 +362,21 @@ static int sst_acpi_probe(struct platform_device *pdev)
> >
> >       ret = sst_platform_get_resources(ctx);
> >       if (ret)
> > -             return ret;
> > +             goto err_unregister_mdev;
> >
> >       ret = sst_context_init(ctx);
> >       if (ret < 0)
> > -             return ret;
> > +             goto err_unregister_mdev;
> >
> >       sst_configure_runtime_pm(ctx);
> >       platform_set_drvdata(pdev, ctx);
> >       return ret;
> > +
> > +err_unregister_mdev:
> > +     platform_device_unregister(mdev);
> > +err_unregister_plat_dev:
> > +     platform_device_unregister(plat_dev);
> > +     return ret;
> >  }
>
> Looks like sst_acpi_remove() does not unregister the devices either.
> That could be fixed by enlisting devm_add_action_or_reset() in
> sst_acpi_probe() without altering sst_acpi_remove() at all.
>
> Would you mind sending a separate patch updating the function so both
> the error path and the driver-unload clean up the device objects?
>
>
> Kind regards,
> Czarek

I'll update the title to:

ASoC: Intel: atom: Fix platform device leak on probe failure

and trim the commit message as suggested, including the
s/machine drivers/machine board/ change. I'll also add your Reviewed-by.

For the separate cleanup patch, do you mean something like this?

+static void sst_unregister_platform_device(void *data)
+{
+        platform_device_unregister(data);
+}
+
        plat_dev = platform_device_register_data(...);
        if (IS_ERR(plat_dev))
                return PTR_ERR(plat_dev);
+
+       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
+                                      plat_dev);
+       if (ret)
+               return ret;

        ...

        mdev = platform_device_register_data(...);
        if (IS_ERR(mdev))
                return PTR_ERR(mdev);
+
+       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
+                                      mdev);
+       if (ret)
+               return ret;

This would let devres clean up both devices on later probe failure and on
driver unload, so the explicit unregister error paths from the first patch
would no longer be needed after this patch.

Would this be what you had in mind? If so, I'll follow Krzysztof's
suggestion, organize the related changes into a proper patch series,
and send a two-patch v2.

Thanks,
Guangshuo
