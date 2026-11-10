Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293159;
	b=KQ5QEYfjNwUDR2XLFnaVu7ryCShSX2KPakKXG7TFdQ95gooGcUpTm+LEvXZtoomwTJ2F
	 grpBonV5ek3IljirNp1izMTTq6JOvQtGQxI/xq+wJgUD2oP4cy67NR5Sgq3I0l8CYEOse
	 xVqJg8LUq430suZQJpTFRlTRUOMuL1NGbfFXdSQm4m/v+0jtPHKG5lu7TN/o8pmJ8cVXi
	 ye9xqiv2Qtov7r9mXLkHxaYjhzK0B3aSp1P0iZ8hrRsTReuuskYrt09Ke/bxV8sInGgEA
	 YTJh1acaXuMlTchdgbrHbmQyEyZbZLUmhSY3W9ZSyHS08vct8Z22ZkzEk6T1cjT/MMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zVcHMSsusl1Ej7N/9YmP8osA54hse8QtuF0mZhuFuKE=;
	b=LbVd2oF9YpLg6XcNbrYakqOl4KuB+EkGoG9bRCKNiSyyBHNtjBmFeGw+Cc1S4zL40fFR
	 ErETh1fG3hD73ZRoVL48YA+PAbWLeJHj5eGb29P4JGEJMoAEgxFuiqrc6rkLJPsnP5WpP
	 tciwPxpzza2n+1Fq8XkCUNSgLm2yopEcWZ7dO/9MxGjvpK14TOM3WFbEWyom7NwO3jF8B
	 cmaFUlOmTCSy8ujkIfEoVq1FNZJ2wqFKw4Oaoep4ImYXl3zGQpWXSOnZuN3qOq/5/NhFs
	 YUJPtYWtCZCLqtI02ehlsUcA1uE+xPU4+EyVO5Pj2wHckH4TvhoRb6zDK/gaS8osAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iKXIWz4f;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB0606A649
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09AB0606A649
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iKXIWz4f
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea0fe07201so12262015ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794293157; x=1794897957; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVcHMSsusl1Ej7N/9YmP8osA54hse8QtuF0mZhuFuKE=;
        b=iKXIWz4f5+r9vNjEX1njp1JAE0DkemMvWqkFWMmG3Vjv1ZLOycapavc7kVSFLpv0WA
         PsNPmLRxlONNp21iNG0QisN8PlO++GJPtHshY77ahqCn7ItMwytliqA1DhcAKvE2KmBO
         7Jy+jiQo5Xwnk65oYSNtkD/4sFfJjtqtGqKOHsR8CUrqZ2zBkdQlEQOhZo3Udg9IVxwI
         zc+SfBMN+8P38cESTNHsw6B9J1Epaio6O/ZozoBZ7rKezKKZnGKXVR1qiG3ZiTxWaJI/
         KZ65SnaI23nwOWTRxUVgcparBkJ6QDAVGzXI5IUYZYv9wH1wull3D78cyskKidIRWjy/
         RLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293157; x=1794897957;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVcHMSsusl1Ej7N/9YmP8osA54hse8QtuF0mZhuFuKE=;
        b=Ec0qQk/DxCgsh5cZ/9zXKEEQOzzo4iFZuTzfTGQAHE9x8AwmHRtXZPyUmmF1l1ZtJF
         0hxBn4TZ/F8kvsF/DShLRPK5yqJYtitGB4N5uymRFsoA76xjoOnM/YOppkiX9JzQzA7T
         i4GubDza6SdBbP1p3aG50YA2CbxwAcP13HAxC/iiL2jAt3Amba/nKI3FSDHdUOGQQn9a
         cpqSXWUIi+JUXMe9bTXjFG8WaTEYA1gDxYo75sj1hUP6urX9O/imF4GHY6FoBpmoZz24
         THSMRpQmEqPBUFUgX4+RIF/kwXaAHHTHc6lCIEi3y5ea/vhtcgx6tB9/JhEFLLICM/Jm
         rYmw==
X-Forwarded-Encrypted: i=1; AL+hErHtx+137PY6LtIF6c4dg/7n74PDq1/6rQ5UQs+JTVSrmAlJO8ba7aacmm4pAOvoxn4P4mbvdBAFVYqpliM=@vger.kernel.org
X-Gm-Message-State: APuU4Z871WllEM2LVK1b4fuaFNHd0RYBgSbenMCLiVWQy4DHRVN5lSrl
	1qZYuqNMsxDuzJ8zBDKcOtv+BQfxkyT/u+7KGc2ki8dwHtTHCSlCOAUsTbU3y4ATo4DES72pwNu
	Q7hIPLA==
X-Received: from plbmm14.prod.google.com ([2002:a17:903:a0e:b0:2ed:5534:d103])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f542:b0:2e9:5714:6087
 with SMTP id d9443c01a7336-2edb8f95ddbmr16875455ad.5.1794293157096; Mon, 09
 Nov 2026 22:45:57 -0800 (PST)
Date: Tue, 10 Nov 2026 06:45:56 +0000
In-Reply-To: <20261106171442.31811-2-baditaflorin@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106171442.31811-1-baditaflorin@gmail.com> <20261106171442.31811-2-baditaflorin@gmail.com>
Message-ID: <avK8iXcNfXSt1_CQ@google.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: avoid false bind exhaustion with
 odd-sized port ranges
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Florin Badita-Nistor <baditaflorin@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 06 Nov 2026 19:14:41 +0200, Florin Badita-Nistor wrote:
> inet_csk_find_open_port() rounds the range length down to an even
> number but keeps the original exclusive upper bound for wrapping.
> For an odd-sized range, the two scans can therefore miss a valid port
> and return EADDRINUSE while an eligible port remains free.
> 
> For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
> and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
> although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and

This is the reason of warning in set_local_port_range(),
so kind of WAI to me.

The change should be fine, but we should remove the warning.


> MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
> also trigger the failure without a per-socket range setting.
> 
> Keep the full length for the scan bound and wrapping. The two scans
> then cover every candidate in an odd-sized range, with at most one
> repeated candidate when exhausted. Even-sized candidate sequences
> remain unchanged.
> 
> For odd-sized ranges, subtracting an odd remaining value when wrapping
> flips parity. The first scan can therefore also select offsets of the
> parity preferred by __inet_hash_connect(). Namespace-wide ranges with
> same-parity endpoints already trigger a sysctl warning, while connect()
> uses step 1 for a per-socket IP_LOCAL_PORT_RANGE.
> 
> This only fixes bind() allocation. The rounding in __inet_hash_connect()
> for namespace-wide ranges is unchanged, so connect() can still miss a
> port in an odd-sized namespace range.
> 
> The issue was triggered while developing port-range selftests with
> Codex assistance, then confirmed using userspace reproducers on
> unmodified kernels. No kernel instrumentation or fault injection was
> needed. Booted x86-64 KVM kernels were tested against the regression
> selftest, the full ip_local_port_range suite, and a Go net.Listen
> reproducer. The Go reproducer fails 100/100 times per IP version before
> the fix and 0/100 afterwards with a three-port namespace range and two
> listeners occupying its first two ports.
> 
> Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
> Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
> ---
>  net/ipv4/inet_connection_sock.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> index e56beec43..755fcea35 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk, struct inet_bind_bucket **tb_ret,
>  			low = half;
>  	}
>  	remaining = high - low;
> -	if (likely(remaining > 1))
> -		remaining &= ~1U;
>  
>  	offset = get_random_u32_below(remaining);
>  	/* __inet_hash_connect() favors ports having @low parity
> -- 
> 2.51.0
> 
