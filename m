Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793700867;
	b=sTXOW7VoFx6QJAg/uMe44Kk4EIWmYxOlFiW5FXfFaT473NGzHsi9ieP0IrlPpeHTaNVL
	 yT9jLGRHtm6uCyVuNCOg55hgyrW5w+SV4HNdGhVACyt1r6+x8zfkp3WhVInOXgc79JQNW
	 LnDEzoCyjIiX9Xjn0eJ2aBd0cR5rIA/xVIcf3pBIN/WbJC40QoikZXJB33cjNjouk7mjL
	 9ORpFClkZu7CPZqoyTtjNJKmAeoYc0diaLASNDD9B8rZaGxy0hyvvYsqneQj9g3F1OsuJ
	 o9lUnfbU4BeZhJUBD6SUkyoeqKEebrUbNo28Isi79ECyjqeNfYP8JD0HUlCATMDibzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=T0nLcBf0nBf5qf4iyeI6J9rVyuEJhrxTvkxTb0mnCyw=;
	b=E48Ji7q7nmwcfiC254tJ5DUSRPAOZldLkTkyaFU41bDkUkJbCVH4CknM25A9jiGeye8A
	 I98n1U71kro64spznEGJzTlCS9jBllHsVQ0rGtX6csJjwEeVe0njVBRogLwfc1rWl2fgY
	 G4ca3CZpMXnDUgJrucWZHe70q/QMa74B/LmDqfaRNjJ3QKY3wqr1fnSW+K143MOBZNXUX
	 VENhiN7qzYltarQyMQsXRr/vUHu9T+ZhQRmU+0OCykOlMsNCc2x+JIUM/Dr4WzVhadzeh
	 ND1S9SgEs72jRqPLHhsk+rS7IAEw3YdP3/KyG1HUW7mD5JLT7IFC4qBZBvc6Ud8JNZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8Qcs2lu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E583E606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E583E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t8Qcs2lu
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6768403e9bbso3496169d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793700866; cv=none;
        d=google.com; s=arc-20260327;
        b=GxeI9LIN/YCEi6uYxejnZLVoEh1abmUQ57QD+deFhzyOL1/+PJTFAxzdyE61w3/zut
         eHewOCONCS9PSGOU6drMWZSl6atNA5RhO0JYJWb02xnVGXgG/myljg4l66XYC6QAEB8T
         bm35QS2T108+iZskXIFbIcFW5fa5r5frWmTf/GmEEeCc46OtZEvPwxWL6mkfCqlHvABd
         ZypGlpItXJhktePBTxf8Lqz1Bv9T4uz6agkYTEOcmFTc30raoK/hLtwod836Z3hNewOT
         tcThUoRUVsi5zfkUaaebYICoj1h3R+a258rCnyI3OKyIUtAWFnSu7pJ+eIfhD7Tgk+6n
         72mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T0nLcBf0nBf5qf4iyeI6J9rVyuEJhrxTvkxTb0mnCyw=;
        fh=qJ5tVSE/j2lwVUHA/1XhjMBONKFqaySX3Trr1A261MI=;
        b=Pqp6o637rXF3p99YjK4MUjqX/J3cTS2F1GbD5CaQF+Qgkx9DNi9ybh781VO2+J6pvA
         tu0AXh14CcuOp/G5N2zEu7he4wVXqMqbGMQzSQ8RxTjuJvZI8CpD1f39XUs4h8pw1XOu
         AKrLmiLQz+SLkeiaE4rbpswesI8ukXGBvtnkLic+sn7dcUqQsHH25oWVdI/44Wbt/PO3
         ZohVLpUTmaHnwTRcafjaXHu+X+PMdVB5t/8Cyqpb6tWHAyox3Kzb6n12f4TdQpVMeYZZ
         rklf5I/QsJhnltJ55P1kBIEh/6gXL4qu0VDE3ITRZvgAuR90l6cPxmchbKFyO/eVjssN
         iccg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793700866; x=1794305666; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0nLcBf0nBf5qf4iyeI6J9rVyuEJhrxTvkxTb0mnCyw=;
        b=t8Qcs2luhlgFOudfba2zTNBGHEiWb7KVuvJoAnRPppopssW/5QRD069x2sDx4QxE8P
         Uh+VdU+9LxvJgGwkYNIsqtSIDc0L6b88jqUdCysvX6dPuYMov5PGZ+OyKEQNSY7rJ4I5
         uvFpQ4KC5zcVvTRIIJDJyWwvM0r7KdnjNofbCIFAKptxcDcQrlFScQWpBrM2EFAxrUkA
         UfIqR3Fpl+3kXNo4dmHQq97e+IYRFC80PSsQ0dH9DOlhDvMWq4rJWb5qimBYRf09y6wy
         +JPn7OyMjGMxDSyRuCA5A01rAQ6BvOw6Ihw9iPVIGLztTQt+WBv69RLcVr6Nwt5W5yrU
         bXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700866; x=1794305666;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T0nLcBf0nBf5qf4iyeI6J9rVyuEJhrxTvkxTb0mnCyw=;
        b=oVTR/vDdMZ6hSX1unR37NyA82W1HdP/c1wfxn5wJMALKQy6ftteVi33RzYXBwGJ9kQ
         nvm5uCIoaeRDfF1ELLSwV72SNZ+W5NX2pyv4QIWaVN4krWl/VOWUdJX+25mzMZcN4qi2
         8yYrUoHbJpyzqEZ1N/1VBPbDCLUTC/xpgLnakXgAAmZnW595HdcnrA16+YVCqsVxe81Y
         fMX7dh495lCUSdcaUibHYbpQnEvK5VmZzef1vNoLwV8edJvO8ZLTI53+VywmMTfohhs0
         PW7k7+Ia1DiPz1DaqIzpJzk+RRhHNetmnN6weNO2W3n7KFiLjm2ohwU3HiNFraIgfRAO
         ebJA==
