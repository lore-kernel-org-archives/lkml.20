Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904504;
	b=YNesrxk48ZUbOTT3WnMYZH/lvhsGd+BAu6OttC5razUedDjo71z0hW1Q3kAD3yKUaYzd
	 OKIG9bnrZUOxxm+/w4rGzDoTbQGEcRBHXHRAzbhJg75ioljYQ4AD4Q+9B5wSpzQEsMAl5
	 IpvkQmBrWI/wh1Km9G83wFd+tw3gDk7d8tQcJX0QaQ8tmHtcz8l1qwHH0uXhQetVwGs+E
	 dcSgmVFKtuuXuPXFQ9xFHB76T33dlfsOXOluLBcPVI0LbzLFmBVEddAjiTMLIcJ3S2yHH
	 /jWP1YN8kq6Nl5r34XW9NsTJa8K0OqgYsrenI9O1wC/Ik6Y5rbX82U3hRblOmKk8Hjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904504;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9KAZFpOa4tylOS5Nw5xzUePTPvnbB87FGC6zFO/XDbM=;
	b=lhNJ88GpKwkR35DueNB1eO5vYptdH4fIJ9nT0tXyOVCQgXevaXqz6PZBnY/Sz9KQrQ9N
	 3IV9aJgFKJR9h2AecYApQDjRIxQxGHqfwwDYAqGyvaoEuKip6QQ/KfmQwgwaRA3fhQ9X2
	 sn1wIMM68jp3p8+g0hZGhqqBY/h9qCuswkQrhZbHtOOORfhxDzn3+fYEODGEXzg5gmYLJ
	 4kAVRO1Glr0fNQNVAXpE+isSLR15+A8R0BlO8u7tAIcPaM8tBjxB7lW3A1o8C8CGup2Qn
	 Bf3Vfz5R76ZJMg5q1dCBncChtQCiajEJRq/lxzQU0jF/ag4fupIpCV7u3SXnLB51Twg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mtq5ziyH;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34FA606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34FA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mtq5ziyH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hC1qvaPQfrqhp9FLOrn21Z0mMkfjkKTnJp1S1GHAOrY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794904501; v=1; x=1795509301;
 b=Mtq5ziyHRqK7hKfoYRKhRCGxCZyoH68N4IkvfLrcpqK1jPuxz9Wl7Mmjwm2yp6KIzeOshzGS
 k14gf7ADRew5nnaDK/gTPaxEn9NhJP6dvIv4ctxzNA9S4k3hOiz1Utwkp/RjP3Bq6DHNFrSak0p
 AYDv4NodJo19T93y8dSUGuro=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 055bea7900dda262;
	Tue, 17 Nov 2026 08:35:00 +0000
X-Mizu-Trace-ID: 055bea7900dda262
X-Migadu-Flow: FLOW_OUT
Message-ID: <51c8a888-c0e7-4045-8395-380cda03ee2c@linux.dev>
Date: Tue, 17 Nov 2026 17:34:45 +0900
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
Subject: Re: [PATCH net-next] net/mlx5e: kTLS, Simplify error unwind in
 mlx5e_ktls_set_feature_rx()
To: Tariq Toukan <tariqt@nvidia.com>
Cc: horms@kernel.org, saeedm@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 borisp@nvidia.com, witu@nvidia.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xuanqiang Luo <luoxuanqiang@kylinos.cn>, netdev@vger.kernel.org
References: <20261116110830.2850785-1-xuanqiang.luo@linux.dev>
 <b0f73ee2-fdff-4b5f-b8d0-43cd293d3058@nvidia.com>
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <b0f73ee2-fdff-4b5f-b8d0-43cd293d3058@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026/11/17 at 6:27 Tariq Toukan wrote:
> 
> 
> On 16/11/2026 13:08, Xuanqiang Luo wrote:
>> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>>
>> mlx5e_ktls_set_feature_rx() has become harder to follow: the error
>> handling is nested in the conditions and the main flow is conditional.
>>
>> Handle the error cases in conditionals, keep the main flow
>> unconditional, and destroy the accel TCP flow tables in a single
>> place. Use goto to unlock on the early return.
>>
>> No functional change intended.
>>
> 
> Thanks for following up on this.
> The change is correct, I see no functional change.
> 
> However, we can simplify the code further.
> See below suggestion where code is flat, the same size, and leaves the 
> enable argument alone.
> 

Thanks, that's cleaner.

I'll send v2 with this form.

Thanks!
Xuanqiang

>> Suggested-by: Simon Horman <horms@kernel.org>
>> Link: https://lore.kernel.org/ 
>> all/20261029134019.GG257209@horms.kernel.org/
>> Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>> ---
>> Only compile-tested on top of net-next 7ccc5e05043b (arm64, W=1). I do
>> not have a crypto-enabled ConnectX NIC to run it on.
>>
>>   .../mellanox/mlx5/core/en_accel/ktls.c        | 23 +++++++++++--------
>>   1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c 
>> b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
>> index 3cc1213c2f68..0f5dcd1b822e 100644
>> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ktls.c
>> @@ -137,19 +137,22 @@ int mlx5e_ktls_set_feature_rx(struct net_device 
>> *netdev, bool enable)
>>       mutex_lock(&priv->state_lock);
>>       if (enable) {
>>           err = mlx5e_accel_fs_tcp_create(priv->fs);
>> -        if (!err && !priv->ktls_rx_was_enabled) {
>> -            priv->ktls_rx_was_enabled = true;
>> -            err = mlx5e_safe_reopen_channels(priv);
>> -            if (err) {
>> -                priv->ktls_rx_was_enabled = false;
>> -                mlx5e_accel_fs_tcp_destroy(priv->fs);
>> -            }
>> +        if (err || priv->ktls_rx_was_enabled)
>> +            goto out_unlock;
>> +
>> +        priv->ktls_rx_was_enabled = true;
>> +        err = mlx5e_safe_reopen_channels(priv);
>> +        if (err) {
>> +            priv->ktls_rx_was_enabled = false;
>> +            enable = false;
>>           }
>> -    } else {
>> -        mlx5e_accel_fs_tcp_destroy(priv->fs);
>>       }
>> -    mutex_unlock(&priv->state_lock);
>> +    if (!enable)
>> +        mlx5e_accel_fs_tcp_destroy(priv->fs);
>> +
>> +out_unlock:
>> +    mutex_unlock(&priv->state_lock);
>>       return err;
>>   }
> 
> Suggestion:
> 
>      mutex_lock(&priv->state_lock);
>      if (!enable) {
>          mlx5e_accel_fs_tcp_destroy(priv->fs);
>          goto out_unlock;
>      }
> 
>      err = mlx5e_accel_fs_tcp_create(priv->fs);
>      if (err || priv->ktls_rx_was_enabled)
>          goto out_unlock;
> 
>      priv->ktls_rx_was_enabled = true;
>      err = mlx5e_safe_reopen_channels(priv);
>      if (err) {
>          priv->ktls_rx_was_enabled = false;
>          mlx5e_accel_fs_tcp_destroy(priv->fs);
>      }
> 
> out_unlock:
>      mutex_unlock(&priv->state_lock);
>      return err;

