Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6E27E1DC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797474; cv=none; b=YedRokHYDUm23CvxFCbumOwjLyJIy4Nf2VeJTZ1a1N3XmX/UzVGiX99i/rCxpGMDQSezlcHtxT+mCUihVWTXFHJmOOiteLJZBnq0JQgAY9+RRfqTjDZRsz+9QNS/2GWVmLHDbvd6qWtFuiVkGDGljFbVq4AYSkWfGKR8D1UyuPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797474; c=relaxed/simple;
	bh=bImVheUfldAOxgjHgkl8ayk/Pb+3X2YPifkfTYNLEVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pf7No/ToosM2JuCtC9SSl5eEE6V4Jw9piAe5x9HG3B16nSUYapHY0CmDOJwHeL/Ey/4RrAgYAkFz9Ui+vBW2zk/SD2NVMNL/KVpbxFVGcdS56JEKTb9XKwVrtsGUHGSCCqeKejJcJ+iNn/MiAlf5PidnOBd4MkEH6XhTLEQQYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzTBst80; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzTBst80"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so570199a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797471; x=1792402271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=VzTBst80YDmdFAS1uBnfclt+UU99XCDw282bvx5Oe3qBh6kBCAliCUT0f4TE5KZCA1
         89IH0KWliNaJp64YkXpJXCrnYj+apRyANBSikvMiDoqcgK3xVbKLpLJI7jKrxzmxtGg7
         fNbNL3vNkr2yuuZTbNZ8yjOzIuRhHdui6jx26RhSO67yrzvEDproArdRneYytG0A0nGe
         9l4mA0PiRQ8a1M8dLT9w6DTqIx326/qtEP2qvlXqknc1FjCQVyHfAB+Q+YDFc6WuAXiR
         TzzF9tFaztXl77OPUW5+RdXatVKlmSzDJer083vRDgiE4ifujqJ9HvJfyeoZs350OMOc
         9aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797471; x=1792402271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=YI+XZJCLrcnfmZvJ0tQBZc7YH7hq1h6mSLVD79cHim4RUfQEsKS/Bv9FEN3Z4Y/TxN
         8DF9wHL95hyJL4JwHjnkpZBqn+WpUGB043/fuoCmyDaC+eWX7iiyZqTZxstf6zcgWVzM
         G8fXtznjfkGj5f86yoxS+Ykp7uM1X/CmcwedeRxAw6w+o76IM+EHPdfwHmT962QmVkbW
         A0Tzs6pEMUnuq4ZkznkKVjYCRMPOIuL41Cr+MHRoWNnzhiRDK0GJV7+HuIrYRtl6Y0oa
         xzMJ1GMJC5bEi9BQCyLnqPbnF3+0BKgrkWkwY7PhDmmp/iisVzso2eYDBJjJp0HlQjsj
         u27w==
X-Forwarded-Encrypted: i=1; AKwUvBxsJVn7Od3P2m5A1H9CjbPHN0bEo3zobgIKzE9MpBV6o4Ko1MKjUYMouvzLVPmaNFTzMZ7fW2l7P2oyfnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHN8L85uJAcj3foR/wg6dPhsOg//D5tayw3FT7s2tpFnh2RUYs
	ZvtfeTEi7zNVENrA9NDqxeqNpTKA3hsHRjWWs1jfazbbP0KBEfCXDsqV
X-Gm-Gg: AYBFou2YAhZNnlyH24pvhcVuPu06QLTnYDB6dKys/Kr075/42flQ1H2AxBXpG3lmJyB
	+RxV7XINtAl7Bjfa6WDU/Q4T7knYZnpfdmYaB06V4zp+lt00cwV3D+DsaILwmlWEwYQ1/jcftG6
	4XQs5cKLj7RtagBVaXE5wjk03P3xK4vt2JZ/oTzGc7Yi+9YKeWknLU6tXkEBSKkkrUW41Zi+b1L
	mLwLS3ryLHwqbgrqhrhrUlM2fIrG+Pg7hWygybkYllP2JQgkHJQ+DP4eJYLyzFe0tevnXmGKiOM
	QkQsuBwy+eRR7lNefKHo8PS5S8/+9YLsy7vvUlaUwdHcIRNbjxHUA0Ri+b2uHocVIri2KLz6YfH
	jmNr7biP/tnlP6CBQhmBoYtFt/k9SMpmTQpMMWb5lWSmNfMX+E3UK/8v2TQVMiL5iG68ykE2v4E
	N9uNhvY0USt4iirUFTj9tg7OSm6sRIJzog3dMOHNYyq0GA6fPo1uyjuh/d3J8cK6JrdGmSJyEa2
	njFFTkU5dKEVYqripaywlYi+bGIi/8d5HodfIIVEuBvyRByORZqkqU=
