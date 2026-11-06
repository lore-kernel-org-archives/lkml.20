Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961909;
	b=UoLxNMrj9t/N0SwFEupZR230LPGj/Q0wAQlbdMtpCA32mxa1nb8o2X25e/8xTQZ07bWI
	 mfEP10fdYLeZC2Ware2kbe37He/Q8tYxeRi8/aAy6La76p7D39yCnh5ylxD2ddIvG52fq
	 S29ecVP8uX/IDioBCBbiKyLXTVtm0MWwcw7rwIkYZziad5MJQxsT0qpDk13aFZaBqi9Kn
	 52Z7PyUZkP44HV/UWnzKdLsDygdSUO2nb569JZloV2G7B5mWXy9Xq1s0IdJGcDhLVU1qc
	 cQtKwoqIn2BLXwhNKfF6GDWs7z7ON0SMi9fPEPwA1C4y1/LZRN9L7QI9JT7thNLnpiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
	b=z29cggOXMUbE5E97P1nWTPkVLLijVY8/+MBKZS4ImkTxESXPvj/Gf8Eq7IF43Z9X6Jvz
	 bCyy+bP9w9yyi87UL4I83/w4hx/KnrLrmt80XZum1auXrmdTW/Jl0hJYIqW8HBcoqnyfp
	 3mOwRFLJ039l1zoqZAnLgX/16PZfcyVMnoM8qu06jySxjqXWuIFOnL/Gc0IPT8SaeKCF/
	 esZ6Bp8MBbxNWeyIV85EhsTZ3L0yQ8vdgXdPy0o294tv7ygG8MLecRv/ZGVO2LqPsiWo1
	 iUlB8nv/wOVsrfTRcJ1s/NA9Y55u3euwRmi6ILQzGU9BEO67xmhcENjAH1mk3kKph8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFP2w+V4;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD7606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76AD7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFP2w+V4
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ed408b0d0bso3264375ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793961909; x=1794566709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=IFP2w+V4jns0t4yYEy5GFCJrNcp9y71ad7pD++ZnOBHlKQctT+UyUxQcBDU8YViV9j
         X4tmcb9ziENv/Bh7ir1qwdPfx9lTPXVZuB80HluQdBaN1r6aUl/6w4yYW5XjHJ9rw39y
         ZRtowgsbzWkN9mCY6/oSPlcbeOQU0AHomUMjfv2CiGDrDjRPqoNTdI8FaYoLTYdFP2Ak
         pzJAb/tt1X8tiZPYDImwjmPM8LkuYnshYIk8EgHCP/brvCh88/KWcua0BvQfMUeVsvjE
         MtXSiqoew+qkr9lx3NZ/laHEBoEW7mzhGQXLEPzy+D2GXEERDkhEcjQxUoJilQsctZex
         rlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961909; x=1794566709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=1dQ0eh5Zeq7ObGpVKpwSbWO62l7ZYHfoz3DAEkNfPbiMVargJIRr+p33VR82G8qF/K
         2UZB4Qi3D9X4W8JpoSOw5gOXdXZNeWFE7QnUUu0bFJ6xwDS2WGv0QGccM3MgP4XY/T2h
         ZpVmFpn5qfVHrymVXAMKtO0Xq7hUTNk1Eczk7bMfe4CogfgTynQam3ZP4QCOtIZxHfED
         1hLOpBo4cLGadq/rYugKqITlItds5YkpJZEjaV4tTjauUmmu5TJDQk9s8TsPP9CKNL50
         Ufp8pqu6YRyrD42VlasTLnyxWdjSJNWPxcHixDjmVHnw+sscpW4EgjCnhAQAGjpSjhm0
         BoRQ==
X-Forwarded-Encrypted: i=1; AL+hErEgwkxhdqO5QlmNNGRh8ksWOY9ilOghLLTvvz6HHXeRTIQJkO3BaRrZKdtJScZV4pJAngbvtHHgQwU7EDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z//OozgN1FjFcWc31jAPLvwCPgjKsk2rKpuX/l9qbps+DXNzyGx
	aNcnvfjmGAbLPj8gn+rERV9DmAB1ESDA0JR/PN1rJdgz73nzluh1G6c2
X-Gm-Gg: AYBFou1hCFO+wBqBUfqSdF/9SHPLVSgnGqKjboSSEe6L3R5Uu9FFbZPPq8ESg4ABMND
	JjSbUfa9qpLOMzwg7Vtyv0IVWXG/3fPZSAWD4rEdXgHhg2rkLgHmsoYCx6xgmMuKRjjaFoR9c1F
	G+xZyqUpBR40DL/5HawNLfE/2jtVxe//GPWKVgdflnk9vrjOmKEdC2/lERjIKftnFIrTizmn0G9
	dSchDpuddwpCszxZYt7sZwzhBUIMaeetm7TiE0ykPv1LrnY/4c3eGCspQoAnFmZNRGW3EeJosWg
	wzHY9BFHV39eEsAlmlpsVi441PtebsP7gl4v7opdeusodwaQpM8Z9BmzA/FO4bagWDFvDuO/yXq
	0KRxd9qQm1usrhopeCXD32huh2X6/2NuvGnuL1jCr//Jf6XVs0lzd0fEerIZzDmEvPrzJ3t9GU5
	GqHfcSbUpzrIwr4OnZaRJs/SGXrLoKvfAE4LK9LwpK9BLniUpXrZqALzoj0Pe8VkhOCJFUO8Z/U
	rLuCwknzieCu+TL+l9MGRcguwuxGpQOLkHGS4E/OT9aZcqmZMBHHFB5CfyxCHKTtE9ttI9HFxq2
	SEO5EAKOQyIz+gRHlfk9vEySO0Nv/w55pYxljfDST1oyGnb0hbCQg6c/3fM=
X-Received: by 2002:a17:902:da87:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2ed41bbd3d4mr26889285ad.32.1793961908564;
        Fri, 06 Nov 2026 02:45:08 -0800 (PST)
Received: from [192.168.100.182] ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8915esm4095755ad.67.2026.11.06.02.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:45:06 -0800 (PST)
Message-ID: <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
Date: Fri, 6 Nov 2026 15:44:50 +0500
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
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chukun Pan <amadeus@jmu.edu.cn>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 2:43 PM, Troy Mitchell wrote:
> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>   		return 0;
>>   	}
>>   
>> +	rtnl_lock();
>>   	emac_stop(ndev);
>> +	rtnl_unlock();
>>   
>>   	clk_disable_unprepare(priv->bus_clk);
>>   	netif_device_detach(ndev);
> This can deadlock. emac_stop() -> emac_down() calls
> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
> emac_tx_timeout_task() starts with rtnl_lock().
> 

Thanks Troy, that makes sense.

For the deadlock, I think the correct function to call is rtnl_trylock() 
inside the emac_tx_timeout_task(), which would return if the lock is 
already held and will hold the lock if it is not.

What are your thoughts on this? Does a v2 changing rtnl_lock() to 
rtnl_trylock() inside emac_tx_timeout_task() make sense?

Regards,
Ali
