Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261771;
	b=GwAGr1MDFNYVNCvVGr6ALmsUZnhAMvK9y5fz6xWvfGfx3J6yCTKIth3Co1c2dkk1mGy/
	 g+0aiYtXhezQAZFoMEIR9pAZSqHTFVp7DnqxSBqjqhpX7vFJjiHxvrK4PvjlP+Y7QehyI
	 hqBU4PSuUxOw611Lx43HC8kJZ/VJQOR7i9gKhoAczcKHu2X7d6/mc2rzoszk0dQPGJp15
	 6hwx+V7w3oT3bE9KN7jlC9wv4YYoSsE5kWx/UpAoDkIWbplYa5Lmdk5soOlHPOIux87lV
	 U7LW4hfPSz2n1+OhO2eKgUb9laMkfH/CQE8SXZQN+eQ9ASmUJp6xwzUpA6p6yXk68nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
	b=t0+btxFY2iF55HTH18hq3pAiWsWDseAwc4u56/IB4kmtQ4PeG0vICUf18bqq/h2s/itC
	 pQwMjYd1ct2GEQBiSCtXqXj8T2lkV3sXAHyAbVKLEods0IA2PM8HrCFRTCiNI7dwhQ/JS
	 yjNE6yQA8gfHX69wAHj8/QCHU7JgFCbCb2BrLhI6k4KCbNLppDfNhiW2HKxJgTFDByptl
	 IjKNEi61DxeMW/aAAxB3/LQurkAUZ/B1Zau3o9bFGoldgBcl79XCcAX9r04tUvX9c1zXL
	 N687M8+qpOqsRXUJ7BBzDm6XERu123WrKxo2qFZoZWTx9/xo8xI/Xi0SyEH7KtLV7kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802E606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5802E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhVm3V42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16200745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261769; x=1793866569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=DhVm3V425hO9R9e8v+hQASAIDN4E8dzPnfNKYpbAAL7Ry3mgMhwOniEIFT/py07BqQ
         m0ZtiB5OLL4rCQR/ufb209Q+iGKxHsBvmZRFAmMnCJ5h6lpT2E89H/76AVFv/bp4350y
         EqXighxV5+Hx9qgc092i46RZDp2oBfhcbgksBYsmdBLOxLCoMKK1rdFeuyUQNSg5kq34
         vnap7Z8XnXGepqbO7ixR+t5k9vJ9+rf5FAcT+TzoIYSobtYBU7fLvkepEouzWVO6WL7m
         UItEvzDA+2I9Ee269dKArN11nkinerJ2Ij/Rkztimsx4mnBO/aH/KyU6UU7LHUb6ZohN
         4Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261769; x=1793866569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKwHsBgWsnYwW2gL1FVzWYClyycwT4ewUl/GuVtdUlo=;
        b=VEzwwrqpD6oD39ODSwLHarjXB5LZwSr9ipOmvwidthI6Q0DH9bwS4O3E+G7ny+Dzwx
         HlPWR5SEiIhKl+VANJosyiTtpBcZtWu1VBeSzsRPujdMPJIJ8p2FpZQdh9VZj2QwAgFw
         U7td3PTYVNTvVHOKNakbwuNubhi1umwoSniesJbclE2NxPjZBsElNHAReE3DP8yNXIxq
         2TP3pJEr1kZBhnjDFbU7+Rs0P4u0Sir/JaQACVIRmKnvqj8syx6Tvs5K1dBFhQiepFNz
         KdkQmXrdTFPCC/wsmzgog69O1chn0N7FJ2eqWJY9ChytMmTKB0vP2l1AHZzigQFryCJk
         LfpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlG5D56nPH4IDhu0TJUSl12b88kCcX3zaaSlpL4HnyWCQLYQ/HBCJT7KYTPsO5Asiu6Sgw8ZSgnfARaHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBYaTMJZKLpqzGm/lsgckmPCec3WJ5nWfm3adgG0mU39oJgPg6
	rEZJGk04Efzs11sIh3ZgFVjo0w4xJn3RL4WerX5pXkOm4oOM6cIj3Gsj
X-Gm-Gg: AYBFou19DkoiHw4Wqx3ll/Xol/9hdG5xZP1O3RH26xTHmqi+9yEtkQqvbacy88Exxym
	G1wub/hX7GShqd6hJR46UzzBFKpvKvOpZPIUjnoW5WivVFHmeZIRpQxaFJzlaroNWDMjUTAwoLD
	CoU77ooIEAxu9vUVh27AGDPjApYyNWyiqZlmisoZYqPU6TzBbLarF27VzrucLhnJlW86h3NIRpj
	Gpgyi93H+xlJhXuWiTa0eMQneSPQ1qqwpjDd3f3YUNARe3oHBNvbiynjNw9cWohOPJXaRJy2LY4
	G8rLschOrD9vmBalHscrqGVc8wq13Zn6ZdjRcOap5ARvApTsnaWrPEyBBMkLRcGey49s3TRXNKZ
	rZfKiERLLFUF38dFxPrZdI0GDTqGbKSv9FixKIZiwKXDyZ76d0YOx9gl5tqYCoyvVNPe+w2sxnq
	xd0c85HCdf7o3O6m3euef+Agmzj2CNOTK2sPay92W4vw1GaI47AbwdE9k6gOzVYABKFligajQ7V
	txPSA0vPLW9XygGXyyXqBWYlDfxAwIK3VIGmozigMdX67tiJ72OnzOwtUM/Hjeibv8vWX/V5Pet
	yVVJXHpR2fnMB+JfJuAsk4JAVGSshND/+EYTJXXzcaMWN/TYv9yv8fTRiNkuKX2SrXDa
X-Received: by 2002:a05:600d:8496:20b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a9b1434621mr59499955e9.33.1793261768411;
        Thu, 29 Oct 2026 01:16:08 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm70001885e9.3.2026.10.29.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:16:07 -0700 (PDT)
Message-ID: <974845a6-16bf-41ad-932b-244112b85cae@gmail.com>
Date: Thu, 29 Oct 2026 09:16:05 +0100
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
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
 <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 10. 27. 19:24 keltezéssel, Taniya Das írta:
> 
> 
> On 10/27/2026 11:35 PM, Gabor Juhos wrote:
>> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> removed validating of the frequency table entry pointer returned by the
>> qcom_find_freq() or the qcom_find_freq_floor() functions.
>>
>> Since both functions can return NULL and the pointer is passed directly
>> to the __clk_rcg2_configure() function where it gets dereferenced
>> unconditionally, it could cause a panic.
>>
>> Restore the sanity check removed by the mentioned commit in order to avoid
>> a possible NULL pointer dereference.
>>
>> Compile tested only.
>>
>> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index d7914e59129f..260e90f53461 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>>  		return -EINVAL;
>>  	}
>>  
>> +	if (!f)
>> +		return -EINVAL;
>> +
> 
> Normally, the CCF calls .determine_rate before .set_rate. The floor
> determination helper already rejects a request below the lowest supported
>  frequency:
> 
>  ```c
>    if (!f)
>       return -EINVAL;
>  ```
> 
> So an ordinary clk_set_rate() request below the table minimum should
> fail during rate determination and typically not reach
>  __clk_rcg2_shared_set_rate().
> 
> 

Thank you for the explanation, it makes sense.
In this case, we don't need the patch.

Regards,
Gabor

