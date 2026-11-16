Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820020;
	b=tsGuuAiMS7qykgnLgvs6tJJAR4Y/mnVWJpEvig0tLqE66j6AEDWcOevd+zGoB6pO9lkS
	 adXld6yXtD0zInir1yD3WdTlaZw6SLngU/uVBKLyj19LLSUgV/ohYVBdWLyAtnS0RKzsX
	 XwkKr6kTK/MH1226JQJelqEKEkidlIurdvrzLRCjbeYfbRq2DD9OvMskg8ZU+9xM+DiKV
	 heJU4scOu7HfQRrjjKalBZpmw/omEkYemtS1Z4EZc1dLN/yU7zwnzU1EmtCvdaq76dRHY
	 +9cxWHWGg9Fxn3NA8pG/7VpsXO1Bcw3x7+Szx5d8mbVIlDmjsfn4Ifp4vj8qoPzIxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
	b=VBgW34jsLtiZLhEZ73EuuIjHElZAoQ4T6Bi7MNgAowotXerbZHBsGaMEaZSaGsZAkGR0
	 v9+FD8gpnWp4ShlPR/L1SurHEVY5yMYxIlsFIDoZOFZfmp6FRjnawFtUjcjImeJfFic77
	 pcXw62gIsc27tQOhAIrXFkCKa6smgsojTgkamoOiin+mMuNZeAEYMypQothvT+fbNM8Ls
	 V13NMjN21WDnipQ+yhZqRmKaFd1HI0/U/sKBUs1SKe1WVUS6liezxYNSZ88hPuHqv2yat
	 hI+ff9QHKQXA3zah3+7SDAhbxPkU6r6ZxMVIjWwuc1OlbS9bq/qEqsr7NUaZ3DyVDKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC383606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC383606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAzVbDoR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so2415005e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794820018; x=1795424818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=DAzVbDoROMuDExMfbuvnxK3ei/jkVt8al+uAvr4lNOIokGBrEO444rzMqWh0q3/iIY
         tFEcJuyGjmeaz0oG20AVeJ3eRs1gNe6Yr05Wquy7BWCPz6y6VbrNrESt2jp6R4TTGPt6
         GKNhbEJR2Js7q4oDE02vFaVtCEM4CRSTXmeoc3Hy1l7b3pwXEgtogazICUxxxmHsIb/V
         Adqxz77ChXrsNZQ0Yh7kqFI7dqKgZSb5C7oczrJpZrMcnwJHNjllH5AJ71p21kh940E3
         f1pQXQJXDhvZZU9/Bo2APo1Yl0TFcArez+faJ2ArKW2cwTAfvYQL/y5XFa/JMVyuOCP1
         JrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820018; x=1795424818;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPNREIjj9knt3gYGg6EWPyTlBSAtS4PfYhpsUKGy3y0=;
        b=gH9SmM4eScx/nEUvj0jl9MsQhjzULwoOHMM336jEElKkjHznfuSFh3AoVF8LHJsEkS
         TvI39nb2aSFqNSQEdAhFFJ9xKHyZGhp2RJMTYXIWvDC2+zydY3ezngGSc5S6bPyNWySV
         NBWXmG5BDAiVzXZ0+TXhLIyn/wB7QBO7l/9l+3enf41hL6qefqbjylN5b2/ew+fJsp+s
         SgYFyA1PZlg2ugH/RpmXyWd9CLgiDhxaYh5b48QFVge+o2nR5FjjyPQ5/M42dazr9ooV
         MgMRQXTs1RSD71U+t0GuS/UfEz61Umt7dwdSnSveE2CmLduhv8btkX54iEat6BbDEkfe
         Pq/Q==
X-Forwarded-Encrypted: i=1; AL+hErERK++jjn52wleGZfRfZJWkA5nAciKs1OB/Rso95cinvWQQFZinucHuGHOw/zURz+dDXpP4Hl2KwaVwA9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K5s2bSnAkb8fzc8LbsXc3rQfdKieOKLARR2ReLMHcX+d81ApA
	YbXvTVqwc8CkP0CmUmvPAw6L7pvdZ4+9MH8yLI4YI2F0Twu8MN/ZLPyX
