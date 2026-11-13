Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540495;
	b=mdm+kOcv5j0TPSyLUyBBtPF+/qAsR+rliPI8+VCQew2j+UyS/9YkiWeqmKNxqkfQwGNw
	 KN66YKaZkEoMkH2ULZ2u6fzK11dJtFU/4nVQqxsXIQ3c5brkfIwHwKXfsdIWj0gKlNvfl
	 MCxUasSn3SX5VznAza2y7lJhU09W/MNqYPbyOZZew4bW+ouB55IVU4Ef76urIxLt5A/hV
	 tMiCmD8mICqiOaL7qHfAKlCj1wPsm+pI7f/1yHDujMzJ7UKkFvVxy8mWI3dAT0VRZ1S/K
	 1GbzhBRJzPx4OKzITg0kravXW6dJe2cxBX9/rJPtWAtpNpIJCpAWRlPCEvtZy4sQ9EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
	b=vHx+jAEuAWpt8tYB7DHmxfuv0tBQ7+ii4rqmHM9h8ZAmRTI9Mvyw6H79V+A90J9wFUpB
	 +0a0JN9ez9/kKE6qA5to4NjhSvK+iXQbS8NH5tEERj3t/6qmaTQVBNfii2paWSkRFJ6VX
	 SZwrvCWb2j7mK+D4OJ0dTsQpqgR0GxXIe8TbDu1tpZqObQSF8MtyjBZd4d0TQKlx4cwg6
	 TlXLj3xWk/MwlecHftbOQkjZ+VFW5sPij4G+Nt5vJuj2IxDfj8Kcchq6G89ci9bmwDeKW
	 sFV6N0vOnY1dJ1dxEmuWivjbe8YCrC2Kz/g4NbB6EgQH0FpFPwcLwt4moIIO/qhuWQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kJ39VHmI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5017B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kJ39VHmI
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C001B40330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794540493;
	bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kJ39VHmIquTDOXUT1kHRaKHU3GkY3gb++Fn+albaxNxMNq+WUOC23EVanUoFgX+j2
	 KSFYdkEz8fMgx7ds4QjHg3z4L/jXbb7Z7+/FOiebPvT23Ejor1ifyWDcTsyRCoM9Fm
	 lk1lB3AvjeXGWsHhUucOwmqZPPnHftnwU0hVGHM9lrvTLqJAH4aaQVYspR8sXTG0lE
	 qzdDpfLeHJ/Ampgu4c6as7mkq0RTpLqNO4KuRk4ZSAW+qoTSwi72/63TFtLzn1AErS
	 3FsSsG2LZTmcETBL5oBdiHeoj9ZMYkRrpSVM72J57o8wesPmSvT9LleCxfZ1CLfoDP
	 kwMJDKZiW88bW0CPPmbovbcz9Qqfhmj3UTzzQpqWC/fxUirptoEPq2PdgcmQAl6RVk
	 SdgRuyNk8Z2i0M+VY6d6t8W6zpcgvjpilV9JDRU6LNAeTf4Pb3QnrzE0qUvjLE/oCh
	 LIMiSahbHH2VSyDo9PCjZUkRWujJbf1vidZxnEJRENZjgp5+S8rOwjPSdrBD/Vb2GV
	 meP7XdzlTmLYGPEaJiPIbdCXQGypt047earsN8bpsYbtHr9LegCTCbYXhi9F7rqIBW
	 il2KEId25bqw37SYuMpEd/+RBED/gh44t3wJ7EenAOkxRTpEGo37qdDaOUXk5prJ+j
	 +rxnauQpDEm6eEDrQZOXUKLY=
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so510147c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540492; cv=none;
        d=google.com; s=arc-20260327;
        b=KGW4k1ans4Kvw9ZegGA7VjQOxKenSWhhH3UOtZOGw7VVl/Fc7IJFfdBr1QsSgQg3D3
         d5eo8GyU8fD9PqfKQyoB1AjJeBy1Zu6mY7dKs3V4N5dZVrFHANBR+wIN7WKjqkPzvRs8
         VcYn55t3mYiJ1cXt+ObPScnD7eHW1epSSPw4RY8GiEr6YeGvcbj+lVrbf4DBENe4WMXM
         cMkjmMncdb1Ibie7cKNi0pBkNZPeselVs2+ylHiEGqBL2NZNHH8Fg2+ivggb8VpIucqU
         qnrrCY89o2gRw8yfFr3h3cBB8DZEVRFa63H1qLWIpQM8ZZVx3la8wdejZzGLemp4FWoh
         LKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
        fh=AyRwLXkK1DVg6D1lYnDBJkygcSEUjo7gFIhRZPWtcjE=;
        b=gK83dBeFDtgy4sCxK9uCbIv4HzzbynCebtY7JpE/6HZf1gValqvEjet0u4I1UxPqIS
         FYIaDsmRht/FQj4YmBxqxBGHtEJyAP3zTrH4xakKhxJGSAAQ9GqxobwyN68m/4vjorha
         W1ktcUs7lCxRcpc44osv0C3zq9AnSjQHjCz6oMEWvfOk69H/XfaCWMOfgyJ5Ic2e+s4l
         D5JxEfBvXtMPy9lNzaLY8HgmEZM+LL6d807d70L0Mdwg0EsAEXNd//sBh/4GmADF/ah2
         01ETOHYUlUIC7/yUe6pNduZ1inHT2pg9SlYzj7tmoypay3hRhRgUmLXuE/25GZj4l1Tx
         NrXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540492; x=1795145292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
        b=IRf4p8fvNjpTgSETNXRdMwkQ8IjZ1t+7jHb1aw7egsMy5nG8U5Z2CO3805gGZAojmb
         X5KO91Imhna3VSDMipDL4N9spKKB9o4T8RAGFb60sYZ9Ob/Mz8cWCPun6CIo7n0UpCHV
         elafFEn4NplMtYOyf9u6N8A8GnVuYuETPBNOQeL35xIwNy3qLIZnh7gbPiZyuPA+VrJN
         w3y88b+wl/PAX+pthaY+aB73uYyMMauZeGlbuDm0YUntpdk/TeQ9jPFoJahaDNBXDG7n
         +wIlwGsCm6WrG4yF+RaCTGgKica8kmgJYQPRYSazAyKN/3smvApmsWG0/kq84R5ypjAv
         s+1g==
