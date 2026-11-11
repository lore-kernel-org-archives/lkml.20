Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364894;
	b=tUNV4O2er1oXM/8zpnItFukL7J+aKPHOQ1YXk9xDg6lyaEOh1DS/VsQ3JdcPFZizG1Ev
	 JB6eZ1KN1dCHp+BA7G7lw7pbOTf9kaJ+T07PZV7cIhdtG0HI+r1d3sTF5wOATCGnSCota
	 s7MxucpWovBSXGU+ooqLlWhy4NPCOkh4hiravC5f1clYVWjs8MLt+TfLUOaRmCr6XdfvD
	 jDQQCgJac7TlDiLqF2WMRuwlYSVO4S1l8FacMccuVxbm5gv6IwExWMkTgiQcZvG1V4BMb
	 355qgw4NDOtGZO+ejCqkgVjG6T+3/y31F8ApH99Jh/q4Zs6omdBuhBruB3ihGWvvSfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
	b=BdjI2scSudXlrmslAWo3IXzZBhsy0qkZEEXZjEG9isYOWg5XikTrIDptmXiTzflBKGle
	 rBNUcbySTYETopZJ/0OXD0Ylq8LNvIJ/9ERVbf37fF8iYXsNf/gMnDjzF70aAhDY+5Tzn
	 uhE85kYsEDOJ2w28tFtNYwlyXO+jfVxOrg7PRiob68ixsZMAa9nvSdK5mpviyEdL7GySO
	 x5jX+tANuLmDBQX0yJQ5G0n2nt9f1bB4knNw4EUWFgirztqny7UG8H2mLHgnLz5j93YRU
	 iUaNCQ1Ksu+uJ11LiT2A36RAjQlhA7nZiNDGvz1QESBDECDG3qT/V5KCWv/sWKjocOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRbViOOG;
	arc=none smtp.remote-ip=74.125.231.192
Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E819606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E819606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRbViOOG
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-533fe730856so1176786b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364893; x=1794969693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=TRbViOOG+d+KnW57hNMnno+FObEseGK1T1Sz7XtD3YRv8lPHsWa/mMtLbYv2OgUuo1
         jK5lDQpG4B7++kUCkYqpYV4nFZTOlo3klaQTrsZRcSwSb/M1Z/mM0Hw91/T8Y48z7Aku
         mc/TMaFu1wBflSz0qT9vLMHOiriZ7a0/gk2+WPJcyRL0qTi+q9FajMRnks7KwDsvZu49
         x1ASNjqxJQibTdOQFhx7kY41TRMpzZP5fINHVt589jU2O2gxmcMUGpUkm057Bu/mcFtW
         iexy7LGNTQS6cVdTU3r3inbqxQ6uyrYJYKt3p1bv1uksSUzo3p3x9bgmPyjqRcuEQ+/t
         9cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364893; x=1794969693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=Dw6TQItZumpGGJfcUYn7BMy4TOk8elD9KhlrD5Zdc+F57QhiKLPSXRRiM1TIVq92Y8
         cED8S6cZNBi05WElEOMNGn7dMQp7rNF9BlrRgzZfYQfsPoK1FhxfeQq/ERYUtcCgtg0L
         BEwOC34rvJG06t63dkOLRLe2Cynss8BBgdYsOVEnurLSxgXCMs+e9JRZl6PZ+6w3JzX8
         SOdbChN7D+A/APIuZfAKjcjzD/09HWtTZD1dBc1p1AIuT6phh6w4vE8XOFUwHYBz4YBA
         ojnQRzGlGKomECvbrFv5ORz/vD249LMAKkiEhA508i4yxUTiaWS+742unfGdSREJIW28
         2hgw==
X-Gm-Message-State: APuU4Z+LApsdGARhvZpqPQIJAb3vEYf1B07kiCK7AtYNKS5JjxY6nCrc
	wJ6vcWg6z8np1JwBWzeecLdmk/JY2ny/DjMjhDxe50tu4L9rCKQgiLoXrH919HJ5JJ592A==
X-Gm-Gg: AYBFou2mHgEnoo98H8IC+m1/x+W46zdKMXelXOguZ4ZHZGIkhrmcW8RFq+9Oj7107vD
	K27APA44UusbhoEydIA78f0N/ch2CyFT6kna3BaHXfPYHR1yWI/aWHJgiuCBz4W9W9JeUvzfXJb
	MQnK9rYB4ewc/n+DYBPdfqvY6lx+ERJcQn+Ds5/7DGvwmWep7pk6ImJSXIm4xyzlfHvhZdFV1+N
	5qzZuHvbZ8yde1C76Fb6ze1LMKxJTt1ceRMZKq7ivg7dt4ITHeY8R0cRVS/Pb0UJSZmN8WjrP62
	3y1jnFaj55/6kOtPuJsPI9ZbLXZ2hqql38n1O6woVY1HCt5YF8Kz4P/z5CPxa60ZsLJTs+ww6sF
	7ost6MH0VT26FBnnMXCJciwS2w8aKWRNvH5jgdNmCodczdljbvquVtX2clI9gsxMoiXkSFEuxdr
	tYndPVc9ZXgSHekZCt0z1JfuWQ1ufyhK9DC0RY0tLBEyf8o5qjcd8IQTRd+/IZx4J1J5dCsNm3z
	RGoeY3ccuvt0cpyoUkReAaWtZyWwjqFCrDtQrCamVvsIflKHNfZB1XM/IPaevYrm+NDuowzTSH3
	K/h0z/KHI2rd3Aods71J5R+eX+mp6+LsorL0CEl8rddhYw==
X-Received: by 2002:a05:6808:c123:b0:4d5:291b:b850 with SMTP id 5614622812f47-56b9770f25emr830098b6e.54.1794364892987;
        Tue, 10 Nov 2026 18:41:32 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm3857157b6e.8.2026.11.10.18.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:41:31 -0800 (PST)
Message-ID: <a5fe0bb0-547b-48a6-95d8-6132df7f4192@gmail.com>
Date: Tue, 10 Nov 2026 20:41:30 -0600
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
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 5:17 PM, Ryan Brue wrote:
> [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq before registering
> [...]
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;

Hi Daniel and Thomas,

Could this go in through timers/urgent for a 7.4-rc? The regression come 
in with 7.4-rc1 (7a097aba7255), and on MT8173 boards with PSCI CPU idle 
it hangs about half of all boots: 20 of 40 here, and Chen-Yu sees it on 
Hana as well. It now has Reviewed-by tags from Chen-Yu, Angelo, and 
Luca, and Tested-by tags from Chen-Yu (MT8173) and Luca (MT8167).
