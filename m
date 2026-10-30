Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361169;
	b=mLRHquHoyKU8qDqJUDT+V1pLiVMZsFL/V3jaWiwppopt3BDn+mj6Aiq58vEr239A4fYc
	 rkr7V3C5m8lV5yyjQFJ2bpAVdXIVqcHD4NmSD6gOcWIJS9/e+exUCZtV+uDeAiyDvbb6E
	 tF7uAlslIVsV6AUvqrsphO15DBcsWJK1gS39ylVjMGBW8YYij8katgC/KuOtKGFNXRjvw
	 LJw0nxoP2PeNxM8lv8DB21L1kZVeMrDzlaYCDBhhcjUl3Owo+FpQcxrM/y3wyHjwbP5FJ
	 ojJVJSrggAzPWUFGtd9KZMDYyB6idlip3hl8DS7j6cULMhTCIRJbUd3fDLA1pCyGA/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
	b=XtvxOYZEf7E3PH+PtlsIrQCBJXqC24daU0TKGIHFiH3NL9JBt8Ro4lPYCiEmQxbFng/Z
	 XNniOxLbdzkDMuSZjVMw/A8sqH5qm48nCMsXAVwXKheBpt0h8hOltYK+BWcVSIFqITt2I
	 qv9oTjOJuuQPK97NgMQ2M7BQxlTHBNbCmsMcnUBTFkvK941VGpvTbu8biZ1RQEiv3HZZh
	 PSx0FepCdgzIafUMzS5O9y/Oe4Ge8piqcGUednTnZI+Sq3tPguPHXUcApqU1Are6KqiDe
	 bB/dXdBvDPd3o2THThDbktdUziLn6zlEDxd4zuO81z0AdgAURzRZPGrJYl+ueNvwPFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ikS8efMe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8F606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A8F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ikS8efMe
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso462071a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361168; cv=none;
        d=google.com; s=arc-20260327;
        b=NajRqdfaNEF6eui+3P/M1Ou9KWsfSTieVu2EZ2KXNLDqtQDKpeELOwzF/mzMRoBsGT
         a2nuL6EXAF6v2kX3yYJHZjdPJ8P3l8RykGGCwTMeMmNmlUOv09pixl8e5kqxLTyb8kQB
         zJy0tyHpLNVwjF6Z6CLOFAVa9ScQB4dItc6r6G1DMwqnM7zWQUC78C8euH4eAOiXvl+4
         HyT2966pY2vX/mziXpXAjCDtUe7snCnta1E7KwscsZEuIAw8HnX+kS0F/ZSFsQXLB+z3
         qk0BanRgs6Z6WGGA1IrdGsWr2MpEOBtoPBHcf0MW77/8EZCSC09d1xYZ6yOc9yqcUzHZ
         dYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        fh=6WMXPNrd/zwH0nvEYPsYVJytxoNWOjPkGknPmXbNxYI=;
        b=gOgj9Chb4anGL+rch978lv1G5i9M8HUBbUYpzKKUH/y8RA2mZxu3gsFYofPp+/Yahe
         x6O9cNcP/0RWNGsRQnzGxMVnO+Lp8hnezNiCIK1N0Qx0TrBQXfUorxcv+csGQ6eZG2/e
         is2suUvgLryk1qX1dOERuX7UUlbZx+rhFR5vq4GgN9ktXQATL4bfh09B86TzY5LjaPe2
         lZQb8lLl+QkU53G5EwZztEL0MwACGJDkkn451Q5UMri99q7R0t8wnhR0l2BTIo6mC030
         lBqVREGIracxooCDb9XT09ekGHRyVosemJPM8ORKzZYfu6kW8CFQ4owFxiX5d7hrRnTc
         n9RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793361168; x=1793965968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=ikS8efMesq4B/ME3qWtqEYqBkQSvUsXOHLf77ypjvSGZYuR/7NhhdoZP0VUSKtkQSq
         IYzshig68b62WTRkl+m/DapkK4kUNB77GbJYl7Y1xQrgPOE1vCWa/m+EtqKlcX+axzLN
         xsPlFRSWkvDi/Ia4J9eZ6ByBGc7UgIlSbhu2glWOJk3SFpmeS4/8YAQmUyNuEoIZqqa4
         xuMKUMCUseLRrcyITmBHdStMNw3qMkQaqJL4adJfcmpvit2IBNgoBv0ZG7TVIfEoHyo5
         ff+P/lQUT9xMWCSYuOZx6owYgW34Ae5rIhmEo9TNvkcNSiOOEDJnlAsGCskSepkdpMEs
         p+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361168; x=1793965968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=jp8szR/S7i6K2+SXY+2u5B6C7zwaP8/9f4jNxTCh/oA5lYtfoSZ3JyVwhop1ua4iE1
         cA+bfi0YK/DDrUvdlPKYVQJ16jbJAM5lbJeifhAfr1de77R0m5KR2qwyZC8LqWWIUeRs
         MUSm51D6lq5JTUdwHksoujigD7oyYCZ3wg2AB1tW9jarPJDwfRnDL6kci4juR2tgRNeQ
         jqfGL2NAmzgESJJY0/BI8buaWILrDHcGAbJ7V+HrnGt0QcFAJz/MPle6FP4G4tZAvI5p
         8ePCPhfnQKZdby5+xScAn8PTqkWKAk4w8FiTrrpm/WHGi0lw8y4CSrgwtWingdUCrfFo
         gt8Q==
