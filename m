Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574119;
	b=QtkHTZkuVGULgZ8jydzO1yxwlRjhM3kTtYJyPF+Gzx1z+KT9AaIdD0S5yoL+wQvEoHUA
	 w6HZqSfjPvEgefBd/AkmIEcVHJJ0iHgO5f3dYDLREGT0YdYU2D1kJ9Ovc4AAgsGLeRMuW
	 QnTxa11+80qLCBd+UQkzCZwVPrLjM/zbFHDv1gH8CFyTmPTIvM2VdpCUG9AFICjvV0gF0
	 aZ0uHPkCTqtd3/+GlAa/B59HxZ2P+mKq+FIzS2q1R3s+SaiRZgbD0vtde4QhOLtZslZvr
	 Ep/k+iPlRehY2Of8yui/b+TbU7ccX2CS9Hkb2DAcMXudKW3Zb+txGTiLFxHZ+OSIlAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
	b=AtLnZTuGLxtmyGARfSxbf2ZtsrDWceLIEjS13OIXaColxgpTD7r9CInb9SwSq0ihRgiU
	 dnhdSRXRQ2KYPpe7/41ES18S+TN+uFfRX6OmfB7+6PgMMNSOSEk9oytzbl3OxFQScYYMg
	 ABNvFOEwH0n7EonOtL3i50+u8VG9OVY2RuiC51CcoFuMefp+5FZTxvhdF0Ct67ApdkNZt
	 GFTpSBehPW3nZ1E58THd7DIGKU/mA5eYVXXe0ZmXmdsAwoPHrXN6hLrFB+FPsRUnjttRc
	 tzJsNb1nUxUC9H3Pgg2+A4Sc32hGVghvUV1ycrWLlAxCD+XwIiLZnG2qj2OtlDFgvRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aa13XPBT;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2B606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC2B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aa13XPBT
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so445816f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794574117; x=1795178917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=aa13XPBTnWlME6AGchQWWhj8WGEPUrnXgNH+WOydHvaXbcAUsWHkOI/GSW2/SIVUyB
         8MtI2pih7abMuH5xIRGeiapYujpgnF3zpLYi/NF4R4aj5mWgalfCJEVVItt250DMFa5D
         K1WauyvOHmvrHcBqavIlfhKvvj8/VU5wAqxUhIbg21kxq29L21DIl7hjTt4fHocn67zK
         N3Tm8StUiETdtN/vaQJZzWUKYZRjnp+DPmYGs3wmG3/342ugfreO3AD6to7ULluEpV8b
         SLiFg7T7rQ3WAoHUtEd/kUkdc8OmMKP1vDqdUoY+T1DTvSr34N/bQDHs/emCYvhMAE9Q
         u37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574117; x=1795178917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz4hVdaW52UUAkyBzaCPrzOKHHNFtHiedb5E1/etRB8=;
        b=lVoFztNowbxuo79MJZrwA8Od/05or2hlulesu139hStY2IgJlzmdPfF7piDiBssU3U
         ZIn3QHChA0btztQZa9yuJ9O7+HPdNKV2Ntuhy7XTLsbAmyris97JCHk3UIrlVLvjY+DD
         XG+aD7seFueW5aqh/vDwLPxIaJYWNH65BZ9V5XVusWtdkUA9dJgYgj6Au1iI9RqhbX3A
         7JSrOzMSR/DbNcukeNbS3gcjmEljU+Fhj1EMW8meSn45hDZx4RkzHujG6VyepGR30Cr0
         jZY1+as9dGxZIV+7Vz28hBQo20iCJ5ePnwYFxgTnTvMlitt4W99r3pdRZwPgpImGFdz4
         49nA==
