Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF7328635
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737990; cv=none; b=fjqoGc8+qZUpP2PIA+QzSv0LmvhjhbXizsrO+PIZyDR+UHOeIjuUG2sFbVy59svE93XuDEJpW/RZYiqw/PHJGimRM+0HWjPAmKGwjQGu0aVLS9Ps3dhGjUSDU5AorpeR6gXTgNNfJAI8A/a9lzkvS42iVEivakocRQs6IJNv2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737990; c=relaxed/simple;
	bh=zzX+bR/bpZKQ81jw3RUBBGETlg6PdarFM/AeCbAvceU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t53hM9nd7bjQjfsWYAj7RN+TB+iOw+H1QVZ89D0NXpTn93ifl09FUN7gpaKmaE52H9fC84XfCXjC/LtaeRqE671VtUMtr4xJRkCd3moRLOmZ+NL23lMwjbGM/pK+fAQH8UbDM+N4aye+MA4pC0RHyQWK9Jw8FuqnVXoZy6ViPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfqcPhWa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfqcPhWa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so9605785e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791737988; x=1792342788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5RXedlLBJ3gV51QO7vHiNXtLHjWPUcDaWUWiW5a/LE=;
        b=kfqcPhWa1Ssq8wZOpxpsY/ZeLK4Ylyi6TCz2lWj6ZhUw8kSdANLNIUhz+cpmNe/9OJ
         CdE0+QUP1ekkl6xJ629PtbMpsOCEJJ87cX1PqEqLmYrVCUkiGM0JzSj7XI4t3d+IJlqW
         VTV7tfG/Lxppkw67g09VRmgPxiPQ3aCK/87TY9uNjrjGcy8c4HSgsc3YO4lCtronnPn3
         sOu/ky8V7uPFgPHpf61zndcJsAWS7idodJjghkqngKiA2igtUUcSQE2Fgt6+SNGF44HY
         wCjgvYUHlvgZSraRHq/DuoGKETOxASwCBcnRuzntsu4cUh9jZxGQlSiMBBQre1R15i1D
         /Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791737988; x=1792342788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5RXedlLBJ3gV51QO7vHiNXtLHjWPUcDaWUWiW5a/LE=;
        b=ukfS8fY2skH3zj1v3NnaOlk9BTzU0Hes4jDjsIp+mso5wrxM4ZqtMffpWQQIkqDG/e
         gddsaydXWYZQ96/d+0wRVrxwtMQvlEfUhmcGpbLDaVc4tQlivGKozqT1Nbhl0rcEp3UX
         HLIGq2MerXvh5iXeebyg8UIpbhAyAFe/vsDAxVEFSu16uSY0qBLFe63nE+WwEjfXvKec
         gP2vFP3IM+gx/v5nBYbY1F4gcZD+Ty9kFDy8BS6s5CGMmy/jrr0ZhMrYvjtI1Y9drVDr
         pm/VDzkkUNHcHLsv6wVBiVZKeA4mec+Dz3YLS3WipHtZ9BkSpvmxR3cDy9yBtNuUmaNo
         R6Ng==
X-Forwarded-Encrypted: i=1; AKwUvBx2aRYbSkhyTghejsI34kirJlpxzC8/AJGoi7YaZbIc0YNTlrX+Ae4kpzmhOGd0QYTvocdFDmNkFTnwQbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtNt5Qc6QvlMcTRH4T4ttGGjtBdBm8evd9SFZH5I+lm/c6LUjl
	vY8rg71Uplo87trnk9BkuARjABfMOdlmQ4hTrTU3bipTLNR9puZLAcwF
X-Gm-Gg: AYBFou0O24kIiMV4MJA0UL1Sb/dkZxuPKft2Te1B35Ovyc4HJnFOsuSA+bynpVzImYX
	QyWIap1OK0fkCFtdhV5IKZ1ULPm0wkEA2HWsBJN7b/XnDkcWu40iUykdK8lMoyTpzMoJ4xAKex3
	qQk7wsW7gbGzIoRsMGNGx5XzP38D/47ZTvvAuQI84ml42bRXVuJoNgDrlr/IVK7v5L4ylNAPAWu
	8QxXvAVk7sLP/qdUpcljV0iNMgVi41eeLSYiFrxR5hK0XQPZnE/BP1ijrk65/MpWwJyNX88iXkH
	/MTgHvvMznLJwNtTTsNifyYljg7e1J5i/IhdQiKraTtS7/13mBIeghkpYJZlMux4Zrxp5QvNKsV
	GaqqVN+mpBkzaoPRJguOdbnkv7cX/9TEFKVT6BzbI5O6M17EyKKMQHPf/DbKAkp+sUimMTz3DIA
	3BPSzYJoOM0wZxOz80W5VME2V/evIITrZ6FV+FEdcv3dHHkQXL00M+kZaZmUZbK0KV5ht6v88Mg
	AcMoPv4ADYRLuKtXpSH4B/ZsG+5WwUMS3poltoQ6brRnpFd1tDWqxpEFxzKScwAJUdvjG0TC7O6
	WRo/Pa7V+8s2LAuCBVUkLmhs+cb+qs7kpbA2wLgZum77FhjItgPdD265FIHzy+WGWJwkVy80nqf
	5kua+U4HqrKi7lw0ckAtAEY17FKI8TCY=
X-Received: by 2002:a05:600c:3d96:b0:4a1:76dd:8c57 with SMTP id 5b1f17b1804b1-4a18e4bed95mr121487985e9.24.1791737987931;
        Sun, 11 Oct 2026 09:59:47 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm305431435e9.0.2026.10.11.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:59:47 -0700 (PDT)
Date: Sun, 11 Oct 2026 18:59:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Lothar
 Rubusch <l.rubusch@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iio: accel: adxl345: propagate errors when reading
 event configuration
Message-ID: <20261011185945.0673cd1e@systembl0wer>
In-Reply-To: <CAF2O-sO1YuVQWLoNT4mRN2+mzFOG-WdQ5Nt80s1k+7PP8QUtFQ@mail.gmail.com>
References: <CAF2O-sO1YuVQWLoNT4mRN2+mzFOG-WdQ5Nt80s1k+7PP8QUtFQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 11 Oct 2026 02:15:41 -0400
=E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com> wrote:

> diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345=
_core.c
> index 6c9080d..5983fc7 100644
> --- a/drivers/iio/accel/adxl345_core.c
> +++ b/drivers/iio/accel/adxl345_core.c
> @@ -1176,9 +1176,9 @@ static int adxl345_read_mag_config(struct

This patch is corrupted - I assume the email client you're using added
a hard break here, therefore it fails to apply :(

Additionally, you didn't use a cover letter, so patch 2 appears as a
reply to patch 1, which may break tooling.

Please use git send-email to send patches to prevent these issues.

> adxl345_state *st,
>  {
>  	switch (dir) {
>  	case IIO_EV_DIR_RISING:
> -		return !!adxl345_is_act_inact_en(st, type_act);
> +		return adxl345_is_act_inact_en(st, type_act);
>  	case IIO_EV_DIR_FALLING:
> -		return !!adxl345_is_act_inact_en(st, type_inact);
> +		return adxl345_is_act_inact_en(st, type_inact);
>  	default:
>  		return -EINVAL;
>  	}
>=20
> base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83



--=20
Kind regards,
Joshua Crofts
