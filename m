Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4323A5E88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278271; cv=pass; b=YRmCKShj4ZAknvbekozNKR8GCxMKuDnmiBabTUkJseI2aVkGSCK9oG0pCW/LW6wS9xqOUyR16pEs7quyYU3OlvC8uc/ib5pgVzkXnn0YTz5a7ev9q+ea+kz1eHVCD8Y6mJlc5BSaCF6ZHntVaf3zmP00WdTc2UqY5nDZNBrvEUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278271; c=relaxed/simple;
	bh=LGO4QPEZD4tJNdCuCHdQdsMS8+RzFkzYI9X0O6NCqO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaedvcXKZ5gbdXKBFsjSsQiCpqSxF/4PImjWpkEDAzla6bmJTooUTdHrATjOlE+UwQdDZkVbsopeQXSyoVGawkF7iG4m/vdXZNesRrjndJ5L3vq4GCuPTy87/Vs2s6XIYN45UGYiFHiGevnV1XXAj7CberRvNdsmZjP8tEGGViE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oysREbCg; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oysREbCg"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-746d77537f8so56870137.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788278267; cv=none;
        d=google.com; s=arc-20260327;
        b=P0/fFylWa+/0EmluwqGs3nk/g+FNLQy9FiyDHpY0zaIXmwMN46wX6HH+QXgO14nlze
         IXQcyq7PJzmWbiuKOyJgkp/qLMv6czpIGVRq7Ic2vC13eV5TLtlsmee3K4pCvSFKAqpD
         2ADpqmEK98ypjul4XwPT4LKgS4vz2+pQau4g+1kdAd6yXH+Ci2YHfmTTPM6xj7Aip+2q
         K1N7vZ+FGwgoo7kzGKtZrYxAEF4CawhacWUeukei0KGn9jjEGiK5lJ6O+xtJOK7RX2KS
         UIP/4/MHfne/Lhirmjt/ihKnmXaSzxq5WaWKydQqotTkX0DbcULICT+mlltqWrapzIXP
         cXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RoXKQvXjgiKqIUHVbbm0BfOC/USzZLLHG1ls27syuEg=;
        fh=igouC4lz1Ko9/Xp86cd8e5YYFWN0CmvRob3CC9oqgZo=;
        b=MBUFSs3QCesShELEivWp8IZPVq80d4Gr3DHHhqroRv47ImwttHwpTgFkKOLAcRt8Zp
         un6gSd+xdYk3HM85HnQBzkKBByqEY/Nk4rvl0new9qE5Aes8R2UAHnkWI9qns/U2KcRv
         MuFK18U0rY0rFKwNUxSHpEyLb5VstAbyo6hJA/Xpt08supcBioZE25eF5Oj+XB69VtSV
         0kH6JXAC9ojsOnc2KSaMnff8fnx9+hk2EoEiiREqoxSUxF9+LaBciKQbd9u22FnPUoAP
         mMkExlWE05XDKIa72vh8+EKc0YdaDt0bbIfXQAdN6rPJVr2dIdTZXNJFoDlADyuFilH2
         sJFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788278267; x=1788883067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RoXKQvXjgiKqIUHVbbm0BfOC/USzZLLHG1ls27syuEg=;
        b=oysREbCgArG9Y3QdTRV0lu/5KZOM2WIau1KDCEumHgDk3gLOJ/z0jlXzbDGzxY0t1I
         Ue8DrKosLC9MWoArQ7/CZVa4t57IUPm2m+fgKLmRtN39K4FH4WhXP/MvSItlEp3+TeNX
         c5p2SK/BUdAUFC3/hZi0nab3VYUSgmx1iL+hFaKVNrZ+qOnygjBonn8kPxs1yMayRd7e
         r+FeFb/UN1JfqWsDWvTNOGziqIHLWGeQLHyo3Q2pKawwZWywY4fAUYyCBh2mbdhhNGZ8
         EO1qgwzMHQcH619BXDQphsLlvL7J9iquH+/JkIqMVeVMxPeH9U+KIkZaiTRYnpLWSGfj
         8x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278267; x=1788883067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoXKQvXjgiKqIUHVbbm0BfOC/USzZLLHG1ls27syuEg=;
        b=tIozg/kfVpz+bsldth1IpzEuRuSfSFOUgv+JUHsAYX7P28pscBJEu6cab1hRyfEBxC
         U4pzPxWfmVT4BzK32/2/HxniRzcD960DOwVvKmcvWFJidDu051VoSx4tF/2htxVZ5q08
         3nJOeKoSwrXBSN8zCS3q7PlOTY6NUwJuOaZJ9a51IUxTQUDjgHl4F35B4vm/FaehBKmv
         spTqDc1J17KXYFExr3OJa3m0ZSW5/ooN5YcX07DlcqR+T18dsHleu0EuPuuqvV325sLw
         39+zMSeAZoiC2uGHCwv/tWjgC/tbU3BKWG1MASGuJ2LjD4Lv+PyFY/rdH7g0EV5BWZ7L
         Wrpw==
