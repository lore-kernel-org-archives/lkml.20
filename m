Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654122;
	b=GSMYcPEryxiRqbG2vHYVKGIgsHjsa5tKqmAt2XMmPnKFzq7fYXlj87z6/nH5Wmjgiwtt
	 UCVulvVhuX24Un1SdzTzIZZXaJISbSQvJzVPOni0/jKzmT/r0UyaQNJ5Sk8GYKND4lx9f
	 M9Wq0un+2nrfi5BXhZ+B4XbuTqa/1Kf6YbP5Tz0kqzWcPJEfvy992G00bOV9zPfv3hz//
	 H983opmhFQbfNZ9m1GhIVlSiISP3A6Fxpo+PpYxwT25nQLu2bAWhAWCVQiN7oXhnO885m
	 j95pj/dEr6GZYG9PwZPc73RK6zw7AODT9AEmDppXCAcZFWW5PT/uFj95dZhCHE5JYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
	b=j/odv5tZgzFwCnL4XZ0zvaY1f+cBETYEKDiJJMmTK4RcrYfbyW4Qfrinabn/GabJdNMC
	 zHbE8tLomNL/naUI/2Th8iOfDTLmjXrqkXNY4vmGH4kzQNC+YCPFAF/z5Utc2G+8wNIaB
	 fzpl6lhfmlLBcJCFm0PK7Ylix8aDIw40CQlKbPV5DFGDmck2onDGjaQ+5h3k+uIWkRA9B
	 XVn5pPYv0sTc98fmMQ3n36VEaoJNoRizsTQunbfToIc1NjWTxsEc/HPLCbfG5a8c0kwch
	 aGC64N7MQCXdD9sD2gysMzyMFLtM/5QEUyaWOhYRUC3W7h1NnCPTSUxVJJ1X9iZUmGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aT2dPJNY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B761606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B761606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aT2dPJNY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so8801625e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792654119; x=1793258919; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
        b=aT2dPJNYvwXMj55NQLktkv6OrKNvDilyU4rFPqPQbTLHDfRmY8Y5gOZNRKw+9aRe+4
         xWv4BZGxBeGEHdJbqOykH3roKU1u5AWUGPA0egG6M5fc2kSisAGaHJuDafRjoXrzwmMZ
         9l605oe6K5IlFtbNUnp/YzN0FhLbdd4gP7Cx6k481U4LVJwWr2+H9AvRvDJ4x14+LwGD
         Z3pEYgB722ZdAzxGyiiWFYk24YN6JuLptwcP8n2D8CBTy40dTs2bNO1CAnDJfWWrJXJQ
         KVW/4PKfiAuTtzKNLVGGKQLhMVdm79RVCk/Ac7aSWe93f+0ympTNq9UhUkfLYTflngiI
         vT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654119; x=1793258919;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u87gTMnKrw+5wwB7Owh+xGxsBZeu7l24WbHaLHBaNMc=;
        b=vjb0SB0Pkz/R+q+Ah7dsgwV8tjBsVTSAhRtHEqRBQi4R9oIk5jc/2W4mbbg26+mFpn
         GLJdz9vlWY9R9L+2eSon48/QzBL+Fun2HeoA/c6FzZA7aHuASytsWfT2SAOmx+pf2RBp
         CC0FL9VIQ4q346K80xCg/z2hw5589zTq62mz52nzDnS/wU1DwRg/MlwyX/bzEcWFv6VH
         lKs/E9+Et4ZvXrOZN6Sfci5uJ5UdrYDbm1pKPk1fhBt1uIS48d7BxyD+187GW+kwNM/x
         TFwvPuokaVv4uELIbdf8svwVCisa7jnea0d0+1ddTmrYYQjpS9BqRJmGbrfmbShWy8k4
         erlg==
X-Forwarded-Encrypted: i=1; AKwUvBy9ynDj668qdM+Kg9k6BGP2rQyvkMjpsMvwqnqvWIyGj9URR36ThbWUpGkobCbiKHU1w7Npt9rv9a3zHYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG6Hj7RU9v8vjGJfDh7cr9TzybssJxRVe4O5eJ9DdHEzPh06NL
	cUMfEOr30sI4f94PqvFmJF9ydKBASYwLRwTED6YaprJMBj7V/PP4zWWgEWSPfBxKToE=
X-Gm-Gg: AYBFou32iMl0dnpX9emnFnntRs/XFoa1rRy1cexOFxReQMVtVDasIOCKpFyun7cMsu1
	VdcKFLdEKe+32DNtAuEirqr1oIyDYP/A7PT0WYvP664ars+RPxuWK5TKiJ8vKTUs88NsYcsGbkX
	spUuIufHfDjQEG85yIfDK5U/bmB5ZAXY95CUun+uhXOXW26VDIxldcJPEbvXWwzLh5naqj5NQ5v
	WwQtjnc3MojIF5pf2dXMm6Y8dwqWXUDomvwDw5gympPRaoQrbmE7e5TnM1zQoDh5qm6gjJDQtE3
	uEJEEb7zY6dJPMG/5X9iChuMzPiUEv+r1oPMxiLQs8cdDFszIDyC+hgmSVSI5DjqW9knzKckuhm
	fZqNZ30q3Ko151yeKaypUoK/HeKLxTdeCGFNCMTqQkNLMHuozwgo5dNa2s7ExbcN83aGKmvHywX
	LVXrCRRJ7A+4jPTHc3zHzvkoDoMO6npCkEmYShSzCYWL3Yeb+YVW8ARclf5M47Q2mQzT9cUIssh
	AzIbCgtSJOa79G6Putj3uB6Auwaq0HdF8zF8crze5dPLhEkne0=
X-Received: by 2002:a05:600c:3e8e:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a1fdd2c16amr86892955e9.25.1792654119089;
        Thu, 22 Oct 2026 00:28:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:81d0:bc85:7836:468a:a1a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b37df4sm49911655e9.6.2026.10.22.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:28:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 22 Oct 2026 09:28:30 +0200
Message-Id: <DMB6UH6R51LW.1TRHK4HV4GGE9@baylibre.com>
Cc: <msp@baylibre.com>, <s-kochidanadu@ti.com>, <a-kaur@ti.com>,
 <s-tripathi1@ti.com>, <vishalm@ti.com>, <linux-input@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] Input: gpio-keys - support wakeup pinctrl state
 on suspend
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20261005-upstream-gpio-wakeup-v4-0-96f092de4690@ti.com>
 <20261005-upstream-gpio-wakeup-v4-2-96f092de4690@ti.com>
In-Reply-To: <20261005-upstream-gpio-wakeup-v4-2-96f092de4690@ti.com>

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Oct 5, 2026 at 10:47 PM CEST, Kendall Willis wrote:
> GPIO can be used as a wakeup source for TI K3 AM62 devices during
> suspend to RAM states. The GPIO controller is powered off in these
> states, so a wakeup enable flag must be set on the GPIO pin in the
> pinctrl in order to allow wakeup.
>
> If the device is wakeup enabled, select the wakeup pinctrl state on
> suspend and restore the default pinctrl state on resume.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Reviewed-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Best
Markus

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCatm7HhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOW
6gD9HrdUBVOx10eNENGmC87DdSVjcxmdzYuAxOfxX58o+lYBAM1LWM+m+3hSU4Ah
LmcKRriuYGDt5w/aDK/CIdWJS4AJ
=PCfQ
-----END PGP SIGNATURE-----

--1df50d76efba72e33c25952a6ad8edefb7920dae8cc1c3f139c1ceb795f9--
