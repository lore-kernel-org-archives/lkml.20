Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714629;
	b=QxBhLnSDcI4WbVuO7EET7s9XK3qx8OQ0Ot6Db1dC5QG4hyV+tmycHoecOEy9N8wZJ+4d
	 kNWzazwFXrFO59Bf1doorlsoYdU1fjDwVeAZH6ND0rwdQL3bGzQ/wPxPY05Pp8OkoNDJI
	 OedHtM1bPOBvcOjUJ1Zug6/70Jtf31trvdgLr1ZXij3+CKNZNEjiYj7KBO/sB0MfAz+qz
	 bVcBT8JdO7+mF3KKpHblz8rmiUp9in8aTYLGQgR4odSnHwjDTLijXu+SQ4bbtq4ASsqOO
	 yT57kQupG0keAKZRctvor8NLvlkIcBVnQa4rzr6K/W2SOZ6XtuX0rKgK6LlsFNCR96A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
	b=h9yTf/Fmb2tJo8l4pK3gzHofHxJs91RMFPK/guJ0pKUwRy83Te4MhZNHy4pf+p6SGW3o
	 7nk8nRxAMwEoZZFF2XLMBlvg2zOcfBGM0WwSSB0+gmCX6vRkj4Y32CNeNJk64Ov78ogW4
	 z6AvVRaQCnyqHMJGL9aoNaFyNOG46jWxY+H0BiQsK7u2lWsnyhZmj7tF3fwg5MLvAUVTi
	 pl9lLiXYohbvSre569jnWMYIvbxd/91IgPc8AvRlzFHR1K6VYCny6OPCHvs32Wh4yEj07
	 SR/m8Epgh+A0PHOLFlWvViweRwtDUYTDho5v/ORPAPtfwLOHwjA2T/yH5TiieTt2S8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4mZfUJ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F606071BD2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F606071BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4mZfUJ7
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2477858f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714627; cv=none;
        d=google.com; s=arc-20260327;
        b=aK6sJGvKb7eVa5pjuSOX3p9FWKFmNS6wnx/BRLruPqAdVqaIU305C2gywR4qgZ1PQB
         v3h/qeAAp50evKYd43oBnmRHT/Wj5BbxIb9NlwYMzI3xVdPHEe0VZTP4+ZY8dm65L0pk
         nInI19qEhCxThWf6if9UmnOX1hzpQAT8HV6Ym5b5rEntdNVKOFxoflgHbC7iAc7GwepB
         KhKQBcJpLHQrMjnXwazAh7r1grRu+5aab/KFKP+VDWwfuJaGQe740RYoeTLGvtcQYmIX
         NqIgHOdAIcp/QqfjJ43yeuFL9XKRbjiBAW5D7XR+M3QE4FcXeu9e+GYsHsCYavVFvMV/
         T1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        fh=WJGZVXa4/O+RmYrUz+ev3CUHzJ7CkceAKiBx3QJOFaQ=;
        b=cFE0On5QwogDqXjcf6GNOPVG/jrYGov2mOhSpudqZFwaJ1di4/dCejg1IcQ4m/tQkg
         aVgsLh0UpHytojsqHVR1SNlsj9SxY8X81NkHBvTyqrYIUWmmj+TL6uC6GZ6CxjiK9VQ/
         QKjYLBCCWH0MHcMgXDutOByBx1HFtouPLEMiehvN2NGnJsSeqxjt87ieFonbOt3CF1L9
         g6Y4QBGt3AvIUVLc83cJ3KVBuHhAQKuEh0cqko1oJUO8B3qOGUbMyMUiXbeG2r72zkhv
         G0Yj2eUBIga/NK8re2F+HovNaM3GOExMdYR2A7VCNE+04bBOHT6kpW8jDN024DRg8KdY
         U03g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714627; x=1794319427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=e4mZfUJ7A7a8iaDoHeZNcPNu/+CUH+2+6ZCaJVcqzNhCbPI5HXDRpLYwVgTKzinAMp
         vdlHKExM5IcuSQCBgk2KTnJVvIv1R9GryL8ma9Ew5xv8FlAio01SzeKcQcI5ji4ySfjd
         jSAQAyoTxu6R1edo4NkOfXCd5hk0LfpQ9UnbrcN+HOK3kE3YbvHA5/uRDkWbLfV0gRIU
         5DrrHuT9rGliqmLyXossXTnTkbfNtAmihKyCbbRr2GngOXttEFoJqiVEcT+2h1pav2Vr
         dLeryfGKX0rhY2VHMKOafLTTQtNsVKEthvOe3etVFWOnyFbnWujkW8CXN2502xR4LYHA
         Bang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714627; x=1794319427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mpQqPcx/wO2M/JeyOkuY7Hd6GV1/TOLmZZItrx8K9I=;
        b=jCbQrYybL0AC4ogpxLxFBgjvnhLQulcYNJ3TXETS57VR826XBPz2+OQnKoQOXQP4Qv
         R5IrbywqJWRg7bv0jGoL9TKd0iyKD+UV8Az8Y6XhfIP3FBfMFitD5FgpJx0aqiTeFc7x
         yQ1UnZ7/Aajdq5O2G6ec1T3siZGwEj2PkM7z0wg0f6X2+R3MY2kuzbPz+Knu4AF4VySu
         9OQyzeudzs6xW4wgnjjD0F5pJoPFxAzjc0z8X2mK7M2A0fb/VfKawA/IkOlH+CmNJEVh
         V1mIAGAca6DhJCzo8moYvCS3ZqEXlRHiiJCP8/XT5J2GrqUqheGVaIsMQwWmtVNKKKV6
         mzUA==
