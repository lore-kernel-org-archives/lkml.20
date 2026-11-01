Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516922;
	b=HKh9SR54JDOg81+S0xC67kEtagAzZN0c73S2ps3xF9JY0uSXQQqOBtXICMkBJaWS5Fpr
	 0p8da5JOtTFFZZUnkIIyQgz/l3LXuKvWW17ZoK5p8OOJVGWU2obOAgYzDNRlHdQihMAgU
	 EilICF+iQw2RY30bpmyjZDtVBOvLcZS/Df2c45Ltmji+hNskg1BCLBZcrDdDxHRvwsU5o
	 iU28lWOiX1pZJ1jRgXkkHwsBWrrxFb2AsmVruqs1YFqLJHZTvsMKLumD3xKrwqZzh8ELc
	 Bv9167g5hV+IzG5DS0AFhWH6yww+NLw2amsqVlaNmJESlse0Rh+NyHcpurlX/5rqS+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516922;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jkyFPxHdMr8VD/svuO9SwwzAL9XDCMj3MbQCES3rGok=;
	b=XKRMQ2M+J3ZKWznS1UZN+4v7V3GOKwje7DnmU6dob61CeLx2mu13IBAI+7IFYRkmv+L3
	 hb3IvpWf0gavnm1A5U+ASbxjAt56nOxCsUAv8CtNDlJTE2FUGMVGODLYdj/m8TGZuFlVI
	 C61S4Lv9/ecqC5RGzCQjBrccsTtqCyfdlInsyPQIZHOIgqGyFT77EdjZB5FfCMJ3EpUdb
	 xJVjQ+tHZIeNk3ef52KxZC4W5Npu7GPDZh3migJv5ovqdcqnbhQMzFBNMLBXfzPdv17S8
	 jZ3+bioe/x4oO+zMheBsu7s1zpskt6v0Ocvad4gL+Jpygjh52cQypLySnQKECxZuaaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="KMKXHJm/";
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C23A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C23A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KMKXHJm/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=237fh+P6+tsOas/EETdM8oy9lOZa3289Iwq/LFSdwHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793516919; v=1; x=1794121719;
 b=KMKXHJm/a59z+4diB0DgMxWfGBs9ql+WELEuvIAPDc32JjEjbPIoMdYHw9IOo0jSgMC2TldQ
 jKlIZCuMGA0JHrN3qmur6hig6fOYl45r8ZnEWhhBOY4HCA4VzYAv23ov4484M5r8Gmhum0hfPjs
 hCpeY1g1KUV1GdrCxva5Q6F8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 64230bdbd9a72431;
	Sun, 01 Nov 2026 07:08:39 +0000
X-Mizu-Trace-ID: 64230bdbd9a72431
X-Migadu-Flow: FLOW_OUT
Message-ID: <2f429ff5-76bf-48e4-b6ac-3db0b9bac498@linux.dev>
Date: Sun, 1 Nov 2026 15:08:32 +0800
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
Subject: Re: [PATCH 09/12] mm: hugetlb_vmemmap: make vmemmap optimization
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
 <20261020115824.823278-8-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-8-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> Vmemmap optimization operates on one folio at a time, but the current
> interface exposes a raw address range and requires the HugeTLB caller to
> prepare part of the operation.  This splits the common mechanism across
> layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap optimization and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific]

This makes the interface much more solid. Nice cleanup!

> eligibility and state in the caller while making the remapping code
> applicable to any eligible folio.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb_vmemmap.c | 67 ++++++++++++++++++++------------------------
>   1 file changed, 31 insertions(+), 36 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

