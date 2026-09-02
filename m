Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0756332628
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371577; cv=none; b=r7kEnpxFC5Ptf+uwsl1n59o6f5AZEZ4WXJz+daIBp9Xvp2R4xVRIT+pFj4Hhp/oeKlCKcNq+U9HECp0/Xl3Dgj/EFpFxQhKmK6uV2gl90uA4FrNqArp+cqQBEcQChi1rR2hWLhQDyZ5CAKeZ7CdZ4lwURSULXd2F2fnuVeTgLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371577; c=relaxed/simple;
	bh=Op3pEBC74wC9sWP9+NxhIXNFQ44q9dB5/PdUhfkeL0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYqyqQkUvmSWfkXL5cuLdzHKgG41eLucNeA93XypUFjWZBtr06lXSPY36/i1tJucqIJxQdup1EGxgvEoRnRLdDaztawIdHFhflOrqau0Tl4aRyDwoU0lRQaR5XcGeLDpS7GuoSoskd8YXNJpGTe5h3OL9oBNf8YJip+0ulcINSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lo2lBxwh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lo2lBxwh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2531f453eeso194142666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788371574; x=1788976374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqcEgnSp496NGWBXKeWsq6JvKnN2nbWQ3UmoRMRb+5w=;
        b=Lo2lBxwhPKjouN9heyah2Je19T+aaDpt0W5KXI7E0ZrdMVsqI5OMUpjTP2EcCmKnOP
         DlfLhvVRqQ3mKUQrk+bPuQcb6u+CcBv40GS+bidBCRc4HP8CEXVaXV0Bzw2pGb+SuxTp
         jaobuYvokdyx+VlRmD5MK46H3gAfJpiGcfg8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371574; x=1788976374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqcEgnSp496NGWBXKeWsq6JvKnN2nbWQ3UmoRMRb+5w=;
        b=SBazoLfNYyWEC79JH8qGSGhWDxKCuUHxFBSV8zWTQtMFN1nGNEyFfSaCyKKjsFnk3I
         PPz+k0kxmSDAEzdax4XGWzXdKQcYzIql0htJ3EvY6O856NJXtkcqbqfnKIka1uJ8Q4uU
         mehSss6hAwS0Pykj/QhStl+xkXfTHetPZALSVfvSZ4q+8hv2+d+SbK+69VvVB40BEuQ5
         gxo1OJZmy1NTicxWMoha7IvvFBUj9V6fct1lfl3Pq4uY26fbyHcERlR6A8Sj7ZKrUUCB
         Nn+6UeSVrFgqlKej0m2Q6suq4D/KmK/5hYXnlLGUgHNaOuA6MbRrsiK5m8gtMtZMEQdG
         d0Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwkD3h4UiFavLyz/YLNklVF9yyn0dqyggOOvJdND0FiafJiydVKDcZBU6ifQMp+gAdl7cJtdyfVCROP+Dc=@vger.kernel.org
X-Gm-Message-State: AFuF++kLy6iyGFQSqK2NUC+HC+WSt5aXieNZeRN3hgai2g5GZpszNgRD
	2oXYZ8s/3psxt0AuPZjFMiFKT5P2qaJSqu6G0h5+zXmOn8wTUO6H+k8F+TO5a2wCsN/xIK1I/Fe
	ilVDb6w==
X-Gm-Gg: AYBFou2ruOnBH1tS5uYTUGtEZ6LM/vfHFuQD7lZXNdlp47XmOxOmMwBHN66S/RzKFK0
	viNWgYaLLc+RnzXxQsRQe2LHf3GRa+bVGVlQwjqcPdJj7VnuFwc5S282d4Hp5sI05oyI1IMxVtm
	gbTXYsC2QkqU9hQMFX2yn93p8e93jYfn9cNFs+zzdB9HGO1sBSfVKlkr9EwFiuL/f1gMgAe/+th
	ST5No/DeoWucAKadoZBZorORjJEL8PTizedjy/OWFtiN70lI98jYvXFgVs2ANrwBsc/VSE77IJs
	TOb78dVBkCJqx4D7Vv6MPApyUcg98U2S7QW6WTjDJ8whvAvxHXTbqKbo6ky6EURpIJ6oBaagNA9
	c7zSxnefCD0JfeHmDXMMu6LI0rrKpspdZnhH/vnrqlc5QbzqUwoMC9btz8+l5GUvnGhqK3id8nn
	TWMMG+gRAvCEFXFvcKl81By/Mhp8LdYpqLg5ub/BoycDm0kmfOJE5gxqBBjcbprqwej8vijxqc6
	UJd8TOJhdD1mxNQSBPYOHqHoSU=
X-Received: by 2002:a17:907:1c92:b0:c20:23f8:99a5 with SMTP id a640c23a62f3a-c25d54b7f64mr418667766b.15.1788371573576;
        Wed, 02 Sep 2026 10:52:53 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039c9fasm168355266b.31.2026.09.02.10.52.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 10:52:51 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso9826325e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:52:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwP2O+4QS/QYY7w2nFyietwNRTt6/9/j4A4sBrV7IBFs/RQo9QQCbbN2A/0usZfvrO1+pp8x/zy6AccEl4=@vger.kernel.org
X-Received: by 2002:a05:600c:1987:b0:49b:4d64:bbc4 with SMTP id
 5b1f17b1804b1-49ce58211demr106617935e9.8.1788371569940; Wed, 02 Sep 2026
 10:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-edp-id-boe-v1-1-f5e2c44255f7@oss.qualcomm.com>
In-Reply-To: <20260901-edp-id-boe-v1-1-f5e2c44255f7@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Sep 2026 10:52:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXC4VyCdohiRVj52bavaQtesW13uyyXj-Li-ij7vo4Vg@mail.gmail.com>
X-Gm-Features: AcwNN1W_4cKZwuAryLEB2kcdCtNaHsnbG0L3B66rdonHzP6OA6JFUqslcE83jio
Message-ID: <CAD=FV=UXC4VyCdohiRVj52bavaQtesW13uyyXj-Li-ij7vo4Vg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add support for BOE panel used in KD116N36-30NB-A001
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 1, 2026 at 2:14=E2=80=AFAM Yongxing Mou
<yongxing.mou@oss.qualcomm.com> wrote:
>
> Add the BOE 0x0b21 panel entry used in the K&D Technology
> KD116N36-30NB-A001 eDP LCM, place the EDID here for subsequent
> reference. Timing values come from the KD116N36-30NB-A001 spec.
>
> 00 ff ff ff ff ff ff 00 09 e5 21 0b 00 00 00 00
> 01 1e 01 04 a5 1a 0e 78 0a 24 10 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 b2 39 80 d4 70 38 4b 40 30 20
> 36 00 04 8c 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 51 56 31 31 36 46 48 42 2d 4e 38 31 0a 00 b3
>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..591e0ed03612 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2060,6 +2060,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0af2, &delay_200_500_e50_p2e80, =
"NE140QDM-NX2"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200=
, "NV140FHM-NZ"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140=
QDM-N6A"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b21, &delay_200_500_e80, "QV116=
FHB-N81"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80_d50, "N=
V122WUM-N41"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV14=
0FHM-T09"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140=
FHM-N47"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add support for BOE panel used in KD116N36-30NB-A001
      commit: e7dee5c0ff819034092befc1cdba2e008a5c5ee3
