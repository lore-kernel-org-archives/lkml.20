Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793935347;
	b=FAc/1bkjrcECAiCpGo5r7LIdq+2W+oF+opPL4ClkzFRtAXcec9p4b92Shm14w5xAEE8k
	 66MIvUAlyRu3bqRD7b9MkcqyWv47qKB/HaXxISg2VuwlPxWmjwt6MJs+TMwZAtzzsMG1y
	 02aMpWltsKb9CHH6qC1qxgOBcizJomAih/4fpRCcB/XZV7SRijSmoUO8Ysmg3PXT13Gcl
	 iphzj+3MkZUR69S2y67rhrOLCpPsnQnr87RtEQkosbkgw5XS0lwrgHDEicMeEJunYWrFi
	 EQ7mUchFkzd6w5+SbeIS5F942ejLU2x4VHDVA379h9+E3Mj0m32rmSy1b9uD4AznC2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
	b=tOKZW5E/XfPCsJstAk1VFmtB+MA/iA2xz5FQ9qXG5KXFBj8OgElY9rrBgqmsbGxMja1q
	 /E2OxT1qxZif1W8BCRAVj08Jk2ih501jPdQzWijz9l2S52Cjrh/d1uDxUzmOIzN70JiVL
	 nHcKxr+Ahk0serQWldQXIc+UV4GbMj4gMUYQGeTFlAWnH4GG8dEJqQrcmC+rn6a5vBhYk
	 ZnKEU1ocdJfXx7W6nCFz9nj3Qd+mvsPy/9bZPliHsNOcZvCZtac2XiI19Q6RySXWjUltC
	 aNaPmjXZcEnhUX3xwkVC61aEfaGqyX3RvI5o+pe4PxUaji7l6L6Xm36rJGsPc0OmOUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO;
	arc=fail smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC3606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FC3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItRx1OjO
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so179475a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793935346; cv=none;
        d=google.com; s=arc-20260327;
        b=DEEINsXSuZdTOVvxu+Ba4nEYMBbx5rTsjxtX9pP0b/0pDGPS2SnRNAo6Uw5mU9Xu7L
         XHg4doIt3wj0SfphrlwV6vtar2G72FoD+4infyRxCZCt6jdEMN9DlzB+qvMpRWMNtyZF
         lwh3WXixQvGL1YqrmsEHmjNco0sm1TnU/asWfR9tCOoP9K+vZHaVG1QzjVCP64ZTEp/C
         Ge+k4QQmqFfjeIthcizwazNm3otEStuSD77fhhFPp8r2d2ViXH71qtRp5rkg17cbUlp8
         IxiS4AiiaTDl9ksHNoGZoXxFvjATUDgdaYK5oZLwjgDttBCKh2PjUY5oBGmFL1F3A5/+
         PJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        fh=eSHRY2aZqPNsU8zfqXE6MDy5kRQwH41eV3Jr6OWQfl4=;
        b=IRq9W4TtxlckqWRFMnayCLQjdx5u/bu+tWCUxK2ObLQc26nhefLYxhMs+/eKVAx4qK
         Ke6sarw+PfvAEO7pd1Y2w/2+n3Ox1JViL3OKLXWQ9ssc1GSQ2NxGaoqhobUTegHjxROn
         P80wtwJCqAO2Y24+z/SzJme0vmhIaZhStn/JoR/F03LnorEMr3W+D9NhCg9OXofuW7+R
         ES0G0dT54KPYyJASnPjf7WRz3ykqQ9Ar/TxRbEr7xcY8RXTNzHCUMRP1KMAjbT8f29SB
         pvPyyYHOflvUFEPuMlvtgeT+6PL4UAoLM2ulCNZvzqHf5VQ6a85mE4pLQeaJX2fjwHrj
         INJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793935346; x=1794540146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=ItRx1OjO5a1X44Iy7oo4XW8ssPwFufOtqbhIHs2am8aILhL7zKI92TPb8iOw6SxnPo
         yzUSINQd60f/+uVQus2eX4+bUjUu6bofU9KvJpfsurOlxmVu8au5LHaHqSot2OjTGLyA
         FisTbK0zIAK1+dUzMtez2Jp6vr9S43rWeiO24vE0aQcZtDUZoKqD3C/YSX+6uNdxIIDa
         gZ0ankMf/MaHSmy4xLV3XRiC/QdZ6zXNwlmZx4jqHVb8WGa9cWgMizYd3R+uCWnGUtcP
         OGgCh/sk388QOwHAhQVkqlxhsFcYl6Fd7a56LLn0NQy4fXsQ8LLE2Leh0Yk8xC7B6YYV
         FeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793935346; x=1794540146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w32LmgqDCV1eew1K0IjeecQXsQlnn48/GdAJChQRoV0=;
        b=YlH+oWEg1NNikxks0z1zxS4F17k/T2n2EqkLIqEqs2NmvOIZW7rnaWrQiWyP/wMfGP
         CYGq5TyZQy/rkH2vRTPQA2ALupsS1zjy0xcG82sGQCX07zVbYMx8eRpFcNN0mB4EhGAw
         zI5Bs20xlWR72GvR61aYfR6mIhSWfobnMlO4Iqc4ldJQJRXmvYgaAZyPeSaCYqGIBvH6
         g0NMRDkTGk8WyGINKrcOpa+BokhJUyfjLLxkYShpvKnzPXO/tM9s5s860LhmG0qJsM8L
         GIkA2WF92vDiuBYqPyvmAuKpMH9J1FenzTJBiRAQ+g+xsxFgvR/rjmUrN4rcZoQvQsJN
         TrhA==
