Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418059;
	b=f4RjWJD4GLI4QJDYStQo68hQqa3RvXW+YB6YD8VMujWxj2PXUxHFTzgsahk6pzLuewDq
	 /ImyGEbmpfe67lHwFfo1yeY6aasv0YMJM5XJpz75Nu7QnTIwSLga0fmR8TsV2OtmpMImu
	 gN1i3jUk4gBJMUlOxowwnhG95q8G6WQaTi2LhFO0FvV7XJvFfXtjPUqYaigS1HYGeCeqI
	 ktFB22T52o9YybugpHVIrFsNurtjODs0p2ZjrF/VMcP5tj8dw0TlG8euAWOJnDd081uEP
	 Q2Swp0cY6934beXr6DCZHzvhuO5VRzhvz7QWc/S9TC8L3dAz5BBWhsGwv/oXJFHfK6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
	b=gBRLDGgYWdkoIaZ8ITUrKcfJCXHbCn+XcdY1y8EIR3CeRkrlvLWnI+XUsMwwXuOhBBYG
	 XLPX7jwrvj3v7m7ansRjqUfmPuC82L+3ZuQ+4Wfym6HQ8daME6mm5OjTePBxnc2BRh29o
	 1SOoBja+kNUck93rCgkbOUpU0RYAdT2PgmnHJ+PT9BpPhUZJv9Q/mWJ7cuV3rVmpz/2Bv
	 oK0tfWe2H/IaRDhLIOKaHXY4zxLUiQegLDaoPg+biE1V+Q3MOiATGCfpz1fTnFHFc81He
	 POrgT627XVVF0UNxnLX3mUFkyPoX7FPeDgVC2lD9ELlhKeo/xoRSqRGGJJLQsTBMqdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyg6ByNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE8606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FE8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyg6ByNt
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2656441c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794418058; cv=none;
        d=google.com; s=arc-20260327;
        b=aTR9HWnfuVlfvnHBaRWqH2J9rRYM8QS7eHLIvZ4Y0yI4oENrkwmU553zW9EiYxt8tI
         cPxSUF9IxGUStMMkMPWqH01LJTnLTW1GAseD/KuMuYDfl5WwK4skS5QXaqRYsXubXWXq
         paMSzPsVJMVv2c22AHRZ7opXB+I8oVJ1zUaCdw5QG0l1kL7fzDKKVBA31z/mfii+RdNC
         Ne22l0J8RspXi6oaDIuRrGTYeOBYS+txyrtf2PXSVYD4HrK7g8GmsEE4ym9PpjA6CeUK
         9sTZ9I0i4vIj6QQPPf91b1lKD/9DcA9GKlOzKv+wnoFSckXublY/lf8SLK+6akrIHFUs
         hlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        fh=tgpbnxuxlFg/N+Zr7nXGgwd+0sGEUG0q77yNTbgtpV4=;
        b=YiohvnfgrKujwR0+lroh54nb8TlQId8+qVmbvMGc3/2/BcY2V7IacHjqZGcHUBKe74
         aXYusUTBq75nuzApCVJUKLvnke3KXsZh0MBStpz2PvuQJkhy6ythUbPODZRWiH32Fj3W
         ltKEpY5afzOnJAmspCIS5OAf3Akhu7leBcdGlrYqUt5OwZFBlQkNZ8V5JtdakOhQKMyo
         4wvjOP2RfZzOnaJQ92oPO8X6YIJADSzLYqG/ZYmRnKm0jac/kQ4rZQACVabYIKXlEaXU
         SGzXsvepypVfVd+vuBVQN/OfmtoeCn3g0Z0U+4oUfRQrBo2ls5hO0rbaSxUPVT3JIO2N
         01Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418058; x=1795022858; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        b=tyg6ByNtCOXd3UYgLHVPAI1+s7aXekSUxLSTJbM32FAWHq0F0hWB9djyJgasJd1l42
         DlZT03LRvimmYFbcXJ8OpaFRa3cx9q7UJbKhuAk/Jm0SAYEDJjv06ajoRLw+qQhw8HQn
         aSSpBhMTEtSVeGhM/EzuCVcS1Lm7G3woe7vAqtu+G27MtEGOkFLxNCajtXnJ653o51PW
         fzjCMY73D9UmZgsWxWWoQRSCKRhEmuBciPAGjPkJzhJrqxS/TmBsBBGf1WcU1zqkDRdQ
         WsWzelklgQGD824LA+SPXKwXpOlwzYv0i/NYwkLd4KbbE5axg3lQ7t+Q0S26/Ho8kO/H
         uDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418058; x=1795022858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        b=uOHEb4Ncp8HO7ikrvXmoDjWLeoB8e7nCzo/+ktGCqMxI0WCt7CswHQjsWJm7iQphtg
         3h3BEO6J1uXvjOMGVYdK+QTpA/FXYklz36/hA0QYSaElfyNAWQZZFoIn3PHrB9GKYs1x
         O2uxwnLAOxV4AKRiSwbeEQVKXHqajujzYti9GVrTf5fpUY3uDw1xuH2juh6mzpKsTxuy
         QGGTNDQODzLNFdASEftdJS7kHv/i2TxdwAltcNDbsz7LTk+RJaTShT7ZgRscjgRw2Nmr
         Qv9k+vehRa3wwNESTQKw5EC8zMhQmMBNVnn6IwzbHUFkgahqguGMmKdYRMnpEnIPBiTl
         t6UA==
