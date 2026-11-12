Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474570;
	b=K84c6r+3d/WFrdeSEsixTl6zSdBCScMSMlUbNUQlbfzE5MFV3rZ8EBQZ3/aJcK3KZO2M
	 JbJslwLAmeGOIIdrKP7BVQJrwGHQndM9RKrfONGv+vWPDCBk/SRVsIhNZO/ssAqwYgpXi
	 QUc9DAGTDLfpl3i5hcIztUYPEOF+uQMMRK1vPJCNdXJhVtMQXHmGxGF6L+UMKGxfB4kH3
	 jBtKTHXe7+uTM1xRsX7hOSkvSu3RXMqEtoBq6kUcZhAjV/lAsy3JDcvqWt2JCIup1CdlF
	 4g27cwSyfHs1PMr+v5ZQ3aCK/HFoDEh93rwxfJHQeNEsKhvlRFGuQHRwO97Fl5x8Haw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
	b=G8EZs9JmnY1ZvmMjUx5871RVzxho0nb2Uksb+3KBL5odI8sGAhLmOJf2L6w2XgQRJGDy
	 2DvFjiomzxLF38KTwURc0yvcVDSGaucSbTcOXizketRfE58MNbru5fBAtmg5DU3tFQwlN
	 p/uH6mFLX3GkFwjLrNKuYIZHrcFcyBo/tTAH//iva94+6/JoK+UNYelpdScA/orxct9Tb
	 6XCtoAqQzA9YvM/W1/WniZ2m9T2/wEVRr96XflsikIori5c3s5jQv5iOxZLE8VLKohzhm
	 qMyCNZS8p3YbqRvxPdkiF9TL8mXvL3oxelYmEMpcyxm0EE6msYAIrPJA9KOJW881N6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQ70lWv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52FAF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTQ70lWv
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso3093530a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474569; cv=none;
        d=google.com; s=arc-20260327;
        b=azNz6p4bLvFF0ipl893OIfH7E9oO0LNdYBz1znCz5SHOZYh0qHjqGLMv6BTdpSHvRL
         LZS6ysQ4KGZY+Wh49TctMb9bdDJciV4E3UnvpX7vvutxPA0HFGYn3PCm5CBLXYPOyEWI
         HcBdQ3kPKfNwfuPAnU0KS5W8a9UWyntwzY6nuidCyjfH+5Iqf1RntlwMqbi2EWQoPrzI
         2AqfOvaRzmj4h6Ynkh+Yb3JHNXjhspSzOBotnbnMSdu3jvBYT75n9JWoHssNBrxDULHT
         hfV0IHD8/H1QL60HoHX/NBcYGKDlFJWwYoaMXcBbE6APoCo5tFPoR51INecvlVCKMj8o
         C9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        fh=s8LMiAyOLYn1s6kIoRq/RUmxBZGcIB74ZzLpCdJCiKY=;
        b=DyHkfoaFr4IE2S2BWnBT1Pruz2OsoCW0JFq9hWijDKM8C+695ySV7IsZG6m7G/9gmx
         1/vTust1Ac9NpraW6tQWI5xbyTUQ5kIfRvtau4+sQtFQe/fHi0SbZ2llJDxa6Fcl6WP+
         B0z1P1BaVIPnMNiMpEuZlQs0Yk44UixAFWApb1O1rI4s2GLiYIVY2qE9sQYQKKYB6xGk
         0BW5Ki+qL+b5rrytgEQwe3Ig4pTd7fhDDAqiyBnRkR5/cOi9wGltMIkvZUGgigW6Of5C
         jqyzhKEFH6CyHMxSrMrKBKhexGo4DmIIKJSZ9lIiWtBZK/immjfH1HgfHKOAYhkbbDuP
         GJXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474569; x=1795079369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        b=BTQ70lWvFNuSLgFt7TPP8jO7aRQrgictIqaJkvYVwxfCVKt94For0Em5dIM/T3/e/p
         V3tO8e4apQBUPqw+fNkqfOMMAQRk+F6xwfdaVn901eAf+L+eOonhxH/VgTK8CcPJIFAM
         Z0HJdPZ+MKtUEl5umuWI+EkUbm6v8B4SqUcJ8BzRPxmucMckwRTPebfdrLdyz/Ve+hOI
         ajAbO+N7jrU8puNH19kdDLtbc4c8W2Zry03S0GUU6w/DmKp50jUV40rsuI2/mJoo2NBn
         p3b29SfKb+puP3zEWpuirRYH3Ru4PUdboUxq/GEWhIHNl8S7OT01TOYwCvEJYT02rvJv
         u/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474569; x=1795079369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1VFMCdsJy8HJueFJ4vPvh9lfR0tlzAuULdL6Oym6I=;
        b=d8vAUD/zKcTxGZesNIN85eso7SKTg7K3xyP4ZIohnwawwhdaZK9qaopeo1lwmmrxga
         tKGdxzlfGSI8P2vU3tulbNxPkeEWI8prrnHQ2YkjOJch6EGp59eBt+z9su0atquOAX5r
         N1F2SlhMaWSxwWquOQNq/jD5z7j6FvYCMuqJ09NUJppXNw2r5acGIHCVVpahfZ4AmbEH
         jjUYHVdhg4tttv5YUsoQHcSBHYJe7YWBRAv9hvuTwzNIVpAOcAdlKzeA4Hf9eFE14Ebf
         zT4A9mkZhyJSpV7TSkmfccZLMNhrOuaPJFrd1xklkZCO1BmVvCpuB2vj6b8/KnCTCP3G
         p8Zw==
