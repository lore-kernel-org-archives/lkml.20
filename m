Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793121728;
	b=K1XlBMjcYYdFWxSrufjWSln9n2RO0qmsMCKt/JsvJRP63X+JIMEYIM5LXWWpaosmQXPK
	 WOFG/kQdy1z1rradZcBJqw1mmqWzX6TKroo0efVpdHEd7olBGZ2kOzBQaB0o6Ma9hk2mI
	 ef9R8gfnksXfvsxrfyVy2EYxHYucIv8DpyqCUon6cvOLjWTLYHZFNp506GccamslCVWcv
	 gXp+1GwvTWr8oNkCufqwq9s337qElWFOaAOtTN9YMeplZ4r8FNpQNIS4YiAbr7shqwVNW
	 YBU9L4LIqh6tKxVvAo+NFHXGLm/PQHe+0D5zG9ha3cVEvCaL/iTM9C3IwOY2XvkpUNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
	b=MgqLceDx10K7Dx2/nnapZW3uCb2YcNLAR5MZ1Cm19FzLvkxRrYZDaflpnM7NRR7MbPbT
	 JTMX214eBhbF/ySW2L8s+wH7BRE3Cyi1XNM9ayVNL2h48mpfD+pMhwsNw9JcmvEmTSxVs
	 YB8GIAi5Souq4KlPizMVClB9c8vQ78aFrrQfbhe1B812IGxa5DWLETdE3uwOGAdqw4T8n
	 LINS9la/OGdpNSYsXvpmNVF8GhGp2vq/atQgtgt3OuroK811qXRZm2lG5d5Z+AH1z9MBC
	 wY+IZyAP2DcyP3w4VtoOwpBBlI6TjbBzoShlXEGQBPkxEoyKM+3YbHrlxjQbNxn6VYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C41cqylo;
	arc=fail smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0E606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A0E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C41cqylo
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-156cbe59524so35698c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121727; cv=none;
        d=google.com; s=arc-20260327;
        b=aGrQpJwzcqmzo90EWI/49w3FNTwezQt/EwD3BEidzPyBQEMXKeBC2NC3+EcOPRSPmd
         NXUzIXkl5cQJwoZee8wXS50sCa5dk9Cq17uyFHFlarLWsNA1vWL5SgSaLtQw92BI9MkK
         +b72xSlfkhabV9XUtSG+act0aBi/wnyAU/kTpv0keMhnI+q55PIOKBF7vEfXwkSbtKjI
         GCOkuXC33/nqefUTd/iUUrKZyY+HVf4/GQK+0aS8R4L7fzrZJ8pNkNW/JbSHTaVpqH3w
         oNCfCNj2XHHaJ5EQG4BNDdlaLnF/xqx+GiPHw5Z5BhCXfcL3Mwykjg0XqNDZiNxPKjrb
         PSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        fh=/RL+0gvE7dxx07EVml/kTS8zFX7GrvRAVz3pZKIMYMg=;
        b=MvypGbdH7ETiNINROnMwNMcyX5+FgFQnmX3FBOYXLH2S0TL6cOCr0VA8XfK2akA6y5
         QdR1p5vcsV4xW61k42Xat+fHgA9o0nfyqfgnkANA+ty3+xaSRYGuyncE1N97G1WAWdMn
         QcvEKtf2ZJbjdtOq6oyp6oXxiYlzKjuu1iPE22wVAIwU/30b2RlikPsyquYtI/N+5/de
         VQeXX2xel1XaiyEgiw1KrHM4Dkpj2xdRH0C7RmLs2UM0CYRndQK4mO1OGSxfnLQctBNL
         pm7/191PaNoVHr0vmhCWWQ/AIXDoqv5/mF0AFVUAMm28rf7Sl172Y+JnLjG7jPmNDp7R
         FNwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793121727; x=1793726527; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=C41cqyloeS/h5Vtwj4fa7MIjm2aLukQaJNMjA01Wn+JGGCcQqxaMEk4qtaeGLTgF11
         +xXojI6iydcNCHCInBDP9VQyo1hJAFD3dr6yQmpBM6HUXazAlicytsDrwlamPA50lS4I
         ot5PvMH/HWpuW8LsxGwuM5M0OIfhb6YxMmvO1BL7uALyaS3FIvEjHjPJFzKMoA1yF8FI
         hrNTtVklmnbX0GKT3t5upCjaEu9RMl7g31Ii5f+e1EuriC9yJOvccQQtUIHojQFDkmTh
         oSuMUeEQcN3ZJUIM7OREyaxa56yxzKExGn54vpm7A5KxV62XI0nsE+2SOQIxafVeXPuA
         1IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121727; x=1793726527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=Iv8axTUma56rbmoYILMUVij3NfPmEQXXVsFliZeyvN+HIYELvZim/bzdaUblM1kUND
         YPHvaX3I8mIKv0LyVMe7hgLGPJfxPibdx2XuEK934vyPrLZVlxzm7Rz9tJBhhdLvYq0y
         uXDqRsZhq0ySFVkd3ES9722aEp3uCEzIBgvsVgXpIlFYCdyxT1+euHsNqa0BGxCeyJg9
         2aII8ZtQgZAbrLp8a1I6Rxh6yVUzLW9OdHwB14DDZihT+4hTHkaqaxmMQKcruLzLpDV4
         ImWkTyug8bpHTSL+DeKFA2laei2Tk5w/E3cNl41edM85WjUaR2kdHT/7LSRD6TSUfmhi
         QarA==
