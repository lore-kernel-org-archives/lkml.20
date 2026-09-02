Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003CB476CDD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348531; cv=none; b=F1jLbjvRPzQPb/D8PoqAQlyYvqfymKl+jtCrqMtF4FhokgPy6k34vaCN8L0jFIlo17ag68r/1qsuBVJ6oeYPK7N5Nd20p7l455VdqBounkIAjKoaGEEsMIaEA5z2mjHnT4H+4HFwXCl+aTkJJb31Akn9CULrrsYs49bX1sGn/ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348531; c=relaxed/simple;
	bh=3x2mDZzfQsBjuVb72vf1gz1TkiHlwuxtteD4iYUeP/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVRsnBdXJJSByX1EOSzKCjjPE/Itip2tJGz0gfkdTi/aDYZI7PvLF4wnXQRJbHg5IuFTYUL3U3vEgx3wzeKVkSnhKOoNahRMnOuBgJnrZjxmqEUURNQLHx4sVi31t0IAvRlcIY/acx2p0RVtyCV1K4vrZnnKmJnVl9lc4wohJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nQ21WYE4; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nQ21WYE4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3x2mDZzfQsBjuVb72vf1gz1TkiHlwuxtteD4iYUeP/M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788348522; v=1; x=1788953322;
 b=nQ21WYE4+xmg+AqAtI3A69TmEa6SRGTfGkSs4Ph8d7z1/siaBPESE2ClmM7EsWw0mZrt6e6S
 ON2koRiXa7rcgm4JvloMT+uYidb22nTGoS4IH1uAescbrB3JH+VB7hA+ytjohTExn2FCehDQg8J
 o1BtsEvZR/bRQl97meFNbEXM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 64bff105bd861d77;
	Wed, 02 Sep 2026 11:28:32 +0000
X-Mizu-Trace-ID: 64bff105bd861d77
X-Migadu-Flow: FLOW_OUT
Message-ID: <b066c25a-d3ff-419f-a0ee-e99070ce0788@linux.dev>
Date: Wed, 2 Sep 2026 19:28:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH] maple_tree: Annotate lockless pivot reads for KCSAN
To: "Liam R. Howlett" <liam@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Andrew Ballance <andrewjballance@gmail.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, Hui Zhu <zhuhui@kylinos.cn>
References: <20260826074430.1139325-1-hui.zhu@linux.dev>
 <20260826094147.42e1e71e91a5a537ced30a21@linux-foundation.org>
 <kpzm3pcwxwnzk5kngcsfcybzst5jtyrdcphd3hcpmoc6dbtswq@atn5yddl23qx>
 <f33eaa0c730feb9f598738ff79d98cb25b4b2bcd@linux.dev>
 <ccgj2ukobxzdpypdi45vvapxbot56lsqmqfzzkcyrgnkjetybh@gghifhsc7v4t>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <ccgj2ukobxzdpypdi45vvapxbot56lsqmqfzzkcyrgnkjetybh@gghifhsc7v4t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



