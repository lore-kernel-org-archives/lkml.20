Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793447755;
	b=btY8kM2dYISmRwIGmZpRUPxPvueZy3UcdAEHeI4uJFuNTBtzmUEkos7+FgtsE5LDuvjd
	 66b7T+YEZNW+Ymt+evK1Uwl8bsZPoerrWqFagFxdf5wASJHOiZQhX66pdqReI44JZb3I2
	 9UeqatHgPHmioitXpUXu4/rCjCsV8WQXWFRvTxkCYdRhbZgDs198NqfA1VbBu4qWpFphc
	 XuSDpr9T4vTwu998h0eDjqhBIl/E5SFnpOmN2nh0QAlwtNFW6eKMpZqfi9XGxhmg2ZoYx
	 cA7dCLkuJVQtZFykfv68oaU61qB4/Ud4d4W4Rgr6nF7XpjiqAjPTTVqvoA3Z5EgFfaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
	b=ZgK28bZz2vPrz7fZsSlQkhjxw2o5peP71bh/veXq9UR61jMNj311t6EyVtIgGp7DgzTK
	 shh0DpDqE+lPvqmQAk1C3W9/WOQcuTiFXL73eIrKZGFBW3frQOvdfUm3vUHx3pXBW1WLp
	 XsRk97BflQxF711eBxqtQarXA0XvYVKyrUBRORNilt0S+I8Kut/GsGHb9WusDLYEDO5rW
	 lwqbW1lKrjuYtaYXypwdcf8Jjep698T/zCcFehRIhi/sxKsKEYmW0BZ8hutJKcbX1nhm3
	 CUz/JbHIlgOpaXKZM0FQKbalwzANgWLU9MqtIve8Kf2ASzLGXPW979mC33ebDQjlshg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEoCKyYK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD7EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yEoCKyYK
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43bf9548df4so1552080fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793447754; cv=none;
        d=google.com; s=arc-20260327;
        b=IghW7Ibh79X1OVVcVpi+dcR1Ll6DF3XirKNZcRmzWeQWkWtS8HxL8L1amSOUneHaVF
         80KAwRBCX6AhOG9HcsfbpVfFrhUa4pjwgnpXyqTqa/kFwBvPAeX0u6wE7rqBWMastvOB
         6h+UTLQ+zaCaUKC/qfh4mVKmqFQ59kDs/OMQ7FC0G0psd2qTnxGfHVUVUhKZNP9COEuZ
         Cjkmdqeyt3ar8oC64Id6vO4Iy8YnPq1lW3ivbcNM2c1g/cUOU556bE7uhh97sJThqlpY
         0LXZ38ZwRtIopjEBD4mQevLYP9o4yrF7akfzGTqmeb9tEkaG5xkzcUouZIUDPdDMMjW6
         QPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        fh=jzApHTvkIEiJgsHssTJH/K4XHliLFfn28And2mAFEYc=;
        b=HBdMLvwB9DFCmMBkzTq1/JcQOwlMJtb6WYHLPgqWW+JMUTLCOFMJxd763C63QyEADp
         cHowFT7bZkoa3wDqtWI30vRtZEyJ1O17xdBVa3aGwQWJ0HNLrUhpoPklYCP0RlBz3ewd
         jmPYCfqy6daYEYXb3vS+DpieCg+H+RVrV6OAzoTQaXzxZwlZAFPY+aZ7uZXjJRsm4SBT
         rCO17hxSDZ5mBZpcdxiK7B2a8jfKxZ7EdrT2tewb6utcL1RCd11rtY1o0uTXiA+AySbo
         KBi0LWAnpnmkvrTc+G4//qfAkzobgJwplxY0jIUPT93zOfOCZFTkS0Fnbl3Ov2xzOtm+
         6+Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793447754; x=1794052554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        b=yEoCKyYKE6GHeTB/F2eNibTC7y00iBIk7NGpbEjnWZMqwweoOC+E0mhwRB+F5kndN+
         qjZIh98c3DUtPxC7jBTFUOkdGBPjL4Wk5Q7Ib/U8qmXO4Qd4jzx13SM+Mr6GILQDIX3V
         o65iz9mR1ysFncQtJXdvKrEdTYzFySoZ0voD2jZTNvNk3I9wzBEB3KuRApjc08DFZKpU
         eswMAb85qOXQ9BJ25fCew6e6kIMYSprFNHAb6eo6bw9EizjCYPXELfDkEy69HHT4mLrB
         Jla7Rjbk2fm9ZyGWmnXlaLK4OBN54ATR/oMNbYeLnRUNSBYojfCzethzkPSJ6H9I54pe
         GCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447754; x=1794052554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        b=vkZt600w74Yci5eGhqfubGc7lrm4kpolibhSgAeQYgW41+ojK6Bs8N4/csCLZRdON6
         /YlPf4f+EPdKYsMTC+e0zPSG1d5C7aYdvchVckk2Ly9QzPHKB7vb7+oGzYxOPL/Tp17W
         Wb0IjXZKlSr4kdvOjLuJ2xK5kQ04oW3ZT7MFgMLOmhIgGl5NhazF3/kgYRq9t+qhlIEH
         gDK0ppW1mTc7qISRyFW+WyiYtNJV9pEfSIIoGPJXB/yJ0CR26padSyy6CriDIOdxX2n3
         vvuUuKyLhEZeL/bRjs2/uajQGSgN+5JA8r76iXyr4Dv7UDhPyGs2g9cMLXAehI+Mhk5P
         x55w==