X-Forwarded-Encrypted: i=1; AL+hErFoUg5E+phLWPs2E4bVCwTgPG83LgK0+FhDt09hlNqHAyvK/HA3rrSlb5QIgMcThkAn6bZGL8HAW8AVIC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+tCTR57CATo/JYVB8398p3//70Rzuht6fQOzfmy8Qau8KVxpG
	yw/2Cn4nUyVVzD/N/6oBcXjbChY26x3Bu7kQk++5z6tNESqiW/iAdU13XBIkxu8Grk0ZuzNHv4H
	3QVwAiFrr2FcFKPhM4Quw8gQKBS43vdIppsbdO7nb45HdcM8z+aYMaqTNk6AidoAxwTPPvVwAmT
	pY0v2JRvfFNi7dUxZDxFGg9BHv5Qiqm8U7cZCxz+93HJTDxJT7NuNdv3IoISpHLzyPgPk0Vw==
X-Gm-Gg: AYBFou2KBpKg+jLqL9ovPdFZh0T79cqpxxl7RxkqGDoo506tDxg7h4CDRRLnq1Q2kWQ
	vZK26+M4wkb47CazqUGGhHriI3X2xwJ33QNJjno5jpzNuA6cPgLsZmjpVWrKu0gmOrLagfafm49
	Cd5atB7Dady5QzNjcz3aqsAkf5uav5xh0bNAQWki67suFc8youojJpxJOliXj4tsFp+LLwZ/CWi
	NpWmH2OP1DDHZ+ivSrPfYfSwiLQeh22D/Zux7Ir6387ohZAlzNhIoRbD+lTXF0oNLdwd4LKVa4G
	So4/N9U5a6UJIcAAsXan542wxyqDpqyqyM6U1Y2OtDG2+3pY8vXlE/TuKBtZtn2cDWHrvQxq
X-Received: by 2002:a05:701b:230b:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b5030a346dmr1112774c88.14.1794540491939;
        Thu, 12 Nov 2026 19:28:11 -0800 (PST)
X-Received: by 2002:a05:701b:230b:b0:1b2:46ca:242e with SMTP id
 a92af1059eb24-1b5030a346dmr1112759c88.14.1794540491446; Thu, 12 Nov 2026
 19:28:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112074823.853819-1-aaron.ma@canonical.com> <18febc1a4ca8191d1374c586998611952ff0cf75.camel@rong.moe>