> On 26/08/27 05:35AM, Hui Zhu wrote:
>>> On 26/08/26 09:41AM, Andrew Morton wrote:
>>>
>>>> On Wed, 26 Aug 2026 15:44:30 +0800 "Hui Zhu" <hui.zhu@linux.dev> wrote:
>>>>   
>>>>   In RCU mode, replaced maple nodes are marked dead and freed via RCU
>>>>   after the new node has been published. Arming the RCU free writes
>>>>   node->rcu.next and node->rcu.func, which share storage with
>>>>   pivot[0] and pivot[1] (see struct maple_node), while lockless
>>>>   readers may still walk the dead node. These stores therefore race
>>>>   with the pivot loads performed by the walkers.
>>>>   
>>>>   This is harmless: the writer marks the node dead with an smp_wmb()
>>>>   before arming the rcu_head, and the walkers re-check ma_dead_node()
>>>>   after reading the node and restart the walk when the node is dead,
>>>>   so any pivot read that raced with the rcu_head stores is discarded.
>>>>   KCSAN cannot see this protocol and reports the plain accesses, so
>>>>   annotate the lockless pivot reads with data_race() through a new
>>>>   ma_pivot_rcu() helper.
>>>>   
>>>>   Found by fuzzing on a 6.6 kernel; the race still exists on
>>>>   mainline. No functional change intended.
>>>>   
>>>>   
>>>>   Thanks. AI review suggests that the patch is correct, but incomplete?
>>>>   
>>>>   https://sashiko.dev/#/patchset/20260826074430.1139325-1-hui.zhu@linux.dev
>>>>
>>> Yes, this is literally every read of numerous pivots on any reader that
>>> would need something like this. Most code is shared with the writer
>>> side, so we'll have data_race() annotation where it is not needed there.
>>>
>>> I don't like the name of the function and I don't agree that it is worth
>>> doing, especially half of it. If you notice ma_ functions take a maple
>>> node as the first argument, but your new function takes an array pointer
>>> in the node.
>>>
>>> The from address does not agree with the sign-off on the patch.
>>>
>>> I also don't think a benign race needs a Fixes tag?
>>>
>>> It might be worth looking at other ways to calm kcsans down such as the
>>> type qualifier __data_racy, or maybe the makefile option.
>> Hi Liam,
>>
>> __data_racy is defined as volatile for KCSAN kernels, so the qualifier
>> has to propagate to every access site: ma_pivots() would return a
>> volatile pointer, and all the "unsigned long *pivots" locals and helper
>> parameters in maple_tree.c (about 25 sites) would need the qualifier
>> too.
>> It also marks the whole pivot array as racy, while only pivot[0] and
>> pivot[1] actually overlap the rcu_head.
> Isn't your change already using the data_racy annotation on more than
> pivot 0 and 1?  For instance, mas->offset is often passed in and that
> is likely not 0 or 1.

You're right, and I looked into annotating only pivot[0] and pivot[1],
which are the only pivots that overlap the rcu_head of a dead node.

The trouble is that the index being read is only known at run time
(pivots[offset], pivots[mas->offset], ...), so the only way to wrap
just the pivot[0]/pivot[1] reads in data_race() is a run-time check
before each read.

For example, mtree_range_walk() would turn from:
if (pivots[offset] >= mas->index) {
into:
unsigned long pivot;
if (offset < 2)
     pivot = data_race(pivots[offset]);
else
     pivot = pivots[offset];
if (pivot >= mas->index) {
These walks are the lockless hot path (every RCU lookup, including
the page-fault path), so this adds a branch to every pivot read.
data_race() compiles to nothing without CONFIG_KCSAN, so the annotation
itself is free in production kernels, but the branch would cost on every
build.
I don't want to add branches to this core code just to narrow the
annotation, and I'd also rather not widen the suppression to pivots that
never race.


Given that, I'm inclined to drop this patch.
Instead I could add a comment where the rcu_head is armed,
noting that the pivot[0]/pivot[1] reads on the lockless paths are
expected to race and that the resulting KCSAN reports are benign,
so anyone hitting the same report later knows to ignore it.

Does that sound reasonable, or do you have another suggestion?

Best,
Hui


>
> Fair point about the code churn, though.  I don't need every function
> being changed to accept a volatile.
>
>> The Makefile option (KCSAN_SANITIZE_maple_tree.o := n) is a one-liner,
>> but it disables KCSAN for the entire file, so any real data race
>> introduced in maple_tree.c later would go unnoticed.
> KCSAN has never reported anything real to me and that's why I suggested
> turning it off.  After speaking with Paul McKenney on the matter I have
> been convinced to not disable it.
>
> I still don't really see a whole lot of value in annotating the code to
> say a particular race is not an issue - we will have mostly disabled the
> tool by annotation in the end.  And these are most likely going to be
> the areas where we have issues if any arise - ie, some special arch
> corner case that comes up that didn't exist or wasn't in mind during
> annotation.
>
>> Do you think one of these two is still the better choice, or should I
>> keep the current approach and fix the patch according to your review
>> comments?
>>
> I guess respin it and see how it looks with your current path.
>
> Thanks,
> Liam
>