X-Forwarded-Encrypted: i=1; AL+hErFOp8qXb9Yc6Euozpqxwqk96E3lwTEan5vLgGzHFZoiNswnDemAeGdQiokV+Bj7lMPgfpzgJRYM2jd17pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TO3NLyAFGwn77IvkB6fLRjqDCLJvGaVypGbPe4qRRyNktBSdI
	qkzMCRTLt3UfKKNzCrxDGP6BZWd8J0gFC62RBOrXHeFzWh2edyFT0J9M7AhZApIrspUKonN1Qqe
	bYthnd9OCGmh9EUSCmZ9LV6lVJHAI1Io=
X-Gm-Gg: AYBFou3rzLGh0mNABsbvSXlWUjW7Rfpdlvi3KA7AApbKNB1g8WyNxLb9MqrUgnR74i/
	c8sqvmS35YFG/yJkmKnT5d/1SAO5Cn9ESZdArb9cFpXC8rRJdYNC737b4EZsfcZpJ2xK85Nfw0O
	jv+0MSxFfxVtA9W3PfbNPGM1WRFfkabfm5lytJwdbf973gDVF7XVeJOmDnvxC3lduCwjFEm7z44
	YmHQm+TTSyn7KkZ+DbKoOdr0xw7FLETBMhLonbfhZM25SWBqZlx4KIc3yfDCSZYgNiJFPxOv5uB
	eqPO/WEIkqfJCN6OU21hmYxhCxcIQBcmLnZf1CsT6R3TC0uGmD8QJbxx3fVhos71whOLKMcN3R6
	iHSzDpewpzJDEIzlbJbvZYgWF6rWBYs7Ubjhr
X-Received: by 2002:a17:90b:4983:b0:3ac:9d26:551d with SMTP id
 98e67ed59e1d1-3b0db6f11f7mr1320600a91.50.1793935346215; Thu, 05 Nov 2026
 19:22:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102180915.3981805-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:21:57 +0800
X-Gm-Features: AclHuK-h3hDpTZTCQrDXlURnXU4dNiye78ZL33OWRSh0a0w-nnzOWFYn2sw0Q-0
Message-ID: <CAA+D8ANwEqFJYQ39h+1A3zXhcUfpFGzSvVjEzx2htoYxB4sLGg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC/sound: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kexin Sun <kexinsun@smail.nju.edu.cn>, 
	Frank Li <Frank.Li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Tianchu Chen <flynnnchen@tencent.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	bui duc phuc <phucduc.bui@gmail.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	"open list:SOUND" <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, imx@lists.linux.dev, 
	vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

