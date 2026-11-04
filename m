Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799965;
	b=TL8t/vEO0B+xOON8QrTEZ7AilNsXTI6XuQVv53NZDYsMJuMc+zM6nw3GVqFHXj7IwF1W
	 vVhr9frofJdB9fxECmO7aM6iAMY3hh3feXKd6ES5g8Rt5NZBERKe09Ha1EJ4gz8GXVrCs
	 iMSBfcF9E5SldqSkYyQckGmvATTi+AuO9WS7Dw0R3BJF4ik6+8PCTpysFEm+4Pkl2LPla
	 6naU/3DxHYgdubnofECZqlK8mKZdJb48/PSQSkS/W5M/Vvrkj3FY2zvPjj+k4VjGYzaCj
	 oHoJQXbKsrU20jMTX1iH6yabt2bWr365ldhoECQ/ENsHGDQZcYR7Fbi1MsPUhs60CVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
	b=f+JGfbXNonTXG7Ody40WpIGUc1vyhdZ8mmz/3Hz8K/evSRa4jB6i0K5lqvZC8sY219RL
	 EK3axz41OGRNTQ7ajviYy6jNGZQnmyzIuetnTTmUDaZQDqkBMZ1wo7JXNXO8f9eTnkMaD
	 SB39d3JTQ8meGFfvWK5h4LLAv1h5OepnBb3SC6CjQM16VQ9/B9+KV1qvxki2t9eda46NE
	 5NzqfbOWCM3Lp/kNvzDrFDbU0MDvEIEjN0cOXJ040PiTw8aEmvXEDegYcUtAcg8Ou/Ke7
	 eqqS5/NCXZWDNqzkkfJZ6HB6ha5vqmFq6tVQfDVVdMy9qJPBPksxk9pQHOn5trwQwhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWnrTbvS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BE606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108BE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWnrTbvS
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d6e342f98so453859eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799964; cv=none;
        d=google.com; s=arc-20260327;
        b=jXRcAgLjbQDVCnBL6c7jII6iWNvmM/ZNgzPrwIbr6mPxBQRtyxb3H/BJRfZZ63+H57
         9/MTVAXYmU9+3rs6viaK2sqKgEzNZN/hv7Dv75MziithgLAg8gwYDNnonmpgIxEN18g4
         ICLSQUvIvPjscdMNBHnNGCCqN+qgsoZboB9w0TkoTBAr3khBJO9Adp2Ma3/qzSyaxCkF
         Ue5ZiaN9Vq2Z17fTn0qPIGu334mJUrjKxn6g96t1GIhaa0vYeZiBObXvy62UavvUSR7/
         uUNBzasB96/vy5Vne18sX5QnxOgWIVEjsRJDSF0RKG+/W4JXwRp6oZdNqi6bPk0XXH7J
         1Jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        fh=awpAKTKmEvhqLlWilDmBkpn7Llkpt1j857iQhIfMrjs=;
        b=HAHC0uNe7FKykZIOy7eY2gT95nyZYBfj5z86IG6l3RFjpJPL7HVtpiS9l0OAwx1sDA
         gm5c35wV6qopgQosMzMTuU0dVEDX3Zzw4f4LWVsns08+0cVz1LpGt7HSAjglBk2mm0Ze
         2LKwIGjyJY9hBumzBbPhvGolZnZTJ44sesKoD7rOyi44kzZUNcnbl2gv9Mt6LvAmX64y
         zxdwQ1HUiiy8BqGmEKJLrKdNMiPq5cZ6Sh4z6D+Eq4HkZIfQEKDZZjNuYzx3ZZ+q4+iX
         IJRYFC6TdY0RjtDEthPKZ4VVqstkJ+zRdjn2ZJae1QE6v5N8BSi9jKksBk/DUcVmruig
         z5HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799964; x=1794404764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        b=GWnrTbvS0F9bkzFJf2YKx2DDnNs+0A1dHAWUjES1lhkTBtV9QDnEi8sSDNDKgZPDIK
         7v2jIJ3TXFbkvjS8dNnV/U9d0chBoDIlAD8hefNyFrl3FAW/IT285psEyhx7VYr7hJmo
         VjHW6gmKDMXjunXTyuFWf+1YrfETdOi4Cj2lW+rhV+L7i/EZr9aa+gBWkJqBaI66+bar
         XZHSydiJQGoS0TRYPKJQEw56ivHiy+j4xOrLSCAcxrN6paJJ6z6Hm0g/cKSubnG0YV2v
         IAdNpWaA36s8MIFqY1Q4nmfAfZWgcL9n2+YpIySavEqqke2iA2YUwU84UVoR2kv3SbvQ
         nAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799964; x=1794404764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D0ZsOE+K1pTcz9yTwLm9GxhoridjE+gXv16hTadQYPM=;
        b=g9BkZ85xKIbPW+jvvvL2RBijrP/EVUcr2R3muaXpaEc05aHEHx+HcUW85JAFr7GILN
         831ouxCq1jMhTo4nr4cqisogNi/he2PRrVOdJjD3FMrmqRnMrZWfogEnmwCRb7VSXhqt
         vT4SrSEF1aPr2ox+I6sTzrUunPHY3GabWqE7OxVVS4uXgn8pBlH+4qGganuDuiCqrPYa
         9j03dkuJNjZwVMctQ5cWRY/3WhCqwFXOCb2fPRrriowaV6EV7t22h4olmmk/63i/5TyD
         Ik2HMXDd8JIKqnFualsfBLqJL3mXLsGSZsm7FgJhQvkXT6yfBmh6dfFiTyHleg8p1ExN
         /r+w==
