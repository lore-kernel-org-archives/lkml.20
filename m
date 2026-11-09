Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247938;
	b=gNlCFUZUmQFLCMBqF+PsGmhxhKnejEdRgN4swyBNJDpT52qtS5cwKEWL+ufBPBAzLJVr
	 kvXoGKLOJr0mbvaDazWlnIsisGqdeJT3s0qdxRgR+l0Bj2QFmIvZYn1D/T/L8cLIdpt0W
	 3+apn++wjxtUDGJVm0GQMeF3+gxSIYpS7Bd3aFprVZV2mSC5iILybWWqu9vS/a0j9HLZJ
	 41Wl3BUHcJYSGdMCE1bHr+bk/CjDzpRpN0nNAb+xweTE/Bxk7sED5BhjTUVvtyjNeWQpc
	 nNUfEW3qrs8B4AIpW9icBkHjHvx9uW28eVkRjwmXGr6YtBRMdvVsNNktqg3UrsZCZkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nDGAaQ8TMvgUEB9dx62M0e9zR6BoUuJi2I6t8Mao9/4=;
	b=SWnmuJhoNBvnkvCmapjHpY5TESRTP3OKH0RUt4ARVrjCsC7vgbnVyTk9/ZW0np4NgEba
	 S0s8pCuC6iNlqis531iiDj2CRMHPwlocRI8G8dHm6B6U+r9zV4/Wsmk0awvnBftZJgI8V
	 +Sma7mrz/hyOTCMtZneLJYwDpceK68numlodEi2ph5eWURi2tqlb972QPMLrT8JdyrcCp
	 2mixdjJEFci7phs4Kv/HFTuKc96NXMa7xRY2EpzVl/BYhYRwGweYGwZU5wvfvPUL2s4G0
	 nWSfjXzJkt6KC//++U8N8ZLu+aRFlcyterAtkOfXdV26ZEYq4I65kaQ5f6S70hqlwfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYFkyAo2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYFkyAo2
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5495d549924so12243431cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794247937; cv=none;
        d=google.com; s=arc-20260327;
        b=lv8zTiaYRF/vJZQdO2/TWSN18Sz4MAPA3g2SoQwf//xVynWFT0IjQhdDZ2CxbPX7Is
         kAglITsUWqTLHAQjNabezzZ6JxgYxHizS12mzTBtD2qPzd76B1+2u+6MH7m32BmNlbkc
         NrKJLIs0q2okz9gfaifMuMBHUaeRg9MpfCXwhTtiN/4cuYZZqFmi4xRnw69bZtho3L8g
         7Ex+9Q1nd9dgAguzvwHK01DiChFIuraK/oo2reQEIWgHlWPZs0PrCuEKicwsxZHtM5VC
         ytoEzVGgnnrHFSdJwFshL4m6kr9m5mm5dPbqkqR11tr4ErGqD7UQrCGGICk9XAAg+khm
         hiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nDGAaQ8TMvgUEB9dx62M0e9zR6BoUuJi2I6t8Mao9/4=;
        fh=66f7LcLG55HaJ186MvGnUVMA1vElxYsi/yMfa+QezGo=;
        b=TNP44bTMRCTFD9HIdoVykxXZlYhO4vv0E8evjgHIVl7uB1SIK2BtFL1wDnsPlrQVd3
         z4R9XL5Fby2DnTGzxR4CwE86XeMkZH7KnErw6JbxWFDDJhEEK+83AV7CfAsTrQ0NsB+Q
         v1jN1lp2WdOkp6Rw3z1CDq1VSJAylNxtCaIoNP3x9xa2PAPQULff19hVXpKe19jRpywj
         EZ7PvwYHylJCKih+uEzRpzGNzGTd3XSTQdlGYtUZC0/BGjstSWC2o/xgY0aGsHru4KR2
         XQL+86p3Z+KUh3HDo8FrtXXzBbZ0vTzd2jRQ48wQ7CneJrcwu+HvRboLHycvw7FZ4wUM
         1N3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794247937; x=1794852737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDGAaQ8TMvgUEB9dx62M0e9zR6BoUuJi2I6t8Mao9/4=;
        b=jYFkyAo2Kyv2q9G/ATbzjr2YhaIdcEZRAXQnEn6SRzTaE9eL4W/QVLk5jZ5iVUllLh
         sYQpHzdVFPcAeb7sNiviahcxwgzZqBYK3Dttm0ze5X/GLlwEO3MVErU7GpImiwh6V14M
         0sG6ZP5EYXHy4zMDL4TLnqC78Qk2iCOnbM8uBRjli+FCmeYoTKhrKmtbXH7nDSBDaLlc
         08F+Jf22vhVTOO062d+btL/der7gis/haSuX2fHGNNwOkqcbzjiWgTbVYroaRAL4f66o
         n7su4+HNqq6ukX1N0EikxdtggPHkmUa2xOgiMRuTdNuqbbpmcy5QQXPA44Ox3LC/lTZe
         F06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247937; x=1794852737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDGAaQ8TMvgUEB9dx62M0e9zR6BoUuJi2I6t8Mao9/4=;
        b=p24eeQsLFkb9AINkS0UyehSLVaLf9BjmwnFgdfT1jQ987gcFigIXxCbV5IOgbrnfqk
         3YOlcaqXjXb9y5TdTD4/TSjKTO7yjOYiK1FEX42X8JpC8hYDLjYH74IyXp3/zvCzWpuQ
         FJH3WmPbrpSdSkKMWKpr+f1sBtmnW4xHxvSsnn3r4QybhLvzf7wMzn42UUOKGKbf1E8k
         bmWwFlmP9u+HNOH40M3MDUOGRK3BAOOWZg7XOJ1F1uZosUg+mu9Lotn8v39mzJBKMFBy
         UGVCIIfFSAJQfQsZwzyoi+NlSqYpXT2F3T3z1mIzbdz21x/9GYdMM3n4MgcowlOcmPWZ
         bffA==
