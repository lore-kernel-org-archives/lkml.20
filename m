Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC422AE65
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798950; cv=pass; b=XsSgkU/nF52SfbB3idS4peeOMcqcdZgILZcp7vd6q8X/Wd1uqCH1aJ77ihzLaEKtDL5cxRoW9gWwaTe5Gg8xmFxMricXBsp2makv67rJnG8EnQZwGtCoCXvlqXOvh7woXdOzOaaSbEJuCi88eeO2vVQT5lA86YeCqiWtN3rfBBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798950; c=relaxed/simple;
	bh=XAZ8RuL3OK7yi6FMYBI3gHxaw8VoKbKdqDDnFO/Y2UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlN7LzGNpUlmylfVzdgmh9Dd+JLM0VQi6CPhHxUbklhj4Fr1R2JOsraSsCbw96+8nPIoxC9RdakcVjvaD4fousay4sPhf5REZCH0W3ymN1Lf+QzqeMOWltIMccYopuPc4U0gdfwV+JGmllKnTPQsqPqMs46DZYQxjoK9w6nHiFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6QR19nw; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6QR19nw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c247f6687dcso41063066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787798947; cv=none;
        d=google.com; s=arc-20260327;
        b=LFrpFZYBxWTRKJ87tWQ/InMb2YM6ewxwn9tn/UR+0rSFxwAUz3fgalWhEEcJE0TYFg
         16hXM6aSXgwaPYxWbQALBNALDBxAU2+WOa6/bAx5bhisNI+Qt07/9YEUd5LuS4a5BpFR
         l4k75vV3qRsxsn6KsPXexxFenV6+kkdq1gwJoCpm1GrPE/TW74cl6JylSUs1lHTELICd
         Rc6bL7Ovs5KKqIYjl53CEvIFJGpLTGgMGeFacb0/DoXeGoPaWET6bK47IDlllGRkSWde
         pxco9TZm1uBjd6IYcRoxwLmefO5obOmpDXDfKrXmCNSQpMepRivC1gipbsLyuITfBPZV
         jsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jf1DTrgu9DEKlBhdg3fT3vRoxhwl7YfgT/79bwlhJuA=;
        fh=UmT7U0wNNo9Ci10Zd1bM9Px9JCZy14WvhpG0OdULUdE=;
        b=KvtW3A2G2+R7rOKTAUrXxP3XzqR5xxuXfytg4DTZQLlXptnN95b7qiO2UbxtXgGQBz
         h3CsFADOYldXdog7N2foD9GWrqUr/6y6ox3uKgsoJ6FvpNQLSbQQedtwG5SEXuqTOP3u
         o3ebZIUF0geQiRNoMa/VvTS0T0v5ZyVEFmVeq5SstmORcmOcOnc2e9k1eQw30omJpIea
         GFJFsmJ1nfPy+JIyK41tGCqT+ZBMP+n4XnkTF4mWxL3OcKuTqTB1u31eOZVR6X7c3riP
         QpkDS8wMdGNsvNNPM+0wDQBwmzXk6zm0kGf11ewy414GE0Mc3evvfAzNTd3+i/Is2l5u
         mi8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787798947; x=1788403747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jf1DTrgu9DEKlBhdg3fT3vRoxhwl7YfgT/79bwlhJuA=;
        b=K6QR19nwiAIZ3ViQHDHBST53D+dh5ra8R9K6IcTAbgoAv/WDWjizO7UeFsbBat7s9P
         1wwxB7UVrInMfbUYfZktgzoNaUupp390SLDWRFy2MnpGMPSK8VoXNNvvQlmV359s7LQ2
         CTj2+hkj34C0jaMqbgtaAYNOnHV9Rmv5bfFWCL9oTAGxayPm3zVX7vGbI7XLItrIe+H2
         TVONJF1WGn5kixpGfHniufRAJtGEWBDnWIT4JngacTBFVpv6WQIuVCvO3w531liePPVq
         baopi3Rkz0A+f0Idr/qoUwPJ2UnhUmgF+PKPI3pL4DqpK9iUcQ/e4pBfblylOD5EElic
         UXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787798947; x=1788403747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jf1DTrgu9DEKlBhdg3fT3vRoxhwl7YfgT/79bwlhJuA=;
        b=AhMT7hmryPJx47WZ/40Nt7uIlK1xEMmVt1VLr2qffQ5gd8iZ4BRL+eaAJ2d00PfnmV
         Aih+Q91UP5V06eDCjP+g/s0SaB7VAxz4kdEJcUU7WAosoUPrBC+x1XLyEu15unAouH91
         jjkAUMP+o42b2xifq2HMj6cdQHtcYGtSi3ZOse3E0O87Q8VbgDEG9c/xqWB2IiquCcFo
         XlD7cciuJUMLuTAbvP4Pk/SxqjyW5ZP0bWWChoXZJEE3br440liZrQ/2Miiga/QG/HyW
         huH5JQN7BgkT5yuUIABaA68n93/t24SQV/B7DDG0F7qokZhwLdjutTUwpZNiNx7aABqX
         j6sg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6U4aUUlSTe9wj2Tf/ezi9sysT6QTw/jpollOeGdrJs1a/nILh9N2hmDDCnlkHW4VuysIARhMCaHpOUpw=@vger.kernel.org
