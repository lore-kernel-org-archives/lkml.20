Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057238C2A7;
	Tue, 13 Oct 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890067; cv=none; b=Y3mPNd1l9MQwFL/ILo07vLLjnndhiOWyZ28K6VGROmlj0nGBPgRiM6w51OrcMKnyeO/GiHT0ab5LGf+P707PG4OpxFz15MdhC/HPkygCPEeM/L2OjPvXVWQmGHA0qtgSmPPB3C3v7VdF+JESPsY6KDdsc2tq252bWifx8Urmu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890067; c=relaxed/simple;
	bh=C0gTQkKfJiaXwRj0Z/DdK3x3GiSMWPr/NCOf2/zM7ZY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=quMpz026Z8MY4gTQbV7TZbGzpmFZxR+FiaAZs1pMub7abyVMoXYmoXEGJcSmD2ysYzfM8UfjHtPgwCKwrt+M/6SPdrPImQpdAY4/TpjfyZtnCFdhzCLBS4xTo8GO4oHuV8waG3R5iZD/1nys0HQ9zQkkaZThXsgyRDdyASp5eLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nnk5byLe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nnk5byLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC31D1F000FF;
	Tue, 13 Oct 2026 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890065;
	bh=dc7KQNlT5te20bdDQ9rLLBUL1Fuz9llyPp+PLk0sHzA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Nnk5byLesQLXbv0bHZlsGZ9LM3aGVUvicmPT7+/5Mg1bFSKLuHWhlsJBd0U55My7O
	 blK8TZos2/XOTOVt0VceZt3NksfyRKcqNpMKyTpzLjzi9FUnF//mp87qjCpWdBqUMB
	 azY5EH9MXqA9CPGLnc72q1nQkz6scZf14GcwpTQ6VKvRMgXKxBKuuSJMs6TCZjvbUr
	 lNOqyDvaaJ0W0t093FN+jf8ydCgxD8HS6yTN5SGHDJL18oH5ajHl7jbkxgYxxSVIhH
	 XEPGubdc1ZP9L7KDH0OnzYFifhLwNHMHXqJLRGNuAN7u0/V1vESg+WHD9DtUYgHT6Q
	 PX7DffQBzXJRQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 2/4] media: qcom: camss: vfe: Describe the IFE
 pixel pipe per version
From: bod@kernel.org
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013-sm8550-camss-ife-v1-2-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
 <20261013-sm8550-camss-ife-v1-2-d50de00077b7@imd-tec.com>
Date: Tue, 13 Oct 2026 12:14:21 +0100
Message-Id: <179189006178.1758911.17982209799976904817.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4714; i=bod@kernel.org;
 h=from:subject:message-id; bh=C0gTQkKfJiaXwRj0Z/DdK3x3GiSMWPr/NCOf2/zM7ZY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqzhKN7+YeoNBamNwwy1N+zWAeFmf+i1A+7MNTn
 1Da3gHlbnOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas4SjQAKCRAicTuzoY3I
 OlamD/92Xm6W1fDDg7lSms8HHJPyGTRC4OvzLGPnGko/9l91bGX43n14wWRaD74+n7tzswrstnf
 yypa76WKoHJNeQ28B535PXEyva3c2AbRjkrmE/4JOK+gRn0aD63zuxsZRBXCchAZHNBp0JTv0GK
 HhiqIm8QMluOWTWS0bnBCOZg2z1NjCNE1cUXmg6nkW1NEnTo77hWFpCaFgJe3mGc8wVvLzYSbLw
 B9w6UnlWsFhHMdycoG0Pv7eklZnX/6j/W/s7XF9V9yJ91q7BhrIPidNdjMMhollMPPsOMk9Y+di
 2eAzz5M6JcP9OUllskAYk/RcmVY+wHpdl93VwANxVYwY0jb7dYquyfCZAAGt3L+8fo+gv7qmOrf
 TFgA7HuGDXm/SeLzuL9llThKMHiuazdL48zRuRRKX7EawtKcT+gFrbSUbWS1jIjTSh9fTkNZTRb
 uZQ9zaYZeP+wWDLuAQeIAxX8BJIUZvX1Jv7UZtW2rXI8GniQ07BQfDGbULpEeg8oPsnHnuKAHTi
 mnxKyz9PV8Ugtdst3RSxyOeV9JiqYxRxh1HOOmaC0LgXNCRP9udGiRZnXVCLZUayzgbwt/pfBng
 Aj4xpH3cib9S9eCCIAUz/aC8GdAFJRxOl3gVHJ2NC5Yp4+il4qQC/H4pBdROKaURWiIzXJYJgqj
 oX5Weh6RcbqLOeg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-13 09:44 +0100, William Bright wrote:
