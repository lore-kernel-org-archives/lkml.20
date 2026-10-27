Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085912;
	b=zC0ymgZTMXy/HYVJEVKtM1PE2XFv2U+uU3lbL3buxao32HmwAr0JHzGaKcZk2qzPJM3v
	 oHxZYQUTcjf8RYr6K+CgTctirYxv2wWbb6fnmfDRPzZFFIm+M2QItPWvHT451mcllH9X/
	 nWaajbJp2ii+65JCB1zdtjg7ygbiMOOXMBlQGPuwNLmIII6LY6w2ZAjQq2uuc+ZHDYO8o
	 vq5zdlF+JBF7SnXBddtMpVPl+/3vNG1YtnNzMqWSKWEqf86o7VCzeHDgCI4rtKO/FBHdb
	 MwBu7hxReEhhbkq8R4/3JF5dO3/4yM5UUYR3aO834uO2caxECZR0yUatBF68Qm6L84g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085912;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JYwlk5SABAXJfCGJC/CIrpBqm46Lfjo6fP+QGuM8Wo4=;
	b=SSfQoLHsyNRRolHpI6x4mJQw4A6fSEGM9JxeSB9CL4ETtRKjlaeJXG6H7ALRH1EqMXe4
	 fkqRF5leNfIMjeF9XyGvG1Un3N96NxJOakw10v6O7twem6FXfmxaAwDOO+W8Ikuw8KsCT
	 0MgS8VrzlqN632Yvb8fTi5emCZwacxKYeBbXVVLK5lNxTdXSpz/5dseuUVVdC8T7RuLNs
	 0jlC5/IKpnHOaBMcFnouCU7GQs5KqTkiQp+HppoffuLzv0Gu1ButwowDAnnd/htHy3aXn
	 Sw4yhp2vBbcjDRKyQSddwEMPBQ+YbL6oRG2LTDBpjsPkLExqLQcc0JRdqrrXIlzw10Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A64+ePD3;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D627606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D627606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A64+ePD3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3EH6ZExPcZqz0wmFi1VNDDcCIIEYlOenwQf5HgNEt+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793085908; v=1; x=1793690708;
 b=A64+ePD3rRIeAuP/4lB71nO4+tOkGiryYLOgek3aUTDrus5Zed53htjDTY4vHmDQfyiZmmBb
 NKXLXxVXEWi6tp6rS1ZDIHUujL/XAVA9heHTfwzTokOBngqM0DYOFKsL9WoyEVZJwgFe/3TsISN
 ymlG9Ovu7hW8MYjormJF8xWQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 079adf22c9d54636;
	Tue, 27 Oct 2026 07:25:07 +0000
X-Mizu-Trace-ID: 079adf22c9d54636
X-Migadu-Flow: FLOW_OUT
Message-ID: <c42ec8e1-6be4-4faa-8175-174fd2f11218@linux.dev>
Date: Tue, 27 Oct 2026 15:24:59 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2] mm/mglru: fix a no-op lru_gen_clear_refs() call in
 lru_lazyfree()
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>,
 Kairui Song <kasong@tencent.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20261026084035.535989-1-hui.zhu@linux.dev>
 <CAGsJ_4z46o6fs16T0ctLcTXiinL1+0CXpvueDN1rVc2-rLT6NQ@mail.gmail.com>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <CAGsJ_4z46o6fs16T0ctLcTXiinL1+0CXpvueDN1rVc2-rLT6NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