X-Forwarded-Encrypted: i=1; AKwUvBx4VE0Jsv3V7nw+FuaMqSwCJH3bhX1X/qUxzWMbhoJ4G6ft4lsOrtBC2aDBtm4FKJZ/nRvZKaYQrW875CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ii+/Y5wVa55Ps2uT9t1oyHSvwUEMAU7UfW7kwZQW+QeSxUDc6
	3MDktZRi0kkw56abqw99ZsSxG925SQ9HBj4tqs5mXLQTIDuHjz7O5RD9jGF7wiGE+MbVLY+RXus
	k8UapAd5nwp0WiNhcsnr6rAVCs/l+0X8wkGCa
X-Gm-Gg: AYBFou1VufVqR6912botn4zoUabA3bEBTxWqmreNOQobm4V316gMKkgE2nZvXA8bT37
	IBSSidhe5VdRHB06QguHFRb8xvHZFAuOhrpuKyzyGKAPQfPCz963ouCAXomHRh70vNp3mjT5n2v
	eSe1KD3xw3r6pZL3YMpkG5l151PsPZXZXk6C//4D7UZ3JuR6qLxSyDLjKkK37oK565pfeEhzdhX
	dS78ywkaApUX2QfFXDI/Kr+QXL9nEAHPbNEgHXZd5qGJg/pujtTb7hzjgNiYfaPYiJzwAxEWi0V
	QKFwKv5vOurzwbA/Tn9U/xOOrI9brZsUkvN0BLJan6UBD/jeT6pjFWwtVkAJ3Ke0P9/458kvs6O
	lcXV24hV3IH4NRQEdaabSamdCAfJ+m2xNtj6nAtU=
X-Received: by 2002:a05:690e:4011:b0:677:d849:d9a3 with SMTP id
 956f58d0204a3-67ba4c8086cmr12954187d50.1.1793700865796; Tue, 03 Nov 2026
 02:14:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 3 Nov 2026 19:14:14 +0900
X-Gm-Features: AclHuK_U0G7GWmHau4YutIqd0VEplz-5mJn3f7hxfE6UCdEZn8Z63QHq9vzTxEo
Message-ID: <CAKbEznv0ApgORxJO8BQY+XeDC94dqHz3GmdojwV7E7bdOCwo4Q@mail.gmail.com>
Subject: Re: [PATCH v2] accel/rocket: Report per-core engine usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sidong,

> +
>  static int
>  rocket_open(struct drm_device *dev, struct drm_file *file)
>  {
> @@ -86,10 +107,19 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
>         }
>
>         rocket_priv->rdev = rdev;
> +
> +       rocket_priv->engine_usage = kzalloc_flex(*rocket_priv->engine_usage,
> +                                                elapsed_ns, rdev->max_cores);
> +       if (!rocket_priv->engine_usage) {
> +               ret = -ENOMEM;
> +               goto err_free;
> +       }
> +       kref_init(&rocket_priv->engine_usage->kref);

How about moving these lines into a rocket_engine_usage_create() helper, to pair
with rocket_engine_usage_destroy()?

Otherwise LGTM. Tested on RK3588 (ROCK 5B) with KASAN: the OOB from v1 no
longer reproduces, and drm-engine-npu* times are accounted as expected
while running benchmark_model with teflon.

Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
Tested-by: Gyeyoung Baek <gye976@gmail.com>

-- 
Thanks,
Gyeyoung
