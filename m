Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793861352;
	b=5ii/JT8J/Mbjh1FtZ6ePgRXsXl6pkuisn+Q0PQGVULih6HPXEca5RQhjn5inEq1iGNHG
	 HSTpLU3yQQVqcsoVfzz/XrzGvePTlLevWvuxDuZ7Mt2VfTgqoWNWSWsELdLZ1TnGyxp3Y
	 tpJdWfxGj1ipc8Zpw3x+6otY5Z2Z+dKuJLaAyx57O40V/PkoKFxQugVuaU6nAjALeT4nt
	 MeIWEndkk5RsDqLm17fJebe9E3GV0aQjhjyAbKy5h4Bj68/TMTDj9qCW0VdOl6X++OlPf
	 eM5Ix4vU7Laz3r8vioDovaDgP+6jevVMqy1c+64nuvkg7xSItIU6gairfLr6jTIRM4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
	b=5T9qncFjFtyFiGWslihB6zHrFmea5+dJkke8TtCjOdh5/CrYkcFn5p4c33ppxLk3GKHx
	 GzONl9zEkSMdldtqzUwIuuZvvuqQeeimxfUAACHZpzA35+6dccbg/6Dnq5fWS6Lpbk2Na
	 6d8hSUGHH4L0WHmDQQ8j9d+fs4AcWd8CYh+NXlSW1ujl4ek0veHEhqSv871Awjjz7SHeR
	 IHePdIhHRqTje2K4JFKkZbmcAJgEeP9tsaYZSPiLQIpJvo0ZxW/RmlgDd+zknHESLcxT6
	 X1iYGju355ywU+7BC8NuVc06Suv4qj6s63IynPX8oJ1YK5aMt+meJth1D2bcogDtC/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d00ACOtS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54989606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54989606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d00ACOtS
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so169402a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861352; cv=none;
        d=google.com; s=arc-20260327;
        b=fGN9I8IxOdg1ODzu35iQot3oWfnIe/VGZbdfNsEW4E1MCIVWkp4HQKrKl5H51UDAF/
         Nhtd3TpwshOaE9z+vf0dykYUZsjeenaq6jy0/JszcKpA1rQ0IOeE6fwVZTzyjtgXtXSt
         R7kXHAcAQdYuI/D3zy4w83d1E0kXI6irwiGckXhWSPF5vpvWMzkLrtkGDXCXo7BKHuum
         2gAbFLa5MQCR7c20+2iLPk5ZaQzY+ZRzA61jVwGFPDVWneCTxqzQYptrlet8ena8UElL
         9dnePem9yOk0QCfmpz9qFzSs4qyjolRD/mJ/mqubfs9zTV8RKvmgowrFSa5BISombv6D
         U52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        fh=YuGeMAZuiWP84CXcrVnyXfjzQspXY+280iFNA7H1JhY=;
        b=R79pbqcF1IalMZD0plZ/fhm4YgW82OOiHNFK3KLmH8aXF26APojv4fZnHPJnBzNIV7
         TI42ZlEo4abPQkBYGBiVuuOpyB/rhy43lgAk3OiZ4JKYOYRrkkZEhEjXCFsFY9Q+meG+
         OAbSakGSqy/Wi8yYmqjPtlP2WAFb1GGg4PbjHT8r4SMClMKYSJ8lXB2IgROcARHAPfI8
         oK9i1wneXB35lGJTBESfGbgmi1tagcg3nDA6jfn4Mk2moH9JWGfQYDFK5THcHtJTwQW8
         uj+PEg6ykcH6d9KNB7cPHwgJ/8rwE45i4y9XwbmYUx8SJCSHCodxQXPYCuA6B6U/B4HW
         M0BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861352; x=1794466152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=d00ACOtS9HcN/J2BXx4D9RIH+3xexy6Xeiwc6YHiGHWqOjqyZMrURvS0t4zaLvqkSG
         ML9QcZnD8mbM8NPo9UKnDj6w+PpvJT9xTyuq0pQEu6IStZPWuAN8ulpy6voaLDV67qR9
         uvI8jxHoZKRqb8jJY2S9vkDbraArQZO8KykqS+sCTmjAAdmvnmEk0J8B5kUu1ewcFqOl
         H8VWfjQMjzNdvrM8r6lUEqR0LHuUPny5WJuG7IJ2hZ9QCmPBNy2tQFns5Q2HbJsPkiox
         9TB/Lewqo2B+jHlfBIctwdE/Ho1mhnmgxH+Ngskrnj9VYWWJ8tXCEBg0vIrS908EdefD
         Al/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861352; x=1794466152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqJik3giojyQdxTVlYt/SVYHbelelREmDC0vou6fiGs=;
        b=iO6hevkG/C4Hwwtly+olfndhhPCT1folg9mpwjsWVIiiZFBEMux181nc5gmF529QIX
         72YTuxsk+ztUzAmy31s+4SxFm0tkkZy0xmtA4igEukCFwqNh45JjqqnuYlu3wfgZMVpM
         OsmCT7XKVlOU3q3ceAsw2deNei4NC9jzsVnt05MXNQ1D7Z3vdJAL0b/3QJ1re5trBPAb
         QlImpGCbHwARIrgQt5EzBfjrsOOb/CDab2amkKY1OnN1z3LjzD+zqBT/pZn5J1bY/6F/
         pgQExVutSow/9STpHiCnJb0tE21+Rsfrq8bfVmzjBMhl+6T2oKHFaJqd4TLXhqNOAhFa
         jzvw==
