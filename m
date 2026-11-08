Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156297;
	b=y/ocMcznMY89Ro4jm3fvQQWuecPCtG7IqCFjA2mh+MC/qkhDTjwp4Zma8pM/wtOh60ef
	 qSqgk07Y1HC0K4IlE1GJ6cgca5mqx7n1JeorBG9WV7cJxVAPpBrY/IAtqVCg2VmBQK9UM
	 wESNWfaB4btJPZnPZgvEJtTTiS7TiA+qkQEWGW3a4M9VuSRp1bmXYoSm/63jZgPEaXWWZ
	 sUPPPPQfOOqf3BzDr1rlJet3vWli4txgrmsc0pJ5ja3Gmj6Wzw3h11MtcoN2NGh1LrqLQ
	 BfZmrOKJ0GtYnSfQtbJnWADOcAso/K2XAIgG0AkDTWNDkDi/XZTPzlcJZ4KkOe0UnIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
	b=U+s4SK6hyKwzL7d9bh4l8qsn5/5q98E7M5b7g4FNixf3oKcdg5B4quGt294fTxESCfI2
	 htiD3Arx7aivRIJd4jIW0iXNz0j6/7FAg/3+h/992DLBj7+YxxEJ5Dgc9VSKA4bhSsgb6
	 N68S/mig1FUQZuaJ3JrKhJ5KIBZEsKFGVRK9KoA3sJu+YLvsyJW5MuECrBy3R5h/xNTfM
	 IugDA/NjFXBAzFD/Y6W9wXHtfxLp+c9TKXBXYd0Zs9nP8IQRHM2R9Zk4hBOvuK99zb8LW
	 heL/4PfNjP058yfwXa0AFRtkjiY+TLdEn7W1ta4UXTvgb0GbllrGNBznPmavH7/pH3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGVc3mTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGVc3mTx
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so349217eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:44:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156296; cv=none;
        d=google.com; s=arc-20260327;
        b=Xy+mx9BYfi1pN6zfaCcIjJPbFXH1vNrU+A4Swd+KmStowcYc0kGQIKpxmuGiMJZHdA
         ZdUwBQmIVc4tKWbMzh2QaYDz1f1bTzx/2dtn3vGZFNMSpff66jlA7KROgWxj+iVMWUnq
         qZCdZMpJOJzhYiuiuzLU04itDdabB/k0h9zOU81puyDhE6jRcxVQcEbNlKgF3Ux/y5n5
         TZXnW3mIfGWfwefTGskYqcvbK+hKHd38nxRef1/OFxRjSdJ8t2c18h3elnzDMqU0Sd1Y
         sit/wvdzf1O9NEVCaN4NhdS1sUD7FsBGXsdj3+TH9A2gysWfYrjFmUe/TsPhO5IcyVOE
         Cq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        fh=MFSHBzb+urewA24IDZwrTIdacXSTU1qCJHRf0KeWsQU=;
        b=dTP4TNz+3RiJTQojEZjXwZcj7knQXKGPDNHof+xItYh6Po1/iVBgeOQuZWr0MR+9Aq
         TGALWAJlINekM0ViZvMGrA6NDmNLx0xOW+utmMpf1VHUsrorKiU6qNUrO+5XkeyLYEIo
         ZfL9K1q36vrkwE+uWt90hP4CgAmWzY4Pz38PafssU1ObjUAYjodLkqV8i7LUn/hY8VeM
         /0L6KCY9LS37VPWWSdhW8PSWU8DQ+jduSOiBjTGh2cqmXNsyluX42FJD/2Oa/DU6EtiB
         8nmyWuMoE/vQHi476t8XJBFsBOMNKX4KxvtDQBMcTvemqRARA/wWYGPdLg/KtJ80S5cT
         u0Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156296; x=1794761096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        b=dGVc3mTxzs5TaHTrjDBddOEhDnFHztDcNjd73h4P55tQ63wPMiESkNoB9Lde3OzaV7
         iUAOVUlFh1sfIJ+qrGFrYhwQghANfLjzIySMTWAeE9pSGBdnHcsCiibMDBufFLZEWOvp
         jW2F4JFkvCply8e246LWG0adkARKQPvY+8ppfwSC8YJBGqAO9p8FYkvaK1yQhnidXc/0
         O22ewF6CvQzzCCVoViTM6fbwkoeJzylYTlxrlNgSYXQ3/sMn6a02UZuV5SP+WIVLorxq
         dxVuA2f6lbJXMTpX1tfVmL/XjQ4Qx2IvHPYQXH/mP47X/5mKLrm4srzDVF/TOTUE42nm
         vrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156296; x=1794761096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSdOXir0KqgstOa90Y7/+TFLedl+ex/hx3CBpVcVcnk=;
        b=WeOsfT7E3wvJObI6wdkqulviPf2KI5jO2AtOU4Y0Y1lps2E1whnj5atL+kABolDbqR
         u3QuNfIzZOjOakQZzkj4uhEa5at2o4V5/AKcwe9/EQVhWndtpJDHxBslc+S2TTrdkpVK
         eQTRdlstsATLRzeRhsWUoJWzDe6FTY/wrJCN/GTpryG6LQ/Tpd9R48d9mULKkpcYnSFf
         A54hvawKULyquPqYwHkbWet4zI+bKUaU3QgnvEB0ud0hv5siLkfna+QHRn2NOISiEhFh
         CG00Oaj4HpBwpPoj6C34HwsNnP6UY9o65kOLWVGEDkEVeiSlQ42+gQYKTn1syG98lu8D
         tKDA==
