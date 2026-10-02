Received: from mail-m12752.qiye.163.com (mail-m12752.qiye.163.com [115.236.127.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388D36654C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940304; cv=none; b=SVEUMscL73XNA/szLyZ+4mUd7cK32de/wUNvy7/qSm5jTG1gfMTw0pSLerdzbM1cbIhFwNmsKCA+C0fS2/LDxu3CF5Nhg+TY5Z6lQ18x17LkFPtKZnnka0yG3ML8TZAawwTRvexpa8Lsz2rUHZKT197lBNcKE2/2Yt3/JnFgCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940304; c=relaxed/simple;
	bh=dq0F/aAHNUe9FAnuGbaCA4qaGRIMaIj30+EbugzODEw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ioPynvcFDEPBhzDmsma+ccuW8aHewYHs7ZtdDRBQLJLo4G9nINaJoO6yAbxvnavpzdtp7FlCOAoDuEEJmc63YDJcGBT1URY5JyDNhgpdgPkWTgEwZdAPJT2UdBAtmV/wU9TTF8h/9KEhemhbYOIcrpyWiLGVZ7HDpdIMIXvqVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KXigI8v2; arc=none smtp.client-ip=115.236.127.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KXigI8v2"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4fd13e284;
	Fri, 2 Oct 2026 18:09:13 +0800 (GMT+08:00)
Message-ID: <0c542580-7da3-4cf8-ab0e-9e513842a556@rock-chips.com>
Date: Fri, 2 Oct 2026 18:09:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: akpm@linux-foundation.org, cel@kernel.org, kuba@kernel.org,
 martink@posteo.de, linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com
Subject: Re: [PATCH] mailmap: update entry for Andy Yan
To: Andy Yan <andyshrk@163.com>, alex@sverdlin.org
References: <20260924105052.768760-1-andyshrk@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260924105052.768760-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0fc16e21a03a4kunm2a1a7772a092d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUtKVk8YTh9NHk5OSBgYGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KXigI8v2lCWQvclx+rBrcNDA8G+BNuIFKTbuWOT7tXvLL7sOLdyde2ZeQhsO9+x5WPxKCZ+gemx6HUAWVHuJAVsRdSNu214ruj/WSoDyIJxucKqamzrj9keaPbyZdwEIl1wJDszj13IZNF9goQ0NiN9s2QsLX0yTErg/YH1ZXvU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=EGN6ewbDrQzwkBMATRb8aP3C2LC/82egWXy2aB2zssw=;
	h=date:mime-version:subject:message-id:from;

Hi Andy

在 2026/09/24 星期四 18:50, Andy Yan 写道:
> I will use andyshrk@163.com for future review and discussion.
> 

Since your rockchip work email is not receiving emails properly, I would
appreciate it if this patch could be merged as soon as possible.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

Thanks.

> Signed-off-by: Andy Yan <andyshrk@163.com>
> ---
> 
>   .mailmap | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index 1f5540bc33f1..9a2ddcf1c7da 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -101,6 +101,7 @@ Andy Chiu <andybnac@gmail.com> <andy.chiu@sifive.com>
>   Andy Chiu <andybnac@gmail.com> <taochiu@synology.com>
>   Andy Shevchenko <andy@kernel.org> <andy@smile.org.ua>
>   Andy Shevchenko <andy@kernel.org> <ext-andriy.shevchenko@nokia.com>
> +Andy Yan <andyshrk@163.com> <andy.yan@rock-chips.com>
>   Anilkumar Kolli <quic_akolli@quicinc.com> <akolli@codeaurora.org>
>   Anirudh Ghayal <quic_aghayal@quicinc.com> <aghayal@codeaurora.org>
>   Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>