X-Forwarded-Encrypted: i=1; AKwUvBzkbqCLK2P9iqZ5I1Ir4osdA6ZUZAsfKzDCyJmf54ZLbOu65nz2P7Gipywtk4m9ojANp2E2wSi7Hw081D4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkIvzsNTL9aOQSq11NfDbHf44xyXA5V/64H+YlyUs2RCIeDn5X
	qiopNsDdJH+Hd11SSVmtwH5LGaF2GisCZVTCrWAu3KUK6klb7TTTPqwIcciq6MyhPWSLFY+eSsV
	+1QMOsunwWwxwv5bcfPdA9FVN2syYAp4=
X-Gm-Gg: AYBFou1w4pl0+9njlQIaJqmKkQbqjiwd45eaVOEi6jm0Pc/o4oey0N3KtiXIj0W+lHo
	RGnkES5sXqMjjr87wvjqBiweZz0nzoPUp2Rc4y1nn7h6Jhc2P5IXqn2ch9KJqHwQIS3hWQd+x8L
	K3kByxzyTxLSQI4sI4e/DHoYxHZDpNvBl301sC/jP6RWQkmCFfcx8mKuU7TFaM8V9a67/wISDvF
	ektcBYlqciNp7Vw5+5j5qQc8wNiRvDGu+Dhj1Tm4FZphhDEOhbJ1HGjOBzGdPCwBS1UCpbNovtW
	x8pysO6aYvd9SYNqbbdgVOskcLsm5feBd89sXISyhppKE5rd/9JMTTEHE5iB04Qi3LQzJwP6OCf
	xT2hEo5Q897QnTMtclLx8Lej9rq4mKE4sjcs=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id
 5614622812f47-5640de57273mr3442963b6e.56.1793447753718; Sat, 31 Oct 2026
 04:55:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com> <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
In-Reply-To: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 31 Oct 2026 12:55:42 +0100
X-Gm-Features: AclHuK-b8gKFoUWpyTo444rLzOgzwu65XdKwpgADL5v7IbA6k1YL_6vO__BFY74
Message-ID: <CAMeQTsaRxZkd7Pawwj-DtZKkRazVUmBM5=DGOQs=y5Yohqt85g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:18=E2=80=AFAM Dmytro Malovanyi
<dmitrymalovanyy@gmail.com> wrote:
>
> Use the helper instead of open coding the check, so enhanced framing is
> used for all DPCD r1.2+ sinks as the spec requires.
>
> The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
> past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
> the other drivers do. That is 15 bytes, it fits in one AUX transfer.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma5=
00/cdv_intel_dp.c
> index 8d0626ddf..0973598c7 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -262,7 +262,7 @@ struct cdv_intel_dp {
>         uint32_t color_range;
>         uint8_t link_bw;
>         uint8_t lane_count;
> -       uint8_t dpcd[4];
> +       uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
>         struct gma_encoder *encoder;
>         struct i2c_adapter adapter;
>         struct i2c_algo_dp_aux_data algo;
> @@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder,=
 struct drm_display_mode *mode
>         intel_dp->link_configuration[0] =3D intel_dp->link_bw;
>         intel_dp->link_configuration[1] =3D intel_dp->lane_count;
>
> -       /*
> -        * Check for DPCD version > 1.1 and enhanced framing support
> -        */
> -       if (intel_dp->dpcd[DP_DPCD_REV] >=3D 0x11 &&
> -           (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) =
{
> +       if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
>                 intel_dp->link_configuration[1] |=3D DP_LANE_COUNT_ENHANC=
ED_FRAME_EN;
>                 intel_dp->DP |=3D DP_ENHANCED_FRAMING;
>         }
> --
> 2.50.1 (Apple Git-155)
>
