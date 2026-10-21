Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583267;
	b=g5HyOeFsnFpFOv58kJopdjvzYW7y6FZTnCk0AMOqFHqeyESK4Y13i76Iv32dQLr8E/cy
	 pUqCtykRupgmSok77CWp3pYAkBdlMxr/8mEEGp9ay5OoeFrFV268fjOL/zPQb1KlfwkKd
	 X7XjaBVWVI5k/lkGhmByacNSGjsw9lFgLKer/xe7pj5AqJGlLqPUdv67KCs4qvJXz/Sqi
	 zDgK9FZv4SuRsE//aPtTsg5m5xmVA+Us02rTuBb/qPX7QlOVUO8Klr4LAl1AeUWMeAfDM
	 NSPoUxSLWhZRQCRgrG/7bb5b6dxBxg17lULCuuwoYFa5emLRFBEJ4BbKHRn3tMYqKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583267;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Z89Kr199TcPJR9MDz9henzx13FG7NYvsmnPGn6umWUE=;
	b=5JJ/ZaBlq+4JYg3mjyQM71zFPVuvMD0yScL1kw8zj43BViAtYghahNnvabwSO16/2Ng6
	 73RhLSolLLGmN4w/jL6+9xJZv41YtsEm1qf9CdGmZm6NQk+SmBkWzDMuZZzCrYwMxqb7l
	 NtVcZl7I21ERCmkAEMIdqddbdAVYvV1r2G3H+MyfxsIVeHzYLW0AxE18PUJaR4ySvfnf4
	 /dyx3HJmkYCn8qNBgFFutLrLbA9r7VtS0rR7mn6AvZfJfh8dxAl9CQk9WBHsTsxr0niUR
	 V6cDgGt3ubui3DZ1ixAK7/g3OweGK7v5GqCNYKHlVcrseqUzfi0lzi472yScl6Dvryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZERdviaK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049860A2623
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZERdviaK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE5F1F000C5;
	Wed, 21 Oct 2026 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583267;
	bh=Z89Kr199TcPJR9MDz9henzx13FG7NYvsmnPGn6umWUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZERdviaKNmHgJJuGJC6NDkVLli3/xqBmAyOv2hjYKFpQjnenkWC8uRFRc4vO6xIAa
	 e3Mf/zDp+MBMel8bRzZhFUBtPaGgwbb9xXbVH7LfUbDPNXp1CcXqtnz7YqIiQl2Cer
	 4+Y4yhfEkKUa97HJV2rfj370m3iQkSv/WWVLN6WjCjJY3vUGx3AR7kXLmBO5Jglyxo
	 qKAmdpgMG31r02ttWv/LQdOpg0ONxM58w7FpX1kLdtIDlGk1ACN6i9k38ygrPiFSgn
	 eylwbTi3tzWYoOfiHTM+cREEV9CqsKNt+M0PJ94H1eHX8JhQiYHDXTylteJ4w4eQxv
	 KohJS+ZwBCDHg==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:47 +0100
Subject: [PATCH slab/for-next 06/14] kernel/fork: specify SLAB_MAY_ACCOUNT
 for thread_stack cache
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-6-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
X-Mailer: b4 0.16.0

When THREAD_SIZE < PAGE_SIZE, thread stacks are allocated from a slab
cache with THREADINFO_GFP, which includes __GFP_ACCOUNT. Specify
SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path (e.g. ppc64le, 64K pages, !VMAP_STACK): copy_process()
  -> dup_task_struct() -> alloc_thread_stack_node()
  -> kmem_cache_alloc_node(thread_stack_cache, THREADINFO_GFP)

Assisted-by: LLM
Cc: Kees Cook <kees@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 kernel/fork.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..3ad31c5ae0b6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -459,7 +459,8 @@ static void free_thread_stack(struct task_struct *tsk)
 void thread_stack_cache_init(void)
 {
 	thread_stack_cache = kmem_cache_create_usercopy("thread_stack",
-					THREAD_SIZE, THREAD_SIZE, 0, 0,
+					THREAD_SIZE, THREAD_SIZE,
+					SLAB_MAY_ACCOUNT, 0,
 					THREAD_SIZE, NULL);
 	BUG_ON(thread_stack_cache == NULL);
 }

-- 
2.54.0

