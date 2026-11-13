Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587010;
	b=4h+ANsKm2xmcsy+dAImKctNYEp1Ro1Nh5XVvjYH53EAjBeSe4FgPNVI2d12tUpwAiRc0
	 LbyOQWt+FuFKdFxvJkb7UM4WqMppBrFN5wWYcGVdVJ8S51Sn5Yhmn2IpAiBpFq1iZx5Gi
	 AZdAGiH0odhYIsGq6DXYs42NNb7apl9SR/vgLGoxVuB+P9x8uTmWf8x/mqJybATzN22qC
	 jtxiy73TmjL3ayoKrVs4WKksbbl/pMHSU33a/Kuh1gE9DR/MPFmdu+TwYxKrmRq+yr6aE
	 7LIAChEVMqQ2W55S3HybqlIcJq5+28/Mx1quNO4aLJ+0sPWkq40UHGaUlwqOQbUFbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587010;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7ygUWNK83rRYJwfnw1ofgc/sFSy5XCn9E0wwTw0flfM=;
	b=LG8ChtOHuu7cOerVNnBvSnR/zY2rwS34Pagyqvr/xsKkSoer9nkJ62epnE2Y+GraOhGP
	 oUpQaKxllxiElF5mB53UpOQbiKRyrJhUOjAX91lvDirb5lSZhfSjz4mhaw116QuIa+/dp
	 GcpeKMC9v9v04Cp7y7lEjAzKy3VKypKyT8dQXPmvQXFXtGR4tWu4HEnWy87fVLbwiD271
	 tZSTv9bZExrb8Yl/ngD41x7J5WKm3gBTo2YTznvncdQonmhiWozqK7jhUeFgJ69lA3/In
	 h5vx0Hpc72iUHAgQg5r6vBcn7g23BwgRsFa/5Ob8nrP2WqUDYQ/zBQ1HA+kDgFC0yvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pWAoMQcW;
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955E606C546
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B955E606C546
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pWAoMQcW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FxqEzZWLExR1Wu/Gy7LgJUR+WCtvd+WWmj9g5Dp272w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794587006; v=1; x=1795191806;
 b=pWAoMQcWlltsGQzjWMX9FqtylHtl62bcbMyVRrzPGdV+ToSIUkpXlb7l2w1LWlov2DexAeAr
 e+aowXcCY/7kLAi7Ueg3WCGQ97ReYsrr5IHwS3vETC0JKLnwsPCEU++WhfLec0LP34b4e5uy4qq
 Qz2oXEpFczKD59eGkdEs8L7c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 80e629e5a87ae717;
	Fri, 13 Nov 2026 16:23:26 +0000
X-Mizu-Trace-ID: 80e629e5a87ae717
X-Migadu-Flow: FLOW_OUT
Message-ID: <a74c04ad-a130-4b28-94f1-e94071ce4e0f@linux.dev>
Date: Sat, 14 Nov 2026 00:23:20 +0800
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
Subject: Re: [PATCH] tools/mm: add page_owner_filter to .gitignore
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zhen Ni
 <zhen.ni@easystack.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109110139.216653-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261109110139.216653-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 7:01 PM, Sarthak Sharma wrote:
> Add the missing page_owner_filter to .gitignore in
> tools/mm.
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  tools/mm/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
> index b4ac68a08e1a..2d08f713b664 100644
> --- a/tools/mm/.gitignore
> +++ b/tools/mm/.gitignore
> @@ -2,6 +2,7 @@
>  slabinfo
>  page-types
>  page_owner_sort
> +page_owner_filter
>  thp_swap_allocator_test
>  gup_bench
>  memory-failure/hwpoison-panic

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui
