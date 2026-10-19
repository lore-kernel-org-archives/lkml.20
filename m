Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792448928;
	b=m3++/zolauYlTjaNKywz1q0mEvAmKb0GpUuXNwQeK0c4eruHHV4Y5OGBiaRftMJdnqEG
	 ZkKJaFkXxdi/RiysBwe3w1l1P/sKzyAPACIsF7ugiiZwUNc7VysoBFc8VV/GhUqa5e2dR
	 gS3xjhjw7DLHB57xGGlaq8mHbKjgbEmd9ybBIc6Zdk1mI+1Vv+2GpqPtyEE09az8SIz0U
	 HQWE1R4T9rUM3u11lyyLJLN7kYhfU8idqTXi+LVTYUefPfzGowt4rrR0YBrrHpUJc8KLs
	 OJbTFeRYRnf8RH3pPt72ao+MjQqa5V6pwAQPVG+Uwp0dsQuMkxO1M+LcRXo4JmnKIPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
	b=vaw/1IfzRmY4cFmIv+IHz8XyusElk01g4wOVP4yO+/tEIO5IILnfTlNAk1QkB62y2Z1P
	 OTct3tw5Jc2UHNMlKvtEp2WM+QJyaErTCy33iIkxCveStnIevWfQJgKPJEy13B0lI5wcf
	 0RItoA5TTmHd1okHEFJN2XLc/+2TRZhSMbQZMgtITpj8+mTB3QKAwdcOWDKv/7SP+F7r3
	 mk2zdbRmryMW84HwS5/CohLndobRSmyKfFwNUFHD0+1u0qxob9txgEkJUq9pYtI0xoW4Q
	 ghuUy6+xkhzwADFfIXd335e9fQ/Vk0gYNKbxPZczeyHfAxwLBEcLoE6KOuAUsrv1htA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLsLfPea;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAEA606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAEA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bLsLfPea
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e6eb77f0bso246081885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792448926; cv=none;
        d=google.com; s=arc-20260327;
        b=b2UVoJNZnrqIpLxevcFIz34zNmOievfg+9o/WaImsClwdkAk4goZ+WJLo3qdHN1t7d
         lp0lpnGyMEHgFNjhIrSmeAXHpNWC8jpWcIDq+a6cPERf3KvM2DWc2PDEkxkOut1gqUX7
         20I197+viS8eYzZh0rHGbFNJPK8mdt3C/uL8jCzkf1w7sOKoqvhWktmczBAzBZfH3MSV
         KgM/FKR4QuhZFUkKGjkqnIsaW0+kUcaAtLLddXfubzuhtxObbW3pCgpuGthNofMeePj8
         xaW98U+L5HjNVhyBhoPezTKbEyiv6IpAX/5QNT8Mw8qf0iOqgUACzla352b2glCy9YFg
         SoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        fh=hVpuY7Rwf+jornAfYG7TeF74lDMxlTba4PGeqPOhz4g=;
        b=YUkn2D4lQ5vnrx6vkmSAmtcI4e1weKjGRMGzsd4GQUtbeK8eyeh5xhQ6LiOiIaWoKU
         LeubOmJwE/u/mjXLW5R6K7EhN1qwxpUV39xuIXYpTDhLvRQ9cnFRKY9FmGkTY0VxsqOz
         hBTrqWJ9QlkmfFd53BdVd8OyGNArvjG+CG0B8yK3NIPbSvu7u3mRkQCK8IQ8+s3y1PHp
         6318NITPiF+HoOhw+6wPSQNiMUEganUAV0FwkcMjPfsne0tJrPYWWN7PNHhi7Di0qsTb
         n6iA4aRYGAZQYX0kgOoXq0o6P5FGllPbNox3Dh8KEWwnncGyhobT/AZiZNR+csSuLJlO
         rFdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448926; x=1793053726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        b=bLsLfPead1YBpugKDncXbMsrTLn9dTtmjSo0xos0itd/nJBGk+LlloqOFHZeTetczU
         5GyBxW6/jpwTRxjJsR+uPGRgGdEPDHJSMPQmEtMG9nWPNjl2zpa/t1/bWdZ2oHllRWOP
         47mvAv9cC5IVhF5Sn8dKV/wqOKKROHpKx6JeUgCTbxFuIynK7XH5bNv5i9jWDJX9xOqq
         P6IzLL5ugvUrxWhrap66iKvGni7m1GwsxvhoXhenz5cI3hnmc2cl1dyNurDNCxDgIq8H
         uGiwKZWYnJISWuGDwYCIxVI1qoVCXTTR6nbl7a5v9WjeNlcG5Ims9HU6kirZTMPV+hjH
         agBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448926; x=1793053726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqScAEBcEdrO9olOPv0aI3RfvOhn0celPkhFlZwz1+0=;
        b=gAoJ7aQYo4NNlR8Vgq3CeQ6Ri2JGelX7I6x+uK80WMQFk4407hYx+USBc1pNhoLDk0
         46YHHDoYiLpwQzNCihmlz8hUDFXs8b6/fytFCQdN85SpKJCpT9ii7muHj1u1PKweQ1FH
         iddzTon9XC/oknKOYuqBZceExtGcSxWw3mROguOEKgro01ux8HYzQuJpbI0yZVKwGdky
         zpx7GLjVMcNlCe79+gid1o0vNfm3xoewS3MzeJSe7/CUWMYUYfSQLCvcfVvBnn0txnfz
         7s2kSkWRsQoZfe0kNLQv2u7m8chNC+dHX5bS5aQgrYExv/FiXM3sGQiQevTIjG+twl5c
         o+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzsZdz8YbGu6uf9brUH+gg8Sd39VeJjNe1+Q1uGYSRpdcDpu3ykZVKgRDWjiVe4l+EVXfjPAoEsCh50obI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnl4nMe0Oeg/zfYQ5ckRM1pOk8Ie1pFbuEGrGQD+C8a8hycK6J
	M5AUjebTju1fv9bVvBJ7CRsrsnP1hS1uFl19EKn2RcHtInuavHOO7YRmhGJ2FQL1mwxPWKR5fzH
	VydHSkSkJZk926k+YDETgYE1XfKgHACtmRDo9SwUX4Pwq
