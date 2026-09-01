Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7D47DF8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279863; cv=pass; b=FzD/vOS+wrJBmQ4y2Pf4IExUCB+43sS3l4HTNr5SjOBTLGl/J9ILTg1xlDRdQBP5erldJNzq8kPOVRTmNvx4gvrCnNPnM2ZTamRzpJxWKENn4qvjoCz7l4poits5k7mV2A8pbjfJeWjUlCrn57qDjO3jWndk8GlNpehOr2zLbM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279863; c=relaxed/simple;
	bh=fihGLTO3wxvRn1HVgRAq5GXUuflx3ZDlmZRCApsNctc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2JC9IreMWIJTcmNbzvqvt8ktJSaZUBHXPKM8QjFWj2iYlMWknHjDUEkeNZ17emmWH14FJf/tXczHqw6FK6ybuBcJene06BqpEhssAXOej+xvhnBmcSIvkc9UP9OhyPwWQ+VrrZcwWYK7f3q741OrU+aIQLd8/VmSpExmyRGz/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGBTAzoC; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGBTAzoC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so2118742a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788279859; cv=none;
        d=google.com; s=arc-20260327;
        b=OdHZ9R79knhjFcBiAipZKuQFs0jNI31igqDHnAVVDm4Cd+VEznSMth+KJh6plVtAp/
         dZIbn7lhlKgYNes6hglH0gPrt5YzU3N4qq3O8BocWv1IpwitQF1kfUrRFRbw6vybM4mp
         0zXGJROCS/N7uGkCO3Lrmhk7W+S4jJmbM9aRrOzznQGOAxLqA8iKXo6XsiD+ZMVnO83D
         giHRDXDJ6QZdTRhhAwVeT9yrsV5tKGNpv+UzXsUSUVnAaW2gpS759Ut0pOrgi/GbbKFe
         pujXThXx42dLyeyMoLZ8p7Z8a/cey9OrRm7+hh1GX3D0bCoOJCs6EAxjhTTiEfOxaxxM
         gahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nd+x62BgvaUKtLsEkKCNcqg4e9OToPZipxYRv5SqDCY=;
        fh=bRIDkW4yFq3h+c3X7z1RernvkTQzZTgPWaKBlnnEpCk=;
        b=p/rptbYdUCmoXbD1AM8nW55L5bWDcfX90PqWxgJFZktU5PC30ad94JIc6zOMXypaFi
         e/wmqsGs4jUS4CpdVIKIk9vTVKdJrVtYFlQrmvWx7HKWsUxo3+E5JMrRNx5I9mB1f9up
         ppl5rmrAfWUQn++Z5HGTd3XcuvTVdlAJl9keyQqbgAic/nxS3GT5QzldQtAXpcPG/bc1
         eeVLb0pVBEYZ2LcTUL/NJUlxAI0UNM0bTK8XCWrz/YbUHdD6UO6BZt8DiS3ld+5fYbPZ
         VGhcsRmDTW5A4Lo7Jk4gDdRxzTKSI+CQfubiJlZa+svqBERcNg01GqVpPZrMohA/vxGX
         6IMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279859; x=1788884659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nd+x62BgvaUKtLsEkKCNcqg4e9OToPZipxYRv5SqDCY=;
        b=YGBTAzoCtXkiiukEmQ9Rz4H0XY9Yg107UCdBhnOHcyEIsweEbkaaE6V49Kz0BMOnc1
         ig29qhGoXx6nrE7Cni8S193t6+yHc6L0cGIHKpP6TKGSdc6Vw5yTTWIoImTRyNDpdliJ
         L436tD+khR29p9PtaKztZQ16INzbB4zm1J8dgBGdL6LhRneY2o7JHmDlmbI9p/2LabJb
         RRq+HFRXKQTgObZbWdw/eSBHqfox80ObeUMiwbj1QiycwczJXLc80hzXSTVzv4kSnW1S
         QHUHCFEUF5T2YjnquUw+n8t6/zHMis4TyMHlMMPBH2I71QSdx1wATCbB3b69w2IzqQ4m
         e/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279859; x=1788884659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nd+x62BgvaUKtLsEkKCNcqg4e9OToPZipxYRv5SqDCY=;
        b=Cm8OAfqnrIm9XX4iZSpOHOv7uWvh9fVrn+8bEdsWuw+BPEK7fpK4hkSVM7UtVW32ry
         o5N4rEHOgV4rIFugmYtPSJXHo8s8hAIa7TQRSh/bXXsfRj0pWdTWum7GgkZSpkslVV+k
         XgBqw6m92X1bLpP3JRMLYJWI9JMtJ/494yhHU6lIRGoSsojlD8umj5X4Pb4IBBfqkRGc
         bc+UXvOjpCzTNIKRD/iGMg6vxVxrYnUa6zM7seaq+Pxbg8KpLrSDgNBKSX8DS8dMrErg
         nHk6GgCXpwpZcvNRrcVlJbPr7ev0qhlDjG8ONamdtkm/3yk7no7Th8J2yzmgSIrsgV52
         VO7w==
