Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F23377AB6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640955; cv=none; b=TxWH68YdAAqBrIW+dU385Z+HrB+aUsiJ6Oo2qBcbW0dT34Z28gDrcUkrsyiWmCKnAaYAufUZBKdvmiS32a83TDtf9Yu1UYq9AKr8PGrKnRnmiIQ71EZ+OOBQ5rjE+TMAYucudaE7Q9p+KT+/UdZZaDn3jA7wyZrspRHZMJWJo2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640955; c=relaxed/simple;
	bh=1nn/gxCVP607cWus+kYr5yIsKr+fX0D4lXIQhCvbtzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJCyhXAhThND87r9ni+LtFYl9VLBUgPRSiAcNRrif73wgW1W0JIbOVwiqlWiZHX9MCHFFS2NptOt72wkCL1nK/vMbSK9+1BsSH6pIdlrLpTC7KEVRdTDpUVHZS07wBupSzzvmCNee/wFB/U4guxPxQAY2S/6k5f4YgwdhpqbmoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDSQdYr2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDSQdYr2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-487048857f6so594739f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791640950; x=1792245750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7F23FNsErj3fpOWKD/UF72cX4yQCCC/yv71F53gfj74=;
        b=qDSQdYr2Z/+mdWr5U9bMM5gDAIS4cjZD0yDeCyIfsFfHYpIe/gYGLc/dT9OQDe5ZyM
         pr1zGnzEzFNtrH3AraRLJ6Ba7MLXvgw8eAvI2boZA1c+xLYps7STj05CZ2fsPMO1pFEs
         nXqebZNvonbBefAXm8QHluLwoyANWBzBWD2LAoyzeIuVMJRSXsczb6rAIB2iefqSw1e+
         QadP+/LKkS0pvPI4VX4T5PfEo0OuISIWLLWf+iqvMkOG29pP1YKP9igsoEcRVEjjDIyV
         K3PQn1aap2b2S6seVp+UJo6X/+taOuJZj0PqkoCpHWbR1SQkTGsaOB1LGjaoGFe+MiDC
         H1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791640950; x=1792245750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F23FNsErj3fpOWKD/UF72cX4yQCCC/yv71F53gfj74=;
        b=gkt3GFZxx9qeOHiU3v12YEzrFnWJqeB/Sgn5lWhsXBoNwonZEflpwpJyAZyegDuWVn
         qgBNHiRXGRHbPvru6QUk9jXX9SQKKWdRBxShubx0IfzaPqPY33wsvSWXZ8/WRK6rV9LF
         eFKLqiDk9cUTvBG91/WZKTM/jXoefHHtqldICYqSsrP58La+CN4+JkO/qpmNxXotYFlC
         6vKfqowu87l5dO0lCoXLhQ3CL65Yms6uGZgbFc+sSyemQicX9+NJ52cBLh6EjSX02EiO
         K9+lBXAB7UixUIRgbWguIFE/ssH0A19mNnvYb8eO20Cwv+VOFtY9ZuCTXPgY6hzYZwbI
         j8MA==
X-Forwarded-Encrypted: i=1; AKwUvBwrIziBumCc3QNsHKWuozEEJ7SruGvmkZs/UDMDOkUohy26tzqHtFNXNauelR5IVxD/RQ/zWuC3ZHkKY3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK21K/XIPy9kV4pqRwHEzrl1+45EcA6xfADkQ/QtXxrgva7hWV3
	ZFall6s11Z3OkN64dqxwANLBHD+1JverHQEnci+oj6lhZndj33wXV/S0ZukhMA==
