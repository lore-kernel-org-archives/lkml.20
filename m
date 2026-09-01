Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCF747CA8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254857; cv=none; b=Qt8obmJFbE71+aT10usEmdmeGca0/N7jV95wZBJlvXmpnpGdAJ0W7CiJ/z0GVlLGH3jyMnrT2UMZqjyXN4nuf6YAFueirDMelnWcSOBt9huCKcxJb+vvsNzv2PFCaZQSNsqbiYE7ze34Y6jExdGZnApORUgUJtUjpQq8RuLv1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254857; c=relaxed/simple;
	bh=nPpXfR6NAp88fxH/7MU90CJYM/Ds+nZslD3wQ7OxXNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=naR5+SjnZ97w8eCtsIH+jexYSamCeXmExC9avHErli8LfeR6gA5swOD4oj9bQfJuoOrf1TYo04kr/Rz5PMMEN5ZtZlCyBIy1+qRvEqn56IY2y2nC8HDH1HcZqAWF3zW3hnHQNpx/vLYSI68JST+eegC62yj0Wue8HwaSPwFOJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vu8Yww7d; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vu8Yww7d"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c20e5890680so366192166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788254853; x=1788859653; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdC630qSepMOzA2lVAlUNAGtTB350vu7dUwfU0LuExI=;
        b=vu8Yww7d3DEjv0fdQ5NyyhRj++SNy2VMV1C/TysSajyAniRBae7wHefo5hpNFK6S8r
         33YINs/+jtbBJXielBNV3GFk7xq4T8MJs3EUhAdWgZ4JHfFo1rIZxp3cd3dkDqSiavay
         LOMrRX8t8yWFTcCSj408kf1TTo7XTjSth7lsYZIgSbNIeDXmp61rAya9WigGgIumSzP3
         72HNha7zQW/nwztEcsbBTpTOfr7qq8HNa5Jx/3WM+/RdOaH3NZ1WVRaHwU7P3ZMiaSuS
         vk6+k8PdRmBLPWLXlk08Z7fY0LYA2QzYuIFpKrp4wkLD8lMlyK4nNgOFLrVu029ZyjGl
         Vhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254853; x=1788859653;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdC630qSepMOzA2lVAlUNAGtTB350vu7dUwfU0LuExI=;
        b=muOUfphYkrqdxcwEDtqcavm05nn4LcyEoz17+/IrDQo5UBS4APBCLa/SIExmC6HMc2
         Q+2VWwzO/vBOuQykGRcnlGEi9VXNVwMvsqmST4DY+ymx8Ln4legpBC6MMhuBBAfmFPjB
         H0UFKYKCqO6r8FByO/HhSdQg//qrXg43oY97FyIJcRHyPfkt1hwpe61DHpYukuorFRT/
         1T1sCVl1067EXFyQeEQOm0xYvuwXT/zYhng4Bu7YwbeEYkWrX3Xe/C0g7c48dmVi46Ic
         goUfp4N9Px0p35dJIPng1TT/W4kabJSoaGBXdF9LmnKQsBdI4T5BOjY+GF6CKCs4jgf6
         5oYg==
X-Forwarded-Encrypted: i=1; AKwUvBwK6lCiudilTwxqCrR9GW6tfM5Gr7U5Ys9KAZWHcirHwFTyxAOqznzfswlu2kZYsTEb4C4w3jp32Wc6f88=@vger.kernel.org
X-Gm-Message-State: AFuF++nfaFNVp96Lx0i4CtNHydUD1FNAdnuiqzY9EFJ+dwjIYp6Ulj/3
	PZrQ/RPhyLFrpqLZZ1l6gD9F/C5d8de+p+r6DfwJxiDyACldOt4OCXs5TxAsqPi5ssVwBTTKI7a
	aVYfSagghZWb6JDbwAA==
X-Received: from ejblv5.prod.google.com ([2002:a17:906:bc85:b0:c20:221c:9ee2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:18cb:b0:c25:848a:4a8d with SMTP id a640c23a62f3a-c25848a4edamr1140296766b.5.1788254852741;
 Tue, 01 Sep 2026 02:27:32 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:27:31 +0000
In-Reply-To: <20260827232948.2520558-9-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-9-stevensd@google.com>
Message-ID: <apaagy0KJRPVtwHM@google.com>
Subject: Re: [RFC 08/10] Set PF_RECLAIMABLE_STACK in various places
From: Alice Ryhl <aliceryhl@google.com>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 04:29:46PM -0700, David Stevens wrote:
> Annotate various blocking locations with the PF_RECLAIMABLE_STACK.
> 
> Signed-off-by: David Stevens <stevensd@google.com>
> ---
>  drivers/android/binder/thread.rs | 14 +++++++++++++
>  fs/eventpoll.c                   |  3 +++
>  fs/pipe.c                        | 28 ++++++++++++++++---------
>  fs/select.c                      |  3 +++
>  kernel/futex/waitwake.c          |  3 +++
>  kernel/signal.c                  | 36 +++++++++++++++++++-------------
>  kernel/time/hrtimer.c            |  3 +++
>  rust/kernel/task.rs              | 16 ++++++++++++++
>  8 files changed, 82 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index bc0ef8927905..be62f7fd43ca 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -538,13 +538,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
>  
>          // Loop waiting only on the local queue (i.e., not registering with the process queue).
>          let mut inner = self.inner.lock();
> +        // SAFETY: Only accessed locally in this function
> +        let current = unsafe { Task::current() };

You can invoke kernel::current!() instead to avoid unsafe here.

>          loop {
>              if let Some(work) = inner.pop_work() {
>                  return Ok(Some(work));
>              }
>  
>              inner.looper_flags |= LOOPER_WAITING;
> +
> +            current.set_flag_bits(bindings::PF_RECLAIMABLE_STACK);
> +
>              let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
> +
> +            current.clear_flag_bits(bindings::PF_RECLAIMABLE_STACK);

It would be nicer to define a guard type like you did in C so that this
is less "manual".

> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 38273f4eedb5..6168f058343a 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -344,6 +344,22 @@ pub fn group_leader(&self) -> &Task {
>          // only be used while `current` is still valid, thus still running.
>          unsafe { &*ptr.cast() }
>      }
> +
> +    /// Sets the given task flag bits on the current task.
> +    #[inline]
> +    pub fn set_flag_bits(&self, set: u32) {
> +            // SAFETY: The `flags` field of `current` is not modified from other threads, so
> +	    // the non-atomic update isn't a race.
> +	    unsafe { (*self.as_ptr()).flags |= set }
> +    }
> +
> +    /// Clears the given task flag bits on the current task.
> +    #[inline]
> +    pub fn clear_flag_bits(&self, clear: u32) {
> +            // SAFETY: The `flags` field of `current` is not modified from other threads, so
> +	    // the non-atomic update isn't a race.
> +	    unsafe { (*self.as_ptr()).flags &= !clear }
> +    }

It looks like the indentation here is a bit off. Please try invoking
'make rustfmt' to reformat this code.

Alice
