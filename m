Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217706;
	b=rcf2iaLvuxJSLPMKilKezvqxL6qtJ71cJthgZSu88DU6Qs8sh03lsIOFhVBTUp+MCzt5
	 FA3AhdUKh510bZbVDvf7B1J+YZZvgOFl28RQ0E9JmtTukSSh9xIJ7QreWkNRSvxphouX0
	 ac0Ws8y08k6c3LSZEaULOE5tsPF4WHcNLSal4MHc1KDH6nvQCbqfEB2FXjURIaAMmp1sn
	 k7e8Rx3wPLeluI1SAE7gU62zvwQd2WtBJBo641lkc5Xh/43eQy/s6phEPOuSmWOsYBCnc
	 BND24agkcxXpAirmMxkeMWaacsj4KSsGjuO3NwIymt/WoMGmM7sF21VLXmakM1eh80g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
	b=xE5j5yFzhUSma8t6fraZRO8oMFb61MsRzzifU1oTS01lKB+/0BbirfiCkzVSY2PDL1Ee
	 1ZNb4+p7PbiWbtG4x87X/w4q+CJT5FcpGIpShp8N3Evf9PEQK2hpedLh+6I/oK/IoeJhu
	 2MlLa9CfUa2SDz8Bq4pF98uzs0CioqyDv0mFoVUqoLv5ehKTePa08LwqrncxERhHcm9/k
	 osmNyv1XiCmpx372BAmj7/a2aCaLrfPyssRkM5cgauRPQ4qmmpDR2XZndMXl7DqxR0yFt
	 R09BaEgCfZ82hQ88KVhvdKz2psfyBDvQKmscupFckpQAYr3Dtbst3l21PtnCbahf6ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kdsit4xV;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C7606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016C7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kdsit4xV
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso298540a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217705; x=1794822505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=kdsit4xVw8UCR22i6wFqANj0/AuOwo67AZ9gjP/UR8Kscd4RqKpysFl1wpS1CDktaB
         +NlpElN21VNoeQ12zoMnmhtf+G7OErR63pky1GeGdekPGDmUoblvBzmLYCpbhxVNguEB
         2eZONBKkwjEPa81idKM71kxGpZ2zWKD//gyAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217705; x=1794822505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2a609L2GphDQlVfX0YuvfIMKjC+LWixKm2AkfX7MOhg=;
        b=s5b6+Tl1KX/RsL0wcZcCl1FK5ogGfAJleAEP8zNn1if7xAhV7lnjvEdz/Bf8yiv5ya
         A+uLmhhqO8ycPtkZrx1hJ1MA8okCJ0SlsGNzT9ZYVsZDtXZ1Ieei5xCVir0DkvcNKeQs
         +MsODwUTRDD+o8Xdei7W0oHEPjfcHBnWVkGnv9AGQ7AhxLCMS468MiZ+dwLK1olM/QCv
         RY4Klgug0CbfM19mHZDrY7LVxVOmVousVbHvqjDzQpXE4xkRPORTcLWcVfhy6uITBtOI
         i3K/NXTxWtMpMZRJ1PfKcHJbMsdwhN4RWjX8jZSTTofiKttal9XJSpJqAwZmT7OjYLbr
         qROg==
X-Forwarded-Encrypted: i=1; AL+hErGeWK1b2dFN18LgKLt0zvZWTGeyvVINaVUOJaUFRRkIAqutzDu/Ij0qST3TEGdVGb9tSLWjv3X3VmP4gh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WCq2OX4kvdURNws/IJLUseujOeqekYmS5zhqBYX8uH5+5dO76
	aTXyfofmJJK7WZ5JfambKlZuMdRmebNMAGPFknBg/XRGbv5z9cH4CNK3FGPKgBKHorI5J9lHsOO
	RODR/Cw==
X-Gm-Gg: AYBFou0StK49gJY9gn4RpRcwCxE/3dEYjOoOmNCzzv4UZX1uPsA5tV5whoNE1V5Up6S
	GHnNwjHj8nNCLVd6HwpiyZKmKBbKn32r8f0OcXbw8AEGW72JIKmKK4Dh5Ywyc+lBPqFJuGDpH04
	rpRUjfU53yG78Kr5pjhuPFc4wIRAytNRv66tkPu7lqaGWx+y8pZP7FH0KpMjO0YAn6L1EuxxqVg
	gf1KH5LLFp7NTXKJ5c5Bquj5MFybcNyjGGc5RVsrLc31Jb/POaRScR/Kv5POu5Q6/3Hxmz26unL
	LsetrQQM2LO6mgDlgbUJ7Vi79ZWadmLiAkoLeTqQFdcxSYdJXJZIBWzS9MkrP+DFRo8qIaHEZ2P
	EXgUWd628Om/VwA0xxqNSlBe5cDqhgf6SY4OYwNHTU95U5Om+d0HiQQvvI7Npb0HkTLN2LacU95
	VMMLb0UhOWrp8udCChws/WeWIAoWr6X7Kx/ydM45fUS1lFXUh8Mlu5PvDXDVbFEA8Bk+N7i8lk9
	zmHQKzzbCLp6zYXRKoQYGiehIkD0LKYHcB8vAZnkciaGJuB41jh05LNzohcSIJg6nuOL7nFaXIe
	6hdJK+kaPQxpdu8I/hGdtIVnqYgo1/9FWjcslyUxN/3EJ4ioFEqEu5UmS6vR4jWPlQ==