X-Forwarded-Encrypted: i=1; AL+hErEGGpxPRvpiJ4LCaWLk3hs0dLUlOAf6SfJLpRzHnMPczc1fVokRE5CDelmWe1hW26/uYV4ZVnaaCz2pylM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9rif1SZnFzTX/QX3bLkmy1/JmlTMFw4hSgUQCYADVfiYylsAf
	rfuYOe3HV+Gz8bVPS6kwZfeU9UVk/l4ve4kxE3nakyC51tOn7Jg59nxi40avcptOr5gun5uWJ4t
	dsg3ZHIMOBFWYaKi+sXyibq0XpV09OiA=
X-Gm-Gg: AYBFou3uJchqHBBjytaJcIYNti80n7Ct8eOq/rP3sdLW3kAcN5jBkccT3J3HAUDVnK3
	b8RsWHYhZPmKwlQJd7jnbdeMXfu+B3t4lL+ngy2pxRRbhaN3qp3GjlFIscEeOwtVLXTwMxsNDQb
	DaD4gsgvIyZsbHxJ0MRCq+RlB85NXFG9z4zMQiBelNcHttFSrkf3WOMCgC+p+LZfi0XwoF/xcKO
	5H+jNQwlcHrwMBwzDT7Qbdq/CQRi5JMLWwpzFxF89YL50/m5R52Mfi32xIyZCtaab2WpLfk+YZD
	4s+fVZdy+JrGL1F5b8MazJqlF0h3no8uaMGv/KoWZJn24ySbquzlevXAub/lTsuAMLqJV+PL/AR
	HwS71BmWrIO5Qrg2DW3o+IHRWg9HzesRHjKkwa4BkPn2W2/3LBismQ6dTTw==
X-Received: by 2002:a17:90b:2d8b:b0:3ab:be66:ddbe with SMTP id
 98e67ed59e1d1-3b182edaee6mr4922233a91.28.1794474568658; Thu, 12 Nov 2026
 01:09:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-5-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-5-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:09:13 +0800
X-Gm-Features: AclHuK-JKdWd-ygPOBooCSX9cuJhp4rfiioKNxZzndhr2LBJ_ZnCQJKwcXGP6Go
Message-ID: <CAA+D8APshfNo5Ubooq=DnETHeUsAm35Z=LaHUa2hh-p6S5L3xA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ASoC: fsl_easrc: fix context ownership on repeated
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> hw_params() can be called again without hw_free() in between.
> fsl_easrc_hw_params() then requests a second context while the stream
> still owns the first one, which is never released. After close, that
> easrc->pair[] entry points to freed memory and is dereferenced by
> fsl_easrc_runtime_resume() on the next open.
>
> The EASRC slots depend on the number of channels, so release the owned
> context before requesting a new one, and make
> fsl_easrc_release_context() ignore a context it does not own.
>
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_easrc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 5d715bc07357..ae0fbf6c316b 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1347,6 +1347,10 @@ static void fsl_easrc_release_context(struct fsl_a=
src_pair *ctx)
>
>         guard(spinlock_irqsave)(&easrc->lock);
>
> +       /* Nothing to release if the context is not owned by @ctx */
> +       if (easrc->pair[ctx->index] !=3D ctx)
> +               return;
> +
>         fsl_easrc_release_slot(easrc, ctx->index);
>
>         easrc->channel_avail +=3D ctx->channels;
> @@ -1500,6 +1504,12 @@ static int fsl_easrc_hw_params(struct snd_pcm_subs=
tream *substream,
>         snd_pcm_format_t format =3D params_format(params);
>         int ret;
>
> +       /* hw_params() may be called again without hw_free() in between *=
/
> +       if (ctx_priv->ctx_streams & BIT(substream->stream)) {
> +               ctx_priv->ctx_streams &=3D ~BIT(substream->stream);
> +               fsl_easrc_release_context(ctx);
> +       }
> +
>         ret =3D fsl_easrc_request_context(channels, ctx);
>         if (ret) {
>                 dev_err(dev, "failed to request context\n");
> --
> 2.53.0
>