X-Gm-Gg: AYBFou2g08m/JL+lW86fEmhSKtQ+G6YaqxtzVI2h9EubZgxRL5JO6HLry3JSZIKBNga
	jQwV9ONpdqbk4qhMrRkE3F+9oxI52eRk1LnIeK/5eZWstPUH0Zy7v5I0CUJZ2C72A6OeEnQbRyO
	uQBD+VWYMJgcFu+tuoIdx18qB3dKqt0msIMoN2zRiImi3znWQEbWXMe6d2pT3DrCnhD9DGgUQD/
	u3YXZzmI7HNTUd6wuqRN5i83wFXxhrjBmVPp7e/S+YBuvH2H3/VWluN8aRJbGr/wMHnO3OaWh9o
	1uBCJQwSXnQZ3vtI1MY6ftgLw9ivTjZN3AeJrOZBh346BWlBHlCwPw==
X-Received: by 2002:a05:620a:2846:b0:93e:c06a:7313 with SMTP id
 af79cd13be357-93f29ceed11mr1539830885a.13.1792448925708; Mon, 19 Oct 2026
 15:28:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163029.107250-1-eugene.wolferz@gmail.com> <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
In-Reply-To: <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JLQvtC70YzRhNC10YDRhg==?= <eugene.wolferz@gmail.com>
Date: Tue, 20 Oct 2026 01:28:29 +0300
X-Gm-Features: AclHuK_Vge_qaXUbzdgGb83bqvr1qwk6GiBd2kqk00kHix-vmz9M_8oqYQVn-io
Message-ID: <CADQe2ZeEJEgE3AoXCtPNAvrggjJmG4WJh=O6++GS+ipRXaVgWQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on GU605MY
To: Denis Benato <denis.benato@linux.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026, Denis Benato wrote:

> I am thinking that a quirk with e5 in the name is a bit overly specific..=
.
>
> I am thinking that perhaps the best thing to do is just create a case 0xE=
5 that
> simply does the ignore with no quirks check and a nice comment outlining
> why it is done.

Hi Denis,

Thank you for the review!

I agree that a DMI-specific quirk is probably unnecessary here,
especially since the same event has been observed on other ASUS
models.

I initially tested a global KE_IGNORE entry for 0xE5 on my GU605MY
with a 7.2.7-based kernel, and it successfully stopped the repeated
display wakeups.

