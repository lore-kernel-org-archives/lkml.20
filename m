Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7350418371
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791114424; cv=pass; b=ZFK7XqcasvdrORbXG2nS0zcYQZpq4PioyAkAKScVVogt74Qtc+7zqkrixhLcTmm6mGAIuPTse8VsRIMEYsFRU/zo8SXH9EEUYeB4Oa4vxBMPqinOuQ/ZHJWqkMPntUPPtHpufgdFJ7wVGJTgjbYDOBouMpOsN0YrfSFECngVmk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791114424; c=relaxed/simple;
	bh=4tIdOJ4E73NzfC8+HZPUUjeQno126FKXlIlP4skhobc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5mGsxqzxR1cad2a0Y/maPq5fHTjBfPrm+sk7WtSoxnu1FxJghaS2s0GtDaMvIp0jTnCW0XuIgRuJz9CeRbTLNZLbInDeAWJx6PezIpepojv3khbYL6cE3Th+nZtlRJI/9FeoCcRUe0i3/p1qoOMJviSISqS0SmWDA2JCpv04Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEMsbJBz; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEMsbJBz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1547273a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791114421; cv=none;
        d=google.com; s=arc-20260327;
        b=npO/nlEBzQL5s4EUdXPAhVoYfJpSKEn8WJ+sGLepLgNbYL9ybm3DMWdefghKZTREe4
         JO4shoOwHC5Gd/9nWHynE14O5b1OCkoW0EiPdFu45eo7oIAu+2D02Udb10WgryUtE00j
         tSCk4e7JenzLIyJR5jnRDVIk3VtqrUKae+2w1Lue4sDjJno7Q+GCalf08aMldA4IBupH
         8ziESzjJtxl6yteJe0sRRDst7szz/yi2XN/aPOjQmMr0NsYny4k61ioYoW7wABW5z0e/
         EBJLsNtHCgPZemBlfDBfZY2aDZwRgcAm4WdKGc2/8biLrjaIgnOhpAI/mgSEkEi6oV8X
         e/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        fh=YVNtM6LuM+1RXK2AS6pEYGjJ9PMNntWO+EKcucD+d+o=;
        b=m8c7jBBfI0YzRbJN/YnwYhNlLxKFOqYO3cV/84QKVTk065zKACuJ1iMw9/zxWpigGB
         hCmWjpATI+a9tOWyk+/9inuVGPmrAXT1ncWeIxWScNxB9pTQ7QJUoP8Z5DOtU98OmpR/
         IMjUjXdqcTtsne/C7FBJGGSxPlCmgOJ8uZrF0Pn/8SXWVm/wIi+7OOVPWu58vBIOU3RF
         g0UNJsjrqKAFPQNN0+yEkQiLwc8c2NTrQqw7xhIqj+31yoTdMW96AKDYWvXWpJaLF5bf
         ViG1co++btkZzAbfBipHa/CtHwAeeiPgG+dkkzxOqK03jfHbTWqM7/qCWzJB8jackd4H
         QwpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791114421; x=1791719221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        b=rEMsbJBzmtc/NtRtwPDO10uJTmu5iJKC0DP9/tguAEuQrhQU3rka9wVCPgJErPGfUA
         G93LjUcaKJ07uCpkKDqgZtyP8nL39+PMQbq/H6w+EoBeWnxKN7JsL+xZBTdMvWBzgDOW
         k6aQhjumH4eEynNaOgkwL7toiVyfceg1rlPrv330ZYZGi1wtX6Z9vr/PkFvctjZe/ldi
         ghAdAtelL/sQwYfXCpdLFGgBKzCJ/bSH0haE818sEJObMPLdF0qF/Roi1SeEJa3JcDYS
         EZGM2+buXVFQJKixvO86KHfdzwGUCGZ8nvuP+S0+qxI66HYOhkXBTp1MDV66mkvVKWLn
         BYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791114421; x=1791719221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        b=iKEQYkkl21Ib9rveFubvp/yznWcreKsSa65NVRFU8WNds9yHSrMmzmlTx4fuXWhD+X
         hjz4g/UtK85SyLn4qkUuJ5wt8j/7GZppjV+IeeskBcJDrquw3NlI/MsR5lT35/tidxjo
         S9LreSZGgsuQizzA/8LhdD3Pma3F9BKI5+UMNQIbIUsIDugGOuFBgmwWICmxrPnP+TtQ
         WyGR3mTf+2YMBWM2NQgNfVgwtupNxfZ1vZKvBmr20wv/Cncu688GrdLtLy4EL3Wu8xLR
         HzN7aXAmu9IiEKg0eBSCCimXbq+Kn4AyVRykxVUT+dC6lAaZJ5vYGSWt1wzvKMsO47Zh
         IQlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy07MlQA2m9KRCPu32j9yv6IaUoM1vNtFJyK3ZdcSVqNC+UNLK9rZLR8aRKUYX8RjDHgl5AaPfJ9KI8De4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM9zgUtAcASXLifPk1UwpyqtUZ8E72uweL196AI9OH31ru+bOV
	uhCMDQnhkI6UFYEBihNcrI8FRZoOHJazTki6vyNln+5loYFMde3G8fgB9vvptzmiQ/yQGSA4W3D
	rwGyocRALmMDyS6NJoE6iIkmcazBSH/4=