X-Forwarded-Encrypted: i=1; AL+hErFfR5vN1dS8HkHUzzbZEIzQ9c/QZuw1SedIK401lVtjrXjHW3mdnE8oNNXqsKJV0fHAFTdLcEEXR4kQDog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dczAfMpGQNPRnI8uwY7410OttjTYgB2zS+OYgWtIw54NKV4WS
	X+nE3BP1Bo8rfWQm1hTERurez0we+PRVSBpPvOIYOh/1/dZtzdnHwb7QS4Aa7rcjnpgOt6NkUYY
	00zMcEe+zOx82tbylZIKbDNM6ouwK0Cg=
X-Gm-Gg: AYBFou0lYPM4mFhURs31md74aLQdMW0nfRld8CD4/lJLuu9CqoA4SBaME3J7ZJWnDDY
	Q7dZ6GiDQk/vdcoqB4jWdtMV/HvrpkIAezTe1fZtTtlLCNnLRSqK3KM6L/uFRvUZWQBXj4RiM7p
	rGzChxpqy/mJ9lhbMBMBVDWFelJtzTw00t59tn78xoLv1AajyQ2uI1sY9IzPyS8EW61X98/6jm4
	hsItMC+2rkZ+/2GiMlMFjCfOhxtPqQV9jwPligVp6HP+AdEeiw49NX2NZD7smy/Dz8SmidrflWO
	i6FQFOitggmtleX81iB5Sigq+BJLssuiQeDxgX2Hn+n0Rt7GkZCZK1YUCVkzpGX9OClDWj8GXC2
	EzpPbEXIRTdOAv+4pIjDbfGpO26sJF+5nuSI2
X-Received: by 2002:a05:701b:4558:10b0:1ac:f84d:4036 with SMTP id
 a92af1059eb24-1b3c02f34fdmr2668936c88.9.1794418058188; Wed, 11 Nov 2026
 09:27:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-legion-lighting-rfc-v1-0-a87e1db8c5e3@gmail.com>
 <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe> <CAPKD0HduW_atYsz47Nv-9A_88K1B33xENUnZgQAKcH4VHqV9PA@mail.gmail.com>
 <db41708e7676697fda99573a31d7747dee112403.camel@rong.moe>
In-Reply-To: <db41708e7676697fda99573a31d7747dee112403.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Wed, 11 Nov 2026 14:27:26 -0300
X-Gm-Features: AclHuK-k_YZiigppKf1NhmY5lI_KumHaoapWssTv6Uvn4FXhXg28fO9lUyYHPbk
Message-ID: <CAPKD0Hdt7WNC5n47Bpug=DMsJ8m63UnGprm+-cLaUh3tb=4vCg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Keyboard lighting for the Lenovo Legion Pro 7 Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Rong,

On Wed, 2026-11-11 at 20:10 +0800, Rong Zhang wrote:
> What if (four permutations):
>
> - c197 sends 07 AA 02 00 00/01 00
> - c193 sends autonomous_mode=on/off
>
> And what if the sequence is reversed (another four permutations)?

I tried all eight. Before each one the LEDs were back to the
controller's effect (AA 01, autonomous on). "host" below means
autonomous off plus all lamps set to green.

  c197 first:   AA 00, host  -> green
                AA 00, auto  -> controller's effect
                AA 01, host  -> controller's effect
                AA 01, auto  -> controller's effect

  c193 first:   host, AA 00  -> green
                auto, AA 00  -> controller's effect
                host, AA 01  -> controller's effect
                auto, AA 01  -> controller's effect

So the order doesn't matter. The LampArray only shows with AA 00 and
autonomous off. c193 keeps the colours it gets while AA is 01, and they
show up as soon as AA 00 is sent, without sending them again. AA 01
takes the LEDs back even when c193 is not in autonomous mode.

> My implementation connects the LampArray application to hid-input, so any
> HID driver with hid_hw_start(HID_CONNECT_DEFAULT) or
> hid_hw_start(HID_CONNECT_HIDINPUT | ...) will initialize the LampArray
> application. Therefore, I suppose the only thing we need is a simple glue
> driver[1] for c193.

[...]

> Does that make sense to you?

Yes, it makes sense to me.

> I will CC you when I submit it. For now let's focus on the driver for
> c197 first.

Thanks, I'll test it here when it's out.

Ciro
