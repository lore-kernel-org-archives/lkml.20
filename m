Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11554E325F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775791; cv=pass; b=SZB25vdPz6+A+EBEVW6lqxZOcEL7BI6EJOYupjljjgNP3yjUqV/pV9n0gveRBorg1IfrIS3vRSMwT15auqUKA/CiiNwvY83wqImUxvhrKfKxrZ1U9uYSFuyxeNtR/orZ0DAmR4hz13PWfkO2/7HVbroyzXHGeVlsV8S/XJ4U4Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775791; c=relaxed/simple;
	bh=o5I/27GpSdmTg2EINSqokfF37ZbT3yOP+K6Ho5qDsgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+w5c+9zVb5ITw0REGab/0nhe1utp7ucc9hGIxb/pBCuG7Q0oXEnQztuZOBzBuGRNc3edQnyPX2bLhC5/wKNxKFlVuLTTqmNflpjz5GsZm2EPxDgsQXLNZ7fMt54esA7gkc1jJ0HuhUnE49BO71UwrQccR+3sgJ8QlDmRNNiYaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsF8ogRb; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsF8ogRb"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so5418388d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790775772; cv=none;
        d=google.com; s=arc-20260327;
        b=Fja2UElNxpB81NHUFh+CNOeDd1Y5E6SQaXIiZQL1+FvOlR21ZfylbrmIdgiJn3AzlS
         UW1w1fbZA2wYzuywXdsUctovJ7pU20R4fOwtReT2R8+hX2kPZETvLk8knIYq8fjKBTNv
         6A7l6Z96VwEyIHCQ5kEemu2zjN3akXI5MjPoEXx2csqMsZcHAbLcch94xemwZNiyyvYd
         nHxBDqehJ8H95zqQelYQDfzJemqiz+5CACqdr4QAgJADksZeKmI3MVTUYQap020Qy26v
         tx40eD0Z4Iv33fXuwou46Z+KSPsiPQRCdYM/DjlPs3EFtZ1Pph0+wRD4Z1TmROt6IoR1
         d09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        fh=j008H5/mppXpyVuAAbATGpmRhFxbY72jlPH+dFc2s4E=;
        b=kIxSgevxp10g0QoPTV1FZ/jPWC7StBwMBGkT6md+NHVNNOMvA+4/PVN6uhFH7h7Dpg
         tvcQaYlxeXEfYfqjD82nGYUSw8rH9CrkVApMXy+cGxLOSVKj5DITkiHlb9SDbyqDOZDG
         os4vyWaug7x9NFH990KAbgGkGlS2HeQuojdP+DYHNvr/KvAicdmFUjluT3EJ6yZ4EWRV
         d1aiHYwAUW9B9INjLYY97/qOH++ao2XQxIC1e306r5la2v0IJaUDbM3t6atKqK59rQPd
         GnBgnvGnmD2rdYduy1CCpmK2TignIudKnvHmx7HOM22SaSNW8IkPQkb+IyAfFu623Ckg
         DzgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775772; x=1791380572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        b=TsF8ogRbUjHybVa7hAoFyguOzJ1HmqEa3O1CIunQPgjghz+O+N2fK5o/+ZvbE5+fdh
         bkIgs9UmPiuuEfEU+b3tAfm3/y39EDSEAgOzbrvKz4OhdA3GkrPd5cOZagxyBVevyRhr
         gkcfIxS2PSHFOQR2ETHHqXA2t7e4Lmp7v/4wE5K0MeqnZBO0GeJ1RzqkAhvTgiAf5mz4
         6047U88oLspQW6UhC+y76V02MBhR1UDRkJIpNWjqANIxCQQmlrqwQ7CnRUearKtZ3CLO
         VK0LtVm1Y9j63kOHntdQDMVugaEBshQJOMxp34YKaJotfwMc0ysHTSLQmHnCqB1hMctk
         X+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775772; x=1791380572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhCRdy2JCa2oSL6X3aWOWI051OiTlXnSfcThJ9UZLT0=;
        b=ryf5pohE3LpNkTvfOV0RAot/YufO4bu5onjMWhOaJSMBveRcqEgH0K5+V+pur9xMkn
         cP6hYqisjsPSJC9l8eq1AIloLVUXOs7y8jtDFtpqAK2zlSXDGH5p2w9XWdzLu2U4AXOp
         UvWps2iYLHKRXIoBKYnnwwb3RYl9QGi6CXYwOs7j9ybVL7R/vmnAFVriCh/Kl1ilheFy
         ycHvD/0bm/G2PF95xwbgBzRa8jrYseSIei/DYgJU0sE2JQYG6ePu0zDzem64CTXsclUr
         kw/FIogTgU4H7gV5Qrb5nvbW3DU7dhAfYcmOTLiqnZYSAk3tSvOo3hKb77v0NAmvn9d4
         qbfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3jvyk59D8/dAwLGPg6Ed5ZIkJcjiaXWZrfR0KELQaQHDttnUIXvsIkEBPsBQJ8Tvqsf9FEeDqsg05vIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxsrzdYw/0mwPTKCWx1dM9Z19C3gqushXM5MwwV89jzAbgzLwR
	5+PfeWTf62TZsLJC3NxB/0H0HKOutiQLDyOoyuLjLOxGI0w6t6mzNflL9AIGvGbopvcko1PU+Mk
	OTVUB/8sp0aODq6y84gjGe5gtJLW0IBgozft1AqJz0Q==
X-Gm-Gg: AYBFou0c3h+mZRUlvZCEe0vXASPLmOgZRPhZHWwoAtd72UrNZZzvEGGSPf/XCemf5ZY
	muBO0qiySJItrkVeNSNzVoZ5G8e1Oa0D1j25/qYQXj15xu3Yy7cJcZW/nFrO+Rel4Qed2cpWjwp
	/6L1Kj5+oIpkthZex8mjL3cRtqFwXFHmTW3aJiHbKSevey1rcnKcL6DdBdXsnJWP6uaVgslIprc
	0qV4MMBr9flX9/gSzJyV7bhUveZSKUcGseR8/stTW5RJ3Mgp1IlF4MF8kmFcHWMYbZXWYBTQopk
	aaakGQgqUIAZMc7tSVDsiaoD4eFx8fZtaf1EdKUv7nKOd2G5lc64TFHulUKheihvubRvXo52dPY
	=
X-Received: by 2002:a05:690e:4888:20b0:671:464a:46e7 with SMTP id
 956f58d0204a3-676834802cfmr493380d50.28.1790775772498; Wed, 30 Sep 2026
 06:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org> <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
In-Reply-To: <5r6xd4iiwnv2v5ji7xeddihlqstmtajvw5ixmntlwxxmcvo7y6@zueqflvz3lr5>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 30 Sep 2026 21:42:41 +0800
X-Gm-Features: AclHuK8pN-tKG1Z4oDPKCBz_In7b0hfp5ejCHcZi1g56pqmcGmYpl4iWM_GNAmM
Message-ID: <CABymUCP5Gs5Zx9C39RHj+1_mU7aLou9sfgZO=7yS=+fVPWHeLg@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
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
	devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:41PM +0800, Jun Nie wrote:
> > Some panels require multiple slice to be sent in a single DSC packet. A=
nd
> > this feature is a must for specific panels, such as Sharp ls026b3sa06. =
Add
> > a dsc_slice_per_pkt member into struct drm_dsc_config and support the
> > feature in msm mdss driver.
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 27 ++++++++++++---------------
> >  include/drm/display/drm_dsc.h      |  7 +++++++
> >  2 files changed, 19 insertions(+), 15 deletions(-)
> >
> > @@ -1719,8 +1709,14 @@ static int dsi_host_attach(struct mipi_dsi_host =
*host,
> >       msm_host->lanes =3D dsi->lanes;
> >       msm_host->format =3D dsi->format;
> >       msm_host->mode_flags =3D dsi->mode_flags;
> > -     if (dsi->dsc)
> > +     if (dsi->dsc) {
> >               msm_host->dsc =3D dsi->dsc;
> > +             /* for backwards compatibility, assume 1 if not set */
> > +             msm_host->dsc_slice_per_pkt =3D dsi->dsc->dsc_slice_per_p=
kt ?: 1;
> > +     } else {
> > +             msm_host->dsc =3D NULL;
> > +             msm_host->dsc_slice_per_pkt =3D 0;
> > +     }
>
> Why do you need the else branch? Isn't it already NULL / 0 by default?

AI bot review comments reminding a case that panel device may be switched
to another panel. Not sure whether it is possible in real world. Just add t=
his
for safe.
>
> >
> >       if (msm_host->format =3D=3D MIPI_DSI_FMT_RGB101010) {
> >               if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR=
_6G,
> > @@ -1757,6 +1753,7 @@ static int dsi_host_detach(struct mipi_dsi_host *=
host,
> >       struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
> >
> >       dsi_dev_detach(msm_host->pdev);
> > +     msm_host->dsc =3D NULL;
>
> If you are fixing something, it should come as a separate commit.

The same case as above.
>
> >
> >       DBG("id=3D%d", msm_host->id);
> >
> > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_ds=
c.h
> > index bbbe7438473d3..c522ab3d71853 100644
> > --- a/include/drm/display/drm_dsc.h
> > +++ b/include/drm/display/drm_dsc.h
> > @@ -267,6 +267,13 @@ struct drm_dsc_config {
> >        * Offset adjustment for second line in Native 4:2:0 mode
> >        */
> >       u16 second_line_offset_adj;
> > +
> > +     /**
> > +      * @dsc_slice_per_pkt:
> > +      * Number of DSC slices to be sent in a single packet. This is no=
t
> > +      * part of DSC standard, and only used in some DSI panels so far.
> > +      */
> > +     unsigned int dsc_slice_per_pkt;
>
> If it's not a part of the standard, I think, it should not be a part of
> drm_dsc_config. In the end, drm_dsc_config is also being used by other
> parties, e.g. DP or HDMI. A year ago I saw a version of this patch,
> having this field in the struct mipi_dsi_device. I think it's a more
> correct place.

I will move to struct mipi_dsi_device in next version.
>
> --
> With best wishes
> Dmitry
