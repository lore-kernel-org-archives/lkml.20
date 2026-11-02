Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623272;
	b=nWwn+DZuoBfWVN1FCW9KbUaYm5nFOFDLqxokUvn0fJJ4PmKodowoOc/W6rqNQlVkUFBn
	 lhNLcux2MET2htp2IuksJvik1H4tX8vJffT8uPSamUcvsoclQGc7olq5k+szDyFr+ogVE
	 kWBywZKuSgnvG8/e9rW/O+1h2pMSXF64WXIe7Yhj+2YnGK3XShG8gH7ErOxfYFUiODaPx
	 7/arzBT15H/CEFr5urfLM+4sx9JY75Ax018Pc/Jz5u9WOrGDuIxKkFC+773psyigUWj/Y
	 a0rJ77+7400ywwKK1rz36Fbk4VmvUZQVlp5tq89vqjY1cGB6FmWM4FYqa02dv2ipNlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3y/yQ7bOSsnHyylDSSSE8FXmnqPmwJGFAWCe0iH8E60=;
	b=dAEjjRfXoiG6zPVXrXTdVyObQF/KbzmQkA+O0IHIxOlkAullkLWfxzBuDwmfZGHuE99p
	 R69963cELiZUE5wIcB3PvY0ZFXW/TkLmYp6Qfg0TCAgQzDgEUQ61uliCtCJEhD6fvuN5+
	 eVQdQoQPXG4wsaL8dpzl+gDC+jZ92nIrXGWkcrE94RnGubkvGvYyMc9XiGT3HIF4bl5WT
	 ROexANCo2a8muNh9RUaZJYxprM0HFJcCnhbaPvR36TMmWR0dflX6nxBPFTPY8PlBSMdbF
	 Ql1mFXIlP0ijuzIlI/EU4rfcyOUSpL8+TABd0eFRWZnDmkr9G1fPaN43pd87ivph2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZ7kANyX;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A029D606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A029D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OZ7kANyX
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso17870695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793623271; x=1794228071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y/yQ7bOSsnHyylDSSSE8FXmnqPmwJGFAWCe0iH8E60=;
        b=OZ7kANyX+gh+ZCIjQsgnhe7nx3gX9Fh3lyOa7ONLFUUfV8lyszPtzgNuMOLH2GCL26
         XOfLEQyMwSWT77lFZDeVyc3pQlQVwLSE6T2l79ZLouxgzoNHEG+CXGp60d7DYZJNJFH2
         svbBZ3goM0LJbd++DgAY7TKHnp9VMJ27p0QNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623271; x=1794228071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y/yQ7bOSsnHyylDSSSE8FXmnqPmwJGFAWCe0iH8E60=;
        b=TIj5u+moVmIBwiIGqSExmqRFhEqSoKArdpHYKcyDNC8o1xvFEl9LI/jsf2FymjciWp
         vv6C3cDBoMsEHPD2vp2Onp8+8qLWXF/LWHtcBMkvQOh/8EP9IhEQz6n8ksfGGNrUxjuB
         FHo11wVuH4xnLfxk1hKAoS1vek1LsuAuWGXhfyVUa8FbqwKiiONy4irTlzkDPtt/JVoY
         p23I8TJx5K6HbB2QxacRqAlttbzZ11N9FClJMkf5cVhV6LZERB6WLPz6Saxk1dQ13yXE
         DMy6XUDCGGvuSvpDyOj0Li5k45UgvyTHaGLkafgphJFyFrL7HkMdSi/Zpr8JNel/gem5
         075Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxZ5q3J4pEX5GhgaMdh0UZRgqiwzFEbIxTW0g4UDvHqI+WcYG1vkAs5+LQDClxY6wXNg3bt818ExtIlN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nc42Qzdzm0g6R4WSlbaxpj9wVvxNFsf6ya5zx+2/hOGiM+kKc
	uSJmNzWPRoMLP7f+yp5dzWZS5LjECXqxLlxslyKrRRJxQ7oH6+ICg9HJwrLRdhKP5gI65lWRO6p
	IkLI8uA==
X-Gm-Gg: AYBFou2Ysjx1WaXlKRbc8/KjQla+1AGfvOx85eqg6cmSNjhXFtlf0lETQRP+mwevN7O
	z+wl7vA4KY+M793Kd+Q9vU46Q2L3oqSS2spx662w34MfHhjDHWO+vb0e7vBHQgF6ib3svnhrNDY
	7QOpbiPbrxacRX673tCukoIwf8JiXEjLOtYf1OmVYrXFxbDiYKAtbEZ+zsc4Hf8BRqfBMI1hy3N
	BRCyc+Ox8lmLdwCHxgGUQrNIscB9z224i1VUJJnZ9rjJJpLRwTrABvsHBdY71DrNQDqXZSatML3
	8JvOKOC71Y3SH/ezVlQ540QgIOwLMkiSKoG9t/PD3EqpErx94MG79f6YhhE7lyrRdQTYYebF9VD
	moQ41+CNGFv2YDDd11zL5WG1m2jKjXMtPoXOmowMnY9E1EdhfnoLQnyP7+G9awT1Xr+Okyi24sE
	IZ0alYx2Q8P6w1bRg3STEkDYJprAvjWIIIgT92ZojRCyPwjbYRsGyyG6wxDNd2otGbt8FVtEXF3
	/bIBJJS+7qifBWZNe2TVMwFwITGLCN/8rGlfpsYdRveTpS2luWzCzRewnThO7Vi0VA6W+Sex3tX
	iaFB1c7HGPPSHGsLl1ZSLHEqYjpfl2+NAjd+jiWOiAap/LOCYYOFb/FUTdqc8H0r
X-Received: by 2002:a17:903:2442:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2eb364149fcmr92568865ad.3.1793623270949;
        Mon, 02 Nov 2026 04:41:10 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39262c47sm27346935ad.38.2026.11.02.04.41.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:41:10 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so3591182c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:41:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjQn6WkDp4Oq8RZF1RC5f9hMjlF3XhJR6tmKqGRlNKZtxKM4UOGxf4XW28uvyZHgzwToMHfikgYHcTPZ0=@vger.kernel.org
X-Received: by 2002:a05:701a:c907:b0:16a:1fa:58cb with SMTP id
 a92af1059eb24-1ac56d95460mr14461485c88.1.1793623268480; Mon, 02 Nov 2026
 04:41:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org>
In-Reply-To: <20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Nov 2026 13:40:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCs1qyOpv=W-F-94skQm4o-Aj9d0PbL7xr5qtdtLjWQ7vg@mail.gmail.com>
X-Gm-Features: AclHuK_jasd6nzcnp46dLaPaUwH7gcY2wdNBwqnJpio47XI4ra-_IDB-wFb6mZo
Message-ID: <CANiDSCs1qyOpv=W-F-94skQm4o-Aj9d0PbL7xr5qtdtLjWQ7vg@mail.gmail.com>
Subject: Re: [PATCH] HID: Merge duplicated documentation for Lenovo Legion
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly ping...

On Mon, 31 Aug 2026 at 13:12, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Lenovo Legion Go and Lenovo Legion Go S share some definitions. Merge the=
m in
> sysfs-driver-hid-lenovo-go to avoid this warning:
>
> WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: ./=
Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; ./Documentation/A=
BI/testing/sysfs-driver-hid-lenovo-go-s:234
> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 ti=
mes: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Document=
ation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2=
 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Docum=
entation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
> [WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface =
num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is def=
ined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; .=
/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>
> Cc: stable@vger.kernel.org
> Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go drivers=
")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../ABI/testing/sysfs-driver-hid-lenovo-go         | 11 +++----
>  .../ABI/testing/sysfs-driver-hid-lenovo-go-s       | 35 ----------------=
------
>  2 files changed, 6 insertions(+), 40 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Docum=
entation/ABI/testing/sysfs-driver-hid-lenovo-go
> index c8221373ef76..f3ba3504939d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
> @@ -364,11 +364,12 @@ Description:      This displays the available optio=
ns for the mode attribute.
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
>  Date:          April 2026
>  Contact:       linux-input@vger.kernel.org
> -Description:   This controls the behavior of built in chord combinations=
.
> +Description:   This controls the behavior of built-in chord combinations=
.
> +               For the Legion Go S, this controls the touchpad's operati=
ng mode.
>
>                 Values are windows or linux.
>
> -               Applies to Lenovo Legion Go and Go 2 line of handheld dev=
ices.
> +               Applies to Lenovo Legion Go, Go 2, and Go S line of handh=
eld devices.
>
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
>  Date:          April 2026
> @@ -377,7 +378,7 @@ Description:        This displays the available optio=
ns for the os_mode attribute.
>
>                 Values are windows or linux.
>
> -               Applies to Lenovo Legion Go and Go 2 line of handheld dev=
ices.
> +               Applies to Lenovo Legion Go, Go 2, and Go S line of handh=
eld devices.
>
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
>  Date:          April 2026
> @@ -640,7 +641,7 @@ Description:        This controls enabling or disabli=
ng the touchpad.
>
>                 Values are true, false.
>
> -               Applies to Lenovo Legion Go and Go 2 line of handheld dev=
ices.
> +               Applies to Lenovo Legion Go, Go 2, and Go S line of handh=
eld devices.
>
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
>  Date:          April 2026
> @@ -649,7 +650,7 @@ Description:        This displays the available optio=
ns for the touchpad/enabled attrib
>
>                 Values are true, false.
>
> -               Applies to Lenovo Legion Go and Go 2 line of handheld dev=
ices.
> +               Applies to Lenovo Legion Go, Go 2, and Go S line of handh=
eld devices.
>
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enab=
led
>  Date:          April 2026
> diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Doc=
umentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> index 4d317074bb7e..218164cfe544 100644
> --- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> +++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
> @@ -231,41 +231,6 @@ Description:       This displays the available optio=
ns for the mouse/step attribute.
>
>                 Applies to Lenovo Legion Go S line of handheld devices.
>
> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
> -Date:          April 2026
> -Contact:       linux-input@vger.kernel.org
> -Description:   This controls which value is used for the touchpads opera=
ting mode.
> -
> -               Values are windows or linux.
> -
> -               Applies to Lenovo Legion Go S line of handheld devices.
> -
> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
> -Date:          April 2026
> -Contact:       linux-input@vger.kernel.org
> -Description:   This displays the available options for the os_mode attri=
bute.
> -
> -               Values are windows or linux.
> -
> -               Applies to Lenovo Legion Go S line of handheld devices.
> -
> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
> -Date:          April 2026
> -Contact:       linux-input@vger.kernel.org
> -Description:   This controls enabling or disabling the built-in touchpad=
.
> -
> -               Values are true or false.
> -
> -               Applies to Lenovo Legion Go S line of handheld devices.
> -
> -What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
> -Date:          April 2026
> -Contact:       linux-input@vger.kernel.org
> -Description:   This displays the available options for the touchpad/enab=
led attribute.
> -
> -               Values are true or false.
> -
> -               Applies to Lenovo Legion Go S line of handheld devices.
>
>  What:          /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<inte=
rface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
>  Date:          April 2026
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-lenovo-go-7b4ec4bf0cd5
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


--=20
Ricardo Ribalda