X-Forwarded-Encrypted: i=1; AKwUvByuCWbWsSH8Q4q0qNuvnPexGNZjTz9bisA+viwdTtzcT363ELQcDvGGokDcv2butmuUt2xiXhx0F3TCHq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C8sw42kuRWsP42bB6q6+4hq5Y1yW27pGKFX5XzAkkZ+P6+a+4
	KiqMpQ4wUci2JqQVXk9B+dRgHrmj35VWXMlhaI8tCY8yUJ8ps5i0s+WlDsVW5k+FbmiIk8Z5Z7o
	QTtM8qB5eumOhUCZ0riPhdUY7peOsRQw=
X-Gm-Gg: AYBFou3f3L9Lg8SMmNqGwtqoD2h/28lmSGceIuuSQCyiUoZ9mMCFw4EkhLRlCImo7kS
	cv5sSMavqtKfAOd51apJggsjYXZFdEWW+chi43JkkneOIJp93HGNVFeTmj52V/YCL1n1t5/JG7e
	ytqP+AjY3NSBhJQyAeEd40mqR7rtkY8LJ6DUnL6DymWFecLVdES6E2fzsK9S9tdT+E7/0Jnu2G3
	R1EMVHtOPZ2mz992Nv1fKto2EY7Z4Y8XAG6+AmfOkr++czg+DCPHx6BGftpospmWqDvKN/o7e5G
	I/5Oxr0kSu18ydyuFRAkm4eQ/TkVhQXbOFrxdZTGHwfyqPtxUqCr7qeELoyP7CvoqJCtSyZGoN4
	75CuQIsw96dXdPFnI0Frp5dvbcDxMk+B3D/B2
X-Received: by 2002:a17:90b:5145:b0:3b0:a7b5:c044 with SMTP id
 98e67ed59e1d1-3b0afbf69bamr928353a91.1.1793861351672; Wed, 04 Nov 2026
 22:49:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
In-Reply-To: <20261104-imx-sgtl5000-cleanup-v1-1-62739fbb4a25@baylibre.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Nov 2026 14:48:43 +0800
X-Gm-Features: AclHuK9RYtMW40xJ2QKN3LFb2Z1eP_S0Ak6cnyuxLFg7_4CvqzYMgBFsDCsykmE
Message-ID: <CAA+D8AO6dy8Jn+yAaSmdQ2Zh0r_L_ChCAOhpQ-AJh1k+C_usrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: release codec clock right after
 reading its rate
