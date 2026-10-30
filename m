Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326203;
	b=nGBy5Lo5t9akxjPBsj3THB+xQogtjsEvFJlW8UueYqZpFPJdG99lh+gC27szU/fHqzfT
	 y7KcTmmJ6/Kh2XIIsrJ/lAZeJ/6rbFNR8LaI5ecMH+r1DjPCA0cmLP3Ei2e/RNAVpgwBJ
	 ammxF069n0MMjxgiU48sQKP98M1Vjnkr9UkHAJzoYIEgsHwf5GlQ0HKe1BOO+zvqqqEW4
	 tc/uikuzALi7DqIa15yDj27KevQDl37YvuQlen4GqbGXyKXvWKbB4Bdd2SqtjP5UFdaEh
	 LcO++7rTbsdmB5HadgJ87njS7MjpNmnTQjbpkkcn84tMZl48+nsENmnhepaqV111W7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=14ffGPbU3aLe9ZJ2h5R7RySjBO+SGB32Q5Hzs1k/SkM=;
	b=rZ3Yf1dIe4pWl15CcDpIvmoMhsHWIMKhbs7q8QnLbUtCj/V3anHnJqaZ5f+wiPpT5Bxa
	 pCBmi5fjF8IxkeeFjcir+hwSgR1tg6WKoKuiKc/OX5r/v3EG6ynRpO6nnea2P1y/k5d0X
	 +Jb33/rGPuDx+mHwOSbXxLZM6isuOdP25Rh54/61KwjiQfz6v207fZ2mHCz/kViG1aun5
	 mHpnOt19RZ+yHW+a29UJz5RKJNuCDBL2Pse366ziSKswRf0BqCw7z8v0Gnr8lc2G4h08V
	 yewC6HQ3n03NnY9ETbe8aTuVhbJcyATtmIHa3uSu80Y85rgffEjGMw8dU93+A8Om8CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HCO0N8T8;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5634606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5634606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HCO0N8T8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4322d310e7so25735766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793326201; x=1793931001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=14ffGPbU3aLe9ZJ2h5R7RySjBO+SGB32Q5Hzs1k/SkM=;
        b=HCO0N8T8yKlmeGF7MgISCbTWSX18kPc/loZXYD5N92sogFT3JHDP9nmw9okWO9KxPY
         3zQZeQHlVHtW0ntsrDQrufoKB86sedsFobb6uAVhOvLK454o+vUub+xSWeYaXKCvbC/m
         dnG2VeYce48EnNNWO/Hj3IqOmU9bg/6DVgbVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326201; x=1793931001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14ffGPbU3aLe9ZJ2h5R7RySjBO+SGB32Q5Hzs1k/SkM=;
        b=glNV0AOqzBdqdWtzQRffwUwZvHGvdRxVwNIfdsgydvVyoki37Mxua+ocNfU/kAL0fo
         7TlaQx4KWG9Pt83SB4PVZqfZ7uOT7l1cAIsvjBAYPewBzTZisWXjWnBzbERd+uMEh/Zv
         m4J4H/UoTaLyiytzHrd9FmrF7ltJHVhVTz8CrsvxdsixbhOtUz7sHhSYFIVo9ShKsfVK
         nth7WiUObgTRVAVc/yPQRIdDdnUkExhQbU2J6URbib67qwxcCOT6eUG6SieXsj8MHMt9
         L5sLAx39PpfN3qSyPjZN4vM8cqmbryebZLCmNK6mG097XoK/osq9gs8TGEhA3s7g1wVd
         jFMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdR9mhcSWkWTjnrb+4fF2auwBkxRgiewnK8m1sLgjCoj7HKIywjyKXuaIOpbkoTg7XYg0cevVwRVpi0D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+D2vO8sguS7IKwoK9f/F5dIzdwDVQJZp8gpsrWoBe8SnsBhGF
	YXcDUSieN2F2KzO7ilUvGUTppYsA66wr3m3LA0IAilrQAdRMqoKYjXEEg5O8SlN2ExS7pnk43Ky
	8KaeZQ7nB