X-Forwarded-Encrypted: i=1; AL+hErHfVbkrJuXeqvV8uiSG2onBNDt++EuVQuBUr5rp3ezeZQ+oYwkqsC2cwy76xlMWKPw/ZwWlxZxxi8WS7zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hlyBfSeK3vUXf1hUQVAKIwZPQI1GIXvdVVCy+26APjODW8sod
	syatI4XTbQDkDnWXdajGJFMlcc8Dik0aXydIbS8483puoMEY122Gz0Yz5mqSGSEV9Oc=
X-Gm-Gg: AYBFou2Y4J8Oegi9PYE4tiSpdEiG7RhlE4Fx2MBbBMnqmKjAARY6IxtY5FMsM7edrOb
	Lk/g4+AYKNgS9Z6GxIKheEejK0ii0liaOoxDvM9xeyjGstK9dGtPtX+H4vbLnTQdPfXS6jsUM6y
	xvF1X1G+nFyVrIRwswddkjdcuBBYS5nxPhE2FgHJoihroPxOOtgxZejub/WHUN18f5aklWsgGOI
	G+7N+nxgSUcha2agrWV0bHppjE/lFueYaxfuz9TVfhoh0bvWi7eHCbBS0HRKGwQhl7N1ZzBRjvC
	Jt6X/itCpiXRQMV0eC+UeAeVQ9KRgswpb32HCRAc3+rOuzpulhguod34gWFwNGzRVXA80npzpKr
	T7HDbaoqu3ne3q2WTxRm+5aTNmwdbiQKFtTaieO3Q81wqYjPDt3dvz9t2KeqbP+sfaAuElsWdfu
	6CB/KRHhyaAZrSTJTaXSWz69eEgJ+iZUTS5+wnWBV299HG+yC6oreCcAbLboPPf9iqP4inCS7c6
	NOr0ZM6N/bruSRbWsMop413aa9DgiKk1Wc+A1GX+u3NKqT19nyaNIIHt+knxvq72gSlhHgTB3oN
	GfbTHTQihPVmDVaLHd3WKKfn0G8P
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr4648801f8f.42.1794574117479;
        Fri, 13 Nov 2026 04:48:37 -0800 (PST)
Received: from localhost ([82.145.117.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4643230f8f.27.2026.11.13.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:48:36 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 13 Nov 2026 13:52:34 +0100
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] pinctrl: bcm: Fix off-by-one and out-of-bounds
 access in fsel_get()
Message-ID: <avcIEnCThuTHeWVv@apocalypse>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
 <20261113053221.3131068-2-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261113053221.3131068-2-wangxiaolei01@kaihong.com>

Hi Wang,

On 05:32 Fri 13 Nov     , Xiaolei Wang wrote:
> The FSEL field is a 1-based function number: 0 means GPIO, 1..n_funcs
> map to funcs[0..n_funcs - 1], and n_funcs + 1 and above are rejected.
> brcmstb_pinctrl_fsel_get() indexes funcs[] with the raw value instead
> of subtracting one, so readbacks are shifted by one slot: value 8
> indexes funcs[8], past the array end, while 0 is reported as funcs[0]
> instead of GPIO. The setter programs the mux correctly, so only the
> debugfs readback is affected.
> 
> Map 0 and out-of-range values back to GPIO, warn on the latter, and
> index funcs[] with fsel - 1. Tested on Raspberry Pi 5 with KASAN: the
> "alt8" readback no longer splats, and field 0 reports GPIO.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!
Andrea

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> index f46b27155c3c..2b942ca7196b 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
> @@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
>  
>  	val = readl(pc->base + BIT_TO_REG(bit));
>  	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
> -	func = pc->pin_funcs[pin].funcs[fsel];
> +
> +	if (!fsel)
> +		return pc->func_gpio;
> +
> +	if (fsel > pc->pin_funcs[pin].n_funcs) {
> +		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
> +		return pc->func_gpio;
> +	}
> +
> +	func = pc->pin_funcs[pin].funcs[fsel - 1];
>  
>  	if (func >= pc->func_count)
>  		func = fsel;
> -- 
> 2.34.1
> 