To: Valerio Setti <vsetti@baylibre.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:48=E2=80=AFPM Valerio Setti <vsetti@baylibre.com> =
wrote:
>
> The 'codec_clk' is only used in 'probe' to read its rate, which is then
> cached in clk_frequency and used by 'imx_sgtl5000_dai_init()'. Holding th=
e
> clk until 'remove()' serves no purpose.
>
> Release the clock right after reading its rate. This allows turning
> 'codec_clk' into a local variable, simplifying the probe error path and
> dropping the 'remove()' callback, which has nothing left to do.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
> While reviewing [1] I realized that the driver could be simplified a bit.
> 'codec_clk' is only used in the 'probe()' function with 'clk_get_rate()',
> so it can be a local variable there. Also it must be put when no more
> used, still in the 'probe()' function.
> This allows to remove 'imx_sgtl5000_remove()'.
>
> This patch does not depend on [1] and they are addressing different thing=
s.
> The two should apply cleanly on 7.4-rc1.
>
> [1] https://lore.kernel.org/all/20261104022815.1484320-1-vulab@iscas.ac.c=
n/
> ---
>  sound/soc/fsl/imx-sgtl5000.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..032ea3e066bd 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -20,7 +20,6 @@ struct imx_sgtl5000_data {
>         struct snd_soc_card card;
>         char codec_dai_name[DAI_NAME_SIZE];
>         char platform_name[DAI_NAME_SIZE];
> -       struct clk *codec_clk;
>         unsigned int clk_frequency;
>  };
>
> @@ -54,8 +53,9 @@ static int imx_sgtl5000_probe(struct platform_device *p=
dev)
>         struct device_node *ssi_np, *codec_np;
>         struct platform_device *ssi_pdev;
>         struct i2c_client *codec_dev;
> -       struct imx_sgtl5000_data *data =3D NULL;
> +       struct imx_sgtl5000_data *data;
>         struct snd_soc_dai_link_component *comp;
> +       struct clk *codec_clk;
>         int int_port, ext_port;
>         int ret;
>
> @@ -129,13 +129,14 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>                 goto put_device;
>         }
>
> -       data->codec_clk =3D clk_get(&codec_dev->dev, NULL);
> -       if (IS_ERR(data->codec_clk)) {
> -               ret =3D PTR_ERR(data->codec_clk);
> +       codec_clk =3D clk_get(&codec_dev->dev, NULL);
> +       if (IS_ERR(codec_clk)) {
> +               ret =3D PTR_ERR(codec_clk);
>                 goto put_device;
>         }
>
> -       data->clk_frequency =3D clk_get_rate(data->codec_clk);
> +       data->clk_frequency =3D clk_get_rate(codec_clk);
> +       clk_put(codec_clk);
>
>         data->dai.cpus          =3D &comp[0];
>         data->dai.codecs        =3D &comp[1];
> @@ -185,22 +186,12 @@ static int imx_sgtl5000_probe(struct platform_devic=
e *pdev)
>  put_device:
>         put_device(&codec_dev->dev);
>  fail:
> -       if (data && !IS_ERR(data->codec_clk))
> -               clk_put(data->codec_clk);
>         of_node_put(ssi_np);
>         of_node_put(codec_np);
>
>         return ret;
>  }
>
> -static void imx_sgtl5000_remove(struct platform_device *pdev)
> -{
> -       struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> -       struct imx_sgtl5000_data *data =3D snd_soc_card_get_drvdata(card)=
;
> -
> -       clk_put(data->codec_clk);
> -}
> -
>  static const struct of_device_id imx_sgtl5000_dt_ids[] =3D {
>         { .compatible =3D "fsl,imx-audio-sgtl5000", },
>         { /* sentinel */ }
> @@ -214,7 +205,6 @@ static struct platform_driver imx_sgtl5000_driver =3D=
 {
>                 .of_match_table =3D imx_sgtl5000_dt_ids,
>         },
>         .probe =3D imx_sgtl5000_probe,
> -       .remove =3D imx_sgtl5000_remove,
>  };
>  module_platform_driver(imx_sgtl5000_driver);
>
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261104-imx-sgtl5000-cleanup-371e704e5de6
>
> Best regards,
> --
> Valerio Setti <vsetti@baylibre.com>
>
