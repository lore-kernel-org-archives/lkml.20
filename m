Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52848097E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256053; cv=none; b=rdSt/I85PxF+3ARfGAVfmdkQDjBCwZUHiLf1QV76H+Ia1R894sFK0VDPavX/zjZfnbr/NQ7dy6RZSMeQRZBV/veMa697jhmB/Pv/fPKA0HwflK3xgwfH7GXpdZZCINortq7NEdFUbGZVWGUJeXTghDIGQJTdPVJqjqW/87D6bBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256053; c=relaxed/simple;
	bh=EnvthftjhvU8ihf6MuZ2HVlJqWyKvLQbdgWDQpD+FZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4KKSXdMTMYu38Gi5X32R3AtUiBBgANIRNOpZVa8ZNTqq0JcZlCQf0/8COnmIyo571lkXZ+3FidgKI20UyVpSJ1XqfNmuTWu/sRjm/vokR3rOgrNxRylPiJRYKrCD2gh+kqkyFOtj6q/zhJAiDeMo4Pzm3tZcqcbpztl2cWkJi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=0SaMmP3B; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="0SaMmP3B"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so1785062f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790256046; x=1790860846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3ndpV76gcHySuhNV3ES4GgzpJyufvPVRLRBa1QmBk4=;
        b=0SaMmP3BywW+Q5Jb2EekN3/OhS1Vh/eQz2epGY/udxmNw/hbTBnMJUPMUfbCkajwUJ
         i6itq5AHC8A2EnY2f3nWvSLV9DSRn/yx6IB+2sbDSYXG+20GT/VJUjnYC7SaeKgs4ulY
         Jem25oiH3W1uSYxxspE7tX/ZC73tvMyLB2Gn0d63EnSLeKk6BWnHDAV0LbTXyrFExHSJ
         m2TQFAoHQtQJVSy+8oGvvisXLmwAoadL6JS5L0425DEdI6G8upiXJNetZBrOcqkK6TOH
         rjb7QJB4FbqRa0y4odrvgHdUFIcoWROgZLjpMgRwcn1hotCgzde7CjUbQnLIm78/0WSx
         ZmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256046; x=1790860846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3ndpV76gcHySuhNV3ES4GgzpJyufvPVRLRBa1QmBk4=;
        b=bkl0aJLdcAImmOnvlnp2nIKFU1daoZfg0aMowJMCdPFOCwqkp9D5S4TrI6lmUcIBgt
         ZgEERIjRzBp+zyzPYFFsmTm1aRC8nObSCS5cqQt7wykAGdJxCTVsFprftsMW1SpNJHId
         QM1gh8ZtClLPfr8q93dWtyKa6qiBsYec2jsEQr9fODGt5slgAvq0xM/05ID0OTO94s2S
         DlS00H1mLGTFIKVR8d/bvsISP60+BGhsKTmIgs7zrNhp7lypB7QsDTtDK2Rrb81Whsjz
         48wG0y1xP/jLvJ/M6uBRvAXJVn7YAbG4V1AWJFrXWllJkDKwrhToM+AvgeFeiv7MxEl4
         btAg==
X-Forwarded-Encrypted: i=1; AKwUvBwRDZ+JeIBxkwYA/LRHdcp25J4k2D6Src14VuCYRwCDbChla3e/7BeJzDbTv2WB9FzsnjvBgxOHE08kjH4=@vger.kernel.org
X-Gm-Message-State: AFuF++knofrgH/U3m4KEUKXiouhN/fLeuisPZPo49i3BZcbrex+IyM6O
	sapON586oz/nuH5Y5I/DJArum0fQFvMAREiqQPXz3XJLJPo9lzO2ZxPHqznzoIAUZfSX2oMxbEJ
	RZ7VK
X-Gm-Gg: AYBFou3Gb+2dcuD6l+NG/gay/180cwyoORmqtjmIFGxmzoUjMn7InS1ykL/bDQCAy2X
	BZXqZN9eiArzTXYDsw3hUwAnR8d+rr1tSIMpACeeP38YgmhKfCNT70AWh/Mp9UWHAL59zQh6mU2
	g30qz8qwn/jey6/6Y/aqVUdT2VyT94EkAvoVfGpUPfRSoP4ZDk90p8xJBlgqu7yrMvaBZ5++bBE
	x3zgWL9Sv2GVr3/+GpK9m0MidgmzI7p5S3pO2ggkR9EW29C5RFpezef0vWASbKWZlJRxW9d/hUI
	lRNvKUTVtF/HIaKy5MZCWOOWaSWk7O+dv5TyQYMwLhhwdisJtrhaqNw5seNdUf+XU75eacP9518
	tzoV9k8HYzlVxzLfIMn+3HbfeS7J7r2uYdwLKC+b6b4j/CEf8B4gJLJDD+QTkbVjQlZVfqfYG0T
	ihkhPLvmgiHjpR6ple4ZOqlDflCz6jBk3eABXq62J/v0d7Q4TcGc7jtPvSDgeqIMll+zg9K0Ndf
	IMxur0VPT9TBkwhBZ38pQwWhGDKWPGvmpRKlPpqHmD/C7HM84YoDA6r
X-Received: by 2002:a05:6000:2083:b0:488:5c28:94d0 with SMTP id ffacd0b85a97d-4887172596fmr3965034f8f.19.1790256046354;
        Thu, 24 Sep 2026 06:20:46 -0700 (PDT)
Received: from [10.190.130.145] (046125162068.public.t-mobile.at. [46.125.162.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2d5sm14280483f8f.27.2026.09.24.06.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:20:45 -0700 (PDT)
Message-ID: <d6dc53d4-e2b2-4012-9ef9-6c7c15b51c15@linbit.com>
Date: Thu, 24 Sep 2026 15:20:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: remove unused drbd_nl_mcgrps[] array
To: Jens Axboe <axboe@kernel.dk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
 Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linux.dev
References: <20260519203057.1340528-1-arnd@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260519203057.1340528-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/26 22:30, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After the rework, two files have a copy of drbd_nl_mcgrps[], but one
> of them has no references:
> 
> drivers/block/drbd/drbd_nl_gen.c:641:42: error: 'drbd_nl_mcgrps' defined but not used [-Werror=unused-const-variable=]
>    641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
>        |                                          ^~~~~~~~~~~~~~
> 
> At the default warning level, -Wunused-const-variables is turned off,
> so this has gone unnoticed.
> 
> Remove the extra variable.
> 
> Fixes: 8098eeb693c4 ("drbd: replace genl_magic with explicit netlink serialization")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/block/drbd/drbd_nl_gen.c | 4 ----
>   1 file changed, 4 deletions(-)
@Jens ping, seems like this was never applied? I think it should also 
apply to the current tree.

Thanks,
Christoph
