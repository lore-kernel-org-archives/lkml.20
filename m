Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792775431;
	b=KHITs2pGLDxbUTQxbd/mAVRXlya6zxr2snHRYJ6XJmDILxkaOs72b8r52r3ijZkJBmb1
	 McDFIEvjSpGZyhS1ggFKiz5X8Ms0zCnY29p0ThmVSW2tDsFVinyX4ka0TVaCggulfSAaM
	 UEkpagLsyAG/hoyQ7hJLddGe3qiG34XPiyLA7RO5RdKEgzO/ZLx9CFx2DSnaCPBcRRAAb
	 wXwVhgmBr+DHwKu9cMJbu+V4lNg2+OeaA6J0pLO1yPUTBaksgC60dwCepHT+0wFLg1DgC
	 K5p+5LzdE3+BtImejfNZW781LN/460HXDJiRKwlH6wgCOlYv/mTPwxkD8MCrBoLL3nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
	b=N+9HO2zFAJEk84ksKKFSpGjC1xS+PQ066UElh9SUAFZCjjZn1KGPi2K8mXGoS1UEx5zD
	 N6RmKEgPKcSSsUt6D1LSRgEPdXLI3CV9LgyWseUWk6GBX3i5OsPt1GBXQgdaFzRh7SNvP
	 9WvYnMxT6vJml0pvUiu1v01mfOUj7AwsUsP8Gto3Prwnv/IsXpwYUdQ9GWTxi2EBJ+aVF
	 KI5+pkdu9ncHzjz6JtMTJcXdmUOi4nrtxdSjN6e04qFNo10oSE6QqBs4onROSCJxuOyaz
	 uBAzgN4t5ID4xO6yTCR29BP39FftIoO+eJLxIyKQ1ACOuNzdHQvx77aeO4q05GcCCpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gPjmpRsZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69D606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C69D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gPjmpRsZ
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so7272391fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792775429; cv=none;
        d=google.com; s=arc-20260327;
        b=LOeI1DsEGy13O+iWLNaLNvOJW2jLhyXs0g4Sg4plfL5+CuxbiR1hwMlFxgMaQRBzTZ
         m7VEmsyGKW+qYHzK96FnuXsV0kZdefPc61OP+mB5/eMD3MkfRxqMZUPWdjqZ04sTC7T5
         6k2tAi4fg3U0ssn87ZJqT2+3PdQXibsYnGPmGGk9+fp5feSzqNSr5XqxLF0sNR/4SV8B
         aH/+c/0L+xsNWFGHF0SgSRPoBzXsV3KMpsfRojSwfKvfIx/zblJ5XURXtH9qBS86K/HT
         nFSAdavApcOVOyZolXRc/2sWcxymt0ItoZfP9tt6FBxFbt6ZQDlg/V4qdlO+jyyHRoHH
         655g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        fh=zeoaxExIf8oK5IupXTUJuTIAnL8GRjxIy6+3cVOgeCU=;
        b=M4DbuSl5DB1SVm0t6g6uAcEX5AGiL/csfJMuQIEbPXQXwUhgpjvand6WXKWVP/Z+Ex
         +VgjWJVWQYXlQZ3jnXSOSV4uOAGtWHZEuJRpVjRFDvsbgDuMF1Oum75oDIHHLJHD0ha9
         xh2M7xVW/fQOhaRBNgwOVUsgd3zhYvkRKcIHjT5syJgXlenO182pXDG1osZJQ+BdU/2d
         Jk5snumQQbooqIHC2sbZ6vJ50yWS6PBAfOkWjs6WYLYOEN/Ef/SE192u1s3Tb2lfGzxo
         MIFG/LP5lPyII1Uw5PSA5ZwtB6QLyrMBmkDgFDbcLvS1sMgWrTZokHAX411CxPVCYCzC
         wRRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792775429; x=1793380229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        b=gPjmpRsZXPFANVVc9LHFlbKjrDCznsGMpsXYE+IZ1oJaItMDkTdO5kBse5bKfUN12J
         sDZPCqptS9QN3f7VFBfjPyeMIBNixKl6EwGEgNSXSH8xvYJ6x8pjf86QnUHjvzcBkkq2
         yBwMYi/Ti4fgpSKzn8YNOrRT8lPNde2MUJMdO7q3NgZNgIBdWRsUwnfSyQ5r/2+xHKDg
         R83UzejZhRIZVR0GrKlO8Oru9CO+AOkLqdRTspItGc+wrZEhmb2WWu0tN4OcOTW3R4kn
         QIF0gIcFAZ03Jm+wGmgDGvZWA0Q3+SoyP2AReCI/jsPhaWcLLRgUBaL8h27D/0u99/E8
         7T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775429; x=1793380229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj8A3rSmJmNvzPlzPefmcAJjoKNzu926Z64+RZduhAM=;
        b=C7HRyW2ivZfURsb1dNmllEt2hsaXuEfe8bzSbdkxZ4ZmaB5OtUlQyypVNiyhp+N1BL
         VQhoKvRtnB2WM5aDDpuUcIp6PdurnCfdQ8tB1J5Zc+gjB5cOWtvhDfWzbHgblV5F1y/G
         IML96FC/fGJHFEp/JUa7Koh0zGMKpbSkf1mrs0CMpK7ICqvzVJ72e5FlxvEKb5NvZnrf
         p1LjUiMqVX9B5px6h9r2ogxR+XfDXr1442BdjRyUUSE260wR2y/cPSO5y5MiAlBIrLWY
         4Y6kcFzbQ0As+k61e9hdxlkNr4h2R9TRxMBZKolYAORASkcifWvPszTvPK7FpyiJyfsE
         TS3g==
X-Forwarded-Encrypted: i=1; AKwUvBxnA0JO3hvszbRELH6H5QI6cPM9SqfYA3x830WR1CdU88unB+d/xL4iYACnEQfGkyLpgSUenUBNKMpDmJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKFC/BIjz7682XcCYv9GD69XITVdYWmGok7esPf5iVZV/nTzNm
	tu3bPVlz/APCum0PfqQdN8B1E4CS4Ia9v5bu4+gglJgyq+z+d2ZBCSW0rfgtI53R7HEd3dUH+DU
	z62driygyb37c9ngOdy+CwY6zscUNzKM=
X-Gm-Gg: AYBFou36UZF7ZN98zHLyyg6T74tVqIraA0y/9J6ReIO+JkLGejlwnf05FDugjv+Cy01
	8+unkeYsUnokOC4bWFUgUOJyUbYLSvEfwaVJ05p9EiC8wGMbBvjuuz63kZnqCaKJgK/k2+f1DKZ
	bxCbvEd2VsMbkPz2RNesXF0ckAR9RXblthJoNMZIBcLlS+DdVINc1+j1Fkh76VLqLzXsuu4iZKJ
	v8eRv3c5CYMvGlAW67BXsZ/ruUfsKS1XygC43UXNVdeNyY+hIjPbPxsb4tutzfohg1Lwa+E6iWV
	VCkmU2lcwCvAA4XXR/pcMWeE8PZM9k04jlya70gn44elXPLUeUNJQj4AkR9uSgSUWyHJjVVAFtu
	PWAu04pAafrLCgPWAfuk+1xWs1UX80kz4Y2xBjCI/kJFdH0DB2CcWkF86j2ZJulXABu7dk/DqmS
	tA7YTgwQjX1jmeIewJwZqhRLmMA68asgUrV9EcbJsMAqc0uw==
X-Received: by 2002:a2e:bc03:0:b0:3a9:d407:41f6 with SMTP id
 38308e7fff4ca-3ac6637e917mr7554071fa.26.1792775428982; Fri, 23 Oct 2026
 10:10:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tegra-drm-yvu420-v3-0-7f19a834ba98@gmail.com>
 <20261020-tegra-drm-yvu420-v3-2-7f19a834ba98@gmail.com> <T1504rPqStSSyO9jl0by8w@nvidia.com>
In-Reply-To: <T1504rPqStSSyO9jl0by8w@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 23 Oct 2026 12:10:16 -0500
X-Gm-Features: AclHuK_EWEzi1LRHTLo8d432RWvCE3Or3aR7BVm1bRRWxd52gg2ACpR1Zr921BI
Message-ID: <CALHNRZ8TeQ-MdnDrtDG1b0s3phrO2gega_Kj5bCxFL75o4rTrg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/tegra: Support YVU formats
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:10=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, October 20, 2026 5:10=E2=80=AFPM Aaron Kling via B4 Relay wro=
te:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > YVU420 is used by AOSP for video playback among other things. YVU422 an=
d
> > YVU444 can be trivially supported in the same manner, so add them as
> > well.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c    |  7 +++++++
> >  drivers/gpu/drm/tegra/hub.c   |  2 ++
> >  drivers/gpu/drm/tegra/plane.c | 24 ++++++++++++++++++++++++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 39c2e920d76a6..be913f2609077 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1282,6 +1282,8 @@ static const u32 tegra20_overlay_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >  };
> >
> >  static const u32 tegra114_overlay_formats[] =3D {
> > @@ -1309,6 +1311,8 @@ static const u32 tegra114_overlay_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >       /* semi-planar formats */
> >       DRM_FORMAT_NV12,
> >       DRM_FORMAT_NV21,
> > @@ -1349,6 +1353,9 @@ static const u32 tegra124_overlay_formats[] =3D {
> >       DRM_FORMAT_YUV420, /* YU12 */
> >       DRM_FORMAT_YUV422, /* YU16 */
> >       DRM_FORMAT_YUV444, /* YU24 */
> > +     DRM_FORMAT_YVU420, /* YV12 */
> > +     DRM_FORMAT_YVU422, /* YV16 */
> > +     DRM_FORMAT_YVU444, /* YV24 */
> >       /* semi-planar formats */
> >       DRM_FORMAT_NV12,
> >       DRM_FORMAT_NV21,
> > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > index 5a86f8260f136..ac4542e54d7dd 100644
> > --- a/drivers/gpu/drm/tegra/hub.c
> > +++ b/drivers/gpu/drm/tegra/hub.c
> > @@ -51,6 +51,8 @@ static const u32 tegra_shared_plane_formats[] =3D {
> >       DRM_FORMAT_YUYV,
> >       DRM_FORMAT_YUV420,
> >       DRM_FORMAT_YUV422,
> > +     DRM_FORMAT_YVU420,
> > +     DRM_FORMAT_YVU422,
> >  };
>
> Well, I just tested this and it looks like the nvdisplay/hub.c based
> display controllers don't support planar YUV422. So that's an existing
> bug in the driver but I think anyway we shouldn't advertise YVU422.. :)
>
> Could you respin one more time and drop YVU422 from hub.c? You can add a
> patch to drop YUV422 as well or I can follow up with one, either way is
> fine by me.

I can send a new revision, sure. Dropping yuv422 from nvdisplay seems
out of scope of the series, though. I'd think it would make more sense
to make that standalone with a fixes tag so it can move more quickly.

Aaron

> Thanks
> Mikko
>
> >
> >  static const u64 tegra_shared_plane_modifiers[] =3D {
> > diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plan=
e.c
> > index 757bc552809fe..79ef5fc1b3678 100644
> > --- a/drivers/gpu/drm/tegra/plane.c
> > +++ b/drivers/gpu/drm/tegra/plane.c
> > @@ -433,14 +433,38 @@ int tegra_plane_format(u32 fourcc, u32 *format, u=
32 *swap, bool *swap_uv)
> >               *format =3D WIN_COLOR_DEPTH_YCbCr420P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU420:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr420P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_YUV422:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr422P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU422:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr422P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_YUV444:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr444P;
> >               break;
> >
> > +     case DRM_FORMAT_YVU444:
> > +             if (!swap_uv)
> > +                     return -EINVAL;
> > +
> > +             *format =3D WIN_COLOR_DEPTH_YCbCr444P;
> > +             *swap_uv =3D true;
> > +             break;
> > +
> >       case DRM_FORMAT_NV12:
> >               *format =3D WIN_COLOR_DEPTH_YCbCr420SP;
> >               break;
> >
> > --
> > 2.54.0
> >
> >
> >
>
>
>
>