X-Forwarded-Encrypted: i=1; AHgh+RoJvwQZCMaFkAq7BV3RyPu0dh5+EMtNr/LXP3I8iVUZlHb6aasJBBvrLPJq3tjyXLUlVM0ozDHwYm5Zt7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nu5BR2U93bOhnW/ABWGXwOarWoRHhHnf/ebNMyDxqwyG5GJb1B
	aRXI4kbcco8QxnHtC+EZDXNIWSvo4/g2SfnRcPLqpOAmjpvQ4owygPMAw+TX0A269vHOAFSHFRV
	D2J3BespDg8wnnkHnccqXktd7gGkMABs=
X-Gm-Gg: AR+sD10jZo/zst1/f7zwyYk1UrpbBCwNaPuyG8PAfZXU6OTziWKRkDrCzkG6tPYHBYq
	zU84m/dKl7PZMDV2vbzzT1ng9sU5OWNMTFt8uuFMfjoAaGAnZ6jNIdvuaVCxjPaVYqvVJaYyTto
	nQWdZPZqk1PMHDFuYR4oLV6w8+nA50TsU+3x/U7t961D8f5trIC8XTln9UJoEzhfvB/SfXEmoyu
	fH9gRV/uM8VB3uQk57KxUo94uwVk1XeaCaREodVNwBqFRCQzvbbymmjFlEcuWtgxQ655xc+fhvU
	NsntCJrTr6t3O64Lhtu+HMT1JfEeYxwDV+Umvjw1cTDBWB13/FwpWVaay3LPrY68zhw8i4x75o0
	HRyY=
X-Received: by 2002:a05:6102:2b92:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78599051f0emr16194428137.10.1788278266962; Tue, 01 Sep 2026
 08:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788222001.git.mradityadash@gmail.com> <49b6e07395d2fe555e844758bd8ccf34ac0cbf0c.1788222001.git.mradityadash@gmail.com>
In-Reply-To: <49b6e07395d2fe555e844758bd8ccf34ac0cbf0c.1788222001.git.mradityadash@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 1 Sep 2026 08:57:33 -0700
X-Gm-Features: AcwNN1W0m4Ib34PML6CQ2EODgklRtSrXz623ENRC4RuSjDFoDzq1Hu4wP9yQ6VM
Message-ID: <CAFqHKT=7xMJAvTt3__6CtBiS2duGu6eoHq4FWiGONMvjFE2CtA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] HID: hid-lenovo-go: normalize calibration failure status
To: Aditya Dash <mradityadash@gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:36=E2=80=AFPM Aditya Dash <mradityadash@gmail.co=
m> wrote:
>
> The driver stores the firmware result byte as an index into the
> calibration status text. A Legion Go 1 returned 0x08 after an idle Stop.
> The status table has only three entries, so a later read returns -EINVAL.
>
> Keep the defined values 0x00 through 0x02. Treat larger result values as
> failure before storing them.

