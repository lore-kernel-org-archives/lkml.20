Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619E2CCC5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776399; cv=pass; b=TjrICzlRY9lOiyQbsO6KoeqcDCfVSvB9YouHrs5oBpyTMU2TLRGtQPFvgh5orVbaBzLO6lkeq3ntA4KXEkNXXysTXohgljk/723VOXW34ebz47XwK+J8SxTJREWDploEGGUpWweK/OckyOfyXR1TIEaZ97Z7G0vsprOn8U+AIp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776399; c=relaxed/simple;
	bh=7tXfNmQFPthqRgnD+N2jwL6JcbsMYPl/OeD0b/XvCME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQ02niuDJuqh+PDNSmdfcC7RXjzWi83K3+2NfvL10+UHJgKK4pgc7T0prACjnXIMfmgfqvxFAHL2VA82NVGgf5/NMLMeubm0Oiu0KxH7MHgbGeAFncsrSa0CfORv+qZPE9jAOeK77ogjexbfCXVsINT24B2MNmH8h3rJfHHilQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsBKmqyR; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsBKmqyR"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so5107704d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776379; cv=none;
        d=google.com; s=arc-20260327;
        b=dvuqUiDXjvuMrTABvSdSekm95/x4VM4caauekHegi6JkiegtHXJIdByQAW09v2ShKB
         TIyNTxr2LO5450lEdnI1o09Qh3OypKBoWAZVAR9QQMMlupza0UqFZT206LL/7XbUHEbu
         voCCjb0GGHEuiSBpbnNpnelKVHtbprUsFPZ0xMCc3qcg0FVurX0jLGEgIf4eINo28KGi
         wTh0t1NdtbU63iZrjLjXtmnls+D663EKm8b0QXmWCqkpqw55w9dptPs4WGIe9eyW5Hb+
         ohkPCm7+YfeqpLB0oKMmoyYnkzp8EFjEg+6iLNhWn9In6RXRMkb6HtwOtIPq/q4GxVQB
         gnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        fh=tZWroUpPzfrPuuCM/Rry7iNL3uQyvXM+DdtET4CC+lw=;
        b=pk0tzxpq8ABOmPGxCnuVHDt5v9kWIEPy6Rn9gsCFJnSDQ9M9/ibb4lGddwnQQaD/ms
         Vp+DoaNtFmsyGe53fO/h4MZtzG0Saj2I63i9RBVka07DfoxnwVGTlZRxw9mGDmVYJAz9
         aBaBJ2CQp/GqTcJREXF2wQxNiTqtmdkzZ/cxEochw90bAc1uLMHoOQub0/R2ICUTYoGS
         kbqB1zmCqjNv9/6K3Tj52t3hWrdFbUKYaM816354Vpo7G58Kj/mx8o2LxdYp9gqdbuVo
         xwlxrjGaHLaHOFo9y5Sjrs6FsUU03wijMllBfeIvnYg802Ns4OW0A8GF0k+fEdkbXzNs
         2V9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776379; x=1791381179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=ZsBKmqyRZ6rJ942Mdt4RDpu8ZY8T6cScQSRSFJjTOrrywHu7nAnAYLEe2mzTzFTlHM
         Z61ZlhY/Tz8Yv+w0h2HhaFmPnOxWBLZYXLhCrMwxdJsrVAoCIlLuedrXcqH+B0LrhJgq
         O7kXEordVRtnlc5hsNHT5BIWQokOsmymI4M5RCab07maYZ+65l7T3b7DDsz6mCkuU76s
         o5CcfvouevvKQcIGUQlSpBDP5a3PKJwe5aJT+V25PtCGZXI5fEx7btFyD26NNLx7idir
         dMv1+aqzU51eBhEeydcVbFgaFMYqXRhP6TxaX8qADSWrX+D1L2OA42VOJCE7FDEJeeZ6
         akgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776379; x=1791381179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=uhsO86WE/Kjo8ojpAAJ7gH8JVWhaIfFO/fkTdMwWnNA1a2mbWmJn1AClIrLC8jelmE
         GE9WFaFmK2rajpSnQs1JyoDbG/6iSBkrkaOJD2oK6bSKJenNlxQORLPzxkcPjGSSUbsa
         2LUYbqW4/PWvJzIp7Yn1ALGeI8b2Vgcp6fYpn10ptA7X56InrnAtNz4whDTvY2fZ0/+T
         UyqJ7gk/JtnFD6X1uizUSHO5gA3GgzbETx8g0VaMYu4a2NtzC7G0C/STa7V+1h4dIpZy
         bVgdUJfnkAYllE8f6JAbkJhY5LyzqA4spQqYfdUBJKbYaWoU5YsxS4yvbWjRfWcV+x6f
         CSYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNqLrj8sCNs+IhOF2+KIxzrGPrTcHctq2dApBJ/5n6ib13vPyTcKWN5Vy+0KtFO78rBZzBJaJkUQn/ve4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs3mqkze1orOYpAgqjC8JuJ38MOdoSrSdpktl/ukbQALp/VTDP
	Z693yQ022Rq8QS3oMSbzCQw9N9MaCH+F7PSVMWUcDl8qYgbUp8UF6rDktbU7bxAIw0FAeg6MePd
	aY5903dQP1xvnpvr0o6SlAUbocUABFMp2n8V0yr7g7g==
