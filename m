Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474541;
	b=wuja97n3YZJupum/SSdhgavTx0mcISjD0zoJyJNYLsd4DhFeYVaV327Cj/ltYcmrBKkP
	 dwd/bwBt9mTm3PI6gx8j5AoX4ok+X/i4HmuimnSWER5mANZszqSFsq4HAPJXcTE7DTneZ
	 o3a8EcL+BAWV2PQ4tHyKZ2iJ+FOQwFJ6pMPeViN9ipVcgpPIj9Suep03ORoxvK65v0byl
	 n0oim04rNS8JcJnT6aKSTT8qoOmwivF8og/bvbEbQtNEaK915a+EZDr7lv3vKwV/Y1n7X
	 5N0WY7SZod92OU+XJn7vTHBqFlC+Z5sTewGRGlXfp85qaCXeERIKGKUSRuLb3aj9BRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
	b=dmA65A5QWq9UrbHo6Vfe5kVyGhiuYwX8TS/LCZLjYFA/XcyMdVZ7/RYL9/shH2ccr0h9
	 ce0T5wFSwiKIUdBZg/aDvqbD1sxHq5yTdgVEpgRMWs6RTBbvbkGmvh3BRxaruV6nNEbmX
	 w6Nh1J1m39Zxl1jvDcc7s6yT4BYYRqrX6/axjSDFrLi4mnLwrMqa58JYJdEM8Nr+JPizJ
	 MAE8KcqlOsY7RztGDRkAIsDelLIDFYwwTJs/ppcBYhJbnlfNV0g6QbzsOKGlavf0PKBOf
	 6IQ6l92uj/aH4Xsk6MXbcLIljZ+nZ+E1fo5VBbF0jL9jXeJ1RXsBtH8hJ5rL9OOCnOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlHC5Pbf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB862606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB862606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlHC5Pbf
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1781868b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474540; cv=none;
        d=google.com; s=arc-20260327;
        b=ktSGZ3I2JnjGSe7ln0nITBstp01WjKVHIIYgX1phkJ1Alp6SycWMhJNpDtBXrWq/B1
         uyU2i5stQlae3ZhPYqYVztoMqWyEDz0C/gc5S92Ll9s8IBfjTSsrZdt2sH186/0dz8Zb
         r81oZD1J8wHTszGx9pMDjkzMRY+sPKtn7b4B0cJCMUk4kdO3DHgNIshtmdQMx5BsdQ8X
         TRlOS4a04U8fM/y/GDWGXP1j2vk8dvWBZQ+3qr7THv8uX3/pm36xrQV50fpzmqjgX+ly
         CMesEz1vfAKVPDk1UD/eaZX+IIQT8dIWsgmpy65tVZoFQhn0YpK9YD2kv7JtdG3GC0ea
         feVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        fh=ArhaYKd/KT54RzD6ZNwnuYRa4dP5K6rG4mVLGcmv0o8=;
        b=JM+s15/mRMGzlXfanOR8de7rkk+zHV4A0TUOFd2wWop9lBxjONOc22h+tjEdq7G9xS
         heEYlctxX01S2dteXTvMevsCrTkewL5NhkOpxGsPfL4BGs0wQtW8xdnJuXoZlhzGybsQ
         puloGHNupzCuFG2iTjpiKO+WLkzdKPE1iqn4R8DcD3NY1vtZNKMAySFRn+gYLt9Q3Io+
         WYwCSx2kkn3PeTQcBuxXM/kNdHkqrpYcXr74bdJp21C97/ruRmr0gf4nIHndGiwmL9Fo
         C3ZH/TiVowVlUSEqU8wjgvMvKvNCev//0M8WKIdLCP09NLvTAFbu7CZb75Fb76Aqnm6e
         u8wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474540; x=1795079340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        b=MlHC5PbfWnOapYhAS4wOV78OaA1SqQCzI8HRDtOqzxhf8Xfx3UDr7AAXCS+Yrb+tjE
         bLhc9iD4yqeTNyAB+UVpkCuGJOpt5uMYDCHmwWjiqKhiybdMHk5VITQrBM9EGqezRhs/
         IXfQ1Tjnx2a+X4XhyPTO8bKZU7g9rPmmfsP8Ff+xAS341flSdQWMNXuBydmJ+XIUS6z0
         r9EgvozlZ8nvOD9K+e4zr5P0P2Zwu/oPvKIfGzer8/DsD1yvLw2dMeXRd3LFPJXTNZLq
         NSUEtHhhLCxcveIh0um6OOdBFYWRznulJ4wQRLqFEbPfKu8PsZqxy1rcJ39j+nV3zluu
         C95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474540; x=1795079340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRXv+o3xd/LwrjX3vtstrFSK4BcwlWxEyWog/B0Pb2A=;
        b=w5D6reH+XEydbI9wCTKSs3bV0pneC/h83eEDsPzpg/A/KI59agrg3hFNBWcAQZztzQ
         9xF3o434yZZisu9ES+eXyB//7GdpRxPMU59VBHc3gH5vvee+dEfo9CzJKCb4uCelr1bW
         RGgBins8HCCR7yJFI715a+wOv0V4s1SQVkvmA8llJ9Cqglz2AK+9I6l2ZsphZs6nRBvX
         bySTb8JzLIrTbhMpoc4VYSrFniwSCfL+d92HQuOYu7uugGINLzrWygL/tJI1s6N2J0+e
         QNgyeupGhu6bDj1JPlX7VGfRU0oJQFpdyvQjQRi8gLRqPVOdKcs9uGN4SPcij5x0jJbs
         UFVg==
