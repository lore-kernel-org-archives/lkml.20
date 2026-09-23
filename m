Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD313803E9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134076; cv=pass; b=si7ruc48yQcAD9CPZS4UFsxxAKjuQcABi6xZfHQFj8/SdIEKIzyfZFiXL4j8w5hzfi+PztRcMtsfXJgODKpwZTBfQyOidN2S5z1WIhc+rIJNBjeOFZv1VvSaJfZ9HLFLlqcqoK+LE57Ok7NqIWUJSht+QDkFrAofKmFXqWVCjso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134076; c=relaxed/simple;
	bh=Ou8j4+E40D0Pe2fGqCopDnYBeR09E1t7Pc/ltBE9NXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzzgP2/INQlnWB5w1/Q0i5zlyuNRx/HXdi8WZ/UkGUf2DxSzoq5V1V8va68PYZx3jlNkR41JbLttbxOYyUZJrH7yM92cc+qnVpR0XKp28tswWzaa6P5Cs0TBHbkSmIZbEBulhrPeoUPROya+wYwD1YkPa7RHtUOXfrpnWBrDUBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR+Tx7Jy; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR+Tx7Jy"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672c2880f58so437115d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134074; cv=none;
        d=google.com; s=arc-20260327;
        b=kp2NKbp2WzWEOPNIJjAc9P1JkW9nZ17/9Cax8Go98KyGDcWHswm+zOz2IUf++50WTE
         D2U6KK8N3Q2PXYFFD+NR1Wyi6OjOWLxR+udlXyqRGs4mWRdh1wwhVKRfVEONx0A/Spio
         EnRMgaiHURJ9x4payGM/xI2t2F+DVmMo0qsGAbcLQX9z0jXF/PJP+kH1kqKTxPAqxRgc
         5tyAwZV17zxS5ECNkhp1/Qi0bf0GkGmNo/VATy6c9HgZcR+3XpJ+pFdwrF+WY43DMzwM
         nbXU8nY22cFkYauGX1L1E0u3fezD2HLXFGGXFI1FRGSQcpYP2H8GSx2Ju5ocwL8R5vWL
         eh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYnhqDQ91zzPmdqdz/fNQsWMnF+4xqLcwJOrRFiuz5k=;
        fh=7nsHdCLMu4HlwViT/K1oxidwchMxR2/Sxe5bKNlPKao=;
        b=gAoVSojoDMbZwwhGwBL3vRYUgtbm2qFTAQHbT/03L67FNkU/HozIQnWoMIvUR18Tfq
         pCDXYakyWrp5XQnGTogOY1osroOKQ1GJe5GFHxIN/Z9Pot8fD7cYZlOHBbrSNcnwGROP
         ZCOAq0VlClUDDQJAflESpmYB1VMRveA3q3ltbd6GJs1J80IQHAC1NfGVcdF4jcToIWW7
         57Rghfr04cnq0pVCAuvmCXwlxvmiDzIgkptyxX+6ggpYUIsbySV9NRU5v01BqPNH0Aj4
         H5apsfZJnD0wsP0sPR6dYEN34bt4v+ARX5JqIrfq2ROJU9r1SpgeQvD5FVA1l+t+tF7m
         UTvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134074; x=1790738874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYnhqDQ91zzPmdqdz/fNQsWMnF+4xqLcwJOrRFiuz5k=;
        b=HR+Tx7JyhzHSZ78dEycjqSrYI7dN1jNeRHddqwxcKugQlrj4Hh9q5oW6hDkf4qFwuU
         JBQ5mzEIjqgoa7C6aEg1W01uOM11ZyrtGVBFi4++DyKjWJBE3wt+ToptKvMvmJB3dkXl
         lGtIGDVtZLFgDFZ4TNwMpoxv+gtgqm5E35a1/awBwX/98CYYzLsRcf1DrYCYGx+Y1F2Y
         F7/YyOWpZ5lpJVlv2kuVlAUrtdc7S1nUoCBoCee7N4dVqqH8bWMsfcK1udSuicWQ2E0C
         5vnuUqc+E3+YKMH9c+b8Gp3KDN5rPYz74lgRf8qlB3c8Kze4se/DK+wN0NDEa5pyjg/z
         fQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134074; x=1790738874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYnhqDQ91zzPmdqdz/fNQsWMnF+4xqLcwJOrRFiuz5k=;
        b=tAznl/4crTN/nJKckNuZIV7xHeVF/Ybw5zCd5U63PfDvgacs8zRYUsjSChLlVXGEjD
         J1s7UoUVGf0TJ5SzVQUXZIRcE/ldR0PSjzUXrSyIVjm0EQjkHlX2bAc9h4nq0JBq9oIC
         YkdsVlreWxRX/4IcfbQKrZz7wTCTvFCx7EaKem4hw+exb3IxIRtvX24FbELfu/xSCDID
         5jCyd+w0mXxO8eR65ZfULojAJNenu3jkKHq16aQyeqst6JDB1zNulN6SDTOISBq6a5eh
         6ubPTr2hNdDvXF4nDTcH8qu3c9QCVAtqBvf6zFhqUxOxtUP9hhVLpMvAjV2L9BTN6ZqE
         k65g==
