Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2D332EC5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176124; cv=none; b=TXnEI+1v3odqsBQ8bo4VXKxaGUF1JQVHaqT4mgt9FmhXlnMIoBibGYpxo1oQtDwTSn11h1oQbQuECf9gNRlnFsZWM2ZolrWGzHK+F0U/WoI683SlemN93MxzNtcZrEATnakYS8KpHduCcanCm3P+BXLCuzS4akKX6Vp8vYKCkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176124; c=relaxed/simple;
	bh=56rYwQ/uWVOFc1jV7PXjpV104Tx5PFp2vWMCIo2fAEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEM1OY2uzjI9b4QGEcPMAGQQF3l3w7kg52OPAwQoH0frYmJPNusqimIpIYptIQ9TKSU5in7D1umNfBZGXyC+lhuxQunRtOA5A8BKGaGTmIwCPMf6cDxn7YBg1ljhwrqYIPeefwUxM1MADw1BlqcVMgtOeHIwv9GA/6vl/IRYBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qRi3j/es; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qRi3j/es"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=56rYwQ/uWVOFc1jV7PXjpV104Tx5PFp2vWMCIo2fAEM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788176120; v=1; x=1788780920;
 b=qRi3j/es83qMgildeEwRs5GDNuhTPCrnfdaO6QsgbSGKarv29W/QsFZx3fChKBTz4QELsm4o
 3JKjGPGWWdKrq+bBEpfT7vtBfxKiyWQJCULjyqo3wBeillRJmtQ5m4gwZSznn63f1yhk7EJFIMT
 N3ySl/i3hU5fW4X1t0DNtlLc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1ea18d71c6ae9c5;
	Mon, 31 Aug 2026 11:35:11 +0000
X-Mizu-Trace-ID: a1ea18d71c6ae9c5
X-Migadu-Flow: FLOW_OUT
Message-ID: <75ac2253-5d64-49e0-b090-b385e864c925@linux.dev>
Date: Mon, 31 Aug 2026 19:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/huge_memory: dequeue the deferred split after
 the split freeze
Content-Language: en-US
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: ziy@nvidia.com, kasong@tencent.com, usama.arif@linux.dev,
 hannes@cmpxchg.org, ljs@kernel.org, hughd@google.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, liam@infradead.org,
 nico.pache@linux.dev, dev.jain@arm.com, david@kernel.org,
 akpm@linux-foundation.org, ryan.roberts@arm.com, balbirs@nvidia.com,
 kas@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260831091514.1879786-1-kirill@shutemov.name>
 <20260831091514.1879786-3-kirill@shutemov.name>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260831091514.1879786-3-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 17:15, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> __folio_freeze_and_split_unmapped() takes the deferred split list_lru lock
> across the freeze. It is only there to stop deferred_split_scan() from
> touching the folio under split.
> 
> With deferred_split_isolate() fixed, the workaround can be dropped.
> 
> Unqueue the folio after folio_ref_freeze(), the way
> __folio_migrate_mapping() does: folio_unqueue_deferred_split() needs a
> zero refcount and a memcg still set, and both hold there.
> 
> If the split is called from deferred_split_scan(), the unqueue is a
> no-op -- the folio is already removed from the list. But
> PG_partially_mapped is still set, so it has to be cleared here or
> MTHP_STAT_NR_ANON_PARTIALLY_MAPPED never comes back down.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Nothing jumped out at me :)

Reviewed-by: Lance Yang <lance.yang@linux.dev>