X-Gm-Message-State: AFuF++m0z+1TJpZDkgrAx1ducarRuHP/HvehqBPz2n+If4ZHCSZ+EORD
	Zssb+0snV0xWM3sIaGSxVtwMAD4FawNpaTB/7PUii0BpX3XNR1C8T5z5KjcpQVT/ZBXPRDDzblb
	qj1m54yOB7Vlimvx8yVpJuicolqRSVZM=
X-Gm-Gg: AR+sD120Ti2Z1JGJlq1ztwM3+drB9f0gTMJU1Zh3pcArXdplUcgpaiOag9hBqFYIFNO
	pYo7GlHvL7/EMUhgPMX5rmU9zMxZYmyOAYKW9uyJFA5qyU1Z0c0erwb/JX8W1AlCe6PkqGPX/WI
	rNhOMYhI5GzELEP3LXFAasxMUAAlioPm8q9NPnbNX9Zg/1StxBfw0R85sIhp8H69HMLJSdDfqAV
	gjYHda+InjH5Zi8dmhvWAj7IMx9Rmo6CjnY1jj/O3Zg+Yq37vYQ6+yRsQnyio1LJLeiDMb8cRpl
	BfWUa0mRpHaoxXWJQyuPLltvYqTcYpmW6eDOGssltvwpHA2Lw2cCxmgHIv2an7X/bpsqee+7xhB
	K5g==
X-Received: by 2002:a17:907:72c6:b0:c21:34a3:4df9 with SMTP id
 a640c23a62f3a-c250bb58ab3mr1197654466b.3.1787798947202; Wed, 26 Aug 2026
 19:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825151242.576456-1-lee@kernel.org>
In-Reply-To: <20260825151242.576456-1-lee@kernel.org>
From: Ping Cheng <pinglinux@gmail.com>
Date: Wed, 26 Aug 2026 19:48:54 -0700
X-Gm-Features: AcwNN1ViTpD87lwJhZjfJSN8xPZt6UzWagIl4Wm_TDAxjtQ6p7vKzNnVpx5ye3Y
Message-ID: <CAF8JNhKWr7v7tY-tH_CGeLUQQpidx2_7J49c17TD0bw6xEi9BA@mail.gmail.com>
Subject: Re: [PATCH 1/5] HID: wacom: Use hdev->product in wacom_setup_touch_input_capabilities
To: Lee Jones <lee@kernel.org>
Cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Aaron Skomra <aaron.skomra@wacom.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

Thank you for your effort and persistence! We (Wacom and Wacom's
customers) are lucky to have people like you working in this
community!

In addition to making sure that you know your contribution is greatly
appreciated, I am giving you an initial testing feedback so you know
you are on the right track.

I manually tested a few older and new Wacom tablets. Some of them have
touch switches, some don't. They all worked well!

Two more details I'd like to share.