X-Forwarded-Encrypted: i=1; AKwUvBzO6l5ibacZ9wbcxnCDK8vCKXzSFOfrEDPnHWnROLzGsA4CO0NkGwUYPI/ucnusN49eiu71aPOGtJoGeDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z99h1etEQ9EO3bHLDlIU14cxFtRm/+zqM+3YND6qUFQ0wjm0+cD
	X3Lb47+A+UrLFWNuhzmADjOuHw8Ji4GrcgMiCmy+nUTnKls9pCsiJzo444xKvQIAc01UjPHYYPs
	Aa8HRWSg2+AgVKJ4MD47eEBr2i5lwjxk=
X-Gm-Gg: AYBFou2STGkw+0E3k2WPV2AwUFn/9keLThf83TrztzwfbHYf4ah2TPlzOPRWVTF61TM
	4TMtI1jFC0duH++dXpArXSAnV0BSKcCxg2r2j0FX2oo2QaBVjtXjMoF8Q+/oBJLx9BwPas0hrhT
	x7ukkLblb7hXgM5OzlVcwA+HkS4MX/bS99NbbAnVCtTQ/FCyTA50Mij1LSVOQbmZ9UQq88BFpiE
	hW/HecfNOQJnPKEsUimBCE7NCY2BIGFcM3tvySIXeFGu/Qy/aeFwBTm64ELk6tdHflEB2+/Pg8Z
	gHM9MlWuBxUyf5/kKIuMkIffJF+WID5OkyiHtIcZ8qK0m26b5Y1kM3uHXcPLHM++l1u2x3K9NPZ
	BRr73eymjaJVp3ndGzqT3vlUJJ2TrlYVn402/exLU0dm+wloHUDOWuXdsfTEmOZtYC7KY5uqkzi
	ziXTw4W+56saawQT7/PCugHV1cY48nYK+cN/zaxW/Ymua26KKNMa7ZzEzL2zwbRInhNB87PeRHn
	wl8VCY=
X-Received: by 2002:a05:693c:88cb:20b0:36a:1e50:e45 with SMTP id
 5a478bee46e88-36a423624d5mr22803491eec.9.1793799964016; Wed, 04 Nov 2026
 05:46:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103163921.641347-1-sashal@kernel.org>
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 4 Nov 2026 13:45:52 +0000
X-Gm-Features: AclHuK9zoI5ijuNEFX4IBI1jXKyfQ9YWFXRsUdy_iBMcms1sD0iTaUorTso-rIM
Message-ID: <CAJwJo6bgZKyU5zWzTG7-zvFCVbh=A4bd_qCmHEj9NTOMJ+_5EA@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:39, Sasha Levin <sashal@kernel.org> wrote:
>
> gen_tcp_addr() shifts the size_t n right by 32 and masks it with BIT(32)
> - 1. On 32-bit architectures both shifts are as wide as the type, which
> is undefined:
>
>   aolib.h:230:40: warning: right shift count >= width of type [-Wshift-count-overflow]
>
> Convert n to uint64_t first and mask with 0xffffffff.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>

Thanks!

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
>         union tcp_addr ret = net;
>
>  #ifdef IPV6_TEST
> -       ret.a6.s6_addr32[3] = htonl(n & (BIT(32) - 1));
> -       ret.a6.s6_addr32[2] = htonl((n >> 32) & (BIT(32) - 1));
> +       ret.a6.s6_addr32[3] = htonl((uint64_t)n & 0xffffffff);
> +       ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);
>  #else
>         ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
>  #endif
> --
> 2.53.0
>
