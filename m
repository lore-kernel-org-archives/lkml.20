Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629383;
	b=hMVVB/YqEhdGzYhn0gYu9iNZzXT09VH88e5MAxEtAzPAGdwDvKJD5FZWNzgomlX70toz
	 CHiQwuwMWlR8VQXNSzSkL2RkIPLkx60ppvUml5PpQ2REuZf4u2BXj0ccFNyN9X0RPGaYT
	 QqQLLKzocBL7CdPQj+M5vxtOZl4UWfd0H0Dm0dyzmy4ryeQtwyMZpFStRgncnV4qWzDIS
	 EHB44C7uaILgUPIWq+RoZGCaiWREF5pBrszpZSGGfOg66L9i3Yiub9a9t6oruYh2qert7
	 koTVtpIw62dfcYIvWzLc0zEWe+4vOszZhEB+gChqJ6fIAAHDz8GcwLVu2BCc2g28qOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2eoSP0yEoTlChnuRvtczHJcCT/7hM/Jtun8ZUxsvjQg=;
	b=SIr66R6xwQtaQ+wK9chLvWYpIeato8f2qeTjgZ3ZLkoa+eVfaINPsfzTV1oBl+DLmCjV
	 ydHayWF47KvS0l+w0Iu0lL1db2ackDSze+jCIxpUayDvS15lXxQM6yh24tkrV9QEZ/2SD
	 Z1e058rBy0h13IGoInaVtDOCrjahB66p4WX0AXIV7hQouxWcBqZfODSuK9cqMWPqNS7SD
	 tIY5vbkeBkju/NrObaZIqNOZgW5TX8yCkwV+ScF9SxT6UENwQ6hfakzlX7JYeI9C/B1Ut
	 hXUMsZrw4O910I4Yv06TY+JRBhfuD4z/gCblsk+Rvad24CViJczuONlXLo7AqWNbj+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5x7qIGW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3560A2614
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C3560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5x7qIGW
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c1f548f87so54428126d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629382; cv=none;
        d=google.com; s=arc-20260327;
        b=dLxjC0lR1wM73ge+v9MIhBv/BJlZeHOs44ZBbZvlaJl1mK6xO+W03DAaxpgMiG7lxA
         uhfqowHw2gLuAZ6rcgL8PvZEXpLkdz1zDwrkCeVcXSAuao7BgYFO87mChS2LIdN0FZ95
         IXI8q1rpuvY1z7/UaCxMYxVXRPd/ukkyomVVBMBG/GnOog4GOLgfO5vqnRytOOcUmh3z
         AA9XdNlI1qGi/Cafi1p8EQrqAxjlBAVvFP1Dlshgn0AT/3VHQPTMKgP8gEqCiGlMwrLT
         4ZosyQ7e1tOA0HxIAcbmkYfBB8je5zEkENgnlxpfpXSZO4ziAhnvmgZ2+pIxH7hBL4wy
         bfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2eoSP0yEoTlChnuRvtczHJcCT/7hM/Jtun8ZUxsvjQg=;
        fh=Dsj1R8oZ/37xGKsF011n7xTUqBBq/qGEE3Q4zwNzdEY=;
        b=qRZVleCZjJGtsD0/VuyX0lbTaHDVpSJBnYGK+1ell8OJwWM7zNgJ31jAT1YnDwL5Of
         1MQS4B4WagrMD0SaGibQjcEY7Vjh+wb3vIMozFIzcMgrcfoMFdCO7euRXqvAl8GkOmFG
         rqhsGIeFlfMOaHWBaAQdjcDlYkNhOBaQh/ZbPKkCzRrvbuLiy5PVDA3zxeSSqAYHV8yr
         MNtEFROl6HIXQzPkDy/7YlE/tHqgouXpMz2uK++tnspqfY5pCfal+T8ngBLX6rvKdGBM
         oN6TVZodph9L6GgQOE8j2vRCnPnVEKYk8+1tMNQJDOhSIwZZ2B63oXau48zR7scgFBbo
         cM8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629382; x=1794234182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2eoSP0yEoTlChnuRvtczHJcCT/7hM/Jtun8ZUxsvjQg=;
        b=I5x7qIGWTsAsfBWf71taDZbRlUUaYCG2iAGsyK7dWndyX8PF0VEktAOe3+XdQMCNnn
         TBZ3rZmTyRKlBo8mXiaPVVz2takyoI4yGmsQNCJDi0waYa6MRwyO0xsSXwTVHPpcLHrQ
         EuF+Z5O316PvlCsze993jBk6PNZ752f4/PHaiYLawgqLEUCIcOxRmSmWKtO1gycmyzBn
         oWjstQPbA8hAo9iAh8ZoQFDFflZp+sobMnmGafMi45kKM8djdRbnhuTD1rltWlU7wajg
         pBBV5sSGs1bGdhsHE0xQn6zYU3qRBgkrKAiAruouuTLmMJZud4rfXYd8JP4Af18wYrhP
         Kh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629382; x=1794234182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eoSP0yEoTlChnuRvtczHJcCT/7hM/Jtun8ZUxsvjQg=;
        b=oJsYSxsmhLd7QhmIRu2KCF82bFB7XU5dV/GFfJZW9ji1ZQiG2YICqejybDpnuUseFb
         MObm6/dFSgpQlGLthYT0polNeMFwGl8QvECRqVuy00L+A2jmw+SMqAIvRo1Y2HA8iQHN
         jd2xV6Xw87pn+8hOmQWBDihYKIIgZtgwAG7973fNlCVpyqndfFgDz6qpisbUQiuqVB+5
         bY9NFPzkD0bl8LZ+LCgAEwJtux2G/a4vXJDFaZo1RZHvs6MQqkr2OWrq5te/W0eqi91l
         ZOd98ErvqLhkkuIokm5Wre9zOhL+trQoc/7SHs3kEy0WQ3V/wrBqdyYSHe8+lSPBKSvZ
         aJAg==
X-Forwarded-Encrypted: i=1; AKwUvBxBLYj+z8HFoKWf2WHHMhFlzh6Dm4L4ukuWvX3GJ+6/6WKl9AB11hur78vS1XcGotFZ8/Wn7H5JxixR8X4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WeKJ9vqKzBPtc6nTfdreZn5UGNPkTwjWYv8fZ/zkb9YJ8yrR4
	zeb5o3inxXYmmn7OHIztzVV0xfvLMArLLzdpexaiC4ZtokH2LWBkSJ5d1vzzaY4YOovTpn5Ig6X
	8OP/ocXJkJnI+bFgx65bWwF7+WiPeyWM=
X-Gm-Gg: AYBFou0VaWQvSyGDNYPpWXPeePbxoT9TrcOVYFZbUbbol+RCvPUyUYEh5Gi/c4I6OOQ
	OkHSKXFZrUfDWK4JV5vcXJYyUDfDbLeiEmN3g80pMUGT0rIADODs85oGCG1fZsvew77FsgaqOjA
	SlC0Fc+rRA/neuSYlAzvbKIpvAZJgACblg8A6EXdzroZsyZzESYLgBljb/y3ctR9Z1n6MHID6IS
	/WxFFf5w1jRccM+RaYVlJZC4kA/n4CM6ahHpDWHAA+GQAHZNWG3QbuNCmWyPUVB5RW4sdiHiP8G
	C13vizS9MYdyhHKRXO1tUEFLj8v3Gh6BgqrBRKHQgpL0vG5RbyxiEIyMpWgQ0VbqPgVPaFQMvX4
	jW038j/4olGtdcNdSSjv/D+DqcI+udd1QeJyDdw==
X-Received: by 2002:a05:6214:1252:b0:917:7d92:6486 with SMTP id
 6a1803df08f44-91ca4a0c511mr173181156d6.6.1793629381607; Mon, 02 Nov 2026
 06:23:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260824184019.432703-1-max@enpas.org>
In-Reply-To: <20260824184019.432703-1-max@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 2 Nov 2026 06:22:50 -0800
X-Gm-Features: AclHuK-al9_fk_gWf3tmNtTa80C7h_iFVOnR-naeSMTklj7rwoY_cjC4_EB5wQY
Message-ID: <CAEc3jaD8W0CZ+V06c=S2V8oR+UwFVKd8KGbtNhzBm7Gv5XnM8w@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND] Input: joydev: Don't expose DualSense motion
 sensors as jsX
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

This looks good to me. It was an oversight from when hid-playstation
was added to not add the filter to joydev.

Signed-off-by: roderick.colenbrander@sony.com

Thanks,
Roderick Colenbrander

On Mon, Aug 24, 2026 at 11:43=E2=80=AFAM Max Staudt <max@enpas.org> wrote:
>
> Without this, DualSense (PS5) gamepads are allocated a second jsX
> device for their gyroscope/accelerometer, confusing programs such as
> /lib/udev/js-set-enum-leds which look at jsX device numbers to
> determine the player number. Ideally, we should have only one jsX
> device per gamepad.
>
> This follows the schema started by:
>   commit 20ac95d52a28 ("Input: joydev - blacklist ds3/ds4/udraw motion se=
nsors")
>
> Fixes: 402987c5d98a ("HID: playstation: add DualSense accelerometer and g=
yroscope support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Staudt <max@enpas.org>
> ---
>  drivers/input/joydev.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index 32459fd8a7c1..f49dd10782f0 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -753,6 +753,8 @@ static void joydev_cleanup(struct joydev *joydev)
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER              0x05c4
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2            0x09cc
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE       0x0ba0
> +#define USB_DEVICE_ID_SONY_PS5_CONTROLLER              0x0ce6
> +#define USB_DEVICE_ID_SONY_PS5_CONTROLLER_2            0x0df2
>
>  #define USB_VENDOR_ID_THQ                      0x20d6
>  #define USB_DEVICE_ID_THQ_PS3_UDRAW                    0xcb17
> @@ -793,6 +795,8 @@ static const struct input_device_id joydev_blacklist[=
] =3D {
>         ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER),
>         ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2=
),
>         ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_D=
ONGLE),
> +       ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER),
> +       ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2=
),
>         ACCEL_DEV(USB_VENDOR_ID_THQ, USB_DEVICE_ID_THQ_PS3_UDRAW),
>         ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_PROCON),
>         ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_CHRGGRIP=
),
> --
> 2.47.3
>
>
