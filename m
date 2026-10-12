Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2A2264CA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783410; cv=none; b=EThPCms6uYl+DMmX2H5PlueP+MXZTH0Gk1rzVn8B6idgXn6zwmllTOfNXYn31L15x26zJS0CEsM1/XwHsBo1uRTbOfc6G9Dfbk1FJH9AmXphyDT2Dw6VGt3qyLVZ8FLsAkt/Xo8PIuRdQruFuM9FXi6BdsVY91Es1MtTG1/dSec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783410; c=relaxed/simple;
	bh=kWOQyRPzED4J6Z4ZfUGv2vz505kNFqT1fa0pCQy3lXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssIj7RjN7ZeieajKZTGZWnpaLL5Wo2hpHGHYAZZq0vzPVwYuDDDj3nBoWhOJ6GVV8E5crXF9ALUKrBHcBqIPmCHQzlDufK7OLrRv6+K8iWF2eBYF2ukxQrnXJ7tAkCnFZdF+9I6Yf0ph34IXdKIu0vxy7/YJAfkOc0I2wRCXHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBpD5qhZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBpD5qhZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so984537a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783407; x=1792388207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YfFK5/qq9t394ytyKSs2GhlrPJ7z3Fz6Rt9xrFCB/U=;
        b=CBpD5qhZgS0KUNsqJrKZZdTWhJqPNGxJ0UzEQE/Wj57jKgBwejlFYdaWqSqy1jPYsZ
         aPvJTx6VOdlyUZahkd3RKFTwB5SGbve1Nx/MGOf+VASvGh3C+YLk0O5NhL3l/08Ni1/X
         VQEK7vQ3EEM1AjzGgH4e5U4yfFeXTQV0zO9incE2zxhIU+zK3n9IboPYkrR/ZKNMo5My
         3E9Nbwd6ml6TI/I46sKUYtQ5eWGdq3rceQHjQqGTrJ5FjmXdzZnD+cuGsJJgcRgm2HA2
         8IsOXgQA5u2tURtYHdulS2+Ke4eAseuiynV1ZRzl8osFcQhNDNYs9Q0oNbTEuuhzZ2PE
         7mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783407; x=1792388207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YfFK5/qq9t394ytyKSs2GhlrPJ7z3Fz6Rt9xrFCB/U=;
        b=1olRmHyxIYwP0KqSMGv+rO8Zy6McTOmku2WCkYo2aCAAQqxFtdwChaufaU8ypCJ9FE
         RJWtI/tu07XKliJZ2JoZ9u2Ne8qtF6/OF9BU1ntFjFWy74cKk8sJ39i09yE2aRJ9Yook
         6i43DQcBkaKAfDqTXybZA2wGXiwZW/aZyKVwmo08bUVsSQe+7VeOp6dj8g/NMtpqvPL6
         aiXJsk0eaCYnbC5PcdtdRFKXy3UJTS+1tWrxkCMAjffb5KXOGEduz54X9YUghToPMq1g
         svQLw+GQd6VQh3a3hTyF3rsVQJyoYpx/66nB7xgzfyaq2NoTgkqUj9Gs/mBtQpGYBhQq
         2riw==
X-Forwarded-Encrypted: i=1; AKwUvBzDFOTP3DedTNTedUgQ0b8GD5FCvNSoLKszTrlPtMaPYQlsTn8fj76TUngg977gfLdDykFsZUOr0Vnyrc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFjxrceYQtQ+vX1KfKeSEM8rzwaWTy1zlotkSeHQgW7ZdE1CVo
	HD2IW40RS7By/cWmK5F0cE9vwiHqhzgMw/A3XMZSa9cAKpRZbiccxQHr
X-Gm-Gg: AYBFou17UdaOpiT8dCShl0swVJpgaLkthWtnmf4egAgcEvbKPvGtxVHf+3d+udhZQs+
	bwhSQPzcdZUBnVzP96Yl+Rjks+2inihVZA09+fKSTf1cBICaepPDwlI4DHWuaoxNVCzExmsXK+G
	yHe+IDhcNrelk1lA5YXjeyuIDlfUARKWcw1BiiDmOKcynG/fFv7FvD66yCsUj5w2a5OJE1KUyv1
	GeRwxFpSJV/5H6j9tsaPSDfbFLaj7eN7AgQarrdLYfr5GdRpBxQcaSuoKoaFRcs9FRhc65u1kCx
	aaHQDusLVpi4HTuHyKmbK6IkWIKc92AMMtY8pLJ3ugaV1y78UkZMhbHLmpFSUfdZvWfVAP6a9Vm
	FLe4Yf0W+tS/2EEPQHnmRxsxlizTybZ2Nac5Cdz0sxOFmzeqPQxd7pJBypSWDCAKkBw7z8kD8Xi
	n7NsyvQOi5CL3ey9jA+E/K7/48xHJXSALoaIfa1YdcS1pyf5FIgX95/P1KWQgG+29OEfmJ6qxhn
	GgOjSfo3gc78j1nEtCmIHFoa4Oov5mDTBy0MEQkAOpA7URuUH5vphQ=
X-Received: by 2002:a05:6a20:c784:b0:3dd:a197:ede9 with SMTP id adf61e73a8af0-3e16bef6952mr6940746637.56.1791783406452;
        Sun, 11 Oct 2026 22:36:46 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1ee81sm3738457a12.12.2026.10.11.22.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:36:45 -0700 (PDT)
Message-ID: <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
Date: Mon, 12 Oct 2026 13:36:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula
 instead of divider table
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
 <179156372588.266328.3848259565001346041.b4-review@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <179156372588.266328.3848259565001346041.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/10/2026 12:35 AM, Jerome Brunet wrote:
>> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
> Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
>
>   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>   *	Formula is 2 * (value read from hardware + 1)
>
> Am wondering if this driver is necessary at all ? Can you just use the
> regular divider here ?
>
>> which was previously modeled by building a clk_div_table with one entry per
>> possible divider value (up to 2^width entries) and feeding it through the
>> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
>> helpers. That is unnecessary overhead (a large table allocation and a
>> linear scan on every rate lookup) for a relationship with a simple
>> closed-form expression, so compute the rate directly instead.
>>
>> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
>> OR'd an arbitrary bit into the divider register on every set_rate() call,
>> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
>> rather than a bit index, so BIT() shifted by an out-of-range amount, which
>> is undefined behavior. The divider field write already clears and rewrites
>> only its own bits, so no extra forced bit is needed.
>>
>> Select the divider with a single helper shared by determine_rate() and
>> set_rate(), using closest rounding as before, so the rate promised by
>> determine_rate() is the rate that set_rate() programs. The helper clamps
>> the divider to the valid range and avoids overflowing 2 * rate for very
>> large requested rates, which would otherwise lead to a division by zero.
>> Reject a rate of 0 with -EINVAL.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> index e992e7c30341..12a946c989e9 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>>   	void __iomem *reg;
>>   	u8 shift;
>>   	u8 width;
>> -	u32 mask;
>> -	const struct clk_div_table *table;
>>   	/* protects concurrent access to clock divider registers */
>>   	spinlock_t *lock;
>>   };
>> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>>   
>>   static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>   {
>> -	unsigned int val;
>>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>> +	unsigned int val;
>>   
>>   	val = readl_relaxed(dclk->reg) >> dclk->shift;
>>   	val &= clk_div_mask(dclk->width);
>> -	val += 1;
>> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
>> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
>> +
>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
>> +}
>> +
>> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
>> +					  unsigned long parent_rate,
>> +					  unsigned long rate)
>> +{
>> +	unsigned long max = clk_div_mask(dclk->width) + 1;
>> +	unsigned long val;
>> +
>> +	if (rate > parent_rate / 2)
>> +		return 1;
>> +
>> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
>> +
>> +	return clamp(val, 1UL, max);
>>   }
>>   
>>   static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>>   					struct clk_rate_request *req)
>>   {
>>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>> +	unsigned int val;
>>   
>> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
>> -				      CLK_DIVIDER_ROUND_CLOSEST);
>> +	if (!req->rate)
>> +		return -EINVAL;
>> +
>> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
> Rate propagation support is lost with this.
Thanks for the review.
On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider 
is exactly 2 * (val + 1), so the regular divider covers it. The 
dedicated driver is not needed. You're also right that my 
determine_rate() lost rate propagation, because it never forwarded the 
request to the parent the way divider_determine_rate() does.
I tested the regular divider on hardware. That showed a separate problem 
in the existing clock tree. The mux parents are declared with .fw_name 
only, but the controller node has no clock-names, so the lookup fails. 
sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up 
as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns 
early without writing the divider register. That hid the real behaviour 
of the divider.
So I will drop this series and send a new series that:
1. fixes the parent lookup in the clock tree, and
2. switches the ADC divider to the regular divider and removes the 
dedicated driver together with the unused mask_bit parameter.

Best regards,
Joey