I also noticed the related patch series from Seyed Mohammad Mahdi
Hosseini, which proposes the same global KE_IGNORE approach:

https://lore.kernel.org/platform-driver-x86/cover.1791672579.git.i@smmh.dev=
/

Since my patch was submitted first, I would be happy to prepare a v2
using the global KE_IGNORE approach, incorporating your feedback.

Would you prefer that I submit a v2, or should we wait for Ilpo's
opinion on how to handle the overlapping submissions?

Best regards,
Evgeny


=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC, =D0=95=D0=B2=
=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9.
+7 (926) 607-70-19
https://t.me/mreugene


On Tue, 20 Oct 2026 at 01:12, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 10/15/26 18:30, Evgeny Volferts wrote:
> > The ASUS ROG Zephyrus G16 GU605MY periodically emits an
> > unrecognized WMI event (0xe5), approximately every 12 seconds.
> >
> > The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
> > input device. When the session is locked, it causes both the
> > internal display and an external monitor connected through a
> > Thunderbolt dock to wake up repeatedly.
> >
> > Add a DMI-specific quirk to suppress this event on the GU605MY
> > without affecting other ASUS notebook models.
> >
> > Ignoring the event was first verified on a 7.2.7-based OGC kernel.
> > The DMI-specific quirk was subsequently built against 7.2.8-ogc5
> > and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
> > the DMI match was confirmed and the unknown 0xe5 event messages
> > disappeared.
>
> Hi Evgeny,
>
> Thank you for your work!
>
> I am thinking that a quirk with e5 in the name is a bit overly specific..=
.
>
> That code has never been handled and is just the EC repeating some settin=
gs.
>
> I am thinking that perhaps the best thing to do is just create a case 0xE=
5 that
> simply does the ignore with no quirks check and a nice comment outlining
> why it is done.
>
> I don't see asus repurposing that for something else honestly so it shoul=
d
> be future-proof enough and will potentially avoid this to other models as
> well.
>
> On the other end it would be cool to know what that really is telling us.=
..
>
> If you don't come up with an answer I would defer to Ilpo whether preferr=
ing
> reducing quirks or keeping the symmetry within that key_filter function.
>
> I am fine either way.
>
> Best regards,
> Denis Benato
>
> > Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
> >  drivers/platform/x86/asus-wmi.h    |  1 +
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index aeb461b1644d..8d69231d25a0 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_k=
bd =3D {
> >       .key_wlan_event =3D ASUS_WMI_KEY_IGNORE,
> >  };
> >
> > +static struct quirk_entry quirk_asus_gu605my =3D {
> > +     .ignore_e5_wmi_event =3D true,
> > +};
> > +
> >  static struct quirk_entry quirk_asus_z13 =3D {
> >       .key_wlan_event =3D ASUS_WMI_KEY_ARMOURY,
> >       .tablet_switch_mode =3D asus_wmi_kbd_dock_devid,
> > @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] =
=3D {
> >               },
> >               .driver_data =3D &quirk_asus_z13,
> >       },
> > +     {
> > +             .callback =3D dmi_matched,
> > +             .ident =3D "ASUS ROG Zephyrus G16 GU605MY",
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU6=
05MY_GU605MY"),
> > +             },
> > +             .driver_data =3D &quirk_asus_gu605my,
> > +     },
> >       {},
> >  };
> >
> > @@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi=
_driver *asus_wmi, int *code,
> >               if (quirks->key_wlan_event)
> >                       *code =3D quirks->key_wlan_event;
> >               break;
> > +     case 0xE5:
> > +             if (quirks->ignore_e5_wmi_event)
> > +                     *code =3D ASUS_WMI_KEY_IGNORE;
> > +             break;
> >       }
> >  }
> >
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asu=
s-wmi.h
> > index 5cd4392b964e..e7772397cd10 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -41,6 +41,7 @@ struct quirk_entry {
> >       bool wmi_force_als_set;
> >       bool wmi_ignore_fan;
> >       bool filter_i8042_e1_extended_codes;
> > +     bool ignore_e5_wmi_event;
> >       int key_wlan_event;
> >       enum asus_wmi_tablet_switch_mode tablet_switch_mode;
> >       int wapf;
