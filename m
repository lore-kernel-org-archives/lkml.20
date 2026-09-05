Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6AB37B022
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596447; cv=none; b=YwIRfbKVFdUehpVWWmWlrd6KI/Tig8jTVK/1jj9i8CWhwBXdubribO4lrIfqW8eoiqBa4tKysCyjMMP49WtZG4wXmJ6u0wSPMLTWiOvziFXz6Qp8jFVUiXceavj7BCUWn26uQbIq1bss4OdIpfroJkvQks1DWiXWV9VGvFk5KBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596447; c=relaxed/simple;
	bh=cWv2OsYaUjRAleYfGIeSk6xvjxd4wSnUJO1edGPXAD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM65w3e3N6t5FDVmBmvYriJUC+35n4BW5L/4ZB1yWZXGxMuHTP7gM5isI7SnMEpDRpeoCqQuOr4JR1Kk9j+QDemMP6zijbJ9/tqUdY2kfrbOYw4POETSAKTCo6/tEeLjYUsaHHKtyhp6ljXtg02bdoi4M88dQSBHj/vcR1RBXx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RFOOlzc8; arc=none smtp.client-ip=91.218.175.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RFOOlzc8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cWv2OsYaUjRAleYfGIeSk6xvjxd4wSnUJO1edGPXAD0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788596435; v=1; x=1789201235;
 b=RFOOlzc88Sp/+17kYY0X3tj2xV591g+vdpH1Gz8pYwug+kFZtZSn9ZVIjlmOa76nKrlV1R7E
 WAbmak3v+IlCj+iLYO99VSwYyFJTqn8VSJ8aKvwI0ryYSs9JDYFIm+YJgTuFkAGQdISz8sj1FUf
 lb0N2A7SKCpSDLW3NsmT0SU8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b4d3cf39591adcd;
	Sat, 05 Sep 2026 08:20:25 +0000
X-Mizu-Trace-ID: 1b4d3cf39591adcd
X-Migadu-Flow: FLOW_OUT
Message-ID: <1143901c-5036-4b79-8135-21ce57075136@linux.dev>
Date: Sat, 5 Sep 2026 16:20:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] mm/sparse-vmemmap: set section order for device DAX
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
 <20260831075342.57563-6-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260831075342.57563-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Muchun,

On 8/31/26 3:53 PM, Muchun Song wrote:
> Device DAX can use vmemmap optimization only when a full section is
> populated with a compound-page geometry. Record that geometry in the
> section order before populating the section, so later vmemmap accounting
> and population decisions can use the section state directly.
> 
> Clear the section order when the section becomes empty again. Also reject
> partial additions to a section that already has optimized vmemmap mappings,
> because a section cannot safely mix optimized and ordinary vmemmap layouts.

Perhaps we should explain why they cannot be safely mixed.

> 
> Partial additions continue to use ordinary vmemmap population, so they do
> not save vmemmap memory. Such additions are uncommon, and the lost saving
> is negligible.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/mm_init.c        | 13 ++++---------
>   mm/sparse-vmemmap.c | 16 ++++++++++++----
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 

Also, the issue sashiko reported looks like it was pre-existing, not
introduced by this patch. So:

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