The first one is about the touch-only tablet. In all the models of
Wacom tablets, there was only one model that is touch-only. It was a
Bamboo Touch (model CTT-460) released on September 24, 2009. So, it
was more than 17 years ago. However, the quality of Wacom tablets are
so high, it is possible that some people are still using those ones
;).

The second one is about the type of touch on/off switches. There are
two types of touch on/off switches: it can be a soft key or hardware
switch. The hardware touch switch is easy to understand. The soft key
touch switch is actually an on-screen display in the shape of fingers,
where the touch on/off is controlled by the driver: [1]. This softkey
touch switch, somehow, is not reported to the userland by the existing
driver. Your patchset doesn't show it either.

I will do more testing to figure out the root cause of the softkey issue.

Cheers,
Ping

[1] ttps://github.com/linuxwacom/input-wacom/blob/master/4.18/wacom_wac.c#L=
2063

On Tue, Aug 25, 2026 at 10:09=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Replace the lookup-dependent 'wacom_wac->shared->touch->product' referenc=
es
> with 'hdev->product' inside wacom_setup_touch_input_capabilities() since
> 'hdev' is already available (via container_of) and represents the touch
> device itself.
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>
> v7 -> v8: New patch
>
>  drivers/hid/wacom_wac.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index a29bf051ada7..4436faf2d2bb 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -3953,8 +3953,8 @@ int wacom_setup_pen_input_capabilities(struct input=
_dev *input_dev,
>  int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
>                                          struct wacom_wac *wacom_wac)
>  {
> +       struct hid_device *hdev =3D container_of(wacom_wac, struct wacom,=
 wacom_wac)->hdev;
>         struct wacom_features *features =3D &wacom_wac->features;
> -
>         if (!(features->device_type & WACOM_DEVICETYPE_TOUCH))
>                 return -ENODEV;
>
> @@ -3963,9 +3963,11 @@ int wacom_setup_touch_input_capabilities(struct in=
put_dev *input_dev,
>         else
>                 __set_bit(INPUT_PROP_POINTER, input_dev->propbit);
>
> -       if (features->type =3D=3D HID_GENERIC)
> +       if (features->type =3D=3D HID_GENERIC) {
> +               hid_dbg(hdev, "generic touch setup\n");
>                 /* setup has already been done */
>                 return 0;
> +       }
>
>         input_dev->evbit[0] |=3D BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
>         __set_bit(BTN_TOUCH, input_dev->keybit);
> @@ -3997,19 +3999,17 @@ int wacom_setup_touch_input_capabilities(struct i=
nput_dev *input_dev,
>                 input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
>                 __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
>
> -               if (wacom_wac->shared->touch->product =3D=3D 0x361) {
> +               if (hdev->product =3D=3D 0x361) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 12440, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
>                                              0, 8640, 4, 0);
> -               }
> -               else if (wacom_wac->shared->touch->product =3D=3D 0x360) =
{
> +               } else if (hdev->product =3D=3D 0x360) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 8960, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
>                                              0, 5920, 4, 0);
> -               }
> -               else if (wacom_wac->shared->touch->product =3D=3D 0x393) =
{
> +               } else if (hdev->product =3D=3D 0x393) {
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_X=
,
>                                              0, 6400, 4, 0);
>                         input_set_abs_params(input_dev, ABS_MT_POSITION_Y=
,
> @@ -4039,8 +4039,8 @@ int wacom_setup_touch_input_capabilities(struct inp=
ut_dev *input_dev,
>                 fallthrough;
>
>         case WACOM_27QHDT:
> -               if (wacom_wac->shared->touch->product =3D=3D 0x32C ||
> -                   wacom_wac->shared->touch->product =3D=3D 0xF6) {
> +               if (hdev->product =3D=3D 0x32C ||
> +                   hdev->product =3D=3D 0xF6) {
>                         input_dev->evbit[0] |=3D BIT_MASK(EV_SW);
>                         __set_bit(SW_MUTE_DEVICE, input_dev->swbit);
>                         wacom_wac->has_mute_touch_switch =3D true;
> --
> 2.55.0.887.g758fc8c411-goog
>
>
