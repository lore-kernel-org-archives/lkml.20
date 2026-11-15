Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794722652;
	b=v/Fi6VU4slG6za5HwPyttLg7e2AQ2koiJWgNOCYgq1fhE51uLy17iYV6pVTwTqToUpqy
	 V0WeoFe0TeBn4ItfmimoW1JLR9xP0LpUO3nEDBlrtKZ3L7ykbrysjORFxn2pRrRmoRCpu
	 2xHxcKABC67KXGtEtM+rAOD64q1Q9MFOAVBUVxyRFwK+M+gZGLtGfwZ/JyEbQuG6GU3ji
	 44MEmKM6SZa1A2Qfz4B28zVkyRQikYtLGx61j1+B0BvzAKmb+5gpXmrzdKHpESoWomhx+
	 77QJ7onkc3ZPYAoTAUlK1dLSbxySBSfxBYnCs2dcI5hmnkEnu5gZQjEawwXKU8PMgqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mz1kAJtcE9B8LOkyAl2sbn7zB/+G+yFVxMc7DvFy8oE=;
	b=D/z4ZnLnm9k0OJry8+BxsXmdDUEjb4J7yhm0MdqWeBIuIy1OByiezhA4WqslRx6zTz16
	 p/p3x6cT3J+tyaF696CioKMntuc8IReUEwHkIccbJwolUhYAHS5pBb5YTSOM5WPjCabeq
	 QGOmat04n5h8CMwjBP1Z4h0o7NZwH6BuaGZgdxO2DfmjeCZ1oPVmkYWBLfrkpxRxgySGG
	 BcU6sBMl7oNhUKWhi+MxUcUxp4BcU3hiKqz3rP5d1W1BlB652vwUZK+uPtoVYUSaKz68C
	 L8f/y+tmEktuOYWXtzegFf62IB16w0UYIV54UhmS5jPntlvTb6Mlv5J72JONoQAa7CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwTo1dOP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6889606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6889606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwTo1dOP
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db35e7953so30543d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794722651; cv=none;
        d=google.com; s=arc-20260327;
        b=o2cnBlrahP97D1CBIAN+OXLotd9VvGhVDS7F6z1GjwcA69Ep9do5x8y8U9zrmcCpSo
         1lnEe1sWv5DEUduGzzOIu1+z2X9aSRtqgZPaV9C5cxqDg/BQAhxHEQeg1JxUQEPKvgvu
         AiWMhzbYBqFJRuZKppo83s4D+i5uEWxrQCZdwY8io/EdtqqsI83+FkDhAe7e6dJY62IH
         D8u1o6k0k/kOoyhlUzt7+8lh2GxG2ym1IEv5yBqbTVJ4jc5UABk+1GF4dsIuWNY8k7cq
         XDPRu1lWudDlDgDuozg8riZh6wkVGry4bSMEJAuSuRA970TR7+/m4Dbu0ZxAxBfmtzJH
         Nc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mz1kAJtcE9B8LOkyAl2sbn7zB/+G+yFVxMc7DvFy8oE=;
        fh=Z/34MBUVhF31Axjhf2LtRW/PvCk0oXqGeBnt0DpMxDY=;
        b=TgRJwJsC+gd+IX88Zh/HRZd0uBGRsQQgchzCcYSNZd4CsgKS3xBf+qKr0AfVb4jILg
         uXIPW4JwXOLPq0qn7LI7HSk6hqFFWROULaGTRgpyNFNo9d36z5vl+aog6Fv3vpTF5EBq
         wcCNNXBlvzxTo3gsnoHVAKhAaunA1ysjvq5dNGBH19bCqCDQxb0TurH/tzksD4qNN89o
         2YB70D97C+SYb/nlAS+DjMDyd7DqTeW+SjowJBrjNyEyPnoEFKjA2Pmfj6I8I0gJl4BY
         LgedL/D+fDqPvgbvHKkDWBydYp7teSh8Ca82BxYi5wKifkO1rOMpZzhCTggY1h4Cru/Y
         wltw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794722651; x=1795327451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mz1kAJtcE9B8LOkyAl2sbn7zB/+G+yFVxMc7DvFy8oE=;
        b=WwTo1dOPG3HAplFkJfIhsd1pODUUp5tYZVNAmdXSjX5BP7QxQrVF2GkB8JaavETuVZ
         Cs8qfKJZLyVioBuJinB7xDv5ru8ic0cKJkx3jeB3To4+YYQEnRuUSuZvk9XmuUkO24c5
         A0qf0PpnqSuRKnoUhZwipmBu/caC5eTWfKNOic34O8j2OOX95ryVqprH+XkR0xt8RSCy
         h4BBAd7rtP35J4TDeGM98JKHUL69ZWaqO3r8u6Lyjz6RJcomFjL6mZ97R/ztOXzVD6cb
         SSQeI3HWAt5SmSxs+gDRD6ehvzWf8WA4BBSTR+MceMM57cnv1Vwo3eTb5QZGNOTFAQ2I
         Ab7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722651; x=1795327451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mz1kAJtcE9B8LOkyAl2sbn7zB/+G+yFVxMc7DvFy8oE=;
        b=c8mcnYDTxnWTO936sDBBdY1R+BSpsn8C+To1Vy4bvTP5otd8LQHQrpCIqovxE6dYHA
         3HZM8Mh8GasNGc3HIowi7lYLfSSDwtST833bmQtYz7u9wO6MIo2jpmKm2tevO3wtH0iS
         EWACfqOVm8Ud0y7Bcu5p1VmdQeBeTsYnxyaeEDkDAjAyMcTpMc+EtHamgiiFbJibPYYq
         4LEHCEp2S37dXJiPLjpzryes5cc5nQHLOaHejhxnez+ic+9fH4OapLIsN7O/TOaiRvrw
         FlQz2V8898adF5dIiDEfOtJ75+FfqSUGYJ3gztYI7tIHCYP+7v2HAbYouliiH9ubWAX/
         c/Wg==
