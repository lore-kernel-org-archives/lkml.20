Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794808731;
	b=cQXiU87NIdFlSDOC6RPANL2d/8Vh5vlfHeE7CWPDvKUZXNyFvC/yPP28VyHWUGqJqnUI
	 HZ4POFp5kK5PKD6Bek0+6SEq0Rg4uSksda+V6mL/bOh06hz70dXf6KXdlJnqiIe8MQH3n
	 X7K8m6jFF4/G7SBAIQDvEq/Iyiccwdzord20jmoz17u6r3sQ2e8bAxJJKS9CN95L50p16
	 YiFtdYyDpo8gzp6e02VfJNtWxaZX6tcZuZDQgjYHBWRRQEkWLG8/W1WGcrg7LyJlvPizg
	 ZODfiUfpImKn250Cp05cFY4K+9uERpJoMKgOYNdSpyDY7GGmi2wMHn7PgCSXN1h1/9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
	b=rUkvZqroXSgpdvQr0zXKgG8Gqt0DmFbTBLIeF0g9QkD+5o0ysUMCnEEgEN+xdFO3b9VN
	 uCxHxB+jJwCztR5pSYRV+RpYBGY6qUK+ENjbyvhDpz/jd/3c8Z0dOZmJFvIMmM4ZvpOln
	 bU+kqQySMaUv7kZ8my0Vwqf8o6cb7XYXTnMJUWGeG4V8qkGDH/IWFCFVqxMqT2j1umBS5
	 gJ5mJT/od0OCNT8SEDkahVhbZkhe0o3dKEdLGo45uMmDHAVaWTq/kbd7SlD/FFyhfNlkr
	 Zu7s180qPYTgU+Crl0CSTfiHUXHvPDiJtUUvykpRxlLGQ5uIBRU1s+nHSIZkwarmeHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8RwwSB5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB7606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DB7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8RwwSB5
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so212063e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794808729; cv=none;
        d=google.com; s=arc-20260327;
        b=a6jhDz1izycjXbkOa2E7iLUfPWqx/q48syi6dlx8XqYzr2uWhks5yMrNdZ/EN43LBX
         7FDGgw9jQ56BMivnAEMnEYE9eJBCnCbtHe1Sxa6oYdIOxx4GJQwo9PwMulxOU9un7Pck
         b5h3T8S61/eizjJsoEv53g5EgpFaRDbZ7xvdE518L2GqwY0J+TpnDfH11RGxu77MkdCT
         uYyGVPLJlgyZqiQlZg43nQoUzNqQAmTYFYPDhZ0U7yntWUwai3d3alwPQu3uGHMHKLQf
         RwtwYB35O5Q2CeUbBI7LkOKQJvkZGLnAzAhKiwjhwmgXAo2r9q+QdqU74nEfN0m2YLFH
         pfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        fh=HdJARFfKq2DY21+RoxGIUYw0Jn1VIU0AB4kCSkpI674=;
        b=n9R0xyDdKx01UR7mhHHLjE/aJCtcYqtO9pmUJu3omGMOaOlwz1ZMheEp2UlthrGB69
         QQGxAN5JTenvr6L09jC2qnQTtkUVFe5BVIoOK0hbsethzgtn0a2awnIImDYHaJEm9WnR
         1pjlo5RHznTRm56UTJtMs7S4H8tHxX8fodj5unPA/bwq2TVrO0FNDcZ4IUsMehqrVtkC
         jLzJb2zMl2qDISfmqj9jvroF+6AGqUMRoZFyPvUDHKTOrK4kQMV/5VAgIeUqAzxa2ovB
         RootOus16U3P9IjM7x2l1+AWp66zwnlvZmkPxGaviVdyB7PY8Et8vDTjI2twt6xFMCBj
         wAqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808729; x=1795413529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=B8RwwSB5A8LtO7UHvVXYnc07E6WmdiR3wJH5UDhSfLEJYiSbn1KPdAvI7qSEiQcF+v
         dzhLPdOx5WKVfMeGZCKOfeQSpLuuALPljF/mSTa675n7PNiLn99rEMntSbky+gmNtjUm
         T6gAdR/uYaaTWkFflhg46Lbuf3gd9b91nKEHWCoFEuXucwm1KohflJ6pw7xmBdnkEl5Y
         0kmhlsNtW+zkCvkOT8MyAxmLpLeiAJmdNtB/EC6V0CWcS7tUZI8fJ8voMqYsJdIvxsZK
         rxh0HEyXhdqsAlYkmkFB9/PPUEjPgYVPhXctXJe2TI/mopCKAbH8EO2nulVKEiFFty2z
         Gb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808729; x=1795413529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKC6wftTAfwgm7hfDMXB92AtkaDOnYKFMImjf+ok55c=;
        b=eCSJpKgD7mfVQvrpDobMwD4cjPjd3N/LnthuWwRJQ7pTw90IIRO5hLeuru/Ve3eYpi
         ymPGOhqNzsL42IGTTqFgV+y+OKPOOHFalpdUsMErT0d4iFfV/NccOeTj+4OAdIZUKYqu
         XqEs9flIfZckaFrHWdXrbewkrraD/W60ejF3QOUjUbUivrzuu0ek/ExnhLyOvjwZvBo+
         y0jw22TBAfnh0RsnzJeb6ezFMLUY3tJQUh6zjG9dw3hoL9c1I7C3n+TcD8EoikxzMpxW
         eE7egSa4QpbLIU9yM7svTPP37ZCa3kBy7XNUq1AndLe2PUDYIRLXjTCiS5NZCrTPNJed
         dznw==
