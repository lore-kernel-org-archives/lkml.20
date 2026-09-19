Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C21E9919
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841853; cv=none; b=Fl3rTzmWBTqLDz3CwodQHIIjf69L/evRlzZKLewq3XhAlWafvIdm6WMrtB1xicDoGJRaPCEZn0biwiscyqTEbEo1DhO0Vc/3nvGVSIALB5MK2qnrZvnfnF2x+oFQi/ZWJ3GtatsWqGBd6cRZr0c8nelkYHMu8hVzGN5ULH5+Ulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841853; c=relaxed/simple;
	bh=UcqyNHXZvx2r6WjOFg4/qjzvwa+voeCemJ2lL0pUUTo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=DEmOKHpino+XYH9Ofv1oHM2v/0seSJRnNiuld0Hjocp1fYFDynL0wgVbV169W/XVFKHxcu0oq5A/TY8KaenM+HkFo3ZOdeknIj/y36HIkXoTFG8vfp0wfhnIx9+VVV1/uAcL7lrF/ixuMA3Bu37OWg26yFKb9o8kTyKAAQSv5kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZGOIzqV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZGOIzqV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1822388a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841852; x=1790446652; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXlL+5LiPO2Gr9S8btdNT0yhev55DeOp6fa7hhJR9YM=;
        b=iZGOIzqVjH3KpgRpSYo4htAvx6vnlXJB+5uicB07fMADM3UWjWyD51s8PeF7W6XOPa
         PcNjDMkqBqakhq8iNuW30ueylE8qP4Ki+ZEpVfkgFfLe+uxJvzR7EV5pYza4xoqCHL3B
         Qf0XtBJsaGcsc3ILJhWG+aBa2ThnUbB8Ex7FVOLrKZOnz7irLgvdG3Y2R/Jhzu2Dgif7
         rkPScs2pgv6x4o9ku5qv56MP07RmZVjRb+7O71KYQLZigrx+X0BkH2cVSB5YLLbRbw95
         9btNpI5xE8Uf4wuz6NIve8n0eA/LdhNgPmVKE7Cva4qHtxR72maDh8jd/UV4TCMWrvVr
         KXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841852; x=1790446652;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXlL+5LiPO2Gr9S8btdNT0yhev55DeOp6fa7hhJR9YM=;
        b=pprThpKwDBKGe+V+BX7odOtXmdnWhOULnoiV42Dx5nPXPosU/hACYr16nLa6jGgXg+
         ILRepjpgWI539PaV8lk3htb6V1g7fzMV8u2wpQnv5qwfEjuVYhSrFgJCFpk5knIoICmp
         v1LO5izLKoxZvnC/FRlDy3XWoKZVSJY9DYl4z82WQTD/1qXDSeaSbsydbsJu3ZY+7YP5
         6I3Onvvp5iRriAz00uX1dC9Q/E0B28ZpOb4xsdxySH9EIchYUd+64xSnSqjTp+6ZABvd
         0SDA3RN72CZmvmIZPE1fgFzWddWizPybYXajMpKu1Jr4h/EE9/qavQ3pzuVF/R0t2eNn
         uslA==
X-Forwarded-Encrypted: i=1; AKwUvBwzrlMKXfvxqwCmU1szAfxnU9y0Skeor2MZ/l8UR3gNU3ovz8/R/teoBzJkLWuxJDqmsoOjcIq/3Gv9zy4=@vger.kernel.org
X-Gm-Message-State: AFuF++keom65RI/AvS8JJzdSyjsivCJmwoCrgNSVMFG1dFBga62rRyDj
	EeuzX/90jgHtQk3y3n/wAvmqFxtO/0nRJbB+re7SBZ02einLAxrUCrwy
