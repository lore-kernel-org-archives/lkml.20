Received: from mta0.migadu.com (out-240.mta0.migadu.com [91.218.175.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83A43FD26
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232704; cv=none; b=MdO6Ig39aJYBzRKbZU1Fxmt7ADhZ0K8eVlN5W2uDFx3wsjTvZ/mNvNlkCrIikOXVAInvWBE8ReKC2XCgMqh3NZ9P/FXjE1mqQHsXl+ZogeelCzVAjykdDrv7iKQHRNImWzs2G1nU5lskuUcGhkSMfjhwkk8SJjkVvzfuXe/DeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232704; c=relaxed/simple;
	bh=+yvmAaiXJSQhUiY43hR2AcbPXHGoUIEk5aWBZqakNg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoKITwSKyOwX1RlK1/y2h9pOwvQ4wEM1g7nwiiy7AIvwWwxzTmV0uqEiSir8sG8+XhZjYF9ZpODYo98TQzjbrFCUlPKUbuhZGmJ3/dUSUINI4JtdBd/tAJBTpkK3MjREhHo9De9vgVwlghLNjOtroNQiHb/niTt/3Ku2bD+DDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iQbqfgik; arc=none smtp.client-ip=91.218.175.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iQbqfgik"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+yvmAaiXJSQhUiY43hR2AcbPXHGoUIEk5aWBZqakNg0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788232699; v=1; x=1788837499;
 b=iQbqfgikHpVpyMUUAMrHyUTlOaqZLRJR77DceWjUfb8vdHqANraDf/0tu3DdPGi8ibjxO5PH
 ZBY8IevQGiEhRdzi43/7Dl7dQ7HElvS6FHE63AoRFdOmr4mdBdaDh5Bq5pXKhI0PkBDG3xUQcC8
 DDGCKvrhqABzi1za8Zqf6tQE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a2cff3d3a7044ca;
	Tue, 01 Sep 2026 03:18:19 +0000
X-Mizu-Trace-ID: 5a2cff3d3a7044ca
X-Migadu-Flow: FLOW_OUT
Message-ID: <56119ff9-26f2-450c-bff9-8a4169027ba9@linux.dev>
Date: Tue, 1 Sep 2026 11:18:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] mm/sparse-vmemmap: open-code init_compound_tail()
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-4-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-4-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 3:53 PM, Muchun Song wrote:
> init_compound_tail() is only used by vmemmap_shared_tail_page(), where
> the shared tail page setup intentionally passes NULL as the compound head.
> 
> Keeping this helper in mm/internal.h exposes that special case to the rest
> of the MM code and can make the NULL head argument look generally valid.
> Open-code the initialization at the only call site so the special-case use
> stays local to sparse vmemmap optimization.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/internal.h       | 9 ---------
>   mm/sparse-vmemmap.c | 5 ++++-
>   2 files changed, 4 insertions(+), 10 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi


