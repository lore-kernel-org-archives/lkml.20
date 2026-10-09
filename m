Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5934EC66D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563754; cv=none; b=gkKEgId5wy9oyzz3vr4lXUjAY4+IXqdlKVzyzVcUJmUiNTv9PIpl5UomlJxymaI7q4zlemrQ3sgIsAiPCC4Krea/vwfx0f8fa1vJXEJ9YDFE5gs6DnSVp0qJn1K/2chGGII306AKgBMGU/VZNj9tgsGlEXdsozjB3MBG8Km+33A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563754; c=relaxed/simple;
	bh=xzv9srNKau9QTm0+BVYd1p9jfOptiwQ8hJqbnIEu1ag=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nu0wBOQ8DOsHRAxhXBiz4MO/1swBORuLzJ4flYI9h0WwVoO36O1/AGh8Youb6cYZ4JZluxkm5E67dtIn2J59hnZPPvcRHHHMaAwHYjOFY31jX/l/YMxq2RBSB2FqpGDBxxqLB/Ux+lA8gFtjGzPrdDhwzmpKR8YInsngPHMvBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XjunLH8M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XjunLH8M"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a168355946so892365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563748; x=1792168548; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=XjunLH8MLDA7ajpTfYbPndutCDgjZywUlYdcbcYLkhiVxZtxDCoejR6ooedX7f36Hp
         1Cce9dDfVJrSr1HdtzDETriILG9hY9WSYQQGKR1SYQ41Cou+0UfLP9dvPWl+VJigUf9v
         IwaNCdn7h/7EgAOxx30CbmSqqidN1aQFLWUH6mV5tu3PkYzSxsb5mRXOIsrnzLVV/CPt
         ZPYgDLR925LCkpSTL9Fuc7tEj/fkH8z1EM6h4azt/uBBPqfi6ExkA5FUPOQ/uNuPOZRm
         UPGbgzYa1HIEVSW4kUikKOw/siTwygkauLhb9C7XDqvnRmpcKwJk+seHsGrMCwd15Ttg
         e7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563748; x=1792168548;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=A+9ko0URErq+xcGHqA2qliJp4DY/n5Gc2ESHocepOS7jWlm6wRJcxH/eG9hsyafKEI
         G6PyHjXiRrKWcPUzPjFFT/WTvxGgsKVE7ZNBVzPNvR++hkmrNB37QMPIq3Nd35d0n9z9
         GlSC4d0a+ZCzE+2jLOXAWNzVYxBmwSiTr8CueG/+/K8Jb7hRx0r8BCVJbQavIDtY8fVt
         V60d74MPt08qOW8sG92K+PPDQmD4R1SfBdLZoanNYq3aMxHWVOfUaz01fPmVt+gqdMK7
         4DQOGjm4wg1eJBg1tnCu1PyumnwMLjlui/iO+BNIFOFVCvTZKmHJTVS1Hfu+x1oR7cUs
         UcYg==
X-Forwarded-Encrypted: i=1; AKwUvBxutFVEVpGQYt750PI7bZ3SiWSCCnXuoKZ/9AEPbOx3UYwjENsiBCDwahlySEToVRl7Ui2ZJzZEpSoUCL0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXcXXbql8HE0iW9es03ob4v4jTonh+Qn9/1Pebfk6FM0grzqr9
	uYYSn0xk62BHClmXh+h53rTJBoYIcIhqIEv4Dn/kyqyrTkMpxbMC97OOaQ11OwEumGA=
X-Gm-Gg: AYBFou3MMdixd8ndiSaBAorf4DVD5I9KjJWcKOMBMriocxtkL5AtN5V94CcJjuq2JBV
	hMD0RYs1GkhaDqFTnXS3kgpryclPwy+BEp+NUU9eVhAC5kiG0MaRG3hYpiFXcKXafei0LQEZC74
	g4oQksJWsTk0gBBUalunncSyU33LpUn07wKNOTGtQFXNr0jzvSuIOG6QmbzIyaZltrwT3vHiZpQ
	XyQgFDYerSubYbL/NpcRUib/+38g1Tft0yL8MiA8ocpdXnWRwVeGHgyQdsqA/XFEEOojiA5gs8b
	j/MFid4B4WbQU6jbpIFXXUrYJabCxaIUOV3YGfLUt6lNnaiah6mD14griUFmHJ2G0kZxd9/jPab
	vQHlz3gAfQvftMqTyhiiavfFGbkIGFzr9fjJG5fKqnC3ZG5Dsaw7OO/gu4huNMQh8bPd0WJ5JPG
	aJY+iqnIUBVJ/mjcAJSEE1DT4SXH49Vxn09TG3+oIx7qFsyRdse67kV+acDNaK972sSY/ddPtv/
	kSr+Pw59LhYQotyVQ==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr55388775e9.16.1791563747862;
        Fri, 09 Oct 2026 09:35:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm105678505e9.2.2026.10.09.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-2-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.3848259565001346041.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3913; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xzv9srNKau9QTm0+BVYd1p9jfOptiwQ8hJqbnIEu1ag=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9oVTKL1DDcnNHJUbsxhyX63p9tu7xNUk72fLzCt
 GjzZubzHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIiv8M/4uzg8JbXP7rHJwz
 Se2iTZTq8cuHD7rn7GE73Cft3nVJMpXhf/lC0fW5d6+8KpBJash7IDtlVcG55gONT641Xu8XWii
 RzwcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),

Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?

 * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
 *	Formula is 2 * (value read from hardware + 1)

Am wondering if this driver is necessary at all ? Can you just use the
regular divider here ?

> which was previously modeled by building a clk_div_table with one entry per
> possible divider value (up to 2^width entries) and feeding it through the
> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
> helpers. That is unnecessary overhead (a large table allocation and a
> linear scan on every rate lookup) for a relationship with a simple
> closed-form expression, so compute the rate directly instead.
> 
> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
> OR'd an arbitrary bit into the divider register on every set_rate() call,
> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
> rather than a bit index, so BIT() shifted by an out-of-range amount, which
> is undefined behavior. The divider field write already clears and rewrites
> only its own bits, so no extra forced bit is needed.
> 
> Select the divider with a single helper shared by determine_rate() and
> set_rate(), using closest rounding as before, so the rate promised by
> determine_rate() is the rate that set_rate() programs. The helper clamps
> the divider to the valid range and avoids overflowing 2 * rate for very
> large requested rates, which would otherwise lead to a division by zero.
> Reject a rate of 0 with -EINVAL.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> index e992e7c30341..12a946c989e9 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>  	void __iomem *reg;
>  	u8 shift;
>  	u8 width;
> -	u32 mask;
> -	const struct clk_div_table *table;
>  	/* protects concurrent access to clock divider registers */
>  	spinlock_t *lock;
>  };
> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>  
>  static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  {
> -	unsigned int val;
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
>  	val = readl_relaxed(dclk->reg) >> dclk->shift;
>  	val &= clk_div_mask(dclk->width);
> -	val += 1;
> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
> +}
> +
> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
> +					  unsigned long parent_rate,
> +					  unsigned long rate)
> +{
> +	unsigned long max = clk_div_mask(dclk->width) + 1;
> +	unsigned long val;
> +
> +	if (rate > parent_rate / 2)
> +		return 1;
> +
> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
> +
> +	return clamp(val, 1UL, max);
>  }
>  
>  static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>  					struct clk_rate_request *req)
>  {
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> -				      CLK_DIVIDER_ROUND_CLOSEST);
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);

Rate propagation support is lost with this.

-- 
Jerome

