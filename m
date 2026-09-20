Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1E3815DC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940991; cv=none; b=ZXaI+zWpVidY6LAnZ+WsflHBzT2lLMF6N9n3xpHjGFJuCvruFyA417Rg4wQZz8BUNvQLbthBt1wIJg6/Z/EDR/bbqsCAOO3xAXZHQ6iP8l+r/9/t+sa2cU8lcdyaBZoGrWPkfHh1iXyiWb8uOrSYFkYqTYDjPc/b2NTu96LXCWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940991; c=relaxed/simple;
	bh=S+Ou2RTLvJNYb5WQLWEVMEdO6IV4Sd01SdgtWKbPy0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/V8Qeb2L36LYX4IvGSkR9GMU8E+O8CCMwjetW4FTT4zthBV5SGRwNmbWF/2Bynd8Mcd14HnEneUkN5A7qfSvat2OC6ndFqXjCuV/vfu7f+R5ZcaqmqxCJb+bLWmYwKVmR0HTNZzdugJkY+4jdnrU9u/K+XaeD0bnNhhB652rGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvFGheVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvFGheVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81CA1F00893
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789940983;
	bh=6NBZKYQ5+644W7iKg6cKXd/Toi8ijTijHQiwjqEQzlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BvFGheValM+LdW9CE4n0ucdO7Xmq/Kzen73R6jTieE4npSIIKj/9LcuTJCc6RNpFx
	 Nw+8X2Ztqj7pouxLbg+WAldwnBl/7BoKiu9Vwr2M1LvYzrMPF/M/yMMEE9rVtwaCi/
	 UlfA6Zs0JlhdJInf+M1DMUqUrGEk8MGPbSFKnXC/z0AjpQVaSPu6KMvKJtsODlfa/o
	 I1FotYC8kIhXNYvglA9iKxPst0qsVoBSL0Y9Ovb43eflDmYNipm5ZouEmMlNWtvJII
	 NXefU3r3lTJaTJke6YkzRrNYagbl+teUE8aaX1IPm9nL+PdXTteCHc6WkKue59XiqH
	 4nwXOnhqnjWIw==
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso218909385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:49:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzOeL6974peUGCq0YqZdt8BZCccY0ysRFJxtL9nupICHWgwq5PuZMMMrM1mw0pl1PseS9HjKYjFmk1Odio=@vger.kernel.org
X-Gm-Message-State: AFuF++kcy6jSid0ZE0465zL4VafGrlHRwvwSt8HEGTOdQH2eE6U/w+r0
	f30VdP0ZTxs1281elGFLij0HIwL1FVo5osqT8GUyV3uMQLHe9LHzBTzUDU9UgtyBhobv4rPOyZU
	f+yd40BgOlvINuXXDjzP3NgguucSMlN0=
X-Received: by 2002:a05:620a:880d:b0:939:8ecf:6025 with SMTP id
 af79cd13be357-93bf552d221mr744743585a.20.1789940983277; Sun, 20 Sep 2026
 14:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com>
 <20260720-batch-tlb-flush-v5-1-db943a0d0d6b@icloud.com> <CAGsJ_4x7W3Tgr_VNY+RLK_pXnFdehGGbjaVH29JsYipXGf7Z9g@mail.gmail.com>
 <20260920143816.39827-1-zippermonkey@icloud.com>
In-Reply-To: <20260920143816.39827-1-zippermonkey@icloud.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 21 Sep 2026 05:49:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yhHw=AAaBTeaj4dk7Hbmprs_30VZ+cSodB4Z1vDZJGZw@mail.gmail.com>
X-Gm-Features: AcwNN1WP_FveN4o5OYDbzdKXOMdJEkJ1ZIgn4EAzu0QuygPwT-XH39cssd_fBB8
Message-ID: <CAGsJ_4yhHw=AAaBTeaj4dk7Hbmprs_30VZ+cSodB4Z1vDZJGZw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mm/vmscan: introduce folio_activate_locked() helper
To: Zhang Peng <zippermonkey@icloud.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Michal Hocko <mhocko@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Kairui Song <kasong@tencent.com>, 
	Zhang Peng <bruzzhang@tencent.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:38=E2=80=AFPM Zhang Peng <zippermonkey@icloud.co=
