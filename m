Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A893515E3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250067; cv=pass; b=fSJo8+WYCEWcd3xjtrWJFeJ7ecC9wmr6NdU8E9qWepAzKOM4akB65sq4Fpzz0EQP1SqMgnyDiIkfgssNZPHpbD7qio6QXcma9Y9PaZE7ajNr23asK1YnQlgYVqRjmcRZHrQsdAU/BnU3XJ4W7s5hhb5v1wutVAO3fG0zjaSng4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250067; c=relaxed/simple;
	bh=2gcDKbdCCLqMqHhK8oJJGW6NSKFDlP0sJsXi4mnHmwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gi7uIwKQbZq7fFnYnKrshcYd5yST+RSD+4onfmDusqbiBZtgTMbXJTMCUDaRSM3zySqDe8oTdJdyopw9d0NWlg+BK+S6OEaAHyL1UpFceEjC4tz79U60uSl7VSKL+R3JH1OZALmxRvLK7b3YhKxEA6nJAJTyErir2bqErMDlTNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIGT076I; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIGT076I"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675676afc3cso862076d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250065; cv=none;
        d=google.com; s=arc-20260327;
        b=mBLWmKeN4tegcXrSmW38nEwPsqKHasxcaMH5Ju8tuSH71sF1Dj6ap1abUqqfabNqlw
         ++3/MoFsuj+9tBr5ykBJWM+VlGQtzKEkbX4lrRSsNm+RA91UvgJ3M8NCMASQ2oOYCtBG
         +nN05Ta29jpM3ymcAGsrP1MokRCClaIRY4XBzUyJ7+8NfbIqz7Prq4yLEhTBabRNLCSJ
         G9rpN8yZswRpt6JM9g0iavucctBhrAI2Otfw8A8tRUXjJU6qZSg120nblT70QkmDSehP
         +Y0sfb0VmU6oCU5CiNTO7bvlEAS+k7lfWzwRFM66C7V/++J9+0NVL0iRy1zIhzltXd/j
         tRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GipuAe3BWx4PIpFUcH/elDBDZ0+uIB+GVKCWA82fBvM=;
        fh=I1NkFITxdpMD4Fl0lwQEpkbLvV6LzztXdy1tDaOyZic=;
        b=YAkad4pJma1+pJ8lbHDuDJ6JSEHMIGATy2uEo+kLZXC04O/tX3BwUN2MuFjDf1N+iv
         xt+gRTmUIb6Wd4l6T7F4LHR/LmzZpO9YOiqJg05LDgdEbxMmLFrmvW7vyrM6o6MLRyt/
         QIZILI9wlcboOrMYx9NyMVuIrnZNbc/Lk5Ds5IcdCWt826Xm1rBGoMjuhHvBwizuCTWi
         rGgWajk1Gs1BpPEJhuSXC/v5kOBDcRG7PNhMNDmazTK1Zy8rfYCZ9HHK3UYHzg3gxnon
         ozBcGC+qZ/W1o2f7ASBjYLwTITUnlXto7JHqgAthZTByDvYha8NqhjX+WjD4bZFF4ePN
         gLNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250065; x=1792854865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GipuAe3BWx4PIpFUcH/elDBDZ0+uIB+GVKCWA82fBvM=;
        b=KIGT076I+a6TOHDcnPlrE1Cfx6OjYgFejAkxDvaKYsf0ADbzGyv+1U5GsaMCZTkL4a
         NN/xAOikdGoA0O3UGBiuBeMAXAl3XrT9Rd6SSpUA0KzSSRyHYQ1kOkylltABRgF0xOE/
         af2gkQtRzDLVWG1Y+o+AkJUOH8kuu0PkjzlbrQuYzkS3Ud+RdLKYMm/glw29zOJJHdjw
         jwAuA2kduIAUBTuyZGv43NQyHAlmA1OcFxh/piAnGfXbyrxSBADZ/PWA/4bBu6t5hD5j
         CpV2I24WbcdAPd1hwfId0tOBnHO7Aghg1k+h8uOrHw+UFBv9/npOcsORMd0KdR3POWWU
         fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250065; x=1792854865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GipuAe3BWx4PIpFUcH/elDBDZ0+uIB+GVKCWA82fBvM=;
        b=RpnnxTDUv2VAa5KTnE3/5W6kPG9aSKFoDTD56a8SgeNfO+FRdO7DUeruoUXFSax+Kj
         0D2GdY8IEhWb5mPqeisjxjcp+S2KZF10yL8wmTthnQIezRzz9sE3L2dFmOIPFj2Uft2J
         9zbUVx5I2F9Uqr534b8GEG1ldWqa9/Q0CesjQOlcuegn1U9htalKE/Wp9slOn/WMpGXA
         O11C3Sgq+Wp7HU6bjRIoTi7iMuzU+fCOACzxV7jkjR+IYHZfOx/vmShYC04sjLuform4
         4Xpv1Uc8gfn5uluXHXW/dW9MXlOm703i7ealApptzPEEdM0d39LPXcir9bQehZQHq6PT
         urdA==
X-Forwarded-Encrypted: i=1; AKwUvBxcCpkhLm0oBuIWwMsc774tWNL1VqqZGRBywL+QvwItta65nAHoarhB93qJUWHSpSDgDeID+B1wKuIBi+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRIHOMlR4u1WxxThXBbDfWMC6bvGH4g39QmYajf6G3FsaZtNoG
	T+jIJ0rX0EP4TSFn70ZdtO7n4T9N3TvT/c6HnRv9SbEp1ClfC76QDO7zMq84cCrDPmd2Xbiq62N
	/xst0vveOWWzoLJPjB6LN6v7BGGbMG8U=
