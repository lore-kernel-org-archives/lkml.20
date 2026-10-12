Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432D49D5A3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818795; cv=none; b=KGO8zeHS/JYkWumcxgx1MT46sgr7OdBIsdgMhtfHfrFCyBm8WrRsr2S8eUa60lQ8uenR40zUgBB5Nn+TmGy45VIOc5cudDWJR3NWHFLMsqwrw4odhL9F5M0RL8HMa6WqI06+J7ApuDegEKrVAhtW1kIkX7temFLJgSHx+upD+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818795; c=relaxed/simple;
	bh=hYDFT734qZnpS535ADRerpMmaNaNQCjAV4kE7QhVIHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIguvKT2Oc5N40cbh0QUub9vaa/hjBsWAJPnRQxJDJmZzv3X0ckCnKMCrNIq8nNR7pudKKKrsVjWqhzFTZdsRYjqXHZAwxu2Kqhn8AQs+T/Smruu+yMSkKBmB3RYhjfU0AFMa7xcs9OlN1NSMwsNzSQW8ej55gQYxQjMqV+//G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C0aRXjSX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C0aRXjSX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so1900097a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791818791; x=1792423591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RvHQEIGxpaUf21Ijq4HTy/LleTd6G7LJ99iq4zk8rXk=;
        b=C0aRXjSXZ+adypoh6zExcleanksiJMonmVD1RwyWDNqvd/yHBAMRg6NAltW8uqoo7D
         mrM2FQ5bSgVjCXDOkj74nXXHG8dPw2UFBWGvZVMjCkloePncfxLtEggJRwK7/A65RldJ
         WlH+KLL5Nx36VapGdIDhTuneQDq5fMoap1VJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818791; x=1792423591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvHQEIGxpaUf21Ijq4HTy/LleTd6G7LJ99iq4zk8rXk=;
        b=y+3LW3SfWTw7jWbAGyw/x+rGefbYGNoq3vtYbY/OLdKl6Mzs1DKLQMs4lm9FQbHYjn
         PchmEeiK5/vr72vrjZ9ebskcUQpi293uvr6vRz1AjB65KgPS6dsj4tfx0e8h3J0fcGDb
         qp223jujH/OhrYznUmoYL1ck4w3/wTPBt1t6cfJJyFKVxzWA306fh20veSTt/IwnXgYb
         lSBgZQ9TkqYmZIa76Cj+AC8hmjJ2iyKFHYK9XrCRF+uqooj4z7JfoBTLSV8sK1FarypP
         1ZhCnZvNOQg+ASypmnTBa8ARel9ES0RxFFHdZ6SrKIEiqTjhd9og7DNRRfP7Lspnd/ST
         vuDg==
X-Forwarded-Encrypted: i=1; AKwUvBxJzE+ztmwpmAvpb3z+ON0+t3pDwJiiuC+Ls6gt0GvMaZg8e9kJDVw3b6e4rrrec1lMamirauw3D0fQunQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGJ94miFXYPtsUK5n7/7gub0b4xtJWdW0puyAiwvb63poK4IzG
	cluqg1IG6GO35wYmQI9mkXkbKGfGyspf2dkKF1PRTbp8sz7uNzf6v+z2UtCnRLg7bfOCQhtS3uJ
	+qOeR5g==
X-Gm-Gg: AYBFou117PcMMWr3OPUvROkVxvJVXMnqoI2iq3xlsm4vJKHuPVcSr14D+FMOAav9Gvb
	1w3dhOIOiKe7gAgD9pgqs6xGzJM89+RC0guKsFeS+VaeaMqOf7d1aT+YGItn0JvCdbf8ADSG2E9
	EpBCUOysGwbLaZgAWR4DAOmGhYpndPMxfU6PIv0ddeIsrxdgs+L7TRSpQiqpDXowJ3zZRKJUHU9
	6c0SAmI38yjFId7x42OHJSGtvx7/KPVmNw53480rK7GLnSRqiql0KGqynKNRRx4BmdU39Xwg56G
	lxEKCUBNVagTbrlAvB+TSo2+D9QVSO04Zwj5yjrD0qTEqnqYw2hAI/OTXWAYxEgDVQDv/NyzWds
	9fqW1xdtNR5ArJfOZXHnwI6Dy0NV0E/miMGst4m+eYnzphJTcG9JtTcS4GqZ2YjSsDjlqUEmthB
	ogRHeVSOvmU/0GM/ZvbSgIGEq0yMKEL18TX9oJLreRRjEmnUaNAcsmoVR+4MPtHwELxi9JYtyoO
	nut+06Ct+gp+nuqYss9ktiUTMqWfPeeg524ig==
X-Received: by 2002:a05:6402:11cc:b0:6a9:a6fa:8b7e with SMTP id 4fb4d7f45d1cf-6b17c28f2f6mr8251678a12.18.1791818791486;
        Mon, 12 Oct 2026 08:26:31 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm5084706a12.18.2026.10.12.08.26.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:28 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so13892965e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8J6JnLC1OVPsG2Io0yRu7Z4GDQPHR7BlEFWnqQSrQKcbdgzCuyiAOOYrJfcB4Q89RAPyx6MkMTw80uew=@vger.kernel.org
X-Received: by 2002:a05:600c:3b08:b0:4a0:da23:e06d with SMTP id
 5b1f17b1804b1-4a18e4a380bmr192954375e9.10.1791818785340; Mon, 12 Oct 2026
 08:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011164417.151770-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261011164417.151770-1-jerrysteve1101@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Oct 2026 08:26:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZs9bZciynpey2O6Yy5DQJqeq9Rgz_Ks6dgsBhVUkenA@mail.gmail.com>
X-Gm-Features: AclHuK9bI6P913aL5-rnPTBteKvsbpWcqqRccf9MDbM65_2lAJpzo-yFPxnN8ew
Message-ID: <CAD=FV=VZs9bZciynpey2O6Yy5DQJqeq9Rgz_Ks6dgsBhVUkenA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140FHD-N43 panel
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 11, 2026 at 9:44=E2=80=AFAM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> Add the BOE NV140FHD-N43 14.0" 1920x1080 eDP panel found in the
> Sunniwell Z96A.
>
> raw EDID:
>
> 00 ff ff ff ff ff ff 00 09 e5 f4 03 00 00 00 00
> 13 1c 01 04 a5 1f 11 78 02 3f 62 94 5e 56 94 28
> 21 4f 58 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 c8 36 80 cc 70 38 14 40 30 20
> 36 00 35 ae 10 00 00 1a 86 24 80 cc 70 38 14 40
> 64 64 44 05 35 ad 10 00 00 1a 00 00 00 fe 00 53
> 54 41 52 52 59 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 46 48 44 2d 4e 34 33 0a 00 97
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index ac815729aa83..ba981581f3b4 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1972,6 +1972,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
>
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x03f4, &delay_200_500_e50, "NV140=
FHD-N43"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unkn=
own"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116=
WHM-N11"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2e200=
, "NT116WHM-N21 V4.1"),

Things look pretty reasonable, but before landing I'd love a little
more background about this panel and where your timings come from. Do
you actually have a datasheet here, or are the timings a guess based
on nearby panels? This panel is also curious in a few other ways:

1. ID (0x03f4) is much lower than other panels.

2. The EDID contains the string "STARRY", which is weird for a BOE panel.

None of that is necessarily blocking, but I wanted to get a little
more info. Thanks!

-Doug
