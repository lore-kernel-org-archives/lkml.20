Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487536;
	b=eZCbQF+zTCRIqWaTy0hTgTGkUgccodslNivPB4wDnFO3faG9RhSa81MNn1SFXXCQOfSw
	 algyhGnqo93VUJCS6C9Qq/I4LPVga7DSW0pfVhSwLYLOYNofXsm6a8OubQyEwKdSFJDuA
	 kbIFTq4VnMIq4kn4Pe3iDBE0M/v978Yp3yJ1WJJHmIDkEdESWK4SWEIdDzw3GIXvRITcW
	 0o9zeKO8ixtRIIgsPpZINf4PYAUNWiCjIAWa6/GS8GEg7B7sovt9DlN1FNUZcCSeqNsPk
	 uMvovCCfkbvOhyjCht2KoPd8YpiQPDWh3O7kggBb5/W3SSRHvqKLOUb/UYMWJyqtJyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
	b=gKwe14z5PFecGNNQ0hW3BTDAkMo0+KwV46btlQFKABYbORNjSkwSvob1k5rnOg0MHg5q
	 ePUNsPuvjNrtQhyGIKkoMC+udIYz8EdyVq9heXnuO9SJWGo9BOpB8bxLgeULE0OK/zXxz
	 jFuEX+/63eY04EmFOS9ILotK1Q06XaYRXmHM7mGt3igH1LQNjjzzxafZrGg32zNKhuPer
	 xy5cD8vmpEiPevAfT0Pc/J3LIlvJrwOW8Y/5y0++7Ou/uODsDbfqcAMldFIqyKcd0lQHc
	 /kNfwlcwW7da9SsZTtcbd4VJ1PFRtXsfuhTgVBt1k5JhZCQWHgmpAprLksGtUXiHzgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZsRXa0+6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8AC606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8AC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZsRXa0+6
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso1597516a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487535; cv=none;
        d=google.com; s=arc-20260327;
        b=lQk6EqEnVqI4w3K2ix8DBiYnx17GkUo9o3k5a0ATTx0zzjLIQErUfJ/wjfo9qwUKZk
         2uyL/a8THBodxvUcOPfMnexud/wG3EJ/VG5rEcoJsxG8fXfBsPaOK/5cjkeGh2B9BBI8
         YwM86DvYXIpqK4PUMVYUCC8GH4G9M64MGO1w8lPe/FXqbpB/xyaZXdbwn43Wke79KAYg
         /BNW4OlbFwmK05brDP2qLcaHn2DjkVV4zboJPjS/9OVj13X+wBPkS9GkIIxrkx4h++cc
         YKvzZNIrIpCZgQ6b9TARH8nnywJ2jvCqnquiZqlDjYvxDxU2c9aKHmLNqJPM4RL8SRA0
         zW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        fh=x5rXuZFZ/YrF01ggZRGRWzXTbZ3GZPWNlMQxDDhrqV4=;
        b=nCs4cybVQm4DDOAY0V5PwtA00c8acXb4BedA3fNgsvujRPraiydzUuVL6wZmsW1Z8o
         646N/jyqMKfk01mDjLMC/mX4VVPCGz4UP+VcArILh9oz/W3o5v0lAB5kfjrOLYlPOVRb
         +topyQZJt/2dd9Lq6nWdRJHJqmxa3NPjQbYsGYKXGxOmxdx4NjmKIW/wHSTeRkHtm6jU
         pUf6NCsCUsAyU/L2xvaZlhcCkONObm3WYdA/SOdgqt6XklZL3YbChLhF/XMrPyvI6Pko
         TbDQMRr9TtWYRAMN/Du+F4sa4yOF8h+Sg5uWpTiiJDjj8gv2GlJwJDIEta2QbGK4yH01
         zH3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792487535; x=1793092335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        b=ZsRXa0+6dbVKgG5/etguOrVmxcI/WCNhTDK4HYd/ZIRR1bxGAyYKvpa4e24cRAukK+
         MyuwL+FxJhbbink5wHOtMTFqSCBJ3pqMf3goCGj1z0hyb79mHh6kgYLzmu/OTEnIeI2R
         sJTOr0+SYICiGbL1jrbz1g+L6lwwGqsIgtIIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487535; x=1793092335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0miwbCIaCKh5q7AF0F/HV/CbvqoWL0JqaAGadHmiHg=;
        b=DX1jPWO/WnQz+/xCN5lBE8VwFUstz+LSXyDfxCQqM5NoisQqGDeBYLEFSNgQH4Quox
         G8Wm3PO+Oz7qb08DKxwi+iJd8vBoJ4toPQKgQb+P4Cjcf4g74fSFEGVSigXvnpLidQId
         0W19fzUsIof5SesiOlfwV7qh2H3CDVQBmrcbqSza596JSSxNACiS7AdtjA33sY/HDoB/
         Ab9dDw52trTXemDQ/2HNd4o9XIsBH9WMR6FOCBC9cjJuOoTi405y40b04Ke6bzjFKPlR
         TwYeZrPVXLqUrckPv7m0S0yK0BbKTAFVwe8OU4/8z+N7kFOMSQ75JbltTDLFi8fzTqa1
         oPVA==
