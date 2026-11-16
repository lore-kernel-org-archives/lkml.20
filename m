Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852656;
	b=N8GKY9RbG/t+SzZqSOT5wNO9cuCDRI1G795H6oEO2c2MiRuqaBFZSH6j3AT66MfFmx2t
	 W3qTFZLoL/V2nkI41FQc/v+upiEyEY7XpdS5XPXQuo/AqXcLEWPLxmcZNTbol3LDhMlRi
	 k607nvTKmvX/Boyqawx9mw0xscjDIBZxnukgICTCjuPaLfHUyw5xt+IZqk7po7sCFr++5
	 Eay7CpAsYiMI/W0P9zsZQ3Toap9m0RaRFxFdCvzlXs3Yi2YtC4YYSrKvusYQorZgkz39r
	 LB1G/diq6mynTS3V3TDH4BpctmWrf3O8pABTHHMbZFKERTMBSVhYQBHHQ96sGARRH9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
	b=mK1O7F55k1k/q4Bg+HJPClXclUlpFCVhFl1rDEU0g7SfScBuITjDdPINCWyk+EA44WlH
	 GOevlKs6nVp4um867/rNXg+07Z4sCQTH2kxT4NEGPqorlLQFlQuWdDbMNs8qEkVakSrr5
	 2u9JuVe5VXhbPWYJfTaixYK9TZrEV29blEsnOLrav/80RSz6IjPDefppWutBAOsjyome7
	 w/RI6jDQyD1EueneodXcwQFeq7q4weX2cqahxVXwI9Q7Ra8WnKYh/2mhT1VqSsFVMBFLk
	 NSQ0LqY8oLIAhGEf5wMVZ8RhdHWV3yAbVZI6viGYleqXkVPphN849wk6htdTS6FHaAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAWJE+r0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B00F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B00F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAWJE+r0
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso1160518e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852655; cv=none;
        d=google.com; s=arc-20260327;
        b=BEG83YJAK8EhMhCSpxz5ym7lVAk8EDQiH3TWUXB/xJTzkZQ9SIOzMwZuw80AuceN4q
         FXdDbkjMbSsXJh87Tj7FTGemsHWMkxUH0gwMhDF/ofVuKLa1Y2w0uRXA2WJHNpr+uRvh
         nYEWdyQq8J5TjVaMC+/mayfNFdscMkTBk4RytJ+EwoYu1EX5m7ru+QoADyv6mw5H5gQY
         igl6sv6L0DZVacEU4V1er/1sLQ8pLfUIR/4/cFb2l6J3PoiEY+kNEueIIWGYAs2AaPzx
         k9PMn+FzZbxfbS3DkRnqt3wwyC4xLQpko4VDRmjbbhvNXWnyonMfScYCHFLkyuoxwQrf
         tQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        fh=TgTY+io7U85LuGvvx+P3FbrYCXjLnPqzKdqUYKrkj24=;
        b=M7EIUxMKqjghQtyAo3HQgyI+prSoUo2EZH5bxEN+o3OKkl5yK6BzpCgH0adfskazsx
         lteMmY18mpRD1vG0rv7J0Lo0AqtR3QD85kftfHNe62pNNjdgJe4aAJbhLyhO+NKKNwWD
         EsHY4/OuEHjlzHsfcQKcZKsc6sUMyLLLMVdBkMlptIweBfn2zJEm9e6fcQMBJQDBvY+1
         P0EiJqOImepgIUxTPeITwam5LozDX9VtI1IEmw5m/TFpJPZhKV+PnLcrV+ffHT9qOk7K
         lmr7v5qjA8uo/x2DU+as8oAnbXiNEjmdBhFIn7ubJN6hZn6EBtnhNgiXa14Yl8XWaXwt
         FmrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852655; x=1795457455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=CAWJE+r0w0YEIIqqTqO72+PmfPHdnyhqxI3yHt9FiyzzJLzOnEy6gUZC5LGuTblhEH
         3PzVKOrwiMWV5kBO28dJNngGSaYEnqIgI9q4Huq/rUMjz+Cv6F22LGPPzCGdvv1D6FLd
         ybb3AX1+WGGYQBCbKFpQrJVtmpFngMJyYU1+n6BRo9rpJPBB6wYialBA24CD326m0uxZ
         xsXogS6Sp5FuUn+cZStcb2T6eRN6PcmnIxRwY+CH5rvPqMAeQ4AWMklsjEE2/YxZ01y0
         icOOSPxnZRFdtpqGvKoAi3a5KRamfgaG2fh3mhztZM4A4jUA60L33Lm4fhZM/guUde6V
         9Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852655; x=1795457455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=xm7XiEJX+0Ethyg8jZMnt0p8Ta/LMjML8yLCx6dZFQLGcczXgR4XZN5wbJWvMWC9ot
         VoO/hL4DerTqtHD9Esl8GNZm4pak5ovFnUwuhqGA+/Np0hiK7E7eUUH/XOIljfImHWHG
         LNF8rQQyLxt7hQTWTXKl45fe1DlJkaZKUVpj4rLek/8eDdfsuEmTa7XVDXdCfcsHX29h
         h+KC4XqsrEkZ/RN+XzPHZ7/ZZPUdicpoDtQP6yxcdqFHiCuft3kBLK2Lj+f5HVjh8nrP
         UQDqoNlcIWUOyHQG9uEOVwzQLLyB3e4FE1rmf84aIOsavh0pxrQZvEOjb/YYYfc4nO5D
         7K+w==
