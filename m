Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8B135975
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787962701; cv=pass; b=W6dFrku9zWrzsQIAmwa/VyPU4MOG0njSqW8SftXx2tlD3nYebEr3cputCHae9QBUEFgr4LjhB1AQ3+9a0sBHHRkjl7RrTbWNVrxndBVgq6+uaRJE7oxOiMdvq0NyO0ECGAlL9wP24FHYPDxycaELV6hnE9MwhbBI7suCc0Ztzm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787962701; c=relaxed/simple;
	bh=EpZWMqJMFNnhSBqC/WC1fi00kpn5Ll9AMHDCeclZHmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7nAJWHGrJMz6H2qZ4ousHx3WZLp9CBmHaeVPcqOD/8Ji6gNaRlMLEFZ5buiUlvgg6JGAwNcLR0k6bLXSlUEhbkIyI6Q0XIW35CXzyQkoC3ifQQ9L6nQ26JIKVNcA57SlVhgOvsZzuk2JPNNDQ+3xfq14cl1W1q5mRoPhjPMVCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R8CqcHza; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8CqcHza"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b1409a75so8505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787962698; cv=none;
        d=google.com; s=arc-20260327;
        b=CEQfJ4C+knkwYCNOkSs7hQ66qyuO6mbYC2yOdBEPZjJN7/gkpybB9kWU9SIBjoZOh5
         ccXnew9p/2iMvcSJHOV7w2KrKjj7wYWrFV06UYOrXYYasWH3NmLj9qe7IO5IKieix18r
         N0774I7Vua74LuEljwWCkPK8Zj+wNOdCX1fy9JmyuKUsiV8ja3XLsNETnr/SBOdVbR+I
         ubT2r7/I0ReXiMt1IrbCX+m7RrlaBN+HYaV14xtM8bJZFGVI2slG242pt+VY7Fy/jMkT
         JzLwiah9NP99iL9a1+EUSlztS+nBtIa7QcLSSRUdZJgIyccYoi6CiVhv3artUWGL+LlO
         MX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        fh=D+v3VTeTSeeR3bT72+WoJAsQz1LChj/zBletMiElENU=;
        b=OrugmfRGZIRkVwKQschvgm/km8cD3a2YdqSKsyLQE7+kQbcHc+kp0ulM7khv6O9VTT
         id3OKnc5cRnDwukalYOeAF+/0i5KVTWkcXekrfXtf8eVILxPDEwgyMNSb6fMVsnlumZL
         edQ/ovRoKB4Iuxvi+fGjr2Hlmj44vQZXb2fgUlfi9MSeoRqRX1GT2hj4GU9pGy+Q3455
         fLVSNB4HTIgG1c1DdQpBQr/wXA4j37BxDUE7IuxjSbLsLbgYDMDn7Rx/nYTK/ZI8W3Jc
         TW0i8vlbjI4f1KWltTUoF6rFQsy++mBHMXashXtVGIRm38svyvlMkDa7zxPsqjibLJc1
         r6tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787962698; x=1788567498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        b=R8CqcHzaRcp6vpJacgrjikf59WZrD6YOkzKiOhrrIuMguGbwkiw9k4nCpUrsQtEY/4
         ktn8cgct7JXINkye+eEdhrdzo8bS6/UJTQsmt4zUWbLrp02qNLSeYXyfi/JAsTq+2Q7f
         3Pi6bV0I3j695tpv8gb/6TcHZU3X6IXDXpKqqEC4kaYdN3hZAmMNVOSbRjpo8W6WPWIB
         UF4SMwhbrpAvBDREGb2o90Wg9wljdQsoVdCSw+LYWWhp5C1zEKNasIvJZz/4/WTlExQJ
         UWVmFcje9Cng3lVpQT4By+RxzOksW8tvZKjC/pnC6TYjwXwHE/7hO4tt5dzmwT5QVceL
         E6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962698; x=1788567498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        b=bJIqmkginVvRUlK/x+fHUKsDBCUWi9O0lM16lnf49ZmP5fKAWjF/jNTeKRH9x1xsLF
         1lO8jz2UR83FUDE+forWr+evwNk3ZT4ibKfSGSKNYC+x5MYVrl8tIaDl2v/gjAcIOZe+
         G2kGn7tLmMXxZXiDDRMTJsa4Z0xMDauuOj8SaVZIhLYghhZhd3GaSRUSMlrH3w91FLnO
         mEnLiixiw09TK8sdSwdP1uu1+1zg2P6TjA9bOYy3TBPVlVJx+WPxYXBrjyAgfAZTQkCc
         knUx2zF5HTqQwNdPO9X0be9QlwEvuHAzXLHjAv8NcNILHQol7UDAUIQmCN9jwA8CYJLe
         n10A==
