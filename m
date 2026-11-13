Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794612589;
	b=CuoRg0tIEGCW3TN5yFByKIs9hiRSegSTMy+79ijvX6m61Hn07s9ffuTOoji55BAkasGI
	 pGXEa/7P5B2A/QRENu1tgvYiIoJX9OzTsMWjiFeBfaCbED5MadG0uS1ewqaSY2lN+XGj1
	 n5S7jhLK1qcX7eg3oMfovwn5WR1ty2AdudnVTZZp0tqhKHN5wz9FUltL39y2ZwyVlx0QJ
	 ZQa+5LJcQ10tOTufNjytgEXY0QB+dFjggpAt2UrzYYWDHu7JHWSfU3DDVtn0qUQX9O73W
	 +Mvfs9mRCYIdj++0r6rm0P0fUelQYraABNGld0/HZSsKBB8E2ACibxkGt5tZPaAmZsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/CPvoBmvudjbMIuQu1O/W4K6EMPzGyR+i3qZppxVutw=;
	b=E/r5Oj6mLOBnTYj+j3Qs45xlKeXtFYaFEHCJAfC/clu3pJoUjA44/0cQSDnJOa/oU8M7
	 Ih1jFNj3xO+m/hrvjdN4wRDpLDww5CUjK0dX5voQVrTZdbDUpfoWhWkJmEzTiKxHZEhZC
	 TUdfF4nIZtANbFbLe2od6DdYcN7y3Iq3dFl1R4UK3SHZ7C9x+qm2LH/b5ZXFRLJYOX9Rt
	 8SIIdEB6TmvLEZCrQn2ZtU3no7/fFA3PuMYIePkfxsqZPFB50rnYarS75nbeGF6gwke8F
	 cK0EH6836OQOQAttETVH94T4S/KF8nrLizi0+nQIfglAql+7XwrSIE19iPQEG+ktVkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtDl2jZh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A8606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 271A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HtDl2jZh
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91eed03da8bso38513976d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794612587; cv=none;
        d=google.com; s=arc-20260327;
        b=odbar9g2MkTAMqtGF33DNLqQg4FRf2RTttraaJryVwKaDAYLQS8T7/QfvLjbuapJ7a
         THQfJm+deHJwmZKdWnwRdMW+DLxRXEt+nGuFG69qPI3lys0sLNV7gHSGiptJRrRiB2zG
         zwni61YIicMbOEjQPwJ/aEZF6PfZ9UNi4SlfY1bfIDU89BBYjcVGsr+r9S64yvxbbLO4
         85tiTDnWu/MRaFTDvZilzjsVXy3AC3D7OECmD0qhP0ksVTzHa4d/C3SuIBo3XjUwDx7T
         9liPJOMG1+w1SsKlaZWn0ttx2K6M1XV4j7kpsg7YHv9j1WUqSgMkiAVkO9HLcAlD8nCy
         H+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CPvoBmvudjbMIuQu1O/W4K6EMPzGyR+i3qZppxVutw=;
        fh=2+xSM1X0Wrr1Nm79g7b3RfqB4cHHAjjHUZAQ0BAH3ek=;
        b=kvZYjllBDbD9F75foRZpjrOAK6QsaErPBtL+aCMTc+BunzhdpQp4Ts65XrplnNUqm5
         3dlg7+qvfdGrThsg1c3U356WuXpZGI3EY1/++Pdx3fxlYC+lBcX3WGL5cPklwAFt6GMn
         4l7VykdvDMZXh4wgWgv5rzb3IKdzEOzYKE9hpQTScVVYw1AYPmnyzE76MNQIqCO1eDKP
         I0pN6Wncf+EYDDvTw2nFnFxl8yPSTd2CSoLePnvHfNEUE2gEllOjhBK4DMfCCyQDZAI4
         9uaEyv99KSf/jdsDG1suMWLQWlYMsSwzclEEFWVtAKYaCbKO0VBq2+vfQKcAEkOaIyAl
         K0Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612587; x=1795217387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CPvoBmvudjbMIuQu1O/W4K6EMPzGyR+i3qZppxVutw=;
        b=HtDl2jZhzIS3ukNAez0ze32dQI3sfJX8ra3GrnE+EyZRjfpKx5faEScn0Q4et12QJq
         9u2389vrNrjuMuhp9jBZQ55bOim3ET6VeJNqykuUQ6TcCVF/xwGg6awifpbXo2kl+2NJ
         HqSBZWEXDBluBZuqSQgYbY/duTQDcw4xX+guc9EjdohrBOr4jSPIl9GX/ApiCLJxS1z1
         vzjq1jkWO/ok1f+xLniXsvjTwIALHef/ZTER/bYoyWS70bCxDyOU0CnG7GOSrOJNuf1a
         LKE5XcMyAiXoNT2gbLFp2IEKmOy2L+tqd0hgKDzR7y2M1DTocGYJCsjT/BkUimAzK8uQ
         ddkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612587; x=1795217387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CPvoBmvudjbMIuQu1O/W4K6EMPzGyR+i3qZppxVutw=;
        b=cKebyxuPpgdOfIQDUdBWj3CKONlvfMs5WQ4YeYgnFxWg+TH4yJ4h7GNONCP0Nt2W8X
         LVpHbDqzI5VV2etmJUpjIW5Jypmmi5qWSq4WG+9Qc/hGCKy5o1K3yR7sGEugoCFeSRTF
         QC3BQSRjzVNAkV1LIZk3chpCpcn6LCeOryjaO6qBeSrMLRLJzQaoWGj+5niDySUTi8PD
         yi5Cerzq6hOBkqGGEA6Tpmsiy5HEQmhm+EOyR1NTfMNYiIPSdkOVAh0XVtpTBv5Geuze
         XNTS5i3wWM9ibTgDk356O8b2U8lvNSUzhmRASlYyvRcFyUgV0s6oBDa1fLxij/avehJx
         ZAyA==
