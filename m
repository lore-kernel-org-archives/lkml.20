Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294740;
	b=l5Z36p2kLAQAatvNRWUnozK5+CYQJW88HMH2tB35tmdhpfq3iGdGmKdUtTuDFdlHBVaW
	 GyyK/7Wu7IrwPXG0ya3icFnz4+meNyxlsod8smP4C6lOvvJaMbyZBgdq6Pfuz4q2TY7s8
	 +J8rHNS1g2KwXj7icCU7sIR1lT4s9VeP60meH0DLQsMDMAdz/u8b4hB/GF9z3seQiBpJy
	 CFdbY89avDoxQfbjXMXVqaq362xMdcUFxG8Z+q6DOiRiX2Hqi0r5wdoUg1CoCzutg9Dez
	 W46c+LnWC7WBpSDZbKdvQSAVt5Nh8xkqNqfvs1CW2TIoQfJa92aJwNKV29BpRwRozyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
	b=zsJN6LpTHfJOjm1ol/2cVkXlff7N2yScBWMcGiOOl9sHLTNsd8sngbshDA79m2NR2caq
	 Pe8lQjTW4ROoaxxdCLJXGOAIB9iVnRVhtbziTtF78uj4nHxLYn+qiCwf5kOhvgSOEqL9g
	 +XXRQ2qYp0Ro3JUjzR0oMjwxqPY9N0RWP1yKbgdR2QrNGln8yWV89BP8UcDxMxD58ME7B
	 C9MNujOWhKAgubqrxyNJ8GgyeL1sBE08jadZHKJeck3469NRietHN7KjmAHm66Q2koTeg
	 qPw27aNN9/rc8UIJFEiQXBWENHETRvWWIiIe2Roh0ENgei5zQ38Ip89LFWjyDOg8RnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="fbla/A9X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B36C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=fbla/A9X
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d190so1363252d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294739; cv=none;
        d=google.com; s=arc-20260327;
        b=r2eZTuciJBoSFQbQj3QRCLry8qAW/RbYJ8o5Wkv3kOvTJvpCJozbs9QeRpQbaKu1M+
         ecN7V4osUae6tsf6g+ar7I4Sr8sz9Plz9o2GrG3e/8XYvKBDvdkpU+UHCjdSsaIBmNBE
         pOlqky2Aty/14/9UztpA5vqVeFys/zWx+8KPcvb4gHDJxXiAcSrr8/GuJQB21vDMwTln
         63+UcJP9X4zRnES/IKw+P2hrvJR/aj8QBctxbY7NbTSiNzCMhc2YyA5iTJfAvHL+kcfc
         CWpB7cT7UK1k1OdzlXqjUUUgwqivgtaT0uVBz4YeP+AIGHV9VWkkx/1xwbfGoTg4zrhi
         /k9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        fh=raW3JzEikTIx2pT/jmnffVmFw6gCaANKQCHcrALkTLo=;
        b=hG4mZKKCSQBZt0v14V2/VXnIVdVON17aN02CrbfFd3o8S3s6K/LzX8UGaDqky18EKT
         8zkkzPH5tw2cV7ULUt+yKqmvgBmFXZyig5/wh/VuHkh7cLKNFnKH3by6YQPOwJs7lzBd
         SmRzfcleMPBnPYK6cK3oM7YIV4D6XS5OIIz2a4H2zwXwMGV6rgY0sJbjy9oUN/G97qWC
         fBU0nutLFx3tuXlw/mqYXo9NS0JO1y81vm4Csl7q0mXMWkFCSZYXoCydLAiMhvyUElUX
         sfw3ezs516/AVO/pH6udE5wh6ZeZlYSkvqm9hUDjdUpPxiaBVZ8fdY62Xw6dHvsKOH9l
         FXQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294739; x=1794899539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=fbla/A9XlF/lOq2bcG6iZJPCqOGC/emuDCdTn1krs+v0qAsMuaTyS80O3LxALZZmIb
         xjDBtyT5AkLFFP1fIRpXPJDwqGMFDo8KvTpFSfFW9kBZyhqqE+r6kjNTvb4m48XHzmar
         vDoxjsCGVnyLYnPDthxKh0nVIe+czDQ9Rx/E1sc4mzTpy07fjkputPxJk2GI45wlZV3y
         7muQnqIgNYGyAiny0chTZlUz5JSMyzsE7WbaSY8NqcuHN4Ucm8uMe2C/MVMKu+xgghP5
         Aoi2rVgCbW2QSyRxNa55wznfOwYZv64/7fGeGjO5sZ9Vgv7uAXur6s7ubM9VZMUCTPHZ
         EOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294739; x=1794899539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=ngu/RIzh+oW3smN/cWlFOQxB6+m5vMlGEKJ+DnDfsTDoYHbQvJr/QAjMm6ue4hZXnv
         QMEIWnkMU0zbYTAKdkbWUoBex+IVVNJbGFJoTHKQzCReZoEKM1iD5m6rWj6gjjW90Mpp
         b1pAXKbUIVGGtevUgCCiPNVbLxMBSG8tNFJrN/aVNqf9YrSuFghaGVs35/tcwnGq5oPE
         H5MNxc5PJW/fMRxSkisM3usuKYJBugQMf2IF5glmLmGMFczzWAcMCF/R/X0s7BnB0Ef6
         j2MLGY7I4xxSfECPNsEyTaJsE5hzQXQ0ZmR2eo7sj0VLn2rX2hp3chmjykTR1468+/rP
         TQxw==
