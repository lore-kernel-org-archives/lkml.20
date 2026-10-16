Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941635C697
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163256; cv=pass; b=IiudJG9Nx26jUtyvXv9r2AH0Lelq/BWqRAdu/+jLp2HbCNMKmboJROyCcKVC18BJwVJgAuI4H+vc7tIDqlYaJzZ1tbBqLfHscMkMBvju4WowPkJhO5AuUVJHxGz1DNh+nv55HR+qSFPOF2hC9e+SBgmDACjadpZ0WTGZdmDfWkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163256; c=relaxed/simple;
	bh=bOJ1uedswj6Hy82IC1H7b+QBlWRb5JVbHsCQhpcyS/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+l3/fdksK5HtCqaBTlHruagA7NyzsJZ+Fu0kullKgIVPEOMY/SBj4lDgTl/FqmldRyrmxWWYZ/XttC2rY6+DOGwPsEni3vAW6aioR/BD3T/iONHbkjWZ3MBsJFFITPVGzrFWgPkwhW55afbf5CJtraC3gdgu63+mlS8Uv2gM+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmKtadp+; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmKtadp+"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67989a2f9bfso63160d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792163254; cv=none;
        d=google.com; s=arc-20260327;
        b=oNbycoKL9l+PJhEh8Ag3STAV6cB1N/YTIkM/EdTSO09ritHt37pzuD/4gZ+zxFltbJ
         lKCLTU7Jd1hhm1ogJkMIZNSGqHzX9M5dzAsxDtgENg4o6OGv4/jlxP9Scggygc/Q13l1
         qolE7ENqhJEpj19U/7VdnKtaz7LjVN2ZHqT4QKtN6/WhGF8qK2KRjhrCPMoaTwcAsTQI
         z4CjnH3Zhr22Wn5qB8DdiP7m334Tb3LBKzL1n8mlmtvdF3Z0X1SMoW2MNaGWT2Bm+8D5
         ziw/mhqjcdAGT8DrMjUcTkELLYOdkTHdSJw0q8ET3Qev4KYTckEe3rr6Do4SthqQ05uA
         IsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        fh=fSbGuLRwmIp65AetrolkI4JgkF6trkH4bElw2mD5ddc=;
        b=RTHbYHxjGk3BvUoSVoLa9r0SM3lo5K9HUMVd4ixvY/YgD1WO/NVQyuBJt6jnD3qMuA
         wJ6wJTazXXJ9omTv50Mo/TJ1y6zY5zGB5SNlo91TarnwfwjBVo4XdMqfSi8UvK3h1LL4
         IjobQKLNGzXNjmA5xKjljt0s00JnPk0EkqWArKxaNJ9kSi0dRBBuP/98CkMEnswO5Vna
         eLbJkZlIUkOGjapyEc9bOVL3ETFUorLz314Fe7w2tYuQGqeBUfiCMnzpva2J604qPD/v
         eTs5X4Knok0/vJEXVzF8KiTdODf1sMOuZsGbegYdb1gnfycN/zA6ntod2wAEX8b4JXZf
         KKEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163254; x=1792768054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        b=BmKtadp+bKsFLaA7NzAmJaiyWINHtyg6Xdb+udn/Di4xD/SB/wHYPVUQm5kXgVtROk
         0NG9ByLeZacRPd9WTGXjdcA83vp6pC77IwjrG5IkgHH9w21BcGoZ5v3OItt/QOlM2I1a
         6agcJJWxokCrDzQ6kGieUnN6ztjPlJRTvZ16MCo18y3vzff7SsHl/5pfGTfZF2/g7aBr
         H3dhF6jwXSTHiHU7BocofBJ/YBac5WomY8oxdJO8rAq9AVFRz70/l8Et3eJUUqVhZrjt
         OWGLQ3hdF2PjwWtf0M7zCPbKMnHGBEDsOb396H+5pOvvROfWFFHX5aMj+W13nBmPOxEj
         h/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163254; x=1792768054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        b=AmW6SvNbCyItJxUmStXRF14YMx+Sdju7ETPiYtv4+koqY8D6ivMSi1h68p5aBW+JN7
         /oT7yccOaddGykrPGRGIHpzwdtqXvPQIzxVSjIP0HIQkcsJZV3+0Vd1d9AQJg1NfbOzu
         y3lOxuCOyOYLCuWbqDgV2rbFRVfG7sanA80lEBTymJlCGj0zGDVJhnFeB89FpS61GjRJ
         0Ihmz6hHRCKqDMeEM+xI5yB77Lp9hQ9JTmXL2r4IeCSqWzs9mz9miT140HQclW/gzaRg
         y7AAHkkg+wMOoWUITVzVRaoWi/Tzrag7T5aKyRr3IalpfRF/4O4WdlAuDsAXW8lqXC+G
         yCUA==
