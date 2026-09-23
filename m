Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD533A7839
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134372; cv=pass; b=lLBdnvewjydA106rRbE4Vd8gZcsTrPBMf8/ypTcDuVh7o1K/ONtBBZlu6Z1cG7mxtjTJzVAsHmcrEfHjjsiI78AhvATZvNCgPCzR+8t4nvDN6NPxYAA3BT9tO4NmayV/ZMHDqyQSnceXkTVeEunQ6eOi8jb2OMrpaAC3isi44uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134372; c=relaxed/simple;
	bh=K1qPM9hjnXJfPu3SDCcdpkpSeBMlGT3kyoPhf0UKiAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBADI/N0fKWgtc8WTkDj3GtryJWAODmXqDhdTJf5ZlI/IP695hrUw1EPXGbg2jc99vterB8ZzbLvJaIIjjAWG0aC5cNQ6G//Lb+GYZZbAwRej7pHH7CTdtUAr/5U4AB3QptY13XMDk9MkeZLhuGAVYV5owrVgmVkgDYtPuiqijs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayyR/xfw; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayyR/xfw"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ebso492472d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134360; cv=none;
        d=google.com; s=arc-20260327;
        b=hiAc3Y5Lz5GT3TawzA7DGIvEIKiPAPcl/2dJN4gLYsTa8yzUgO/UJfVkumGkPuMFOf
         cI4y5Uyi+RVNbojfrn53/rP9+aQTlzPXTmKcqHQNGK7w4vzrOnTireQqI4+tp+OPF//y
         bGsrz6lYI/DuJUo+nWbyQMP6HD/K1mSRT+kQhm73NSzVwdQthZH6FK3MICuc6ew4U+wx
         gmnXoadzR6vuGycMJ/vvBE4bC7FETsG/ZbLw3ycJup55WmNBZhwxm5J4JET08C0lDU5i
         aU6ZJmfTjh3T+5fE6/E9T5KkiXti8t5orKA5HNDIuCDcMt+Bk0iSnDdHJMxMm9yc4LzD
         KDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        fh=csovmiaKLUedxGgKvEvkFGvg0pxwZBfIFEbKuZMSDB4=;
        b=OO9lkB0PvH8LxxFtM0VxCHqNKxo4B2djunrcj3Lu8PRAMzz6yUnv74OZgv2w6JD3bm
         wU2WEMFLpygSq0Wt3wncZ3y40bx8P6YoMs4lgW5p/06szhISg2PuCVNYg6h+X5GmHrcy
         Z1Gmkdlb6F1a47quwmh+6yqcYuUuKYpZTgUqWED1syYCXa4YgYMn/9IdWAvkaTeaEAZ5
         Wu1OteSqeeneRwniCl9nULPJ3P4K0r0z3o7MHvXSQ/RDI8Y5YVjW9kyAZg5bgWYbBoAq
         py3Nyux5qHVljc774Ey6syR92QPc8VL/k0pIA/mwRaBKbW52j6eQvpp4jBY7ERt17Se8
         GsIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134360; x=1790739160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        b=ayyR/xfwfTkXREDEgdkBV66tDxqUAHyfxw+Lr8vc9w2vUxSqxkZTd/ZgPqbhHpu1w2
         QwwpJNhvy/gKKO3lGyqZJN2W4BBqOXP+i7iu88+5/PpWiopNhqZhxXrRoxzjYqwzAip2
         2+00Y7sIFCbRjxDW1XltU6+HIEkFK1+URjT/qUsy6sIHq1N3E8qWox6HkMouHs4xqfwk
         GBlfEbjPMp1quA7ACDeWUUZ6NY6e++fOxmtmrh+HowzNGfzmZX/2f/1BjQFjhVxTP+Fa
         bwS4XnaJZEh2VS6/vJVvmN4wBKHfPQBq+WYlCG1Itff3RSQvYQBoH9QadVARWAiLHpq7
         ZaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134360; x=1790739160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        b=Ayc6DZoipmmFdHjUU5CFyymfwC64UPzAruvPigsadXdrc53oJKroYfIKD5ny5xEZaA
         viN/LHPzg9EyYAqk+F6h+P0/jUP76wws1btrO00GMLMLq4iuMWyrzpJSk0iQkdo3YwOR
         8OSi+n+lE7EYMH2YuZwtuhdaEK4ENvdWJODWYyNBJu2yLM32irSgAO2MkitNH9dMpero
         veU9cf1oJNo5lNynHiPP+EnBuLRju4p2lpn73YUkZqTejZXqPGSDxCuzmyzc0MMNOHB/
         4fgROzjqdehWkzcvCxvuvH/U5ROSM7GQPoQUPEigYeOyBKq3wjHs2Wxp/DdymJhEFDkJ
         d7nw==
