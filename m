Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723862;
	b=EV3EE9RkPaZyw9OEMb3VXrebkRBQ8J1a80F5pVrFicSFXWXFTX2oIPUMyLqsrODTFeda
	 c+43+t55ooVbo26/DHsWgKMXTRLJgeOsy7e5j5f0nBU3H9iscIQH5hkyRf1+EEaqWiVhQ
	 q+us74zeB9W635Nsm9TUwZSclAYsmRL/jXRjWoF1VKz9UIeIeYTndYIfd2b5Fb+WEzPwj
	 saJQucCf4BpV6KGNyfWJQxrXnINqm+PhJcgPCjX8qfucUORQJAGmf6QXTeUDwobPdQ9Hp
	 3ZCKYbRljcuY2YLspOENk0OAlNzTS2Q8/RCZbly+NsmDx4ARugczonl9zegDuTNz3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
	b=3gDnWTHmfYIxE5zIZBd+OD9UJWD8yyA0W+FFeQeOqKd+pdV2NVN4Av54yTdPoZb8EpdZ
	 U01fKvbHerCIzbxIcE9uaPmIyxiCqqxwE5MDBG4+2BCf02ZhBEzLkCA+jhfwhFbi0izUt
	 lI63zcW5ndGTW3YESkLcKwUXJ2BS3gfmKtdkpQdzRnoZdO0vztZriS19OV2KT1i2IwiZT
	 6KM0P6I8M9oO9IwKVHmimfxoFnjPcLHDoQ0LVR5TYoM2kmitgrU8QjtdRCPbROYNDKyDE
	 0X6p2cvQtUBO13a4iwsogcdN7xp/0IUJ3R3UVSHnnIxKwtpvEKGefHGMZGGCNIWSkPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C58606D82F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C58606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4d7034a99a9so2763279b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723862; x=1794328662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
        b=eTznEg7HcqlRDoo6ZeEcDi6T8OjvSLWS6xPvFb4P1OXh9VrhyCfLrww9WNtYrTOi02
         /xem7wTQihPbLuskH8yv+3Y9U9mUfs9BWMWCn8sLmSdB6mCdMPNzz3P4v98EQus/xRh1
         iryGOcQ71UhUbXxrrMA0N1HrJddPz7u97dThXft/ZvpWZA9PCM5KHqUZA5wBjCQZKEGW
         Hpa9w7jrfZI+g/7e2MM9aws4ezGH/E7mpF/wAgZgmwgwuW4GOgWoGpFfN4rBxPqvqbp4
         czwLcNqPNXMO+uf5615jE7nrEn4PjfCvkwdYRqTA03dTLg3g09Fh/SzD79ynnN5X7owv
         nLaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwv4NYSy34JBarMT+dybujvhWn9iFI32d+S7h3K6ghjet2f0K66eLdJPwKQJ5WoHyn3ikDb8y24ww5jlDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M8c9LUJHH9ajXDH91dbwPFVOXZDmQmH2PH/Tjz/dbC5+RWBvu
	UTgfRug3VGe2HD7KT88zplpxPu14yBrWSLnUISEQNEnVq5yVPvXrDIrciQNMeoSQnjU=
X-Gm-Gg: AYBFou3PbP9RSESCldFYx7I18MiZOeDJDUF5UrIDXG3QVxf2ANlEGx5h862D2ALZkXo
	Lyniz2zZXLGuUZ7GL/36Ig8QpKJjK3BoVoHr0LVzHmDFdE2AGVPj3xNYJGu2z7OJndwEHdysMmu
	UmRe0+D7yAlu/s4F9/ut6TCSoas7Yp05owpkmqiXp9UXdWas5W2KPM65tpyBpEjmbWu2E2kUMJu
	SvvjeN+INBPA0u5+9DsCL7P7R/lcSV/XDSHaeUF3gdIrL7jV+OvahvljRJiDjALZzfiitTK72D0
	4lGVKk0gZDpxasun31coKv7Go2N+50XwyYVt2Aem+e7jLE0A5Dg0YU5dcL5DGZiFPzX6qlYY5mv
	SbxfHGmABafFYxBGM7TbJCgCVuF+jI6RIAQJPLhQXO2P/JqzkabbrS6iqOmbwvyDVWqhuECszFN
	KUaXuvpCWUcTX1yvp+mhQuCV4VtjwWZNRs1OKPqBmN/kiAyh8kVmcsi2919Xfj0u9DTktYi35jM
	PIuQKgi8EJ3Efpj2iKU4+4/54ru7ZgXoBtYoDO6tIYh63XsDSjwuw9EcCO1cYTZ/DXHtt0L/b6c
	2U3SqdzlgBxceEcB/1rJUmUdWUa5kcvxNhkAM8Un7RtplO7+Haa10ndifTOl/Sy5TcAgPPhJfFp
	ZmeP2fzIiw/0SWLaqZ41uIPfrPYf+nvWsiHSKnXah1zypjRJ8EKf3dncu
X-Received: by 2002:a05:6808:3385:b0:4b9:e6ab:d078 with SMTP id 5614622812f47-5640dc8448cmr9942861b6e.24.1793723861628;
        Tue, 03 Nov 2026 08:37:41 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5675a8af8cfsm338122b6e.12.2026.11.03.08.37.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:37:41 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53ec2cc397aso2944532b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxrNzZA51KtEqUttk1OxoGfdZmMahglMF6lu1+whqaGR8x1wWqqsuwpCyf02Kq8vGupQpSlj6XaIpmktVg=@vger.kernel.org
X-Received: by 2002:a05:690c:e3e1:b0:8b1:3606:65f6 with SMTP id
 00721157ae682-8b2b674a182mr76399327b3.64.1793723531633; Tue, 03 Nov 2026
 08:32:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
In-Reply-To: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:58 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
X-Gm-Features: AclHuK_uB_FU_COonRuR52ADQLZgO7wR8X01b0NCoWbrjac2-TTSlybmTTN1Brw
Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 10:58=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +       if (!dwmac->data->init_delays)
> > +               return dev_err_probe(dwmac->dev, -EINVAL,
> > +                                    "missing init_delays callback\n");
> I'd rather let this crash hard to make it obvious to someone adding a
> new SoC that they forgot something.

OK, the NULL check is gone in v5.

> Other than that this looks good.
> It would be great if the netdev maintainers could comment on whether
> this now matches the approach they had in mind.