X-Forwarded-Encrypted: i=1; AKwUvBxl2euqW2Dx3rTkG6hGgVhe3CX5eAN0oTgXrs6tNN6zEwzpHAYgGmaJO9H7LbHyNA2DaThDvoiC3BdV05U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTmYJ7Y3erhanqml1kVjxEjJg9LFS/SJgwXKSM4PkmrX3grT4b
	znHtHcQxx6Vj0FUXdxbhj3HHaulM0t3MTLEikI4Ta/yLrzNlFeOuAkd7+3JKg3F8KYN5mJrSTtu
	Bx3VG1u2hfwBnu49yd2k5LV9h72TEm0g=
X-Gm-Gg: AYBFou0J++b0Ne6Jx+L0uVzD/4Wt9bF2dKykKkLlNLwhpQGLPF+AApPzm/ibDDST1qV
	QOBjIpBgq4swBcLy+HEgTFrfDpMl6SnJ6v08yzaFu7NGLlA3uzPRbLvqZUpqy/ty9Y/zcLwZg64
	YJtqiIeWOKf1dcDQif8cC+dgMPYAUBsIpAp/BfhKD2/F1I6D23MnO/VVppyjIJQWxTdV0B1xgPx
	0Y43JJlabyMlGi8tEwfeAkLy9cVtFo+tGSxudF13Gh/GpC48DlYF2xVwl2HKkuXYdvDg9G4wUsI
	tRwH4kpdBiia61SfkDNYkDClOYBC6j1Qt0krINz3OBEJkWw1DY95+mOu
X-Received: by 2002:a05:690c:4147:b0:89a:63da:fa9f with SMTP id
 00721157ae682-8b0f222bbd5mr728477b3.90.1792163253988; Fri, 16 Oct 2026
 08:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016140653.4406-1-tiwai@suse.de>