X-Gm-Gg: AYBFou35cq8ig2+eIv8Md76gpwHSvw8goEUgKC7Q9zsZsTL/tFirrLPdtGnrLXPZ5UZ
	EhGS26rHjNGAwZFWrxKjc7BttWwk0sd8DD8C91X+gGxWyfrRoMXlhRYAzI/2tVRYSVf2U4ypVFI
	vKyumMgIKBufEe1sHl9s0+oytrYvT18Qf+nYBPYVCOQnDPBYyZ2HVRgfmN2qwDQeRNjCnjMi8o8
	q9+w9/Z0lr5Khej24V4P4j4VWYJAqSUpgWf5/mSp9/Rutv3sPhsSVM0piAJnU1KOaTt4xgP9o29
	6ZcGGn58HZBUiMCiaEmeBMmfXa3jR0s2BUjCd6cSAfOi/1bA+m3V9ZARc9vhmdAvXHG32ozWTuN
	26/jgny+rbsewHZopwksYB3iB1BYT3tmSnOmrGiGZnrwfQ0AfrsOd2IFUd5m8zU5PIfP7mFQGXd
	I7CB59weCl4ivw6d8D2VTeqvWUa1zZqAJSjIe3QLRrY0MIpaeC7io/KSf9+0XJGoykB2XqFn0aU
	Db5ZvuwJYYxTNUnGpY78Dt7F4yRBq9UX+kyhAKKzeeG/8wZgfBU6sjAQCZUz2IBZpnEgFgR7OpW
	+yZPER+7P7AMgm50sxlfyJwNXfY8SsQzSgj4IJL9d5UEVfT/
X-Received: by 2002:a5d:6992:0:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48dba77d1ddmr7509477f8f.1.1791640950478;
        Sat, 10 Oct 2026 07:02:30 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463499sm8727077f8f.3.2026.10.10.07.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:02:29 -0700 (PDT)
Message-ID: <12d8d2fc-6b3a-432f-b27d-e27bea01d697@gmail.com>
Date: Sat, 10 Oct 2026 15:02:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Wei <dw@davidwei.uk>, Taehee Yoo <ap420073@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman
 <bobbyeshleman@meta.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>,
 Kaifeng Wang <kaifengw@google.com>
References: <20261010025532.839559-1-almasrymina@google.com>
 <20261010025532.839559-2-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261010025532.839559-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 03:55, Mina Almasry wrote:
> When a bound net_device is unregistered while userspace still holds a
> netlink or TCP socket reference on a devmem binding,
> mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> netdev_nl_sock_priv_destroy() will not touch the unregistered
> net_device, but leaves the dma_buf attachment mapped until
> __net_devmem_dmabuf_binding_free() runs later on socket close.
> 
> Because dma_buf_attach() does not take a reference on dma_dev, device
> removal frees dma_dev while the attachment is still mapped. Closing the
> netlink socket afterwards triggers a slab use-after-free in
> dma_unmap_sg_attrs():
> 
>    BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
>    Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
>    Workqueue: events __net_devmem_dmabuf_binding_free
>    Call Trace:
>     dma_unmap_sg_attrs+0x76/0x2b0
>     unmap_udmabuf+0x8e/0x100
>     dma_buf_unmap_attachment+0x145/0x330
>     dma_buf_unmap_attachment_unlocked+0x96/0x130
>     __net_devmem_dmabuf_binding_free+0x156/0x2e0
>    Freed by task 9:
>     kfree+0x1b8/0x550
>     nsim_bus_dev_release+0xe/0x60
>     device_release+0xcf/0x250
> 
> Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> and null out binding->sgt and binding->attachment after unmapping so
> unmapping is idempotent across queue uninstall and deferred binding
> destruction. Call it synchronously when the last bound RX queue is
> uninstalled in mp_dmabuf_devmem_uninstall().
> 
> Fixes: f8350a4358fc ("net: page_pool: add a mp hook to unregister_netdevice*")

It looks more like 170aafe35cb98e0f3fbacb446ea86389fbce22ea
("netdev: support binding dma-buf to netdevice"). The one in the
tag didn't do anything interesting.

The fix looks good as well, might be a good idea to clear
net_iov's dma_addr as well.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