X-Forwarded-Encrypted: i=1; AL+hErE1H2O3XGSKbQRmCD48zO6U+9APS9HJ8kvnDwvd4TbhRkDI+eb363hmg987FKBZRf+7x91wevXxksLjKvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RYsjmazpqw0op+4ssKF1sQ/nz6/w5w10yWCfjDNgdv3J/fwc6
	dB5sUVpJbP+YnRiMaoL+vdo5o6xY5JxqdSFo+zFY0yH7jsx9CTPu1D3gdnz9EoWd3ydMv6iIXUf
	NzyjlKxeNhdWKy9HL4XAz55IuZuXeYdE=
X-Gm-Gg: AYBFou1H6RPv5E5VeyTJShpb3k8b6VnPI/3I3eVbgKvHNG4YnFjOJW+/tqMBbP2gSob
	b6hUlwwkRJhSSa6H3Gd35pwPpUL3VGeMgjmtGJhoj5KC4HVTSoZa3RBugGzI60zItpcgFuOHKP+
	C5IyBUn3lTWeIfBHGPmI017FLD5sWdwfEbfx3FJoWXNdmTr6Z8w05nbnViMHrpqbC5jW+1bIA70
	sVk79RsnyliUYVBY8y7Ad+zn+zDZPjh4gT9vmpPxTaUngFPl9GsEMtodezL/j2/DPX1+jjRX3ct
	7jg8YgBREFvzpxa4LvUGboVJYSz0XHivs25m/HrPyzeDhddLVjcjiJoNizGphjVb7J3DgqljB1s
	HRUraOPsOiiXrLYTSDXTGM5sT7RBGv9KTeVxPauZj3cYjjm+mlvtkEpPrIvxmMxenxeCXEnpW
X-Received: by 2002:a05:690e:191d:b0:679:a4a5:10c1 with SMTP id
 956f58d0204a3-67d895e4469mr3762944d50.22.1794722650778; Sat, 14 Nov 2026
 22:04:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105174252.36714-1-asiyee994@gmail.com> <CAK77STDQ+BDPJfxyewHDzf2VNkekV2dRapF-STmXyMazvxOyEQ@mail.gmail.com>
In-Reply-To: <CAK77STDQ+BDPJfxyewHDzf2VNkekV2dRapF-STmXyMazvxOyEQ@mail.gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Sun, 15 Nov 2026 09:03:59 +0300
X-Gm-Features: AclHuK8s7kcRdIJ5mKwyLkOQyC5hxOv9HUsAnO_5mMHENqcGe_ARIu_bxvqKarw
Message-ID: <CAK77STCSUrjQUBsAM40GTPZ0URxwVVwc-YeRioMmAW3VYOseFg@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Preserve class quirks when inverting orientation
To: jikos@kernel.org
Cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, Benjamin,

Just a gentle ping on this patch.

Thanks,
Muhammed


Asiye Sar=C4=B1y=C4=B1ld=C4=B1z <asiyee994@gmail.com>, 15 Kas 2026 Paz, 09:=
01
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi Jiri, Benjamin,
>
> Just a gentle ping on this patch.
>
> Thanks,
> Muhammed
>
> Muhammed Sariyildiz <asiyee994@gmail.com>, 5 Kas 2026 Per, 20:43 tarihind=
e =C5=9Funu yazd=C4=B1:
>>
>> When exactly one coordinate axis is inverted, mt_probe() replaces the
>> device class quirks with MT_QUIRK_ORIENTATION_INVERT. This drops all
>> quirks selected for the device class. Applications created later
>> inherit the truncated quirk mask, which can break device-specific
>> contact handling.
>>
>> Add the orientation quirk instead of replacing the existing mask.
>>
>> Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
>> ---
>>  drivers/hid/hid-multitouch.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
>> index 4e19a0c..94e83fc 100644
>> --- a/drivers/hid/hid-multitouch.c
>> +++ b/drivers/hid/hid-multitouch.c
>> @@ -2155,7 +2155,7 @@ static int mt_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
>>         if (hdev->quirks & (HID_QUIRK_X_INVERT | HID_QUIRK_Y_INVERT) &&
>>             !((hdev->quirks & HID_QUIRK_X_INVERT)
>>               && (hdev->quirks & HID_QUIRK_Y_INVERT)))
>> -               td->mtclass.quirks =3D MT_QUIRK_ORIENTATION_INVERT;
>> +               td->mtclass.quirks |=3D MT_QUIRK_ORIENTATION_INVERT;
>>
>>         /* This allows the driver to correctly support devices
>>          * that emit events over several HID messages.
>> --
>> 2.47.3
>>
