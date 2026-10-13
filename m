Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0984EB867;
	Tue, 13 Oct 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890179; cv=none; b=ljTWT55NGLmh9kzii71cl/VmPpRZsK2vclimX4lu7nP1qNx4Jpy4wMUg8OwkQ4qZIAorhM62UX94vT1gYMSr4QIAfH6XBArTDwzUnpaKfyR63lBUg5VnJrfX4OO1pQhqgQQnumtUKHAEu23w1xHh4v03xDUdoe/EaJGgqgKOdYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890179; c=relaxed/simple;
	bh=W7tz0vvlfrzfCYTJiVG6PHb97JVa5CJPlYPau/K208w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eWE+q4QORLEzbhA2go+lEL2rKAFlWmooOUi2uK89/mcJ9wSFuGimcBAsy1cvZtJTfcTJlb+HgeUOD69N/HlRs8I9xN+q8/mjptlrBx07PJ/XRO2ZMzpXDKQAEpt2lmXTmUz6oPZc9FeUUIpAf8sWX9pUtiuJb8CZ+vBVddcTrZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaUZwtBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaUZwtBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61B41F000FF;
	Tue, 13 Oct 2026 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890177;
	bh=AE35/wvbe2tPqWWH+/96HVFu/mnoLotBnfh0IUxXsz8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZaUZwtBtpYWb5gyg/c0wcRswg9vNwWadc2NGVVioud+MwKuXH03MU/dQJLFp+97al
	 3QSGkrk/AQy81xusKGXQ6kTraveFTyMYSVTQnjGYq4S8kaoXQ6UUwa+zoXbm0rwb1o
	 l3BT9Cwg7fVUuEODwmFlIPcp6o4hCUjCas4reEDH6jqb24qRCX56L12rFc+4dSvue2
	 Ah9kWky+qGYm5GsicGqVxDEhgMGWdetSVMKUeabIzWJ6mgq4iJktIue4UdLbajEOhX
	 F0OCunjJpNnosxPVBSDn7fZyck+J7gBxXpWp+ErdgkU1GX0u3GKaboPe0m7fTK8OMY
	 KXsjIY866V/2w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 3/4] media: qcom: camss: vfe: Add the demux + BLS
 stage to the pixel pipe
From: bod@kernel.org
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-sm8550-camss-ife-v1-3-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
 <20261013-sm8550-camss-ife-v1-3-d50de00077b7@imd-tec.com>
Date: Tue, 13 Oct 2026 12:16:13 +0100
Message-Id: <179189017360.1758911.15058199128804994781.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5413; i=bod@kernel.org;
 h=from:subject:message-id; bh=W7tz0vvlfrzfCYTJiVG6PHb97JVa5CJPlYPau/K208w=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqzhL9RV4BzhqI+VAQETg5yrm1oyg8xVc8yuuBf
 ZRmMElcNIWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas4S/QAKCRAicTuzoY3I
 OlDYD/4of5vHdFZXRTZ1rtenKKFkNIsdL29HFrSLIZC+Ju2ZQ1xmwnoEjmWPGh1JQY1O459upTn
 pLaJ1TEwwg4E7gt3TEO+Zg8yX6UkHzmz5HiPGwChSWt55da/Nf1dhkSSuON2cydlNEbkdqc4V31
 jPdDPYpcoFHo1qhgCCEOSKGyNm8xI8WWmvvavpkAit2TwDrXRlHMeOwCsQ8cFVT82ZN7BlzsQ48
 loTD8nAA8ShDB/pDz0q1C1uy721lpHndRECVViz++R+nBDQ6mCCvdjpc6aYb6OuQSIQ4sJA97R6
 36hM+WCrjvzJAInTPWOVnD0OY8Z0M5Gw99EQTo72ZCu8aZRxOP/B68RBQYYtrVsJ8AcrEkEiY3U
 ra/hizJnnZWZC+S/IR9/r03aq4G4T7HXXeut6bJBZOs+M0Rx295Js/rGlseFX94sNb/iKw3EZKU
 XIgWD30dAAZpygsA6BsHZKgxQevvIh2WF0Q51En4sEPPoZJirzGxkWtu1+dKhL1mYX9Ofbku5kL
 rKZ+yLep2QzIg5xArAZkC5tbeG/ZlYb84wk5wLzS7SdyJCLpTqwTuh7wOsLKMIPcje9VeKuApzC
 e9Cq7Ka5yMYUteAteWk/6JZGk1GMevDFj7PrPespxLF2M/uBoczAcgdtrjuiIjv1UHqIQTXM8oM
 nWYEa2fA30XKrxA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-13 09:44 +0100, William Bright wrote:
