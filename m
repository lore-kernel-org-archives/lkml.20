Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A83612EF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408430; cv=none; b=WCLVDUv1rSlCa9hWU8OvDDlXJvAl1f9QA0oe2gVUMPK6EzEskthcZG3VhBHl3oZo2Uz97cw/sbgTmpZX9BZ19S2rEtdXcovKWOvwK0hJvfJrYIlo7K8NGujhF503TKTaJspa4K6umdKgDtILH2Z38SHd3g6soB+D/uIXcHMWkPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408430; c=relaxed/simple;
	bh=juatxZpIE+hF605I3wQDn6J4RrJFx3vbfKDmcQEmqNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyaV5SKWR8DoybbQpkzqsEqWvesOdNQhnPbiHMuQPkdb4BN6NTQwK/OuBtTyI4sL7slyanuYx2QJD13TUkedm61q8eGAuaD7YsYvkLOw7nuPd/OyXK6uECfeJ/eFIYiZQJR4InF16TVPj7g4RVS82M/DPKp0UkYqz8zCt3IR9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=u24qTa0Y; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="u24qTa0Y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788408418; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=EFwlSXqfNEKM0ur5X+fXDaf9C70UjzJTOT5AZjis8cs=;
	b=u24qTa0YO/Nj6tvbuVvL9ZllxMi5ZrG9Wyrd4+uJ6kE8Natop13dozVMBrGt9hcWLd56K3qEIqK22PAFk7/ijmHmv3Zj54bCyxVxSLWaTsEIABp4ZsvXEk/8oS1rTXUHfoqrWgQFTleZS3Pvh6xJ31rpGpBc49vDW+vt2tsJPKQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=qinyuntan@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XAEokn0_1788408416;
Received: from 30.178.83.4(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0XAEokn0_1788408416 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 12:06:57 +0800
Message-ID: <0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
Date: Thu, 3 Sep 2026 12:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@kernel.org>, Xunlei Pang
 <xlpang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
 <aphXPCn8isUVV87k@localhost.localdomain>
From: Qinyun Tan <qinyuntan@linux.alibaba.com>
In-Reply-To: <aphXPCn8isUVV87k@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Michal,

On 9/3/26 1:17 AM, Michal Koutný wrote:
> Hello Qinyun.
> 
> On Tue, Sep 01, 2026 at 07:51:04PM +0800, Qinyun Tan <qinyuntan@linux.alibaba.com> wrote:
>> With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
>> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
>> back to a non-memcg-aware shrinker.  On this fallback path,
>> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
>> valid id belonging to whichever memcg-aware shrinker registers first.
>>
>> __list_lru_init() copies shrinker->id unconditionally, so every
>> list_lru backed by such a fallback shrinker (thp-deferred_split,
>> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
>> up with lru->shrinker_id == 0 instead of -1.
> 
> <del>thp-deferred_split shrinek has SHRINKER_NONSLAB so, the id should be
> assigned (at least I see it in thp_shrinker_init()).</del> I was looking
> at 6.12 kernel.
> 
>> Under nokmem the list_lru collapses to the shared per-node lists, but
>> __list_lru_add() still calls set_shrinker_bit() against the memcg of
>> the added object.  Most list_lru users are unaffected because their
>> objects resolve to a NULL memcg without kmem accounting, but the THP
>> deferred split queue holds user folios, which are charged regardless
>> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
> 
> Not sure I understand here, the SHRINKER_NONSLAB are excluded and should
> still register for per-memcg info.
>
You're right, that sentence is imprecise - SHRINKER_NONSLAB shrinkers
do register per-memcg under nokmem.  What I meant is that on a system
where no NONSLAB shrinker happens to register, shrinker_nr_max stays 0.

>> shrinker_nr_max stays 0 and every memcg's shrinker_info has
>> map_nr_max == 0, so the first folio added by khugepaged triggers on
>> every boot:
>>
>>   WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
>>
>> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
>> and expand the maps, there is no warning; instead bit 0 is set
>> spuriously for an unrelated shrinker.
> 
> Could it be that you see this issue because of a shrinker which isn't
> marked as SHRINKER_NONSLAB?
> 
> I'd even go as far as pointing at
> fafaeceb89a5e ("mm: switch deferred split shrinker to list_lru")
> which removed the flag from the the thp-deferred_split shrinker.
> 
> IOW, the proper fix should be addition of SHRINKER_NONSLAB so that
> per-memcg maps are properly allocated.
> 
> Thanks,
> Michal

Yes, good catch.  The flag was originally introduced for this very
shrinker by 0a432dcbeb32 ("mm: shrinker: make shrinker not depend on
memcg kmem"), and your 03375203e1da8 changelog even cites
deferred_split_shrinker as the NONSLAB example that still needs
per-memcg data.  fafaeceb89a5e dropped the flag without mentioning it
in the changelog, so this looks like an unintended loss.

That said, I see the flag restoration and this patch as complementary
rather than either-or: other MEMCG_AWARE-but-not-NONSLAB shrinkers
(superblock, workingset shadow nodes) still take the fallback path
under nokmem by design, and __list_lru_init() copying an unassigned
id there is a landmine independent of the deferred split case.  So I
think this patch is still wanted as the generic fix, with the flag
restoration on top for THP.

(zswap might deserve the same NONSLAB treatment as THP, btw - its
entries resolve the memcg from the folio's objcg, which is available
regardless of nokmem.)

Would you like me to send a separate patch restoring SHRINKER_NONSLAB
in thp_shrinker_init() (Fixes: fafaeceb89a5e)?  Happy to do so if
that works for you.

Andrew, since the patch is already in mm-new, could you please update
this changelog sentence

	"Since no memcg-aware shrinker can register under nokmem,"
to
	"On a system where no SHRINKER_NONSLAB shrinker registers,"

per Michal's comment above?  Or I can send a v2 if you prefer.

Thanks,
Qinyun Tan
