Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876944;
	b=m5d9JaJoGjLSpZlGpJN5OnUoYrPcV/CFaLJeKupulAgfIzeM1szxDLMEgyRhTffA+Pgg
	 3bQuxXvsTXa7gOMkyn+OonRJQGDk2/XtW9jiKUCsRuG+6ucKzcUMTce5F2tcO4SoFLh89
	 HjdOA69Y3tddlCE2lzubGoIRywBFKEWXqjcJc237KR72QvS3q33qXoRETDDwVKTu02gtL
	 WetCRJTCH9gEqtl+udL3aftyjrxsOgx3SYdLdZhrXyEzdgbUGcRzZVi4RmrTfqJ1LieyJ
	 0pC/SvMmMsPt0iSbajnIWHGJK/5KzA3aXcy7q/flAC+66vsTrnS5lMoUM3lvYg76VuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
	b=2iOPTQbh/RdI5nWVv1y1ZxPnqHiBapwP1mpwiwCeCN6nHz7PkLRecnxYOz4RqfuadhS+
	 PROlF+XiMJ1sGUEWU8unNdfuiBrgBYZpys88+HLoKqRdS9DOdNRmsZFbxiGGbxbYE3FYv
	 FKPBs06PbAmJAKn8mZJD5sU8xlNK/i8DGHM5putwIHomggOShd5aM6tJymq8UPjzahvF+
	 FgZpAXAQNkNoeNPeEysNlRtoWYo1oW/yQbIg95tk9KdUUzni+CBrFJ8W5R1R6s/kDRHjm
	 B8xMta5mHOe6NF5EmyWkU3xCb9quR/GWbB5dI6W8/2MGrvoKSu1yCpnJv55Al0zTS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anxDHPe4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC3606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BC3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=anxDHPe4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11562385e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876942; x=1794481742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
        b=anxDHPe4qYMe5qqmqd0MSMf65qP4moQA3GuGNN2kFJ+wr8FIpecXPAEKrLywhHBhE3
         2ONRWPNI7u8WJN0gJZ/c8AnHRMkPlOVO01cuLkSSFLEcSPryxLODI6bauIVLTlF0TY5F
         2pDiuFpM6e4TTNg+vPvEsmsCJ5oW3j4HCqBqRQlbW2/D4vQX89c5/XEoZicysquf5IUa
         WgDJajZBM0cyTAhZhGK3Ww0V0Oi9XuirTLBUYTvsUvxPUrrUkTz421u5eC+XwAjtcvMz
         WCyHa2EuZa6qtyWvylKJ/cNaLw3CYU+136vYGmfWlVLKwSBFF/eXkbxjG4jhnr3hRnRI
         faUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876942; x=1794481742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zh47PhyGNcCuyOqp3+KQ7znXgLobnEyNmBv/7LObTI=;
        b=d7DYrs6Bj5jglSpTEgJktJX0kUTXYro4S2uc/EvYxfap3Y9U2MGQQnQ7Lw6Ug9UGcX
         fprklWEHIWcmt8ooeKgf10LdHD6BA8JbnRki6q99Loe7PekuPqzHHKuMQ0PbSocLwWyV
         e9bLH9WMnU4jUq/QWF9pUka5WrkQfrXjlb6K1mM6q6qfXkNDVuNdRUbCaYBm7RcCW/D0
         52CNNDb28qzZcRCs1+yXWyXTASVgIG04UoGnAByUA81lSYZ1PIJn/musnyGqojvN6OHP
         OPLgQfg4nuPRvXrNOjkDv7xxeqtiAxnLs2d4gSwyDE4KuvwsLmjFP13APx+rbMi1Sq/4
         ESaQ==
X-Forwarded-Encrypted: i=1; AKwUvByPYU2j/Bwk0hd9HR2u9Ed9RerLVdqofgAn9JQwFQN1sQnbxbY+N0K8KgN+AN5d+ufg5RUKH5DH/+R39ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y/0NIJ3sRzCs5xfc6AejIr9XIS1cd4I837lvOk70TL4iAX5Od
	uQQK77OpzZuymQx69cp5exfkjxvdfBz02BJ113hNWtEGGd302a4hGwBx
X-Gm-Gg: AYBFou1B0fhKJCHu7WtRMueveDYjq+EN7yCUGOz4rxv6OWTJc2GzUjpAnH2BWwNGILJ
	zZsQ3qJFIPxUO+CGRltnzZUwx2GkWka21TCcj73K9FnAHOpKixXvGP3c+ZgSTELsfeXUgUDzizl
	I/04twR9Wn765blEL9rHgF5thHigjB5PYkPdlZREXC1TnqctM9FI1oHvKlcfpAOjV2ZZvo3xEEj
	pTNQ6qu8/+9SpOn++30XNotbYTrQTbPzWIy/+KaLmCYq7kY5WHaMiC/PkSYJtQmlu7nxFEn7xve
	ntm1kih8SQXA/JYI5yCM3C/xplU3rk3xllnpgmHenetUeEhAmo0jEFgcm8NNfPw4SsDGN0M/480
	wasz5z7JvmmKHnkMPvAjdYJGbz5VxuBh2UzuimYiGsklDTRumoqLa1ekuUGpGzBADWRf3eKOAgr
	p5HE/pGFR97FLY4MqN0fhO7DQAOjuhKOylXgeD+t8IIrPf20CMQWmlz4w2rXoWRs4u1k+zGnxw5
	KQpdLPqHKSByRz+TU1FOdiNXPDIu9um1tmGgQ0tc742coQrBF/freqIiXDzlMeKl6JK5yj7Qh00
	c3gD3bAJChyyqcjYbUwEc2psXbk49EGfKZCdLXlBDI+EZzduvk3LiryZUz2LaTKD
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr457195995e9.14.1793876942030;
        Thu, 05 Nov 2026 03:09:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm110253935e9.3.2026.11.05.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:09:00 -0800 (PST)
Date: Thu, 5 Nov 2026 11:08:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Dmitry Safonov <0x7f454c46@gmail.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: tcp_ao: don't shift a size_t by 32
Message-ID: <20261105110856.2dc9f08c@pumpkin>
In-Reply-To: <20261103163921.641347-1-sashal@kernel.org>
References: <20261103163921.641347-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 11:39:21 -0500
Sasha Levin <sashal@kernel.org> wrote:

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

You don't need a cast or mask there.

> +	ret.a6.s6_addr32[2] = htonl((uint64_t)n >> 32);

That can also be n >> 16 >> 16

Also see upper_32_bits() and lower_32_bits() in wordpart.h
which might not be available for selftests?

David


>  #else
>  	ret.a4.s_addr = htonl(ntohl(net.a4.s_addr) + n);
>  #endif