X-Forwarded-Encrypted: i=1; AKwUvBwFd0j18kBYhEzPkJJUONkhbopqVLaL+p0v3Zw07no6NQ2PcqBfZ1h2fSJknUzUt+irJZXsAomQqdOX9q0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu+IMwZMtA9zEl4rzcj6oiJEScKDkaKpAn/jEUEbzqNEGmxRJT
	21FDazfMQCfudJaVSDlj8Q8Gru17Q07CEqjxdWZ8Zv8Y42leI8sclv6VxZe9mvLHP6HVGgdyILh
	yXv9pZIMHiSj51J6zsuAd2DfaohQflXgK7HVVbRVh
X-Gm-Gg: AYBFou11R3SWJNLwc/0pTaDfn5O7NeL6o/Z0iu5hDvBZ2iIn6nbwy1eFfRBYEShWMQw
	ytsNaRWqQCsuLwe4iikxwh1pxFUwRcJSVwB0ROHllcbaFKAWirCMoVMBjUFhQdrvyOBfSe623Hj
	5ONmgcj+eNQg/wFcpZ8ZPxF3O6+sby+JrW00FkLbUprIKfIto03DQk6PI6osgjh+4mRHTfVbyG0
	dRxxUO9p805EhlBy6ufmnT+ScOmJZdC+uMK9GaFOHjchw/EE/c5vZctlx4OZVQxkjLzD00r5/ZI
	GHxv3flKqzBOx3ViO5wDqjIDTQ+9XxJx53nh1x9a9eWVttapKM0FoFQC66VH0EszGHzJEsz/OSS
	AsIZubKc+EQjPfzP0scGGwOp69QLCr7+hotO2Y7zk8jBvhG7dkWl3/Jh0m9Ki0xELKXqKm/uCc4
	btC0gUgoHGqKImpkTt
X-Received: by 2002:a17:90a:e7ca:b0:3a0:a912:e759 with SMTP id
 98e67ed59e1d1-3acef13520emr9447751a91.25.1792487535269; Tue, 20 Oct 2026
 02:12:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-2-akuchynski@chromium.org> <atDD1RHZylPRZtP8@google.com>
In-Reply-To: <atDD1RHZylPRZtP8@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 11:12:03 +0200
X-Gm-Features: AclHuK9IYpMzXWdPe6Jo19INJMjEcYp-ZRO8wDzzMHxFoGJh5R845Ed5okhpKjk
Message-ID: <CAMMMRMd6qd7-kBEOs8L2f4u_Pd9WbDc0dwM1MD2mrKTN9CzPEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:15=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Oct 08, 2026 at 01:40:55PM +0000, Andrei Kuchynski wrote:
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> ...
> > +/* Delay between mode entry/exit attempts, ms */
> > +static const unsigned int mode_selection_delay =3D 1000;
> > +/* Timeout for a mode entry attempt, ms */
> > +static const unsigned int mode_selection_timeout =3D 4000;
>
> Couldn't they be macros?

