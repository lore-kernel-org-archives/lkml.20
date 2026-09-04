Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BC4908DD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525533; cv=none; b=PfLkr/8FI3YUkw9FVfwrVx4aZSui2F1ZJEpnCEQVI6sWzq0s6Q1H/KwjOOH7rYbnrGv2XqFgVYdfzGn50uoh8eoPyh6wZBDvmf72SW/X1Niz/eJL2jO2N3rJ9wnUF7uw7v5wxYD+owMNStOC0++7q1XqBZXffz69ZGNlvj2PVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525533; c=relaxed/simple;
	bh=g7NoS6ItxIGS2czWYih8v2M2HKgwLHdxDoGS2gvncFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plg6FvMaSOSj7uGqnzip59lQKGf6nkVIc8EzMBjah/g5aBHXn6LkkY1hdtk0If4i7cBuloS2KqJL77td2zJS+wFynmHMIH5DlQ3vqWOO+jLMxXFJjKEhXUfByw69OnziJEOP+GTN9xHshLnt1RGVcfjn0T15gUqo5e0i8r+utsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaslRoiv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaslRoiv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48442ea8f59so1545546f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525530; x=1789130330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4DYlh2I6RnjE99fsWSxZQSaKzcVINVi/U+pJerpuOc=;
        b=SaslRoiv2+RUqgBCTRUB4iw1S2XFdmXstCu+f4evLUT0aR+YdtWtoDux+RYkT/UAY/
         ffizGuELka+1KFdW25JT80ZGqHSJT31Y2Bfk8CedlcB8Q/BYPtR2qraLXrTG1Cu+A3oS
         YfiVNsNBzm0eMZWCa5HN522DrB0VCCUkX0H7XiQqpAbEreqwIp/jhEkg5f+ecwTWZv50
         YI2Q9dzirtIrZsHAj+mJVECpt2kEGo8IIv2rOSdZU54Z5pIDcANKPwcBxy7Ggr1ULIsk
         rBYlIX8N2z+BCwc9T/g4lqTHe0tZ4ZUgD8HtySZxcMJ8GwY7ABFu8s0zVq7d+mqDuG01
         zm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525530; x=1789130330;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4DYlh2I6RnjE99fsWSxZQSaKzcVINVi/U+pJerpuOc=;
        b=W9NIw09DQznM8zBavucokMZ3C5GgD1vKAInQPX8peo5K1rvO88iH+jSPl+ZtMyHSxa
         PHU4HctUvPhW8c47USYihvNBjOralJzG8L/2+zx7b8bX2ac+8RzcsrulS6FIKEofAEay
         K+OpQZERaqaAmrhw8B/rojiGvZVnUArt2t9Qnyc7COAPlmWwzJ3S6f9/vHRx9tKGtx+Z
         jgidG8NWi4ngdYYricnjF6M22ZpPaxxke/LK242bSa27WsH6ORtQZ1RaFdlvHey5kSfP
         r32hnLt7r1UaFxAXRQ28mdO9CZCFj1E7pgCKW51VD2xR/alKrL96vp2mZizL9X7qDzSz
         1OSg==
X-Forwarded-Encrypted: i=1; AKwUvBxSsmLRZ2ZVNOkRNxg0smNw+KiKv3KVksYJGbVXR1jpzQMzFbtU7yZShrmr6wEAlcO2i23h9rQZT1vv4p0=@vger.kernel.org
X-Gm-Message-State: AFuF++kivKXDa6yzqpJ/nr3NUhD3cTvpUIBtx7UGLv20g045rhDvopV5
	nevke2OJCLdmwxIaNnyOxXfK9fTIHgRPzKXA0536V5VbtuUNqLAHjgjzG+pyIp/r
X-Gm-Gg: AYBFou0eUsZinTZlhK+MEkckcFGzz65SMwcNeXyDOIwtH6tJWWa2AbYQG2+BJQM5LH3
	C34iy7oi+zpz+uHwMTwq2Lwel3uqXhNLpWHHremZLVuiYBwejZuv+g9gdLPB9tvYSCRyzmuSoRi
	9NSRkqwFm9iUJWAD707up1DRBiSSLbPKJVnHmCOiYR6nFMyCJAp3efS61yVgqsAy14w+jjdfDQI
	U2A8wgbLwsq+7E3kkrLmtzTamxMZaExuFgUamk0CLISz733Fkj/B83rLjXV2mho+bC9+XC9FgEL
	OUIJAPJHidYDfgrCaIHJuUo5DlCGft+AwR/XewZ11IDGe3cz5wTKUV3rix4uheWHtaFKyjBqNbl
	QMtPElK/HoPjl2uhy1dMs9E5kclEYe/FcSKzb7vaPaX5Q3pBs2bcNHpnZZomk7QiaNIr9kv07l5
	FEL+OTrhJBrAE7ZgEcTW7+azHvmsTYjeZctTbXIK2bsahXhVHZMjkK8jR9fXvQrNAR/qZmQ8Zpk
	j21pjCm+QS7fb7j3AbR4dOgmLRZMFx/UcW+Q709p4jNfoNzamjgJDCX/qH/XQ8Gi4GCek7v+Eqy
	qv6c3m7Qa2rAc+TLykqXYyaPpUrCqYC6MKmwgcDzfTF3C7V1T3d/BybJfBtbPedjC6qDyZLyxaB
	j24wjR1y3K/9v4FHQPFn8z5gtHkQkL/aN9F2teSLfzINzc3N+sNtvB6bqeTqcqLyb1LGlMQ==
X-Received: by 2002:a05:600d:8497:10b0:49c:f13e:e4f with SMTP id 5b1f17b1804b1-49cf891bce9mr30914215e9.12.1788525529833;
        Fri, 04 Sep 2026 05:38:49 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm117105705e9.1.2026.09.04.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:38:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:38:48 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Tuna =?UTF-8?Q?K=C4=B1l=C4=B1=C3=A7?= <tuna@tunakilic.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: dac: mcp47a1: Allow full-scale output
Message-ID: <20260904143848.00000d7d@gmail.com>
In-Reply-To: <20260904122513.175298-1-tuna@tunakilic.com>
References: <20260904122513.175298-1-tuna@tunakilic.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tuna,

Thanks for the patch!

On Fri,  4 Sep 2026 12:25:17 +0000 (UTC)
Tuna K=C4=B1l=C4=B1=C3=A7 <tuna@tunakilic.com> wrote:

> The MCP47A1 has 64 resistors but exposes 65 wiper positions. The valid
> DAC codes are 0 through 64, and code 64 selects VREF.
>=20
> The driver currently advertises 0 through 63 and uses 64 as the length
> argument to in_range(), which also rejects 64. Therefore userspace
> cannot select full-scale output.
>=20
> Advertise code 64 and make validation cover all 65 codes. Keep 64 as
> the scale denominator because the output voltage is VREF multiplied by
> the code and divided by 64.
>=20
> Fixes: 350d1fb9204b ("iio: dac: mcp47a1: add support for new device")
> Signed-off-by: Tuna K=C4=B1l=C4=B1=C3=A7 <tuna@tunakilic.com>
> ---

This makes sense, I must've misread the datasheet...

Can I ask how this was found? Manual code analysis or AI?

--=20
Kind regards,
Joshua Crofts
