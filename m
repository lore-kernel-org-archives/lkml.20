Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417186;
	b=R47kIVEOZn14w37VWQFojjS6ley/Tl+JvvRMPkChddAp5sA6pxYDsJaYLgy5ktXnapj2
	 n807cXwqpHySd8MnDQ7r11vaBHA/xkLijg1SLfNMkl0HRM65NKiLTidJV4irmuxTpq2fD
	 d/Izzgwqw6yLy6QMICSLja745HOHvAqyUwV0u4xt/0vfT9ICLRE5yDvGPI8LrXzhtWa0u
	 xC2ChL+pLQ7xUkQQOXrCnhXe4hX4repbEKRCS15Akzg7pYbIGTeRxbfsTyPcZuSEtbuHV
	 yR08iv6yU0a8OIUSvm/wZLaXGWwuEr3/uVjc533yFpm+/jgbSJgg8xrs5TG7RFOPB/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
	b=rlNnnLRnpb0YrfUeyaZOKgUVebSMfZWRmkeRjC+3aQbtFFmPcxQGC30WAmansNcMg3zC
	 aKJinoP7C+axcDSajCHTWKjX3qu0T49veV752Gb2Uifzom3jsHjgAGdcfHR5y6gTwC4jI
	 AshoO5FooC6ac56M9aQIIzRkwzVbFfGPQWZCywKOx5ODr5g4cRk+MsHfLTag6hCz/4bWG
	 CK9zl5X50Q4umYc6zvj0uEXcmE5a6rMgV7YL4WvaNJJOZNvuzWGi4oaMzuOx/TtfCgy1W
	 qendJKRIcwuBYFZBTcSYoyRZ0eAgFf3vPCfisD4vcJaSxrqaIm7Yevyrw9uFNgJIQSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awi2vbah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA081606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA081606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awi2vbah
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3367252c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417185; cv=none;
        d=google.com; s=arc-20260327;
        b=Jo5k8iFfT3pLGh1XOn+SMA/YZhxoqpczEf5T3PynPxQt5Xzk7IO+uiXdM4yv9SBcOg
         MPqc7A9XL9A20SDOtJ/nSNEOEu7k1nDrEj6ToD6lqcdT/zNKvq2N1ScMoqoa+YdgGGSg
         YeVheYWLHRJB8A0eHBDxHg/rhlnI9f2PgEkhj0AeeDbNm9mbAqm2Bx+msS2sjehIxgdX
         z+uyDeobvv3vkO4VnN+qjHDmwH6PQkfK/G0VLMG0k2IO2Gk23KA6tRJY+XRTAVwm+lhx
         36PQJ1UKvVC7Z7G9LwcDzuk5vJIFXtZX9QlrI/PHtj4uLVD9sq/Kjfmj/V37RnT8Z0CQ
         YUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        fh=0GfbcuVe6E4bbGhL2KClbiI8esnCkGY8su1+mDjWZrE=;
        b=TcYhHoGdg04TxS4Hzur+EgBgLSFALghJr7khx2DWeaJUTU6AVHE/96s0qRP1QhEKHi
         f5DEmJF2B9HEi1E+FvuX3d0fUN5mJglVbEvReyFOzBk8QBwKkGW30wFSazEaEwsBZy4I
         /D6lmaYsE6D2SDNIRLZblg/hfRfCAGS6IW7u5SaMBxpSgIFJjgjb5YG7HMrPHQblwpKZ
         95WdNXhFmAofiEnTuElRVp1CyVhk7UfgbZ9ivNekd4WY5RQh8aLZC1GKBVC7pNBk04hf
         goRFbWA3sk7FQlmxvyjOzrb+anfLORHRYioDD28+GRGy58tyMM+ZK3W8j3YxIoddWMhs
         cfiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417185; x=1795021985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        b=awi2vbah/fEYbEew3ocu4Kr0L919KYfWpbxLouCV/e615bMYCzISXGeOWYz7B6gePb
         yQrWkaqFkHFbbuHi627ZaEqgYAFDuBHkx6et7OAGvQgJle0ZWS9wBgndAowm1XcpEduh
         EwfqcAQGmKXb7jGpzl5h4bazn3z5sTLo8xBGct7Q2R0uHNZZgYJ0zJ0EA718ymD6aNpz
         JqD2cmqADltIvyO1vM76YMDJ+SLDV8clFlKYzWvTfm/QbwHABYl23F5bifqc5Yf3bzdO
         AYJ6Ykaa7hj3WHDIukHU3xxBiWHtVWOYCk8qzrGt+iLjDVj8wl5+ca6iFdF7jmTkcGUE
         dC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417185; x=1795021985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        b=1hM1q18LgxWKldzGG+zdrlAH9sFMqprvUPb1zskYo5muYQWdxkaFUI8DKdcRc+0AzZ
         0Xc9wkZRi5At8Q4FiZLniKwEsVO1cYn8rVVu4m2qp4kLl3BpCVSUJfT4l/VCr3iE8IzP
         RE65eR7UXy8x5P9M/opw9eQHMZCiG6r7O+VQBTd4BZcZPik/qUnJdORTAGJSAS36QvQA
         Ar1E3WXRQHjlymKkiVcpRGWxPyGfN6hzIzOKC4ZChWTqc0VIrDYM1qq37siwC11Gh71X
         xhXNgJLCFO84btuGs0IzINgzDi4Fs4B54ANZOm+6HtDj5SQYxiaCdvrKDT927EyVQ30g
         L/Lg==
