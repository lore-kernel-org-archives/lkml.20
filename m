Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076018;
	b=wKqZo9w1y3YcXe+CIYEv51AwyYa/f43g26tK1geA/xutC+qTlpIFKyKd1f/EPU5m4ZS1
	 7zE7OXMvC4b99d6EIeq/AshtQ9BOk1SJIXUNBN7iaDMPblbivZVEiUaWE2i+WDHwflaxB
	 ng+XeAeFOqyd49IqCpxXu2lEcIgZ20RrmAJvYUTWZiSq9oDbi7/R5xdx55FfYLjHKn/1X
	 1k6OXCNWVrWxcB3BggER6EWVYO2Ize+Apk6q4OB5keqXqpVQauCz4Txo9b/VTHDomTUij
	 SEO6nn8ZoBeMWuUtE7Ot1f9WKNZ6+d5EmlMWdufhOZZXPQtOreHF7KFaCKDAKk9AoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076018;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wVhySGQl9o0rB8pMhdyfDXMh7D/DmTgjZ/fmBI7bd2o=;
	b=I1Vfw2lTN1ikds0xSoeX7Pscxx6S2nm6BMAnyGu3uia8JJiBzhVSFn6OAVE8lHJie3fh
	 AwUXA5YEXBwjB+EDyRf1/HJxA7DpWtuiW7EqyEptQwuQSDoqfQCLD7ATnqWoZLwVjcXT2
	 CfmXcGbPDOr6wgdTNjLD8NR8pVuTgtESd2rA+CEu8VHzjgqDGmfc5xfx2OcO5G+5xuXsc
	 NYKq07wrBRaOurutb3L7/0/4YclO64jaad8OhkWZaV2Y1sgk7xhvv63voHOlNeW5lNwLG
	 MuDyEnFhMbqsIP/8UVk/1NCk/7/gzcL4rVhZ5qfqrOC3JceI9cxSsDKxQCPsr/+GdUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AxUhhqb6;
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7458B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AxUhhqb6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qE2tL1Fo3Dp82uNSJ3pSzSpKtJMDbDdNOIJXBRddZ58=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793076015; v=1; x=1793680815;
 b=AxUhhqb6k13lvUXylzJtO4aZeAPIZpxzUiUwZdxdsyBxg1NJLnFABudNqVxRHr3L/y5tLuDV
 DMf2BxAMO+xJgdznM8yo73zSH1mx2DkEHmBWzk42z5S4FOxuNU3y2KF36jnTi0+3cSaRxuZgBsf
 22R69Dj1EDZFpnNACcJxAoeU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f24c8c8b657afccd;
	Tue, 27 Oct 2026 04:40:14 +0000
X-Mizu-Trace-ID: f24c8c8b657afccd
X-Migadu-Flow: FLOW_OUT
Message-ID: <e4ea12a5-ca26-4c1e-99e6-899eaea449c0@linux.dev>
Date: Tue, 27 Oct 2026 12:40:04 +0800
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
Subject: Re: [PATCH] mm/huge_memory: fix deferred split list corruption on
 partial unmap
To: mt4022@columbia.edu
Cc: Kiryl Shutsemau <kas@kernel.org>, Kairui Song <kasong@tencent.com>,
 Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Nico Pache <nico.pache@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 tz2294@columbia.edu, stable@vger.kernel.org,
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, "Liam R. Howlett" <liam@infradead.org>
References: <20261026-thpsplit-careful-v1-1-d357d70fd6f4@columbia.edu>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261026-thpsplit-careful-v1-1-d357d70fd6f4@columbia.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/27 08:22, Mani Tofigh via B4 Relay wrote:
> From: Mani Tofigh <mt4022@columbia.edu>
> 
> When a THP is partially unmapped while the deferred split shrinker is
> scanning it, the deferred split list can end up corrupted.  With
> CONFIG_DEBUG_LIST, freeing the folio later reports:
> 
>    [  523.871401] list_del corruption. prev->next should be ffd40000005e0090, but was ffd4000000500090. (prev=ffd40000005e0090)
>    [  523.871412] WARNING: lib/list_debug.c:62 at __list_del_entry_valid_or_report+0x177/0x220, CPU#0: thpsplit/63
>    ...
>    [  523.900715] Call Trace:
>    [  523.901753]  __list_lru_del+0x5f/0x220
>    [  523.902588]  __folio_unqueue_deferred_split+0x238/0x520
>    ...
> 
> Without CONFIG_DEBUG_LIST, the list is left pointing at the folio
> after it has been freed.
> 
> Since commit fafaeceb89a5 ("mm: switch deferred split shrinker to
> list_lru"), deferred_split_scan() moves the folios it scans onto a
> private list under the list_lru lock, drops the lock, and then removes
> each folio from that list with list_del_init(), which sets
> entry->next = entry and then entry->prev = entry.  Another task may
> in the meantime partially unmap the same folio and call
> deferred_split_folio(), which queues it only if list_empty() reports
> it as not queued, and list_empty() reads only entry->next.  If that
> happens between the two stores, the folio is queued again, and the
> store to entry->prev that follows breaks the new link:
> 
>    Task A (shrinker)                     Task B (partial unmap)
>    -----------------                     ----------------------
>    list_del_init(entry)
>      entry->next = entry
>                                          deferred_split_folio()
>                                            list_empty(entry) is true
>                                            list_add_tail(entry)
>      entry->prev = entry
>      /* overwrites the prev link that
>         list_add_tail() just set */
> 
> Use list_del_init_careful() instead.  It sets entry->prev first and
> then entry->next with smp_store_release(), so once list_empty() sees
> the entry as empty, the shrinker has finished writing to it.
> 
> The reproducer repeatedly faults in THPs and partially unmaps them
> while the deferred split shrinker, run through
> /proc/sys/vm/drop_caches on the same CPU, is scanning them.  This bug
> was found and replayed using a deterministic hypervisor currently
> under development, but the non-deterministic C reproducer can
> typically trigger it in the 10-500s time range.  With the fix, nothing
> is triggered after 1800 seconds.

Well spotted!

The race window is rather short, I guess, but partial unmap can still
sneak in after next is reset and before prev is updated. We need
next == entry to mean we're done touching the links before allowing
the folio back onto the queue.

> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
> ---
> Reproducer: https://github.com/manitofigh/thpsplit-repro/blob/main/thpsplit.c

Cool. Your reproducer came in handy :) Hit the corruption without the fix.

Tested-by: Lance Yang <lance.yang@linux.dev>
