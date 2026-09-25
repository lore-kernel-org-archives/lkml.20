Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC964D9F9D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352542; cv=none; b=SE3l9jp6fIV/UURmGnYhCcXFawBdaULCUGxIN9XY+Gh7MIWUcbP6Xn0oY8vNhgHL/mKeELk5r0Qq24yKinggL9eystQOiv9uqCQVW1wGxr4BO/qYS7pezK3upUHcmEARMO0qimnNMqCsLN/SB6/Hp55Weu/azNkQQg6TldqRz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352542; c=relaxed/simple;
	bh=6pqGnRaZ+P7rXv9Vn4J+DG7duRZL0nDrzMPegML9o70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7WI3HZz1p6Ioeb9cpGN2txaLBpu43tzU8B/fhrQO3gRJXP7pPZZ9wtDMKKj8TZaLsp9H3nuOwkGGM4T8BWmgIp/zcc9xLcz+HSIwoaaCXF6k2NA3SPPzpLxLTM1cmdNQpdPKSAqiRZG0IDah//9KDy+Cdc1pFTlMKur+bmh4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YvpQ59Sw; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YvpQ59Sw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so1503912a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790352530; x=1790957330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoDkbvYtl5NWQD48z6cPIbsNVAJholwk5esvSBBhG3w=;
        b=YvpQ59SwZCWaTT2v7eOp26enQ+iDA+vlDoYd12OKjV6p1P8rIwEOgL5xcJ2NMTitgq
         qkuuFXbcwASljTdSKFmfGqwYm0UJFUTiTq+gUHt3xEx1q0dUrBuihN1y6Q5W+5fV0HkP
         qTOnYrxiaFPXqkLg8MdjTkJ8YTFmbBZ27bQ8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352530; x=1790957330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoDkbvYtl5NWQD48z6cPIbsNVAJholwk5esvSBBhG3w=;
        b=bHtMUpArr+U/Ef9OmCuJU3VYb7pNpfCfF8b6l9uMoEKY4q3/EoeEFK/m0hL6XttlyL
         o+XuZf9EL6ws51crOIWEm1v8GgImC6x4e2oB6psFZs9iyBQIYOHL5aklBs2LZ+Yoh0c7
         f2+8dytv8HhrjhDBkgewthTwlCkr8mfAngSUyP91PRWSjxuenomJ31qUM3QNw5QoeeLh
         ovcbhX7GXafvrcLaxrIbvWBJFH4OQSMFB5xJaG6FC2SoiPHWPuVLW8//yxoyZ0mFhSM4
         KK5qUwyLFScvAfjPehURcKe94lUAHaNLUE5GA7HaA4X+arngGZK+mS85uDjKo9WwM+UU
         o5zA==
X-Forwarded-Encrypted: i=1; AKwUvBwNSQPwWedEy/DUvbCpxkMMfdQPX3PRRAWaEdpi9Q8Mbv6tJF4KemMTYyQmOk6y9dWeeLFBP0UinWmJt2o=@vger.kernel.org
X-Gm-Message-State: AFuF++ksgt8hIlwR2BWqRshEymQpu3AD3Uu3C2QaBjrsGJjGb3pp0kt8
	KRM6rP1jZUB5FLzRivTgPe8vurOeQfNo2Y4YBMkyyzYgfndKwD8GYRTQKRg/bd8G6PNjz6OqT3b
	Ahv0=
