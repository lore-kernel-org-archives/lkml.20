Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994542;
	b=vTAQC+XtpA3pDF9qzgxdauPj5vkHvcyetVHvj/trVeRaR08c+yT/Wav6DBXpI9nc66OK
	 NtRkvgpfRHsVzkefJ3ZY7zLG85tAOonheQSvUekovrucIdck4pv57N2jbI2qY5bZjhP81
	 W/Tgl04gc/P52G14NjvVUnWZ7Jzq2O+FNZBfXBmYQjd0h2Bd/PFIyofOXpxghqc4XqB5Q
	 RoANaWL8DGU8uO/GUhctY5yFMJnf/VxpYO+S34wOoBMFsxhVke5mvf7UzJ0G9C3crMl4g
	 gID9RtX4tgr0m5SSbLQNfs0arhEYiyTMMKqfmv5YnHwPuiTCfxnY6ZnDTFBAre5rXYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DbZu5q+W+xtqYiktZfPU34LNXZ8FfBPEek4cd/Iy6iY=;
	b=c8ywhFmdh6oZXMl+pdVDWc29ASvzSsY9f+hFDSTn2K8iDJqeP9r+yHBbnifmEhQOg/xq
	 JqwxoWIIcaqNyLFoVmwiullgyFQJasPiJCEjKl6N7wV8Q7e8v5UNk3Dd4v4NONZEO5LWh
	 jgZFWYbva+oAIoVNGyN7iWVZGgFZ++/FL0UwCjVJv/LExa5N/cJOWgUWi8lpCuLPU7/Ru
	 okMm1vX1Hsww0OClfkeD0etyfvisxRnSCORHm7LqzqJ+P0sN79dbyQZ8uDde1arSuPRfC
	 6YjmcCVVFe2TAU+Ez7nYrJOKdWDNI46cdnQCShNawQXh5RQt1yLv0SP3A4nSRYV/Grw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyPperED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F9606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wyPperED
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5364648ae07so9170531cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994541; cv=none;
        d=google.com; s=arc-20260327;
        b=g5HK6WAwB4wG4gG2hEA1spbJV+kwtEkK/2vMWAi4sEQwgeGU1w4fTsebGWOnDZJADH
         SSGELpd48tW3KB5oreLmjkw0z/hZyi9lUInYby7IUGaVcGmUrXuDQc+nSnATifIFT6zj
         KPXhjamJ0iOcRcZkJJTM4te82YFI2AlLIy8yJTKohN1UhytaPrNF35mvE8EOKoGwyUi0
         szSMjEv4OuF47gbA4OFf2kR9Zby6uQQv9GuEf2M91ddFthOPqlo4r9AvXd2KpPUHhB5q
         Gup9accEwLEy7HkkV/DTAaSWLOBhLLqrNrS0tNGgzeqwcD84O7+KZQm/mUPLwDT+C4/e
         HXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DbZu5q+W+xtqYiktZfPU34LNXZ8FfBPEek4cd/Iy6iY=;
        fh=43PtgCTu0ok7lKXp9BSpSspb5cXuKcRS+eEn0B7pbFI=;
        b=Vu91InL7ObY5u+SaLjy+uHIJ5E/ZJy0C4Bvtx2OOf6egzAZbfin0+44jwseoRjYuQ3
         yUnqcRMpoZFGgz3iMKXHRkcC3bPrS9VPsnVY8mruzkbDq49RRZZkYQmDsfl4DRdy8XFh
         3SaD7aT0zzdMpJw2bkdkegCp7i701ZOb0F7yop5AjOxQwjEoRVGU/vROIQMLxc5aci3a
         9wI+D9g3X40Xi30MtZB5v+47JIIkdXS5HXwqcUYxQ8VDxU2605Sdbc3gC+ieDvDfSlTi
         ZX5upVME2JSUhVOkGEnqvygC9ddkwvXZip0OD7H56aFBpJ0mh/+7kjqU7mDgCNaKQsx7
         xgiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994541; x=1794599341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbZu5q+W+xtqYiktZfPU34LNXZ8FfBPEek4cd/Iy6iY=;
        b=wyPperEDJFDS5ADQ8nuKsgHhpHE7PYSaU768vbWgKoHreydewdmho6uuzVeAienWkS
         /Yn0kyQMk0a2dfdx3CpmgxlEM7P3KliO1+hXpHPemuBw6uZthvK0K6E0NpGJdf2oQ0yT
         KVlxRUguqQtWBosSe2XX0crKRy0NPNvCnLgsPQWrURCxCYt4d8CgzO/lxjKESf8aIyWU
         9wJpLYrsCvMmYtIiOe7Rr+McCyHoIap5CjwpiRI/CbZTj6gt8vpNPj3kMgRQjtz+BWu/
         MtazFNqZ6mzCTGo+5m9IOYWmvtE55hAlfN8JXQ27ZUQHn9D1jXPpRDmPGctgcnW2+D3w
         2xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994541; x=1794599341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbZu5q+W+xtqYiktZfPU34LNXZ8FfBPEek4cd/Iy6iY=;
        b=YqX/3tFvQhb+8LfXvF4y/jwONsP3RgR8UfHrPOLuYcS9fptjENJwab0UW6a1mf7Yj3
         q6STCwgmNQ1B7/i4Wl3XWBeZ5bamzeU48H0vOB7WkVmMeZKrTgbQhlesO6ZDkHFa5j4P
         M2zXxCxX57IADWm/sKdtMx9TyZmd82PmNbBhPhxbvqFm2wMWwa0MVi/mAIzoaJlXaQDd
         dZuU1zVXBc259fPjrzA3LdTIjQE6BcskHuamJLtphfcmLQC6x40atjdmUIIoGOLs9qC3
         b4nnXwz1BYe9rTEqqGfVhQjxQFMS5ux2JnEumwqAOqZ+6eFirBNmrDp4fjbMzbhEX2DE
         1NFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTL45Fs894e52gJna1VhVy9o0DKk5ycf5DJYLS5ltARlcVm7QJH30hYNEKmcR1YszQMHLvks+GRSMFVCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ph0hglB+hzeG8DpG4rp9Pq6pIZrZdP+G3NL30hCZMGZrM8+kf
	++1QFo9M9ctVy0RgJCIVcaE3qJpmNvm3kyNY3PDbEf9IirSmNwq+HX/dBU5Hj8czQd3V/TisOVM
	k8rcej9tgrjLptc2LbppcYq16NASB6N4=