X-Forwarded-Encrypted: i=1; AL+hErEjHW7z8VUx0KmGm4GlW48P1ffLtAsuMDjQyGgpx5zazBbLnm1aC1Irtl1WecJpfwJij0XnVfBgfDSMX20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mcB/zlss0YL3yOzwKrA/KWcs92c4p8tYzsuCmwtGvk7M9H5VZ
	jG8O3UJr535De9mCyjWsOCtTvfNyA8C2sHbhSIPBI5qTxh/S30lQzXtQH3r1Rs89RYc9Nu8x2GE
	TpHL1g9DiwcBvK+axCNXsmG6mGimpJOI=
X-Gm-Gg: AYBFou0pbEZlSyATbmU97GiNL32nPSGGZAN6YYOpHzr/jEWrwsQ3QAhwtlSG36pikRA
	o8cWV4TtgxIEKGXPofje3bojzzds++Ja7L76M/872dTPZajL8UlTWW+s7Oy/P+lbnq+jPIM8fcQ
	kK6S4F9Z971PxsJeo7ckq30v+o3274SkMQgrRrN3V7fr8wlGZ/0diPm9R/iFJGeD8U4C0BqBT/I
	VwVO3h/wicq/SjLBTgdX/B+gGyEVJyluWu/RIGej1Hwn9u/QiWfO1zEC+3JMP0yUG2msWXMuPdJ
	/Qn8c1iKyt9cUV+8q97tL4wTdUmix+5weAxKDANJKTLgqn9qrYM3OeOeWM0DBYw7TSP04RSU2iw
	PPfSTYRRfLshLiruL2DlFKvb9lFH02ZyirsNM
X-Received: by 2002:a05:7022:3a86:b0:1b3:a22e:b74d with SMTP id
 a92af1059eb24-1b3c035d23cmr2829705c88.34.1794417184690; Wed, 11 Nov 2026
 09:13:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com> <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe>
In-Reply-To: <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Wed, 11 Nov 2026 14:12:53 -0300
X-Gm-Features: AclHuK_9AFdIKIxS-VE0HiqvOtlNnIyPwpjp_Fu-O7VtOD5InbSvkib5r35zrYc
Message-ID: <CAPKD0HfHuv4vKWeff_uhGxXosuU279qB+kkmXNPXJYL2kxFR2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

Thanks for the review. I'll fix the rest in v3, but before I go on with
it I would like to hear from you on these.

On Wed, 2026-11-11 at 20:09 +0800, Rong Zhang wrote:
> On Tue, 2026-11-10 at 20:29 +0000, Ciro Pedrini via B4 Relay wrote:
> > Its hardware brightness, 0..9, is stored in the controller and applies to
> > every LED of the machine (keys, front strip, rear vents, lid logo).
>
> I don't know if it's appropriate to represent so many things with the
> name "legion::kbd_backlight".

I gave splitting it some thought, and looked (with the help of an LLM)
at how other drivers handle this. We could register one LED per zone,
but that seems to be usually rejected, because they would not be
independent: the controller has a single brightness for all zones, so
writing any of them would change all of them.

Per-zone control is only possible through the LampArray (c193). It has
319 lamps, each with its own colour, and they are grouped by zone (keys,
front strip, rear vents, lid logo), so a LampArray driver could light
or dim each zone on its own. That needs c197 to hand the LEDs over
first, as discussed in the other thread.

Also, going with kbd_backlight seems like a good idea so that UPower
and the desktops pick it up automatically.

Thoughts? I'd like a confirmation from someone who knows how this is
usually handled in Linux, as I don't have much experience with it.

> Just curious, can the software select which effect to use, or listen to
> an event when Fn+Space is pressed?

Yes. 0xCA reads the current effect and 0xC8 sets it. On Fn+Space the
controller sends report 5 as 05 01 P (P = the new effect), then
05 02 B (B = the brightness).

> I wonder, what if we set the report with a short report size, say,
> struct_size(msg, params, len)? Could the device handle it properly in
> this case? If so, there is a chance that we don't need to sleep for 100ms
> later (I guess the device is processing too much data, causing the
> massive delay).

You were right. I tried it on the laptop: it takes the short request,
and it only ever answers 5 bytes anyway, even when asked for 960. The
answer is there right away, I read it with delays from 100 ms down to 0
and it was always correct. So a brightness read goes from ~115 ms to
~2 ms.

Setting the brightness with a short request works too, and reading it
right after returns the new value.

In v3 I'll send and read short reports and drop the msleep().

> Ditto, what if we get the report with struct_size(msg, params, 1)?

Same, that works.

Thanks,
Ciro