X-Gm-Gg: AYBFou37R74UhRudtwC7DFezGfmfRgLcuic1uHQ918d7AzB0J+s5m2XkUa6AFEke6dL
	BlZrcCRMTCnkUzHZ1zOY0furGevpJVhQv5OSMfhXBUj481ostafRFYaJAjKsq9aAaedPawgmZNv
	6xtVnDLvQFjSoIeQsWNe2u9TBYaX5wEiTWB+cyY+qqmJ6v0VbCQRE+G0wYsAkVP2a4nymhGZkPH
	9QXkzQgQCdACP2/2bB6cry588ALmxWhyP0uirnKB/UmQXnavtHLAP/6w8M6RnJ3FaA+RCXvRoWe
	G2WAY/sZuE9buRa6wGeGQMI5cNkMpLRNFpeMzr3hRpkYnS8PI9pVM5sRA+E9qKafIJl09dizPsM
	Zx8WLoFDo3vAdP7W0ZXoNHns4XMdKl7uMMGCxf91K8vz0nBgfhskuLyasgJcZ1vowJC9q5ls42j
	5v+tAWnMzN6a4RHWD8MjV8Nu8Jj2HD8QUgiooGNbEH7lKio4iGqVJPBlrsrDcG1jXU0EtZ6hazj
	z9czd4EBlgr8gEwZ8t73rV0TKT5xPOMvC9SoFc=
X-Received: by 2002:a05:6402:27d1:b0:6aa:4d8d:a0a8 with SMTP id 4fb4d7f45d1cf-6aac90c277cmr5607080a12.27.1790352529721;
        Fri, 25 Sep 2026 09:08:49 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd7dc5sm1206127a12.21.2026.09.25.09.08.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:08:48 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so10899165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxq1RC+sQGKbRCvi+qugDRW/L+6bWvl9Km79aV42wuvXF+oQp21arQoLrzzN4zlFUHmnqV2hhXS1agwOeE=@vger.kernel.org
X-Received: by 2002:a05:600c:1553:b0:49e:74b6:740f with SMTP id
 5b1f17b1804b1-49fe66f3ca9mr104941595e9.17.1790352527270; Fri, 25 Sep 2026
 09:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925132558.27518-1-okerixx@gmail.com>
In-Reply-To: <20260925132558.27518-1-okerixx@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Sep 2026 09:08:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UohyFHM3r4i6NoDbzVFpY9xZzg_=FvGFhBgScaCUwH2w@mail.gmail.com>
X-Gm-Features: AclHuK8278QfBh3T6IMehOEBNqzClwWRdpWLhQ6oHH2oGgXY2sg0_eqpoHwxnrs
Message-ID: <CAD=FV=UohyFHM3r4i6NoDbzVFpY9xZzg_=FvGFhBgScaCUwH2w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: don't mark the AUX backlight enabled when
 enabling failed
To: Oleg Keri <okerixx@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 25, 2026 at 6:26=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> If drm_edp_backlight_enable() fails, dp_aux_backlight_update_status()
> still marks the backlight as enabled. From then on every brightness
> change only updates the level and the enable is never retried, so the
> panel stays dark until something blanks and unblanks the backlight.
>
> I hit this after resume on a Samsung ATNA OLED panel, where the first
> AUX write can fail while the panel is still waking up.
>
> Return the error instead, so the next update tries to enable again.
>
> Fixes: 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight support")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4634,7 +4634,9 @@ static int dp_aux_backlight_update_status(struct ba=
cklight_device *bd)
>
>         if (!backlight_is_blank(bd)) {
>                 if (!bl->enabled) {
> -                       drm_edp_backlight_enable(bl->aux, &bl->info, brig=
htness);
> +                       ret =3D drm_edp_backlight_enable(bl->aux, &bl->in=
fo, brightness);
> +                       if (ret)
> +                               return ret;
>                         bl->enabled =3D true;
>                         return 0;

The above looks like a good fix. Thanks for catching and sending a patch.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless there is a reason not to, I'll try to apply this to
drm-misc-fixes next week.

That being said, why exactly is the first AUX command failing? That
seems fishy and warrants separate investigation. The panel should be
fully powered up and communicating by the time we get here and I
believe there are already retries in place for the AUX commands.

I'll also note that I considered whether we should also error-check
the drm_edp_backlight_disable(). I think the answer there is "no". In
general errors in "disable" and "free" are hard to handle sensibly,
and hopefully the panel will be powered off shortly after the
backlight goes off anyway.


-Doug
