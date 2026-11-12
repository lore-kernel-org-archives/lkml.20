Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504285;
	b=W0tTSnmefTxUF5L+AUu+BgheXob4FHpchi1wLQihYzOETJr+x8zOch2ceadyiRPGOFTV
	 IsMdF2DaVX8RpvePdK9jxYS1L8V4mVqUm/0dZG5cfsPTFAc6EQY24Qq5HZVexFwpqFcWH
	 goP8Gi6EpvCyZsdcI2cJyru0aBGXcgG/T28jKKQMt+ZdTDxrrDPdspeHSTkTJk+q6e8HO
	 LyzlnuRQTuFLitCVDE/oYsXQUGFXgqYuJxQdiJUT6+g2eG+bvswoRtY6hEw5zq0DOhbgl
	 70jQrESXcTwOvkOAlpkGiJsHCIQh9HvqI/BOuycbNkLPUSvWq6uWO82dUCJhQdtIM+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
	b=cphbf3DQ9XEEGrX+ejKQ4GDhIyiGNg2ZsxxgM8mThQ/t7NHTig9FZxkx7h1pL21MI02i
	 cJJrOlGPcfP+CWR9rUG6FTV4ulE8wMd9/8yNsWbtrwakpbmZts1a9EJaBHwJVben1zHoh
	 yBWF5vcq1A2k8c/52xcmdJ7BF1asLKvxtKoyI3A4ArxByb7BbXjg+R4tLiwHO8Z6b7WC2
	 sFK7TLyjmDQ5OOqeCQ28NoSIm0yJUWOl2dk8ujQJTJMe8s4nPismxEM4q/v7yLwFlaPc6
	 i0iKqWgu8TwxLyWeN4Z5Z6sSyxfHWU7sLz+6tFnMea0Zc7+OgrA9HGBk6BH4X6GIOdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jkq4Sq6O;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B0606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jkq4Sq6O
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso384515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794504283; x=1795109083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
        b=Jkq4Sq6OAnX2Pn8crvoZY/dPHwNqhLbPwejc697m552ymFXmCwb8mgSJDNjoHBJSfW
         tIFzq9E9UMQ6Zrz5YL6hqU4SGwxC9vY4m2Q9YTa1cMiceV1fi27oJIy2zDMhS9AXHfr3
         PCUGfo6dENOKRHACcC/dhXJw6byn0SPI3uAmx+PVYV10g3Ht093LpdeyDCRKpKdML7L1
         H49jcbL+vdUyoDN5a5X0cMQMvvSsH42atYkcQekL9cRQf8o03fJXv0bPYUM81xlIFenN
         LILZhm8+RVEO5xBVnA1JR379R1QuIflz96BYL+YRxcfupaJQlf8SQ1pQQe91Nhb42iAQ
         iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794504283; x=1795109083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63GqtMOoRCSgTES87IYM99FUWTFMCt/NCzNwfnUy7NQ=;
        b=XAe8WLRjlXYpJ7Copz44y+JSlY4XjIx7msT7IJqLjEzh/ytI36OG/H78RxttY1qc/6
         tmfH8WO+DdvOGFiCy535i7V+LqlPLhdsILJMqXRGhJ+QlcVooiHvRpiswrr4sKrYNSVE
         GC7DL8vu2ZLZtBM2I4mjuJs1hTjwfawJQDLUB/P2HdZv4AoJPLXv2/HvV1S9TQlb8Lxs
         pXgyd1qlhJnZkFQepWiuNQ65oWg8LSb9GpwnZkvoxF6KtDaSF2OOd1euKrjS+MxGagVu
         0ens8hv5BQGnwrjZhWuswU8EmMV40P5BshrC2QzZJDwe8MLkAnYXekb4LtOJPE1Lt1/1
         5CmQ==
X-Forwarded-Encrypted: i=1; AL+hErFS29AF46/y/ftycD9MoKvdn01CPRG2DDq+tLbgec0rg4vW/7bF2HrUsOLmutY/kYjguEaJpW2PQMD7LZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z92dSNHeiL5ubmEJSY7j05Cs6y0aoXSfhgD5Yam07OvKeQEwaQ7
	9oizXl8BLzDD1zvhxDu6kcQP4Gp2skvQycho559w0lU27oyw+njFDj7Zqg6Ogi7RCfQ=
