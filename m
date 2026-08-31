Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8935D314A60
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167660; cv=none; b=UUmqpWyml06AZyl40VaMM/8wu4GWSf/7oxC5zMljA+kDxM8j2YjDBUQW6QbWgmgX7Bcm/3tvhm74OfNX1HpAfgahYbgFpoQApPnwWe90mq+3wO+xkxYoWP6jwz4OX9mqr2eW++cB7z+mXr/91ZIvbYLqojTj1bPRrvfiiS9zg44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167660; c=relaxed/simple;
	bh=Iiu36uPx5BDwkkFBUZed46ZW7Ls2oZHtivqmUwCVh+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIJwx6g3CcxRQAMDypDzQwrK3Blk3LeLroEsorZWmPgI888ckQZgugBudoFBE1DjWMqaIKRgPvxXVObboQORZ1UIA8JKwIJgJp7squiMoGszpnZC/rsQaspIS1+DPytQutexgA6vTy6EbQioQZq8w3JJYklI9NprKbVAsk82Ooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cNYVh093; arc=none smtp.client-ip=91.218.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cNYVh093"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Iiu36uPx5BDwkkFBUZed46ZW7Ls2oZHtivqmUwCVh+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788167656; v=1; x=1788772456;
 b=cNYVh093wxUgQ8JJeKoLaxbyJJR172a2ECG849duc7OhvzYrk5HCHk6rpTilDHD3z8lFd/Rj
 uSBVgVoFrrkgXfAquSC7U/WmcJ8jZFHekxw7FG4semIX3t51H8S0ywESPC/XTFFnS767Bd/N7gz
 6sv4rabbxKi0nhFIAoIRUgTw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ecf1c50fc97867e3;
	Mon, 31 Aug 2026 09:14:06 +0000
X-Mizu-Trace-ID: ecf1c50fc97867e3
X-Migadu-Flow: FLOW_OUT
Message-ID: <34412f02-d2b7-4717-a9de-cbe1acbb7a87@linux.dev>
Date: Mon, 31 Aug 2026 17:13:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Content-Language: en-US
To: Dev Jain <dev.jain@arm.com>
Cc: riel@surriel.com, liam@infradead.org, ljs@kernel.org, david@kernel.org,
 vbabka@kernel.org, harry@kernel.org, jannh@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
References: <20260831082849.3573957-1-dev.jain@arm.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260831082849.3573957-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 16:28, Dev Jain wrote:
> Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
> the folio_test_hugetlb() check.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
