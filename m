Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794199628;
	b=NkAxVAFQRkKCsh6qVrE2DWLbqGesK50yI5gA9KLRzx5cfPSrmUc4KH4XRO4y7s+uvJlZ
	 JPxJwTRh1YZ4A0SwUB+UxEMepFXxvimJeIFwpUnqMFm7Zi62skfY3awMKsDVcHXwP4Y3J
	 dam10iSsqQ8ZJYlsUj2HlqFpKtLt7zATf02JJ5b0kuuyJf7UcCCkvtmWuS83EmAwT7tPH
	 FsTEcCDs6sjITdE5WflS1UjsxzYr2vYf9FQORb8SBN3G5d61VQ2Ipy2+Ph6ZzYqKUACGN
	 lIRgglMoAIE/L8866xzRJmDdzJWTOyYiTWyKhaygCIMSez+wosXkGGHj2egj4YCAWuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
	b=X2kNQA0PDNrJ4BIokADb4Wm/CRp51xv1+FC7khwoKUZQQS02kbG86/juy/Cx/vOTq8sa
	 bKN48whtRXLkyEHnwTLuD65Qo0bgYbqBohrWyrJKKTO2tjkt6cuwxATK5vVE8Cqqm/cdW
	 F6qx6D55oXgv2cTpSPBFB0xyQnZiDkxNAWN+c39rtp5+tHQTXXR2SiWaWaSaczh8zNYrH
	 oV/7382DkOz/9Sxd5TY03V/A7JjO62ba09Uq8tofIlZh8Y3BhaOpzEvL62Q3DKo/0hZa9
	 fUQmfLf0hJEEvRN5It7Qcz1yyAz4BjgxqXMRHbLmCsM9AuPojuznJEhLzf3Xz2K41oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IohIZ1oA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739A2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IohIZ1oA
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so67732566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199626; cv=none;
        d=google.com; s=arc-20260327;
        b=cM4kVMF7AXlEcshzNcjB17QCs4dklBHGi641OhCR4p56hDAUnl9n38tjUtNVb3Ce0I
         3X7KPvDVcMkeXNQ8ldm2uneeNEBsQFX3EgBNguZFmcRFNoZVWChhyoc9JgV9IQde3duB
         0Hr3su/OIB9jO/XIp0EGseCSZunAvIhKWMGmPjN8aBeLJNkgvVvCSQnDhUaUKJv5Couv
         ADi7R0ENHzYFvSwdf+WfKH6lGwBEkdyacTJOwvcpJ2vBjY+uy84Is0bsvcB+bv4pUSEg
         PnSZOzXQDcobmpu0fGKCr+PhxypjegPYDiWnyrzAbuV0+iH6Hq1P6kbSioFAJK6IGx9Y
         OeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        fh=1HwToQXGLQwF8QHP3/pzEOy/zDgFn5zd0F+Xd73q+yI=;
        b=q+x/wiGvxPyiKm32TLRtSuAOXKirJLpA4PI5pKo5ozubv/g3c084Wu1xFqycGf1G/B
         mYVy+3Yz4Z7MFVQiiJj/QoyuZYrdFRZzYBw+Dwm4XYoQXAH/aAeQYfCWqZps0lmBCOkw
         39+nOsa8nCr+/Vi286SihOrl9lttOk1B+Se1t08VOeqy34OnBMcUzV7S1dQOxp+cUH9L
         RXN5S72+0At6DZrEZuRxZr4EL3Vd6wPnE+aSDbX/SdxiaJZ59I68xy1riWsL5Xgt6kH0
         anvtWK/CLlKIudB2BKQgvRJogUmqLqdBdNmW/9i0V2XEmiFcuscbCYWNtC/zG0bhOSVX
         DQOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199626; x=1794804426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        b=IohIZ1oAwy8qOm0JxhUCeKZegb1kHdjo/t+cANf/7fLgydjScBayHwnnUgDHSaLttm
         ple64bi6DGayMz1A8qOjG5ZT5ElqNiHTJPRimMGyBfL69snqjvHBAvjMcF+lmwevaDEM
         mfjTVEkJpfFs+Agk8+p1UQhV0hfmFZjhKNmvNxosswdeVzQ5K7RMDrx02PeVM+Bw9cqT
         BXCwAxVD7IJ5X5rr4/Ca8rNUADx2YwiN9y1Cecgk1c/PGIQKIU562xEeOKEdwq9PUBLF
         6+cXV5ozk8gOVkPd5awDEtgCxpqZmhiu8GZE5szOcK7w0G4MHzx9ZsMlQadyurlDscTl
         TJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199626; x=1794804426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrfIutPa9zzmKoZjuVxyntYvgSPp8Myo4B82If1gVcQ=;
        b=HvwhQBvpUGiFNxQXhfxex+bCdBVhcsJbXiDQnjho5MuhRQ3aRxJ143YgOLcadouWdi
         rZY3UOYzBfhYfSm1b4cIb4OPEkf/K9H1M0VTNJEPZbaoKYc2vWB5djknm0fyEyfBLV8l
         JultwwvSp/zfy8yf6GRoO4Dz5YDIm67mbQI2UV0NjITYxwaAcFcFjkq3qPv80zWHGW2c
         ZD9E6NdDxJC9NOpOeAeBqaiSsKXcdDq7r4Lkk3qCuIG3HT2c0SylTIxPneEvZPQyFQPC
         roofS/M1Eg1PL5HR0TzVLX4zI4qsWeQuYIQnJX4C2yriBJ8/d8vHCBxYgn2AKsMKT4DR
         zeqA==
