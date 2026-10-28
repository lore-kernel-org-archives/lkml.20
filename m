Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180983;
	b=d47PuDduH9WKcvahf7iqtSwsfk5lsg4wqv1C0iH0qZo4rzmmuqGLf9da0JBJKTXXz9au
	 sptQxVrqdAF83OFrG5GCkDW2DA/2L+PKXk/PKapyNa/EJc+4eBFrRzkXUfLWnVlacKnBs
	 sxKdNMKIAwlFU7o+JAAJm0ViniqTKSLoSj/+Nu6znjzK+oTq+d1qNEyCl83G0nz3zpoqF
	 WAi86HmnPT6Qi8NbtilMSVo0/hah8q0R7Nzh8UkBuYQUil/aB+RNDs8eaV/ntFkNwkdkG
	 WsRTJ0iVQYE1iFvbpFnfDRPaAa1pR2QDnyleMpQV0aMvt4hMNvvYEaZfaDtqpzoT4Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=y7eYdyCpUWXCUQRlsPcvWXrQMcfqWP2eD/uCcHX/Ue00SkytZ9yBQK1fvkmcCNqehThd
	 NNjmwbHi/SHLCfH8TctT9vDfuFQ+ZkLMqDASTZVaRF6oXVNo3jx+QHcYL379PPKrWLDAN
	 v370dlcMRaP5iiIDzndwjSHH1k1zJI/yXdLPnE5/dtHfwQp4wV7C0KhSNf0/lMBKOVJuT
	 xA0ArtQTSWTwSnuxer2dzLm6O4Qka3H8RUzb3JbfkHzFOHRKdF1Mj8j9/UR10FRODngoD
	 vISLaWVB14HxDWsrfrzHqjqBo6/SrGuiwQKsGI0hi/ZsVIgHaKSYdnpnsW8rGxNqK8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E44606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E44606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c414e5d282eso95504266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180981; cv=none;
        d=google.com; s=arc-20260327;
        b=Dc0EOAuiZJ6aOtddJl6iedqcIzC6rT0jaRXGyB6Jfacx4os0C/vHMpSQPTyuIRnsqv
         xoS3Vp+LUS/GQK39Q52thaAIv4RqtXeJddf05BXY8ZYoXVZxkxc3fJjGqeS7h+IN65I1
         CjllPRsKk3O9svlnsnFktqOu8L2BNZdYBocvzvZnDT1HWjCsYkTm8CHSkTtBapUGezWE
         EIAsWOFDs9fAK/YHSngseoe99IgEpHUzuEeaNz89PIdZHw4pAKXCBfjLlZo4NYrNtaQt
         YAna7k0QoqA1LESZVY8pj7pAmh5E6U0k+ECRnjB2OrGEnGkypW864nCXfCdYUZc8BDAG
         BdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=YE9eBCtEAUuyGyJSvLn+9T6hkBzWcLzs+IzP5hFelXY=;
        b=JuCs7jx8iGztyrkyk/909glGFfXvVmo+LCXNAX8I/4GlB7CAk2lAhdC+W16zoMsBi4
         tObAXI7s/m4OfyOALxFxk3fBy6aqNx/ARsV3UJ8QziphT8lN+XyGmjZp+6lzPJVHbzQr
         5Dd2pryxAzkUU7YaH+2QYhTTqqU1pCdo5Bn7OflL3LVftRQUzech51YAI/0ab9hIH9t5
         fiQIYiSZIPD12/alEUiTpGLGvynvQY2FSuS2B1izI1c64DCCNzpkx8IPn90nU7I5dZBD
         3PDf0ugZSuOIj/IgwuVZlXVSF1C7wVGZ/tzBCLZurcaczU9ut86LJ3J6LxrgHATkw6Ql
         FjSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180981; x=1793785781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=HDWonstvPcPLttzddfVvr3FgZgIj3VTyvAyBQZO+i5zbi2rECmhSDB1AdWtfuODuhy
         zbThFOJ/JjrdUK/lT1BtY5Mp+LgVPMkR4Qmb04x1Avh2AVbEsATe5lvudS7x0SEorpMy
         ReQIkPvkTLZqXSyJPrV9ZolsJmrPn6NOA+iUBn1Z0OyokcF0SAk+CxO33y5zGnKio9Tv
         cuJUT4+A+kWSsZ5MWECBo71XMwQC85PCyclaPunzfOsIAqOKjt00RM2xS3RmVMACwQll
         Lmk0EP+6mdeww5gNkgsAXctSQmF9/qTytHXp9TBcuVFEHzvtb+Mji/sDVnTmpnhvMOOJ
         3Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180981; x=1793785781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=Yv7gKRO+K2pzXSpN4ouFNaMFT9ZYj//yryRJWCeeIftQ+EDg2SLWqBpx/4ZIGtXEmu
         zMY8DJ9dD10hJcSE3G3ugvbmUEhcLiW/k5m/OsRhhyvXI5tr2brEx7Ppa/OR7KwE6ABa
         jQRHVZHS6cR5UxZoT8S9N0+cyp9MsLF8A9EvTYq0rstYci8DAxRg9MivXX4i9CIhOIDn
         HX0AZ2mp0ysTj24hYOpxSSuOeR4BLPOHtW2637NUuZpektyncCK39oSxnfTIWjO4yRw7
         pE+G4vaFpatxXhfWRHl5SwQavfIoEZ/hyrzVakxBGF/RbcTJvzbpUAm/RHc2WDYo7HhX
         y3xg==
