Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963934;
	b=kOFmvrQw+VvVp5GahSjSIFUFmSWQ0QkSo0uqZJsMRpg4nM+muV7nUNEQcEHRg9HMoMX/
	 4sfd+ZbXUW3T0E2+GQ26npr1XBB5ML0UTj9BycqN3+EEbEtoC28rPOrGfwRBp3v4ml1C0
	 nX1jWlRKNPhxlavGzqjr8zjRgX6E+WSQDs8tpTEGSBcoSzzbrSAPSvIOsvdujuSw2HAPL
	 pnzW0wM6VmkV7Zj54jBvGQaTVzFwEitCtEsijJS6BleF/WJ/bVaTroFPOM+hyZhppOShu
	 g94qgtIfLtgyfdMImFzeafq1HH8or4jL+m4oyb/yBsMYuwa/eo0fu5OsGD4TBvteGsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
	b=ddkxYn+0WoZjakBOuyOkg1mGB5MLuXp55BnFUKJqk7FQ+9p/DrA8ITATgodkei18C/ca
	 +xxjOzghGuKG8U/tguK9A3Cxe6cyH3ImlffhcYlkzMAj58AQnviSOrPHpB89p92wOVvjS
	 xrxCMf+jVtS3JdzoWDeSNS5BtPw52d1SHdUs0GLljIjZEYrk6por6zO8IeOVH3gIJwyg5
	 PgKtA5D7GmqnKTJFEmzPu25tVP9ROUZxytItKNj6N79oOqDbIirRQprSswBRPR9uIf7Bf
	 IdMJTTA68uLUeNaOJH1ip27nahIK3SWhyDgLdcKabZptB9cVKNlD4Qgd4vlTy41U3Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=O5GvNw7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F5606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE0F5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=O5GvNw7p
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso211432eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963932; cv=none;
        d=google.com; s=arc-20260327;
        b=a5bpNTHeRNBcxJ+srYjtZO/bFmGniP4ney90fufkEUvKydioKWMLbBgOE0r7QFBvZ3
         0dh4gkGOO5zJVdgO0kfvjF/6NwOHzME7XMgTAxW2oSzmGeiutCGPxDTwlE/Pwvnjq9Js
         hXmRdqTY94Cqxxxu29aiKntwbM9jCvvdgClkyEfLAxHNTU/E/dedUZ3hki+UgQxvZOQ4
         jNExoIIgkbrQ2TUO344IUHuVZp3DUH5NbsWtKhKQfB6aTRi+WJzev2Ze7O78/oAYvS3P
         8JRzvchb3bkW+/qxHOaj8zK1bthqr+HU2Uhu1BH899f4gzsD88FSRzmZbxZq8Z4RFIbZ
         9VBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        fh=xHBKKrDU6zcFa31Extr35XEPFZkHsceTVwcLfJWUO4Y=;
        b=dJyiQYcthzVSu5+1XrpdXIf1lGdl+k6/MXQnYitm4bK2Amn0L5rsFFIqyxWHJl3kEY
         SxTrGD7WkPhucCYqK5vlsFQa2+MWa6xJbAuMPcm43J5J7wARxyPwINENX8tm7YgoYBYO
         CXmeqciWA/8vJVeL8SC8W2sFEODF/fycRXoxmoNHD6CvkIZMDdXmMtCELDnkgiIy0HaF
         zOv7HThUaVJRCHFkqo+iNcp0zP42dHiDweFXYtBDi3c58fHjGU5y+o8wty6mD7bIqtoC
         nBGwC1gKkfMzQjZ5dmO0BB0XDNoaGi73ZyMRO5sfVyzgkzKsi1gUJSZbEAOrYMr+1gp4
         jLXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793963932; x=1794568732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        b=O5GvNw7pGEtidqI4/3jGNA2bgcr2xLuj9SKry0LIXD/lxuKa7X4kQzIZ7iobRHnYsv
         Mr7v0g1QO8JUbm3RQTiSNpbvPqm1cM59zuUrP8NsJJDtHkuG4OZw7HgArVY5I0DkHY1S
         dTV6mKCfFNhuSYjmKhV9jlnzOE7igr83SG0rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963932; x=1794568732;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCiiK4kYulPJyLW4OAcXTNQWLZn928rt9Ez3MCOozdI=;
        b=rsvP4BOawnRXELTMT8HBKBlHVQgdHk2n0GZ4jlX8k6R4Rh3ii+QLc+1XwIVicT6AmS
         msyYAYahYsG3EGCfDJa7l+WkvjTgmBsX9iYqIyn7wihvP9Hxs6gLR8JTGbnsEBo+x6Rn
         15o5T0jt6iwEYtAAhsGEwLEttx3TDnlg6MrAI5qMslBfvGjLnWHDDc62bLn1bz+IWobF
         To+cD7Y5v5guuJu21UtItMyORFgOWefaSL8Kal34O2xOaxop6a3vHXCMrGwu9oYb8YMx
         2t1uR8r7smwaCX1am2OnBy4/NNxWcsiFdyaA9B8MfDTEGSarvkX3uczWMLsLW05XXpFK
         cxIA==
