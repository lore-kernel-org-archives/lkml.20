Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610666;
	b=KsGExdQguW/njkV0XrTdZZN8CA32JS0RILc42BFCDovq0KjVNoYdmKVxKq/Uz9aEZOKc
	 rMJdIjk1cdFYqjI9KO1LIjppbjObfNp9UCwb8Jz8KA5zF1czXOQWrweXQnI4hRGom9Qo9
	 HcTqvp6Q4bbjMmoGsjN/6DiDsJ2SQkZFrFjVWztQFVIwjLz78/9Qj0tjFDt85itRlB+Cc
	 xt8RX+j8oqOFcPU/cTNi6yID+9IBUF3vvl5abOAh07NJTVud+g/dUsT4Lkttf51h3oH1e
	 U+iEsmueLCC1EwR8XYm+XXbDJd85hRDl14usYuOu52MarHgX/z5J+T6WHXtBWZ465Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610666;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D5RkqP2tY/U34SmqxIrtmZ8h9C95VS8eUS3H2JGyIcc=;
	b=02mfZRefYxc5TPbsHV5wbXFIKVgHxnnkkntNEAFMuNAZi6w3Jn9ucD8VtcgQW3m6xI3M
	 rb/IntDsbeSRHnNiI8vl5OE14K4HeEAG/qD9GGXo+vKYJHWNyuEcbC4dF2loL8+53drNE
	 yBpj3cAlZXE/OQhXKnXq01Xp3D1YB4ivCyntcEZOXWOuYlRLkwJtKyon3V+F0mFRlyYS0
	 vxBTpO9IZy5XJ1d2cktzv/ZCeX5xXhwSbt/uch5wa+fqsqIt9PZWQ7OQ12nrCfgYNlsni
	 f4jTMLXNidDngKOsYOmFXDIZO2NgiBZB2N+756xynXe3xAiwgeNTNFU9QSWgwY1Nxeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4SIFBEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CE1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4SIFBEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B221F000C1;
	Mon,  2 Nov 2026 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793610666;
	bh=D5RkqP2tY/U34SmqxIrtmZ8h9C95VS8eUS3H2JGyIcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X4SIFBEx0PSNmylZuL+3YdIyiZli5R/xegiTYNYEIN2tDTbZEQEiopQkKOjGCJCoI
	 GHb0fgaDRJbfVeeIaVcbqr0yotGy/O1omVb7TM70lmfzREiDUf26bzQUzRZ/vKTSUD
	 IdCQkyXGVYzqbgSGMRFqn1LDUdajA6N6TThscDq+R6xLXFNrSBMDp3f9HdrwUmGV8p
	 1j1WnUfsiDHFLjEhIx9keqVwzBbRfOZMzBKBtceQWjdNX7yrAFjKfyaXiQgQT7mXNL
	 LZul7GydUiVIn7ELkV6ENFNfGY8oO98MbQqB9Y8y1Twh7Cx+oTy/zHbEDrJL/7YwHG
	 g5uLDONS4fNXA==
Message-ID: <5d79db66-2195-4f8d-a721-e1756bc6ead0@kernel.org>
Date: Mon, 2 Nov 2026 10:11:01 +0100
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
Subject: Re: [PATCH] mm/page_alloc: release isolated freepages on compound
 range mismatch
To: Zhenghui Hao <zhenghui.hao@qq.com>, akpm@linux-foundation.org
Cc: vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <tencent_869149E9C4305627F0ED654860AC4DDBC309@qq.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <tencent_869149E9C4305627F0ED654860AC4DDBC309@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 10:06, Zhenghui Hao wrote:
> alloc_contig_frozen_range_noprof() isolates [outer_start, outer_end)
> before checking whether a __GFP_COMP request exactly matches the
> allocated range.  If it does not, the function returns -EINVAL without
> releasing cc.freepages, leaking the isolated pages.
> 
> Call release_free_list() before returning -EINVAL, while the pageblock
> is still isolated, matching the cleanup already used when
> isolate_freepages_range() fails.
> 
> Use WARN_ONCE() as well: the condition is reachable through the exported
> API, and repeated invalid calls should not flood dmesg.
> 
> Tested with an order-9 free pageblock and a one-page __GFP_COMP
> subrange:
>   before: free_buddy=0, leaked=512/512
>   after:  free_buddy=1, leaked=0/512

How did you reproduce this? Using a hacky kernel module?

> 
> Fixes: e98337d11bbdf ("mm/contig_alloc: support __GFP_COMP")

I thought we discussed this in the past: if you are able to trigger the WARN
something is messed up already.


And indeed, same patch already here, SMH

https://lore.kernel.org/linux-mm/20260629-free-pfn-on-alloc-contig-range-error-path-v1-1-496ff9ca22db@nvidia.com/

-- 
Cheers,

David