X-Forwarded-Encrypted: i=1; AKwUvBwqFCOmjdQZ5WXsdI4Fvor5agDxmGanTI7MNHksOoqQKlyhMtVKKqSDKDw9tZL8MHFbWKHuarvtJXeAzQA=@vger.kernel.org
X-Gm-Message-State: AFuF++ler8xMN5fb6zQ8Jn8lw1ytw3E69sQC2fMZUVg1HydFhL6ggl8g
	El+/SvKUHf7yo2VKhivIPBX4s9IkYmbt/L5yjmmfLEnW4SK5kKf7FOG/nVyIcLEQmQsgwZZlG48
	s4S2tuwlFgKmDUVkwVVdR/MvmzCZ/ZHw=
X-Gm-Gg: AYBFou3TMLlK7GfGM47agmsbPxFLeue0NcfRLvAIspsR3pqoUAdGHSCheLtbKBb006M
	t0VLxnt+z7o9WUMZwA5c2aGr9zU4LQfpV0MIWPiVPMlvtwKPTEiqToGS/+YRYVAjTsSETohK3zO
	6kmUbIDWHYmqhDsRUJIf4rl+Q8+R/XKKZhAbJXQWomdNChjqahxbBlSWvzLjfgR6eGcbsrYZNpF
	3a6R7ahbhvxckA6Ib0UsGlBRdHZ8c9E2jn3YlLRV6iuGyGrb+BDjkpNx7QBJiG7aE8VLydW/BtA
	z/p5rkBh6gGZgzBGsyBafG3mVrjURZoho81X+lRGi1o=
X-Received: by 2002:a05:6402:f04:b0:6a6:7ed8:f11f with SMTP id
 4fb4d7f45d1cf-6a67ed8f1eemr380561a12.0.1788279857823; Tue, 01 Sep 2026
 09:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825151242.576456-1-lee@kernel.org> <CAF8JNhKWr7v7tY-tH_CGeLUQQpidx2_7J49c17TD0bw6xEi9BA@mail.gmail.com>
 <20260901124952.GK2943942@google.com>
In-Reply-To: <20260901124952.GK2943942@google.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Tue, 1 Sep 2026 09:24:06 -0700
X-Gm-Features: AcwNN1WTLnaD9h4VNCjN-CXQ_kBLgu2eSfzw6ZnrDLAgmDy4-RNWJ6AFprlBCJw
Message-ID: <CAF8JNhKiMMfkkgh9UMW+uib-tUQahwzGfxSr-36r8vrBxZt-aQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] HID: wacom: Use hdev->product in wacom_setup_touch_input_capabilities
To: Lee Jones <lee@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Aaron Skomra <aaron.skomra@wacom.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:49=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Ping, Jason,
>
> > Thank you for your effort and persistence! We (Wacom and Wacom's
> > customers) are lucky to have people like you working in this
> > community!
>
> Thank you! :)
>
> > In addition to making sure that you know your contribution is greatly
> > appreciated, I am giving you an initial testing feedback so you know
> > you are on the right track.
> >
> > I manually tested a few older and new Wacom tablets. Some of them have
> > touch switches, some don't. They all worked well!
> >
> > Two more details I'd like to share.
> >
> > The first one is about the touch-only tablet. In all the models of
> > Wacom tablets, there was only one model that is touch-only. It was a
> > Bamboo Touch (model CTT-460) released on September 24, 2009. So, it
> > was more than 17 years ago. However, the quality of Wacom tablets are
> > so high, it is possible that some people are still using those ones
> > ;).
> >
> > The second one is about the type of touch on/off switches. There are
> > two types of touch on/off switches: it can be a soft key or hardware
> > switch. The hardware touch switch is easy to understand. The soft key
> > touch switch is actually an on-screen display in the shape of fingers,
> > where the touch on/off is controlled by the driver: [1]. This softkey
> > touch switch, somehow, is not reported to the userland by the existing
> > driver. Your patchset doesn't show it either.
> >
> > I will do more testing to figure out the root cause of the softkey issu=
e.
>
> Is there anything left for me to do?

I guess you'd still need to figure out if Sashiko-bot's infinite-loop
suggestion and other potential issues are real or not.

