Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA749F127
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342145; cv=none; b=XxdhgK1rdnGFSjfFAq+ld3+aWgLeCVtEq2YJs0jCfM7VBkLMPvjq9jPuGOsa0FntYp/McVzLHUmJ8JdGfiA6Zv503C0RHAT+39wWBzZwtuVRYqXo/PjMZP7nUd2ig9nKeu+FOZgNMBSy2FMGPwZn0gg+v4AXzKlrU1J8DRch9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342145; c=relaxed/simple;
	bh=IWP0yysy+y9CebMkqYVJptEONcyqLAP7y6/myAOohqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+x+p26geG4wwXbASpnboGTYToWlGCkT6oC7x5Q9wWV8cCGpket+i/FDqcPg+3YJcg256QVhmNMJjDgsMxpsGh/tuFkxcRdt5pPYmeteCJEfgMEoMJOw81EplH4IFssP8z4kL5vRRapiWtya7Ie+gvBat06E8IkY4gMrc1hs7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnTsN+WW; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnTsN+WW"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso311116f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790342138; x=1790946938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLYsvlss9yZfm3Rai6co/hO6k5fqoif67TyIhe9Xe90=;
        b=DnTsN+WWwUBKNHapKFmkRVkw0oy1AmE1T2fxaZ6ZcP3bpOcUzN781c/9Exfr6dvgr6
         f2iQB2cs3TVWFydhXtAWz7w9wrBxfJO32285TdKjazbK9k3n9H8jn8gOXL8KHckBzJn8
         bijWHB74SfQccCXvuJafpnzNAvQ1OCuuFgI4LViUB8bERGRc1bKanJBStJFMGtHs/+uz
         YaxJ7er4RTE88+fLbBq9atm8t/BsQ3Y5mw5QR7vT7WQmDK0ssEMiAlDQ8bL1iqNIAMBY
         ULF4lXJwGhnWoNw1Y5GjQGWJhfuSFA0RLnTXzjEbKa9TCL4i0NG75nL6gFTv/2hJ47HL
         mitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342138; x=1790946938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLYsvlss9yZfm3Rai6co/hO6k5fqoif67TyIhe9Xe90=;
        b=gCHigdX0wekHEiJ7N8LY9PaQHHANFc2bI+Cy0MlptlOwrwz6xUR3iI7LR+lSjWbxd8
         Up7I0rxtuGnKVN/8bMPf4j/P75ijT/nGMrg5Cfi1QqRZ8K3qoxVpcleiLS3xEvPNGen4
         3+CVmbuz5L+yuokauG/U3qPC8N/bgXonApzzSUvFVBHQz6czuYEC8ZrxDgx6+4K8Ylm3
         s5aeB1rA1sP4/TIzGnNwu3mbBhX9W1RbQrEHChvH0qpGV8hWMj08ZVwjC/aogK6y/Xt8
         fWkdUwERXwZqsSJFIqpRleqTtxZiIkVScKzTGZOT032UMtPXrxaOss9YPKJYP5AzVjTE
         GhSw==
X-Gm-Message-State: AFuF++ksrzJ7xJUWTk6r63iOHg2IH6ofnX2fp/zPwhtcAOOtp+zG3KF7
	q/sGjkhKpkihubtfBvynijqh7BpnT3CpN9b00dxnCBKqWh0ijynijwZw
X-Gm-Gg: AYBFou2jfsx+WTAmqm9kij/iciCCS0V0/w/ZVKqCbuWa1+jx4/bszKKgUVkdCebdHci
	Bt1BSShN08Ljmhq0F4/Pkl0EL8Vo5DuW/3Dl4Pr8XKRyVD2u/5ULcysGgZ7aoKUGQQ850xFFdTE
	K6J7ldgc7F2tuzTRTMowVoAcddXWnovJiKOal5dynFPak/FBeXugX6Em+cKB3uxGzUZcMPNo3w0
	qH9CQ+I4RUdAL+uTrfFFARotEzGwI/+PiRmx697YwnaUOjmscWLeqQnn7UjeA6GaDxXJwEgrgGW
	6X1v+Q/l8mHS8T3reb5CAxiFVqIXI8BtKjbDpYBDhFy2ym/8ogbhRtcL428kELM0see1acO6KTk
	3hN6Ut3VOS7TMsriNNxdYFC6lRHa52AvqzwcB9Zfol6Wdd+cHls0ZR73T6NJklNjGYLB5sdVl/6
	+WKeQ0VqnAE2AFk0hvatJ8k3tq0CvWqynZZwDLeSB0/RQ47B3WfzfhbHR1uttu12xcmywYbtnq9
	GHdv807+uiQNw==
X-Received: by 2002:a05:6000:430c:b0:487:1c89:f158 with SMTP id ffacd0b85a97d-48871671a05mr9519994f8f.14.1790342138218;
        Fri, 25 Sep 2026 06:15:38 -0700 (PDT)
Received: from [10.50.156.4] ([23.90.153.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm7832929f8f.29.2026.09.25.06.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 06:15:37 -0700 (PDT)
Message-ID: <a5e76452-1fa1-4675-9a16-8683702ff4d0@gmail.com>
Date: Fri, 25 Sep 2026 15:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: Add gpio-locked fixed clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-2-42ab5dc3a6aa@bruker.com>
 <1j33vaesh7.fsf@starbuckisacylon.baylibre.com>
 <e697d892-fbd2-432a-b71c-8547ead22ea0@gmail.com>
 <1jtsnpcn8l.fsf@starbuckisacylon.baylibre.com>
 <39fdddbf-0fdb-40e7-9cd5-c8f857ee8b9d@gmail.com>
 <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1j8q4p8rxl.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.09.2026 13:57, Jerome Brunet wrote:
> On jeu. 17 sept. 2026 at 19:05, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> 
>> On 16.09.2026 15:57, Jerome Brunet wrote:
>>
>>>>>> +/* We can't enable the clock, but the Common Clock Framework calls only
>>>>>> + * enable() not is_enabled()
>>>>>> + */
>>>>>> +static int gpio_locked_clk_enable(struct clk_hw *hw)
>>>>>> +{
>>>>>> +	return gpio_locked_clk_is_enabled(hw);
>>>>>> +}
>>>
>>> You need to explain your problem a bit more because this is not OK. Your
>>> clock should really just provide .is_enabled() AFAICT
>>
>> When a peripheral driver uses devm_clk_get_enabled(), this is resolved
>> to clk_prepare() and clk_enable(). Neither of them check for
>> .is_enabled(). Is that a flaw in the CCF or expected behavior?
>>
> 
> .enable() does return an error on failure. It is up to the provider to
> return one or not. In your case, it will be probably be necessary to on
> the gpio a little.

I'm not sure I understand what you meant.
> Note that if the GPIO can sleep, interacting with the gpio must happen
> in prepare (think i2c gpio devices)

In other words, I should only provide prepare/unprepare instead? Do you 
think is_enabled can also be replaced by is_prepared in this case?

Slava
