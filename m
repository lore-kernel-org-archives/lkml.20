Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895817BED0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195567; cv=pass; b=a9sI/3+n5IHcDgY8r8rdzNilLlWBeL7H+bjCjrj24rSNg1EXN5NWusqOs1lCSak0XcjWjcIPFA6OTAgSj5O6fgqgIiSQxcfSy85xIArxUte0rOwGfgJBtNKVs5gQlH/nvuTbR+5OGNnbOLr/wW57OouRGxe4af/vxCEyFuuiSIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195567; c=relaxed/simple;
	bh=xquiZaTIE5papWcZLbh6OkjB+2lSoyzc3fhqYgq7cqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYft01s8H7AYEBBKQS8Iqkt1OHnjoNL2LApzq16VOIirrpHbuzwflLBjkIvfWetbI0/LQ6l9x4Lqv2F0cGcdJIdjQKBDep42m2bveVr9aOYyIA5a0TWJ5by8ohw8I8KxDVWys8BAl0k1Xvivlf7YXZwsLGWpx07aZzRG0ePpk6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xm9GjnG8; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm9GjnG8"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9178d514951so3946476d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792195564; cv=none;
        d=google.com; s=arc-20260327;
        b=fgyhRV+p5vT0SvBLnnywyuff8C1BE+zy2TMdkRCvb+euuAuwkw0h0wQd+TRm/Qz6mV
         kA3I2FtLQJ9iKR7FeVdijgmwovU40jFXKv4sydwSBPYGxkpRY4rUhbFUKykhJYZF3lPM
         rQ9rlt0RNT0KuNw997RQd9UZ7t7xTNyINI0uOZ9wamdwHZA4FY+KuX/xv7x+V9UQU5ka
         X0/9DIzIIPDhJmyl2iUJ4MUfkZWel4fM1N1ph0OfFtfU3p7SYEHqAcbbFxmlt4doG6PW
         621B1C+LJhwGxZsK2IdmXUdLc6wTdzmYIhNeU45Rd4Uw84D0TyYMxC3oxaFl0bm0h/0v
         CACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKBulPOhlvnmXZWcycnapBCt2ktl2dYfpNfde2xn974=;
        fh=wmPCUZUP/ldROOybbLiH+V1CYJs38dQ9LXtEAUagI3Q=;
        b=d35eREydii+m3zWI0aG+VQ7A6lYQL++7asgECBVuzse5zieG+/lM3uZO9mA6az05yV
         MbF6P+5Vv3YNm0zpnfhsYrzCzCvRoiolM+daVa4QfV8sFndg7+WPMXF4RvDlHStPo+pn
         v0z2HS+wghPyYKqv/KzGQDsXlViE8/MpbT57J10eo3IGBBCbmHN4QEDURjbO0LPkP+DT
         EfGHS3WW8RFbFSh8Fj972sZsd+Y1NMFYK5PZLPHSuPi1QV0N0UwL+UaCf7VY9CPe7kC7
         nz4pH4Jt6I048CjNtm/asaN0SkihuPMNUZ70uucQTzvRsWvwqYoZRVT1omLRwtDLHKe3
         3X/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792195564; x=1792800364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKBulPOhlvnmXZWcycnapBCt2ktl2dYfpNfde2xn974=;
        b=Xm9GjnG8t8LlkRjUp9sprWbiCdGJSL6COkR2rinJemqQOIlt3Rs3jmXVF5UcDbO9la
         UpZBygT+dgvqrofZz5ltRFFuVvfVFG0NjLz9ai9QlDbiFsaX/h9GsOTS1YLlgB2JekCj
         YQef6PO/T0ZkoWMuDQbbMBaOY0rjwtF2Sd+C7FNY6uaaQ3UvGr+3Q3sU1C61+ijBoMI1
         GeH/L4GURne+eEnzL1BdkfI82lyvVSFfejgThKPWTCL2e0hatV6ETmGULvFXWjTxeOqM
         fj8EmvJSB1KQuDHk0WiBquGTgDPpzQz6NagI2OXPNcq+H+Pd/pqGDlU33xSxHaboVY6m
         q7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195564; x=1792800364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKBulPOhlvnmXZWcycnapBCt2ktl2dYfpNfde2xn974=;
        b=SOA8l64DVIVJIPc17N0rlKUrLw/N0LE1v0U7r10gMwinbCJ2IqE2WHaICvCTz5a7FB
         hl3vWocAF4WnbqKEcUf5twnnyzgVoblioFrsWAi6hRc6Ba5wizAzk3JgIIahNLpvd1ln
         J9RKsvQG0GxkfRVyvAE/f4stTn+jcMbSw9ky4aL6Sztk8infUqM1Vva3HugjrViz1MQF
         b3WquOLkpm1qAqhuIA41NvOefpz2Q+YkLnc5GjjdCb2M5GtjMFUXnDuXm72AENDC2RNP
         VXKIqSQCq/oI1OATSgaVowR2NtRM27qoCzuN27eEH1xAldp64t11+UKXzJVLcxKBI60C
         JsQg==