X-Forwarded-Encrypted: i=1; AKwUvByyW+cLqMi/4ltbKn8SoWOjXgXKt5Z+pJ6kLEZdMPqqdjhlB/nSP0JbZC3N5u0JFcHrLVGf3qf+d/YY9Uc=@vger.kernel.org
X-Gm-Message-State: AFuF++k0kX9fzyfxdG+SKwR+z7E9f9fs8FrWwoMgdhFpiBaRpCAuv2Nj
	ERoShtYfkp/Ah7LTb/3loal+cK9GsSw/R5PQse/ZSN15FWYyE5FaCYgJR6EbLTTeo5Z054bWIJ6
	ffIBI/rt43r9PgE+2vJZeuo43xnX5EwLu1Pbg
X-Gm-Gg: AYBFou2gdUercamvadLu9h+NJaTPoeO4xAolGJLOqUo46ywhrFHg30zH6mKP+UbIcl6
	ZGmXWpQzvJ8VJkRX9Z6LFGUrWZPOP/PC2Quz8rhwoWy+TJTmz8eIpWFvmBd+r0cPWJnBIgc9idu
	47fgyzLr7yj16qwvYgkUitO5UNckQiaJE5g0Eon/4qa91TRbX+NkrxTv7KgdLRDwhxp0U1qUOOe
	SiJrWjeRUwUYA0rLnI4zcTrBLCqUSiuU1GLUhvpQaDjlTQ0+cc3Bv6RrMpdljr4MNvxKiKHDk1t
	9BY1BvXzkDY2zvpV30Y1yjjbjfqlF0hedLrF+sP4dHzTFQ2wDed7moDZzcG/OEyemHREnNRXhbC
	QF2+n6gICWupXy/n4HaIGsjS1BZmHl+ioUPzuh5JabAImaxRvUAdLGg==
X-Received: by 2002:a05:690e:d46:b0:672:a314:f3b with SMTP id
 956f58d0204a3-672d599edb6mr531510d50.155.1790134359954; Tue, 22 Sep 2026
 20:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903121938.7661-1-kartikey406@gmail.com>