It is implemented as variables in cros_ec_ucsi.c, but they could be macros.
I will change this in v3.

>
> > @@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> >               memset(&desc, 0, sizeof(desc));
> >               desc.svid =3D USB_TYPEC_TBT_SID;
> >               desc.mode =3D TBT_MODE;
> > -             desc.inactive =3D true;
>
> Why this is removed?  Per 1aede0698167 ("platform/chrome: cros_ec_typec:
> Disable tbt on port"), it disables entering TBT mode automatically.

If the ap_driven_altmode parameter is enabled, automatic activation of
both TBT and DP will be disabled via the mode_selection field. Consequently=
,
deactivating TBT via the inactive field is no longer necessary.
Alternative mode drivers within cros_ec_typec are no longer needed to
trigger activation.

>
> > @@ -940,6 +952,31 @@ static int cros_typec_register_altmodes(struct cro=
s_typec_data *typec, int port_
> >               goto err_cleanup;
> >       }
> >
> > +     /* Once all partner alt-modes are added, we should also trigger
> > +      * mode selection.
> > +      */
>
> For multiple line comments:
>
>     /*
>      * Once ...
>

Thanks, I will fix the comment formatting.

> > +     if (is_partner && typec->ap_driven_altmode) {
> > +             bool usb4_mode =3D (port->caps.usb_capability & USB_CAPAB=
ILITY_USB4) &&
> > +                     (PD_VDO_UFP_DEVCAP(port->p_identity.vdo[0]) & DEV=
_USB4_CAPABLE);
> > +
> > +             if (usb4_mode) {
> > +                     ret =3D cros_typec_enter_usb_mode(port->port, USB=
_MODE_USB4);
> > +                     if (ret < 0) {
> > +                             usb4_mode =3D false;
> > +                             dev_err(typec->dev,
> > +                                     "Unable to activate USB4 mode, po=
rt: %d\n", port_num);
> > +                     }
> > +             }
> > +             if (!usb4_mode) {
> > +                     ret =3D typec_mode_selection_start(port->partner,
> > +                                                      mode_selection_d=
elay,
> > +                                                      mode_selection_t=
imeout);
> > +                     if (ret < 0)
> > +                             dev_err(typec->dev,
> > +                                     "Unable to run mode selection, po=
rt: %d\n", port_num);
>
> Wouldn't it need to go to err_cleanup and return the ret?  Or, if they
> aren't considered as errors, dev_warn().

dev_warn() then. We definitely don't need an error path here.

>
> > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/pla=
tform/chrome/cros_typec_altmode.c
> > index 66c546bf89b53..116329dd113f8 100644
> > --- a/drivers/platform/chrome/cros_typec_altmode.c
> > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > @@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_str=
uct *work)
> >  {
> >       struct cros_typec_altmode_data *data =3D
> >               container_of(work, struct cros_typec_altmode_data, work);
> > +     int ret;
> >
> >       mutex_lock(&data->lock);
> >
> > -     if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> > -                           data->vdo_size))
> > +     ret =3D typec_altmode_vdm(data->alt, data->header, data->vdo_data=
,
> > +                             data->vdo_size);
> > +     if (ret) {
> >               dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->heade=
r);
> > +             typec_altmode_state_update(data->port->partner, data->sid=
, ret);
> > +     }
>
> Wouldn't it need to update the state even if !ret?

No. The typec_altmode_state_update() reports whether the activation of
altmode has been completed or has failed.
If successful, typec_altmode_state_update() will be called from within
cros_typec_configure_mux().

Thanks,
Andrei
