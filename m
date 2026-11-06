Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934091;
	b=5dwMeAolaF36mo/QJ5ed6u2pxIvKkTVFEqbqz76rNefLLWJTqAKEwFqGMQ4heXvAb7Vf
	 LvIfGttjveL9p/cPY270fvCN/W1/9c/N+iPxFzAl/dtNzjx95VL7HaLHrRx5S1GyfTzJe
	 uf5PDWaxQBKxEyYtFqMWgdds8gwzfDOcSzVsJyZxUen0Twz+HysIhztWjxWGMrD/A6/Ff
	 MRKTsJLyQ8HZgImH+R3BOMmtZ6ZZbSeGE43LyXCPhzoVnsgZ83jqxMDptUd4UQs1LMcOK
	 ZrpYJmomJKjVdjtLeqnCr4pNdSCC8BA9iiUkTTMx0RvjpUujZ5UvCKSne0f8GY1QI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
	b=mzouS2ABE3sEYkxHEUDxzzqh3py1gz8FSRDYkeiBqeOQOpG8WaB461j++h5Xnmiscl+F
	 4cSrzdTe6OOiXFhwQJXHvcHSddpKXYwrGmTeOV7Hdj+XbkxytFMy1cQpcm05G3Ygz5dcf
	 hVhh9TG8Fb5nD1gfs0MqDKxqG6e4trhyIpVoBRqTcLNFGXJ/QFMxn2UL77RrV2kW4dYNj
	 eo4wKNM4P2YhIlMR/RFC2/EVJnbmuPv8feYgBaOla+3qKqxfqD5q2r3piR5yr9dklgNci
	 VDmEhPZ9DfswkUZxAfipZudzhOdrkPW8OfBqsZO85j+qa7XJL54Jn78qdCxpY9FlMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCl4Gfy0;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BB606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCl4Gfy0
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9999f21f617so30003241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934090; x=1794538890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
        b=JCl4Gfy0EBXXqrT5LV6qnfQdzP0zEsd279x8qeNp9xw1/cvvvBRYQcDjrC6GVeX8h/
         jfNkCTg3MZ5RUsyP2iQuXxG4os7zuN8QwX7y81S6xL7pSjyoZk6R8TkaCu9hAu5Ei2Mh
         ZYkL52QTJfBup6LDoFjp90Hjg/RUnODdQXlU4YnyTkPTvCix/uDocjDzixnymYooFjcG
         mITLgCR0CeXhXzH+uQTVkTtGwBXuEg/5MeuLoAFtpR+R2QCNGMLBO2V/+KSn6tW80Y+t
         z+0aKEtK5SqkEXHYzQKScdpOb75WveqS3Wg+sjB4Bw2zM0KWOR9c4WxkJOWS2cosEbUx
         d+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934090; x=1794538890;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
        b=MSgiTrgLOnltHgfdJJkDlv7rD9e16OayveCd218CaObZm2g9Rk8/TtNKcJbku8Uw7P
         78x5TtrqEXkdPxntlzuEfd5PFPhfxsM4n2tYNoj1GpCEraUK1MHIxrhzZCpeHI3G4EKo
         byAO98bVbZHtb5OGQzLPPuh1s61ZoxDR4lLEHDLKnjS36HZDmZe05C1+izDut4H0PLv6
         mNQg2mnvvXshpzATGgs0+HC9r4VplTMDqBe57HlMpt7qyt/Mjp2wkps7/F2Vys13kHBs
         RoF/V/D+/L4TwABJfctaDDePSZKWa0FqlKAIDA+SaYsfOpFeze5bnIBzbj6sSFKuzY3F
         S49g==
X-Forwarded-Encrypted: i=1; AKwUvBxCwZIW+ALS/iiz7X2hyH9x/tw8Y46madFHLhOxTa787DxVcrOJQhxgDR2tOEZEn9F+tjgek1BO6tkyRbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OlnerycItk/ZLjqo7Tq4y6JPZylSmUJ3dS0fFv3M3fwF325Nb
	gA2xKmVRfNJ647TuA41HnNjRazwfciHz+26u1ZoA2s1woCSR5XxA7u9y
X-Gm-Gg: AYBFou2FK+O0gv2TTlD7ct2cC+K1kNFdHY211ldQGSUHgoUMTj9T1HnJPzVfGk0PFuU
	EHE3aI1ULVd0q6jnauTfkqCuVOZy+c9Bp1Cy7qLT1IgDaalVy3cT1EZlUWIgrrpXfjW6+w3TU4g
	obBCgv/w7ZW3SIjwqEo+B/OduFxz4m2akqcX0zWkfGGC4gKWtH2k8NrLg0zUWIUhAltsLh8DYO1
	IDCXNDpPvrbGethYTXtlf9PTkPkQ0rUR7tDhx84KKzfSg93ChcXZZrvnSL6S7tFiRS0CoECaT/k
	Q1v7wDQMKJ+ed57rBjScCFrjn+RYJ5f8ATona1WNRGKHrWXz3Sxq3TXAQR9jgiqh4CLqm8AqLYB
	hSf/b7ObNWssfkiLltFitxVnWb95rEK4Sk318uWp1UdAT6xDrYDlF3OjslzlbFDMbgfSsTz943M
	jxp/geShjRdTxmpJ2ASo2V0l0OQ6FeKnByKzAaczppucI5L16gsSEwpfcIawgv6fO5MTh7C+4Sy
	GZ2xaWWaKiSAmdaXOl66APbBXN2n2lwyCSS7uNgKme100jrHFudPGO0v+VKmIH9BKPKK0T6pUeS
	Q//YqazW9m61UUhVx/T+Y+Jf0aKg8rxvHMfG5wDk4vu+OYxffseyRqMdJHOJQh5yrxMiGGIAZCg
	8rHJRiEj8u+iKrofBfJkT7WEmHdl2gF8cDcydrZgmhJ57PKAjEkh9yheqcTmokr+eAHle7cM=
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr838027137.20.1793934090385;
        Thu, 05 Nov 2026 19:01:30 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8e48csm854885241.10.2026.11.05.19.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:01:29 -0800 (PST)
Date: Thu, 05 Nov 2026 22:01:29 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 willemdebruijn.kernel@gmail.com, 
 netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, 
 dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.1e8c4e152eca9@gmail.com>
In-Reply-To: <20261106021245.246267-1-yanxia@cmss.chinamobile.com>
References: <20261104092240.15649-1-yanxia@cmss.chinamobile.com>
 <179387153949.488856.16266299848614841295@kernel.org>
 <20261106021245.246267-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v2 1/2] ipv6: fix cached route reuse for SO_MARK
 control messages
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> Hi,
> 
> Thanks for the review. v2 fixes SO_MARK sends, including the concurrent
> sk_mark case that came up during the v1 review. Sends without an SO_MARK
> cmsg keep the current behavior.
> 
> Willem, you also raised the flowlabel and dscp cases in the v1 review:
> https://lore.kernel.org/netdev/willemdebruijn.kernel.6ba984cf38a@gmail.com/
> 
> I'd like to keep the SO_MARK fix targeted at net and handle the
> remaining cache issues separately in net-next. Does that split make
> sense to you?

Agreed that those additional concerns should not block this patch.

Are they net-next material, or similar bugs and thus also net?
 
> I'll wait for your feedback on the scope before posting v3.
> 
> v3 will also add a fwmark 0/0xffffffff prohibit rule to the
> connected-socket selftest, so reusing the cached route instead of doing
> a fresh lookup fails the explicit-zero cases.
> 
> Thanks,
> Xia Yan
> 
> pw-bot: cr
> 
> 