In-Reply-To: <20260903121938.7661-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:02:28 +0530
X-Gm-Features: AcwNN1XLcCRqZ3dwAEcyeNO_SAQFBracNGZPqDQTPW2eXSCPoixNM1HuSvjNQAY
Message-ID: <CADhLXY4MpFNrutY7D=BD96yTOeT2TjUPzgT3v8q8yXhwvNWtFg@mail.gmail.com>
Subject: Re: [PATCH v4] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:49=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> The vhci attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> attach attribute is live while only one of the two hcds exists: it is
> created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
> survives the first usb_put_hcd() on removal. A concurrent write to attach
> can therefore reach a NULL or freed vhci_hcd_ss.
>
> Register the group as dev_groups on the platform driver instead, so the
> driver core creates the files before probe and removes them after remove
> returns, and drop the sysfs_create_group()/sysfs_remove_group() calls fro=
m
> the driver. The attributes have always been created only on vhci_hcd.0;
> an is_visible() callback keeps them there.
>
> vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> platform_driver_register() so the group is populated before the core
> reads it. The attribute array is still built at runtime because the
> number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> preprocessor cannot emit a variable number of __ATTR() declarations.
>
> Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D8753715f05759f1a10de
> Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmai=
l.com/T/ [v1]
> Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmai=
l.com/T/ [v2]
> Link: https://lore.kernel.org/all/20260816061034.17769-1-kartikey406@gmai=
l.com/T/ [v3]
> Assisted-by: Claude (Anthropic)
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>
> v4:
>  - add Assisted-by: tag (Greg)
>
> v3:
>  - make vhci_attr_group static, drop its extern from vhci.h (Greg)
>  - drop stray blank line in vhci_hcd_init()
>  - fix indentation in vhci_sysfs.c
>
> v2:
>  - use dev_groups instead of moving sysfs_create_group() into probe (Greg=
)
>  - add is_visible() to keep the attributes on vhci_hcd.0 only
>  - move vhci_init_attr_group() into vhci_hcd_init()
>
>  drivers/usb/usbip/vhci.h       |  2 +-
>  drivers/usb/usbip/vhci_hcd.c   | 36 ++++++++++------------------------
>  drivers/usb/usbip/vhci_sysfs.c | 21 +++++++++++++++++++-
>  3 files changed, 31 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
> index 5659dce1526e..f3993238f91d 100644
> --- a/drivers/usb/usbip/vhci.h
> +++ b/drivers/usb/usbip/vhci.h
> @@ -120,7 +120,7 @@ struct vhci_hcd {
>
>  extern int vhci_num_controllers;
>  extern struct vhci *vhcis;
> -extern struct attribute_group vhci_attr_group;
> +extern const struct attribute_group *vhci_groups[];
>
>  /* vhci_hcd.c */
>  void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed spe=
ed);
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18c..22b9bad7ca31 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
>  {
>         struct vhci_hcd *vhci_hcd =3D hcd_to_vhci_hcd(hcd);
>         int id, rhport;
> -       int err;
>
>         usbip_dbg_vhci_hc("enter vhci_start\n");
>
> @@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
>                 return -EINVAL;
>         }
>
> -       /* vhci_hcd is now ready to be controlled through sysfs */
> -       if (id =3D=3D 0 && usb_hcd_is_primary_hcd(hcd)) {
> -               err =3D vhci_init_attr_group();
> -               if (err) {
> -                       dev_err(hcd_dev(hcd), "init attr group failed, er=
r =3D %d\n", err);
> -                       return err;
> -               }
> -               err =3D sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_att=
r_group);
> -               if (err) {
> -                       dev_err(hcd_dev(hcd), "create sysfs files failed,=
 err =3D %d\n", err);
> -                       vhci_finish_attr_group();
> -                       return err;
> -               }
> -               dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd=
));
> -       }
> -
>         return 0;
>  }
>
>  static void vhci_stop(struct usb_hcd *hcd)
>  {
>         struct vhci_hcd *vhci_hcd =3D hcd_to_vhci_hcd(hcd);
> -       int id, rhport;
> +       int rhport;
>
>         usbip_dbg_vhci_hc("stop VHCI controller\n");
>
> -       /* 1. remove the userland interface of vhci_hcd */
> -       id =3D hcd_name_to_id(hcd_name(hcd));
> -       if (id =3D=3D 0 && usb_hcd_is_primary_hcd(hcd)) {
> -               sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group)=
;
> -               vhci_finish_attr_group();
> -       }
> -
> -       /* 2. shutdown all the ports of vhci_hcd */
> +       /* shutdown all the ports of vhci_hcd */
>         for (rhport =3D 0; rhport < VHCI_HC_PORTS; rhport++) {
>                 struct vhci_device *vdev =3D &vhci_hcd->vdev[rhport];
>
> @@ -1513,6 +1489,7 @@ static struct platform_driver vhci_driver =3D {
>         .resume =3D vhci_hcd_resume,
>         .driver =3D {
>                 .name =3D driver_name,
> +               .dev_groups =3D vhci_groups,
>         },
>  };
>
> @@ -1541,6 +1518,10 @@ static int __init vhci_hcd_init(void)
>         if (vhcis =3D=3D NULL)
>                 return -ENOMEM;
>
> +       ret =3D vhci_init_attr_group();
> +       if (ret)
> +               goto err_init_attr_group;
> +
>         ret =3D platform_driver_register(&vhci_driver);
>         if (ret)
>                 goto err_driver_register;
> @@ -1568,6 +1549,8 @@ static int __init vhci_hcd_init(void)
>  err_add_hcd:
>         platform_driver_unregister(&vhci_driver);
>  err_driver_register:
> +       vhci_finish_attr_group();
> +err_init_attr_group:
>         kfree(vhcis);
>         return ret;
>  }
> @@ -1576,6 +1559,7 @@ static void __exit vhci_hcd_exit(void)
>  {
>         del_platform_devices();
>         platform_driver_unregister(&vhci_driver);
> +       vhci_finish_attr_group();
>         kfree(vhcis);
>  }
>
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysf=
s.c
> index a7ede6fb3da9..d87d9e449d72 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -497,8 +497,27 @@ static void finish_status_attrs(void)
>         kfree(status_attrs);
>  }
>
> -struct attribute_group vhci_attr_group =3D {
> +static umode_t vhci_attr_is_visible(struct kobject *kobj,
> +                                   struct attribute *attr, int n)
> +{
> +       struct platform_device *pdev =3D to_platform_device(kobj_to_dev(k=
obj));
> +
> +       /*
> +        * The attributes control every controller and have always lived =
on
> +        * vhci_hcd.0 only.  Keep them there now that the driver core cre=
ates
> +        * the group for each device.
> +        */
> +       return pdev->id =3D=3D 0 ? attr->mode : 0;
> +}
> +
> +static struct attribute_group vhci_attr_group =3D {
>         .attrs =3D NULL,
> +       .is_visible =3D vhci_attr_is_visible,
> +};
> +
> +const struct attribute_group *vhci_groups[] =3D {
> +       &vhci_attr_group,
> +       NULL,
>  };
>
>  int vhci_init_attr_group(void)
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