X-Gm-Gg: AYBFou0ZNXb2GA7lnNS+BTnUUDfM4AUaVsHtAf15uRyZhcdkOM75dYFOYJLrzZLbRrY
	Em3f1siOa2BLkXjoO6KozflKzm9xuS6VnL5JWkvw8hk/1h8rOR/pt9kyKXatpSCVn6WhyUaG54n
	SYkqxXKVbSuGneT+NwkQeJGEm8utNWaFOI3JeFwCkS7Nd0RrqAJ5oEoAYP3lWFbtsbmJ+g+9/KF
	kYmmB6YdckQt3hsdU0bgp0CfMtQK9vvCg+ISlGvoerhNpS1P+lz6EKh7hkZHYoKO5Sth8BVsMpx
	ZjsB7vRkCtdE506N6JzgWSKW3YsfS5F12KwrWQhLbho6iVl40uz+i27KTqE287mJ1eBx/td2nje
	IA67SdWlqcJETjvI88bc+mnNPoMxHUBgd7EiFcMkLT/l6clLc64UIV3WGseDJ9Sw1RTPpjtNNLz
	XBg3G+5YwiZGip+OP9/gw/4ihE/bLeCpGBjIUw7/zG61lPQhlQOBIOTGz77iXtbdA8nBfFOjhqm
	FU8RQSS07gv8j+ZFJBmTX685eoyjClEuAcDC340gGWjcvZ+vokGemtRVRFR+7NhzPkM8GPzVnPk
	sPA6vvprzmtm3Z5+Lh0zNW22znZFCHx94zhEOiGGt0gN1Wf23cPw01rXy/gtY0TcNCNsKAl0ZRr
	8ekv4IpcH
X-Received: by 2002:a05:600c:a46:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ba093940c2mr116502295e9.33.1794504282924;
        Thu, 12 Nov 2026 09:24:42 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21? ([2a0a:ef40:e16:1f01:b442:1e4f:d5a4:2a21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm345018f8f.52.2026.11.12.09.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:24:42 -0800 (PST)
Message-ID: <38a09248-032a-4144-9e56-6d52eef8c077@linaro.org>
Date: Thu, 12 Nov 2026 17:24:41 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: ti: fapll: Fix clock speed calculation
To: Brian Masney <masneyb@kernel.org>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Michael Turquette <mturquette@linaro.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-2-dc6bf0fabae4@linaro.org>
 <179444595968.1126566.8596406047613157255.b4-review@b4>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <179444595968.1126566.8596406047613157255.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 01:12, Brian Masney wrote:
> Hi Ettore,
> 
>> The fractional part of the divider was being treated as 1/10000000
>> whereas it is in fact 1/2^24 (1/16777216). This led to incorrect clock
>> speeds being reported when a fractional divider was in use. Correct it.
>> As well as fixing the clock speed calculation when read, also update the
>> calculation on set in a similar manner.
>>
>> Fixes: 163152cbbe32 ("clk: ti: Add support for FAPLL on dm816x")
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> Should there be a Co-Developed-By here and on the other patches?

Not sure about that. This is my patch but is being submitted by Ettore 
in a series of patches that affect the clk system. We were working 
together on a project and at times each produced patches. Ettore has 
collected together this series for submission.

>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   drivers/clk/ti/fapll.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
>> index ae2f6fed10f6..8ab9acd57b60 100644
>> --- a/drivers/clk/ti/fapll.c
>> +++ b/drivers/clk/ti/fapll.c
>> @@ -336,8 +336,8 @@ static unsigned long ti_fapll_synth_recalc_rate(struct clk_hw *hw,
>>   		v = readl_relaxed(synth->freq);
>>   		synth_int_div = (v >> 24) & 0xf;
>>   		synth_frac_div = v & 0xffffff;
>> -		synth_div_freq = (synth_int_div * 10000000) + synth_frac_div;
>> -		rate *= 10000000;
>> +		synth_div_freq = (synth_int_div * 16777216) + synth_frac_div;
>> +		rate *= 16777216;
> 
> The 16777216 magic number appears multiple times. Plugging this into my
> calculator, I see it's 1 << 24. How about adding some defines:
> 
> #define SYNTH_FRAC_DIV_BITS	24
> #define SYNTH_FRAC_DIV_SCALE	BIT(SYNTH_FRAC_DIV_BITS)

Sure, can do.

Andrew

> Brian
> 