X-Gm-Gg: AYBFou3t+Ul6rNPAR1lx3Z0zL1g2epk+W0GWxXCFCzGHjPRZOnoTuljCaTR6TLRloZv
	ht0ZLhqKERMfQzSfoCJ/LT3OAsHp16UnJpO+1S33Qy/w9LdeNGNi3GQDlyW+Dfo1+J5JBlkpv7H
	0ydnQWkQVUBxJJWghxhDNQec96q4cIRrH50rU7NMPSbyKL7RSWv1XAJ3P5IohvlfMkFRhsNHUI1
	a9zSTNbbHfGCGjYIitD/TX/tGVYhWqRU7e1Fv1XDM7h2ztSPORlas5DL1s0F+l4B6y8uTlNmW6Q
	SBvgcD2Wteu25hIJ5fKInGV/8SELG39OapWBsjtEeJapii1M6/a82cArRiApWf7OO6UwCf3RAlz
	6M6r4vDFRKvusf3Xy3Wc/T64I4v7sCRurhttvQUINzSFT356kCLZTW+iFgq+LWkdX8DD+lF+Qvy
	ZGxJFoIdA9PMrQ3KCWZ9hNI4qKu2L+ZEzUx8mK0gjsuKwEvA33LBQg2VsVcXCau2btyf26Yxj8O
	dMgS7Trf5zc9w9zwAqrqOEPgNEkm5AAmNY1r+sY4sQjwe6Qj9NZrL6IJdDr6eeiXwCaWZiod+Dn
	N3TOZX2+vzsxjirUqvggZ/RZu7TDcNDE1P3UXWBoRgfE9BhHUUEXh0RcIW6Ecoi8XgF3MbHIZkl
	ig0k4dF+B2GT3pdEo7ho5vbYum+0oBBfp9sKcOU2AjrSFk54n7jcbfntjm//4WsulV8h6QjI0Ny
	Bf6dyIf5Yniv1QbOAUFaTnBLuh5RYA8eNhYhPcrj5EMR3z6jOxbcSM
X-Received: by 2002:a05:600c:224b:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb5ad95277mr147508915e9.0.1794820018021;
        Mon, 16 Nov 2026 01:06:58 -0800 (PST)
Received: from ?IPV6:2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad? (dynamic-2a02-3100-5ad0-78fc-2c93-94c5-21ea-75ad.310.pool.telefonica.de. [2a02:3100:5ad0:78fc:2c93:94c5:21ea:75ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm81554075e9.13.2026.11.16.01.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:06:57 -0800 (PST)
Message-ID: <79f022a7-6f49-4794-9dbe-4774cc50e1f7@gmail.com>
Date: Mon, 16 Nov 2026 10:06:55 +0100
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
Subject: Re: [PATCH net v9 3/4] net: hsr: segment GSO before per-frame
 forwarding
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch,
 shuah@kernel.org, kees@kernel.org, petr.wozniak@gmail.com,
 qingfang.deng@linux.dev, fmaurer@redhat.com, luka.gejak@linux.dev,
 xiaoliang.yang_1@nxp.com, skhawaja@google.com, liuhangbin@gmail.com,
 stable@vger.kernel.org, sdf.kernel@gmail.com, lukma@denx.de,
 fmancera@suse.de, danishanwar@ti.com, richardcochran@gmail.com
References: <20261112153333.20-1-xiexinet@gmail.com>
 <20261112153333.20-4-xiexinet@gmail.com>
 <20261115214108.UmIyEJ8I@linutronix.de>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20261115214108.UmIyEJ8I@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2026 22:41, Sebastian Andrzej Siewior wrote:
> Should you repost:
> 
> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 9aefc5f0249f6..5e49f2bb9e39b 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -940,11 +940,9 @@ void hsr_forward_input(struct sk_buff *skb, struct hsr_port *port)
>  		goto drop;
>  
>  	consume_skb(skb);
> -	while (segs) {
> -		next = segs->next;
> -		segs->next = NULL;
> +	skb_list_walk_safe(segs, segs, next) {
> +		skb_mark_not_on_list(segs);
>  		hsr_forward_frame(segs, port);
> -		segs = next;
>  	}
>  	return;
>  
> 
> Sebastian
Thanks for the review. I will switch the loop to skb_list_walk_safe()
and skb_mark_not_on_list() if the series needs a repost.

-- 
Xin
