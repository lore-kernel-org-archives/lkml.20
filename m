Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12240801E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768974; cv=none; b=YyY1tONa+yhK37b0CCq/COKm8bTfFwE3pg4Pk/SFre7iznwJDJg4YfmmYb2ruWTlFa+/RIePfEL2LiKAhjob4Vp9SZ/p/WjtXLRpJRh3XyAKe/Ui8PEpNKYoJXkh/AV5A3x7nZRsa3b1foSWD0/WmXJXGgPBSBZbDE5bQ1mHJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768974; c=relaxed/simple;
	bh=xsPLflOz+XM6DlLpHEYq3ndIt7wtTfSiDxsTp+sEFHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0EeYXu9umg5rM1aX9GdegWiRvnLI1nHlDzP2lTevB1Nl8rr4exwg04GX9Jj8UsWwVX/jawBKDnLkdC1c+AErMtA9LRltZyZMzUDfebBAN467/VOUlHMOlnoPSC5NfTuv21A1ygP0dJGOXDQLrcK0kBS7hkGj7kVTMt+6hXTVg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DeN57X8U; arc=none smtp.client-ip=95.215.58.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DeN57X8U"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xsPLflOz+XM6DlLpHEYq3ndIt7wtTfSiDxsTp+sEFHk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788768971; v=1; x=1789373771;
 b=DeN57X8UVlkizsTOYyiuA5omnGFZZe3sR9zrxv8HuqkdFv5cXACvMJigsK+iPxbjgvzPEuTO
 f0JITr92y74TSkKIzOsvc+NsltEOyOLgxBkNVzCRK2ngLm1jStpkW1xKZIa3tFNojNrYW0Gy637
 8Fyr5EewfMyyvbBsglRHj9dg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27a189db38457c1a;
	Mon, 07 Sep 2026 08:16:11 +0000
X-Mizu-Trace-ID: 27a189db38457c1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <aa963ff1-0cfb-48de-ba76-d37467676a78@linux.dev>
Date: Mon, 7 Sep 2026 16:16:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: fix repeated word 'to' in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>,
 Harald Welte <laforge@gnumonks.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
References: <20260907063804.26581-1-hemanth.selam@gmail.com>
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <20260907063804.26581-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hemanth,

在 2026/9/7 14:38, Hemanth Selam 写道:

> Drop the second 'to', reported by checkpatch.pl as a possible repeated
> word.  Only touches a comment, no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/net/gtp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
> index 69fe5717846b..4aff23bcfdd1 100644
> --- a/drivers/net/gtp.c
> +++ b/drivers/net/gtp.c
> @@ -770,7 +770,7 @@ static int gtp_parse_exthdrs(struct sk_buff *skb, unsigned int *hdrlen)
>   	 *
>   	 * This length field includes length field size itself (1 byte),
>   	 * payload (variable length) and next type (1 byte). The extension
> -	 * header is aligned to to 4 bytes.
> +	 * header is aligned to 4 bytes.
>   	 */
>   
>   	do {

Typo fixes are cleanups.

Please specify the target tree: use [PATCH net-next] instead of a bare
[PATCH].

Thanks,
Xuanqiang