> The SM8550 IFE 780 runs the same pixel pipe register map as the
> SM8650 IFE 880 but holds its WB gain in a different format.
> 
> Pass the pipe a small description of what differs between the IFEs
> that run it, starting with the WB gain value for full scale, and keep
> the IFE 880 on its current 4.0. No functional change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe-780.c    |  8 +++++++-
>  drivers/media/platform/qcom/camss/camss-vfe-880-pp.c | 20 +++++++++++++-------
>  drivers/media/platform/qcom/camss/camss-vfe-880-pp.h | 10 +++++++++-
>  3 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> index 6d483f917d15..c2ffe39f929a 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
> @@ -236,12 +236,18 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   * Program the pixel pipe outside output_lock, before the write masters and
>   * the IPP reg update that latches both.
>   */
> +static const struct vfe_pp_desc *vfe_pp_desc(struct vfe_device *vfe)
> +{
> +	return &vfe_pp_desc_880;
> +}
> +
>  static void vfe_line_prepare(struct vfe_line *line)
>  {
>  	struct v4l2_pix_format_mplane *pix = &line->output[0].video_out.active_fmt.fmt.pix_mp;
> +	struct vfe_device *vfe = to_vfe(line);
>  
>  	if (line->is_pix && pix->pixelformat == V4L2_PIX_FMT_NV12)
> -		vfe_880_setup_pixel_pipe(to_vfe(line), pix->width, pix->height);
> +		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height);
>  }
>  
>  static const struct camss_video_ops vfe_video_ops_780 = {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> index 9b4bdad6d396..f962016ef3c6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
> @@ -313,8 +313,13 @@ static void vfe_setup_chroma_downscale_nv12(struct vfe_device *vfe, u32 w, u32 h
>  	writel_relaxed(0x00000000, vfe->base + IFE_DOWNSCALE_MN_C_VID_OUT_DOWNSCALE_MN_C_V_PHASE_CFG);
>  }
>  
> -/* Demosaic + WB: sub offsets 0, gains 4.0, add offsets 0 */
> -static void vfe_setup_demosaic(struct vfe_device *vfe)
> +/* IFE 880: Q10 gain of 4.0 */
> +const struct vfe_pp_desc vfe_pp_desc_880 = {
> +	.wb_gain = 0x00001000,
> +};
> +
> +/* Demosaic + WB: sub offsets 0, full scale gains, add offsets 0 */
> +static void vfe_setup_demosaic(struct vfe_device *vfe, const struct vfe_pp_desc *desc)
>  {
>  	writel_relaxed(0x00000001, vfe->base + IFE_DEMOSAIC_MODULE_CFG);
>  	writel_relaxed(0x00000080, vfe->base + IFE_DEMOSAIC_INTERP_COEFF_CFG_0);
> @@ -322,9 +327,9 @@ static void vfe_setup_demosaic(struct vfe_device *vfe)
>  	writel_relaxed(0x00000040, vfe->base + IFE_DEMOSAIC_INTERP_CLASSIFIER_CFG_0);
>  	writel_relaxed(0x00000066, vfe->base + IFE_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
>  	writel_relaxed(0x00000001, vfe->base + IFE_WB_GAIN_MODULE_CFG);
> -	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_0);
> -	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_1);
> -	writel_relaxed(0x00001000, vfe->base + IFE_WB_GAIN_WB_CFG_2);
> +	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_0);
> +	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_1);
> +	writel_relaxed(desc->wb_gain, vfe->base + IFE_WB_GAIN_WB_CFG_2);

wait ... doesn't this write the same value as was already there...

ah ok your description says no functional change.

>  	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_0);
>  	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_1);
>  	writel_relaxed(0x00000000, vfe->base + IFE_WB_GAIN_WB_OFFSET_CFG_2);
> @@ -611,11 +616,12 @@ static void vfe_setup_ds16(struct vfe_device *vfe, u32 w, u32 h)
>  }
>  
>  /* Called from vfe_line_prepare() for NV12, ahead of the write masters and the IPP reg update */
> -void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, u32 w, u32 h)
> +void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,
> +			      u32 w, u32 h)
>  {
>  	vfe_setup_core_config(vfe);
>  	vfe_setup_chroma_downscale_nv12(vfe, w, h);
> -	vfe_setup_demosaic(vfe);
> +	vfe_setup_demosaic(vfe, desc);

yeah it looks OK in principle probably implies some SoC specific params
will be required for all/some of these setups.
---
bod