X-Forwarded-Encrypted: i=1; AKwUvBwN8CUzcFReAMt/xoXctc/aAXmeYtZzIXhh+NTu6MRAN1CK5+oxnZaDim9wdjWnLzLXeznIBrBeiWpenZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWYXWCXklcsAjnj5Tgc8u9cM7KDdC5Qf66SHw5oJgusxx9rjWn
	ELbQzdSMK0LLUALNueQae9ohPgAozEYdU9zDFKmp5nedHCMlPq+z6gKleYe82NtfhWidB2eOVDq
	2YJbrsUdst1tD2zIoXqyl0OLQBDAgDuE=
X-Gm-Gg: AYBFou3bE9fqztFfpbrgW6acamRa1l7WzmZI0WNtOGUTqqI6MRI5E3M2Q3DENnIZ+Sf
	ymXRLTaKtA46GZLJ4e3jlVUlIJLp1nSzzoXfvmRoDqsqhll36MqtNLYAWm+ugvexedBQkNlT8hK
	TPRm+koLkmRaPd8cGgzoIX3qq0ncg37fHi5OhHHTATsHZ420fRqDZqNhz8CBPQwsQmYxu4yITHB
	VEaXfAFT88XqbK5svwbiz+Y+CIJM5dE2qbvoQEAgvfwEPk95doDD/GhsJqgvFKt0f+PduJOZrTl
	bh2GQR5eqcKOTL8fNyBr0FjVHwVfJsgBJNxw+TeC/cnIoCw7n9b/wpg=
X-Received: by 2002:a05:6214:ccd:b0:91b:9232:2be1 with SMTP id
 6a1803df08f44-91bdf1a0854mr29466886d6.37.1792195564255; Fri, 16 Oct 2026
 17:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
 <20260927041138.4112920-1-jinmo44.yang@gmail.com> <20260927041138.4112920-6-jinmo44.yang@gmail.com>
