Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794554314;
	b=hz7lGoXbRI1OtNr/FaNf5ezm2dNQ7TfMx7NENVLSLFpLtAX3ClyFiKJd7uKzR72LxLP7
	 DQwwPgOoM91TW+2MxS62M5H7LoY6kB5VKNmK6BaU5lZL4MutMKNz8U3c+iPo/5RP/8eh0
	 p7lzBLoM5T204vbt3WQIAd/jME5Wc28sXxw/+pa2lxRVzBp5swYRX2ZtsVm9IioJtwLCu
	 AgHCrrXl43s+NMkZUzePZDvL/dIm1vnUE7T2g0loIX7SHcJ3y5hfiRUVVClR7IqPjrnXK
	 1YLXwaDTkGqV1q6FJ+wv1+qOkFBEfsgV181goXyyFGcoGGIK+ddO51RGka4lrM4UeIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
	b=MgCY9ICOYzbaykTZOwmqZvJeQUFZ/ITf+GxMrhGr/+eK8vKHuZf/Hi9ZGtgxCceMD1bu
	 iesTsvOoGu0FyXef9VL5k82NyVk+YM1B30PTVEhE/rqjTKT9Dh9Uo/Mo/dnlNVBnYxviA
	 QnBH+q8mlsFoNUjHRjXOsC7BdrIqMaGpbc4MGX4ZaM+Mk324baMSBlO0Ao7xDZKYbQBmb
	 TYBw9HISWQyYIf5KAnSvcCQ4blptU/lLaf+nrEv6zDmYqtNYR10cgiERrxMLM9Form+Tg
	 uSwAw/BT3I542wMb5FxFmZpSq7n5oXczseOfqNovlY/B6gEsRypwTaZhzXeqrczDtHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZ9FO35Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349E2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZ9FO35Y
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso664070a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794554313; cv=none;
        d=google.com; s=arc-20260327;
        b=fZMacKiN6Nkb1ouMlH61MWz/SfYKYO5HhIMLCjdDm+jZ8BAzZO3LPc7rfG66KJv2Pj
         oSMNsWxMFV6KB+Y0SCvjIkHlY2G+2UO6xWXFVVvzpB4P3cnseMpfdHgoY843BmPID+s5
         WZs+bLKTKc8A9CgcBO5DxBu4dqja6rjHnIhSMHj5pOujK71y54r/vlEeOOkLuXgcbNID
         jQ1HHjZIDE4niP19rBB8dJc2rrqH2FdZj4KKgOWKHG5nKJYVF5cUrRFoydJ/IIE52xSy
         XZEuk84rR8NwBJVdtq5HfVaxvo8tn3rjGfrDjqgNBboNpjKSi9zrgR5uZTpISdhY2UL5
         MnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        fh=yIb3WGsTFx7Hlnuusw+RDb7YQVO86DaKa3sjyJMvLN8=;
        b=GjqCAFmORLEcgbdHn1ZpcnPnT09DOXQaw6W4Eqs7UczpsKhBQzrsiLj986ovLn/vkI
         EKKif9zw8s7FVdRJnvwndv/zNDgx6QjTeoPEMyoOgQEAb/5tNiEzUsanTfN9hyffBVFx
         n9rHAfN8aMj0AIw0Ozg76ZSIkR5zBPXmilsK7hSOaYfXsDdu8Nhxl4SeDGyrYUw8tqt1
         1P9w9qbkHoXT2oPWNR+qZ2P5wMqvoWyMiRaVRbOxJE2O0EHEpiBCc5fgQAFIPfBFwMH3
         j549HUg33Tid90AxlrRFs3b2+TlkWPZFylZL2AxeHEhad2o27ByfdSWM1uaHcoeQ+KAr
         LQiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554313; x=1795159113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        b=WZ9FO35Yj2EGZ3glSIiD7E702fDDmutFYe/FV68QwbfJ0wErGMDSFndeI7bUHZDuzH
         1fsYwRhy01PCTAZ53snqly4ETL177Q6fAb1zukxr9mnZIqSUxcUmJ71uejWVdqHG0Nq7
         /lpQDQLbShA3vJ1VnMKScc+4zSGJUWM3NDuVI88nxRKAjjGUFPZL1QK7AcFAmxsbmum3
         bdsoNqk9m3VURMpsXuePx39UEpio5rM5gGzf05GSyI5ikPaaK5Dyrp1jKBbilKZGvNIW
         24fxaCAL+apzDOsnsYWvvsYflSmJzykcU3Ek4ElMPIZX4i1hmfsL2ZgemilttfVUcSuA
         shCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554313; x=1795159113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0+5b90eI0XV3LtvO+5dJ8DLir8th8z4fv/7Ku1cttA=;
        b=lvo6rmGn6yO5+QAS1pIfDXva71j4R/ocH3pGmd3YEHvyAOwl00zfkmf0wrEF/UiPk9
         lugEQq6KsnEGSM+9ggv57dH8uEE+zN0VrbDLEaAHSMlcqMR6GesJ4EoDM0t0/0f7wLH+
         NH0OWiyZEsdLnmGXA/HDsNIvqYRKHRYxQRbgoUjSP0oPTKUT9VsQpqURP+nVUhCR0NYl
         4pqlhQUA2YDjKjYpTdCljt76Xp3UEciT5tzCI9oL6/2g2W2TYKXrDQnAqr2XwquLzoOq
         +HClClYzCnXE9F6AtSYvvnrR2URMADl+pc19Xemlz7SRC57tXF0alx6818OYVcxl2/5A
         DoHA==