I have the hardware. I will test the patches when they are updated.
Right now, I am still on the softkey switch issue. The existing driver
works for softkey. It is reported from the kernel driver. The issue is
sometimes it is not showing up in the userland, which we know. The new
patchset moved the logic. I think the sibling_pending routing should
be the one that's responsible for the SW_MUTE_DEVICE recognition. But
the shared structure only knows the pen and touch. It is the pad that
holds the touch switch usage....

I'll share my findings with you when I have a solution.

Cheers,
Ping

> > [1] ttps://github.com/linuxwacom/input-wacom/blob/master/4.18/wacom_wac=
.c#L2063
> >
> > On Tue, Aug 25, 2026 at 10:09=E2=80=AFAM Lee Jones <lee@kernel.org> wro=
te:
> > >
> > > Replace the lookup-dependent 'wacom_wac->shared->touch->product' refe=
rences
> > > with 'hdev->product' inside wacom_setup_touch_input_capabilities() si=
nce
> > > 'hdev' is already available (via container_of) and represents the tou=
ch
> > > device itself.
> > >
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > >
> > > v7 -> v8: New patch
> > >
> > >  drivers/hid/wacom_wac.c | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> > > index a29bf051ada7..4436faf2d2bb 100644
> > > --- a/drivers/hid/wacom_wac.c
> > > +++ b/drivers/hid/wacom_wac.c
> > > @@ -3953,8 +3953,8 @@ int wacom_setup_pen_input_capabilities(struct i=
nput_dev *input_dev,
> > >  int wacom_setup_touch_input_capabilities(struct input_dev *input_dev=
,
> > >                                          struct wacom_wac *wacom_wac)
> > >  {
> > > +       struct hid_device *hdev =3D container_of(wacom_wac, struct wa=
com, wacom_wac)->hdev;
> > >         struct wacom_features *features =3D &wacom_wac->features;
> > > -
> > >         if (!(features->device_type & WACOM_DEVICETYPE_TOUCH))
> > >                 return -ENODEV;
> > >
> > > @@ -3963,9 +3963,11 @@ int wacom_setup_touch_input_capabilities(struc=
t input_dev *input_dev,
> > >         else
> > >                 __set_bit(INPUT_PROP_POINTER, input_dev->propbit);
> > >
> > > -       if (features->type =3D=3D HID_GENERIC)
> > > +       if (features->type =3D=3D HID_GENERIC) {
> > > +               hid_dbg(hdev, "generic touch setup\n");
> > >                 /* setup has already been done */
> > >                 return 0;
> > > +       }
> > >
> > >         input_dev->evbit[0] |=3D BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
> > >         __set_bit(BTN_TOUCH, input_dev->keybit);
> > > @@ -3997,19 +3999,17 @@ int wacom_setup_touch_input_capabilities(stru=
ct input_dev *input_dev,
> > >                 input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
> > >                 __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
> > >
> > > -               if (wacom_wac->shared->touch->product =3D=3D 0x361) {
> > > +               if (hdev->product =3D=3D 0x361) {
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_X,
> > >                                              0, 12440, 4, 0);
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_Y,
> > >                                              0, 8640, 4, 0);
> > > -               }
> > > -               else if (wacom_wac->shared->touch->product =3D=3D 0x3=
60) {
> > > +               } else if (hdev->product =3D=3D 0x360) {
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_X,
> > >                                              0, 8960, 4, 0);
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_Y,
> > >                                              0, 5920, 4, 0);
> > > -               }
> > > -               else if (wacom_wac->shared->touch->product =3D=3D 0x3=
93) {
> > > +               } else if (hdev->product =3D=3D 0x393) {
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_X,
> > >                                              0, 6400, 4, 0);
> > >                         input_set_abs_params(input_dev, ABS_MT_POSITI=
ON_Y,
> > > @@ -4039,8 +4039,8 @@ int wacom_setup_touch_input_capabilities(struct=
 input_dev *input_dev,
> > >                 fallthrough;
> > >
> > >         case WACOM_27QHDT:
> > > -               if (wacom_wac->shared->touch->product =3D=3D 0x32C ||
> > > -                   wacom_wac->shared->touch->product =3D=3D 0xF6) {
> > > +               if (hdev->product =3D=3D 0x32C ||
> > > +                   hdev->product =3D=3D 0xF6) {
> > >                         input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
> > >                         __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
> > >                         wacom_wac->has_mute_touch_switch =3D true;
> > > --
> > > 2.55.0.887.g758fc8c411-goog
> > >
> > >
>
> --
> Lee Jones