X-Forwarded-Encrypted: i=1; AL+hErG25PJhQDEI2l0HNWjrE7/P2V+0W6Esb1PvBUm1OkEiU0zTzVe1oFbCQwZD1pdv/FS7W55+lSNmijVPkQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MGZj3E5vGE06UVZ5OJVAucPF9SStrCJTkGm7TNCx+zkpz1iA0
	pjFpu4arHBhgIvxWEeJUApYtEgAi1QcKTaPwm1Nr79Of5JB9DIOWaEjYDQFi0zcwIqoUR94q3JQ
	Q8I81CbhrzSbsD8D50/X3YeYcg+/yOE4=
X-Gm-Gg: AYBFou1P5PUPAjpEGu6ZWmgGcxlvWo9S0NWO9JosoDKyY7MQW8BdbSxa7m4R589EF29
	WrOZQm+F0dicdx9FLQyOIKZcI0sw+zU1rF9i3WxyIJ+BXAuJBLlwPUHy9oaUSPJTKsGq/J20FDv
	CEFUCIxlu8XhhmJGWOB6mD/fH+IvQKtXw1GPlAwclWaVknJFCxtGha3aMgVRF6UBbxo5aq7EPf1
	DKR2W3clzq7L+Auy04OcD/3yU3roXiPh63UHUeI1s1USiOP15fGcbgP7sW0rtl1kTbp3E1khgq+
	IA6Pw7ZYT99XqKh5gMnsanXuQdjK/5FHdj8jlCJj21DXIOMD35JvU2i0BbQT8ddjAT3WFYejQFW
	vkpjnolMBWUXNU6fAUyHeQApX0LOBTTsaxATg
X-Received: by 2002:a05:6214:508c:b0:91c:79eb:ea55 with SMTP id
 6a1803df08f44-91f24217e76mr64365356d6.28.1794612586932; Fri, 13 Nov 2026
 15:29:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <20261110020632.4003499-4-svv@google.com>