X-Forwarded-Encrypted: i=1; AL+hErGSVUvyBkJYFRYiI3Ql84bsgmABKl88WYQwfgTuQOWoBOkDB5QzyRfb6xg0PTQrAPLm+tqlrrRPDNYjS4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xEsCoiRmwROQJBHrqXvM+2TKUixzjnqOM0o9FQQ1XgxrjWRcO
	0EhVZ9E+a7gkQw2WkihYc8gcO0ipkHaBG0YIgEebq6WFb4ykvoWHKCoBBPypsbB9f0MCR4uLfHo
	kzvRQaWDv6ApPTXdXQn1PwXebBqz7sn0=
X-Gm-Gg: AYBFou0leBZICQoeB9+P6VIXb06y7zXFMJ6PpvxH582xRQsuBFuXBOGqCMIwE/XZfFJ
	rAftOrFO+CIhIjodMSJ1oo81unJIFb3mvCtaHXKQWqLvW/AxJtLF3MyxSAdfaprgGPwrbhhzh4G
	IDwT/veWZXEvQ0iyaDr1AKJHImvPC7VCYI+FtUViqIjh6Qgc137CZyqiHtR9IDDXrvP8tq5rqq0
	cihSC03c3KmE3YGFdKEu/JqAKO8wRJeT/YDg0XW7JuN05Yq0SkermD7/0aKeeXpt/WrMMmX+eQb
	Ff3CEYwvdKD4ukxon/DcgYfSeagzyqUbYrHUBkuBOczJyezgvk4jmgZ5o0ypkH5GZDie3PFxS7i
	Jt/1eRbSisJmQWHtWs/RVBdQDrvGDkd6NDUuyvlvm+QeygjMXElBhxGOHR6GYqfnMXyarHW9I5v
	QYNOUaAWEVpZMreyz2H5ulUEFljZU=
X-Received: by 2002:a05:7301:da8b:b0:36e:a321:5353 with SMTP id
 5a478bee46e88-372543bbbf7mr4144537eec.2.1794156295714; Sun, 08 Nov 2026
 08:44:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-redrat3-input-uaf-v1-1-b882e43d9803@gmail.com> <avCBzjIenoErsXhh@extorris.mess.org>
In-Reply-To: <avCBzjIenoErsXhh@extorris.mess.org>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sun, 8 Nov 2026 13:44:44 -0300
X-Gm-Features: AclHuK9OUQ0JURmPmwyzwr6q9AbQnZBaFuj_eL060l-9qRbVh720idxJ-TbkSgw
Message-ID: <CAOCBhwFruAbWMWsDomwdO13xD9oQwtLsfmCEqtJfwEqedadGBA@mail.gmail.com>
Subject: Re: [PATCH] media: rc: redrat3: fix use-after-free of input device
 name/phys strings
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+aec1962419768c5caf88@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

You're right, I apologize for the incorrect analysis.

rc_unregister_device() calls input_unregister_device() before
redrat3_delete() frees the struct, so EVIOCGNAME cannot reach
the freed name/phys strings via the disconnect path.

Thank you for pointing to af452b9e01331b =E2=80=94 I should have checked
the probe error path more carefully.

Regards,
Joas