X-Forwarded-Encrypted: i=1; AL+hErGN4KaYu1EuhnXgjT0LcJrDyy2/H1YFSYPuTJYWm3lO3a7dJD+AODsbYzgPHEMHYpAr7wnXCnWT/QEFTWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zw1Gi1mqr1OhaRCXg+zi1XHcHagLTp5+83T9Yxxe1lhT7C3df
	jeGgTPCkZV30ImiTyDv+LNlcJJ/3CcgNsFfoyJQcWi1Vqxu7giqQG/Ugk+vQAYrMyRMLqYtTYSN
	zT7yfa4TnUfU1aUWJuTnSf6duDc21ZTE=
X-Gm-Gg: AYBFou1rbNE8Qd1wJTi7RuYJaBi17rDuk3o4Hn5Tp6qxVBSxcmI3VhvmrNYDMSWW7lS
	73NpFu+hIRD1OJB6rMGq8KCjIyzpyzmz1NyLK1eVYagNyItBxFEtrrRt9SoaVEwzSvbhtdyZ90+
	YOROVsCtmpXJ0IkrI/a4FnVgKUERwYc8B7DTS/NmgPfWUDbETE+se0nYa/WDQq+ABHbw008FxAT
	ufq9KTCVGBhK1872MLe0wpSE/+cKNNQ3kgs3H8BI7nTFEJwtlwA/ZOX2wHt/qzzr5dSNZW427N+
	wbqOiux41IlMRjHB31/GWAl3HiIAGwg8gD2xAEbzh8GTtzN4OgAll6MK7Loc5ARks8q93DrIh1y
	W0tAjABr7xF9NXJG3HjyU4qZvBfhWlOBUDxYM6gZN7qtlZNns9c0UmQciwxdjxNtnx9JkqO4=
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr3973537e87.0.1794808728737; Sun, 15 Nov 2026
 21:58:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
 <179461167656.590303.12402709871115244251.b4-review@b4> <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
In-Reply-To: <CAEy9hNUgWgO_tzV=3=X82A3kOYBxhukOvqRzaq+-YC18=RZW-A@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 15 Nov 2026 21:58:37 -0800
X-Gm-Features: Aa3M54oyNaHJcBkKzqdmGmOePaHsPjod2sYjt6MjOSlPfYgCgkl8Fvj4W_J60DU
Message-ID: <CAEy9hNXFw1Fr81p=27vHR4HbNOA2ni4srU1RyP3W8wxoas6Ztw@mail.gmail.com>
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This new compatible needs a corresponding DT binding update.

You were right and my earlier reply was wrong: the binding limits the
H616 to single-line bus widths, so a dual-read flash node fails the DT
check. v2 adds the binding change as patch 1.

Arun

On Fri, Nov 13, 2026 at 5:13=E2=80=AFPM Arun Iyengar <aiyengar1990@gmail.co=
m> wrote:
>
> > This new compatible needs a corresponding DT binding update.
>
> The binding already has it: allwinner,sun6i-a31-spi.yaml lists
> "allwinner,sun50i-h616-spi" with the "allwinner,sun8i-h3-spi" fallback,
> and sun50i-h616.dtsi uses that pair. The patch only makes the driver
> match the specific compatible before the fallback.
>
> I'll say so in the commit message if a v2 is needed.
>
> Arun