X-Gm-Gg: AYBFou0ambGWU9DAaSRQ/OpWo7nZF1kkIzSytIr9QghSa2LMZExOlWiDyDlIWbTE7hP
	LbWcD9n3oeUfl64FKtNxujnGty3S8mHz6o70zz+CbJi4eqjhCo2HRXMmjmyLXzF9fEHwGVryhnQ
	FQ0O3Wi4OLsRnty2Ss7aPY9QIHnJMKWiPYCeZ5yjRjxpzkLXdoBvkmZlr1ECHoI4ClXWuF7/sOe
	q1HPBFMU9qgMo3Lk6H3AtBiriie8mnP1mH7Y55tDiDSDctr4/E7PSM6dwLD2TJSGLZjDeRS+6kX
	cpyJUT9gMfTwRsCV4akFfIMAdEYBStPA0lAqNvq7aMZnZOQxRMPygLXK
X-Received: by 2002:a05:690e:454a:20b0:679:583:e45e with SMTP id
 956f58d0204a3-679ca4d586emr564058d50.8.1792250064946; Sat, 17 Oct 2026
 08:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-26d66390a25fec9fad6c-v2-743c9b89c0f0d761eda1@gmail.com>
 <87ld7w20ok.wl-tiwai@suse.de> <CAFRLqsVs8BGNHb8qG6nnrCc=fafMYAmCSDuXDb8uBRBrgJhnEA@mail.gmail.com>
 <87ecdo1uud.wl-tiwai@suse.de> <87bj8s1u4a.wl-tiwai@suse.de>
In-Reply-To: <87bj8s1u4a.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 23:14:12 +0800
X-Gm-Features: AclHuK-xEKioADGTiLMltPLaprezTGdBPdIHxHvc9v89B5ZAIk4ud1epwNdVnaY
Message-ID: <CAFRLqsX0iZEHWF3uTgv0FW12DPJv=ESAKFYLwWSvJzxKPsxK8g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: info: Serialize freeing with recursive registration
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8817=E6=97=A5=
=E5=91=A8=E5=85=AD 18:47=E5=86=99=E9=81=93=EF=BC=9A
>
> I meant something like below (totally untested)
>
>
> Takashi
>
> -- 8< --
> diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
> index f1fa42e634fc..2e686bd6c5f9 100644
> --- a/sound/core/oss/mixer_oss.c
> +++ b/sound/core/oss/mixer_oss.c
> @@ -1309,13 +1309,18 @@ static int snd_mixer_oss_free1(void *private)
>  static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
>  {
>         struct snd_mixer_oss *mixer;
> +       int err;
>
>         if (cmd =3D=3D SND_MIXER_OSS_NOTIFY_REGISTER) {
> -               int idx, err;
> +               int idx;
>
>                 mixer =3D kzalloc_objs(*mixer, 2);
>                 if (mixer =3D=3D NULL)
>                         return -ENOMEM;
> +               if (!try_module_get(THIS_MODULE)) {
> +                       kfree(mixer);
> +                       return -ENODEV;
> +               }
>                 mutex_init(&mixer->reg_mutex);
>                 err =3D snd_register_oss_device(SNDRV_OSS_DEVICE_TYPE_MIX=
ER,
>                                               card, 0,
> @@ -1325,6 +1330,7 @@ static int snd_mixer_oss_notify_handler(struct snd_=
card *card, int cmd)
>                                 "unable to register OSS mixer device %i:%=
i\n",
>                                 card->number, 0);
>                         kfree(mixer);
> +                       module_put(THIS_MODULE);
>                         return err;
>                 }
>                 mixer->oss_dev_alloc =3D 1;
> @@ -1358,7 +1364,9 @@ static int snd_mixer_oss_notify_handler(struct snd_=
card *card, int cmd)
>                 if (cmd =3D=3D SND_MIXER_OSS_NOTIFY_DISCONNECT)
>                         return 0;
>                 snd_mixer_oss_proc_done(mixer);
> -               return snd_mixer_oss_free1(mixer);
> +               err =3D snd_mixer_oss_free1(mixer);
> +               module_put(THIS_MODULE);
> +               return err;
>         }
>         return 0;
>  }
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index bd19328dca9e..3d35f9d2d675 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -3151,6 +3151,9 @@ static void register_oss_dsp(struct snd_pcm *pcm, i=
nt index)
>
>  static int snd_pcm_oss_register_minor(struct snd_pcm *pcm)
>  {
> +       if (!try_module_get(THIS_MODULE))
> +               return -ENODEV;
> +
>         pcm->oss.reg =3D 0;
>         if (dsp_map[pcm->card->number] =3D=3D (int)pcm->device) {
>                 char name[128];
> @@ -3207,6 +3210,7 @@ static int snd_pcm_oss_unregister_minor(struct snd_=
pcm *pcm)
>  {
>         snd_pcm_oss_disconnect_minor(pcm);
>         snd_pcm_oss_proc_done(pcm);
> +       module_put(THIS_MODULE);
>         return 0;
>  }
>

Thank you for the review and suggestions. This looks good to me.

While reviewing the draft, I noticed one detail we may need to account
for: snd_pcm_free() calls
n_unregister even for a PCM that never reached n_register, for example
during creation failure or
BUILD-state cleanup. We may therefore need per-PCM bookkeeping so that
unregister drops a
module reference only if one was successfully acquired.

I would also like to check the last-reference drop against callback
completion and notifier traversal,
to make sure module teardown cannot overtake either.

I will send a patch soon.

Thanks again.

Best regards,
Cen Zhang