For fsl part
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/core/pcm_dmaengine.c         | 3 +--
>  sound/soc/fsl/fsl_asrc_dma.c       | 3 +--
>  sound/soc/fsl/fsl_asrc_m2m.c       | 3 +--
>  sound/soc/renesas/fsi.c            | 3 +--
>  sound/soc/renesas/siu_pcm.c        | 6 ++----
>  sound/soc/sprd/sprd-pcm-compress.c | 5 +++--
>  sound/soc/sprd/sprd-pcm-dma.c      | 5 +++--
>  sound/soc/stm/stm32_spdifrx.c      | 3 +--
>  8 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 1306b04be171a..41feb5312ffec 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -169,8 +169,7 @@ static int dmaengine_pcm_prepare_and_submit(struct sn=
d_pcm_substream *substream)
>         if (!desc)
>                 return -ENOMEM;
>
> -       desc->callback =3D dmaengine_pcm_dma_complete;
> -       desc->callback_param =3D substream;
> +       dmaengine_desc_set_callback(desc, dmaengine_pcm_dma_complete, NUL=
L, substream);
>         prtd->cookie =3D dmaengine_submit(desc);
>
>         return 0;
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b417de6abebe4..cd3bf6340b650 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -76,8 +76,7 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_p=
cm_substream *substream,
>                 return -ENOMEM;
>         }
>
> -       pair->desc[!dir]->callback =3D fsl_asrc_dma_complete;
> -       pair->desc[!dir]->callback_param =3D substream;
> +       dmaengine_desc_set_callback(pair->desc[!dir], fsl_asrc_dma_comple=
te, NULL, substream);
>
>         dmaengine_submit(pair->desc[!dir]);
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index 58101ce07c9f9..c6970a7e88f3f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -176,8 +176,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
>                 return -EINVAL;
>         }
>
> -       pair->desc[dir]->callback =3D ASRC_xPUT_DMA_CALLBACK(dir);
> -       pair->desc[dir]->callback_param =3D pair;
> +       dmaengine_desc_set_callback(pair->desc[dir], ASRC_xPUT_DMA_CALLBA=
CK(dir), NULL, pair);
>
>         return 0;
>  }
> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 74e2ea002fbb1..fa21cf47befff 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1375,8 +1375,7 @@ static int fsi_dma_transfer(struct fsi_priv *fsi, s=
truct fsi_stream *io)
>                 goto fsi_dma_transfer_err;
>         }
>
> -       desc->callback          =3D fsi_dma_complete;
> -       desc->callback_param    =3D io;
> +       dmaengine_desc_set_callback(desc, fsi_dma_complete, NULL, io);
>
>         if (dmaengine_submit(desc) < 0) {
>                 dev_err(dai->dev, "tx_submit() fail\n");
> diff --git a/sound/soc/renesas/siu_pcm.c b/sound/soc/renesas/siu_pcm.c
> index fd5b20b469a4a..7208514e16a43 100644
> --- a/sound/soc/renesas/siu_pcm.c
> +++ b/sound/soc/renesas/siu_pcm.c
> @@ -125,8 +125,7 @@ static int siu_pcm_wr_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit a dma transfer\n");
> @@ -175,8 +174,7 @@ static int siu_pcm_rd_set(struct siu_port *port_info,
>                 return -ENOMEM;
>         }
>
> -       desc->callback =3D siu_dma_tx_complete;
> -       desc->callback_param =3D siu_stream;
> +       dmaengine_desc_set_callback(desc, siu_dma_tx_complete, NULL, siu_=
stream);
>         cookie =3D dmaengine_submit(desc);
>         if (cookie < 0) {
>                 dev_err(dev, "Failed to submit dma descriptor\n");
> diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm=
-compress.c
> index f790b959cd4e4..a810c9c8a0b5b 100644
> --- a/sound/soc/sprd/sprd-pcm-compress.c
> +++ b/sound/soc/sprd/sprd-pcm-compress.c
> @@ -247,8 +247,9 @@ static int sprd_platform_compr_dma_config(struct snd_=
soc_component *component,
>
>         /* Only channel 1 transfer can wake up the AP system. */
>         if (!params->no_wake_mode && channel =3D=3D 1) {
> -               dma->desc->callback =3D sprd_platform_compr_dma_complete;
> -               dma->desc->callback_param =3D cstream;
> +               dmaengine_desc_set_callback(dma->desc,
> +                                           sprd_platform_compr_dma_compl=
ete,
> +                                           NULL, cstream);
>         }
>
>         kfree(sg);
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.=
c
> index bbd7516f81954..968901ae4c335 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -287,8 +287,9 @@ static int sprd_pcm_hw_params(struct snd_soc_componen=
t *component,
>                 }
>
>                 if (!runtime->no_period_wakeup) {
> -                       data->desc->callback =3D sprd_pcm_dma_complete;
> -                       data->desc->callback_param =3D dma_private;
> +                       dmaengine_desc_set_callback(data->desc,
> +                                                   sprd_pcm_dma_complete=
,
> +                                                   NULL, dma_private);
>                 }
>         }
>
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.=
c
> index 88863dbd05d9b..44467a25fb69a 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -302,8 +302,7 @@ static int stm32_spdifrx_dma_ctrl_start(struct stm32_=
spdifrx_data *spdifrx)
>         if (!spdifrx->desc)
>                 return -EINVAL;
>
> -       spdifrx->desc->callback =3D stm32_spdifrx_dma_complete;
> -       spdifrx->desc->callback_param =3D spdifrx;
> +       dmaengine_desc_set_callback(spdifrx->desc, stm32_spdifrx_dma_comp=
lete, NULL, spdifrx);
>         cookie =3D dmaengine_submit(spdifrx->desc);
>         err =3D dma_submit_error(cookie);
>         if (err)
> --
> 2.43.0
>