X-Forwarded-Encrypted: i=1; AL+hErGpJd9StCh6BpBrpDnkeMmQCxQZH/XtAUbEpII1Vk6PnKlgxiG4rA/s7YrnMIuzn8NSyc5zPG9SNFNUCdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kw7T4/AgzI9p7gDFMCpHD++fV9r+KGLpy7XS3/l8YPbCiDfqv
	lfINIbFo0FcLfE9OldrMLYtizosQeUhDq7zDGSNelkRrXqSBURSJ6fiFV9eIo8RQUzLFWcq22PS
	3kCuA5NMcFWbXia6PNH+CkxlMkhlavJ8=
X-Gm-Gg: AYBFou0zkCNvbhD37SNHt6BfseoTfqM83Qhx6CpeisoNhEst9mo5eOayNHhY08dhSHg
	EMjl7nsk/EGVwUoqjTQl9X11HcT1VGKClSX5t5IsWsULF2OPKmfLk0GQtJsQBSfJ6bmG75/IU+Z
	NdGN2IEbcPiPm1fVy0tTNp7ShvxmF5Fg1mg8+GZWQwDRQCic4drlLTGvIAMX4P6adcpeWAY2s32
	PZKZk2ZqijEYCWAlP7iDuS9y++95WaOX4wZsMdllU9bs50ord6Le7Qk+Yil5Ujyqvb0VGKumjMm
	8qlOsB015UNQYhtQESpsR3c40O9CO9+6+h5bGsQynvT+qUhT942ttUT9OOk2Saz4he1CshgjpLO
	C9gV8lDb53kXMWjEwV++d4qgwgmpfLPcIhWZu
X-Received: by 2002:a05:690e:c81:b0:679:96af:e306 with SMTP id
 956f58d0204a3-67c568269e8mr1104943d50.56.1794294739207; Mon, 09 Nov 2026
 23:12:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:12:07 +0100
X-Gm-Features: AclHuK-NNQu1JbIxB1uGpolHVv_SmZbveDQeysJSYIv9CiWjgRe7D4MXv9gg7C8
Message-ID: <CAFBinCD5aQ_AsNxELgUd5yzXsghUVQg1tuGtVvF-bmPx+AjaUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake
 the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system from
> s2idle, where only Linux interrupts can wake the CPUs.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> This does not affect suspend to RAM on boards whose firmware watches
> the IR receiver itself while the SoC is down, as on S4 where BL31 wakes
> the board on the remote's power key.
>
> Tested on an S905W2 board in s2idle: the power key on the remote wakes
> it; with wakeup disabled for the receiver it does not.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