X-Forwarded-Encrypted: i=1; AKwUvBwGw6QZ+K9k/PM0Y3B2gpJpeXPgcvJ5+cF8ChRNIy7V3rZ/QuW6Uk8CEpgWJtofC1p8b91tH2f8ONL2QtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMQyblLO4Jd2uaOJDJz6SfsoTA8P/ci1bbS9XrDKLcWj4N6jhI
	dNW67psscOz+epKL/bTwQlnPPVzP3V4g9Nz5nFtOk3zoco4Iv4BzxYQarSwOTfo9JFUI5o3WSli
	GjVHtzju0bsYlNeOF9rBWThQcRT4by34=
X-Gm-Gg: AYBFou3hCJ1CrRm4d52J220cuUWvSqxeDkM//Vwx7o5e7WLPEj9scdjnMtBN+Wq7aps
	BvyLd2WJoufARp4n14DTqspRRHsvRlPNh9eCxs4DOMh81h8ZNjTOiDsKPWGbArLCrefwobgDFEr
	V8mfhczvzsvofAsiIHqQK+fxwHeraA4krOwXguyATJWJkrzm/uZHPxYmKnAvLRGsSUX8CEkN9pw
	Hsnt7xynzc0GfMpEdoBoPf1jsFknDOXZtevTOuJkWBDi2gDmtc9YPRk7myMMhhQTyQf/ms+Gtpr
	IZJ3Tv5SMkoySTR/0FNFX0Bwpo2BZ+Xr3OzAgGFXHmMlelK408eAarUF+AK0hPidcduScSR257d
	JnLnm7iMK1rVq6hGaiuFvOw9gRF0HSMQb95c5Mo9fYc3dQAbrcsamoX3ClRsoO5/M/5WY7CxI2b
	tjySD3w3LxJxw4riQ9CDk9b4inwGpx/tvwoxUfTimsbCHHYVQyZqeCQHyQ949Gme4yU9pemuy5r
	pkn0Mqbp5o/GJ8il+06KA0XgG4=
X-Received: by 2002:a17:907:d48d:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c49bdf7de97mr167322666b.29.1793180980909; Wed, 28 Oct 2026
 02:49:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:04 +0200
X-Gm-Features: AclHuK-kwXGKz5n7QFXQ4iO49tQbUX582-rj9xJLuSYR3NDY9XFvg2hsu7UGHjc
Message-ID: <CAHp75Ve71BfcWr++PfQPiOc=OURNn1-cdJey=M1xBVCb0HhHQw@mail.gmail.com>
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
