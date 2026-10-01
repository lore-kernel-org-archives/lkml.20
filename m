Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44C4949E0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870872; cv=none; b=pgBycm9M7eP935KkStdWbpJrHMBWUwLgo2wuF4JFr5DjJfHPbM5kMfzVVUHxVX6zV4IpHcl6Iprs+OEgT7C+JQoz/WjqDN6p0KTGaDODOgnbu0QaNZJ8MHrWm9iks+EioaHQCt4YIDVOCAEv6ptePx6MY10kxy01020QBeK9x1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870872; c=relaxed/simple;
	bh=XKakuNwu3Om7gwJbEDCid2bRDqw/CvPpxhwYERhBdAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LerN3PGTK3f23bK3kEnYEMw9dsOIt75Bdz6YIlP5AI9BxBUiRLSHQEEylfGGbC0j4payq0qCyQrGt8nKuRZN/QiaSQq240D3lFbvbdntoGgnVuIIFa+F+nDa0aQ+9G4QcwpZDGhfQKWEMClEmTuieODU98xhYYtvPqVGZuoB7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rLnx4miu; arc=none smtp.client-ip=91.218.175.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rLnx4miu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XKakuNwu3Om7gwJbEDCid2bRDqw/CvPpxhwYERhBdAY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790870868; v=1; x=1791475668;
 b=rLnx4miuxqSZqAa89KPYNmCICPUM4ZHMu0+z6jrjyedz9XHedhQXDO67ofThf5Ik/L8VbTnh
 6+tNHwI5PwjsqjDkftNrXdQ5kLA86UXKysX1ByqRLMlsvLaGLnfyy4N1oZpb/OwTIUk919IWKDC
 IWf/DWjE1DQ3TMz4C74sW6DU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d5925f2877bd100;
	Thu, 01 Oct 2026 16:07:47 +0000
X-Mizu-Trace-ID: 1d5925f2877bd100
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: rppt@kernel.org
Cc: songmuchun@bytedance.com,
	maddy@linux.ibm.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page init
Date: Fri,  2 Oct 2026 00:07:37 +0800
Message-ID: <20261001160737.25348-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <ar5xbQsUpSQZg0wO@kernel.org>
References: <ar5xbQsUpSQZg0wO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Oct 01, 2026 at 04:42:53PM +0200, Mike Rapoport wrote:
>Hi Muchun,
>
>On Tue, Sep 29, 2026 at 01:32:31PM +0800, Muchun Song wrote:
>> For vmemmap-optimized sections, tail struct pages may be backed by
>> shared vmemmap pages. Those shared pages must carry the same page zone
>> ID as the struct pages initialized for the section.
>> 
>> Warn in __init_single_page() if the shared tail page has a different
>> page_zone_id(), which would indicate inconsistent initialization.
>> 
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>> ---
>> v3:
>> - Collect Acked-by from Qi Zheng
>> 
>> v2:
>> - New patch.
>> ---
>>  mm/mm_init.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 1650d6bc1211..bd02e8d06965 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
>>  	if (!is_highmem_idx(zone))
>>  		set_page_address(page, __va(pfn << PAGE_SHIFT));
>>  #endif
>> +	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
>> +			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
>> +			page_zone_id(page));
>
>Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad later
>than page so it'll have stale data in the page->flags, won't it?

IIUC, the shared tail struct pages already initialized by
vmemmap_shared_tail_page() during vmemmap population, no? It calls
set_page_node() and set_page_zone() there :)

Cheers, Lance
