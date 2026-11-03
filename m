Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728793;
	b=fS8y/2GS6MOsmZMRroHDJ7lxfyJ5JQaKdvfcvPrRfn3RUvwWitronAywebNR62tdMApi
	 gwSOCS9KhDJVrMOS5utgf+4Onfoc9kHR8GXdCYPcGNostFIXFlzIM8E5OlntXEECOgdU1
	 KtbX5FP1Y0RQ4bzMEJejrOLPS0sAl7pjNkvq5Q7kWMJr0vLSkIbCPDoVLT2ymkjn0utVO
	 9LWvUrgG6aZ3KXpC/wi1vcPzYYQNOQ5EeyHJKmQ0kJkhAYi5UDTj/MxRvqxISr5IFDSl4
	 9CzmWJFLGqzK6/Ogvw1psIWZWTCWs8hs/ZYmwKoowINY/ee5yxr+Bq/7UQTpWAunnoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
	b=44qogC28ocKYCcJVw3bPeVquyHahY2c5TLuLX9XFgDbyOjsnZo7Ifd82CLEX1w54iF5H
	 Ee6hnbahME2lNcTb8qr1Cp+y3n2ogIiH/5VNGI8oqAdNGDB60xa8kPKE6mt2mhQXyK5r9
	 ZpY2WozUaGbKHr5q/jQEZXL8rhfZzbWL8I3j8j/5Y9husL255I7cTh2DIrk1hHGlZBelN
	 IsmGW+FoCvuCR8sJuUMd7MDilNJJtVKzpsbDxdyeKq64WGlLb/liPLS7bi/DmcJBdYFks
	 YiqFCADcbUa9rd49if3vXr4nLPV2egluaXAn0eOex/NNi8HgGv185XCcRwNOGJLzZbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCjz6mkB;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC69606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC69606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCjz6mkB
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5957340c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728792; x=1794333592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
        b=TCjz6mkBL99yj7gcdlCxhkwe/S1344iWFLlicIpOOL8sh5AZPdcffvifLfg7haM9pE
         zST8Mq20JhE4GJsoCQm3Hwz8nuKlSI46LWNjKkhhLnLHo70247g6nrlv1k7bM1ysBw7Y
         ZqLAIsi9gkq6nv1jr34z/oW128mpWH0hWG5frvuyXcVCEspkykU7rWa13cfbPUyEsPge
         JqVpeLojl3l4YjD9R+CPkz42fMdWKiZpONPHyU4iryYbge7Rzow2PCCVWBkz54rXMgnY
         PLg2ce51LXdHBAN6WX80jHcpLsHMucqmRZILe2gC4Oq+Qt/W7PxCCuXq4uBFr6XJdMz+
         FHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728792; x=1794333592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
        b=PxRfeqmodVyPtLUGHpNkjmBZyx7Oye4t6XXwIySfQ4ku/ZM2a7dr+04bU5XQ7E+dYP
         SjbJobCqn0uXk1OpEYnrHmrIjEVogl80WS8tfkLoYfvHZrxVeWUXc3zdlgtuPOeAcPXN
         a9ce7yZcFTT8BwfbP1Mn41qCMvBKUgt0+2xg5Ec88sUnMD0M8zd0gXKzwdo7aCo478kL
         hRlLwc8J2Jioy7O3B2yE09O87Lo3hJ9h9vQ6/U9X9woTl1kNDWpGs21++4+H5JzI0LSn
         epdpgj8WhMeXhmxYMl6Sj0iu8V9qL4ti6jO/xS7MvY6EuCP893a4cZSgU5TB7rrgVS+R
         cShg==
X-Forwarded-Encrypted: i=1; AKwUvBzqKGEGsYheWz8CWugG7eWhT1lT10y3eU/xgj8BWZMtMJBNW/CbsMiTn4MEwex79ST4XzW9ETlX01y+uRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v5n7ZARdkFg8Z43u34khCMz/tpBWwEHFEFptiNWIaqtf9b947
	pXm5I9+93R4zaFWoO4pm61u5vOnW1Bghb6Ht2IFN260bFUC/1YlXYJ9UDaOkeQ==