X-Gm-Gg: AYBFou1wj+om+TwcmjYYZeQ1xdTLLnpomnQq1nbf3NY84ESNxSf5c6sXiHGqqaaUGI7
	g7QiFPr4y/eIqy67XQi0oODn1gt5SvmuecJ2d9++V+AQABt8wPj+7JbrKCYjun6H99088tPXPtw
	zRC52bHTelu0k6Y5hd11FUcIspTrisW3BdPouF5g0iXuk0HIAdPHbUuPvtrZEIUpw6a7TBOTFzi
	tVd7nLlvtxBn13NmKX/S/CCz1CayJbnltC+wUqcRrzMzDL7xOx2BwOl9cPcO+CtoDbpHWg33SMF
	BJ8IkljkwOs/3qYgmll3/+wwPb/4SR3fq46A38rsFMuGyAlXY8DDn8fKWz/yWx2VBNkhYhVS0LN
	jFIzccoNPkA==
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id
 4fb4d7f45d1cf-6afad90627bmr3827480a12.24.1791114420829; Sun, 04 Oct 2026
 04:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004102758.84436-1-26rote@gmail.com>
In-Reply-To: <20261004102758.84436-1-26rote@gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 4 Oct 2026 19:46:49 +0800
X-Gm-Features: AclHuK9M0MD-4wDlLCu7PKAzHiucnOaIPii0zTGjuitof7jNo1-BtNJqT62chRk
Message-ID: <CAH2e8h6RPMF+Tod==XKjAbjmnzUKs1skCpvN7_YuGyao9m2baA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: round up the compressed INTF width
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Alexander Koskovich <akoskovich@pm.me>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, "P. Lewis" <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:28=E2=80=AFPM Joonhoe Kim <26rote@gmail.com> wrote=
:
>
> For DSI with DSC, drm_mode_to_intf_timing_params() scales the INTF
> active width by bpp / (3 * bits_per_component) and rounds down. The DSI
> host computes the same width with DIV_ROUND_UP, both for the pixel clock
> (dsi_adjust_pclk_for_compression()) and for the active width it programs
> (dsi_timing_setup(), from bytes per line). When the division is not
> exact the INTF line is one pclk shorter than the DSI line, and the DSI
> FIFO overflows.
>
> Example: a bonded DSI video-mode panel, 952 pixels per link, DSC 8 bpp at
> 10 bpc: 952 * 8 / 30 =3D 253.87, so the INTF uses 253 and the DSI 254.
>
> Round up, as the DSI host does. Qualcomm's downstream SDE driver also
> rounds this width up, and Pengyu Luo needed the same rounding on the
> Legion Y700 gen 4 [1].
>
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850) with that panel, with a
> module parameter selecting the rounding: rounding down, DPMS off/on gives
> no vblank and 14000-17000 DSI FIFO error interrupts per second
> (dsi_err_worker: status=3D4); rounding up, the picture comes back and the=
re
> are no errors. Only tested on this device.
>
> Link: https://lore.kernel.org/all/CAH2e8h6oinKxN1ndcvHCSc+=3DbFLXVVDZVAVF=
0cQHoiaMvEwhPQ@mail.gmail.com/ [1]
> Fixes: f9ce482d7dc0 ("drm/msm/dpu: fix video mode DSC for DSI")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Thank you, Joonhoe.

I am glad to see someone is raising this. For most tablets, the
horizontal pixel count is not divisible by 3, so rounding up is
necessary for them. Besides lenovo Y700 gen4, rounding up also helps
dsc display on gaokun([1], patch initially provided by White Lewis)
whose horizontal pixel is 800 * 2.

[1]: https://github.com/whitelewi1-ctrl/matebook-e-go-linux/blob/master/ker=
nel-patches/0003-drm-msm-dpu-encoder-fix-DSC-width-truncation.patch

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu

> This does not touch the divisor discussed in the RGB101010 thread
> (bits_per_component * 3 vs 24, with and without widebus); that patch
> was dropped from the series pending that discussion [2]. This one only
> makes the rounding match the DSI host. The panel here uses widebus.
>
> [2] https://lore.kernel.org/all/20260321-dsi-rgb101010-support-v4-0-eb28e=
cebbfe8@pm.me/
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ba810f26ea30..2ac517db50fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -134,8 +134,8 @@ static void drm_mode_to_intf_timing_params(
>                  * TODO: replace drm_dsc_get_bpp_int with logic to handle
>                  * fractional part if there is fraction
>                  */
> -               timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc=
) /
> -                               (dsc->bits_per_component * 3);
> +               timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_ge=
t_bpp_int(dsc),
> +                                            dsc->bits_per_component * 3)=
;
>                 timing->xres =3D timing->width;
>                 timing->dce_bytes_per_line =3D msm_dsc_get_bytes_per_line=
(dsc);
>         }
> --
> 2.43.0
>