Em dom., 8 de nov. de 2026 =C3=A0s 11:06, Sean Young <sean@mess.org> escrev=
eu:
>
> On Wed, Nov 04, 2026 at 09:03:01PM +0000, Joas Antonio dos Santos via B4 =
Relay wrote:
> > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> > redrat3_init_rc_dev() sets rc->device_name and rc->input_phys to point
> > at the name[] and phys[] arrays embedded in struct redrat3_dev.
> > rc_prepare_rx_device() then copies these pointers into input_dev->name
> > and input_dev->phys without duplicating the strings.
> >
> > When redrat3_dev_disconnect() runs, it calls redrat3_delete() which
> > kfrees the redrat3_dev struct, freeing the embedded name and phys
> > arrays.  If an evdev client still holds the input device open, a
> > subsequent EVIOCGNAME or EVIOCGPHYS ioctl calls str_to_user() which
> > reads the freed string via strlen(), triggering a KASAN
> > slab-use-after-free on the freed kmalloc-2k object.
>
> This is nonsense. rc_unregister_device() calls input_unregister_device()
> so EVIOCGNAME will not work any more.
>
> My guess this syzbot issue is resolved by commit
> af452b9e01331b5338a1e5141624f17607239207 and this is the error path in pr=
obe,
> not disconnect..
>
>
> Sean
>
> >
> > Fix by allocating the name and phys strings with devm_kasprintf() and
> > devm_kzalloc() respectively, tied to the USB interface device lifetime.
> > This ensures the strings outlive the input device, since the USB
> > interface device (and its devres) is not released until all references
> > to it are dropped.
> >
> > Found by LLM-assisted code review of syzbot-reported crash patterns.
> >
> > Reported-by: syzbot+aec1962419768c5caf88@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Daec1962419768c5caf88
> > Fixes: 2154be651bfd ("[media] redrat3: new driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > ---
> > redrat3_init_rc_dev() stores pointers to the name[] and phys[] arrays
> > embedded in struct redrat3_dev into rc->device_name and rc->input_phys.
> > These are copied into input_dev->name/phys without duplication.
> >
> > When the device disconnects, kfree(rr3) frees the strings while evdev
> > may still hold the input device open.  A subsequent EVIOCGNAME ioctl
> > dereferences the freed string via str_to_user() -> strlen(), triggering
> > a KASAN slab-use-after-free.
> >
> > syzbot link: https://syzkaller.appspot.com/bug?extid=3Daec1962419768c5c=
af88
> > ---
> >  drivers/media/rc/redrat3.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> > index 3e82b5e66..d9e37ede2 100644
> > --- a/drivers/media/rc/redrat3.c
> > +++ b/drivers/media/rc/redrat3.c
> > @@ -229,8 +229,8 @@ struct redrat3_dev {
> >
> >       u32 carrier;
> >
> > -     char name[64];
> > -     char phys[64];
> > +     char *name;
> > +     char *phys;
> >  };
> >
> >  static void redrat3_dump_fw_error(struct redrat3_dev *rr3, int code)
> > @@ -943,11 +943,16 @@ static struct rc_dev *redrat3_init_rc_dev(struct =
redrat3_dev *rr3)
> >       if (!rc)
> >               return NULL;
> >
> > -     snprintf(rr3->name, sizeof(rr3->name),
> > -              "RedRat3%s Infrared Remote Transceiver",
> > -              prod =3D=3D USB_RR3IIUSB_PRODUCT_ID ? "-II" : "");
> > +     rr3->name =3D devm_kasprintf(rr3->dev, GFP_KERNEL,
> > +                                "RedRat3%s Infrared Remote Transceiver=
",
> > +                                prod =3D=3D USB_RR3IIUSB_PRODUCT_ID ? =
"-II" : "");
> > +     if (!rr3->name)
> > +             goto out;
> >
> > -     usb_make_path(rr3->udev, rr3->phys, sizeof(rr3->phys));
> > +     rr3->phys =3D devm_kzalloc(rr3->dev, 64, GFP_KERNEL);
> > +     if (!rr3->phys)
> > +             goto out;
> > +     usb_make_path(rr3->udev, rr3->phys, 64);
> >
> >       rc->device_name =3D rr3->name;
> >       rc->input_phys =3D rr3->phys;
> >
> > ---
> > base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> > change-id: 20261104-redrat3-input-uaf-b6d3789e63c9
> >
> > Best regards,
> > --
> > Joas Antonio dos Santos <joasantonio108@gmail.com>
> >
> >



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