Hi Aditya,

The 0x08 thing seemed odd to me and I meant to dig into the docs sooner.
I think the real reason for the bug you were seeing is a mixup of what data
bytet means what. There is an off by 1 error with using data[1] since
device_type is really the 0 byte for the information payload. data[1] is th=
e
reason code for the failure.

From the docs:
Byte 0: Device Type:
    0x01: Gyroscope
    0x02: Joystick
    0x03: Trigger
    0x04: Joystick Trigger (Currently Unused)
Byte 1: Calibration Status:
    0x01: Calibration Successful
    0x02: Calibration Failed
Byte 2-3: Failure Reason:
Gyro:
    0x0001 - Not stationary, timeout
    0x0002 - Connection status changed
Joystick:
    0x0100 - Joystick not fully deflected
    0x0200 - Joystick not centered
    0x0400 - Joystick not rotated two turns
    0x0800 - Connection status changed
Trigger:
    0x0001 - Trigger not fully depressed
    0x0002 - Trigger not returned to starting position
    0x0004 - Trigger not pressed twice
    0x0008 - Connection status changed


Since we're matching on cmd_rep->device_type(byte 0 corollary) I think
switching to data[0] is sufficient to resolve the bug. If my hunch is
correct a trigger and gyro calibration will always succeed in the
driver as it stands. I won't be able to validate this myself for a
couple of hours on actual hardware, but I'll respond after I do.

Thanks,
Derek


> Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  drivers/hid/hid-lenovo-go.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
> index deed7acd2dc4..59b457683357 100644
> --- a/drivers/hid/hid-lenovo-go.c
> +++ b/drivers/hid/hid-lenovo-go.c
> @@ -648,17 +648,22 @@ static int hid_go_light_event(struct command_report=
 *cmd_rep)
>
>  static int hid_go_device_status_event(struct command_report *cmd_rep)
>  {
> +       u8 status =3D cmd_rep->data[1];
> +
> +       if (status > CAL_STAT_FAILURE)
> +               status =3D CAL_STAT_FAILURE;
> +
>         switch (cmd_rep->device_type) {
>         case LEFT_CONTROLLER:
>                 switch (cmd_rep->data[0]) {
>                 case CALDEV_GYROSCOPE:
> -                       drvdata.gp_left_gyro_cal_status =3D cmd_rep->data=
[1];
> +                       drvdata.gp_left_gyro_cal_status =3D status;
>                         return 0;
>                 case CALDEV_JOYSTICK:
> -                       drvdata.gp_left_joy_cal_status =3D cmd_rep->data[=
1];
> +                       drvdata.gp_left_joy_cal_status =3D status;
>                         return 0;
>                 case CALDEV_TRIGGER:
> -                       drvdata.gp_left_trigg_cal_status =3D cmd_rep->dat=
a[1];
> +                       drvdata.gp_left_trigg_cal_status =3D status;
>                         return 0;
>                 default:
>                         return -EINVAL;
> @@ -667,13 +672,13 @@ static int hid_go_device_status_event(struct comman=
d_report *cmd_rep)
>         case RIGHT_CONTROLLER:
>                 switch (cmd_rep->data[0]) {
>                 case CALDEV_GYROSCOPE:
> -                       drvdata.gp_right_gyro_cal_status =3D cmd_rep->dat=
a[1];
> +                       drvdata.gp_right_gyro_cal_status =3D status;
>                         return 0;
>                 case CALDEV_JOYSTICK:
> -                       drvdata.gp_right_joy_cal_status =3D cmd_rep->data=
[1];
> +                       drvdata.gp_right_joy_cal_status =3D status;
>                         return 0;
>                 case CALDEV_TRIGGER:
> -                       drvdata.gp_right_trigg_cal_status =3D cmd_rep->da=
ta[1];
> +                       drvdata.gp_right_trigg_cal_status =3D status;
>                         return 0;
>                 default:
>                         return -EINVAL;
> --
> 2.55.0
>
