Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602659;
	b=EYI0b7EKnyjICB0K2yoKKgJBzpZgS7g1aBHdCBcF99lxjwZQmzxrDQ+Zb8YkgG1BiSRd
	 uKn45CBlypMVn03p/jipsTdz5Nhh1dIZd/GifJx4/54h+yBLgYXKMaHeJhLp8eTms8mCT
	 4RldjJGmGK9yHwckhZMDxq2L2sZG8KGmkZnvuQItOfZC3s47EerujZb71+ST8h3eQxkJ/
	 Y1bmZuBxZH4BhkGXTrbj/HziWYAhEzi600k/ABYCc4aVvAkwjpvPPtVKaXVUYPKwAhPog
	 r7VesUNiSIyKnAFXzU/66GtjlsxlvDXLZaBlx++mw5DOERBm9vBM+yLaAi0MG9Eez+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+uv+L7OAudjAmToaLXTh5oGW0PlHMIwK3Z4W9S5viPY=;
	b=POcpYKaFdJOXdkC7rs9MGVAmv9Ijacd55DnRTdYpXxDK8Mb18QWyV9G+j96fni36BgDB
	 84dcLOVvoaQ1Ij4/OGbzj8yyJk9MuhcCjd3g9NJ69JtZnKNVdQBrNNDw3kFNadd0Jg3z2
	 fI4y8PdFbBJnqEg7gzMxDidxmigjoo5TRFmEN/px2TKigtM/LXv+hjslR8RHGBXULMbwP
	 JXbhfnAGL+s58w0tSvuPPf8g58sZARSlfHm1DyZ992hxbTtXUeBWkJKpdA+oTjHL3JLHE
	 ZFOVS4cTzeThjVBOCcubWKjp+mIECY3wGVTJwjmPctYO0FjfvtJ/QjaNnD9ZsAt5UiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZNhYjjk;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8729606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8729606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZNhYjjk
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso358198166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794602657; x=1795207457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uv+L7OAudjAmToaLXTh5oGW0PlHMIwK3Z4W9S5viPY=;
        b=jZNhYjjkjfdZYnCu4G9uc/1vAQfRKhdK8wrMMCiHVk0UeD2bqkAXh1fQzicGRvvsl+
         Y4Pul0kohzZGWDJx1xraVCSk52D1Y/kTiA69+HYuIIuSbQcFSMB3qhFdb2Hxulnte9/J
         CzrpqAB08sn/A7LC/u3ALBOeISwyoBLAa9HDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602657; x=1795207457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uv+L7OAudjAmToaLXTh5oGW0PlHMIwK3Z4W9S5viPY=;
        b=lAJdltw7C8SxZ4oCPBdgX4XV6K4cBlvmKb7vGpO3S6MP1mC0TqCYFrBteK4XtwzwV/
         tbfqobKfZpEjEt3r4uHwF8J+e1ZSHysWVinNlPA6eaXinBX1gdpzj56rethKBxUp1v+8
         v/mN1yA0R18LGd42WJRiU8jbUCL1BdGsu3qbIMyKaGyYNzR4MGLz7jtqcVVkh1g6kzXo
         Jow3JfHEZu4sGYkebQPIegAuUv0GMHa6WVL8yg+lX6gVDXiI6cDQnJTCL7Nk8Gp6tghF
         rts/qRbUuoCXgd18BRMEsGff2jTbss3ilRU1ekZKm/z6+Gegum4RMSPFFb3ou9egjP7r
         kdFA==
X-Forwarded-Encrypted: i=1; AL+hErF75h7FEQJfj/3kepCDoWI8jnCWrdrbwLDGzy9Fky3pJawsFyD6aeFdmsSrJduMTbkztrx01nLO0UpKwkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xoPRgcL0NyRVG34WAUiOq7NQg1jvGM0tRuubKExYDHkAcYd4J
	6um6vz4evPQCTF1x+bI2zzsXoc4dfVKjg2T9485+m8wXJFjfjsBB5QCTaDmZi/QZwCPw2JUfEcA
	w8F1+TmnK
