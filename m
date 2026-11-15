Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794711057;
	b=hYhz0Ky4ExRlsJPuYdnUEV2mfHMZnl2FqytGEqrZSQkJywHxNEiEGeoLVW8et/AaIGYW
	 7555fsJYw/bm5wk9C1XbuugE9YxpPVvG1OD0RL5+9gEV3gPnlBcVBsgOHCSVFx+Iz9wFx
	 3CO0pmkHrxhGxYrGxMLnlI+0bCRTF7PdtwCQUZcYgWrAvrm1XhFk+19X53j2wYjU4bW44
	 aEeQZcEiLcJP/TlCanYwjTmXKH2/+KKOg6U2Syt/NUGVZKAcEv4lk52ooM4G4/keLpihH
	 qVW27LcfDRksBMYXPu6CqJ8Ce7ve4iuzkyp/xk0Xc+ewOxp2t+rWr0NZzQBZYbm8i5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
	b=jnQlIyO09NtmpwW0hCIjnK89tODC/3K54OibqH9xb8jqbLplnFaD6MEQ4uP9eIUawD2i
	 xF/0GRfGcstDrWiktE2Nn+XoiDMsGKqOlkuVY5l4iUjZwod9Aza3etDXOHCQY5OQGC7my
	 BWGlOyj0jRYyydLJ61O658gJlA8/+d4RCPPeyfW1bchrQwfg1jH4a1sfUj9LJtqD3+MIl
	 fl9Os6J3B3Aqh0MxDNX+k8A/Z1xEyJIv1CZpfaimR9Y8EmzC1oTeaAzQnPbNSpiE9f0ej
	 awjhxok+ByzPzDzfdiKpeWDLTID5+Ed7OYMOu4b9LEM3c++IKomw4BFG8KxPgeXy56g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5;
	arc=fail smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19B606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A19B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3YL84B5
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adff684a52so26992081fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794711056; cv=none;
        d=google.com; s=arc-20260327;
        b=p7rBViuluc5tOdMMVZ1xoJGagCYevJ4ExvV7jX9QYnjz38ooCcuBo8cxX+kbmKPBTC
         7fTLEIy2hB5Qq6KPNTJ1C+m6VadEiJj8hyiGfaBTmuBt+ehkGx5Bod7PvIcrqQgSqmvG
         Wvevrb86DEvvPmG1DH4d1SOPNMwresr/L1W9kwtwsSYDzPQrUIghzt5ME8ijAZiDnGdb
         IAzIeAr7vZtZXB9mjO/6RijQsce/VHZIvS3IUmcjuWHFVtIE4fW07s5o1oyOOw/EOBoK
         i3lFGVtqatlJmlGSMWWuPr0a4zhwoOnUfSbJEUky7ug1IkPjkj2LnltmLlcbr1ZJ5jL2
         mNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        fh=ctfnUj9VNq5+G9z5fR4qROuL653GEp+8P5YiKYuSD2E=;
        b=b09+bdHrwB3/P8aavV3/pCRLnGEgJPCDIF32pE22D9vLwO0WSSqsTgIfs6IIhyOI8s
         2YP9a1u/VPx3u/VPzsN3uVXeNB3G4j0+crYPLy0EWjvyCMJ3FxlToCHZpP+Fdvy4m5aJ
         6mkEJoYVHLG/3jquPb7zs2iIju+no6jzr75EAffQfG4j4WzlfhsXWVXOrUPOQV6OqDdL
         N852DYH6FkfWqC5nP06KHgsrwAzl9ggIzGhn3jMwrfO3gTPK4Pkw6zAc5AbF7FKxtpeJ
         CUR0yiIXxO7RgHdZxw4NCN3JBtN0d6bKcZpR4IbxDaatiC2KlvomziVcbg9NaPerdYNS
         9PhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711056; x=1795315856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=C3YL84B5AdvG1vULn8iIHu0VOFFhm8wHMS7GIQReErW5xay/xayGeFR2v08rTSLBHg
         s0D5TfL77gY8I94LYeTsFZ992NL+FrL0HWYEWfoEgohVgSQWYiMOJI1Q0gXgjnELGusG
         yxGe1vxxfx5tEGjZ42nNjhQFu17xAWNFif3Zt759/IlE1SQWPCM5e2ohCHekYZ4bsB1V
         n3pG0iYYk3h1AJhj2x4Ieuyy4fcS5ftmtqComvfDS76iK4MnePo4uty6tbbuhU6daKVT
         rxRNMxf1URagtGlMtyv0/DBqu6w02chfXl3qI1cxbSPefPUuGOIIT8LkwnouANQ+pQk6
         B1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711056; x=1795315856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8DaGQKhtDEoI1MBNX5hHcCd5cxhj/+80fP7TfFs+sc=;
        b=cZLsQjI8eTU3DjbQo6DhUcuZfKHZ56J6rHP6y/DSzTkHmhiEYNXR6rVVw/ypcV8oGb
         5/NihhR7E2DJ6CL6cogc51MlbscMmtSSEj7m3Zkar5NHfRX7hnwWAC33cf3KYbTCjUPs
         TSJH55hhipOkh5C74Ya9I/k+mYyE5FZg1fSEfkhy8ltGD2bw40SmbCdV9YdvtWZRsffT
         oV1kcIrBPFrqfvhrncs/7vMk2LhrmhHqEZqykSulhyeQzvRFdWyyHgyI8hA9qtzWjd03
         QU408muNq9K8I2tZYHZY5mZ48BP+sApPBS6RlKpLMIqoNvzufRDWH4FyLLL1eS05Zb/S
         nHVA==