X-Forwarded-Encrypted: i=1; AKwUvBwpj2GugXW1YAGlmCIwMQlWeDdLb8rw6radzJtXNgy7job462okuHdiF5KIxpWGvhqDw2uk39BaYJfecfw=@vger.kernel.org
X-Gm-Message-State: AFuF++mho4csfDulviCVqQPLlqIZN0JEX2LUujVpWFhrZR1JYkNW9+7F
	+NCf8JvrhAhWYig7AtRJHEo52V2StYdyWkq3SRK6qVbeLEK/cxbUbU6xCSS091x4fER7ZEkaSE2
	oSrJ0CpRTZTyGkZltQEPBA5+gq4lszH0=
X-Gm-Gg: AYBFou1ePADSWCKIJy2O1BqNhb1AWf7qHxH+mE+I0xnpEVJGtlF9FZuwdx/RxTZzw/x
	6WZatxO0ioBmJtHQpvMvvFs86YsAqPy2yYj6giZHWZe3OolghMqDBKhGFaMLUlYt8CEydqIvSwW
	WBmxw7G1lhDJTUZI5UFgXXa8sgX3w1D9iv4vQWNWxLuycxch/AA/MG8Fd803jJpdCPs6j5dPOqM
	qLSU43eLvLdZeYq1idpPVGX8JWDawSuqI44GB2AMGlpYtAl2j5tiTrqU6xN0Ftigox2J961CSD7
	PARplk6c8188VuMsWbBMqX7CVPVVhQCcJXFFPPX3m65xHW9tNGggWcsFM6WZFaccbnVFdMVAPmd
	f1j61uA7UecCSfz/bnKcHsveZzU4r+KzsvXVeNeGHi9Ewa6Z9YEwwAA==
X-Received: by 2002:a53:ac9e:0:b0:672:de6f:ae0d with SMTP id
 956f58d0204a3-672de6fb1e1mr91515d50.20.1790134073681; Tue, 22 Sep 2026
 20:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903121206.6893-1-kartikey406@gmail.com>
In-Reply-To: <20260903121206.6893-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:57:42 +0530
X-Gm-Features: AcwNN1XV1G4f4sZRuSQ9NX5nYEFn9KbLJMeGSbSC9b9fvzo6Jzf6goe_HdrhsJI
Message-ID: <CADhLXY7AUqUNCtZpWDBUKBRMbd8Sj_MSu2uzL8Hy4tG4z-u7oQ@mail.gmail.com>
Subject: Re: [PATCH] HID: roccat: fix use-after-free and uninitialized-mutex races
To: erazor_de@users.sourceforge.net, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:42=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> roccat_disconnect() dropped devices_lock between reading device->exist
> and later checking device->open to decide whether to free the device,
> letting a concurrent roccat_release() free it first and turning the
> later check into a use-after-free. Fix by keeping the whole lookup,
> state update, and free-or-keep decision inside one devices_lock
> critical section.
>
> roccat_connect() also published the device via devices[minor] and
> device_create() before initializing device->readers_lock and
> device->cbuf_lock, letting a racing open() on the newly created node
> take an uninitialized mutex. Fix by completing all initialization
> before publishing the device.
>
> Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc492a9e154f81127551f
> Tested-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/hid/hid-roccat.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
> index 4f15eb951039..1d57f8a44a3d 100644
> --- a/drivers/hid/hid-roccat.c
> +++ b/drivers/hid/hid-roccat.c
> @@ -316,6 +316,14 @@ int roccat_connect(const struct class *klass, struct=
 hid_device *hid, int report
>         if (!device)
>                 return -ENOMEM;
>
> +       init_waitqueue_head(&device->wait);
> +       INIT_LIST_HEAD(&device->readers);
> +       mutex_init(&device->readers_lock);
> +       mutex_init(&device->cbuf_lock);
> +       device->hid =3D hid;
> +       device->exist =3D 1;
> +       device->cbuf_end =3D 0;
> +       device->report_size =3D report_size;
>         mutex_lock(&devices_lock);
>
>         for (minor =3D 0; minor < ROCCAT_MAX_DEVICES; ++minor) {
> @@ -324,37 +332,28 @@ int roccat_connect(const struct class *klass, struc=
t hid_device *hid, int report
>                 break;
>         }
>
> -       if (minor < ROCCAT_MAX_DEVICES) {
> -               devices[minor] =3D device;
> -       } else {
> +       if (minor >=3D ROCCAT_MAX_DEVICES) {
>                 mutex_unlock(&devices_lock);
>                 kfree(device);
>                 return -EINVAL;
>         }
>
> +       device->minor =3D minor;
> +
>         device->dev =3D device_create(klass, &hid->dev,
>                         MKDEV(roccat_major, minor), NULL,
>                         "%s%s%d", "roccat", hid->driver->name, minor);
>
>         if (IS_ERR(device->dev)) {
> -               devices[minor] =3D NULL;
>                 mutex_unlock(&devices_lock);
>                 temp =3D PTR_ERR(device->dev);
>                 kfree(device);
>                 return temp;
>         }
>
> -       mutex_unlock(&devices_lock);
> +       devices[minor] =3D device;
>
> -       init_waitqueue_head(&device->wait);
> -       INIT_LIST_HEAD(&device->readers);
> -       mutex_init(&device->readers_lock);
> -       mutex_init(&device->cbuf_lock);
> -       device->minor =3D minor;
> -       device->hid =3D hid;
> -       device->exist =3D 1;
> -       device->cbuf_end =3D 0;
> -       device->report_size =3D report_size;
> +       mutex_unlock(&devices_lock);
>
>         return minor;
>  }
> @@ -369,15 +368,12 @@ void roccat_disconnect(int minor)
>
>         mutex_lock(&devices_lock);
>         device =3D devices[minor];
> -       mutex_unlock(&devices_lock);
>
>         device->exist =3D 0; /* TODO exist maybe not needed */
>
>         device_destroy(device->dev->class, MKDEV(roccat_major, minor));
>
> -       mutex_lock(&devices_lock);
>         devices[minor] =3D NULL;
> -       mutex_unlock(&devices_lock);
>
>         if (device->open) {
>                 hid_hw_close(device->hid);
> @@ -385,6 +381,8 @@ void roccat_disconnect(int minor)
>         } else {
>                 roccat_free_device(device);
>         }
> +
> +       mutex_unlock(&devices_lock);
>  }
>  EXPORT_SYMBOL_GPL(roccat_disconnect);
>
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