X-Gm-Gg: AYBFou1GvWn4wJZlOfSzbk5HfxDfPregcmSfnR/J5wsK2veJd8V+ZVQj5yLDMx2m0kS
	+PPNo9wALsnAo+VknpOLkyrABWS+DJSosXqb2RpCguM6jf2jStDJOXIkeQUSeqxjJshttRJdzge
	rOlaSu+/7ZXt4sd6SedkLu49SN9i5QMEhnN9dg60g00UfpqcqBVYnvijOLCJAp0CLdjw5e7ofLS
	klmVTqARmGXldlxvw35dfp9iI+xoUNTDdJ2iVuBN7EYo02RYi03ai1XHe2IXWlBOzsEfJVgeIYB
	95CGYYQN8Cy6+OC/FwNpgF6KgeNs9rxBqAl9X+GR24cu8NbQAjggxQwJz22yTwX5Pv+4GFgcEzS
	n8a/rLsvbnb/+CRZ93yqYB2x6BXL+Sfyu/UCXkO28DI7dGxLvjPtuvX2Zqv8JVJWj+3CYJB28mn
	ZDpaFMrg1BJOhuOehqunVdAHVLyMIZx0ODSy7URzV7rpGBN5nzAmb+jXfKo8g14uynWrQ/jXcD1
	HCZo5m+F9Ed22xihrezH9V8SPVKVJ6ND0lDc455imWNONM1sGQIOI3Mz+Vni0WfBcZiqczkJ9DI
	OcFxgkfX6z9FpRZnI4sVjvDsDqdaUpMWzp2GXwHHIOET7FbpYWEOzdthx116L5Kci0st
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr313266266b.17.1794602657238;
        Fri, 13 Nov 2026 12:44:17 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c35easm1382390a12.14.2026.11.13.12.44.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:44:15 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4922dbcee23so661529f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:44:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzE+ZIkp68bqbdyhFhNEXXY4istQfubQavRlRvDm1zG632W5BhlunK7vvOuYwjFOytkrNzovPLTw5uJo0=@vger.kernel.org
X-Received: by 2002:a05:6000:288c:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-49d1ce31d46mr5760381f8f.21.1794602654360; Fri, 13 Nov 2026
 12:44:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110092112.4262-1-architmore303@gmail.com>
In-Reply-To: <20261110092112.4262-1-architmore303@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:44:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XawknyTLYf03ZqZc60BDsNEDxAstnkV4QgYCeK18jDhA@mail.gmail.com>
X-Gm-Features: AclHuK9JxAszYSinmvA_zJ13Hp-Zoq-_E998DOGudeZBRwUONg1E-ifiWCpJu88
Message-ID: <CAD=FV=XawknyTLYf03ZqZc60BDsNEDxAstnkV4QgYCeK18jDhA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: kingdisplay-kd097d04: Use
 mipi_dsi_*_multi() functions
To: Archit More <architmore303@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Akash Sukhavasi <akash.sukhavasi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 10, 2026 at 1:21=E2=80=AFAM Archit More <architmore303@gmail.co=
m> wrote:
>
>     The mipi_dsi_dcs_*() and mipi_dsi_generic_write() functions used
>     by this driver are deprecated in favor of their _multi() counterparts=
,
>     as noted in Documentation/gpu/todo.rst.
>
>     Convert disable(), unprepare(), and prepare() to use the _multi() API=
s.
>
> Signed-off-by: Archit More <architmore303@gmail.com>
> ---
>  .../drm/panel/panel-kingdisplay-kd097d04.c    | 50 ++++++-------------
>  1 file changed, 15 insertions(+), 35 deletions(-)

I didn't look at your patch in any detail because it didn't apply to
drm-misc-next and I noticed that it appears to be doing the same thing
as the already landed commit 7877fc6d086f ("drm/panel:
kingdisplay-kd097d04: Use mipi_dsi_*_multi(); fix minor bugs"), AKA:

https://lore.kernel.org/all/20261012-mipi-multi-series-v1-2-6a29add1ec92@gm=
ail.com/

I had some follow-up requests for patches in that series. You can see:

https://lore.kernel.org/all/CAD=3DFV=3DUSBt_pE--C0P1=3DPZt+iaoTpgNebZ+DXP=
=3DdKb-8VUcoVQ@mail.gmail.com/

Maybe you want to take those on?

-Doug