X-Forwarded-Encrypted: i=1; AL+hErFB7kp0/bq7QJKlA49l6de5X2lyQ0QwSdlHceU5FmtlJkunt4S7kMKQH7DI2yYK9Sl0k8+DHMIpCpBpDdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1x7nhUG2AFq7wHkvrggkXv3GQTnMYOifQsqqkiXSccQNvb7Xz
	gXN+l//vt7nrlu99sEmDd5SVnqTBGNsiF+zezDq42v1QdKpp6PnC/E56nBDHQC6yh+YYazm/LhX
	h8R0V0lgX551+0foKYz9Jk0+77XnChUk=
X-Gm-Gg: AYBFou2Ma4JlUJ1/89mUnfk90Amo8nopXTMjvcoHxbKgAjqvjW/2LDaLOK4ClDBL6T1
	8ed+v3O9ogSVEbWCaTc5MMpH+F33bcIUgplTrJsVZQsoQl8wMV1CvD1CON5Ze9kJnDRcsuXjCCC
	q1EsRirTLQZv1YM+hfli6wUJFP60spzHR/omi+vo+wo5zsDQRWN/TpZ6rHhK0ywk+AaRIlRptlD
	uyyrJH91lI9y+xhobMQje0UtVun5eKdKU0Hoz9WBmeIQhlklQEzbRkWMwsJ8qbYu2BDob8ZCo0L
	8NNgyhP/weVSQDwb2HIYXi+NDd9/L09M091wvabbbSG98/LCsN23/RgpYvgEfJf+S5NjFIdyW75
	khmSRWPx3wkDtRAZaimRNUk5xCEA+J/OoxACITfgOPSJW6mjs6OpCcFihhl286f2rtrIhF8yVJN
	NeZSqc5zMx7mDN2MknKwrIhzhdzw0dpUTm6rdW0E15+w==
X-Received: by 2002:a2e:9a14:0:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3ae2b5244eemr16617881fa.12.1794711055318; Sat, 14 Nov 2026
 18:50:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-5-890328e4b7e5@gmail.com> <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
In-Reply-To: <e8ffe364-5c98-4987-b6bd-c263122aeae8@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:50:43 -0500
X-Gm-Features: AclHuK-sqqPXlIQFX4lO3FN1NrvQTjfvTZhocvr9YoyjI16C5qy2nZEmwXZkKgs
Message-ID: <CAEdQ38GEckm8oU9pmg_t-_EC85brP4ghWAE4tYBNEvF+gcqMKA@mail.gmail.com>
Subject: Re: [PATCH 5/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:00=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>> +``temp[1-*]_max_alarm``     Sensor is in the warning or fault state
>
> "fault": Sensor is broken.
> "max_alarm": Temperature is too high.
>
> That is distincly different. A faulty sensor should not be reported
> as "temperature too high".

My wording was the problem here, sorry. "Fault" was my name for what
the firmware calls the Failure state, and it does not mean the sensor is
broken. The AlphaServer Management Utility user guide [1] (section 3.16)
says the firmware keeps a warning limit and a failure limit for each
fan, voltage and temperature sensor, and puts the sensor in the Warning
or Failure state when a reading meets or exceeds the matching limit.
The status byte in the console's packet only says OK, Warning, Failure,
Unknown or Not present (Table B-1 of the same guide), so a broken
sensor cannot be told apart from a bad reading at all.

For temperatures, v2 reports Warning as temp_max_alarm and Failure as
temp_max_alarm plus temp_crit_alarm, with temp_max and temp_crit being
the warning and failure limits. Nothing is reported as a fault.

>> +``fan[1-*]_min_alarm``      Fan is in the warning or fault state
>
> This is wrong since there is also a separate fault attribute,
> and "fault" means defective, not "speed too low".

A fan in the Failure state has slowed to its failure limit, and the
firmware treats it as a failed fan (a drawer is powered off for having
too few running fans). v2 reports Warning as fan_min_alarm and Failure
as fan_min_alarm plus fan_fault. If you would rather keep fan_fault for
something else, I can report Failure as fan_min_alarm only, but then
nothing in sysfs separates a slow fan from a stopped one.

>> +``in[0-*]_alarm``           Sensor is in the warning or fault state
>
> Which one is it ? Is it distinct ? A "fault" means
> that the hardware is broken/defective. An alarm means that
> the voltage is too high or too low. A faulty channel
> should not be reported as alarm but as fault.

It is always the voltage being out of range: Warning is the reading
outside the warning limits (5% from nominal), Failure outside the
failure limits (10%). Both are reported as in_alarm in v2. The limits
are not in the console's packet, so they are not exported.

>> +``power[1-*]_alarm``        Power supply is in the warning or fault sta=
te
>
> "power" is supposed to report the system power, not
> a "power supply warning or fault state". If there is
> nothing else, this should be identical to the matching
> inX_alarm and/or inX_fault attribute.

There is nothing else: the firmware reports a supply only as OK or
Failure, with no reading. Failure means the supply itself has failed
(lost AC, power not OK, supply fail, over temperature or fan), so v2
reports each supply as an in channel with only in_fault and in_label.

I'll send v2 tomorrow.

Thanks a bunch for the review!
Matt

[1] https://ftp.zx.net.nz/pub/archive/ftp.digital.com/pub/DEC/Alpha/firmwar=
e/interim/ams/releases/Version_5_2_0/ams-user-guide.pdf