In-Reply-To: <20261016140653.4406-1-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 23:07:21 +0800
X-Gm-Features: AclHuK_j5dDrkYUnkpqIlBlYf788uPT1QmDZliXxQq6mNw-ngAUaMLUrXM5r_Jc
Message-ID: <CAFRLqsVdeuTPt8N5Bi=ZxiPP=fsjJUgJZnFfgmT5EfMykoRgVQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Expose injection debugfs at device register phase
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 22:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Currently we add debugfs interfaces for jack injection (with
> CONFIG_SND_JACK_INJECTION_DEBUG) at creating jack kctls in
> snd_jack_kctl_add().  This means that those debugfs interfaces are
> already exposed to user-space at the early probe phase -- that is, it
> allows user-space already fiddling with it, while other components are
> still being initialized and hidden until snd_card_register().
> Depending on the driver implementation, such behavior can be an
> unpleasant surprise.
>
> For aligning the device exposure behavior, move the debugfs
> registration at the device register phase, too.  snd_jack_kctl_add()
> may still add the corresponding debugfs interfaces (for the
> dynamically added jacks, if any), but it's done only conditionally
> after the card has been registered.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/sound/jack.h |  2 +-
>  sound/core/jack.c    | 56 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/include/sound/jack.h b/include/sound/jack.h
> index 715b95983188..cf19c333e2eb 100644
> --- a/include/sound/jack.h
> +++ b/include/sound/jack.h
> @@ -62,10 +62,10 @@ struct snd_jack {
>         struct list_head kctl_list;
>         struct snd_card *card;
>         const char *id;
> +       bool registered;
>  #ifdef CONFIG_SND_JACK_INPUT_DEV
>         struct input_dev *input_dev;
>         struct mutex input_dev_lock;
> -       int registered;
>         int type;
>         char name[100];
>         unsigned int key[6];   /* Keep in sync with definitions above */
> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index d9132b885ea3..a81a64b3bfe7 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -38,6 +38,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPE=
S] =3D {
>  };
>  #endif /* CONFIG_SND_JACK_INPUT_DEV */
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack);
>  static void snd_jack_remove_debugfs(struct snd_jack *jack);
>
>  static int snd_jack_dev_disconnect(struct snd_device *device)
> @@ -88,11 +89,10 @@ static int snd_jack_dev_free(struct snd_device *devic=
e)
>  }
>
>  #ifdef CONFIG_SND_JACK_INPUT_DEV
> -static int snd_jack_dev_register(struct snd_device *device)
> +static int snd_jack_input_dev_register(struct snd_card *card,
> +                                      struct snd_jack *jack)
>  {
> -       struct snd_jack *jack =3D device->device_data;
> -       struct snd_card *card =3D device->card;
> -       int err, i;
> +       int i;
>
>         snprintf(jack->name, sizeof(jack->name), "%s %s",
>                  card->shortname, jack->id);
> @@ -120,14 +120,32 @@ static int snd_jack_dev_register(struct snd_device =
*device)
>                 input_set_capability(jack->input_dev, EV_KEY, jack->key[i=
]);
>         }
>
> -       err =3D input_register_device(jack->input_dev);
> -       if (err =3D=3D 0)
> -               jack->registered =3D 1;
> -
> -       return err;
> +       return input_register_device(jack->input_dev);
> +}
> +#else
> +static inline int snd_jack_input_dev_register(struct snd_card *card,
> +                                             struct snd_jack *jack)
> +{
> +       return 0;
>  }
>  #endif /* CONFIG_SND_JACK_INPUT_DEV */
>
> +static int snd_jack_dev_register(struct snd_device *device)
> +{
> +       struct snd_card *card =3D device->card;
> +       struct snd_jack *jack =3D device->device_data;
> +       int err;
> +
> +       err =3D snd_jack_input_dev_register(card, jack);
> +       if (err < 0)
> +               return err;
> +
> +       snd_jack_add_debugfs(jack);
> +
> +       jack->registered =3D true;
> +       return 0;
> +}
> +
>  #ifdef CONFIG_SND_JACK_INJECTION_DEBUG
>  static void snd_jack_inject_report(struct snd_jack_kctl *jack_kctl, int =
status)
>  {
> @@ -349,6 +367,9 @@ static int snd_jack_debugfs_add_inject_node(struct sn=
d_jack *jack,
>         char *tname;
>         int i;
>
> +       if (jack_kctl->jack_debugfs_root)
> +               return 0;
> +
>         /* Don't create injection interface for Phantom jacks */
>         if (strstr(jack_kctl->kctl->id.name, "Phantom"))
>                 return 0;
> @@ -387,6 +408,14 @@ static int snd_jack_debugfs_add_inject_node(struct s=
nd_jack *jack,
>         return 0;
>  }
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack)
> +{
> +       struct snd_jack_kctl *jack_kctl;
> +
> +       list_for_each_entry(jack_kctl, &jack->kctl_list, list)
> +               snd_jack_debugfs_add_inject_node(jack, jack_kctl);
> +}
> +
>  static void snd_jack_remove_debugfs(struct snd_jack *jack)
>  {
>         struct snd_jack_kctl *jack_kctl;
> @@ -403,6 +432,10 @@ static int snd_jack_debugfs_add_inject_node(struct s=
nd_jack *jack,
>         return 0;
>  }
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack)
> +{
> +}
> +
>  static void snd_jack_remove_debugfs(struct snd_jack *jack)
>  {
>  }
> @@ -423,7 +456,8 @@ static void snd_jack_kctl_add(struct snd_jack *jack, =
struct snd_jack_kctl *jack_
>  {
>         jack_kctl->jack =3D jack;
>         list_add_tail(&jack_kctl->list, &jack->kctl_list);
> -       snd_jack_debugfs_add_inject_node(jack, jack_kctl);
> +       if (jack->registered)
> +               snd_jack_debugfs_add_inject_node(jack, jack_kctl);
>  }
>
>  static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, c=
onst char *name, unsigned int mask)
> @@ -504,9 +538,7 @@ int snd_jack_new(struct snd_card *card, const char *i=
d, int type,
>         int err;
>         static const struct snd_device_ops ops =3D {
>                 .dev_free =3D snd_jack_dev_free,
> -#ifdef CONFIG_SND_JACK_INPUT_DEV
>                 .dev_register =3D snd_jack_dev_register,
> -#endif /* CONFIG_SND_JACK_INPUT_DEV */
>                 .dev_disconnect =3D snd_jack_dev_disconnect,
>         };
>
> --
> 2.55.0
>

LGTM.
Reviewed-by: Cen Zhang <zzzccc427@gmail.com>

Best regards,
Cen Zhang