X-Received: by 2002:a17:90b:53cb:b0:3b0:8947:fad2 with SMTP id 98e67ed59e1d1-3b12d39ed40mr3354791a91.53.1794217705223;
        Mon, 09 Nov 2026 01:48:25 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105904951sm10335900a91.16.2026.11.09.01.48.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:48:24 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so298986eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:48:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFyuCDbJ7+4mO/A23uz59FEP4d5Fzrwh9q//+Gb8JcAp8bnuGMUyajRQmPmfrKcwMJaHNBOvTUFFkgv1jE=@vger.kernel.org
X-Received: by 2002:a05:7300:ce86:b0:35e:f1a5:9ba6 with SMTP id
 5a478bee46e88-37252b4c091mr6436576eec.5.1794217702332; Mon, 09 Nov 2026
 01:48:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-10-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 9 Nov 2026 17:47:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
X-Gm-Features: AclHuK_kbp2RlyhWxo_Xx4hVQaPPUEY10kfNvYs17nATUWr47nBdslkFDfWhjSg
Message-ID: <CAC=S1ng1U7XK2SvM+2Tvb7z2nHiDEvLhVP75JHdwzkV7GiaiKA@mail.gmail.com>
Subject: Re: [PATCH v2 09/46] drm/mediatek: De-duplicate internal component checks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Both mtk_ddp_comp and mtk_drm_drv are performing similar checks
> to distinguish components that have an external driver from ones
> that don't - with the exception of mtk_ddp_comp also checking if
> the component is related to a backlight driver.
>
> Create helper functions in the main component management driver
> mtk_ddp_comp, one to check if the currently checked component is
> internal/simple, and one (static, internal to mtk_ddp_comp only)
> to check if it is a backlight related one.
>
> Since the amount of internal/simple components is lower than the
> amount of ones having a specific driver, and since it is expected
> that most of (if not all) of any new hardware support will need a
> specific driver as well, the helpers are doing an inverted check
> compared to what the code was doing before, as both mtk_ddp_comp
> and mtk_drm_drv were checking for external component explicitly,
> while now they're doing the same, but checking if NOT internal.
>
> Also, while at it, for the OVL_ADAPTOR components case, instead
> of checking for MTK_DISP_OVL_ADAPTOR, call the already provided
> mtk_ovl_adaptor_is_comp_present() function to check for this type
> of component.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 46 ++++++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 16 ++-------
>  3 files changed, 29 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index 2ba2123238b3..a9c3e29fb340 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c

[snip]

> @@ -700,26 +720,12 @@ int mtk_ddp_comp_init(struct device *dev, struct de=
vice_node *node,
>         if (ret)
>                 return ret;
>
> -       if (type =3D=3D MTK_DISP_AAL ||
> -           type =3D=3D MTK_DISP_BLS ||
> -           type =3D=3D MTK_DISP_CCORR ||
> -           type =3D=3D MTK_DISP_COLOR ||
> -           type =3D=3D MTK_DISP_DSC ||
> -           type =3D=3D MTK_DISP_GAMMA ||
> -           type =3D=3D MTK_DISP_MERGE ||
> -           type =3D=3D MTK_DISP_OVL ||
> -           type =3D=3D MTK_DISP_OVL_2L ||
> -           type =3D=3D MTK_DISP_PWM ||
> -           type =3D=3D MTK_DISP_RDMA ||
> -           type =3D=3D MTK_DISP_WDMA ||
> -           type =3D=3D MTK_DISP_DPI ||
> -           type =3D=3D MTK_DISP_DP_INTF ||
> -           type =3D=3D MTK_DISP_DSI)
> -               goto end;
> -
> -       ret =3D mtk_ddp_comp_init_internal_comp(dev, comp->dev);
> -       if (ret)
> -               return ret;
> +       /* If there's no external driver for this component, allocate and=
 init now */
> +       if (mtk_ddp_comp_is_internal_comp(type) || mtk_ddp_comp_is_backli=
ght_comp(type)) {

If I understand this correctly, MTK_DISP_BLS and MTK_DISP_PWM are
bound by the standalone pwm-mtk-disp driver. Initializing them as
internal components requests the same exclusive MMIO region and fails
with -EBUSY on whichever driver probes second.

Drop `mtk_ddp_comp_is_backlight_comp()` here so backlight nodes skip
internal init as before.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e956e1966b86..18683aee61ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1166,20 +1166,8 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
> -               if (comp_type =3D=3D MTK_DISP_AAL ||
> -                   comp_type =3D=3D MTK_DISP_CCORR ||
> -                   comp_type =3D=3D MTK_DISP_COLOR ||
> -                   comp_type =3D=3D MTK_DISP_DSC ||
> -                   comp_type =3D=3D MTK_DISP_GAMMA ||
> -                   comp_type =3D=3D MTK_DISP_MERGE ||
> -                   comp_type =3D=3D MTK_DISP_OVL ||
> -                   comp_type =3D=3D MTK_DISP_OVL_2L ||
> -                   comp_type =3D=3D MTK_DISP_OVL_ADAPTOR ||
> -                   comp_type =3D=3D MTK_DISP_RDMA ||
> -                   comp_type =3D=3D MTK_DISP_WDMA ||
> -                   comp_type =3D=3D MTK_DISP_DP_INTF ||
> -                   comp_type =3D=3D MTK_DISP_DPI ||
> -                   comp_type =3D=3D MTK_DISP_DSI) {
> +               if (!mtk_ddp_comp_is_internal_comp(comp_type) &&
> +                   !mtk_ovl_adaptor_is_comp_present(node)) {

And here, pwm-mtk-disp isn't a component driver and never registers a
component. Adding a backlight component may prevent the DRM master
from ever binding on SoCs.

Add `!mtk_ddp_comp_is_backlight_comp()` here, and in
`mtk_drm_register_sibling()` in patch 40/46.

Regards,
Fei