X-Gm-Gg: AYBFou1W8+mZ4HwRufQbD1POpdKAyBoBLQ47eUHSaxZkBjMYdGmmpF+nIuLANYD9mXV
	RphwYD23Ii6jNprnQedWHgNiDN7eiLZLg9S526tKYKnH0QTuUyqOezLwOFM0BaLWJr4jGlg0QrD
	8dSPrXG+B4Uzvqq+MwKoOtKgahnZiHGMKr0Bxjci2HaqXjnGWPEbW3LwJ0QPBVH+2sYqms4SDj3
	U4616sm6djIhrfUjcAUGwlCTgG+a2DkeGiJp17e8IgPbcLrdj0DN30rmocVDAmm+FpwP8FZtXLA
	nQPl4E5HwVV2/mcyizam9+Ghy6BbtKuDcFrDyPIj21bcroe2S72o6Pwj25Hp++Pw/aY6iHlhiCj
	2g6VUKCasSrA1s8Yu0CF40UXv0MMxVGb2mztBbqKlFpxijqCzs5h0pFw/nTj543SH+HmVEE1vaC
	hKsWxqEo3ywwprp9IlOwv5dZjXNwO3h0SXu6Hv0LW7SxHC/3Vyufv6U/5+m0nd8fVWH6+THs9Dd
	yrQH2IYwr6W4rdiwd72ea7dlT7fUddOo6i/944jQshYyDDRoP+MSPELdGIO6xtqOJnSXfYwAD4d
	+JMWFoeBSw/h5rkkym3fMCUBwCuaM0dD1ptBf1TgCWpMColZpc7kX7PuEQ+/+/ES0Q==
X-Received: by 2002:a05:701b:420c:20b0:194:f017:5a01 with SMTP id a92af1059eb24-1ac5fc0d363mr20693907c88.42.1793728791460;
        Tue, 03 Nov 2026 09:59:51 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c1::14ac? ([2620:10d:c090:400::5:e3cc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm427461c88.19.2026.11.03.09.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:59:51 -0800 (PST)
Message-ID: <cf4b221c-cf4b-414f-b087-815848c85b2e@gmail.com>
Date: Tue, 3 Nov 2026 09:59:49 -0800
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
Subject: Re: [PATCH] selftests: net: fix format warnings on 32-bit
 architectures
To: Sasha Levin <sashal@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Xing <kerneljasonxing@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103155503.534876-1-sashal@kernel.org>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261103155503.534876-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/26 7:55 AM, Sasha Levin wrote:
> On 32-bit architectures ssize_t is an int, tv_sec is a long long with a
> 64-bit time_t, and uint64_t is not a size_t, so ipsec, txtimestamp and
> the tcp_ao library warn when printing them with %ld, %lu and %zu:
> 
>    txtimestamp.c:191:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__time64_t' {aka 'long long int'} [-Wformat=]
> 
> Print ssize_t with %zd, tv_sec as long long, and the net namespace
> cookies with PRIu64 as the rest of ftrace-tcp.c already does. While at
> it, print tv_nsec, a long, with %ld instead of %lu, and cast it to long,
> as it is a long long on x32.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>   tools/testing/selftests/net/ipsec.c                 | 2 +-
>   tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c | 2 +-
>   tools/testing/selftests/net/txtimestamp.c           | 9 +++++----
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
> index 89c32c354c008..ba8c36a93f176 100644
> --- a/tools/testing/selftests/net/ipsec.c
> +++ b/tools/testing/selftests/net/ipsec.c
> @@ -2030,7 +2030,7 @@ static int __write_desc(int test_desc_fd, struct xfrm_desc *desc)
>   	if (ret == sizeof(*desc))
>   		return 0;
>   
> -	pr_err("Writing test's desc failed %ld", ret);
> +	pr_err("Writing test's desc failed %zd", ret);
>   
>   	return -1;
>   }
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> index 27403f8750547..cd93ff8965dda 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> @@ -504,7 +504,7 @@ static int setup_tcp_trace_events(struct test_ftracer *tracer)
>   	size_t i;
>   	int ret;
>   
> -	filter = test_sprintf("net_cookie == %zu || net_cookie == %zu",
> +	filter = test_sprintf("net_cookie == %" PRIu64 " || net_cookie == %" PRIu64,
>   			      ns_cookie1, ns_cookie2);
>   	if (!filter)
>   		return -ENOMEM;
> diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
> index f7bdf30b78d9f..be1452d73b303 100644
> --- a/tools/testing/selftests/net/txtimestamp.c
> +++ b/tools/testing/selftests/net/txtimestamp.c
> @@ -188,12 +188,13 @@ static void __print_timestamp(const char *name, struct timespec *cur,
>   		return;
>   
>   	if (cfg_print_nsec)
> -		fprintf(stderr, "  %s: %lu s %lu ns (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec,
> +		fprintf(stderr, "  %s: %lld s %ld ns (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec, (long)cur->tv_nsec,
>   				key, payload_len);
>   	else
> -		fprintf(stderr, "  %s: %lu s %lu us (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec / NSEC_PER_USEC,
> +		fprintf(stderr, "  %s: %lld s %ld us (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec,
> +				(long)(cur->tv_nsec / NSEC_PER_USEC),
>   				key, payload_len);
>   
>   	if (cur != &ts_usr) {

Reviewed-by: Mohsin Bashir <hmohsin@meta.com>