X-Gm-Gg: AYBFou3jEyUB96R3ukxlbFEG+xLT9V4E0FB7761OzlDhf5zqvg0w9GTRgVs2a1O8OQ8
	t6frM0Iw5tMerDow9/sj4nZ3tcav3pHTHUYnXm8VZRMswnPRTx+LF0GLOgXfHuKv7ujHjsAKGVI
	U4eTHppw+giXUM+hu+9Q8S4eWzPQV0Joz8RprctlS31ZEc0NTwhkCTB0pbV93PNxrwEj2RqJZ7B
	vjBMb5nIjRRMwz0HKo1S2GG/cQJxOXzumS1ox3cpZld0+955ZvoovN103OMXn6OVBKazaSNu4Av
	UL0EASt4Oc/XoR8+puMUhnkveNLsq6s9xqHSs1exlZTESz4/0h26MWxqaRJ2ufwce5W6ZZ95dTl
	iLzMW+K7n9MOkZKf1p/+GO8TsKKmBMAvpUEzG
X-Received: by 2002:a05:622a:5b08:b0:536:64c9:b1af with SMTP id
 d75a77b69052e-54e1329ad88mr53720801cf.24.1793994540966; Fri, 06 Nov 2026
 11:49:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260915041248.2432629-1-qwe.aldo@gmail.com> <20260915042546.2454238-1-qwe.aldo@gmail.com>
