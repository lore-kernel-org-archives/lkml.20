Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932612;
	b=4zV02OVDpl2EBpQU78OFyBlefM/qhSRTAk7z3xmj52jRsT1u4+TP3zDVhLOOQqtYHsuM
	 zA00C0UZ6WRjQ3fMiXNvBlM5ZMwRnRQyPaG67Igoj5fy/DpEBO+Phm1suHoZaMBWB8Hbn
	 4k1b088OS5vbirPQV4/Tv+vCpoOX0BWNfwlu0bRZitVtEXLt5/9se6pjWcItW2QNfb/c4
	 LE7ZmwaXLeznZhP5pzyLZTWUsHPHXPzfxbb1uZzISwhJtgJ/TZ1tquBa8UK8r4BJMgHR5
	 wGMN9Ep243+h8rKVH2B9XR6cU/NZlEyCeesf1TkR1WD7uIPaKIsBirKX3QabzB22TwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932612;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1gOxdNpoOktUbt78ygUuRKgFaA+6LpWMs6/n7RbPnMM=;
	b=QHo8GGgeTdrjnG1lZuqY35U4mAj0Bkr1UnJZQJK8XeV87CSU0r6xqswoOT4fQJhdEwgt
	 oJiA5GkGbY0KCwb3uiQ148vr5BPSUnraWUQcIRfVqNrwAU4ye5Id0/OO0rm1us272Z38l
	 FC3h6odfXbY1qyHTzK5/Z0lYBtQLRUO3QH5hoE5AF5WAi+0KHSP0xhPAHhohjSeB7XO0T
	 0Dat03OmLEF6qw/KxubcxxwHOvu5eDCIgmUfRZDriuKPv1uVomsAdrA+f42gsX/l/CDo5
	 xWWIKZZ5okY9S0GJuID024fbmBbCcVW5ywGyRPVHI//PMc4Gtb2DIwf3hu08DTLLzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZZDYnOe;
	arc=none smtp.remote-ip=91.218.175.4
Received: from mta0.migadu.com (out-4.mta0.migadu.com [91.218.175.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA299606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA299606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZZDYnOe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N7mjm7vMXqCyNrByfjcWEsdHNqPY7UhdoQ3qsyo58eg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794932609; v=1; x=1795537409;
 b=OZZDYnOeX6IiRkPYGsxSsG5eR51bVUCR2PXGXktzAf0yhI6KbWafNWfXQ8i35FXHKKNnb4mj
 K1YYbcCbnSUjUcjs2wLKaqreWjLMPuW88Uen/1J7wHU7E7U7+/rNoazHHoDZewi61x3N+q2cRcG
 wiK3PME4EizeQIr9JC9cZUTE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c28228232a92365e;
	Tue, 17 Nov 2026 16:23:29 +0000
X-Mizu-Trace-ID: c28228232a92365e
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:23:26 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: m.harisawan@icloud.com
CC: akpm@linux-foundation.org, bsegall@google.com, david@kernel.org,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com, kees@kernel.org,
 kprateek.nayak@amd.com, liam@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ljs@kernel.org, mgorman@suse.de, mhocko@suse.com,
 mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org, rppt@kernel.org,
 surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org,
 vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
In-Reply-To: <179489519663.1444496.15875846661591982934@icloud.com>
Message-ID: <CAEA6A30-B69D-460C-B5A7-057F2BC6A52E@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 17 November 2026 05:59:56 GMT, Muhammad Haris Awan
<m.harisawan@icloud.com> wrote:
>KCSAN reported a data race between dup_mm() copying oldmm via
>memcpy(mm, oldmm, sizeof(*mm)) and lru_gen_del_mm() modifying
>oldmm->lru_gen.list when an adjacent mm_struct on the shared
>mm_list->fifo is removed under mm_list->lock.
>
>oldmm->lru_gen and oldmm->mmlist are protected by mm_list->lock /
>mmlist_lock (or updated locklessly via lru_gen_use_mm()), not
>oldmm->mmap_lock. Because struct mm_struct uses __randomize_layout and
>mm_init() immediately reinitializes these fields on the new mm, wrap
>the memcpy() in data_race(), matching dup_vma() in mm/vma_init.c.
>
>Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
>Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=c6e1b1b32ff2fc3b7d60
>Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
>---
> kernel/fork.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/fork.c b/kernel/fork.c
>index 5efceb8d5..14ac9a070 100644
>--- a/kernel/fork.c
>+++ b/kernel/fork.c
>@@ -1539,7 +1539,12 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
> 		goto fail_uprobe;
> 	}
> 
>-	memcpy(mm, oldmm, sizeof(*mm));
>+	/*
>+	 * oldmm->lru_gen and oldmm->mmlist may be modified concurrently under
>+	 * mm_list->lock / mmlist_lock or locklessly via lru_gen_use_mm(),
>+	 * and mm_init() will immediately reinitialize them.
>+	 */
>+	data_race(memcpy(mm, oldmm, sizeof(*mm)));

NAK. Your basically just ignoring the race, in fork, like Lorenzo said.

Let's fix this somewhere else?

> 
> 	if (!mm_init(mm, tsk)) {
> 		mmap_write_unlock(oldmm);
>

--- Thanks!