X-Received: by 2002:a17:90a:e70c:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3ab3ac9dc30mr7226256a91.29.1791797470974;
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm18455640a91.11.2026.10.12.02.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Message-ID: <88c1f8fd-b972-4fd8-99e3-66eadb0f06fe@gmail.com>
Date: Mon, 12 Oct 2026 17:31:06 +0800
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
 <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
 <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/2026 4:16 PM, Jerome Brunet wrote:
> On 2026-10-12 13:36 +0800, Joey Lu wrote:
>> On 10/10/2026 12:35 AM, Jerome Brunet wrote:
>>>> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
>>> Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
>>>
>>>    * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>>>    *	Formula is 2 * (value read from hardware + 1)
>>>
>>> Am wondering if this driver is necessary at all ? Can you just use the
>>> regular divider here ?
>>>
>>>> which was previously modeled by building a clk_div_table with one entry per
>>>> possible divider value (up to 2^width entries) and feeding it through the
>>>> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
>>>> helpers. That is unnecessary overhead (a large table allocation and a
>>>> linear scan on every rate lookup) for a relationship with a simple
>>>> closed-form expression, so compute the rate directly instead.
>>>>
>>>> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
>>>> OR'd an arbitrary bit into the divider register on every set_rate() call,
>>>> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
>>>> rather than a bit index, so BIT() shifted by an out-of-range amount, which
>>>> is undefined behavior. The divider field write already clears and rewrites
>>>> only its own bits, so no extra forced bit is needed.
>>>>
>>>> Select the divider with a single helper shared by determine_rate() and
>>>> set_rate(), using closest rounding as before, so the rate promised by
>>>> determine_rate() is the rate that set_rate() programs. The helper clamps
>>>> the divider to the valid range and avoids overflowing 2 * rate for very
>>>> large requested rates, which would otherwise lead to a division by zero.
>>>> Reject a rate of 0 with -EINVAL.
>>>>
>>>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>>
>>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> index e992e7c30341..12a946c989e9 100644
>>>> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>>>>    	void __iomem *reg;
>>>>    	u8 shift;
>>>>    	u8 width;
>>>> -	u32 mask;
>>>> -	const struct clk_div_table *table;
>>>>    	/* protects concurrent access to clock divider registers */
>>>>    	spinlock_t *lock;
>>>>    };
>>>> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>>>>    
>>>>    static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>>    {
>>>> -	unsigned int val;
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>>    	val = readl_relaxed(dclk->reg) >> dclk->shift;
>>>>    	val &= clk_div_mask(dclk->width);
>>>> -	val += 1;
>>>> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
>>>> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
>>>> +
>>>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
>>>> +}
>>>> +
>>>> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
>>>> +					  unsigned long parent_rate,
>>>> +					  unsigned long rate)
>>>> +{
>>>> +	unsigned long max = clk_div_mask(dclk->width) + 1;
>>>> +	unsigned long val;
>>>> +
>>>> +	if (rate > parent_rate / 2)
>>>> +		return 1;
>>>> +
>>>> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
>>>> +
>>>> +	return clamp(val, 1UL, max);
>>>>    }
>>>>    
>>>>    static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>>>>    					struct clk_rate_request *req)
>>>>    {
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
>>>> -				      CLK_DIVIDER_ROUND_CLOSEST);
>>>> +	if (!req->rate)
>>>> +		return -EINVAL;
>>>> +
>>>> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
>>>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
>>> Rate propagation support is lost with this.
>> Thanks for the review.
>> On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider
>> is exactly 2 * (val + 1), so the regular divider covers it. The
>> dedicated driver is not needed. You're also right that my
>> determine_rate() lost rate propagation, because it never forwarded the
>> request to the parent the way divider_determine_rate() does.
>> I tested the regular divider on hardware. That showed a separate problem
>> in the existing clock tree. The mux parents are declared with .fw_name
>> only, but the controller node has no clock-names, so the lookup fails.
>> sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up
>> as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns
>> early without writing the divider register. That hid the real behaviour
>> of the divider.
>> So I will drop this series and send a new series that:
>> 1. fixes the parent lookup in the clock tree, and
>> 2. switches the ADC divider to the regular divider and removes the
>> dedicated driver together with the unused mask_bit parameter.
> Have you looked at this series ?
>
> https://lore.kernel.org/all/20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com/
>
> It does address several problems the existing driver has when it comes to
> parents and incorrect usage of .fw.name
>
> Please sync with Miquel on this.
I tested v8 on an MA35D1 board
This fixes the same problem I found, so I am dropping my own patch. Once 
this series lands, I will send a follow-up that switches the ADC divider 
to the generic divider.
Thanks!
>
