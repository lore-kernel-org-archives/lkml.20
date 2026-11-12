Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485763;
	b=zBwdvA5k6w39z0hI2iiaQ6x+DS+L6BOi213696AKH7R2LlQUOUexOWF5bLekBeT57wx8
	 tpVh7buA1mgOFVy7xHHeo2ev9XtsMz2rUwgbUijc2kuRXW1mbJNT4R5IZwCILC7/zLDmD
	 5/jwtmEySIBEH3ZOYDT+0Jzm7BBU4JuWhY7DIVKNfIGSN5kzGlV7qR2fvjelbl9tpMTpp
	 J6je+hhLQbiyLUGoiSYfrJJPGcNSIOzA8ZIZest/otUS6rTSzWX2m67vU0lYRPBwVVFAn
	 kNf/aNBFJqQhNnMcnAqlV4ienM4jFfsKr3O1KIiYBmrMCRkIM0qIc8zKQXZMM72pqRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
	b=sKPDhmfylbvnbSOYCFi1MUC3XgGjPxz2Tu4SzWRQms4fxWurTC8qprIdsSigmeYpIoZo
	 o2jbbInxkVvOZ+5hnpUwsIJuswvqUIDXRD8H3UQls806vuNSSKZJ4k5Phq8pb6+FkoCMh
	 85EDEQFgbBHew0q1mXK5mGk40dp/D6EzvbJTfJJaxyP1TI91b1ArzwGEvu/17SMSjOOiy
	 JjCYI6Lt844lMn4KPsLlwysfJ+fGbAwEy1r43ICi9MG4Jwntd4173pQqPvnNXNv3IjKSw
	 T2KwIyfJ6pOJFIPoUBl41k2UWjeEWQGZXjMlIoul/y2FK6ci3Ur+hgxAQ9wf17/hryQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="TrIfo/c2";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A35A606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A35A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TrIfo/c2
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so4854206a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794485762; x=1795090562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=TrIfo/c20w4B3bsZKiGOj4vaPS888vkqmTuI8IfJRgT9cLuZGAWB8DiBZiSW1Ryeed
         ZhcDaF0gzmo2bK2Vqag1M9v9EHXay1TY0epCzjHJ3eWYZhyR4iVfJ78UE1tJUfYXoPN0
         awjLjLfW7fREyntaHl7U1TUy66pA9GbZeL+MX7/Ar3DwEVusJXbumVmLvc9dNZH00Sfj
         3isorvrMzs/hlzqujwXfildQMv1e+SJJ/Tv4IVFYbI1A6FFM5jnSL2YpsT2bdMr3DJW7
         8OHSKu4NjfjLxgLNHZJB9CsZ8bsNXc6+Sbd21Y87wK/eZvWbTpn5EtY+r/R8UsQfK490
         lLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485762; x=1795090562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Day4XSXUwJwiabk4eYh/9BgBg5zitkrGJ+hEmjA9keI=;
        b=I+LyGyV4f3xaH1r/M/z/yRIrZzqD5KZBXL1oZUD5vAv24YAZPpzjcra1/U7SHwwaEQ
         q9+WnMAWaN95rgGiW/JaNa43Ja6xGKMjSWsE7L+6PnOLr0wCfClJ/HHqYYQjtgsUlT2+
         TjuYYwjmm1krXHHzpGZkfBmu4bCyYb/Un80C6jRyJwUgJEALkuvZBnu6dLzeejWtnnab
         i0KCp0xdaZia9FLkkjzT51I2UxxEWW/IqdeTCJcwpth8FuimF6j8xYQA1eDiRDTRIRD6
         1SuCiLIiFDZunVMAwLia8G1p8Dp64592r92kTx9W51md1X0YRZhz/z/MvdPhadN9/frq
         0YMQ==
X-Forwarded-Encrypted: i=1; AL+hErGrD77WEyMqWEEqm04vtxaEvc+pq/+pWvcOu40QoNU0hX4AWs94dc4E5D0B2RymC9dVFpL6sT6GEdHBOq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pc00aorEfwofqKIlrETiW1N796c1nipKpJuRCSTANPzXNBSdC
	GQtm8Ftzv59AthISw0rJV321wTuE4IVV32UsxjwxBu7e60YiS7b/ttZs1pnJFg/cw08=
X-Gm-Gg: AYBFou0GpMzMWsxLSVDA6M5yBFg0CRdnhQMKGnF914cOKXcREemiWS+r8G/MoOfDxhm
	qTZaGxjRk6PnWyYs35GIrlGuxTPpjXO2aIgY/KINnHFpd8it4LkGyGP6AnfxJr7rT4vTbP/utpM
	gqQ/5upj3FqtSeHiS8Kb7fBOcR0LMtH5gJR7UNHV8zoJ4AlzGALiOIkkYGUrlxArqFdwV9bpGH1
	NgvqgzI0rOHfJtOmXIRUibbScFNSXi7xd9Zf10bC8P/SK7+u5qNauXGdxLRToSKqOLbWDTfJCPm
	Cs8PMDqi1yMgkB8S7o8/X0RSNrTyhvpEipDo8Ajk52z/Ctne7fP4dXusd3bBsyk/f8eA+D/Xwn4
	hkUIugmLry7eObwCDhQGMfMrZjXO/fZ0pEAa4zUw7RC1GM2eaHJ8FUAhF9sd8pKSLHVzadCArIb
	yQjamzpjgxliR1Y8RDZweoNuzJtIju9WrGfYRGffi1ayYnBBBJTMAcr8exrGtEvJ87Zg+EhSE1w
	xZG7LAZIenpw55ibGnidC1+JEE0wSdi60ylPWtxJzg63QBtZrtJvn54rzC0Gl67tF8aj1FICuoD
	Uf6jy6ALM13SXMRtCmqzaquau4bNDjnrW4a9Ro+L9u0r/QxoNA==
X-Received: by 2002:a05:6402:84c:b0:6b5:867c:879c with SMTP id 4fb4d7f45d1cf-6b77780e6d0mr4095632a12.35.1794485761603;
        Thu, 12 Nov 2026 04:16:01 -0800 (PST)
Received: from localhost ([195.94.151.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm16127012f8f.25.2026.11.12.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:16:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 12 Nov 2026 13:19:57 +0100
To: Wang Xiaolei <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
Message-ID: <avWu7T8_dutAW8ro@apocalypse>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>

Hi Wang,

On 07:06 Fri 06 Nov     , Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Please CC:stable.

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Many thanks,
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 725e880ae086..69a92cd7bfe0 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -760,18 +760,6 @@ static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
>  		irq, irq_type_names[pc->irq_type[offset]]);
>  }
>  
> -static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
> -		struct pinctrl_map *maps, unsigned num_maps)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_maps; i++)
> -		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
> -			kfree(maps[i].data.configs.configs);
> -
> -	kfree(maps);
> -}
> -
>  static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
>  		struct device_node *np, u32 pin, u32 fnum,
>  		struct pinctrl_map **maps)
> @@ -916,7 +904,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	return 0;
>  
>  out:
> -	bcm2835_pctl_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
> +	pinconf_generic_dt_free_map(pctldev, maps, num_pins * maps_per_pin);
>  	return err;
>  }
>  
> @@ -926,7 +914,7 @@ static const struct pinctrl_ops bcm2835_pctl_ops = {
>  	.get_group_pins = bcm2835_pctl_get_group_pins,
>  	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
>  	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
> -	.dt_free_map = bcm2835_pctl_dt_free_map,
> +	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>  
>  static int bcm2835_pmx_free(struct pinctrl_dev *pctldev,
> -- 
> 2.34.1
> 