2026/10/26 17:47, Barry Song:
> On Mon, Oct 26, 2026 at 4:40 PM Hui Zhu <hui.zhu@linux.dev> wrote:
>> From: Hui Zhu <zhuhui@kylinos.cn>
>>
>> lru_lazyfree() calls lru_gen_clear_refs() after lruvec_del_folio(), but
>> lru_gen_del_folio() has already cleared LRU_GEN_MASK, so folio_lru_gen()
>> returns -1 and lru_gen_clear_refs() exits at its "gen < 0" check without
>> clearing the refs or PG_workingset.
>>
>> A MADV_FREE folio therefore keeps the state it had before madvise(2),
>> even though madvise_free_pte_range() has already cleared the accessed and
>> dirty bits of its PTEs.  lru_gen_folio_seq() places it one generation
>> younger, and PG_workingset puts it in the last tier, so sort_folio()
>> promotes and protects it instead of evicting it and charges it to
>> lrugen->protected[], which read_ctrl_pos() uses to balance anon against
>> file reclaim.  __folio_inc_gen() clears the refs but not PG_workingset,
>> so this repeats every time the folio reaches the oldest generation.  If
>> the folio is redirtied first, ttu_anon_lazyfree_folio() keeps it and
>> lru_gen_eviction() packs the stale state into the shadow entry, so a
>> later refault is promoted to the youngest generation.
>>
>> Call lru_gen_clear_refs() while the folio is still on the generation
>> list, as deactivate_file_folio() and folio_deactivate() already do.  Its
>> return value only says whether the folio is in the oldest generation,
>> which lru_lazyfree() does not need because it re-adds the folio below.
>> Keep folio_clear_referenced() unconditional: the classic LRU needs it,
>> and it also covers the folios that lru_gen_clear_refs() skips.
>>
>> Fixes: cc8ec7be78ff ("mm/mglru: optimize deactivation")
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
>> ---
>> Changelog:
>> v2:
>> Call lru_gen_clear_refs() before lruvec_del_folio() instead of
>> open-coding the flag clears; drop the lru_gen_enabled() branch and
>> the comment (Barry Song).
>>
>>   mm/folio.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/folio.c b/mm/folio.c
>> index 35e242b48870..ea3adb6a89d7 100644
>> --- a/mm/folio.c
>> +++ b/mm/folio.c
>> @@ -597,12 +597,10 @@ static void lru_lazyfree(struct lruvec *lruvec, struct folio *folio)
>>              folio_test_swapcache(folio) || folio_test_unevictable(folio))
>>                  return;
>>
>> +       lru_gen_clear_refs(folio);
> The only thing I'm not sure about is whether we need
> if (lru_gen_enabled()) here to keep the semantics consistent
> with other places where we use it.
>
> ...
>     2    676  mm/folio.c <<deactivate_file_folio>>
>               if (lru_gen_enabled() && lru_gen_clear_refs(folio))
>     3    695  mm/folio.c <<folio_deactivate>>
>               if (lru_gen_enabled() ? lru_gen_clear_refs(folio) :
> !folio_test_active(folio))
>
> So maybe we still need
>
> + if (lru_gen_enabled())
>          lru_gen_clear_refs(folio);

I think we maybe don't need it here.  The other two sites consume the
return value, and that is what the check disambiguates:

     if (gen < 0)
         return true;

An off-list folio has gen == -1, so without lru_gen_enabled() both
deactivate_file_folio() and folio_deactivate() would take that "true"
and return early, skipping the deactivation.  lru_lazyfree() ignores
the return value, since it re-adds the folio a few lines below anyway.

The side effects gate themselves, and on something more precise than
the global key: a folio on a classic list always has gen == -1, which
fill_evictable() even asserts,

     VM_WARN_ON_ONCE_FOLIO(folio_lru_gen(folio) != -1, folio);

and drain_evictable() clears LRU_GEN_MASK on the way out.  So an
unguarded call either clears the refs of a folio that is on a
generation list, or does nothing at all - no flag writes and no lruvec
access.  The classic LRU cannot be affected, including with
CONFIG_LRU_GEN=n, where the stub inlines away.

Guarding on the key would reopen a narrower version of this bug.
lru_gen_change_state() flips it before migrating any folio:

     if (enabled)
static_branch_enable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);
     else
static_branch_disable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);

     memcg = mem_cgroup_iter(NULL, NULL, NULL);

so while MGLRU is being turned off the key is already false, but every
lruvec that drain_evictable() has not reached yet still has its folios
on generation lists.  A MADV_FREE batch drained on another CPU in that
window would keep PG_workingset.

What about add a comment instead of the check:

     /* no-op unless the folio is on a generation list */
     lru_gen_clear_refs(folio);

Best,
Hui

>
> with that, feel free to add:
>
> Reviewed-by: Barry Song <baohua@kernel.org>
