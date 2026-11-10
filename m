Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794328393;
	b=223xhXWiSSi3yuhQt7tBVlS9osUmQ8y3dsCgiJL9k5e1JAfEkGEjBu+I+6XBPa/mqPei
	 eMgTGLY8q2KlK5ub0DUveMkK/bT34jRHh71WMb/CILEzQY4DelKyyO5SsIpkm5PWIUIda
	 o9GTGi4cAe2hJo5clwm3HGmnTxMsp2tT62Gz2o75rzbT/hmmPo++Io0Y7zae1hLieadmm
	 2Jrub3iadT4lgMLFuRKsrG5ZK2hqKyrJnuIS9rI5PoJRyaybOeZ8esgDSesyncurlqnLJ
	 wtzZgkwTynd45MB6ojX1weSo8GsQQqyZlT2AcxY0/fhGY/jNS6wgrLGeDz5gikHy3fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
	b=jUQpZrYcbMzp5bI8TbUYeJRctVdvCGBpAVEYqpYtP+khjE/M01StUPJpfCGoXD6Q/h+i
	 1/VBUHTbxS9Di04oibtj870IsfEh/FHP1lyJAdCJBqlIn87oh7stPIUql4M56kIS8q8qh
	 /UXCzljHQcmHABtDeN249bn0S5Ip9n1SAdIkyVczJ5SQ2Bgf4fOLgc7mrV5ywBcaa5+5i
	 954Srme9jHrEVYhbFDJ2vbuHXZlqP61hpLKbBMHURd6ghAv30HIYlpyaOS9WYe4GRz45s
	 7yu+GY+6i+gDW/MI+c/N8D3eLpEmTmWu6USEn2o6DGlgbRI4jdr02u9Gknh5zqsRJOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=gM7oiizs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039CC606A204
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039CC606A204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=gM7oiizs
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f84a55cc06so1303041a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794328391; cv=none;
        d=google.com; s=arc-20260327;
        b=hpdAfQuf0OtTF4r4nH3HAdfr3Nmq90MllqPbpKl2jJ+GzgmoDUTBoNbVHM0ovJCFkR
         xpY4r6IlsKBEeULOOYozAUUOTOkuH0zoy5gPS3eNHbuKh7w0sjL0SYr0Fw3LSSxh1iMx
         wdYJgXl/tjFO3VLbZiGTWpuAQ4/8/4f/rSN0dj+7vz1QlDQU48zweukkWA3xvPuC9+nA
         dsKnS83ikFYv2EALXUWTdf6THi1ih2hJi2Wk5vyAp9NGC1woxXG10aTaGWAngGL2ak80
         0pgTSvxP8UgfIvLvvpT3WujUD/6NBow3lbqlIVKG+Db5b7thip/V+2rSCHLA2K4cRI3r
         51lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        fh=/+3xjAW2a4F41kyk9UPwa/e/pRSJ+5LMDhloRcIPaA4=;
        b=alo/VupwXElqdOt8D6dfMcDwl09YhwVsEGoAG8IVgLdR6oLxFkhSy0Ya+X3Fe24ZIt
         dSrBwp9I6MgLXL+n3YPDvmKgjuBI0wi5R9CMm/qEb9+a+OowORBWcMnCIM7rvKYDoe98
         nRcfYU2phkqEPS/GCrlaQMXFBMsWiRnuob7XKRwSspaxeeRUadektvqEbwXkogVwGX1k
         Kjxc4eblEuAqPJQczanMfDSFdBXKUfEDukClZ51Q2SvmHZBwaksYG+UpZapcX/9SOvzm
         zHdGjXDEMcUfGQkAg3AoDmSM11cr1s+95DEZ3WaB7akn9vdxeZnHPR5c7du13IW09LoA
         EU4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794328391; x=1794933191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        b=gM7oiizs1Y/eHxO9y2LzImxy+byQm3osR5kRdqeM6jplZ3ADuh/iqdwr+0GWZ2K7SL
         ej7aFo4wTYwixvNkLRa+8VYo00iXcwfz4aPhix+7cT18J9l+u+XZnBcHinV4FyVYakj1
         qnHf94iwwHC/qZlmTQJ8wrzRFbjg5oc6nTeFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328391; x=1794933191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        b=Ki65zojZ6FoR9tXkKAkQBrMeNa6sB6wNR94oHA/8vs0RFnjx5WDfVD72Mvk8Ac52pj
         c6I8k2y4B7Zf5v5z9GJfRLA87uuKPTmgxtqQuGnkvTpVPzQ4qNLfPj4pwiERLO6znvLk
         bxZv0oARLdbH0M9R70wNkLmSjwbcFGzgA1vFGT3wtHQ3h6xX+k0g3URgkfXgt4Va7m0F
         Cc5Jb/iMemO7w1PGaQEPy07SbhJR/2NS4Be3Or2mxbkKxW94dpOgreb6NjePK4scUN69
         i17EHnPRze7GIr+nYXz1F+OJSJC0cECeBjUGPNWVE3NDb3zdwV4zYain4v4I9Gdkjihx
         NGeg==