X-Gm-Gg: AYBFou3snjZrRfdZm11v7fX1v8LRVTkrt1ISiKH3123K/OKoRSh+yj1qGaor9aLm5Fk
	xMMxvNFstZIQElAnqdGoixpiH/LywrPT85RqqQFEKfXSsDWcLJzzApTx0Ud9PRMZ7Tng6QT1J0H
	q9kQGUt8ju8uyTOxxzL/bQGZSMqhy1LJWD6f+vXfzYLsDAfv5c/OXE7sjTcct9v3jc9uX+W80q1
	o6ADhDL/CLzEL3eV9ttMzLBkGwe1H5qm13zIjC2F/zMAUWLwCV+qAm0M/Fw8ueX7UIyhhADp8Qg
	CVBfloM2Eh2FnpxuenarJFLS5mxiNG3biXv6bD4mewW5ZpR7rNV4+Lip7LkAb5e4MXNcqyzSC/c
	LOCDmiziV52haS3pvaoS5YPnkeG2xH8SR10/EAXYR19akMX5xbMWO6KYDTkNf1YwjQ0MeoiBu4u
	nBbCEXRVye6eRTwMDv9xosxXzrId8xjlCAPzHUkA5jKL/Bi83wYSew1CxQm8T53oWpT95vdhyPX
	TttIhGU8V7iB91cTiTPH7J1uGg2Csw/LiW+lJQgWm7M0r7dTY0x6LZIngVG90jNVNrHtc4kLc3F
	ODQJj63+XP66o06FA+rbgzVK11xTLRS+lfVq44HnhvualMJWi2e9wQ8A+HGKupeJ7Awz
X-Received: by 2002:a17:907:9612:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c4ca793c5f9mr76429166b.4.1793326201245;
        Thu, 29 Oct 2026 19:10:01 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f62esm8356666b.34.2026.10.29.19.10.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 19:10:00 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so949425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:10:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxNl9Sc/aZfEXURJMdhQoVov50i0yCC/Qib94igy5ZGN5xl7K478YwPJxVQ2yHpMLcsfuPT2FhEE+q0QL8=@vger.kernel.org
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id
 5b1f17b1804b1-4ac17b2c38bmr15532625e9.11.1793326199695; Thu, 29 Oct 2026
 19:09:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com> <20261012-mipi-multi-series-v1-4-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-4-6a29add1ec92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 19:09:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyhMTW-sAWPsmNSBSY760kYMQpcG7EnMX-B=RvCxj3SA@mail.gmail.com>
X-Gm-Features: AclHuK9MBVy1HRjgbqH_Cj8X-k4-4JomWpdaaPip0nkkrwu-aj4_DTTxONWYllw
Message-ID: <CAD=FV=WyhMTW-sAWPsmNSBSY760kYMQpcG7EnMX-B=RvCxj3SA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/panel: newvision-nv3051d: Use mipi_dsi_*_multi();
 fix minor bugs
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 9:36=E2=80=AFPM Akash Sukhavasi
<akash.sukhavasi@gmail.com> wrote:
>
> @@ -274,6 +269,7 @@ static int panel_nv3051d_prepare(struct drm_panel *pa=
nel)
>  {
>         struct panel_nv3051d *ctx =3D panel_to_panelnv3051d(panel);
>         struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
>         int ret;
>
>         dev_dbg(ctx->dev, "Resetting the panel\n");
> @@ -295,22 +291,16 @@ static int panel_nv3051d_prepare(struct drm_panel *=
panel)
>                 goto disable_vdd;
>         }
>
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret)=
;
> -               goto disable_vdd;
> -       }

Similar to patch #3, I would have passed the ctx to the init function.
That would have also fixed the pre-existing bug that Sashiko found. I
guess it's OK to fix it in a follow-up patch, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