X-Forwarded-Encrypted: i=1; AL+hErFjasDFPmSpNo8Dgxiv9+OMNPkqk8tXupapXB7jLIVGQgPl5mLzFmGTn/Q8qoFcj6rjVVbWXdmt4JD2ROk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dKzVlQjpm/xEp4cHK78FmJsozoNlupwx0iEbHN81YfNMpliG8
	f1O0nG5agcEWzH9aTHRuKFS9u2XLmacsx7PjyVFWTvVBnsgupdFJjpdO+Hx+hO2zplPhQzsNddI
	uKcB48sBQmrsvCpEeeUgrVwMHu28bryU=
X-Gm-Gg: AYBFou2AyUBh5bdYq/6UuGdaiFyi9XYGcDjmEAQkCE4ZIsvAgiqbechM5bL0A5JnN6M
	UyzUw6p3bb2GaUZhBR4/BRsMbLxdzWO94PLrbMQa7JJeis0cEGh6n45DDHqAXKFpaWGJRR8fOjG
	IsKa2mIA7zwASoxUphjXNehe7M0f7J3V1YIGXq+riQ4sisY9ZHb4dn7CLzoRSJjZjsV1XdL5l0F
	ss38YvpK5vLl9FIWf+p0K8YrAhPihHdzijl7qxbZw8TgREO/J42ycKLHPuYcW0vl/lDrioDa53R
	1L75H+4pKKKhqrUC9yZJSt9ynMlbkHM3iIg/EWIyYbx9Vt0E6TjSO5pfkoexM8ViMesy03011cL
	nOTgis/37yrxGC86L4qZH6UqiSsBFzCUGD0X0ZlGjZTm7NTq7/JuPyvwnXCOIoVBlo6DtnQ==
X-Received: by 2002:a05:6122:1792:b0:5ec:d5e1:ee27 with SMTP id
 71dfb90a1353d-5ee34aebcd3mr3588477e0c.20.1794852655533; Mon, 16 Nov 2026
 10:10:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com> <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
In-Reply-To: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 11:10:44 -0700
X-Gm-Features: AclHuK8Q7HwxDEIcfyXjUFUI9dASw3q3swCNJxLwvpsAisQFiqmZU_r7ygT_THk
Message-ID: <CAH87RzQpJ3Nu31cDMqWJ_v_2SRm4mhKmf22nWXf4=c9CA75hAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome thanks.

Regards,
Cristian Filipescu
------------------------------------

On Mon, Nov 16, 2026 at 11:01=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Use the common Orange Pi H6 include and describe the LTS differences.
> > Follow the schematic's LED roles, remove unused USB ID detection, and
> > use generic PHY discovery with bus-level reset. The binding patch is
> > unchanged apart from rebasing.
> >
> > [...]
>
> Applied to sunxi/dt-for-7.5 in sunxi, thanks!
>
> [1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       https://git.kernel.org/sunxi/linux/c/903a676a19ab
> [2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>       https://git.kernel.org/sunxi/linux/c/a203a4bac331
>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