X-Gm-Gg: AYBFou3cqrmv5OZZc2xnY1wriw8MSo1WyrBqqyQMO0Jli5bs2VIQJ/jSe0PBFImpWMn
	acih2IVk5FQmawt2ZgB6HY0c66tJ7RYgUUNOiTbcjYIaRgx12TZpxJMsoddtyi35nMptnSE8jJQ
	+zNDMqO0ojrfKO3jsBwl1IEhtYhZQClzE1BBdXx7GG1G65/orHwCmhGqUnA23ap1fht0t1xHgIT
	JdpdEc3M+71y3y61EUD9s85PPqWjxmPrMWs933KtWXR1NHANwwmYg2se/KlglOdm73CTTnErT8d
	jTT2Bpb3k6rN+puoA9Lyyp4k7mC4KQiIGUY1T4zXUhm1JfJOfC7yzhUZkR5TOeuP
X-Received: by 2002:a53:bc0b:0:b0:676:24e2:c67e with SMTP id
 956f58d0204a3-6768351ba5fmr612451d50.89.1790776379376; Wed, 30 Sep 2026
 06:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org> <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
In-Reply-To: <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 30 Sep 2026 21:52:48 +0800
X-Gm-Features: AclHuK_VxnR8JOsc80IMzuEQ7RuAU15Ps6hnH2uLVe_uy8XWpyeHRK9yzrHieFo
Message-ID: <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > Some devices treat two independent physical DSI panels as a single
> > logical panel from the CRTC's perspective. However, two separate DSI
> > hosts are still required to drive the panels individually.
> >
> > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > allows a panel driver to inform the DSI host that it is part of a
> > dual-panel setup, enabling the host to coordinate both physical
> > displays as one.
> >
> > This change does not force individual panel driver to manage
> > system-level display topology if the driver does not intended to
> > support dual panel topology. Only the driver that set the flag to
> > true need to take care of panel topology.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Do you have a single MIPI DSI device, or are there two independent MIPI
> DSI devices? In the latter case, the flag is wrongly placed.

Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
mipi device
to notify host they are one of dual panels, so that horizontal
configuration(width)
in mipi host can be handled correctly. Where do you suggest to put this fla=
g?
Thanks!

Jun
>
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 2ab651a36115d..889ef1421207a 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
> >   * @host: DSI host for this peripheral
> >   * @dev: driver model device node for this peripheral
> >   * @attached: the DSI device has been successfully attached
> > + * @dual_panel: the DSI device is one instance of dual panel
> >   * @name: DSI peripheral chip type
> >   * @channel: virtual channel assigned to the peripheral
> >   * @format: pixel format for video mode
> > @@ -186,6 +187,7 @@ struct mipi_dsi_device {
> >       struct mipi_dsi_host *host;
> >       struct device dev;
> >       bool attached;
> > +     bool dual_panel;
> >
> >       char name[DSI_DEV_NAME_SIZE];
> >       unsigned int channel;
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
