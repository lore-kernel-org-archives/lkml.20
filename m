Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA252BE02D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787880; cv=none; b=CL2YZ71KTA3ZVyU84U56llAr1CA+/Ub2xD9Yt8XUcjnrzvgyJA7ZjLIUTvpPvC3LgApJSlQ+TR7AADRSUTkyD9qYZHXt/y+H5sn3XokOuk5ik2PqSRPOFVOdEwT4cm5EGRXL9usTyTFo5r+V+uNhP0kNyT/zrOY1oQ0fBhPLSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787880; c=relaxed/simple;
	bh=+1G/9UQd/LAm1RyVlXgMRXgP/YziR3pn99psmWP6Q84=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fXcBvpPzvvz7+78iJWrQivqUwKXTpt/0Kb9KxbuxxRAphkfV0ucN/vlZx/LLB+qSQ6L2hxL8hBu2ftnIFYiHrTz5Sgme8cngkV6geSq7JjapY6XKLuBOQmFQxwTMUdRebM/obtXcw3sbctlrpbgfsIOYTUUBdto5pBDkQUA4Xq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVz0tRPg; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVz0tRPg"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8e6bdso101915d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787877; x=1789392677; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eWEcZDJ0d/jLVDHWzL+8bGu4JgK8yNHYL2NxU1NtGM8=;
        b=bVz0tRPgHnbrnonexxPkro4qkS1l12JXWzdR4fteGVCpSRv3x0cJUiph0Fhstlg1LX
         5sT0fYzPpyjgrxRDL32lendZn+BqffKVXdAYE6rxTHefKIqN9mlebWqdGF44HNWBB+lI
         56jsG18UJSK1J1xrNM8aEpcwhZDoVhi1JEuMA5M0t8dSWZoMCoFOlytACnrr+nmKmsaq
         Y5cPe1WBkvFrrMBoBxuHaj6+/Xyl6VVXC2TwpMTRNZ0v5dOP2OPzFLcjwk1Sm/DVSvCW
         l2DiWld4V5m6ygxNeJjhZdhFQenBWRPwuHRaGyxX/ho39L+g6iN83xnvb9qZWThlE7yW
         e4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787877; x=1789392677;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWEcZDJ0d/jLVDHWzL+8bGu4JgK8yNHYL2NxU1NtGM8=;
        b=rn82bD/dH+ddEM2upUJytQ2Pf+01+CkZdcVwUo1Th/adzb1ON9ZP43s3czCcDHAgjx
         WWygR5mSy2XV4y0vtEZhQTnCY6rSmZlaC1/tKxRshWunfd9jco8MwpelxsZIbkkyR3bO
         NrfGffnB4Vn/Eyk2AKQ0WaMACnWFg72+AXw4Tq1VR6Wy6ZeJxQtwZca4aXtJRo0OrSM+
         r5eQpLNP17t3Y2ssltEP7mXzUZMwdyo2qodizGtoXiZ6SnCCmNAhEFpHi3dcwT6MAZZL
         hAct1tG0o4d6VuBPxjkTcBzKsDNGsWlvWatFacfErGx+L6lccLsaD+jFCP6AKLPNPG7D
         HRyg==
X-Forwarded-Encrypted: i=1; AKwUvBx5or72rtZBs7xAF+73WmndfRSzofsjIrwWflbX6rfm1GhHINJ7YxcqvTjz5AS/g9TgD4lLfdGv3hA/fp4=@vger.kernel.org
X-Gm-Message-State: AFuF++ldlPEqkdE7dHCtLLInFD4xguMr6SGxFpT9HHR96j08LW99HRxy
	T+vT92BfcNm+odwddP2Fn7RWpSXUuGMlm0KQvIHlayqn7kYYhoU0LZg=
X-Gm-Gg: AYBFou368qxFMj8427OWWePwB+sV1Jy2RL83bKTSPI2WL+bjh30vlymWfUfpGMtgejI
	08aTr72sdWvLkAEfgCRhb1huV52MLT1bg8MwJBeAfra/2M77tCIzVdv5KiIlvUZNlb1uPMFBLv6
	It+9qmUAXjZ5Ll4XHs9+XCyyC6tOBdXv6u8o6GCj7sNFnx4YcoGNavcfMgGKZ4wcseicAUsaB9A
	t7pu/bJXckKIEOOnqQYr1I9B0n90S8CpDOWKVQPLzXG4Vuc9Qcz3W07DB+dMShsBu5y4n9jqJ38
	e2Ls3Qr7cRWqFi5iuZ4hbYNNr4IMVOT2zgGQ52iqBKxr8MxgzLv0frjMvkTDNEl0WAlL8mAZd1S
	NQmAPM0F1WJrVeXGel+ekXE6cOZw5Kg82Lqh9FmRLYzz+NJ4RHh6PafP1rOZLyy/nKqd0O4+Z/5
	drjeVhLKiwZuo+EzrnsYtXmQtgxf43FO5sfNg9aO2gP5xqEqXQHkWE8Zs8PEOiSHsEJVB8yfWlw
	3oaVZPjdJ7S1ehhcH0uKfQ=
X-Received: by 2002:a05:690e:1288:b0:66f:a6e9:764c with SMTP id 956f58d0204a3-670f494fd90mr258149d50.22.1788787876678;
        Mon, 07 Sep 2026 06:31:16 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48b374bsm8237629d50.3.2026.09.07.06.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 10:31:10 -0300
Message-Id: <DL94DN6MH6UD.2XPV905D3FQ5Q@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>
Cc: "Brigham Campbell" <me@brighamcampbell.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/mipi-dsi: docs: Mark mipi_dsi_compression_mode() as
 deprecated
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260702194223.290763-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260702194223.290763-1-nico.antinori.7@gmail.com>

Hello,

On Thu Jul 2, 2026 at 4:42 PM -03, Nicol=C3=A1s Antinori wrote:
> The mipi_dsi_compression_mode() function is a thin wrapper around
> mipi_dsi_compression_mode_ext(), which is already marked as deprecated.
> Additionally, the non-deprecated mipi_dsi_compression_mode_multi()
> alternative exists.
>
> Document this deprecation to encourage developers to use the multi varian=
t.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_ds=
i.c
> index 3ac1dd5ad640..9e20818f2de0 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -699,6 +699,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
>   * Enable or disable Display Stream Compression on the peripheral using =
the
>   * default Picture Parameter Set and VESA DSC 1.1 algorithm.
>   *
> + * This function is deprecated. Use mipi_dsi_compression_mode_multi() in=
stead.
> + *
>   * Return: 0 on success or a negative error code on failure.
>   */
>  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> --
> 2.47.3

Following up on this patch fixing the documentation comment. Just wanted
to check if there are any feedback or updates required on this.

Thanks,
Nicol=C3=A1s