X-Forwarded-Encrypted: i=1; AKwUvBypSQNCl5wLlQu3p9eU0ZKgN6O/LDvzP3xIAkV02cVIpyrC5K6EoojSLJnME+J3QkP+kZAwx4HMkaiskUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk56El75VfPod7gMz0MQ/ylafd6+u4sUn4XQxCO2LMKWD2t4N/
	XX6BFfsayzoF2JIw3oU+x0swSuQpFaBNkr5gVENzWkuLTphGWml72ioJaxVZznOeGr+MV+7Oke6
	4sXQzcbZ9a2L/jcgsupDOzanzwZAS6wngkpywz5NDbg==
X-Gm-Gg: AYBFou2Ur0GmCVfnEY/b6UMa2xAuODo6hceC65JFjKZJ8V1N9SkUkn4WWdf8//MmRxx
	xCZ3O2No5o38AcLYpbjztd+2Nmnz9BPlO5jh6gXTTNFbMm6y55Die4R8R74SbMWhh4LaUKtBMrx
	+r7mtigMBqsjF7EACk0dkXmAmDwJvWL0LH9qWvYxu/RF6RtBDOcZr8p+wjn0Og8BZnz98y32C77
	kadgEYWxnfOkX35m3MscVaV19fwC1RjrRtTE+v9nK7WNXgA+BB6luJRZ3wONbfDfyy3gnYmMtqS
	UMKnKkPvv1pMyp4dYdaX+1Ra2BbrX+Jl0czZTwH5oV7N92+h/b3LoWc24y9drfociRRmO14zDca
	J5gi6kqplX2yaZxuC8U/oC1hkAK3MMslvAyGX
X-Received: by 2002:a17:90b:2f0f:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3ae896d7af2mr1070361a91.8.1793361168540; Fri, 30 Oct 2026
 04:52:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:52:35 +0000
X-Gm-Features: AclHuK-idMrAXuG27Lf8hdgtB5yVIMARZUjc-ne4rm8j_v5CZmkmZ5d54vPJbms
Message-ID: <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 13 Oct 2026 at 23:52, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> @@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>         }
>
>         phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> -       phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
> +       /*
> +        * YUV422 always transmits two 12-bit components per clock cycle,
> +        * regardless of the color depth, which from a rate perspective is
> +        * equivalent to three 8-bit RGB components.  Force 8 bpc here to
> +        * keep the PHY PLL output aligned with the TMDS character rate.
> +        */
> +       phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                               8 : conn_state->hdmi.output_bpc);

Same question as for the VOP2: why only special-case YUV422 when
YUV420 also needs special treatment? And presumably in a way which
can't just be mashed into bpc, because the maths doesn't work. So
would this be better off being handled as a separate output-mode
adjustment?

Cheers,
Daniel
