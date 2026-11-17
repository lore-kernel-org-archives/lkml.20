Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926416;
	b=vLaNA68cfCgYbWvzmYT7eZep317nKAE9LqQW5vInTBGf2ES1Q7TP0PA+zdjEa33WAtlz
	 +G1w6ZfW3uJgpN81P/6Aemr6xVKB7vm4xxIPJmybcgySJeq6XxOvh4t5etIsKOxvkJNU9
	 CLPcY7+yTglmVijEWA0avIn8f+hVlLp1iZKwdAUzIL6+lDF6ELXVx4Ae4D7ltSobod23C
	 lQPr+owQPUAuvODsJSikY1aUJJRwuMDkq9OIpjC5pF846l68Ktch1Wf9MzTiOUQoR3m/p
	 TKGwCyGDXxO0n+ZZ9innNqOzR8dV4qnHpd9zBPRqI4GM5gd1N/2ilPhiThvtDQZ6xhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926416;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=UIAx8SYYGtXxGFkz6M1KYjgJJXCIJQDO4P2YEG8QWdbUKdRzn0lE2p4akRhDEyIYdP3I
	 y0qPM8Hs6rhwrJFNk6hyqtVG/8otnd4PA/A8aHcf4V7mzf7wgjD0DymGV4U030xm2+Xt6
	 F4zj/Yzal+MtTJ+Pf+iTYjOOP7nCnIp3am2izHiIgAEQ9ApWNG+LbSmLXgCDe+bkza+0e
	 gJ4+Xg2nfNduiT7gZE7wedDnGY1Q4GAF7ogY6lzGy788GgMLGVRhH/8C01XMNJdOz3069
	 XbE5/39kSGnWG8cWMlUz4fy6guJlbcaTTns09iGrROigi6B3wcnQFttCcaC/2qcjznQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B4606A897
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595B4606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794926415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=ikRUpuw3SHfwGjCTFkYXmu4LQeRpKQAZmdaGtJgDrW5Y55YaC8uHRpuuGKfukJBzBFLTXd
	+vTi5ltcLG54GndvlGPHc3pjDyQv/RcHFr2Xu6RCyfnH0RVx3WCXZ4nAIpkpdwFeDcpHs5
	rMlxW9/bZD1pB35VkG4LtjPGZUoVh74=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-nhrzFuU-NFqwPB9_0QFh0Q-1; Tue, 17 Nov 2026 09:40:14 -0500
X-MC-Unique: nhrzFuU-NFqwPB9_0QFh0Q-1
X-Mimecast-MFC-AGG-ID: nhrzFuU-NFqwPB9_0QFh0Q_1794926413
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a589b28bddso150987f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794926413; x=1795531213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=KmuUQcvXzVjZQyZDZZvXMNioNvXP5M7fIQoXHOaFe+0VLzFz9+mxgzWW82n5Se284g
         ySawX145ISXbOmT1JqS4JJacBlW6My2C6KtdDkK763PjkErXpXi5eRGQs+L2NKPrjQSm
         tVB+tGdsEfCuiv+v8g9KOUONZnLVfiOl50Rj9RXOJsR8XJyvNckWYBuuWt84ULbqx6wK
         9qtW4UKTfs10xwRWzZWiqYijFEggZ856Vv4+j0Ux7kQz+qufE3TncYQbNi1WGtxTn6dI
         8KCCjwZ/FOfMh//xH72/zUP9vZlurT35IMM10M9GOAvJ9uZzHlteXI3SoCm1Tp7Mu2cz
         YM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926413; x=1795531213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=WlRIRm72MbChJBK57nHBBpi1PFlK/c+vI7/7kcIiY6hiSQqIYlfUJd3U5/thyUdfX/
         eBsr6dpuIX0Cd+Ni/8o4DekZDNcrm2hSmRd+7m4uZ1HdZKhSc+05SHsDdXqxKl6Mwzhk
         NYT+OzC0O6FdSfcFBNr3yX1dKcJBtitOfMM18GMh69Gocz/tRCw2JPq+Zi7LxB9t9+H6
         FPln0YEXSU/eloiPvd59fAa5M/rg+2qHvkPwdidVKP5+FT2mU2hk2C5s67jT2+XvUT3j
         QnO4JCTw2H2AkzeL9MpgF814GLRXPlzxKwiiuXQGelohulSxIyvNNRQPgBUYF+KmA/CO
         2ITA==