X-Gm-Gg: AYBFou244tge0gDBClK6DYa1OwyQCAhz1VBF1wsi/mzW4CAHpFNNd6mCKnetm2e6cN/
	/uVK6sMhF5u8fITs8oRcBiVPCXitd2DXpzWX0TkMOcU/J3BR/f4KMmABw2CjL7LzOJsBMmCUavO
	XRp/zz6qLMVfB9acMjTcvBXHpIuPlH2a6SJDIfWW8EiqHNEGQpBqDQR/RAWYHlr+cmRdFEkMNCL
	BDIH4z30eXDVlydvcVJq8v/pPwjihTMw2HsMFq+sGwUOsUMDin/tfING7bF8K/hl/k5ZHFcWeat
	szMlWn6mRiL0BV3B2cqi0yUo/c2K1y7wR36tcRDpkAC5pBmuGbojndxqzCPXQvpkla2ix8oWGQ6
	KTFaVTIK/sg8m2v1LAvL/b5zPcxr+EkLQH29qGT1M95TzIftdVsILe+0HkQi/kcbbODa+7XYIMm
	zf+lUkQNPWUXS2v0Ald02MeQTAs0f0bpZbbf8MsRKvZDyBTUpag68dWf0lRhVaOn2AvcEWO4SWL
	S79EPTnUhQEeBHj7FYXPZ2vzsAVEH+LmQJJW5765hr4JfiXZVdOAm2CFeXUBY6vdboyImhwPMYa
	bL0=
X-Received: by 2002:a17:90a:d005:b0:39d:f731:e5f3 with SMTP id 98e67ed59e1d1-39e54f0e839mr11355351a91.24.1789841851709;
        Sat, 19 Sep 2026 11:17:31 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm4333791a91.1.2026.09.19.11.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 11:17:31 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 18:17:30 +0000
Message-Id: <DLJHZEZMLW0F.27OPPS218CX9Q@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Hao Li"
 <hao.li@linux.dev>, "Suren Baghdasaryan" <surenb@google.com>, "Michal
 Hocko" <mhocko@suse.com>, "Brendan Jackman" <jackmanb@google.com>, "Amery
 Hung" <ameryhung@gmail.com>, "Swaraj Gaikwad"
 <swarajgaikwad1925@gmail.com>, "Clark Williams" <clrkwllms@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, <linux-mm@kvack.org>,
 <bpf@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mm: restrict can_spin_trylock() to preemptible
 context on PREEMPT_RT
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Karl Mehltretter" <kmehltretter@gmail.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Harry Yoo" <harry@kernel.org>, "Sebastian Andrzej
 Siewior" <bigeasy@linutronix.de>
In-Reply-To: <20260919171443.90512-1-kmehltretter@gmail.com>
References: <20260919171443.90512-1-kmehltretter@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Sep 19, 2026 at 07:14 PM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> Allow preemptible context only, as v6.19 did. A held raw spinlock
> implies !preemptible(), so the locks of the caller do not have to be
> known. With this change both machines pass 10 of 10 boots.
>
> The nolock allocations then fail on PREEMPT_RT from every context with
> preemption or interrupts disabled, also where no scheduler lock is
> held. Creation of BPF local storage from such a context fails, as it
> did in v6.19.

6.19 had this check in kmalloc_nolock() only. alloc_pages_nolock() and
free_pages_nolock() allowed irqs disabled since they were introduced,
and arena was sleepable only under a mutex back then.

[...]

> diff --git a/mm/internal.h b/mm/internal.h
> index 38b1165212c94..29646c4afb419 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1641,10 +1641,14 @@ static inline bool can_spin_trylock(void)

[...]

> -	if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi()
 || in_hardirq()))
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT) && !preemptible())
>  		return false;

No. This kills bpf arena on RT.
Since 7.0 arena_alloc_pages() and arena_vm_fault() take
raw_res_spin_lock_irqsave(&arena->spinlock) and call
alloc_pages_nolock() and kmalloc_nolock() (from range_tree) under it.
With !preemptible() here bpf_arena_alloc_pages() returns NULL for every
prog, sleepable included, and a user space fault in arena gets SIGSEGV.

As Sebastian said in
https://lore.kernel.org/r/20260831143500.x-saxdAs@linutronix.de
raw_spinlock_t is fine in general. pi_lock is special. rq lock too,
I think, since rt_spin_unlock() can end up in try_to_wake_up().
The check has to be about those and not about every irq/preempt
disabled section.

pw-bot: cr
