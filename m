Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855899;
	b=Q5+Pxb1QN3mrflW1c2TiEZNyhYk7C4QRmm5f8e7amZp8nuoHLyWkTWBc5qgISSaNNh7s
	 kW31sy2Vjcb1lv400pv8ynpCuIxSzpokbJyMEGXX/ibw11CXLAQUN6tpFAM7MpDaOOdjQ
	 jFPSXW1fPbqFewsiiqXKiIl5JAA/XQ+ND2lGkThk1wDyJAEAIa+0hIttC4GmsCwP20xx+
	 6yZkkRnkBynouHfCz5S+mB2w7o8dSDaxcb7QxqZOwz0McTfjI4xDJrOSxKZCt3aGGkWOZ
	 DsA1KdntGQXaFxl4EkqUBB8gpNsWZTzf19aWWXVQI/BCajGBS+xgw5xlRBToGtGWsIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855899;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=EHHTNOyGnr1PE5k2wGmLgV3xyiVaxO8J8/TzziII9T8=;
	b=5Pa6+1xX+JyVdcqSNZebfFfxfYP49i2QLpYIb1pXdxqVZZdoohsBJ9cTHxz1PSebBhkt
	 RhB9jjY+USTLjzjPrlssJTdVDgWShvoxGl0OkmOd587xLEHv68jcKM9hjZVkLF5TvucuQ
	 1YNZCtAJ+6VoCkfFVYSLN53efjAbMRpsGO9GNQWRcAwyr4ltDO/Fxl2q+9g/WZde9d/Bi
	 6t5+y1fd0p/fN8vTaNMKxIKe7BPoYWed8PCp+Y+ts6Rw9Ilf2+llXh40RF6KOYnKmE2t5
	 FqLB45fKqnu58JZYk6PowolJlYDSvcP+SQL6TsFciXaOKTGiOF+NtskI0iwz1MwfJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iIUY62sq;
	arc=none smtp.remote-ip=91.218.175.231
Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91502606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91502606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iIUY62sq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c1YgwgSqOv/daQ+67ELiYNYLj7qD2N3amAckkdhSUFU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793855896; v=1; x=1794460696;
 b=iIUY62sqPmW2pMv6ePdgQW66I8R2QKho+cZ+beRy3JpXoTHp1SmyC4FJVzNpsPofkSrP0ZbF
 df3S1o3gvdk74hb8luIwDiYBP8G02Sx9Vqc11wtqZLLaKXVxU55pcUCk5gZvanh67ffmnd6I87Z
 GwYBa0qIXYejXkd6Yb2mZ/vU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6facb84ef91715ec;
	Thu, 05 Nov 2026 05:18:16 +0000
X-Mizu-Trace-ID: 6facb84ef91715ec
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 3/4] mm: hugetlb: fix GFP mask propagation to CMA
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
Date: Thu, 5 Nov 2026 13:17:57 +0800
Cc: osalvador@suse.de,
 David Hildenbrand <david@kernel.org>,
 akpm@linux-foundation.org,
 azpijr@gmail.com,
 Lance Yang <lance.yang@linux.dev>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <711211AD-BD2A-497D-8541-B63C68509920@linux.dev>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 5, 2026, at 12:07, Qi Zheng <qi.zheng@linux.dev> wrote:
> 
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> cma_alloc_frozen_compound() uses GFP_KERNEL, allowing direct reclaim
> during the first MPOL_PREFERRED_MANY allocation attempt even though
> the caller clears __GFP_DIRECT_RECLAIM.
> 
> Pass the caller's GFP mask through the helper so CMA respects its
> reclaim constraints when trying the preferred nodes.

More natural.

> 
> Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