X-Forwarded-Encrypted: i=1; AL+hErHcUgJpu8XPOjoj81fUJP7iUUEICyuOhrFYOuaIgRoeTjJNKNgUtbnMfvipm/ARtnU+h4wz+dhR/aL6jIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y7/rShBWE3lpxkcn/F8f2vtyOW5mhqMPMaiQxgPKj4dvq1cSQ
	rk8rGA+NmD98UDS1HragRPlwVYYelHkdrxK+LNNvMJtOGP5dHrXnxmG2gRtrakap1hu8pJMNTft
	feAVLSBhMWoZw3VyqlJF5RqcUwdJlTPg4E+agioS+Lw==
X-Gm-Gg: AYBFou1B6E4lQ+Cyvz7RrIL244pGwG6VCEha2srUT7nBdRSCjO7xiwKVRuEtwhBQqTr
	9rRlLl+fzfXS2DLvMFqJvHv5wzZndEcSZ35xVC7P++CLw3E6pnhvqPMBcfp4QNK72iqMldAmZTb
	9hb+vcWvchIAyAfORfrLAhCHPwdEM2+UODhXVa97NZ1dPWI8lxW12cHW+C/CfJsnCqEPrn3qYyQ
	zpjDF5znawpAiv/Uaaeva79CEJU6vf/0XjwF/kJxQVdRJQvv8/r62vjmRdZA2foQh3bNV37tg8J
	JLDwVFzMRaIrikOUixpWrlR/sHCqrsA/h5QTZYe8t5HB8OueK+cOFwjwKix0i7RI8DztGFdKLhS
	J5+Eboi8S5giksmSZDhj6povtJbOxpF7KguppBevxR2Nmuq+tuPackmPScbSYh7yak+/ER9VDoc
	d1LnzmdtKkgWsgaQ5LCmmMiu2Xans=
X-Received: by 2002:a05:6808:124d:b0:4b9:a829:f015 with SMTP id
 5614622812f47-5683cc4629fmr2122822b6e.33.1794328390808; Tue, 10 Nov 2026
 08:33:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106114300.936782-1-chris@miget.com> <20261106114300.936782-5-chris@miget.com>
 <7e925ef8-7cdd-4e16-8761-dbceea94826f@gmail.com>
In-Reply-To: <7e925ef8-7cdd-4e16-8761-dbceea94826f@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Tue, 10 Nov 2026 17:32:57 +0100
X-Gm-Features: AclHuK-uCOw37m1lP8LAlTd9DiIEMIt7OUjsd4bZo0FVIGHft-PwaDPipOW28c4
Message-ID: <CAAcRvKPYjUoGxHPeKTc7qRKZmHMC8KT7a8DE117_qUO+O2suoA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>, Arsenova <7z0423arsenova@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Nov 2026, Mingyou Chen wrote:
> Does this quirk entry really necessary?
>
> Since only supported hardware sends 0x28. And 0x28 is not used for other
> proposes.