In-Reply-To: <18febc1a4ca8191d1374c586998611952ff0cf75.camel@rong.moe>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 13 Nov 2026 11:27:59 +0800
X-Gm-Features: AclHuK8meXdDsLUSD3mVRDDkmixMmtlj893g0fjWTVke1e_5xtZwxg_562ZQczw
Message-ID: <CAJ6xRxVNfRET70eByhzq4WuM_nVwofTf9t4SkwW8SS+j9iPy7A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:14=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Aaron,
>
> Thanks for working on this.
>
> On Thu, 2026-11-12 at 15:48 +0800, Aaron Ma wrote:
> > ThinkPads expose battery charge thresholds and charge_behaviour through
> > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > charge_behaviour and charge_types on systems advertising those WMI
> > capabilities.
> >
> > When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> > duplicate charge_behaviour sysfs attribute and unregisters its battery
> > extension. Conversely, registering or updating any power_supply_ext on
> > the same battery runs sysfs_update_groups(), which removes standard
> > power-supply attributes not owned by power_supply_core and wipes out
> > thinkpad_acpi's charge_control_start_threshold,
> > charge_control_end_threshold, and charge_behaviour files.
> >
> > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > table check when the corresponding driver is enabled in Kconfig, and
> > update the force_load_psy_ext description accordingly.
> >
> > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery =
charge limiting")
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> > Changes in v2:
> > - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> >   device IDs, method pairs, and driver configuration checks, as suggest=
ed
> >   by Derek J. Clark.
> > - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> >   instead of relying only on ThinkPad ACPI device presence.
> > - Check whether the corresponding driver is enabled before looking up
> >   its ACPI device, including for ideapad_laptop.
> > - Update the force_load_psy_ext description to cover both drivers.
> >
> > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1=
-aaron.ma@canonical.com/
> >
> >  drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index bd64e7b44669d..14b2c3f4cc7ae 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> >  static bool force_load_psy_ext;
> >  module_param(force_load_psy_ext, bool, 0444);
> >  MODULE_PARM_DESC(force_load_psy_ext,
> > -     "This option will skip checking if the ideapad_laptop driver will=
 conflict "
> > +     "This option will skip checking if the ideapad_laptop or thinkpad=
_acpi driver will conflict "
> >       "with adding an extension to set the battery charge behavior and =
battery charge "
> >       "control end threshold. It will also skip checking if the BIOS re=
ports that "
> > -     "those features are fully supported. It is recommended to blackli=
st the ideapad "
> > +     "those features are fully supported. It is recommended to blackli=
st the conflicting "
> >       "driver before using this option.");
> >
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & =
fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > @@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle ha=
ndle, u32 lvl,
> >       return AE_CTRL_TERMINATE;
> >  }
> >
> > +struct lwmi_psy_deconflict {
> > +     const char *hid;
> > +     char * const *methods;
> > +     bool driver_enabled;
>
> Why is this required?
>
> IMO the relevant items should be wrapped by #if IS_ENABLED(CONFIG_*). In
> this manner, lwmi_om_psy_ext_init() doesn't need to iterate through
> useless items in vain.
>
> > +};
> > +
> > +static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
> > +static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" }=
;
> > +
> > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D=
 {
> > +     { "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_=
LAPTOP) },
> > +     { "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +     { "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +     { "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +};
>
> It could be flattened and simplified into a 2-items array. See the
> attached patch (untested, may be completely nonsense).
>
> If you adopt my approach, feel free to add
>

Hi Rong,
Thanks for the suggestion and patch. Grouping the table per driver under
`#if IS_ENABLED()` is cleaner. I will adopt this in v3 with your tags.

Thanks,
Aaron

>    Co-developed-by: Rong Zhang <i@rong.moe>
>    Signed-off-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong
>
> > +
> >  /**
> >   * lwmi_om_psy_ext_init() - Hooks power supply extension to device bat=
tery
> >   * @priv: Pointer to the lwmi_om_priv drvdata.
> >   *
> > - * Checks if the ideapad_laptop driver is going to manage charge attri=
butes first,
> > - * then if not, hooks the battery to our WMI methods if they are suppo=
rted.
> > + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to ma=
nage
> > + * charge attributes first, then if not, hooks the battery to our WMI =
methods
> > + * if they are supported.
> >   */
> >  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> >  {
> > -     static const char * const ideapad_hid =3D "VPC2004";
> > -     acpi_handle handle =3D NULL;
> >       unsigned int props =3D 0;
> >       int ret;
> >
> > @@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_p=
riv *priv)
> >       if (force_load_psy_ext)
> >               goto load_psy_ext;
> >
> > -     /* Deconflict ideapad_laptop driver */
> > -     ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> > -     if (ret)
> > -             return;
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_lis=
t); i++) {
> > +             const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_dec=
onflict_list[i];
> > +             acpi_handle handle =3D NULL;
> >
> > -     if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> > -             dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> > -             return;
> > +             if (!entry->driver_enabled)
> > +                     continue;
> > +
> > +             ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &ha=
ndle, NULL);
> > +             if (ret || !handle)
> > +                     continue;
> > +
> > +             if (acpi_has_method(handle, entry->methods[0]) &&
> > +                 acpi_has_method(handle, entry->methods[1])) {
> > +                     dev_dbg(&priv->wdev->dev,
> > +                             "ACPI device %s manages battery for devic=
e\n",
> > +                             entry->hid);
> > +                     return;
> > +             }
> >       }
> >
> >  load_psy_ext:
