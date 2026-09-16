Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C746EC6B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593969; cv=none; b=Omu/4gNq6xZ2fe+IqXMBcoU8xleBJmsJJTDcRtx/5ixLIcMGbR9Dee1bazmJ9wQ6p0FojP84OtGBzaITIq9/HRim+B2KZGb7fluqc30b7SB/LUmaV4+liOZrcEa8p3GlKBFlQ96B4WScJTLoPJFGMoV3HyHzxNga7szHvir2sS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593969; c=relaxed/simple;
	bh=1WBnpLfPJG3VLYuo9c7fM0+5c+jX1hH26iqEwyx3rwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kytb6ojKyTB0QQ8oUNMpCEuoFyVYWrvxBfP3bpAVM+hHUQnHJVTmQzFQMC7H+qGeVAUohPlYJDvNc5Meza2Cl9ivADL0+6eETDlT683WRrNCsKbJRFixzWqe3ggYc5N0HWgQglqJdT7o+uFSPhL6zwcXS9fwWxpJ5ckCInnAONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpQZ9RnR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpQZ9RnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281751F0089E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789593956;
	bh=RyG32OZnVLifyoGGiBLZCyOUSDArzniLs4zWt9IbzBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hpQZ9RnR17VFJCBnpSLHQHArHgNl3RepT1nR4bYzIWUS3N+/wO6LLkfLtkfJU3ON8
	 fb5dxeAr1t/wewGL3ITr25JUiGPIvLFRvqhw6iVzgH6ufDyRsU66NL2xu2bYEtBqrq
	 u+OLu4mK1eSSMR4R5Tlop4WHh7x87DG5ubTBipOLHy2D3uM7ZS4SOALJK+d1cv/HOt
	 J0JUM5LfOeE13+EZ5rVs4ce3BhkjDFQ+JnUMRD3St2+XWoEMPo8wam861oyrNu2o+X
	 aecNIteDvDbQu2s9nkG+MNpC4qvy9QGGMQICuUt5D2WFUzVdna76djGh9m52iHybys
	 AXb1CQLg80dfQ==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a0fb2f9efso6830385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDLzC3DTFsxz/IxaWD8i5f9ByA6cGsRpZVJh1Oekh/bk2TpSCu5Nv8KelFRDyuo3ASqjA+rV1utXifkvc=@vger.kernel.org
X-Gm-Message-State: AFuF++mD80XyhgDBcdqzjwZOkgQ5OOE5w3wlJYeF3uZVvU5AdCknz7Nw
	OQRYqOG5lH4rdSdbpraSi1jjghfWOZusJJk3iGnsovH19agdz/yUqnO+z6lXAQIo+1CdwYWHsL9
	0lcU+Wyaxkd3OZ+qAmkDgy+QjjRkVKGg=
X-Received: by 2002:a05:620a:254a:b0:939:72cb:bae5 with SMTP id
 af79cd13be357-93bc63aeecbmr185449585a.28.1789593955456; Wed, 16 Sep 2026
 14:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916123846.1242548-1-ridong.chen@linux.dev>
In-Reply-To: <20260916123846.1242548-1-ridong.chen@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Thu, 17 Sep 2026 05:25:44 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
X-Gm-Features: AcwNN1U_Oahmjpys6FCeJ4MwOMSgsqJzEXz6vLLi31aVqCJij5jE5L1tdt5ofZY
Message-ID: <CAGsJ_4zwP3_+EYY5Ug9EJ+yD1UdxsBSGr25u8s1K3u_i7LH3Zg@mail.gmail.com>
Subject: Re: [PATCH mm-new v9] mm: vmscan: retry folios written back while
 isolated for traditional LRU
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)" <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, 
	Ridong Chen <chenridong@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 8:39=E2=80=AFPM Ridong Chen <ridong.chen@linux.dev>=
 wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> As commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
> while isolated") mentioned:
>
>   The page reclaim isolates a batch of folios from the tail of one of the
>   LRU lists and works on those folios one by one.  For a suitable
>   swap-backed folio, if the swap device is async, it queues that folio fo=
r
>   writeback.  After the page reclaim finishes an entire batch, it puts ba=
ck
>   the folios it queued for writeback to the head of the original LRU list=
.
>
>   In the meantime, the page writeback flushes the queued folios also by
>   batches.  Its batching logic is independent from that of the page
>   reclaim. For each of the folios it writes back, the page writeback call=
s
>   folio_rotate_reclaimable() which tries to rotate a folio to the tail.
>
>   folio_rotate_reclaimable() only works for a folio after the page reclai=
m
>   has put it back.  If an async swap device is fast enough, the page
>   writeback can finish with that folio while the page reclaim is still
>   working on the rest of the batch containing it.  In this case, that fol=
io
>   will remain at the head and the page reclaim will not retry it before
>   reaching there".
>
> The commit 359a5e1416ca ("mm: multi-gen LRU: retry folios written back
> while isolated") only fixed the issue for mglru. However, this issue
> also exists in the traditional active/inactive LRU and was found at [1].
>
> It can be reproduced with below steps [3]:
>
> 1. Compile with CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> 2. Mount memcg v1, and create memcg named test_memcg and set
>    limit_in_bytes=3D1G, memsw.limit_in_bytes=3D2G.
> 3. Create a 1G swap file, and allocate 1.35G anon memory in test_memcg.
>
> It was found that:
>
>   cat memory.usage_in_bytes
>   1073700864
>   cat memory.memsw.usage_in_bytes
>   1413124096
>
>   free -h
>                 total        used        free
>   Mem:           1.6Gi       1.2Gi       299Mi
>   Swap:          1.0Gi       678Mi       346Mi
>
> As shown above, the test_memcg charged about 324M swap (memsw.usage minus
> usage), but almost 678M swap memory was used, which means that 350M+ may
> be wasted because other memcgs can not use these swap memory.

I don't like the way you describe the problem as "wasted" swap.

The real problem is that those folios skipped
`folio_rotate_reclaimable()`, so they were added back to the head
instead of the tail, where rotation could have moved them to the tail.
This resulted in a cold/hot inversion.

The swap entries they are using now will eventually be released when
we scan those folios again and reach the head of the list, so this is
not actually wasted swap space. You are probably right, on the other
hand, that if those head folios hold swap entries and the swap is
full, this could prevent the reclamation of folios at the tail, making
it even harder for us to reach the head.

>
> This issue should be fixed in the same way as mglru. Therefore, the commo=
n
> logic was extracted to the 'find_folios_written_back' function firstly,
> which is then reused in the 'shrink_inactive_list' function. Finally,
> retry reclaiming those folios that may have missed the rotation for
> traditional LRU.

I wouldn't necessarily call it a fix, as keeping the swap cache for
those folios can sometimes help with future hits. For example, we may
hit those folios again before they are reclaimed. So it's a
double-edged sword.

That said, the cold/hot inversion is a real problem that we should
fix. Ideally, we should find a way to restore the missed
`folio_rotate_reclaimable()` behavior, conceptually something like:

diff --git a/mm/vmscan.c b/mm/vmscan.c
index fde28d0a647d..5ee296474b48 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -891,7 +891,10 @@ long remove_mapping(struct address_space
*mapping, struct folio *folio)
  */
 void folio_putback_lru(struct folio *folio)
 {
-       folio_add_lru(folio);
+       if (folio_has_been_writtenback_due_reclaim(folio))
+               folio_add_lru_tail(folio);
+       else
+               folio_add_lru(folio);
        folio_put(folio);               /* drop ref from isolate */
 }

But if that turns out to be impossible or practically infeasible,
leveraging MGLRU's approach could still be a possible workaround, as
it would at least be better than the current behavior.

On the other hand, the fast swap-out cases should be similar to zram
and zswap, as Yu Zhao mentioned in his previous commit:

"This problem affects relatively slow async swap devices like
Samsung 980 Pro much less and does not affect sync swap devices like
zram or zswap at all."

>
> After change, the same test case only wasted about 2M swap. The swap
> device usage matches what the memcg actually charged.
>
>   cat memory.usage_in_bytes
>   1070301184
>   cat memory.memsw.usage_in_bytes
>   1412448256
>
>   free -h
>                 total        used        free
>   Mem:           1.6Gi       1.2Gi       299Mi
>   Swap:          1.0Gi       327Mi       696Mi
>
> [1] https://lore.kernel.org/linux-kernel/20241010081802.290893-1-chenrido=
ng@huaweicloud.com/
> [2] https://lore.kernel.org/linux-kernel/CAGsJ_4zqL8ZHNRZ44o_CC69kE7DBVXv=
bZfvmQxMGiFqRxqHQdA@mail.gmail.com/
> [3] https://lore.kernel.org/lkml/46037a37-4cf6-448e-a94b-30a4d16e8814@lin=
ux.dev/
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---

Thanks
Barry