X-Forwarded-Encrypted: i=1; AL+hErHfoiB4XXGmcUOtcRf/Fn6VDJ1EVLjQDyIfCxVsmFS85o/NmdO7MfeySEdxl3gIbc27u1XNT6/Gw5yXETY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gv1Tu00vv3lcRo3G3e0inm5y0Z+DhIv91X45XFTn1jEuSSmq6
	BSfZuVXYyCHdabkeIjSGkd2yggz0miersIv9K20pTG0+4+vtt/+moUWZwE6J+88wzVRYc/XaMLV
	/A+tgI7OZZuvHS0ILvfJtfx6pUqPMUyteY1hDLtE=
X-Gm-Gg: AYBFou3BuH0Jsi6PW1ZYo/T4eKzjzjMWR0D/85ubk+d3THK0HWIWz/nR5CxxbG6HGj7
	MK7ZHU/th4ENe730GG0AcSWdYr2BQLpJK0Wlmfn0ucghRm1JmIMrc9INrchA3N6DASkzK8spZ5y
	l98/6QNQLa6FvhGxbNBRs64vbI6JQLnzxrYY9XyjFMcROHprRdO5U2hoE2Wyc7hJXQEWWRbsc37
	0bXZDlUX7hDDt+x9TcXPbWjWDaMv9XHHJMJx9yyuC1iyDkaBXAS/WxQrROpFAlj0fHJsR/M6Fxd
	hx5lYb1im+kSI3ivZ0uy73IXf7a2Mk9vFPNW2iNPLZq8cakgqzbQTBw0hw7jk4RibQXWehzHliu
	e4uPKWKVo00Muz56kT7D9GydB63twpKCVYeDg
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9599:a689 with SMTP id
 98e67ed59e1d1-3b182f235d9mr3994012a91.34.1794474539722; Thu, 12 Nov 2026
 01:08:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-4-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-4-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:08:44 +0800
X-Gm-Features: AclHuK-xo5sqQ1bv9bDSXOSJ-L9KATXVxPodrhMZvWrhDua3HJ3hpSCY1aITLMY
Message-ID: <CAA+D8AMqXdSK98qrsecZBk7_=ZVX91PjqejyN-xD0R6b-cqAqQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: fsl_asrc_dma: release DMA channels on repeated
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
> fsl_asrc_dma_hw_params() requests new DMA channels on every call and
> overwrites the previous ones, which are leaked when hw_params() is
> called again without hw_free(). Its Back-End error path also releases a
> channel without clearing the pointer, so the following hw_free()
> releases it a second time.
>
> Release the channels of a previous call first, and clear the pointer in
> the error path.
>
> Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform =
drivers")
> Fixes: 36124fb19f1a ("ASoC: fsl_asrc_dma: Fix dma_chan leak when config D=
MA channel failed")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe..5ba4bdeff019 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -124,6 +124,19 @@ static int fsl_asrc_dma_trigger(struct snd_soc_compo=
nent *component,
>         return 0;
>  }
>
> +static void fsl_asrc_dma_release_chans(struct fsl_asrc_pair *pair, u8 di=
r)
> +{
> +       if (pair->dma_chan[!dir])
> +               dma_release_channel(pair->dma_chan[!dir]);
> +
> +       /* release dev_to_dev chan if we aren't reusing the Back-End one =
*/
> +       if (pair->dma_chan[dir] && pair->req_dma_chan)
> +               dma_release_channel(pair->dma_chan[dir]);
> +
> +       pair->dma_chan[!dir] =3D NULL;
> +       pair->dma_chan[dir] =3D NULL;
> +}
> +
>  static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>                                   struct snd_pcm_substream *substream,
>                                   struct snd_pcm_hw_params *params)
> @@ -190,6 +203,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,
>         dma_params_fe->addr =3D asrc->paddr + asrc->get_fifo_addr(!dir, i=
ndex);
>         dma_params_fe->maxburst =3D dma_params_be->maxburst;
>
> +       /* hw_params() may be called again without hw_free() in between *=
/
> +       fsl_asrc_dma_release_chans(pair, dir);
> +
>         tmp_chan =3D asrc->get_dma_channel(pair, !dir);
>         if (IS_ERR(tmp_chan)) {
>                 dev_err(dev, "failed to request DMA channel\n");
> @@ -342,6 +358,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,
>                 dev_err(dev, "failed to config DMA channel for Back-End\n=
");
>                 if (pair->req_dma_chan)
>                         dma_release_channel(pair->dma_chan[dir]);
> +               pair->dma_chan[dir] =3D NULL;
>                 return ret;
>         }
>
> @@ -356,15 +373,7 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_compo=
nent *component,
>         struct fsl_asrc_pair *pair =3D runtime->private_data;
>         u8 dir =3D tx ? OUT : IN;
>
> -       if (pair->dma_chan[!dir])
> -               dma_release_channel(pair->dma_chan[!dir]);
> -
> -       /* release dev_to_dev chan if we aren't reusing the Back-End one =
*/
> -       if (pair->dma_chan[dir] && pair->req_dma_chan)
> -               dma_release_channel(pair->dma_chan[dir]);
> -
> -       pair->dma_chan[!dir] =3D NULL;
> -       pair->dma_chan[dir] =3D NULL;
> +       fsl_asrc_dma_release_chans(pair, dir);
>
>         return 0;
>  }
> --
> 2.53.0
>
