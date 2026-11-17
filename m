Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906007;
	b=VFwsatgI+Ui4Zkb/tXidpoSKEcFPxDVjR/7wbVgxIIG7Tqws75Sa/KG8iInTTjYcIOU7
	 DNDnpsLEgKAa06dL+nSkiEJJ/f7CQY5A334SkNHKnOPFE2DMk6vnMLtyTrBVyqZLkht9d
	 QHNLtJDT8MNzBebtLd0hQi6+IkQ7dhyJwTlXfVrqOdadSbfaFq0Hl/5cTBJf/stzr6vR8
	 Y+01QC/TdWOQmIklM8APNzQlaB3GRdMIF8lepHMafugEgj4zjQR6RAiGqshLm8af7bS/F
	 t7a2udsJ5dQLl3xgD3F6cqSRVyQ1EEnriTQ9v+BySddFeqA+UwumGpr+qQ1yUsu5aHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906007;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XgHQdBWzds2ptgggUl76prs1LWBlb+UNo9yIzg5rC2o=;
	b=msZfV2qxYr+/1HsvYMUc9YzBZMMDCY2y4xvlSonZapvxEh0wDOFIheuo+WVsl8DvyeKV
	 VTKA/pyCMTH2+mQ5W1TOMuhZh8sIgR5X8c8tesZG/ofBqWIc6v9dDUwvhDW2uixzSjyFQ
	 MB3EFozGNsvUYh3AllLxAy3IOBgMWWdDsd8HESpFHMtEcQmNT3PGUYZDMXYCntmfPFOK9
	 015oYK1KdGlxlLZba9Lx3EYJPnnS7V1WBmxMNbEiQaw2ExX+3QY7xTB3AfxjEWT3X1UDv
	 OlxnNA0UnMoFsd2hj5sPgG6B/miQ/o0lkcxwqSpb+j4mSn+kdAVb+Eu6YHBzDf+jFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0vHivJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91FA606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0vHivJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F92E1F000C4;
	Tue, 17 Nov 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906007;
	bh=XgHQdBWzds2ptgggUl76prs1LWBlb+UNo9yIzg5rC2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=k0vHivJV4vgkreK7bO+TJP1L2r/RaqhNIi1rS4+N3zRncU8SiVhyxeC8VvzkJfn8P
	 xKTNbTuBOzzoKga4TA6+YZK6vHBOGS4meBEWRy+UYEEr0ZbP5/gYUSOVzZcEziI1du
	 VH16nP8twID+dDXTtGVVgqNQnn67AJ1QGGI/3IArbJ+Yar3nWN8tOpGABEMbhH2jnB
	 CTdRIy7ZSVhZa/OYcwsDVv+bpHP1eN6relwMQjOUaDZ7s4DUS9dWegz1h3UuLgsa7i
	 x5A7MCO8kpLTOxZ8n1Sin+X1V6xaflo7RHO6gDFXBD+73tblbhuBCnZyr9vjS+Rxvp
	 NA6dPqllVZ2Uw==
Message-ID: <0b565b9c-1462-4fed-8836-9a7d08e4b861@kernel.org>
Date: Tue, 17 Nov 2026 09:59:59 +0100
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
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
To: Muhammad Haris Awan <m.harisawan@icloud.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <179489519663.1444496.15875846661591982934@icloud.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <179489519663.1444496.15875846661591982934@icloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 06:59, Muhammad Haris Awan wrote:
> KCSAN reported a data race between dup_mm() copying oldmm via
> memcpy(mm, oldmm, sizeof(*mm)) and lru_gen_del_mm() modifying
> oldmm->lru_gen.list when an adjacent mm_struct on the shared
> mm_list->fifo is removed under mm_list->lock.
> 
> oldmm->lru_gen and oldmm->mmlist are protected by mm_list->lock /
> mmlist_lock (or updated locklessly via lru_gen_use_mm()), not
> oldmm->mmap_lock. Because struct mm_struct uses __randomize_layout and
> mm_init() immediately reinitializes these fields on the new mm, wrap
> the memcpy() in data_race(), matching dup_vma() in mm/vma_init.c.
> 
> Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
> Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c6e1b1b32ff2fc3b7d60
> Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>
> ---
>  kernel/fork.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5efceb8d5..14ac9a070 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1539,7 +1539,12 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
>  		goto fail_uprobe;
>  	}
>  
> -	memcpy(mm, oldmm, sizeof(*mm));
> +	/*
> +	 * oldmm->lru_gen and oldmm->mmlist may be modified concurrently under
> +	 * mm_list->lock / mmlist_lock or locklessly via lru_gen_use_mm(),
> +	 * and mm_init() will immediately reinitialize them.
> +	 */
> +	data_race(memcpy(mm, oldmm, sizeof(*mm)));
>  
>  	if (!mm_init(mm, tsk)) {
>  		mmap_write_unlock(oldmm);

I hate that lru_gen_del_mm() would have to mess with that.

Is there no way we can teach reclaim code to not mess with MMs that are being
initialized?

-- 
Cheers,

David