X-Forwarded-Encrypted: i=1; AL+hErGxfOeLuA6JZbM8coBh+SGrsR8GMDsGt5LBet3u6oDoYS+HLeG5OGqWHTr4cSPzqhXrVUb528i+Nx9JeIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QylNm6QZsxp9zkirB2Mlz1hvGTstrzp0NyT690LFpLVwHwE7j
	9s+9GuKMtiT1MxyVE91fjlKCFFgyZz6uuqLP8JOSP911iMmogap2fDBzt04SGUJiI1GTi9RYD7B
	zd/aHMkTkzBhnZakUvoKiedYS01IVUVbcun8KITTnvow4m9H+F+RhqbKdYaUmGt8x7Q==
X-Gm-Gg: AZFdTZcjiZRjt20/N1hRFDZGt4Bh9TOeYWSl27Gp7HlD1a/Y4ZhXgzP3Aypgb6kwAhC
	nUTKfNXHZQ8TUzpr9zzTjVE+BU9fB9NWt4xo6PgUtCqrhXlaBBK/3Pn6U7eQJNphhD6wSlkdees
	NNwG6w63M/YRqa9sR6IL1cosR1lARt5MRSIx/mzAOWLyVCAmMjIictkP+GcAb3e6vae3PBPI1pK
	fXryJk+iZOw0uQGz3JLMnSSwGNQrqqo3hBX/2Xfl9gKXBQLBgeqkBi2XxMi8x7P43Mwef1mVI+q
	Ptvzp9K+7pXbQJKCNaHNeYtjbldZw1x3F9YKcsPj3hMXzEIM7//PNlZF7HXM1AS9z5HlaECCeMH
	AWhFo7gYoriKoUeL3R6vcyG4eRn5iac3szYhpJNWcXBp54ClWNoU20vqIbrX7hwCmLkxHeRjvd4
	oHHT+1VI0GozPLmGuwHUMxIjK/qGQAABm8xNRovXoCIcyd
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841221f8f.15.1794926412762;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841148f8f.15.1794926412365;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm23870977f8f.20.2026.11.17.06.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:40:11 -0800 (PST)
Message-ID: <10582a05-322c-4fe7-b1aa-b3d8a61fa07d@redhat.com>
Date: Tue, 17 Nov 2026 15:40:10 +0100
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
Subject: Re: [PATCH net-next v3 4/6] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Dragos Tatulea <dtatulea@nvidia.com>
References: <20261115022607.348112-1-almasrymina@google.com>
 <20261115022607.348112-5-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115022607.348112-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 03:26, Mina Almasry wrote:
> @@ -252,21 +254,18 @@ void net_devmem_dev_unregister(struct net_device *dev)
>   
>   	xa_lock(&net_devmem_dmabuf_bindings);
>   	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> -				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		if (READ_ONCE(binding->bind_dev) == dev) {
>   			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>   					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
> +				WRITE_ONCE(binding->bind_dev, NULL);
>   		}
> +		if (READ_ONCE(binding->map_dev) != dev)
> +			continue;
>   
> +		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +				NET_DEVMEM_BINDING_LIVE);
>   		xa_unlock(&net_devmem_dmabuf_bindings);

Clashiko note here a synchronize_rcu()/synchronize_net() may be needed:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115022607.348112-1-almasrymina@google.com

even if the lack of it is not catastrophic. Sounded quite
convincing to me.

/P


