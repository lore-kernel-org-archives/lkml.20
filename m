Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873453;
	b=eR5MxRJWrPYnaiX9bdVGD6ub+Da6yNpxfXJu+NMLkUV+NeNiXF5Xn+i8Q3ov+4cGZyyy
	 AsKCJa37d71I3ixww/mFxjpLAQE1rFrvsekmiMy35hwdVfqoJExfPfBYPgyyRh4uYuZHn
	 QA868hOXNxTIllfVBzzSbuFscVtVAScapH7xIXyoBHg77SH/95v8DNxkVsrNXJgsCaVY+
	 2SFS4B4QmNP8YNuzbA8j2ho9ziUfEFfEOFNl1ova7ZlY9Q0wRKbAvNc3j3qln9h+KQyG8
	 ixrir+TX6XbTQ57E4+HAgzWbWUXFmyBp3aSvgvY313uR72FFufpoNGEC4Fo8wAkYj4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873453;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TXZ/Cop4M0ZnDrJ4wQeY87tjQ0rUXnvNstfpKB55sUk=;
	b=YN2l701Y88jQMiFcUNkkHJWBooMQgopYtaNSnO8XyJ9QRrv4LWPUtyWA8VDeNnQ0nCuK
	 zWoqDxbm+xUjy3hjJIOA7wqMOuyxkj6C0Mi20DzpwIayUq//0CA0pEGOLGjQUapEXT8tQ
	 uewtjudQLpjSIDx09Qob1zTmJVI+KrzEjD6AA/As/Ws3XGXybNUiRXdwZ86ltOA5ZZAPC
	 JBqVYgkAYbWJvOIe7qZXIwD51en7APDMZBp6Mp2lC2vUQP6heaqGZmeLUROYBd9oOuR4l
	 O7Yr+VZC943wZIR1G59A3iJmJxBkNRFFGA1LjbFUbLwuXmYpYW3UxciWVZkOwXBPfnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3cl72xz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F856606AA44
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3cl72xz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31BE1F000C1;
	Thu,  5 Nov 2026 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793873453;
	bh=TXZ/Cop4M0ZnDrJ4wQeY87tjQ0rUXnvNstfpKB55sUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k3cl72xzOEiy9SzPFOTWRhOm9Pw2JPryzjYRC/tErxE68Soeko0mqfdTqUQydNd56
	 gnZymVVVtBskHkDzHmJ5wWkG0tke1RReilVqsS9uOX1nUdldc67ef7k5KMrsUVNHfH
	 dNsTzrw2DUe9KMN/fevHO2g+BUAn+hnVzqlw/maQBYuf8visyRnQPgoFeLRVsuWFCf
	 9xBCM8rcm3y5QluKH9UGk9EyoIsZIuEC2WrrwIrnOTNLWMbmyL8saM8vMUpQXKTL13
	 eDJ9JfaHXti3IwNjhXzkkBwssUkM3h3VwCf5MYS2kFNayxDLYyMp893NbVtEi3Yez8
	 +GmSLJ6dEPV+w==
Message-ID: <717bba87-ecce-4425-92c2-b28f172b2bf9@kernel.org>
Date: Thu, 5 Nov 2026 11:10:47 +0100
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
Subject: Re: [PATCH] mm/migrate: don't move memcg NR_FILE_PAGES for swapcache
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, willy@infradead.org, shivankg@amd.com,
 ridong.chen@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261104044313.2099309-1-husong@kylinos.cn>
 <CAN+CAwNJP+CP2kRsgcYKA=3cgy-o9k5PoUnR9vUy4suJu+4ciA@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAN+CAwNJP+CP2kRsgcYKA=3cgy-o9k5PoUnR9vUy4suJu+4ciA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/4/26 16:54, Joshua Hahn wrote:
> On Tue, Nov 3, 2026 at 11:43 PM Song Hu <husong@kylinos.cn> wrote:
>>
>> NR_FILE_PAGES lives on both the node and the memcg plane for page
>> cache folios: filemap_add_folio() and filemap_unaccount_folio() charge
>> it to the folio's node and memcg, while __swap_cache_add_folio() and
>> __swap_cache_del_folio() maintain the node plane of NR_FILE_PAGES and
>> the memcg plane of NR_SWAPCACHE.  A folio in the swap cache therefore
>> carries no per-memcg NR_FILE_PAGES count: shmem folios drop their
>> memcg file accounting when swapped out, and anon folios never had any.
>>
>> The cross-zone arm of __folio_migrate_mapping() moves NR_FILE_PAGES on
>> both planes unconditionally.  For swapcache folios the memcg plane is
>> empty, so migrating one misaccounts it: the destination accrues
>> nr_pages that were never accounted there while the source counter
>> underflows.  The wrong counts persist until the memcg is destroyed,
>> but the aggregate in memory.stat stays correct, so the drift is easy
>> to miss.  NUMA balancing, migratepages, compaction and memory hotplug
>> can all migrate such folios.
> 
> Hi Song, thanks for the patch!
> 
> I think this description was a little bit hard to read @_@ so the core
> problem is that swapcache folios are accounted differently in per-node
> and per-memcg, right? And that swapcache is not accounted towards
> memcg's NR_FILE_PAGES, so we need to split up the mod_lruvec_state
> into the node and memcg accounting separately. This makes sense to me.
> 
>> Reproducer, on a 2-node QEMU guest with cgroup v2:
>>
>>   1. create a cgroup with memory.max = 50M and swap enabled;
>>   2. memset 128M of anonymous memory in it, so reclaim swaps most of
>>      it out;
>>   3. fork to raise the swap entry refcount, then fault the memory
>>      back in, so the resident folios are swapcache ones;
>>   4. migrate_pages(pid, node0 -> node1).
>>
>> "file" row of memory.numa_stat (bytes) after step 4:
>>
>>                     without this patch      with this patch
>>                       N0          N1          N0          N1
>>                      0 (*)  51691520         0           0
>>
>>   (*) the source counter has gone negative; negative values read as 0.
> 
> Thanks for adding the reproducer. This helps a lot for reviewing!
> 
>> Keep moving the node plane via mod_node_page_state() and skip only
>> the empty memcg plane, mirroring the swapcache exclusion the NR_SHMEM
>> handling in the same block already applies.  It accompanies
> 
> So you note here that the block already has a kind of swapcache
> exclusion. To me I think the code block we are working with here is a
> little bit complicated with all the cases we have to look into (and
> three separate folio_test_swapcache() calls...). At a future time I
> think we should explicitly lay out all the cases (swapcache /
> non-swapcache shmem / normal file) to make it a bit easier to follow
> where everything gets accounted for.
> 
> I say this because it took me a second to realize that the #ifdef
> CONFIG_SWAP should only apply to the NR_SWAPCACHE modification and not
> other swapcache conditionals since it protects the enum and nothing
> else.
> 
> Anyways, none of that should block this clearly user-visible bug.
> Thanks! I hope you have a great day,
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

This sounds like something we want to fix in stable?

-- 
Cheers,

David
