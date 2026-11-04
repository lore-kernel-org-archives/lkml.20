Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756569;
	b=YBz5zomqUmE3ggCQBHlzxcHk3kHiFM8xHEZuwEj1PL4RrbXRLRHkPMY1zkWJXJuxtqhq
	 AXZ5pdfG0eEGzv4JsS0eWJsHGc3PvegXjKJ9TW/0LTARiIJeFy+yPP9vqOaSUlRgsg3YG
	 6gm40d1hx+c7EJdfRPwP8w+hinq4XMxxGQJxv7a89yUkokrWe++3Smwb0h/+Cidybpa0c
	 0CDVTxxwzbusjBQ6xAK0n8Y9K1EtWRxiS8n4EwIEROTajh/eUQjYvKraFX1dSYGq/6NVk
	 jfQ4TlLAte/lXzKnVg0WB0zkEdaMUyQR4wc4B+INpOrs+d6yVMTLMNCA0/XAdaxSg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756569;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nWp1QkiE8UQYLRHEuq1OCW+NhhQpDG2WoI/kzQ0ag9s=;
	b=hTYELwSmbXyFV/Xe8pqn8QI7BOCN+fzWCbDvCPdF975Z3+rWvbBAN1bq7wL56NTRfj6s
	 mfS9lVBdz1Op0WrJUg2lhkMDc2aQ0yhpNOov8MOJUEuK9dVfWxTzfLah4s2NFAIfa146O
	 hZPylWEbbHG1h4/cHNzavasJebOTg7WYkxolS0/kNt5YbMzvChtaefo48DK9XPPutBZca
	 jTVebPxtpwgGrqpBaaOwZTtEn99Cm3S1Ix22yJhALORl77G3I0Fw5kCjUF9+VEQjVbr9i
	 j00+931cBzxMDYwYfsYU3Q++uFgTQ4MkhRGlLnkL70sN5G7OmFQXEKIfe5prnRu14DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="GW/Ebttp";
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72F606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E72F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GW/Ebttp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YX/s6/HwMM+QXcGKjPYZwlkwikDGqHDXoSO3cMoqP6I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756566; v=1; x=1794361366;
 b=GW/EbttpRAwg7oIXRQuQlJyfSFZ5C1PMpzxUmhAMreigDkimGv21maCnrZ9lz9ff58h81Y6s
 4WgEJvpPgi88r0PfzlWrSe9aBKZDxSr/IiJ6JDL/1zPzxjXia/CelsxpCopjxeKvyZD4RqA4qe8
 Ft4mcaMLefHAhrCPkFHPyHsA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id b3c20ee6540bb41b;
	Wed, 04 Nov 2026 01:42:46 +0000
X-Mizu-Trace-ID: b3c20ee6540bb41b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:42:28 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
Message-ID: <auqNhOR3Z6Lx0ggR@fedora>
References: <20261103163921.641347-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 11:39:21AM -0500, Sasha Levin wrote:
> gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
> - 1. On 32-bit architectures both shifts are as wide as the type, which
> is undefined:
> 
>   aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]
> 
> Convert n to uint64_t first and mask with 0xffffffff.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with 32-bit builds of the selftests (gcc 16 and clang 21 with
> -m32, with and without -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without them now, and the x86_64 builds don't change.
> 
>  tools/testing/selftests/net/tcp_ao/lib/aolib.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/aolib.h b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> index 53be1744237ee..71ff975533089 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> +++ b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
> @@ -226,8 +226,8 @@ static inline union tcp_addr gen_tcp_addr(union tcp_addr net, size_t n)
>  	union tcp_addr ret = net;
>  
>  #ifdef IPV6_TEST
> -	ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
> -	ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
> +	ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);
> +	ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);
>  #else
>  	ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
>  #endif
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