X-Forwarded-Encrypted: i=1; AL+hErED474DDQ25olCWIodmRd1pLtHFvn/ojXuDbNq1HjI4r0SbZ5b9xOFTVb/JL6tI+6RBIBkMHD48IZRy1lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p3O2uAxgP1raFzz48+WZNcWzlcySex18fzKScvk0EmMZLex1I
	m46Xfff6hAOrlogA9Y3i3GHMVPR9Y7PIwxkEph+EjTCOsiYx4tDo8NZKkg7IE1268R4VGu7053s
	Mf4zneoaA4PDpedRnVxmO09IigLMjA4g=
X-Gm-Gg: AYBFou2xAkFzYcj/aunfcVhADUXhbNRywSX9YGaiJpamjXArxYdIHHlY/Xk2lVQ7DvL
	KqzgLKHu7lRWccMHXfRj+pbwW8sEALE/hIZPjvC0B9BB7M1m2v0WlGz3gHMcA5isR4fT+UQDFnc
	nPfEuly/mgXY/jCjELMH3/lszyVq94OHMeBmkxGKxxeeZKFhZ1okhj+hukvA6wer2iNS5mtt3fx
	7rin7cixQTa5aKSCZ8QKqTsBnaHsBisWH472EsGApBY4OXZ9OfO09ihomKqgtBzwlyQywk4h6u8
	VL3aWH635kauTJ6zezcPx3OWbrOOfnwuTVrdCmvnQOJBHm6Nw2Vjd0AoQT31UabHwPNoHEVfhfo
	7rUvab5ijgQKW6BEw+G3UYGwJgMgfEuS+sHyq
X-Received: by 2002:a05:6a20:430c:b0:3e0:f8f3:ac70 with SMTP id
 adf61e73a8af0-3f7a7fc6dc2mr1584952637.61.1794554313512; Thu, 12 Nov 2026
 23:18:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110075841.12104-1-phucduc.bui@gmail.com> <20261110075841.12104-3-phucduc.bui@gmail.com>
In-Reply-To: <20261110075841.12104-3-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Nov 2026 15:18:16 +0800
X-Gm-Features: AclHuK_pBW-2Dpv2BcGIOJH5pev5KvmpGX7HHdiyRgy9dTc9bXL9f134N_0U2VU
Message-ID: <CAA+D8AMP=4jc-_Nwog5vqw6nsxjpniy_Rt0xy6ca8d7ko8MQtA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_sai: Report dataline configuration read errors
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:59=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> fsl_sai_read_dlcfg() returns errors from of_property_read_u32_index()
> without reporting them.
>
> Add a dev_err() call in fsl_sai_probe() to report failures returned
> by fsl_sai_read_dlcfg().
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_sai.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 59c9b8c28133..16197f9ac2d8 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1621,8 +1621,10 @@ static int fsl_sai_probe(struct platform_device *p=
dev)
>
>         /* read dataline mask for rx and tx*/
>         ret =3D fsl_sai_read_dlcfg(sai);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err(dev, "failed to read dlcfg %d\n", ret);
>                 return ret;
> +       }
>
>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0)
> --
> 2.43.0
>