> The pixel pipe never subtracts the sensor black level, so blacks come
> out lifted and a demosaic that is sensitive to a green pedestal mixes
> colours.
> 
> Add the demux + BLS block ahead of demosaic as an opt in stage. It
> takes the CFA order from the sink format, subtracts a static black
> level and stretches the rest back to full scale. Its layout was worked
> out on the IFE 780 against CamX's demux + BLS 1.4.1 settings; the
> IFE 880 keeps it off until it is checked there.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-780.c  |  3 +-
>  .../media/platform/qcom/camss/camss-vfe-880-pp.c   | 65 +++++++++++++++++++++-
>  .../media/platform/qcom/camss/camss-vfe-880-pp.h   |  3 +-
>  3 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index c2ffe39f929a..032786c4ed74 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -247,7 +247,8 @@ static void vfe_line_prepare(struct vfe_line *line)
>  	struct vfe_device *vfe = to_vfe(line);
>  
>  	if (line->is_pix && pix->pixelformat == V4L2_PIX_FMT_NV12)
> -		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height);
> +		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height,
> +					 line->fmt[MSM_VFE_PAD_SINK].code);
>  }
>  
>  static const struct camss_video_ops vfe_video_ops_780 = {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> index f962016ef3c6..87e6a241ec05 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
>  
>  #include "camss.h"
>  #include "camss-vfe.h"
> @@ -18,6 +19,17 @@
>  
>  /* Register offsets, named as in the IFE register map */
>  #define IFE_TOP_CORE_CFG_0                                       0x00024
> +#define IFE_DEMUX_BLS_MODULE_CFG                                 0x03b60
> +#define		IFE_DEMUX_BLS_PERIOD(n)				((n) << 20)
> +#define IFE_DEMUX_BLS_EVEN_CFG                                   0x03b68
> +#define IFE_DEMUX_BLS_ODD_CFG                                    0x03b6c
> +#define IFE_DEMUX_BLS_GAIN_CFG_0                                 0x03b70
> +#define IFE_DEMUX_BLS_GAIN_CFG_1                                 0x03b74
> +#define IFE_DEMUX_BLS_SUB_G_EVEN                                 0x03b78
> +#define IFE_DEMUX_BLS_SUB_G_ODD                                  0x03b7c
> +#define IFE_DEMUX_BLS_SUB_B                                      0x03b80
> +#define IFE_DEMUX_BLS_SUB_R                                      0x03b84
> +#define		IFE_DEMUX_BLS_SUB(v)				((v) << 20)
>  #define IFE_WB_GAIN_MODULE_CFG                                   0x04560
>  #define IFE_WB_GAIN_WB_CFG_0                                     0x04568
>  #define IFE_WB_GAIN_WB_CFG_1                                     0x0456c
> @@ -313,6 +325,55 @@ static void vfe_setup_chroma_downscale_nv12(struct vfe_device *vfe, u32 w, u32 h
>  	writel_relaxed(0x00000000, vfe->base + IFE_DOWNSCALE_MN_C_VID_OUT_DOWNSCALE_MN_C_V_PHASE_CFG);
>  }
>  
> +/* 12 bit black level subtracted ahead of demosaic, 42 at 10 bit */
> +#define IFE_780_BLACK_LEVEL	168
> +
> +/* Demux + BLS: CFA order from the sink format, black level subtracted */
> +static void vfe_setup_demux_bls(struct vfe_device *vfe, u32 code)
> +{
> +	u32 even, odd, gain, bl = IFE_780_BLACK_LEVEL;
> +
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		even = 0xc9;
> +		odd = 0xac;
> +		break;
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +		even = 0xca;
> +		odd = 0x9c;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +		even = 0xac;
> +		odd = 0xc9;
> +		break;
> +	default:
> +		even = 0x9c;
> +		odd = 0xca;
> +		break;
> +	}
> +
> +	gain = DIV_ROUND_CLOSEST(0x400 * 4095, 4095 - bl);
> +
> +	writel_relaxed(even, vfe->base + IFE_DEMUX_BLS_EVEN_CFG);
> +	writel_relaxed(odd, vfe->base + IFE_DEMUX_BLS_ODD_CFG);
> +	writel_relaxed(gain << 16 | gain, vfe->base + IFE_DEMUX_BLS_GAIN_CFG_0);
> +	writel_relaxed(gain << 16 | gain, vfe->base + IFE_DEMUX_BLS_GAIN_CFG_1);
> +	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_G_EVEN);
> +	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_G_ODD);
> +	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_B);
> +	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_R);
> +	writel_relaxed(IFE_DEMUX_BLS_PERIOD(1) | 1, vfe->base + IFE_DEMUX_BLS_MODULE_CFG);
> +}

This looks pretty close to correct. I might cherry-pick this and fold on top of V1.
---
bod

