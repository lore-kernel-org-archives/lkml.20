Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6335FF5B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378043; cv=none; b=qIOIpdHMld5OV6EItWFBX1MgKDuSCB4EmGFNww9SnEPhkUUx7WCW744nXin0qmD7tj0ljhYTWAc/3yFif5arA1wcj4ajOwYo1Va26YzGQncpgBpLqJXuKHvOoaMvcuq8ColENeWXN2yNci9AgwLnzU4VMhTpetzT3J1xewCnaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378043; c=relaxed/simple;
	bh=tOxz9HoU6pRLO9zJ7CotYpqDOpegZThflwPxXAEwQro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEGJ4PfohWGH/++JbsDBo+2hcizNvU1hgxOXOiXmKgwomMVSu9IaUnpXCRq3ghQYJ4R0OvKHAjfZuH5Mgd+zl8hYxI269DJXWS8FW+182M9yuQTzsnSAJDmcYPRzEBCu5A3m67OaQ1iBI21hXSJUWKWk7/zD8bLfcV5rLqbcMDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=evWoAjjG; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="evWoAjjG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tOxz9HoU6pRLO9zJ7CotYpqDOpegZThflwPxXAEwQro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790378037; v=1; x=1790982837;
 b=evWoAjjG8MUS8ghpyToP9qlyFF1wjRV7QE7o3UNUFDkZk5nVWEqIfhYGmoQd5Xn2Ef35LsId
 PYu6x2IgGwocPaY7CeWRBGAVj+etllEvnfAq/HH6v+n3sdV+KquZffM/z5CSLibQrvdUe66eEzh
 N5iD6dHSGjYrEYlZEXsPAfzE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id faa0fec37a4f7450;
	Fri, 25 Sep 2026 23:13:57 +0000
X-Mizu-Trace-ID: faa0fec37a4f7450
X-Migadu-Flow: FLOW_OUT
Message-ID: <293f4c3d-c6b4-4ccd-a116-71ce02341c39@linux.dev>
Date: Sat, 26 Sep 2026 02:13:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com, david@kernel.org,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
 torvalds@linuxfoundation.org, vbabka@suse.cz, yuzhao@google.com,
 ziy@nvidia.com
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <arbNrVX20f2WDJjO@casper.infradead.org>
Content-Language: en-US
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
In-Reply-To: <arbNrVX20f2WDJjO@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 22:38, Matthew Wilcox wrote:
> On Sat, Sep 12, 2026 at 10:50:10PM +0300, Ilya Gladyshev wrote:
>> This patch reallocates the refcount value range:
>>
>> (1) refcount < 0 means dead refcount (uninit / frozen)
>> (2) refcount = 0 allowed only as a temporary state (see below)
>> (3) refcount > 0 is a regular reference count
>>
>> In other words, refcount is now split into "dead bit" and a 31-bit
>> counter.
> 
> It seems to me that refcount overflow is now a problem.
> 
> We can deliberately increase the refcount on a page by stuffing it into
> a pipe.  Over and over again.  See merge commit 6b3a70773630 and the four
> commits on that branch: f958d7b528b1 88b1a17dfc3e 8fde12ca79af 15fab63e1e57

Thanks for pointing that out!

> Unfortunately, I think the discussion that led to those commits was
> conducted off-list because security.  I wish we had a way to declassify
> thse emails after the fact.
> 
>> +/* Most significant bit in page refcount */
>> +#define PAGEREF_FROZEN_BIT BIT(31)
>> +
>> +/* Page reference counter can be in 3 logical states,
>> + * which are described below with their value representation
>> + *        state              |         value
>> + * (1)  safe with  owners    |   1...INT_MAX
>> + * (2)  safe with no owners  |         0
>> + * (3)  frozen               |  INT_MIN....-1
> 
> I think we need four states.  The first two are the same.
> 
> (3) frozen: 			0xc000'0000 - 0xffff'ffff
> (4) temporarily overflown:	0x8000'0000 - 0xbfff'ffff

Agree.

> (we don't really need that much space for temporary overflow; we could
> have something like 0x8100'0000 as the boundary if that works out better)

Frozen state doesn't really need that much space either, so I guess the 
boundary with the simplest check in page_ref_count wins.
>>   static inline bool __page_count_is_frozen(int count)
>>   {
>> -	return count == 0;
>> +	return count & PAGEREF_FROZEN_BIT;
> 
> This probably becomes '(unsigned)count >> 30 == 3'.  If we choose a
> different boundary then something like (unsigned)count >> 24 >= 0x81.
> 
>>   static inline int page_ref_count(const struct page *page)
>>   {
>> -	return atomic_read(&page->_refcount);
>> +	int val = atomic_read(&page->_refcount);
>> +
>> +	if (unlikely(val & PAGEREF_FROZEN_BIT))
>> +		return 0;
> 
> ... use __page_count_is_frozen() here?

Missed that, thanks!

> and you need to adjust folio_ref_zero_or_close_to_overflow().
> try_get_page() can stay as it is.

Agree.

> (Thanks to Pedro for asking me annoying questions about mapcount
> overflow which prompted me to look at this again)