X-Forwarded-Encrypted: i=1; AKwUvBy0egtWwANgfU6k4xs/k6tDKw9NNdCfXymkXO1s9Vz5umlchalse2dBAZtGxbV/MO5akJTsbZwmtQRS5DA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eovqszLt3P9hw8+khjud4xqLLgGbVeEgA9ZSDmZnWyukcx41S
	rRdZ+0UPDADAgUkR2V/8Nk4eb98CI0Rfl+kxnQcic93n3rfROVx2mBofDYiS2MemJAKUldDYTXs
	jeVqIQbEVIEr6/hNl3o6xLPszspV3+VO4vgqa4O/CrA==
X-Gm-Gg: AYBFou11PlyhwSOWwbSj6F4grOLvDkW+xqZ5Fa3uI3vZ4GSVznc5cXbK5yi4+OMn1It
	fvBJ0dOSeCFhG56lNzghTwJy6Bfi1rfLKRQgxCdvVbD0jxIW+hV4+Ks8DT4SklxkNNJRGlmNsPZ
	564ooRtpbBcdCgbC4z9sM2miZSj1gzNDze0twRduSeX+bWX2d+HBhIGdUXmuG0w86t40FLbiTPD
	JyKHpCCsQSFrfu0uRgeFmlBx81vWmxWxpuqqZVNCQyFJ0ujbLgCSnTuWqb+LAXBLhn5oWRER4FC
	+2IIMtg0InOnu4agnvGeEgIlJygRdJYljtrsibpTbJ7+wfB7lx7c4oMl61uIDQ1zrznzmIC8s7k
	jh95Qmmk6Cb34Dv2SfJVscplJw9YcAl0VxubUtYeopZyI5dsuCldee3cPmJN8ECx19kS/3w==
X-Received: by 2002:a05:6820:162a:b0:6e5:5dc5:14e8 with SMTP id
 006d021491bc7-716e7a0cbb0mr1273240eaf.86.1793963932480; Fri, 06 Nov 2026
 03:18:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101161814.1325847-1-chris@miget.com> <20261101161814.1325847-5-chris@miget.com>
 <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
In-Reply-To: <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Fri, 6 Nov 2026 12:18:37 +0100
X-Gm-Features: AclHuK8qOOWqzLCcOSAiZKiOMHPnlf6cEbowk6SmPxaLD2mqq7aAre5KeUZr4ao
Message-ID: <CAAcRvKO-Qv=rUQbK6Kv6cEu3WasP20EfrHm1k6aPQARK=wVfNA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>, 7z0423arsenova <7z0423arsenova@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026, Mingyou Chen wrote:
> How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report
> this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).

0x16 reports a mode change rather than asking for one. On TM2135 the
firmware cycles the mode itself on Fn+K and then sends 0x16 with the
new value [1]. TM2424 sends it after every SET as well, within 10 ms:

  SET 0x09 -> 0x16 value 0x09
  SET 0x03 -> 0x16 value 0x03
  SET 0x02 -> 0x16 value 0x02

Cycling on 0x16 would step twice per Fn+K press on TM2135, and on any
of these machines it would loop, since each step does a SET that sends
another 0x16. v15 already handles it with platform_profile_notify().
0x28 is different: TM2424 sends it on Fn+K and leaves the mode alone.

[1] https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKy=
ZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proton.=
me/

Thanks,
Chris


On Mon, Nov 2, 2026 at 12:10=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> =
wrote:
>
> On 11/2/26 00:18, Chris Taraszka wrote:
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
> >      Sent on its own earlier today [1]. It is now part of the series si=
nce
> >      it changes the TM2424 quirks entry from patch 1. Retested with v3:=
 three
> >      Fn+K presses from balanced step performance (0x04) -> low-power (0=
x02)
> >      -> balanced (0x09).
> >
> >      [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@mig=
et.com/
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
>
> How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report
> this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).
>
> https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZa=
hijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proton.me=
/
>
> >       /*
> >        * The device has 3 fans (CPU, GPU, SYS),
> >        * but there are only the CPU and GPU fan has events
