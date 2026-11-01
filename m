Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793550227;
	b=n7PrBMqYLP5zOt8HaVltAvqO54pSmsmeEv2zpYFeds3xW+iF9XHskbrnxURG64pDkre4
	 22Fh8Fncx4LO+3/CNxjnj1nhxCtwM9yakboLI2hKcGF4gaTm2MwYDwBRbY9HqF0YD88cy
	 Cti/STkyzMQ+qwtDVBe4OHuQjodevGesoryc5MHP3Spoftl2IJSw1jNoeR5NAK58orQh4
	 FbxQPHi+MT0bjr/MrfRlLAdwxlOiEuYkD8uSRSCTYEjiYm+A4PfvBIm9/qCvJznEsqLWr
	 qPg7Fh5r3gecN2JK4nQOrRgi/9U2BlzbuJ9ERafC28+qnfsQI5bydLLe/jo2fqKSbFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
	b=JCDhal4G4AksQu61yXAwsHEtU11wQ+NkvAmPr8HNwV2zQIEXcuXqZzWTMLkQjoXzdnCI
	 NJAovk+p3iX8CD7qiF3bdsCs7f3jNofASqPoG90CxTBVG7LbK6AojA8zS7CUSC2/F3RB7
	 scdcJeRfxN4Htfg698HMykhWKxjBOU/H/MqldzDwPXBOKNCMXCwHWmVG89zZ9sX5YAKpV
	 gsalif7Y4dg/O/r70D4OQaJ1FOCpaQYxuxxqq16uoheOkYXoX9JAuHcbpJhG+eFiouF/3
	 lrDIgJcBFZjoko1td7lTtH/IbcuawRSG56S54W3zrtjm85OnM0M4X8EJf5HVgXhA/3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Aw6WD+I8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BD606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B0BD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Aw6WD+I8
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso1896273eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793550225; cv=none;
        d=google.com; s=arc-20260327;
        b=Cbg/nObK92oz4vSwqDz4A9mPAJEbxxZsV/gb7uXTwBpXzhGibnl+V/acJ9O3WqmMCd
         Cco9rtKq4UuCRSlQ9UevMgGL1Q6+i+Ca0hT6kFLPl/YM2R+CLBnVO3XAnTQKvIquKTIR
         DSenqr/9Mc6CqAmICfOVZz90hrECOL5LMaOMyt0UlQIAVkQyISaJFIHCeQwEzqKkC2f7
         DtdXBPEAqSJSfQFKKi4pLM0FZPqbiLyO7YW23/vdu0+6xQfwHB+AotyyClU+sq/ku+Z+
         hrKPe+ht5+gIK3giQ0v5mlYkK+lTpai8Fmff7tiMaCJOOIwCsEdArtHzRHnY5qRwCY/H
         M5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        fh=ueItlRInaMsRNXLYFB8hm9+8nYmJ7mabzgLZLaxhjyc=;
        b=nXgUeGUraDQwvINH0iAZrtkAxegLkEMJK9bDg0YyZ7Lg9PHh1LoBk9kWlm5cRFH7OY
         4NbTsGCYxskm414LgpMMSxR8gkQYRlVCLWvnYMvOCh0cKj6eomExM6bsO5xHY0L/V3iH
         aJP0jFoMLkSjqWiHTTeeEXw7xD8BKgS+QDLdRJBZZavltGpx2rbDRAHtSxBT2dyxlslK
         xXmwSKBWnPrTmzTMDIjMQEiUsr05bNxmvIFfyvpk77eeirnP99duugphnoNu/TIlQ6Wy
         zH9pZjYqUmBFu/hS2FeODTaiUVRhWdgS0VJJcMdRY6o9FmmA2GEGAbJrpYZdP1ApIl2i
         0i6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793550225; x=1794155025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        b=Aw6WD+I8+hGhGpmj37eOAbN7b01ftVLyy2dsNnP3vlYepvtos54zJz0Cq9RYmGeldx
         ajlOaK9cWG3FJBZInPM3tgEp5KZISklpvCoW087NSk0LbVU++Tb5HN9P1L9GWcs97Y+g
         pzqFdw+FVaHZHIWJvrWOjzJJnZw9G8WvY/Qek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550225; x=1794155025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        b=A/rfMr9R/5ATe9DDYBPbnlgZJWGZC0MWV0DYEadwA3XbdU/wN63PvVd++w2WTLk2W4
         wU/Z8wwpKz0ILiK5Kjr778K0SWcVLsefdZddM9/E3P7F5jrOVpzK5m9Nbg2ioIKJA/ZW
         8LTDWlNSvCkhxeQBedad/fgk/1PafPMEDn99awREZwzSZ0yfzxdpBQZ2B5rhHH3Oqfr/
         yIociZWuxDv9sEVreOyVu5RquITfRhMFVmOqm7sRNTsAIj2Ja7mvwa1MxJADvL2LcPwS
         Ty7l1rkgyCUyZ/mjfR/myUh+7Fh154NDyhtlq+ueH/wnnVcImwQTL1qCiCjOcjLD0GxL
         Jsyw==
X-Forwarded-Encrypted: i=1; AKwUvByB2GL8IOtBcO5zZuLOTODFxNnSNu0jium8/w0KEHIiWtQdRClXO5NOQ6I6t4lJGFIsIFKUUoVRsFKqDRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYImF8H+iqIC6KceF9qChTgwI3BDq0TGL2+WI+52pLzEt3iVl5TV
	00tWAAgt58ygJgxwcCy2GdA3XdDToJ/FObGKUS3zNVTPgq/sai32Vbe5NO3SCZ11qDJd6e1cX3g
	QXPr7LbAa9DsOqpxbix6P2kGk4/ej8vqEayoNl6eNwA==
X-Gm-Gg: AYBFou2BiNkmwqdgXjfSfuTSkohT7XGLihMO9ceOSb2UYzcEN0dBtiC3rcSpHpQ1Dng
	CxRfhtMD2SQ0BGl6ton64nw/nhwbq5zyyuNmsHxMGHYmR6uSybBv/husy5m8stigPZk2VNcLXSU
	/UKhtwRfF1j+DMZOgWf0MVc8zrxM3WjNIBVY39Uf9+QFtL/2odckXBMroWjFbKIGx8FTF1QWF+h
	ojXugoNKwjemZEbzNjU4GUmiZJVa3rlPosKmZ2yXKckpewGCroycXl3NjGY477xv5EljTNaJt74
	laG5ZByED2jrOKDoBU/cFWAEapMr6WvFEA/UUSdhQg1U1RhlmvwjzWfpTtLuDmK4wKDL1V4SemM
	XzLIMUJpsl2ZiH9tWLgHrvrsgtVWwkR9laj0/iixUlMugvdJPUwiAU7TQHbCa5gIpJVYEXm15qN
	mTp8ijGYuKjLOdMAKQNfnhortScg==
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id
 006d021491bc7-714f2480119mr4740296eaf.50.1793550225315; Sun, 01 Nov 2026
 08:23:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101144100.1043263-1-chris@miget.com>
In-Reply-To: <20261101144100.1043263-1-chris@miget.com>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 17:23:34 +0100
X-Gm-Features: AclHuK87kASEY1WffJQPQfxYIXO7Fza9xMyxIm6YyAKQG5rdvxp0M3XzA3a9A9s
Message-ID: <CAAcRvKOZMnZqPhTdktNm4RtxU02k4QFZGyOG0aXw654iU94Mmg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mingyou Chen <qby140326@gmail.com>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is now patch 4 of v3, please drop this one:
https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/

Thanks,
Chris


On Sun, Nov 1, 2026 at 3:41=E2=80=AFPM Chris Taraszka <chris@miget.com> wro=
te:
>
> On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> the firmware does not change SystemPerMode itself. The event is a
> request that the vendor software acts on; without that software Fn+K
> does nothing on Windows either, and on Linux it is currently logged as
> an unknown event.
>
> Add a quirk for this and call platform_profile_cycle() from the control
> device when the event arrives, so Fn+K cycles through the profiles that
> all platform profile handlers support. Models without the quirk keep
> ignoring the event.
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>     Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) on AC,
>     with Mingyou's v15 and my two TM2424 patches, loaded on v7.3: four Fn=
+K
>     presses step performance -> low-power -> balanced -> performance ->
>     low-power. The bitland and SoC Power Slider handlers and SystemPerMod=
e
>     (EC 0x68) follow each press within a second, and power-profiles-daemo=
n
>     picks up the change.
>
>     Depends on Mingyou Chen's v15 "Merge redmi-wmi into bitland-mifs-wmi"=
 [1]
>     and on my "platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support=
"
>     v2 [2].
>
>     [1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gma=
il.com/
>     [2] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.co=
m/
>
>  drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index a72569d810e3..8a994f5b089e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -99,6 +99,9 @@ struct bitland_mifs_quirks {
>
>         bool return_code_at_end;
>         bool skip_ac_type_check;
> +
> +       /* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to =
the OS */
> +       bool cycle_profile_on_key;
>  };
>
>  static const struct bitland_profile_entry default_profile_entries[] =3D =
{
> @@ -125,6 +128,7 @@ static const struct bitland_mifs_quirks tm2424_quirks=
 =3D {
>         .profile_entries =3D tm2424_profile_entries,
>         .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
>         .skip_ac_type_check =3D true,
> +       .cycle_profile_on_key =3D true,
>  };
>
>  static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> @@ -168,6 +172,7 @@ enum bitland_mifs_event_id {
>         WMI_EVENT_MIC_MUTE              =3D 33,
>         WMI_EVENT_RESERVED_23           =3D 34,
>         WMI_EVENT_OPEN_APP              =3D 35,
> +       WMI_EVENT_PERFORMANCE_CYCLE     =3D 40,
>  };
>
>  enum bitland_mifs_event_type {
> @@ -216,6 +221,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
>  enum bitland_notifier_actions {
>         BITLAND_NOTIFY_KBD_BRIGHTNESS,
>         BITLAND_NOTIFY_PLATFORM_PROFILE,
> +       BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
>         BITLAND_NOTIFY_HWMON,
>  };
>
> @@ -792,6 +798,10 @@ static int bitland_notifier_callback(struct notifier=
_block *nb,
>         case BITLAND_NOTIFY_PLATFORM_PROFILE:
>                 platform_profile_notify(data_ctx->pp_dev);
>                 break;
> +       case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> +               if (data_ctx->pp_dev)
> +                       platform_profile_cycle();
> +               break;
>         case BITLAND_NOTIFY_HWMON:
>                 fan_info =3D data;
>
> @@ -921,6 +931,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_de=
vice *wdev, u32 payload)
>  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>                                     const struct wmi_buffer *buffer)
>  {
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
>         const struct bitland_mifs_event *event =3D buffer->data;
>         struct bitland_fan_notify_data fan_data;
>         u8 brightness;
> @@ -949,6 +960,15 @@ static void bitland_mifs_wmi_notify(struct wmi_devic=
e *wdev,
>                                              NULL);
>                 return;
>
> +       case WMI_EVENT_PERFORMANCE_CYCLE:
> +               if (!data->quirks->cycle_profile_on_key)
> +                       break;
> +
> +               blocking_notifier_call_chain(&bitland_notifier_list,
> +                                            BITLAND_NOTIFY_PLATFORM_PROF=
ILE_CYCLE,
> +                                            NULL);
> +               return;
> +
>         /*
>          * The device has 3 fans (CPU, GPU, SYS),
>          * but there are only the CPU and GPU fan has events
>
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
> prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
> prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
> prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
> prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
> prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
> prerequisite-patch-id: 36137eee73ea8cee3db81af887f1f0859ef02b3a
> prerequisite-patch-id: f0ba644539dc52241b96a74d6e32a6f06241e577
> --
> 2.56.0
>
