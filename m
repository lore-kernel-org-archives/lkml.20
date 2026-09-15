Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11733EB0F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463235; cv=none; b=iWFNj7bmr1mdz5gUmwG78fP//N7utxQvJ55HRODX4O7Bz3Op03bDqWs8ZcZ64nx/YUzlFt0GWKMMZmKAdhYsePoq1f9ZpIBsAQkJc1O6JZq6mTgSwYWF3MEOhUDE2/A8ydD5UoJleg+bW5RjDPhWejM/WE50JCreZLkgDdCB7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463235; c=relaxed/simple;
	bh=1Ixn6DEMoNiIF8ksLqNgYneCdY1heACPqrYYbDPSwQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujKUpgk8pS6TjEyH0yqYOW0PBKUjy5Kzwm5kReICesECcXWr0ZoNOWtnqM2hDXXlaPn627XqMNtTw2PS14y9C9h0KlJCrURXYPAk8Cb6BpMZ+YUqMRaZfkWrJbakuiMspz9Cp3NLHTNHdaF7Dr+/3V/y4vdrKUlpMEdTrVgHMG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=RxvZbHRQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="RxvZbHRQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so614525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1789463232; x=1790068032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPiyjPEsT7yswVRA3kLIcDCxs15ngyuM++pTranT+60=;
        b=RxvZbHRQfqGWiQaBDv55RRzFv1kcq24tuMLQ6NlVJ/BBbfX3pnIrjP6z7O3zdWPO8K
         U+zNXKGbPUSqQUtO0x/xULkOu6kDdRpZr5t8em0vseixJlART/y8vEwdQ561bsyEFHmT
         d+u4dVCIJAV7Ggtn+Dux780UUvKvtuT48s7ha42UwP+K9wwRgf8I2N65baEic+LYY8AO
         eNK1y6Yupik3OmlmS5Zm6vBi2JX8D1bPfesbpbZvJnFOeDv4aaURQhU3xuP+D8ldGRZl
         dB4XCkuYCzcjZYjGuVF0AKdDbSojcskq7Vr7CsAz4JgCiewCdW6nA8Im3su0Ot8Q3PUL
         YFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463232; x=1790068032;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPiyjPEsT7yswVRA3kLIcDCxs15ngyuM++pTranT+60=;
        b=TX4c6D9wM8WE/HnpzfNfTviwVLsR5NGkL05RXCRz9RqpXIt7x1vKyM/RopJYo/dua1
         3lhtkzBegS16FVv+8bUVwimeMCziv+oijJ/vG41r1Pig4AlHiKG/h+dfyiB9RHsSjhCY
         FT9i/BNsV0kvOVJfDyP3gNEULJko6cFlcLRgInQgZzGznMOos/GEhFdDxd/QB4Bbb99o
         qGaDUH089V9v1oHsN+uGLM0nzRXNg/UmMm8S8izJq1UYuE8W6BPV0ZiXQOwbE72ekLof
         UORsOsCHue6/mLvNZWU7XNeK99krNIbRDfdtij+U4CB+3DfaNThTp7t+kchSFiCaX2UW
         GiZw==
X-Forwarded-Encrypted: i=1; AKwUvByhvueoyNMQQKSyqkcKYswXvkE+M7H7CejLj2hyKtJBC1fqZxOVZcB0UG9hwk8K1dasl8N7gm3GdXbRTVA=@vger.kernel.org
X-Gm-Message-State: AFuF++nZ634tZQAqtSXiMQO76/GdFLHZjRlmLdocOq7XRbKebDrnc2FE
	YSpBOeels62txsWEbH4e/99Y4AJsJOhS4K6lEW96By01FVZCbIfDnAOXqIg49THUNdM=
X-Gm-Gg: AYBFou0C5TJ3fpPDcIMEbps4V0e39At1z5dD5SPxZ6XnhTxdkVEtXZlSZ6qhC2gYNEu
	8JuOn9RsnBuNGZ41XqFegxCT0b8SRd7UHw1abV6+DXZ8L2BUBA9ez61cvPaROxzwMo4Z8R/EGzf
	db9FZE9PJ7/aJmNTNi6mziY/X2vSbLTA7+8vHR77ZLH4vUFjBiq5p4pqXvKYDQx7ApjtyJ0xFD5
	iSXVO3EBxX2H7+M/hVG3nnn12tESVSPxK9GPRVN18rZETQvc9EjCQI83YsOaMm78qVpxjrRp6j+
	6gNMpEV0vpzC3G3g64ROPv+QIVna4UwpzbLnsgqTbc6Nq6Gg5NG/ZSKWua6qK3Fs3+VYghjRoh9
	lgaQeLKH/tAIdDFU0gBLzgEfK0tWsltRbOsEWY3GMwLmVwpUkRYBIAlU29G38Z2QrhJ5DtypKFk
	YnRsnECIOu8tbZ8Lq87tdiqgQdTtOkIcjQG5YlR23DGZM6jsNUjsSAPqVy/a0u8JhW/cKrc3y6/
	O0W8L673OgkVwD1Jl9kh12N3p11Vg==
X-Received: by 2002:a05:600c:c4a2:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49e8224ff79mr4047255e9.14.1789463231501;
        Tue, 15 Sep 2026 02:07:11 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f3c0sm53539705e9.6.2026.09.15.02.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:07:11 -0700 (PDT)
Message-ID: <5720cac7-f478-40b3-b96b-d34db4d9e584@blackwall.org>
Date: Tue, 15 Sep 2026 12:07:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jussi Maki <joamaki@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>
References: <20260914-bond_slave_cnt-v4-1-d14864a39e60@kylinos.cn>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260914-bond_slave_cnt-v4-1-d14864a39e60@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 06:09, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> When bond_enslave() succeeds up to the XDP setup stage, slave_cnt is
> already incremented. If XDP setup subsequently fails, the error paths
> jump directly to err_sysfs_del, bypassing the slave_cnt decrement.
> 
> This causes slave_cnt to drift upward on each failed enslaving attempt,
> which would lead to unbalanced traffic distribution with round-robin
> mode.
> 
> Add an error out to make sure slave_cnt gets decreased correctly.
> 
> Fixes: 9e2ee5c7e7c3 ("net, bonding: Add XDP support to the bonding driver")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Changes in v4:
> - Revert to v1 version as the bond_select_active_slave() just under
>    slave_cnt increase also calls bond_update_slave_arr() (sashiko)
> - re-run all bonding selftests with debug kernel, all passed.
> - Link to v3: https://lore.kernel.org/r/20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn
> 
> Changes in v3:
> - move the slave_cnt increasement before bond_update_slave_arr() (selftest)
> - run all bonding selftests on debug kernel to make sure no regression (Jakub)
> - Link to v2: https://lore.kernel.org/r/20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn
> 
> Changes in v2:
> - move the slave_cnt increasement after XDP setup (Nikolay Aleksandrov)
> - balance-xor mode is not affected, not mention it (Nikolay Aleksandrov)
> - Link to v1: https://lore.kernel.org/r/20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn
> ---
>   drivers/net/bonding/bond_main.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