X-Forwarded-Encrypted: i=1; AHgh+RoHz1buEXBEDIjXx4tJ0QN2SZ2nU0KepmHNM5iT26x/iLM+cAdrkhukzW+T4QlMweO6d+m9QsHKr9Wq88s=@vger.kernel.org
X-Gm-Message-State: AFuF++kTIuup3+HXUGjdZ54E8lqCbJNmtzNFTRDUTxRm3mqIQI+8V8mm
	8FROd3bU9wWW8hNxBMkJnSkj4cQ+N8t/Q5god+gsGyCgeOxQsoHsu5YO4dvgCaFde1JzyZE/acJ
	wBEfbPy8eXigZ+NvsEr0VsiMldsOzIdlitfebvXJ7
X-Gm-Gg: AR+sD12FsuHAJ+qXcBbwRZSDgW131f2Xg5DlPpeAfWszV1Bt+0PVttinq3T3o+mR35g
	xvesvRZeANwrlQeyXOLBjTstItA2boPfC1sLXBgDpsd3xNqEEqQxJ04vpw0IJeZf9MwIroi75WK
	33pk9GP69K6+RAQtoWx470xCtDfgc4gYlgw1LbLLk5HfjLFb452mcsCQ/mz7Kx+Ysp9PUW5B1dN
	P6BxXt/aJjuuS7wUVr1qcnlRCGYSuhref35Iy4UvnBVfFv+YAuX/6cpUNarZdEh9yc675/DCvTw
	u6V9IJuRIjxK/T/cZ5TIextqKfZ3kzj/0lchX6bufq06Hhd9HMknCjfvLFBGfhQiJ4T0C3wBYjA
	=
X-Received: by 2002:a05:600c:6051:b0:499:c46c:addc with SMTP id
 5b1f17b1804b1-49ccbb107damr428575e9.2.1787962697528; Fri, 28 Aug 2026
 17:18:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828120408.GN687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828120408.GN687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 17:18:05 -0700
X-Gm-Features: AcwNN1U6VBNd8zJTEq4mYD8VweLtljSgvulTToePYb44m-5Q8rEJ_yFqUyGXmiE
Message-ID: <CAOiLmNHWGSwAqH815X3JWMrQCc2nh-fRNsNZ0hjQGv8JvFndag@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:04=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > @@ -4320,8 +4319,18 @@ int try_to_wake_up(struct task_struct *p, unsign=
ed int state, int wake_flags)
> >                * A similar smp_rmb() lives in __task_needs_rq_lock().
> >                */
> >               smp_rmb();
> > -             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
> > +             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags)) =
{
> > +                     trace_sched_waking(p);
> > +                     break;
> > +             }
> > +
> > +             if (!ensure_stack_is_present(p, &need_deferred_repopulate=
)) {
> > +                     WRITE_ONCE(p->__state, TASK_STACK_RECLAIM);
> > +                     do_deferred_repopulate_wake =3D need_deferred_rep=
opulate;
> >                       break;
> > +             }
> > +
> > +             trace_sched_waking(p);
>
> Absolutely not; ensure_stack_is_present() must not call
> repopulate_stack() while holding ->pi_lock. Not happening.

The optimistic fast path for repopulate_stack() could be modified to
try pulling from a pre-allocated pool of zero'ed pages. That would
reduce the function to a couple of memcg_kmem_charge_page() calls and
then vmap_pages_range() to repopulate the stack's page tables. That
wouldn't require touching any locks except a raw_spinlock protecting
the pre-allocated pool (or just make it per_cpu). In terms of cost,
this would involve a couple of atomic operations for the page pool
lock and the memcg charging plus non-atomic operations on 5-10 other
cache lines.

Is that within the scope of what can be done under the pi_lock? If
that's still not happening, I can see how things look if we always
defer wakeup to a workqueue.

-David
