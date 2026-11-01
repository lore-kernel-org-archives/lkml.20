Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515974;
	b=S061tBU++1mBFxt6YzoTjspS29UnWDu/D5Snzhz2TU4r0/08nfe0QvDSJRtZq2rtImg1
	 fS/U5NPrUXvBeqnPkXAvlMSCbMXRIl9S9tg5anqNgEgIXf4NcqIiqsKbax4rY5ziRbw1z
	 CiqC7ahKTdPdM8oSyw48kb14/88Q+eeAWSSYb2xc3Aiw5PwQ2lfegfyGMT+izKCTlKQ5y
	 mKA1hqcL7lUfPi2WUGaOfHfLD2jHZrE7i2SDoRMAGFOnWb14jkflCQJfBdFmqCZeRrMGB
	 hKP5292ThI0qtL6TgvrY5UCITpkVqYhUY5Zb7b8Ii8oZam5YRqU3DI2kudxpWW0XYyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515974;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QQnXHU+A/njXkjBuQ9/DcvI7LMxW5xBgeBSnAXxJXAg=;
	b=aptXBF5qyQopBLR36XER6qHk4R4TSSRUCKQkzmnqnUDCVF2dqjaoYHOXCItiJ3O7atJv
	 SyvBMQNE7b/mJaSgD130e2ATbr/SMW3eJnLOA5LSBjuTiy1NgBodNk/h4CGavuS6NNl8s
	 zftrQTFNDOVST6/ODJI9Fl5hjS8t7ayTQcOEizgmhZwkTC8Ly/h1Rd3kVYRaPHyRODtkp
	 9gN4tbRtaDHBP/PJcyoxFJKGEK+a9YyLIrbm6XncF1k10pDPoH/lEcXtVImleOOQxXg8P
	 JjUqeUOKfEAle1Q7uR0qaB3LrvsFn/8CeS07yGzshKdQ/FdYQeRe65DcP7Zb7SpQEcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgkhxIjw;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC5606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBC5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgkhxIjw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VNtaAOoW+YeNbOlKOGrgoF4I4ASqQptOoiNDDPoXrXo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793515971; v=1; x=1794120771;
 b=jgkhxIjwuZRRahGL2BMMkycOLfXl6DIniXg5zLsaqY5Er8DlRUuNnzs0pNBTvC+fER5gYQJW
 zGmFxwEBqEVH4st68jkAxG5CB8/qwU8GcbAbt/jKfD8MUAndYMBvaZX+MPTIpxYB7j7tsdEa8mh
 osp1qX5b+KhjKZlHUUCicsOE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c012510bd8f1245e;
	Sun, 01 Nov 2026 06:52:50 +0000
X-Mizu-Trace-ID: c012510bd8f1245e
X-Migadu-Flow: FLOW_OUT
Message-ID: <c643b1f6-2b00-42f0-94c1-d65eccede5bc@linux.dev>
Date: Sun, 1 Nov 2026 14:52:45 +0800
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
Subject: Re: [PATCH 06/12] mm: hugetlb_vmemmap: rename vmemmap_remap_pte() to
 vmemmap_optimize_pte()
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-5-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-5-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Both optimization and restoration update vmemmap PTEs by remapping them,
> so "remap" does not identify the callback's role.  Use "optimize" for the
> optimization callback to match "restore" and make the two directions
> explicit and consistent.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