No, I'll drop it in v5 and cycle on 0x28 for every model, so the TM2424
patch stays as it is and keeps your Reviewed-by. Retested without the
flag on v7.4-rc1, on battery: three Fn+K presses from low-power set
0x09, 0x03 and 0x02, each followed by a single 0x16.

I'll send v5 on top of your next version of the merge series, or on
v15 if it stays.

Thanks,
Chris


On Fri, Nov 6, 2026 at 2:19=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
>
> On 11/6/26 19:43, Chris Taraszka wrote:
> > On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> > the firmware does not change SystemPerMode itself. The event is a
> > request that the vendor software acts on; without that software Fn+K
> > does nothing on Windows either, and on Linux it is currently logged as
> > an unknown event.
> >
> > Add a quirk for this and call platform_profile_cycle() from the control
> > device when the event arrives, so Fn+K cycles through the profiles that
> > all platform profile handlers support. Models without the quirk keep
> > ignoring the event.
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >      Unchanged since v3.
> >
> >   drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index 4d02cd9e8a6b..84d1223d0ec6 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
> >
> >       bool return_code_at_end;
> >       bool skip_ac_type_check;
> > +
> > +     /* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to =
the OS */
> > +     bool cycle_profile_on_key;
>
> Does this quirk entry really necessary?
>
> Since only supported hardware sends 0x28. And 0x28 is not used for other
> proposes.
>
> >   };
> >
> >   static const struct bitland_profile_entry default_profile_entries[] =
=3D {
> > @@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quir=
ks =3D {
> >       .profile_entries =3D tm2424_profile_entries,
> >       .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
> >       .skip_ac_type_check =3D true,
> > +     .cycle_profile_on_key =3D true,
> >   };
> >
> >   static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > @@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
> >       WMI_EVENT_MIC_MUTE              =3D 33,
> >       WMI_EVENT_RESERVED_23           =3D 34,
> >       WMI_EVENT_OPEN_APP              =3D 35,
> > +     WMI_EVENT_PERFORMANCE_CYCLE     =3D 40,
> >   };
> >
> >   enum bitland_mifs_event_type {
> > @@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list=
);
> >   enum bitland_notifier_actions {
> >       BITLAND_NOTIFY_KBD_BRIGHTNESS,
> >       BITLAND_NOTIFY_PLATFORM_PROFILE,
> > +     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
> >       BITLAND_NOTIFY_HWMON,
> >   };
> >
> > @@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifi=
er_block *nb,
> >       case BITLAND_NOTIFY_PLATFORM_PROFILE:
> >               platform_profile_notify(data_ctx->pp_dev);
> >               break;
> > +     case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> > +             if (data_ctx->pp_dev)
> > +                     platform_profile_cycle();
> > +             break;
> >       case BITLAND_NOTIFY_HWMON:
> >               fan_info =3D data;
> >
> > @@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wm=
i_device *wdev, u32 payload)
> >   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> >                                   const struct wmi_buffer *buffer)
> >   {
> > +     struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
> >       const struct bitland_mifs_event *event =3D buffer->data;
> >       struct bitland_fan_notify_data fan_data;
> >       u8 brightness;
> > @@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_d=
evice *wdev,
> >                                            NULL);
> >               return;
> >
> > +     case WMI_EVENT_PERFORMANCE_CYCLE:
> > +             if (!data->quirks->cycle_profile_on_key)
> > +                     break;
> > +
> > +             blocking_notifier_call_chain(&bitland_notifier_list,
> > +                                          BITLAND_NOTIFY_PLATFORM_PROF=
ILE_CYCLE,
> > +                                          NULL);
> > +             return;
> > +
> >       /*
> >        * The device has 3 fans (CPU, GPU, SYS),
> >        * but there are only the CPU and GPU fan has events
