Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945587;
	b=E+B/iKOD06M42CD7M1q/meKpyyHuQFuz0g0nzBpn99i68/I/KaYiDnzO+qG5L50+4k/x
	 w+FHVmUUdDF8tV7Ke2umJKrAXsTe2yu5+Yno27ruZWZxQudkSHB22t3eVaL24WLG94qfj
	 h3HaMmphqYZmeYrWO6btNOrsweURKKP0E4KNRL5JO6OmVoyqli6XPlh1mYql+6mX5bqo4
	 +Jo8plcclL3YfWg8hhbSUhkbJYDoga9ta+S7XoORUsF7xM/5jx2qOT3O1exmfg3ROlWy5
	 06OLpFpelKmaFvk4dixJ7IUyMadFSwqpkxMtt+2Dzz7KkY+Z/K3trQ2M0DZ8dCdTggA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945587;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UeFRryLaJVqpKuXcRGUVHxdnIHbny7uLg2c6R3dh+AA=;
	b=xZre7e/km7XZr3nwvCL1ZXZH2YzQDcLmXbHodjD0r4341U4Xpjx6VwJbBYjKnmc9dadA
	 PLBx72H14hDXSFhVWfKzp6mlGXgL8EdzSLhtP94e+cxUGz401roJCHqVNxtHPAKzfJPz6
	 IyLI0+7G6phmRwq2FaTIJpAQPz25JZ19fsEPb8lfWdT48+9+oSC77zxrPhEslUxCQsDxX
	 BX5uZBdMfiBlG17bu7rf3MtQuxZnBsNdwbz+d4iT6CjRIwEEuYY6530msuSSrJsWG/z7K
	 24MoyEc0R5oNNDoZErNjskzNujOLhITXMZD5vJ0mfDXagQoNN7kRQmDCy/XiGdctItg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bvPJUts0;
	arc=none smtp.remote-ip=95.215.58.252
Received: from mta1.migadu.com (out-252.mta1.migadu.com [95.215.58.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9394B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bvPJUts0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UtMR0huybFZzo68zuG5r3t/yLCzKnw9Q4ZZ92vgROyE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793945583; v=1; x=1794550383;
 b=bvPJUts0NfHUKQVK2bHna3jm1DTJS6OWUm5OJ5OLiijya+d6Vfg8vLaYBXApL2GOXiidk85N
 dP/RwNh/+nLcYXh2IEvX2bbeESfUaQVPaZ79T7zXLqfJ1a6I9Wp+4Y/yIp8ubSq0waJlyLf55yu
 jrfU62V+HSgFBkLFlkNckuxA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff19274c30c44807;
	Fri, 06 Nov 2026 06:13:03 +0000
X-Mizu-Trace-ID: ff19274c30c44807
X-Migadu-Flow: FLOW_OUT
Message-ID: <d035a565-aa50-4aba-8213-f39869baad05@linux.dev>
Date: Fri, 6 Nov 2026 14:12:56 +0800
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
Subject: Re: [PATCH v2 3/4] mm: hugetlb: fix GFP mask propagation to CMA
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 akpm@linux-foundation.org, azpijr@gmail.com, lance.yang@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <ac2de9b321f68c1025333e92e3ce94beadcb0b6c.1793850539.git.zhengqi.arch@bytedance.com>
 <auxTwrKCeg7a3hfY@localhost.localdomain>
 <1535887c-6be2-4415-b54e-2008e6e7a35c@linux.dev>
 <au1qtSMDpimURGuq@localhost.localdomain>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <au1qtSMDpimURGuq@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:50 PM, Oscar Salvador (SUSE) wrote:
> On Fri, Nov 06, 2026 at 10:43:53AM +0800, Qi Zheng wrote:
>> I'd still prefer to keep __GFP_COMP so that
>> cma_alloc_frozen_compound() itself guarantees compound allocation,
>> without requiring callers to supply the flag.
> 
> Well, but aren't all callers hugetlb? And we already do supply __GFP_COMP there
> for evident reasons.
> And should that not be the case, and you want to catch someone who went rogue,
> I would just place a WARN_ON_ONCE to catch it here, so we know who is not following
> the rules.
> 
> Makes sense?

Ah, make sense.

How about this:

diff --git a/mm/cma.c b/mm/cma.c
index 876635a56180e..45017ed876f76 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -935,7 +935,8 @@ struct page *cma_alloc_frozen(struct cma *cma, 
unsigned long count,

  struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int 
order, gfp_t gfp)
  {
-       gfp |= __GFP_COMP | __GFP_NOWARN;
+       if (WARN_ON_ONCE(!(gfp & __GFP_COMP)))
+               return NULL;

         return __cma_alloc_frozen(cma, 1 << order, order, gfp);
  }

>   
> 