X-Forwarded-Encrypted: i=1; AKwUvByV2wfxO0Mst/aBu8CHTfHFMVaptT6Sp9BgHUqLSRsccG5a9uQ34O2EINK3xh6xv1qFHGORk6GABLTBFW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a42fH0g4OcAZS7fLfKfPrDa5gDpQzlA2cYfjm6zAuyWc7OCSS
	ObU/y5e83jAcc5bCCblvAbc9tokItxbY1qkGCgD4/qb32il5aBfpduoD2mlwaASaMBhVT7iQqv7
	OtzTp/l0LYujEqyt2zCAWPYo9mhCRV2g=
X-Gm-Gg: AYBFou1wTlMZaL7+B+1X9R7Iv/GcC8jTPeV57WUNtb2faw7uHKis/RaHj8k29qLoOMP
	lrvU/YTo+yVrmT0NvqL769Oc6VwZgxX3NSbPHxrpaoO0lYNS+RplzEZmKSKY7jJ8BCerYkGU7C/
	xCPBL3OlfJ5B+uKFmVXPUd8/wVA9GgklBSKRsgVMvQXAW/EHtjvyCj7oznuVYsnWTZkvv++PC/R
	FN4cxlF5jVFbJs0rU2M/WaTXg1eD+4UMhM5N2S/WdrYCG82qOvR3qWxwUiUFuHQ+DP8WCKBF2sp
	f8H4CUKU55T3Zd8z3mnsERv/AyY9hRszjAd7q2pChc+fKHebA6B4F0orOVEr05/pi+c4OpERqh5
	lWSanEiyF5EjLuiOL9g9/r8xIQKZ/3Io6mxq0+VEVklH1603twbNgDgOFFLudalAIYmnY4y951Q
	zZo7mYSSD6+dWZgxMGp7hTVniri7+8O/PEX0ayMv16AGPcQg6VnX1vosbx
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id
 5b1f17b1804b1-4ac1765d977mr282488195e9.21.1793714622717; Tue, 03 Nov 2026
 06:03:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK9lTBNUFEhnmVUe-0bw9b56qg4kVZy5zFZ6xKayAE9tcP58fndIr_XiG0M
Message-ID: <CA+V-a8t0bf_8hc1vd7c+OXBQfgBjp6EJjDALm8+myVYRNzy-Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>, 
	Felix Gu <ustc.gu@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore <cheick.traore-ext@st.com>, 
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, 
	Kees Cook <kees+treewide@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS RZ/T2H / RZ/N2H A/D DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:55=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/iio/adc/at91-sama5d2_adc.c                 | 3 +--
>  drivers/iio/adc/nxp-sar-adc.c                      | 3 +--
>  drivers/iio/adc/rzt2h_adc.c                        | 3 +--
For the T2H changes,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>  drivers/iio/adc/stm32-adc.c                        | 3 +--
>  drivers/iio/adc/stm32-dfsdm-adc.c                  | 3 +--
>  drivers/iio/adc/ti_am335x_adc.c                    | 3 +--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 78081cbfde5e8..d479c9bc9b3e8 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -1240,8 +1240,7 @@ static int at91_adc_dma_start(struct iio_dev *indio=
_dev)
>                 return -EBUSY;
>         }
>
> -       desc->callback =3D at91_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, at91_dma_buffer_done, NULL, ind=
io_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.=
c
> index 2f716a2f97b80..82d8d921b0293 100644
> --- a/drivers/iio/adc/nxp-sar-adc.c
> +++ b/drivers/iio/adc/nxp-sar-adc.c
> @@ -696,8 +696,7 @@ static int nxp_sar_adc_start_cyclic_dma(struct iio_de=
v *indio_dev)
>         if (!desc)
>                 return -EINVAL;
>
> -       desc->callback =3D nxp_sar_adc_dma_cb;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, nxp_sar_adc_dma_cb, NULL, indio=
_dev);
>         info->cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(info->cookie);
>         if (ret) {
> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 8ba7b0fde8a19..3e52b7d660dd3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c
> @@ -394,8 +394,7 @@ static int rzt2h_adc_start_dma(struct iio_dev *indio_=
dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D rzt2h_adc_dma_callback;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, rzt2h_adc_dma_callback, NULL, i=
ndio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 600f975f1d7b5..fa2a781e37777 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1901,8 +1901,7 @@ static int stm32_adc_dma_start(struct iio_dev *indi=
o_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_adc_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_adc_dma_buffer_done, NULL=
, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-df=
sdm-adc.c
> index 674767da3ac37..f0239f5f30afe 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1006,8 +1006,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev=
 *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D stm32_dfsdm_dma_buffer_done;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, stm32_dfsdm_dma_buffer_done, NU=
LL, indio_dev);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_=
adc.c
> index e53c839e87ef3..230f1c990317a 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -259,8 +259,7 @@ static int tiadc_start_dma(struct iio_dev *indio_dev)
>         if (!desc)
>                 return -EBUSY;
>
> -       desc->callback =3D tiadc_dma_rx_complete;
> -       desc->callback_param =3D indio_dev;
> +       dmaengine_desc_set_callback(desc, tiadc_dma_rx_complete, NULL, in=
dio_dev);
>
>         dma->cookie =3D dmaengine_submit(desc);
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> index b9f8b5b3aa6b6..7ecb9d875b8e8 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -160,8 +160,7 @@ static int iio_dmaengine_buffer_submit_block(struct i=
io_dma_buffer_queue *queue,
>                 return -ENOMEM;
>
>         if (!block->cyclic) {
> -               desc->callback_result =3D iio_dmaengine_buffer_block_done=
;
> -               desc->callback_param =3D block;
> +               dmaengine_desc_set_callback(desc, NULL, iio_dmaengine_buf=
fer_block_done, block);
>         }
>
>         cookie =3D dmaengine_submit(desc);
> --
> 2.43.0
>
>