m> wrote:
>
> On Mon, Aug 10, 2026 at 4:36 PM Barry Song <baohua@kernel.org> wrote:
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
>
> Thanks for the review!
>
> > > + * Prepare a locked folio to be kept active rather than reclaimed.
> > > + * Reclaims its swap slot if it will not be swapped, then marks it
> >
> > I'm not quite sure whether this should be "if". Because, it seems
> > to always be true up to this point. BTW, if we really want to use
> > "if", shouldn't we use it to check whether swap is full?
>
> You're right, the wording was misleading: the condition that actually
> guards folio_free_swap() is the swapcache/swap-full/mlocked test right
> below it, not anything about whether the folio "will be swapped".
>
> Rather than try to restate that in prose, I dropped the paragraph and
> left a single line, since the code below is already explicit:
>
>         /* Activate an isolated, locked folio and account the activation.=
 */
>         static void folio_activate_locked(struct folio *folio,
>                         struct reclaim_stat *stat)
>
> One thing I should flag, since it is not just a comment change: the
> VM_BUG_ON_FOLIO(folio_test_active(folio)) that used to sit at the
> activate_locked label is now a VM_WARN_ON_ONCE_FOLIO(), so a caller
> that gets this wrong is reported rather than taking the machine down.
> Both are CONFIG_DEBUG_VM-only, and no non-debug behaviour changes, but
> it is a deliberate change rather than a pure move, and the changelog
> now says so.
>
> I kept your Reviewed-by on that basis - please let me know if you'd
> rather I dropped it, or if you'd prefer the BUG_ON left alone.
>
> This patch is now part of a smaller cleanup-only series, see my reply
> on 5/5.
>
> Thanks
> Zhang Peng
>
> From nobody Sun Sep 20 00:00:00 2026
> From: Zhang Peng <zippermonkey@icloud.com>
> To: Barry Song <baohua@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>,
>         David Hildenbrand <david@kernel.org>,
>         Lorenzo Stoakes <ljs@kernel.org>,
>         Vlastimil Babka <vbabka@kernel.org>,
>         Mike Rapoport <rppt@kernel.org>,
>         Suren Baghdasaryan <surenb@google.com>,
>         Michal Hocko <mhocko@suse.com>,
>         Michal Hocko <mhocko@kernel.org>,
>         Johannes Weiner <hannes@cmpxchg.org>,
>         Shakeel Butt <shakeel.butt@linux.dev>,
>         Axel Rasmussen <axelrasmussen@google.com>,
>         Yuanchu Xie <yuanchu@google.com>,
>         Wei Xu <weixugc@google.com>,
>         Qi Zheng <qi.zheng@linux.dev>,
>         "Liam R. Howlett" <liam@infradead.org>,
>         Kairui Song <kasong@tencent.com>,
>         Zhang Peng <bruzzhang@tencent.com>,
>         linux-mm@kvack.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v5 2/5] mm/vmscan: extract folio_free() from shrink_f=
olio_list()
> Date: Sun, 20 Sep 2026 14:14:37 +0800
> References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com>
>  <20260720-batch-tlb-flush-v5-2-db943a0d0d6b@icloud.com>
>  <CAGsJ_4ykbJKVqEv6uGNKZaQhtV1UxxV-MWt7D1jx6SpdMN+cqA@mail.gmail.com>
> In-Reply-To: <CAGsJ_4ykbJKVqEv6uGNKZaQhtV1UxxV-MWt7D1jx6SpdMN+cqA@mail.gm=
ail.com>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> On Fri, Aug 14, 2026 at 5:40 AM Barry Song <baohua@kernel.org> wrote:
> >
> > Could we avoid hiding the activate semantics inside
> > folio_try_reclaim_free()? It makes the logic harder to read and
> > can be confusing.
> >
> > Could we pull this out so that the three possible outcomes are
> > explicit?
> >
> > 1. activate
> > 2. keep
> > 3. free
> [...]

Also, Peng, I'm struggling to follow what you're saying. Could you
please reply directly to the comments where I asked the questions?

Please don't collect comments from so many different patches in one
place and reply to them all together. This makes it very difficult to
keep the context and causes a lot of unnecessary back-and-forth.

Best Regards
Barry