X-Forwarded-Encrypted: i=1; AL+hErEk7BXVxadQakKeGaDLTwovWhhvGM01hc3BFpX+mihlXLmOW92vGIk2t6ckwevWguteK00IRciaZDs039M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QyBUtRIKcK+4NU6L5SI8FDCmFbDbdvWWbq5/bxYLhH6W4ghe1
	dHi1GGkVf4OPTDMsEYslXakxQj9YlmFCqv2ZBWs/ASqX3OpUsmXGDo66TuQWcAicHdWhQnX8K8q
	VSl/9rpCdcQFCrhkvJf99TPNzxUyaZjs=
X-Gm-Gg: AYBFou2Tiq0kAox4vZ1hHUapNlk02AmkxzG8x5/vAQmN+Ub3fcLA1TWCumOF4EMWFvv
	YiiWbKxpi/EFvxVw7M2bIqv4wSAncB0YkpkAv1QiWgWZWxvmTfHDMGQrl//JUohj4dCl8+Wdeqk
	r5u+WWgDrVan7tIlCxnyQQpaGTmOn33knorYSZ47/BNY2mRtFo9xP9kFRQ/SFuLRynctHELvefI
	iVm/fhw4Penvu3fiaHDwPKbQfuWlvz9LGyUmyac3tJTFirZea/UL/zxWgsy38UYVIxvLaHJBPmZ
	QpF71IpRWyRD28zfjDqSnjOk9kYDRb7z5Q3PLWWA3qDjoUIqBTBidn3/iYMW+xVNCkTxQon4Ddv
	8NWQq8vl5ZqYahldWns1C+lOQ09hHhbzB7oNM
X-Received: by 2002:ac8:5a49:0:b0:536:6c87:ebdd with SMTP id
 d75a77b69052e-55527133c46mr2041511cf.14.1794247937229; Mon, 09 Nov 2026
 10:12:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106213526.3393779-1-qwe.aldo@gmail.com> <20261107012636.1008932-1-qwe.aldo@gmail.com>
In-Reply-To: <20261107012636.1008932-1-qwe.aldo@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Mon, 9 Nov 2026 10:12:05 -0800
X-Gm-Features: AclHuK_GFmi3iEIOGHod7r7_OlLsZDYJCh5KSeGDmqGi69z7Emf7p-xajIEWGmY
Message-ID: <CANRwn3Rt_zT5jwCvgbC1J-V1EUzLKKqDC+aDrgt=y1HkzpzYuQ@mail.gmail.com>
Subject: Re: [PATCH v4] HID: wacom: validate battery range before scaling
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:26=E2=80=AFPM Aldo Ariel Panzardo <qwe.aldo@gmail.=
com> wrote:
>
> Battery events divide by the difference between the logical maximum
> and minimum without validating the range.  A malformed HID descriptor
> with equal limits can therefore trigger a divide-by-zero exception.
>
> Move percentage conversion to a helper that rejects non-positive
> ranges and accounts for a nonzero logical minimum.  Clamp the result
> to [0, 100] as an additional safeguard against out-of-range
> percentages.
>
> Fixes: 37d160193834 ("HID: wacom: generic: Scale battery capacity measure=
ments to percentages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

LGTM

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

> ---
>
> Changes in v4:
> - Reword commit message: describe clamp as a defensive safeguard
>   rather than claiming it handles a specific ADC scenario.  The
>   caller already filters out-of-range values.  Code unchanged.
>
> Changes in v3:
> - Drop s64 widening and div64_s64 as requested by Jason Gerecke.
>   Use __s32 range with a <=3D 0 guard instead. Keep the clamping.
>
> Changes in v2:
> - Clamp the computed percentage to [0, 100] instead of returning
>   false, so that slightly out-of-range ADC values do not prevent
>   battery registration or silently drop updates.
>
>  drivers/hid/wacom_wac.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 361738b..36bab07 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -1960,6 +1960,16 @@ static void wacom_wac_battery_usage_mapping(struct=
 hid_device *hdev,
>         return;
>  }
>
> +static __s32 wacom_wac_battery_percentage(struct hid_field *field, __s32=
 value)
> +{
> +       __s32 range =3D field->logical_maximum - field->logical_minimum;
> +
> +       if (range <=3D 0)
> +               return 0;
> +
> +       return clamp_val((value - field->logical_minimum) * 100 / range, =
0, 100);
> +}
> +
>  static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_=
field *field,
>                 struct hid_usage *usage, __s32 value)
>  {
> @@ -1973,7 +1983,7 @@ static void wacom_wac_battery_event(struct hid_devi=
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
> @@ -1981,7 +1991,7 @@ static void wacom_wac_battery_event(struct hid_devi=
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
> 2.53.0
>
