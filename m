Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435411;
	b=rgLr81QNny2W/ipFoofYAp+2J92s6HSHPzIBH3R2052rw/jbwLeP3KGq6yjiwjxeNgFJ
	 nV+eE+X3apXd2OVAuBlMJF95fS0Gl4dEWCejxXvOs/h6WO/XiljFox2WrZqIg2FMqky6s
	 XGZusY3oGo6UVIuXq5gwmvesGT93T61wm2F+SDBKqtmfrqsRHnVTs+LvcHTqnKClWxqry
	 ae5npXyIDENjldWYh8JfHFgg2BrwYV7rGzT6yj+LALufd6pJ4Fx8MiXYlPTJG3uoyHsbX
	 AbTNwlvW6EevEDZh7qdW1LCV2bTGT+wPhZ/YxVl6o34rN8lVklUWzXQLGlTuppEO/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vnKV4PnxU9HF6j4JAgfB2zweGVhKP+4yJbw/eTtZUp8=;
	b=IWNI9aGaFM64KYPCcLRKaihsTOuezxGdpshpKXLoHpIPEr51H9V4t9oA4gTdN0p8a0qT
	 Z7CzxNZpVb/tWObZNaINA2u/8x3X/VMZCcwynBzYSEKgoT2XSlFJSV7HiSH+3YV4WZcis
	 luCkuYbLLWfms9QyzHZbnxmu2MbcvhdKX/fGPsCzU4LjqOr/aczEeWzRslBnIFM4u7txd
	 o+cfmygbU0KJ17i9rfsvBLA6WuW09HKRVUFFaOu3p3/2QW7yNr3mNbIVVdCPxH7u1QxRP
	 0ZjH1GmJimRuqBxLjg0NtyVq3Jm++VF/yxwAOrzhk6m2P/lE+zLFMG0820f21PzuaYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hU3Rs4Sj;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87435606A891
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87435606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hU3Rs4Sj
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so4323427eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435411; x=1795040211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vnKV4PnxU9HF6j4JAgfB2zweGVhKP+4yJbw/eTtZUp8=;
        b=hU3Rs4Sjby8PtUaslxBXzBVvo1G90IyFvQqlvS+9h3K38uEuZQg6Ez+RsngRu8oknX
         q8c+EkC8Ilg0jwfabfGTOSf2bgCDnzQVXQY7lhHbzxuN/Tx7XGwlmXgVWutMqpM4a9OU
         Gp6ijqwpnIM4jGYoiJTx3h4EmYlmWu69ccv1FynMw/5SpZ8OjWqsCuiMZq9Fd3RzdKZB
         bVhgHiW4ZkF1E/nnJK5aCrJ5C3sIyN0gyeDut9I9ylGIgRI19pwnarlPTmY6fbWSPsb+
         tB1QpVyXxVfv7STUwuEg6MofELktIg5Ty/oEs2uI9gGgLJUq5EJ8sZmF/AxqHarQX6p3
         3u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435411; x=1795040211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnKV4PnxU9HF6j4JAgfB2zweGVhKP+4yJbw/eTtZUp8=;
        b=p4AaHpgJQPcKR34WDPXgkVtg2Rz0K1RV7prMPv6pJ7iR2XV+7NQ7Ra+pDJ4Dxyv+wH
         wGclIvEvlV36+5Jeo0bxzK54bn88ZJnWcHzz92UZg+vSsa1SqRa0lhNw5MZo6+EqWk6U
         lXVKCY0WUjNOH/ra2ql4tVLGXS9/mW2SWQXoUjGWXVVMn14Rlz2SvorjCIMxWv4vfEGI
         wfjiQkJHKGa1p8doZJqd7Ix2eBKqtKxWdfOjxg8tZ5szH2eJ9UOkF49DuaOgk6b1zFtx
         LAjVYhB0l4qKgtR0TopktWu4zzrciDuUEuUt92Cyydl/3DowLtHNcwNGSxEcKlwS4ImD
         LGAQ==
X-Forwarded-Encrypted: i=1; AL+hErG7B2pyjq5B6k1ZT1XF8IXDex0if2hZRn2UiH8yxyPWeGcEjIfZiS2MCyTa7EaJXthfcM4HbTk4xdvos3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z4N9BQiYUrKoaz4idC2gmvAa1rHB7ZqCrVYMr+EGX0r1kC8Lt
	5Mg8BZKI23V5yNvEobnV10e9NaGptkocQycE1zRPuROezXqdGJYw0tnQ
X-Gm-Gg: AYBFou36fFpd/woa0qtm0pghAs1JJeXOQWCgPaKxjoeoJxCVEISj0B72l1AFqIiKZe/
	zicjPgMU1N0Uj1vBAlBcJz6qhcM8a5r258vGoGxUYTw5HAtR+46x1atTL4mcUNku81F3vveCr4Z
	mlpE5JrtJ50wBj7Hagd1CaNo/Qh+VRKif9rA5SA8qbcKwXZflD//7isnuNsIlkb3OysIP3g7uhk
	Dxvsj5NGEWlHztz0Utjx3lCVzPjUklowLmGYF+eV5Et+3RURCD2tKkxoJjlNNfOeMvjYzhcKiU8
	bqr9CrrRQdYeQ7GoLp+A68MmKEPcF6L+6D4JemE6XaF96VJoPQGKv+yeUvLBU2Ob1S5NxySs4gm
	mLni4eEbPCW8b8oYMeVsV9lBkoFVccepb+KtJuzi/vup2n+VltX/pP25It77x39ZSkOaQvGA2/j
	/jOhdDWM9YMVulYRNlV1xNCM+fRWKZCAuP6jUg9XtFeLAzSHf1pOB/7QhGxqLXRrSc+MOG4WWnu
	SAC7qCZ+QpjkoBtwfB2UE6FkIPqhePIGN88dbzTwd3KJTt9xMcrwljW6nV1g3jn8Vx+1/9wK8xY
	I9Ld/QAPNDHy5kW/fZGFgLcU6q9OGBEafttqshpNtXBc
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr425280eec.14.1794435410616;
        Wed, 11 Nov 2026 14:16:50 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:40::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm21570686eec.21.2026.11.11.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:50 -0800 (PST)
Date: Wed, 11 Nov 2026 14:16:46 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, kuniyu@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, asml.silence@gmail.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, almasrymina@google.com, yana06070@163.com
Subject: Re: [PATCH net-next] net: fix token index wraparound in
 SO_DEVMEM_DONTNEED
Message-ID: <avTocmy4u8HH0Yo0@devvm16445.scu0.facebook.com>
References: <20261110120331.13661-1-yanxia@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110120331.13661-1-yanxia@cmss.chinamobile.com>

On 11/10, Xia Yan wrote:
> SO_DEVMEM_DONTNEED computes each index as token_start + j, in 32-bit
> unsigned arithmetic. A start of 0xfffffffe and a count of 4 produce
> indices 0xfffffffe, 0xffffffff, 0 and 1. Once the sum wraps, the loop
> can erase an existing low-numbered token from the same socket.

Sorry, I fail to understand what's the issue. This is (buggy) userspace
misusing the api and potentially removing different tokens, right?
So what are we fixing? Can you explain more?
