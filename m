Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517520;
	b=p7OLuzL4xeF8nOVr0Yb8GcL1pr5S6ZADg9E/miSU7CgkQXhyNAoDISV82/gG9CABDONn
	 KN0VSRXTmW10n449pJlWhTm/vfN5HUh/F8xI2ck1XCJM4uyGtx0EmFBuieZ+IDYaruHaJ
	 cKSg1LAQU1jujl/88QiyDZi16ha46xC4mWn/uMUUuh36Ubh4lwFxhDAh4fInNjepT1yj8
	 5G11I45180BB5Y3n66DozUUjXfsU2EHc3bI7X34lZfBDdzgMsmn5cS30nSfz68+ohTmth
	 9sHEhU3ixltAnnHeIqVTVuAIAaXsr6ATJzeQNOBtP2fmCGCCz1lVy84xhAlpAuvcqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517520;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jgSF75huK5lq6JDQkVCdSAQMAD+xLgu3G0GXHmKK5Dk=;
	b=UzBmlteFz9j3kVdTZjjmVkvDD6gboLDoh+aXXN+egGov7s5zi1YOCJgNe8b3f38nuZAi
	 IevcVOv7iZhNn4MdsA0i8vf9MCWGpELuKVFfuQtooID1s86fjMgil7KGKdP7c2lyM4Gsl
	 QiFn5QyvNvJopVIRWkXRaqoHA+3tI+IUQDr7CswJ8kFIGTFvBlbqnQFHkXufEHuy+dgu8
	 x/DCtA9mnhP8aovzq1XtDZeq+KHcmDbH4kY1ywdzhpcfXlVCkw//yxEvWNLJUU0rQujxc
	 qrQwOwCS2Xh62R7MDq5auzPX95a1xvJ+q0UdHHMXlTOlNIo3pS2G71cra4XS8fyUuOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QlYZS2a7;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CDF606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QlYZS2a7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BBXd3+OxUyf5WsG1NDuZHkvK3T+6qnkUwUPM6ID5tqk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793517517; v=1; x=1794122317;
 b=QlYZS2a7eKbaORr55Lgn68numsDnacZy4+GYQzykFJS/zWy01sg4BSsXEc+qekgmmkBYChRJ
 xidkXBA2vQE8HWIPsDb2l0cGBG+vA+mM7823UtcLSR43maLttvLN2309nUFUO0tszKQIWgCp5Gm
 Ji4B04y+DyJi0OrNd3FZr1MI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3aa89a8db00bc1d;
	Sun, 01 Nov 2026 07:18:36 +0000
X-Mizu-Trace-ID: d3aa89a8db00bc1d
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec140fbd-da68-43e2-b7c9-893e494f5925@linux.dev>
Date: Sun, 1 Nov 2026 15:18:28 +0800
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
Subject: Re: [PATCH 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion
 folio-oriented
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-11-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-11-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
> operation, but the current interface exposes a raw address range and
> hardcodes deferred TLB flushing.  This splits the common mechanism
> across layers and couples it to the HugeTLB batching policy.
> 
> Make the folio the unit of PTE conversion and let callers select the TLB
> flush policy through the folio-oriented interface.  This keeps
> HugeTLB-specific eligibility and batching outside the common operation.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 40 +++++++++++++++++++---------------------
>   1 file changed, 19 insertions(+), 21 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