X-Forwarded-Encrypted: i=1; AL+hErGEAXJ+lVQ6ojHETb5IM6f/WoKkRbuNnm5t4Abjmvmmpud0LyPWjwEEZerXFAXwO3Cky87L/OVbvE2oVb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JUJSxvX4pREEMrjq8Pf9xoYbWEhhVLm1ideNNB2jT78tVoRdx
	Ke/FzDMFYJC1yeQovj9TWlqA2bpBiqOT2OE9J1vte1fQ6y4mUrT40RCuieY5ge4MSWVz0s4ys39
	hgnI6SxmyKOSW59xr2l5ndNDI94PRsoo=
X-Gm-Gg: AYBFou13KlZEIY25+h80lAsM6AGA5kXS8dIdCrhJTiolBlWgDf0TIsKd0I+0OiQcsJK
	F/Tptktqe5mRHxBSmyg5jsXvhDE05WppN4GvuCd5hyYyWepeK9brbluxc56JPpHM+sXnDbvH5eR
	6znbvyydsnACFMm7WdxvNmJ0WOxxtArH6MvrD6YglkgebVRuoNdp8RqWBN0gfTRKoDFI0wipIG5
	gMnzrF3J53F+K9O9GhcUkorkW5hJPk+tgbbkyWG2mndYc8rSyYjiyJJC1GQVkjRpFYVn25uU0UB
	hxSCs2gcTY+sGsRfwiKsobkTh3ekebCertJ9y656iRYG92kvqOHK4Sw3yZkn9APCRtMs+p+hFL1
	yonEyjoMfHm1NNYHylOMVy3LaTCjvE46beiujcgcNTfKSnfWhaHYmV8q2ufrN+WGkGfI=
X-Received: by 2002:a17:907:3d91:b0:c3f:d8f2:f08e with SMTP id
 a640c23a62f3a-c4d6db3a64emr196944966b.44.1794199625715; Sun, 08 Nov 2026
 20:47:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012064334.3193085-1-thnkslprpt@gmail.com>
In-Reply-To: <20261012064334.3193085-1-thnkslprpt@gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:46:28 +0900
X-Gm-Features: AclHuK-TjmziQBVGGqzRv77wQmyocEKBYuMMJR_pnwJjtYpt4X-8bxATAwTIBkE
Message-ID: <CAAQKjZMYrG6C5KWkbqcZX9Jdu0TVVimRksV7xNe=G=653S5PsA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: free EDID on connector update failure
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 3:44, =
Avi Weiss <thnkslprpt@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> If drm_edid_connector_update() fails, hdmi_get_modes() returns
> without freeing the EDID allocated by drm_edid_read_ddc(). It's
> an unlikely error path but nevertheless possible and should be
> cleaned up fully.
>
> Free the EDID before returning, while keeping the existing return
> value of 0.

Merged.

Thanks,
Inki Dae

>
> Fixes: f6e4f57fd90dc ("drm/exynos: hdmi: convert to struct drm_edid")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index d4fce39c2b61..386557a7f5e8 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -893,8 +893,10 @@ static int hdmi_get_modes(struct drm_connector *conn=
ector)
>         drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);
>
>         ret =3D drm_edid_connector_update(connector, drm_edid);
> -       if (ret)
> +       if (ret) {
> +               drm_edid_free(drm_edid);
>                 return 0;
> +       }
>
>         cec_notifier_set_phys_addr(hdata->notifier, info->source_physical=
_address);
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --
> 2.43.0
>
>
