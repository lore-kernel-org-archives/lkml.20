Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616F40BCBB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814905; cv=none; b=RQB84LJ7Mdg7OrJXa3rIuX/BCDo2T4G5VaFQCn9sUbISZ02I7wvrN1NZCnISALKdqJjtxxJwVHgaWqVJEno2Vx3pGLDeAr7PE9wCnSYjjjnk6aYNMtgdMGzHzRQBJuOfU7Ys3peMmvXWEf9LLyJYYf6xyloFycDXDwzeGYMk/QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814905; c=relaxed/simple;
	bh=NBcfPz5Kg5pxUSo6iph13FYLp+Mgm5G1VrbxsH1itNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3LndL0Wxr0yvF48gofk7IgYlH+y/D7attpai8zQW2iWaiLAth/Wqh/WBHgzlAV67V6e9ahT4ywNHpa7YygVL8bzO6w69oxaNVYrGIJ3N9jI85cFWaq9PiC1+q9feZE3sHzKt+XrYjZz5iljudkW1DwRnvma1XArd7KBAPNPQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghebp8M5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghebp8M5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso17938765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788814902; x=1789419702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jKO+9sWDvAmMVaHnfnr4Hp4hjfEF0vm85uCtXj8WFQ=;
        b=ghebp8M5VPbmNcaHHW7NTilf6ArvvK1Rw9d00eTsqMrk47ryKX5Lv5Ibv7wm50vSnk
         PDernjrqC6K1ONjX7RuwGLKREynlU8grfvc5fKglYxmEXkEhtNol8pfQp/HxGmpvDPlq
         b/4Vu1pJVyRZNTWVp9nhw+9jSf5Z35V7AG/m2v7ZQyx56/cw7pg3x8jjQkwIIrExYdeO
         Phq/rYgdDwCAtYX+XpQQ4ehGl8U9RMjzF2mAkd4AM7CUaWEz0Un1U6HpiCqJTmimewO5
         fLoE543d8kal8UHNI9FTJbNLdTU1Sf13fj2g1C0Y4aWqAKcc4p6mwQFbpARXlnAbClJo
         pycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814902; x=1789419702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jKO+9sWDvAmMVaHnfnr4Hp4hjfEF0vm85uCtXj8WFQ=;
        b=UKSrF2ub/YebGCohMv2Ky9nXQ0A6QfIS+vhL4acu+AWPeAXn425NzXN2Ws+X2HLH5v
         m3EdknNub0mh+jqT38saxJmJbiaFwHamTIrjV4zlJjWviR7JA1zxq4XUwgydmjyO+g2o
         y/tLfo65tnKOrKz20hsTyDF+9A5/0V7yFqqVYSmulHc8qGqJBe1BXhO+PNxHhF0WRten
         zQMFb8UaQmC/LFNjoxyOxTHW1uqopwvEZuajzOl74LutS0U35fyZU66NkPNoCphQez3o
         tqDtq/P0eh4X2/HT5k7E/nbICLSV5K6N6zaNxg9OHrgI5AFhpWPQFHwPKO4mI4yn5Pa8
         +OOA==
X-Forwarded-Encrypted: i=1; AKwUvBwMQcIflPnYFsr3hxLFGSDRU/ZIDvPaMypx6/OyQLbP1gguieZzyJPUYdMeCRKClZyrESIt6xenAkPa+Kg=@vger.kernel.org
X-Gm-Message-State: AFuF++mmoUHlYpRXIfzJo6Q9+PJnSwHeOwe5Rd3h4jsmEzADhijBAJWJ
	7475R3jhB/eAKwLxnFtNmhqZC8YE4zT5Rtr/4V5HHnABXAaiggNO5weg
X-Gm-Gg: AYBFou25fN9SusE+JkL54Y3Cpq4iQYZqejcnIxz+XonKOVo7qfOyS8kLiNCCV9NnRN6
	ZJlhz7LG+M1kJ2Iht+XZYheWfmwc4/IWm2Kr4dWCcKvu76TPSeCpj1HXLRx4cWf09o/5/QiHonB
	U/SocN7uyOgnk0FIAOUw+y1fjGSgKugydfszrM3uwKuVtBQMGExsnrUCNes8LanyqFm3Vp72mty
	sut3bd+uO0yY4VCkrE+NWAZAd2FQU9Iuy1v8wWzKOpFUofefCPZh1ZImEb17d0yEKn0ULVKm+oL
	0TIEd8Zh1zzRrD0bOTNAh9Hqve1advzR8nNsuEyPHF+6dT3ql32y8aMTuAJ0JVIN6vRYjwDzCTn
	Wg+GDUrCnpn2MAvbwqar+Jc1iskOkhq8khECCgSVJ5G3y6DBlvixS6q7OH56zpYwxlOTMLsyf/y
	iHShNjLqtE80AOcY68ECLsoeZztV5PHqEbNS3L03v+1b5WMQBvXb0YwpsldJl0MaVEUuhyqCnv
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr297613755e9.12.1788814901592;
        Mon, 07 Sep 2026 14:01:41 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm299682235e9.2.2026.09.07.14.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:41 -0700 (PDT)
Message-ID: <6fb14341-655f-4cd0-8704-50c8d2e5850d@gmail.com>
Date: Tue, 8 Sep 2026 00:01:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix build error from a merge commit
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260903-omap-hdmi-fix-v1-1-b0447a1d35d5@ideasonboard.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20260903-omap-hdmi-fix-v1-1-b0447a1d35d5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.09.26 г. 12:38 ч., Tomi Valkeinen wrote:
> 'ad->card' was removed in commit 9af2c1d4f847 ("ASoC: ti: omap-hdmi:
> remove unused *card"), but commit 699e5975e2a5 ("drm/omap: Report HDMI
> hotplug events to the ASoC HDMI codec") moved that code line. These
> commits were applied to different trees, and the merge was not quite
> right: assignment to 'ad->card' from the latter commit was left in the
> file, causing:
> 
> sound/soc/ti/omap-hdmi.c:408:11: error: ‘struct hdmi_audio_data’ has no member named ‘card’
> 
> Fix the issue by removing the line.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/all/apbbvQSfUbzYRFaw@sirena.org.uk/
> Fixes: 1ae7fe832c2d ("Merge drm/drm-next into drm-misc-next")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

> ---
>   sound/soc/ti/omap-hdmi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
> index c32ec7c0b0cf..2cabd4cc5b0b 100644
> --- a/sound/soc/ti/omap-hdmi.c
> +++ b/sound/soc/ti/omap-hdmi.c
> @@ -405,7 +405,6 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
>   	card->dev = dev;
>   
>   	atomic_set(&ad->jack_state, -1);
> -	ad->card = card;
>   
>   	snd_soc_card_set_drvdata(card, ad);
>   	ret = devm_snd_soc_register_card(dev, card);
> 
> ---
> base-commit: 97c594f71fa71dc30a0583a76d8b6ef5c5ea10b1
> change-id: 20260903-omap-hdmi-fix-7f085e21b708
> 
> Best regards,
> --
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
