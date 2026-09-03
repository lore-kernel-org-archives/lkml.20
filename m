Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E2040803B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423519; cv=none; b=GT7ZK5MG+GgvzagFIzaLmFXqARONrhX75SRxszN7by4U0vY7bVj7YRitcgLlHZj2pFiY4vR/GEat9EDBh4zQNR40MyHvFwFE82wP5hBL9c9LemnIAo/HWNNDMRZdFQq2MmYtAwbQMGzw9iIheVb+MIvSjkpd9XHN8oC1K/B13Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423519; c=relaxed/simple;
	bh=fGzXgGVJ1yH1x22xMbWeTVfnc0IaeKtJvd1acoZfu+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmgXX4XEJSRjPtFifhgadP6PZEiwqQyhz5mxUR9dO53sIvZ9Hw8p0Rtd1nFBz9UKSkInE6RDCV0eD0ssd03tO7zOMJcxEDieqOiDY/HOU4B1/t7Z6i5xPl2aevKYAUHdrJQl/B1XnupD82RIwQ+agebsGPeLD9lK891ZOBVG9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=IZOz8KSr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="IZOz8KSr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso21873935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788423516; x=1789028316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLr6FjTfplPOzkh2nNUhY7Doe5zJQct4JgL4Ivb8AHM=;
        b=IZOz8KSrtdGkb1HxhOPe1RjE+6ONRvEIjf10dcpncNV4/5/J6CwZ2CdC2z52XctVUb
         wUwGn31tYQdreUXeK2bPyD3F2wPie0VwHK+8IKVrUGws4Tqva6C8TEyge60UeXgdMyen
         ZAvQHun4Zx9dTu49reDeLVZZJYRwAGMvQwxq6Sfn3FhUusqothp7lQIUNoRFpLxKBlgB
         /b/nF62EKohgikCKrUvjs0a/3py9AahHGRsJEFNyKqrHB2VU9ZoTEq5mtN0Nt/qHCX21
         NmVLqnU3my+QTbIVxb5BK7n+noOVP4VjECLUcdCozvTAKx0sYmln0zXcKH71MQ9XLeiK
         TE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423516; x=1789028316;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLr6FjTfplPOzkh2nNUhY7Doe5zJQct4JgL4Ivb8AHM=;
        b=ir5umYtHtj0DTqXAQAr0rVRMGNzme9VJYKI/zbER99EjzTQerK4nttT5IifE4oPStW
         s0B3ArhBYX9YvAs4P/VJjmv4KpHNwR9BVyox2qgbGiYO2Sa1llJ/7a2qSsHkxLufXJiz
         froNZ7cDVe4EpUbjpI0Sk7UJhAkOV4UhDu3bPA8uH25Lozzy7qp+iTusgZkswGU4DVMx
         Bs9fSKSfDOQYU8mkEd6QUzQO7JlZRG8UDIHveJlnDKq/iS44t73yOpqyYJGBDqD64vJW
         LS9M0vnNYQLvYFyu0UYW8eQrN9Aqlh1dnKppC03GQrYdu4GLXXQBeD3EJAI9S3BIFIEn
         C1bA==
X-Forwarded-Encrypted: i=1; AKwUvBxDayVcuixhKdvhJyLFe4Q7WHO1PsYE/HOPC0Fsm74BaOy5FuM5g90J4xAaLxeqWEWH3K0XnfZxHBQmNMU=@vger.kernel.org
X-Gm-Message-State: AFuF++kZJXBXslkrgY4WyAtuHtL8z11HB+i1SVEZpiun/QhNXNfW790Q
	zWLbhrcE6nV3DuHSdEQ+DeX88F9uXLVRIkLj02EfeusQLKN9Ljv69Vy6d4JSj+LxQ30=
X-Gm-Gg: AYBFou0KaQkvz5Vvn56RllOlCvbUe48LmhsIAjtwthcmdrar6k7icptG92vavzG+f/O
	oUhz6JsPh/Y3QfE44wBfiCIhotKrqhnPGi262/zgVAVQwrY+YhZkxcrYVDGyj1TWO5uIsDsVxO/
	gvMLlPXAMC5auXl2NmsEC8+Ef7FApfbjoOg2HTq7DlfyHmtOnT1gnZqejPal2igNHy+ejlOW3ZF
	1JAdebA0eIQGF0Dy9wFL7zWXuFpTHC0q51PLPfcNkUiGvDZZPqs7tb5j4GvMEQl2m7fs5jqHvcb
	VnZ58QlFSfqIxWrAvfS5ZeyIYkeLvg9FH6K7q9/Puj8EkV59d68a0Wfi8uknnX6YFKVTbpw4Er8
	LDqtMWbtloCdBO4xpHY+UHmqctHAJllUmxehkTIILLN77CizZlmUTQDrXUWUAD12ijgJN3T4GAt
	VkHclfjzk2/PUsXpv2BeIMjFnJtXUvjUwDWkuprOijpT3Jn72VK8DMfjh8V1aqIa8H5bgo4S3XC
	3xwG7cCFyu5f0VlACd6cGb08NRfmA==
X-Received: by 2002:a05:600c:530e:b0:49c:d618:e341 with SMTP id 5b1f17b1804b1-49ce584bb4amr205480405e9.14.1788423515473;
        Thu, 03 Sep 2026 01:18:35 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm51543115e9.12.2026.09.03.01.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:35 -0700 (PDT)
Message-ID: <30c405c0-d17b-4107-a4f4-d2595c661892@blackwall.org>
Date: Thu, 3 Sep 2026 11:18:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jussi Maki <joamaki@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>
References: <20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2026 11:10, Hangbin Liu wrote:
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
> Fix it by moving the slave_cnt increasement after XDP setup.
> 
> Fixes: 9e2ee5c7e7c3 ("net, bonding: Add XDP support to the bonding driver")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Changes in v2:
> - move the slave_cnt increasement after XDP setup (Nikolay Aleksandrov)
> - balance-xor mode is not affected, not mention it (Nikolay Aleksandrov)
> - Link to v1: https://lore.kernel.org/r/20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn
> ---
>   drivers/net/bonding/bond_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 947d92a669b6..f3290aee50d1 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2284,7 +2284,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   		}
>   	}
>   
> -	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
>   	netdev_compute_master_upper_features(bond->dev, true);
>   	bond_set_carrier(bond);
>   
> @@ -2339,6 +2338,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   
>   	bond_xdp_set_features(bond_dev);
>   
> +	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
> +
>   	slave_info(bond_dev, slave_dev, "Enslaving as %s interface with %s link\n",
>   		   bond_is_active_slave(new_slave) ? "an active" : "a backup",
>   		   new_slave->link != BOND_LINK_DOWN ? "an up" : "a down");
> 
> ---
> base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
> change-id: 20260807-bond_slave_cnt-88e78c5f0ab9
> 
> Best regards,

Thanks, looks good to me. One minor nit if there's another version - mention
also the WRITE_ONCE() in the commit message or better yet do it in a separate
commit that properly annotates slave_cnt everywhere.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