In-Reply-To: <20260915042546.2454238-1-qwe.aldo@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Fri, 6 Nov 2026 11:48:49 -0800
X-Gm-Features: AclHuK9iaJcHe9K1bRdtuipGjw8e3uQB2h1pAJywOj53Kvv9pWIoHDLbZ4NPWUE
Message-ID: <CANRwn3Tt0VguzG=_azEZAP8vfxr0BbyWj=Nu-R3a0TA1nNGqog@mail.gmail.com>
Subject: Re: [PATCH v2] HID: wacom: validate battery range before scaling
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 9:28=E2=80=AFPM Aldo Ariel Panzardo <qwe.aldo@gmail=
.com> wrote:
>
> Battery events divide by the difference between the logical maximum
> and minimum without validating the range.  A malformed HID descriptor
> with equal limits can therefore trigger a divide-by-zero exception.
>
> Move percentage conversion to a helper that widens the arithmetic,
> rejects non-positive ranges, and accounts for a nonzero logical
> minimum.  Clamp the result to [0, 100] instead of rejecting
> out-of-range values, so that real hardware whose ADC occasionally
> reports slightly beyond its declared limits still registers its
> battery and updates capacity normally.
>
> Fixes: 37d160193834 ("HID: wacom: generic: Scale battery capacity measure=
ments to percentages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

I realize this is *very* late, but (similar to the just-reviewed
sequence number patch) I'd like to request a version of this patch
that only addresses the divide-by-zero without introducing variable
widening. It is unlikely that the range of battery values would ever
exceed anything more than a very small fraction of __s32 so the
widening (and associated requirement to use div64_s64) feels very
unnecessary. Checking `if (range <=3D 0)` on an __s32 range should be
sufficient to catch overflowing and empty ranges. I think the
introduction of clamping is pretty reasonable as well and should be
kept in the v3.

Again, apologies for the delay---hopefully we'll (finally) get this merged =
soon!

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> ---
>
> Changes in v2:
>   - Clamp the computed percentage to [0, 100] instead of returning
>     false, so that slightly out-of-range ADC values do not prevent
>     battery registration (WACOM_QUIRK_BATTERY) or silently drop
>     updates.  Reported by Sashiko AI review.
>
>  drivers/hid/wacom_wac.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index da1f0ea85..XXXXXXX 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -7,6 +7,7 @@
>  #include "wacom.h"
>  #include <linux/input/mt.h>
>  #include <linux/jiffies.h>
> +#include <linux/math64.h>
>
>  /* resolution for penabled devices */
>  #define WACOM_PL_RES           20
> @@ -1937,6 +1938,22 @@ static void wacom_wac_battery_usage_mapping(struct=
 hid_device *hdev,
>         return;
>  }
>
> +static __s32 wacom_wac_battery_percentage(struct hid_field *field, __s32=
 value)
> +{
> +       s64 range =3D (s64)field->logical_maximum - field->logical_minimu=
m;
> +       s64 result;
> +
> +       if (range <=3D 0)
> +               return 0;
> +
> +       result =3D div64_s64(((s64)value - field->logical_minimum) * 100,
> +                          range);
> +
> +       return clamp_val(result, 0, 100);
> +}
> +
>  static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_=
field *field,
>                 struct hid_usage *usage, __s32 value)
>  {
> @@ -1950,7 +1967,8 @@ static void wacom_wac_battery_event(struct hid_devi=
ce *hdev, struct hid_field *f
>                         wacom_wac->hid_data.bat_status =3D POWER_SUPPLY_S=
TATUS_UNKNOWN;
>                 }
>                 else {
> -                       value =3D value * 100 / (field->logical_maximum -=
 field->logical_minimum);
> +                       value =3D wacom_wac_battery_percentage(field, val=
ue);
>                         wacom_wac->hid_data.battery_capacity =3D value;
>                         wacom_wac->hid_data.bat_connected =3D 1;
>                         wacom_wac->hid_data.bat_status =3D WACOM_POWER_SU=
PPLY_STATUS_AUTO;
> @@ -1958,7 +1976,8 @@ static void wacom_wac_battery_event(struct hid_devi=
ce *hdev, struct hid_field *f
>                 wacom_wac->features.quirks |=3D WACOM_QUIRK_BATTERY;
>                 break;
>         case WACOM_HID_WD_BATTERY_LEVEL:
> -               value =3D value * 100 / (field->logical_maximum - field->=
logical_minimum);
> +               value =3D wacom_wac_battery_percentage(field, value);
>                 wacom_wac->hid_data.battery_capacity =3D value;
>                 wacom_wac->hid_data.bat_connected =3D 1;
>                 wacom_wac->hid_data.bat_status =3D WACOM_POWER_SUPPLY_STA=
TUS_AUTO;
> --
> 2.43.0
>