X-Forwarded-Encrypted: i=1; AKwUvByCNS/qTetWOoSc2MQqz8yBe19MIEl4objmFTuUa8YVLyH+RlXvOz0PeP8Zo7d5EwZDAOyAyDzzZ6Tvs9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLcx3txAW7sti1GQFvP/KY53wXLs3ANHup9qh091FAFTVRN59H
	c4cVeY4YtG8kRUeDFNQzEddDdEc86FLiIOExRFyEusWSm/uBW8ltIu+EuiBs/LuPUpVDg5PScdW
	tz8ZG7/BxdvoUsCeI2HylIgLnt01+SLboD4n4Ku6y
X-Gm-Gg: AYBFou1qgkHAcl4lFdeJEiAvAmj5oOTHZPdVLS4qeDsoRf72DT/xd8d1X0vJxBAoQ+N
	2s2zw6g4YIlWfLeuez4jOhJviFFhouD989AGJy8kLgOAFLfdP8XcbDp3xbViIurrHOJNNazBZqv
	3GIUuz8pmL/lPGbIny+ZhVzvC8CCx0ZH2RgkZFfl7WgyRk8uk6MLP/n+mS0Te0JHRUOfecWwnJ1
	d0BvfumCTlMz1L0u2m+rrvC7r68HrEbH3pehzYJ397wCySs14LAdlhCLGC8IQLus0+xrzCcvBZX
	Me/NVtL8tB6VV3Nnz+UU8Q/O38htQK4F03ZyijyWFK4tSJ1h4cIyqWk711I5Ern00dwEN4muuH/
	Y9lPSguKs/aR6hq4L+W5ot9fzmNon7+pRfLaDGe6OUkdK2awswy1IGdXOk/Rnkl4fNDm1wFODNB
	Vp9JoPax7i5sc=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id
 a92af1059eb24-199363a356emr13049111c88.17.1793121726447; Tue, 27 Oct 2026
 10:22:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com> <auDNzWMPy0VQcazt@ashevche-desk.local>
In-Reply-To: <auDNzWMPy0VQcazt@ashevche-desk.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 18:21:29 +0100
X-Gm-Features: AclHuK8orvmEUb-f7W0Au_t0jJZW6yeRJKoPRMRQ-D7ejg8oB9UAKvhykKBG7IM
Message-ID: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> > All of drivers/iio now builds without context analysis warnings, so
> > enable it in every Makefile that builds objects, replacing the entry
> > for dps310 alone.
>
> ...
>
> > +++ b/drivers/iio/Makefile
>
> > +CONTEXT_ANALYSIS := y
>
> Can we reduce the churn to only adding it here and do some magic to propagate
> this recursively, please? I truly believe it's feasible to achieve.

Should be:

subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)
