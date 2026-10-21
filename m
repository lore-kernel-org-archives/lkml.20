Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553732;
	b=l+EEvcHdYrVdMvKJmfNe8RFWm/gCgyeeu0SJ9nnMVHC+qyMCQbrhxCWDec6z3mTtM+k/
	 Qj5v8WXEgjQVI0M9mfHPZxPiqRkzEB4R2gK9ayrhoCi3ak9CWMt1xyW7nO7t62F7vwbo8
	 /Oo6zNvBCxZGsCWzEwR5oTAJ7hieV+zGgz47MXHVC5hyCXduimOV+E+xDivioZcBzMICJ
	 TR7W9/ABuhm7oijrsE0asCiqfkKGbWDuEW4EOx8u/9JhwIFwvlV7UojxH5Oq/ZaA+FqrW
	 7CTX6/GZHfQF/6ap4KY58V2+81oyr/u60JjWjrkpvfpbs6GDtzrDTv7Wl8SaaOdreWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oPLe3JqMkwYhFYfTROnA/4YF+cUNwjTAHP+fO6fqRl4=;
	b=jSnAjahj2rmTwDecurJV/SMhdzSnrgP4o43u9+2vgULbV6Fjhzjjv6kx/OlrH//Oehjr
	 AN45O+xXfMxOtJZB+OZZRsINAkd9SfHBlnHmp4xmhd8gmvvoVispS/oGGxFMajg484kKB
	 416nfifNKXwkWqREyBeSeYtqv/gq/YTCInxP4e+AMZ9KQFLiJ9T3XZg/xuAF6H4lTQmvf
	 kcQ0cGvNqVFoXu9HHuGep6Z9tHvYnFkHCV5jls4JAGoTojywHN2h364tSAEFiDiUlCc7O
	 bL5wBX0qvJ9iilr6ydTp3IvJSp0X8SNenJwYTrCiNelemT1i5/XT2+eQgTvR8FEQ/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TVpIvV4n;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD4606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DD4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TVpIvV4n
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5350e757063so171891cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792553730; x=1793158530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPLe3JqMkwYhFYfTROnA/4YF+cUNwjTAHP+fO6fqRl4=;
        b=TVpIvV4nlJDTXMxKun41kRC7eXRkav02KYDYRyX/LvrY7eBqI5T5cJXj37c1DndobH
         tjZq4JEpHfW/TqMqCJuraJkUf+T5mEGgF8YaqS4YjZ+/iyyZZjURaU7R5yrFBSDswETB
         4a9cKq4vIcn4KeXk0tk8GzpZ54x2CJfggRatQobDXg0f4qzPblbYPG/7vdhDnxJgnGoB
         XRDbrhuG+QJ5AgUoy2+rUBxHCNDlinTFset/cqzuSFRvdgf2WfxVC9jU+BhJ5FWKy0d2
         9oifpUC5fdq+1d2Zq/RTfUreRrJ9CDsm/5zGzYM7/FpsER3cN9O9FtYzQeLTDCga48Y4
         CRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553730; x=1793158530;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPLe3JqMkwYhFYfTROnA/4YF+cUNwjTAHP+fO6fqRl4=;
        b=YcJ8gUOUZKpRXMWY9KMu9mt57y59bWo6QPEUwZ8nDoWq01YHAS8bGVidaCSCnvNtaD
         W2tRPKcqJ+bB6rwcfxFL/yTA1rddSYDDMs0eNkFo0B+je9a1GqiRDvW46aXSuTcKZozu
         x2TBS+fBCc5JyYlEAHA+KYCvu7uyna3H3BRWy/4B1IOF02j1DLn056j80/v8vnUmLEEe
         wpIu77CuaRvZOIs0plw/UUrBtvzaToJkmLSuXC8nVO5pw7jnAbPvNqvbtClhCD4ZetTi
         yMD7t6XDgZpS/AxXjZpDfLzdCU6/LCpCQNYGEr0mtoU2x7G+S6xN/T6VTTFEP5Re6r3C
         uCCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxMbvEkvBGGnv6moPEpHgck4h5Q2Kym7WB8/9MbIXsOVn+7jGzj/t4EkJdTThZQvu0vgRkJTTA4negAUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTVYk8DYvDeyQZ2XIO/VgdcEtdJXX4ngynOJOzjjCsCWyT9P7o
	4PeBdeP9rE0GIzwVXyuimvsEUNsTEsvIFAIgSnl4ZLrKiyuEVDo5aahNY7ZRiw==
X-Gm-Gg: AYBFou1Yj5LAHJHV2Saq8aPu5ZYDjSZ7rsKwfkdpPJUvnncJGPmZ+PBqKl0Dh+tygk5
	pFvbUXpap2IrHQTNWrIk2HWX94jlbGiZN20DgFkKSrSsilI+gLp9NNT+GMc3alMj7IXKYS71hWp
	C5ltAyyOnCTHclBEcBWee/75lzeAKgusSEsuDe6Zt+eLXwtjz6DgXpVyUsQ6rwLWInvwCX3A+Nx
	r42i2+T6/eUhPrUsLDspQxvkBePmcFJVLXWZ5muwUMFJ+ra1+IQsROzKgPE6Va4r0IScns7cVjo
	+bOJ1sLBUIC68Cn8XUHfCGTQGGMwdfdJ3s0iJD+2VwXs5J80Qun+kP3DoSEIKGz0wHqHSO5rJdg
	DBIpkbSPL471fUTVbJw/5LFY20lwmYCCOQdXyARtQpdAWiMxGad/DEBcLVBmxs5oFk5+/T1Z84n
	GrIlp5OWIy6fZF0wbU9jGLbPZ35B8ct2fI3lG71Imcyo1nfQvTWnThUconmzJqMRno99IWu1+bN
	7gIrIFoXhVh2G3k7ejvY2ZJgrOcUiqooAhsYESFEzi21Aeq2rgc7e/LXd8t+QLmdm2YYK/G3N21
	nWeiMQkJvvwSLFjS0EEeZnex
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr253545085a.0.1792553730527;
        Tue, 20 Oct 2026 20:35:30 -0700 (PDT)
Received: from ?IPV6:2600:4040:498b:e200:2d8:61ff:fe7c:5d59? ([2600:4040:498b:e200:2d8:61ff:fe7c:5d59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98e5asm144819385a.7.2026.10.20.20.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:35:29 -0700 (PDT)
Message-ID: <3a043f5a-9ff3-e22c-08ca-0a735b45b025@gmail.com>
Date: Tue, 20 Oct 2026 23:35:29 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net v2] net: sunhme: fix infinite loop in
 unmap_partial_tx_skb()
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Denis Arefev <arefev@swemel.ru>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
References: <20261015114355.14906-1-arefev@swemel.ru>
 <20261020124001.655104c9@kernel.org>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20261020124001.655104c9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 15:40, Jakub Kicinski wrote:
> On Thu, 15 Oct 2026 14:43:54 +0300 Denis Arefev wrote:
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> We don't take LLM fixes for ancient HW drivers

FWIW this does appear to be a real infinite loop. There's nothing
in the body that modifies the variables used in the condition. Based
on the original commit, the testing probably did not actually involve
exercising this function. I suppose no one has complained about this
for the same reason no one complained about unhandled DMA mapping
errors (DMA mapping mostly succeeds).

[1] https://lore.kernel.org/netdev/20141031.134354.207893264084946385.davem@davemloft.net/
