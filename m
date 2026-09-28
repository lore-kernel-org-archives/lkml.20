Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E9495032
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639043; cv=none; b=bT8dE/vgnDieTbjCybPsC0pFnYU5//EY+aq1sTOKTUOA4ys26mnKfTUZrNFVGg6zCQA9xOz+iZDbsLx558LPPgW2QwQcy1yaxFPl1dTvYP9eUs3H+J+E3jpBdwP1eV15BrDWuDoaw9NxeBTFrlHQDHHO3rKxcmZE8DrlcfLYpqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639043; c=relaxed/simple;
	bh=aJgW/iHQLpGqvlqU776ZKildmL9crqFve9o/gRD9XRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIuNBQcdwbbCQ2EnaJNhwer90gANgj5WDum6L3W00VwpqDrY/+QCn3KhWDdUnVhf7k8XBmGJy9rh8fl33n0cStpRsRMjRSwnCUU8RTlEReS1Vy0qMB2hWzVdU8bilES6mtyHxRFjehnTzgXP7Nk2Q1x+62Ud+SR1Mcd5mNZkib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M68z9GNg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M68z9GNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91321F0089D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790639041;
	bh=1WdtbWW9ZiTyoHXGF6wqFuwUhglmsjzBGLU11/qcEXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M68z9GNgU1PQrr9z96rreonup5D0owhIvGzXs7QpZSeLQ9/G7DCePG8c/J106NVF2
	 ELp/hW5TMc2AR/+rWeSLdh5b7f9XHZnjkhNOA+kktP60q87GW6/PYc+BVKdH2rr+3O
	 pYHGlrlKzuOoIG7xI1cKlu9mEqO8kzArWJo14OQW6/zUIRVgpoBpECMMLlMBaBrYA+
	 uQsYt441dFP1HMl0wkwVJRzPAsSrqyZfi6zdUm+qcnvWeuMBGGmQfi0q1Rwogu22o5
	 AKsCj3oHGRtU4XlGiJ+w6psK3GDWyT2GK4qJq6OfkdCxJS0SztqCYFWc1Oy5K/PFoF
	 sFMKXcWf815NQ==
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148516e0b5aso61058c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:44:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzG/zkxb71TlFnbY2F4gERdWAIpii9jxsZs3w0LyJUuJM/x7L/hOwLDqc+IDplCXpw9yeioOHCMVOUNKWo=@vger.kernel.org
X-Gm-Message-State: AFuF++nXaQxihzRQKYYsLJkXnv/i8Z54C+p2mwIEgCW6RnWnt350RMs/
	FPZtSaDxUTs1aXXj6Xp+DDPzgcVZnFaFertbEmn9RctUxtUWS8uIh6X0Y134HLNuwEFk+Koj9nE
	9XEQ4ujdmzibYK08m6oMBoxPyXso4IQ==
X-Received: by 2002:a05:7022:220e:b0:143:296a:4e58 with SMTP id
 a92af1059eb24-146cfec8688mr17695133c88.27.1790639041117; Mon, 28 Sep 2026
 16:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Sep 2026 07:45:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9wM00UUgXCCapLkuNhaV8h7Hh5gDP=ayhUTy2kxLn8gg@mail.gmail.com>
X-Gm-Features: AclHuK9rDQP3ezTpoWlsP6Hp3Tj24gUagLdqOtVesows-kOTI3dxpack7i3LaLs
Message-ID: <CAAOTY_9wM00UUgXCCapLkuNhaV8h7Hh5gDP=ayhUTy2kxLn8gg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
To: Julien Stephan <jstephan@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tommy Chen <tommyyl.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8828=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/dr=
m/mediatek/mtk_hdmi_regs_v2.h
> index 521b35c7e14d..bf3ebf5492d1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
> @@ -173,7 +173,7 @@
>  #define  TPI_AUDIO_LOOKUP_EN           BIT(2)
>
>  /* Video downsampling configuration */
> -#define VID_DOWNSAMPLE_CONFIG          0x8d0
> +#define VID_DOWNSAMPLE_CONFIG          0x8f0
>  #define  C444_C422_CONFIG_ENABLE       BIT(0)
>  #define  C422_C420_CONFIG_ENABLE       BIT(4)
>  #define  C422_C420_CONFIG_BYPASS       BIT(5)
>
> ---
> base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
> change-id: 20260828-mtk-hdmi-v2-fix-register-offset-879afc38cad1
>
> Best regards,
> --
> Julien Stephan <jstephan@baylibre.com>
>