In-Reply-To: <20261110020632.4003499-4-svv@google.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 13 Nov 2026 15:29:35 -0800
X-Gm-Features: AclHuK8dkjAO0euguxtIZM-3wnI68NThCiMuckOj0XFkMajC1vM8NY1sp3w5JCY
Message-ID: <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist
To: Siarhei Vishniakou <svv@google.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:21=E2=80=AFPM Siarhei Vishniakou <svv@google.com> =
wrote:
>
> Historically, Wacom tablets reported stylus barrel rotation (twist)
> via ABS_Z because a dedicated evdev axis did not exist. Now that we
> have this axis, report pen twist on ABS_TWIST in addition to ABS_Z.
>
> Keep reporting ABS_Z to maintain backward compatibility for existing
> applications that support Wacom devices.
>
> Signed-off-by: Siarhei Vishniakou <svv@google.com>
> ---
>  drivers/hid/wacom_wac.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 614f2adab563..7676bc26a027 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -802,8 +802,10 @@ static void wacom_exit_report(struct wacom_wac *waco=
m)
>                 input_report_key(input, BTN_STYLUS2, 0);
>                 input_report_key(input, BTN_TOUCH, 0);
>                 input_report_abs(input, ABS_WHEEL, 0);
> -               if (features->type >=3D INTUOS3S)
> +               if (features->type >=3D INTUOS3S) {
>                         input_report_abs(input, ABS_Z, 0);
> +                       input_report_abs(input, ABS_TWIST, 0);
> +               }
>         }
>         input_report_key(input, wacom->tool[idx], 0);
>         input_report_abs(input, ABS_MISC, 0); /* reset tool id */
> @@ -981,6 +983,7 @@ static int wacom_intuos_general(struct wacom_wac *wac=
om)
>                         t =3D (data[7] & 0x20) ? ((t > 900) ? ((t-1) / 2 =
- 1350) :
>                                 ((t-1) / 2 + 450)) : (450 - t / 2) ;
>                         input_report_abs(input, ABS_Z, t);
> +                       input_report_abs(input, ABS_TWIST, t);
>                 } else {
>                         /* 4D mouse 2nd packet */
>                         t =3D (data[6] << 3) | ((data[7] >> 5) & 7);
> @@ -1411,6 +1414,7 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_w=
ac *wacom)
>                                 input_report_abs(pen_input, ABS_TILT_Y,
>                                                  (signed char)frame[8]);
>                                 input_report_abs(pen_input, ABS_Z, rotati=
on);
> +                               input_report_abs(pen_input, ABS_TWIST, ro=
tation);
>                                 input_report_abs(pen_input, ABS_WHEEL,
>                                                  get_unaligned_le16(&fram=
e[11]));
>                         }
> @@ -1935,7 +1939,7 @@ static void wacom_map_usage(struct input_dev *input=
, struct hid_usage *usage,
>         int resolution;
>
>         if (equivalent_usage =3D=3D HID_DG_TWIST) {
> -               resolution_code =3D ABS_RZ;
> +               resolution_code =3D ABS_TWIST;
>         }

Requesting a comment here just to make sure that anyone that is only
casually reading doesn't think this code is dead. Setting *some* kind
of radial axis here (be it ABS_RZ or ABS_TWIST) is critical to
ensuring HID properly calculates the resolution for ABS_Z, and that
might not be obvious when you see HID_DG_TWIST forcing the
resolution_code to ABS_TWIST.

>
>         resolution =3D hidinput_calc_abs_res(field, resolution_code);
> @@ -2332,6 +2336,7 @@ static void wacom_wac_pen_usage_mapping(struct hid_=
device *hdev,
>                 break;
>         case HID_DG_TWIST:

Also requesting a comment for this case that explains that the usage
here is mapped twice for backwards-compatibility, and that the order
matters since the latter call will override `usage->type` and
`usage->code`, preventing wacom_wac_pen_event from automatically
emitting an ABS_Z event.

>                 wacom_map_usage(input, usage, field, EV_ABS, ABS_Z, 0);
> +               wacom_map_usage(input, usage, field, EV_ABS, ABS_TWIST, 0=
);
>                 break;
>         case HID_DG_ERASER:
>                 input_set_capability(input, EV_KEY, BTN_TOOL_RUBBER);
> @@ -2522,10 +2527,21 @@ static void wacom_wac_pen_event(struct hid_device=
 *hdev, struct hid_field *field
>                 return;
>
>         /* send pen events only when the pen is in range */
> -       if (wacom_wac->hid_data.inrange_state)
> -               input_event(input, usage->type, usage->code, value);
> -       else if (wacom_wac->shared->stylus_in_proximity && !wacom_wac->hi=
d_data.sense_state)
> -               input_event(input, usage->type, usage->code, 0);
> +       if (!wacom_wac->hid_data.inrange_state) {
> +               if (!wacom_wac->shared->stylus_in_proximity ||
> +                   wacom_wac->hid_data.sense_state)
> +                       return;
> +               value =3D 0;
> +       }
> +
> +       input_event(input, usage->type, usage->code, value);
> +       /*
> +        * ABS_Z was used to report twist data, because ABS_TWIST was not=
 yet
> +        * defined at the time. For compatibility purposes, also report t=
wist
> +        * via ABS_Z.
> +        */

I think this comment could be a little more clear, perhaps referencing
the double-mapping in wacom_wac_pen_usage_mapping (and how we need to
send data out of both ABS_TWIST and ABS_Z but that `usage->type` and
`usage->code` can only be set to one of those two)

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> +       if (equivalent_usage =3D=3D HID_DG_TWIST)
> +               input_report_abs(input, ABS_Z, value);
>  }
>
>  static void wacom_wac_pen_pre_report(struct hid_device *hdev,
> @@ -3741,6 +3757,7 @@ void wacom_setup_device_quirks(struct wacom *wacom)
>                 __clear_bit(BTN_TOOL_PENCIL, wacom_wac->pen_input->keybit=
);
>                 __clear_bit(BTN_TOOL_AIRBRUSH, wacom_wac->pen_input->keyb=
it);
>                 __clear_bit(ABS_Z, wacom_wac->pen_input->absbit);
> +               __clear_bit(ABS_TWIST, wacom_wac->pen_input->absbit);
>                 __clear_bit(ABS_DISTANCE, wacom_wac->pen_input->absbit);
>                 __clear_bit(ABS_TILT_X, wacom_wac->pen_input->absbit);
>                 __clear_bit(ABS_TILT_Y, wacom_wac->pen_input->absbit);
> @@ -3823,6 +3840,8 @@ int wacom_setup_pen_input_capabilities(struct input=
_dev *input_dev,
>         case CINTIQ_COMPANION_2:
>                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0);
>                 input_abs_set_res(input_dev, ABS_Z, 287);
> +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0, =
0);
> +               input_abs_set_res(input_dev, ABS_TWIST, 287);
>                 wacom_setup_cintiq(wacom_wac);
>                 break;
>
> @@ -3835,6 +3854,8 @@ int wacom_setup_pen_input_capabilities(struct input=
_dev *input_dev,
>         case INTUOS4S:
>                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0);
>                 input_abs_set_res(input_dev, ABS_Z, 287);
> +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0, =
0);
> +               input_abs_set_res(input_dev, ABS_TWIST, 287);
>                 fallthrough;
>
>         case INTUOS:
> @@ -3855,6 +3876,8 @@ int wacom_setup_pen_input_capabilities(struct input=
_dev *input_dev,
>
>                 input_set_abs_params(input_dev, ABS_Z, -900, 899, 0, 0);
>                 input_abs_set_res(input_dev, ABS_Z, 287);
> +               input_set_abs_params(input_dev, ABS_TWIST, -900, 899, 0, =
0);
> +               input_abs_set_res(input_dev, ABS_TWIST, 287);
>
>                 wacom_setup_intuos(wacom_wac);
>                 break;
> --
> 2.56.0.455.g6c5a503b38-goog
>
>
