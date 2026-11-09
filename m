Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202398;
	b=AFszl5l4TtotVkVf6B88udRIDFO69Dz1F779eaCPvYynaR/7AVsrRkBYh1FwcFgK8AOM
	 mhnPMN09+KhIVcDD6a7Zq0qOQkQeW3GHxj8ywTFVYe4ettNThkKMW/cuY0d2HYnfA4aCm
	 XTNa6jOq6DhDa+gVYySnrfjt3lKMLSpzCwm7Pv5T/ysAMD6/cQpSafLmXs4TGl+bPT47i
	 odtlkyoEnfmLzMQTH+5RIIC5k57iwyZejdT54ti3ryU2Np/McayVlwLUSIBW5V80cK5Pr
	 2vCLriyF/B+64/0uIUbUOgXx6TdW5e1JwxGc5blSsPseH4i498ikwUyFI7vazv0uLzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
	b=gGbThCAqdD95MpjzoNgZbmU+zT2fezt+2jpKo+nSNiwek0oJXGXWaV+QaWl9gThsF1fG
	 WpofJ9bY/JGeihW4O2M/Jv/hBbr17pfz/ZB/qhxv7REXuLDcVWGaKnISRV7TWCrkklgOM
	 zDhpvAEw4gl0Eb8TXN5sNSgUH1k3CPKt6Eyky7E6FX6yNWmb+S+iJZeOqUuHbuvR7JzC5
	 k0teXBDZtCDTaKhUO1QCI6Yr/ObNX6UCHTVuLR0F/Y35H83AwWTbZ3bsUFBgDBgUJ3vg6
	 HvwyS0BxZRpC8x7awDjs9k487xvLodhS7W1LpHx7+NzccnvsmFhYnkpSlxtf0BXgGyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKRXQ1NE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B21B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MKRXQ1NE
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d30639709so49707766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202396; cv=none;
        d=google.com; s=arc-20260327;
        b=b5/q5YLzWDMjSnpiTyo3jsd4JKcdXyVwHvBeRWBR2uhUXH7/8NnKnZcAYPT8vx7HWz
         NRvkU+jzKG996cLQTtlWgq9qsl2feU5EoSeujB0iGz5Vcstx/I0xu07A61eaOkD/o6DY
         MJEf2lWmPH+gEiUlw3e4HLRQABDMVDUSIVK6+FJk1GzX4Eqcn9EqIsqYSnT70OTyK6eB
         0F/AuR1FDlITVd0WL9pzV+Qil0+o9dgDz1wZ/a8o23F0xD3zC64Q0S6TMJSv4btUFHVc
         kg/xfkpzajktZaUyO1hBBxL23jyfCYB+5Xo34i0KgzVjEGuh3d3HnWZ9UQ02cBqPf9oK
         UJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        fh=Br+aqCDtNS385Xrt/qqPMLSMdNxcNhPxZ2z/QZWZqS8=;
        b=NueCODvJgWZ8K9EalVKrlt5EHGqVOT/Ps90yUMrXxuOJ/XV0WZjlggGJvwOs0sldLS
         M4hEObXCysYf79TsVGROCdl0U0IQTEwc0JoQYyQxSs0nhwuiuO76mjuszKpcvnrtTImn
         9h+Bpy/1okWA6ITXmr/IHIduUcK0QErgyoqtYqBzsSz3fAekS0RAB70jdiaax+R+1Moa
         GaavVfiovCoyA1koqx4B/cZICv8KVJ62YbfHmYGYxBwQUn4St25nGhU/anY7X8qdn5Pl
         JeP+inq3IUioEbzGuyejlcPlIcp38cqYz4NT2uuxPBhIfhyrGWP5aYP9IAx4Y5PQR/De
         ikxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202396; x=1794807196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=MKRXQ1NErW6Rfj0Xmf8qNxehQvtjZDoy1RkbsMJOxB268VqPTbH+oAj8s658rpUsg6
         cUHaYdVep0KePLQeZwOmKE60Ui6EL7NI2iIL/+I4u+BANd8OhLmf2cNGJQ/mGuWz4KZA
         pp2ITyUkVOOQbBDVj0sxaMPIknuIDAUGMKLrvMmAckWQL3vva6DdvBZDiY58XbX98jBU
         hj7W4p6JRyE2UIaTkBjcMkdPeWSjE32wreXJ8DDr7GqGZgnpS4UrhABTZuApVyFkQTtT
         BzXw1v7mFWFL8hjfezYE6qTUAibE8sEhBnkLzytWG+4vUe+RTQkdk2Ir9mmo2pqXhyCt
         543w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202396; x=1794807196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM6oEuV+WEcl5iZPW6qWHn//Qd9/cDvZHfthnu4mT7k=;
        b=WyehBZc/XIezAhtxaAD/0D/8xSvKeOOT14LUa7v0mWyj/sv/8mfafYQnjGWV0nLtL3
         mCTKaX+89gweRihujs8b37MpEnHrwCEH3fdvktCrH31T37S9xMBpS37HWy7hrDFe+zNs
         aakv6REcO+aC/Kbhd4mQk/taDXL+iiqi+un2XiHWqZpUwTX7X9RndWbmzJS/P1Nl//D6
         Uy6RbQcnbyDpwCFU+vwPXKNSsA+FDoFjzCoV5BuKcacwKrJbHwoOPuXIVLkmKPTezpXx
         HTTtxblsxoEaZ0RJw94Aii00ChReG7m6aT9FRFZNnyzUW8HwXNlZBgLy97Bw2RI1z8u+
         C7tQ==
X-Forwarded-Encrypted: i=1; AL+hErE/u/AyF0DeP3zZmaCqtdAPJ4DvMQP6CoKJS/7MOLtwbl16NHqlVRjBStDlsXiJy1kdlBdwmonbRKhKRYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/Cm69fU8g4CArhVUQU3wwAmeJCCr/5F7pPcKbm8aPc5HaxEWz
	1MRuRxcmNy3tf7fbXICy2JOrtoOvqKZ2M4+X4XxEqWOZw7VIGdEFblXQ4lsnKfQ1N/CTszeV6UA
	T+Z3I5f5EPvm6PKiwXyWhCi8wbYiockc=
X-Gm-Gg: AYBFou3gejKx3QmERmLyFVjYDnDlhyqsY09dyl8/0+8dAh+vh2Ga3SENhuCJnNblb7V
	3P0LmPNuFHJeDyzI/JD3uTzAA68EjYvbdY287ps4LmG4qiMJ7kQ9Llp38TAQ2c7lw3pF1RRryVC
	hTeU88xFy5cDtWXU0FfBRu0lC8VLgwkIVLyunnvbQ18VOr4tpCm58aqlhcWovLSeA4WAnbiGO5h
	3cGdTMI1/y9VvU5n9454rPFujllfsLL+eFXyJ9ONrktYcIscxWg5m9lRTGLedNwuwDI+qgXUzXy
	k78fH7JSSbpOWX5nTNG85hMDOvOsoQIEht+7QpKQsMbIV4sDK5FdWqyFmcZpW9n73bnxz9Q/Ff6
	F+Hb+cgIxDobqGhyjS8MKfICZQ2Lq6B7gobzZ0evqVZrk3QNpgY+gef4WlK/f/FE8ZKioulw+DM
	Eze8t00tT+GhYD
X-Received: by 2002:a17:907:6d07:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c4d6db36f84mr196935166b.21.1794202396398; Sun, 08 Nov 2026
 21:33:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261102104642.925-1-laixiangwu@cmss.chinamobile.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 14:32:39 +0900
X-Gm-Features: AclHuK81e7ha_bd7N8D98DCzYoOYBA4JG5Pa3ARfHZchUTi79ZwM-36h02cCqWc
Message-ID: <CAAQKjZPOqEYe+iabUsdyfoxQyRRWUnX3Fe3eqEN8Uw-NU7vSFw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: scaler: Fix runtime PM reference leak in scaler_commit
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 11=EC=9B=94 2=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:48, X=
iangwu Lai <laixiangwu@cmss.chinamobile.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> scaler_commit() calls pm_runtime_resume_and_get(), but when the
> scaler_reset() soft reset does not complete it returns -EIO directly
> without dropping the reference.  On the success path the reference is
> only dropped from the frame-end interrupt handler, and scaler->task
> is not yet assigned on the error path, so the interrupt handler will
> not drop it either.
>
> Each failed scaler commit therefore leaks one runtime PM reference and
> the scaler can never runtime suspend afterwards.
>
> This restores the pm_runtime_put() call that was already present in
> the error path before the conversion to
> pm_runtime_resume_and_get().
>
> Fixes: 445d3bed75de ("drm/exynos: use pm_runtime_resume_and_get()")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Merged.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm=
/exynos/exynos_drm_scaler.c
> index c8a1b6b0a..dc8189685 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -372,8 +372,10 @@ static int scaler_commit(struct exynos_drm_ipp *ipp,
>         if (ret < 0)
>                 return ret;
>
> -       if (scaler_reset(scaler))
> +       if (scaler_reset(scaler)) {
> +               pm_runtime_put(scaler->dev);
>                 return -EIO;
> +       }
>
>         scaler->task =3D task;
>
>
>
>