In-Reply-To: <20260927041138.4112920-6-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 16 Oct 2026 17:05:53 -0700
X-Gm-Features: AclHuK8GSghbpgvHyv7qwZz4WfJSUSZGcZ-qjY4KSndULnxNVg32uv72-lIu-CA
Message-ID: <CANRwn3S1kYzKxs2g5F=MxNZbHQ9=vqX69=CCCdTg-roR7Gz5=A@mail.gmail.com>
Subject: Re: [PATCH 5/5] HID: wacom: check the input devices in the Bamboo handlers
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 9:12=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> wacom_bpt_touch() takes both touch_input and pad_input, and
> wacom_bpt3_touch_msg() and wacom_bpt3_button_msg() take touch_input and
> pad_input respectively, none of them checked. An interface that declares
> only pen usages leaves touch_input and pad_input NULL on a fully
> successful probe, and wacom_bpt_irq() still dispatches to these
> handlers.
>
Similar to patch 2/5 and 4/5, I believe wacom_bpt_touch only operates
on devices that are expected to have both touch and pad input. To the
best of my knowledge, this function is exclusively used by
1st-generation Bamboo Touch hardware which mixes touch and pad data in
the same report (both get reported side-by-side). The original
implementation of the code in cb734c03680e ("Input: wacom - add
support for the Bamboo Touch trackpad") highlights this mixing on the
same interface. As with the other patches, a single check that both
touch and pad are valid at the beginning of the function should be
valid.

> Four locations fault, each reproduced on linux-next 20260925 (x86_64,
> KASAN) from one /dev/uhid device plus a single UHID_INPUT2 write:
>
>   wacom_wac.c:3100  wacom_bpt_touch         touch_input
>   wacom_wac.c:3117  wacom_bpt_touch         pad_input
>   wacom_wac.c:3130  wacom_bpt3_touch_msg    touch_input
>   wacom_wac.c:3178  wacom_bpt3_button_msg   pad_input
>
> for example, with vendor 0x056a product 0x00D4 (BAMBOO_PEN), a pen-only
> descriptor and report id 2:
>
>   BUG: KASAN: null-ptr-deref in input_event+0x44/0xb0
>   Read of size 8 at addr 0000000000000028
>    wacom_wac_irq+0x8185/0xb3f0
>    wacom_raw_event+0x68f/0xb60
>    __hid_input_report+0x398/0x4d0
>    uhid_char_write+0xa99/0xfc0
>
> wacom_bpt_touch() serves touch and pad in one report, so its two blocks
> are guarded separately - an interface with a pad but no touch must keep
> delivering pad events. In wacom_bpt3_touch_msg() the slot lookup moves
> below the check because it dereferences the input device itself.
>
> The touch block of wacom_bpt_touch() is reindented into the new
> conditional; git diff -w shows no change there beyond the two style
> fixes checkpatch asks for on the lines that move.
>
> Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
> Fixes: 3116871f4273 ("Input: wacom - split out the pad device for Bamboos=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
> ---
>  drivers/hid/wacom_wac.c | 56 +++++++++++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 11544adb74f5..dac67885f81e 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -3118,31 +3118,36 @@ static int wacom_bpt_touch(struct wacom_wac *waco=
m)
>         if (data[0] !=3D 0x02)
>             return 0;
>
> -       for (i =3D 0; i < 2; i++) {
> -               int offset =3D (data[1] & 0x80) ? (8 * i) : (9 * i);
> -               bool touch =3D report_touch_events(wacom)
> -                          && (data[offset + 3] & 0x80);
> -
> -               input_mt_slot(input, i);
> -               input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
> -               if (touch) {
> -                       int x =3D get_unaligned_be16(&data[offset + 3]) &=
 0x7ff;
> -                       int y =3D get_unaligned_be16(&data[offset + 5]) &=
 0x7ff;
> -                       if (features->quirks & WACOM_QUIRK_BBTOUCH_LOWRES=
) {
> -                               x <<=3D 5;
> -                               y <<=3D 5;
> +       if (input) {
> +               for (i =3D 0; i < 2; i++) {
> +                       int offset =3D (data[1] & 0x80) ? (8 * i) : (9 * =
i);
> +                       bool touch =3D report_touch_events(wacom) &&
> +                                    (data[offset + 3] & 0x80);
> +
> +                       input_mt_slot(input, i);
> +                       input_mt_report_slot_state(input, MT_TOOL_FINGER,=
 touch);
> +                       if (touch) {
> +                               int x =3D get_unaligned_be16(&data[offset=
 + 3]) & 0x7ff;
> +                               int y =3D get_unaligned_be16(&data[offset=
 + 5]) & 0x7ff;
> +
> +                               if (features->quirks & WACOM_QUIRK_BBTOUC=
H_LOWRES) {
> +                                       x <<=3D 5;
> +                                       y <<=3D 5;
> +                               }
> +                               input_report_abs(input, ABS_MT_POSITION_X=
, x);
> +                               input_report_abs(input, ABS_MT_POSITION_Y=
, y);
>                         }
> -                       input_report_abs(input, ABS_MT_POSITION_X, x);
> -                       input_report_abs(input, ABS_MT_POSITION_Y, y);
>                 }
> -       }
>
> -       input_mt_sync_frame(input);
> +               input_mt_sync_frame(input);
> +       }
>
> -       input_report_key(pad_input, BTN_LEFT, (data[1] & 0x08) !=3D 0);
> -       input_report_key(pad_input, BTN_FORWARD, (data[1] & 0x04) !=3D 0)=
;
> -       input_report_key(pad_input, BTN_BACK, (data[1] & 0x02) !=3D 0);
> -       input_report_key(pad_input, BTN_RIGHT, (data[1] & 0x01) !=3D 0);
> +       if (pad_input) {
> +               input_report_key(pad_input, BTN_LEFT, (data[1] & 0x08) !=
=3D 0);
> +               input_report_key(pad_input, BTN_FORWARD, (data[1] & 0x04)=
 !=3D 0);
> +               input_report_key(pad_input, BTN_BACK, (data[1] & 0x02) !=
=3D 0);
> +               input_report_key(pad_input, BTN_RIGHT, (data[1] & 0x01) !=
=3D 0);
> +       }
>         wacom->shared->touch_down =3D wacom_wac_finger_count_touches(waco=
m);
>
>         return 1;
> @@ -3153,8 +3158,12 @@ static void wacom_bpt3_touch_msg(struct wacom_wac =
*wacom, unsigned char *data)
>         struct wacom_features *features =3D &wacom->features;
>         struct input_dev *input =3D wacom->touch_input;
>         bool touch =3D data[1] & 0x80;
> -       int slot =3D input_mt_get_slot_by_key(input, data[0]);
> +       int slot;
>
> +       if (!input)
> +               return;
> +
> +       slot =3D input_mt_get_slot_by_key(input, data[0]);
>         if (slot < 0)
>                 return;
>
> @@ -3196,6 +3205,9 @@ static void wacom_bpt3_button_msg(struct wacom_wac =
*wacom, unsigned char *data)
>         struct input_dev *input =3D wacom->pad_input;
>         struct wacom_features *features =3D &wacom->features;
>
> +       if (!input)
> +               return;
> +

As with patch 1, each of these checks is for an unusual error
condition so a dev_warn_once or hid_warn_once before returning is
suggested.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


>         if (features->type =3D=3D INTUOSHT || features->type =3D=3D INTUO=
SHT2) {
>                 input_report_key(input, BTN_LEFT, (data[1] & 0x02) !=3D 0=
);
>                 input_report_key(input, BTN_BACK, (data[1] & 0x08) !=3D 0=
);
> --
> 2.53.0
>
>
