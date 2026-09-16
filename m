Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F55C2D7398
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536188; cv=pass; b=jPicfevlznuQgkAROwTKGKDGSuw8cOwEupa5iYkaCOIS/2xj8/ZIxFXLby/L5zxuClCSozt0WT4ZAzcMtDxqRK4SmPGdmwKp/Gay0oH0OuULO8kTiuSvtmxiKu99jp44UL9cKbkBF8UkeAJg7JRTwrSRQPQo3HqlF+MxsVfX6JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536188; c=relaxed/simple;
	bh=9gss/hrHg5ycsm50GVU+nf2awG9lbQ0k2w5X20D7LCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbSFc2tzXwB6blMhcTd90WHlOIr12LTeRKKCzM4dnWfCrhBJrbYgYDrifUlHE/S7PoXdzCNF6pLPXEMrrHuW9yQ7YhjBFEONiQA7/kNeSUbdZlqQbeulnXVv4j3gCynLVONG8AZGw9RJt/jbvSKRyrbqvjy4zgFAmJ8YvgljkaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PqiBQr8G; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PqiBQr8G"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so312544f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789536185; cv=none;
        d=google.com; s=arc-20260327;
        b=Yq8VMbhAjzrsYPMT8LKanCuiQ5Eor9zQB035XudNH0P2BduiklCAfJtRsiZOXwkwVW
         mjCvqA1DYg5Ra0BiUpnpagYiJWxCgLNymr2pwYTXoeg1SG89gV13mbkpbxsM6i2TRUyK
         Bl48hpQNDgNttHv/jW6wMXHEfE/sZ9+0j0KZHvVAaDaE3uVmbK3qUIb6MrwvmxOPh1t4
         goYm6/YaXx/6+d6Ug/exodgeRNTs6NOGw6Rt8Yn2jx0Nk2WFQOSV8iD7rYwzR55BZHtA
         QiEoDA2dntHfYhBSitmK83yEntkaAZXFdSucrNZS7ZC6KnkmhcnDJuJ/NUnSCCwOe4Fz
         DJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K7wa7XsDt/kIfVGGEzc1okQjb0TdBu+aMqO4JCaTiEw=;
        fh=9hp9hONCVXRsKzFgzX/EslZ1MMxVNYqUwY3NopQyYJg=;
        b=oDuPMf4gkxY6bo34C1WObJtAeBmB7rBH1zS2q/OhobEfIrax6DTtoMoqyW75jOILCS
         p9C2Ju6mMNu+wt3tdDpgzf21P1SY5An7nRqGxNYp3/tDZp+/0Jm14ETx8hM8SiPhUuFA
         8fk9onF/5w9x3gF55JBxLjYRf/8vsYbJM55iYicMXxNIM8hqYNMc+j2NgZajz4vcEq2a
         brUhg1PFVLv7WbwQPvXY6rhWwxGQ54gKAnCeImI5zve7B0e03u5zHqGOEB1FRq8o8v7L
         4RfVduhd4UB8bPSeIhqD1WVcjF+Tcq2eUgh0F9fgBGSFz2sTFDmNHau7kBCNuO0hBzzG
         yaqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789536185; x=1790140985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7wa7XsDt/kIfVGGEzc1okQjb0TdBu+aMqO4JCaTiEw=;
        b=PqiBQr8GJFd1rCO5xUaHAYie6+1CJVttAjuSHGbYIlGx4apiNMbEviv+IkkxfonOPU
         q9fZN9KmSbKEO5SCMQmJXiK5Fohds0jvKSoA20GjQP9vQ945XqINYwkcLyVxdsR8g041
         B0peH1yoPDoRthA09h9zMDkggGYlzNOuBVG0nVAL7B38PcnIQHex3abe9Zuw6Gdp5827
         YDdyF4NBNmadezkGr5F9GwpdpIrHq3KMTFeilrrBTyKfNSyRpUUI2FupMybRHDpKMLdy
         erYe8OShcsgHXgx0da20aTo58e/NsgA9+cZopamDU8qdn3Ijrsez0Xan6+m2H1cVXtaL
         TvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536185; x=1790140985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7wa7XsDt/kIfVGGEzc1okQjb0TdBu+aMqO4JCaTiEw=;
        b=qx+jOWaAqA/t7vCfb5uQvmrKg1Iylz5ppp8vSEk1tEJJSMPWANHxdJ5CtB1tEfM7ai
         TfU0NxuwIyB342+88UxIQU0Xk6S4L0ztBlni0WzKfEIJ4WQALVAhuVPuPiJGa4sOY/is
         lql1GUopjIwJ8Fxcp5S8mlrQA/L1iLN+qNCve078NvgKyqiCa8Fu5czP8yKrKQEbPSXU
         swk4JCRwVrOX0y3PBdeFxPEoYlPE8u9LI1shLy0F080G92aspqkMeu3R8bNIwHUjWu/N
         pjBdn4HVyCqsmsRUE5e6mHSTRJGW17/4sTL3U1SF0N2jLKixusfxma8HpbFm0tVZe1up
         vNGg==
X-Forwarded-Encrypted: i=1; AKwUvBwcRdX8upfB7eTulkmp75ItjDEbc8mMDYAoCcIjtsBFH70IQXLWJycUNhwZ9zEDE4a7xL3ISpwVhR1fiO4=@vger.kernel.org
X-Gm-Message-State: AFuF++mU00C+fNRoKjC9wqgjzz+OL4qeQ8+hZkDmXp9nzmuWsTbABZ1+
	7z4GVmBTvW4j2LkdWUf0rPQN5sNAVy1s4TEy6jzLT3dyRa8YbWCg998M9wfyqEcve6XF5BOeda9
	X6/HlXXBCBsecqOF0u2WUbY+i7czzo4ZSWebsCXc=
X-Gm-Gg: AYBFou3wmoX3/AvxtakElbbnTebL4zbnMcQIjSrvs839F7tsRvTgPMMToyVPTcK0k2m
	yTfi+KBcML1Qvq5CVGBavt974DLxhUuXnZl0Ibmrh9QBTU1z3yQ7NEDKWVxAfCqBVvCzskOD95P
	y75699Apm9ld4V8j+5TDlLPZ5cOBnUCblLI05h5S7ryggpncOBpuYr2fT5mH3QpJ1A1FWShRoN8
	mXEHwseMc8NN3xqqpjJjvPZjxz6fj3TKWOmDPwuez2elv3XG6AgwxuOCSXm88779KUBrqnzezze
	k9EeEtN9fBkHjVg4qaTtCXUYaTaj2He0ZTVAAsdzbmsjScdi2gcli/qTvpJ6bSTIdgjk94wLtcM
	9mI3CmrzdnG5fDm4rt4bMYqJuxbDJvpuZ8Xh8eLi2zB02zlDC/myvqD0jYMZKcU3ILA85xKnjMR
	j9IKp95IE=
X-Received: by 2002:a05:6000:988:b0:487:6e4:aa12 with SMTP id
 ffacd0b85a97d-4870cf0a157mr1110534f8f.4.1789536184673; Tue, 15 Sep 2026
 22:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
In-Reply-To: <20260826062901.2137-1-kprateek.nayak@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Sep 2026 22:22:51 -0700
X-Gm-Features: AcwNN1Vh2FTqSumHQqmLHyXNY1bBmS8VtVTHseEZUXOER_MslHzMzubXxG3xdVw
Message-ID: <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:29=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
>
> I had promised John I would share an insane idea if I got it
> working(ish) so this RFC presents an alternate approach to handle
> enqueued donor wakeup vs owner's chain-wakeup race via ttwu_runnable()
> path and make the activate path as light as possible for tasks that
> don't need to do a chain wakeup.
>
> The series essentially breaks down John's large patch at
> https://lore.kernel.org/lkml/20260807035232.1881495-9-jstultz@google.com/
> into smaller chunks while introducing the new approach and fixing a few
> snags encountered along the way (Patch 1 - Patch 4 are fixes that can be
> discussed without getting into the rest of the RFC).
>
> Disclaimer: Series in not bisectible in any way at the moment - related
> bits are introduced together at and intermediate builds may fail.
>
> Introduction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Handling sleeping owner requires proxy-chains to queue on the said owner
> and perform a chain activation when the blocked owner wakes up.
>
> Since a blocked donor can be woken up by another concurrent wake event,
> the activation path becomes complicated and wakeup has to take an extra
> lock (p->blocked_lock) to prevent any modifications to "p->blocked_head"
> and miss activating any blocked donors.
>
...
> Trade-off
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Advantages:
>
> o Only need to juggle blocked_lock(s) under a single rq_lock().
> o Re-use ttwu_runnable bit to handle removal of proxy donor.
> o No need to do get_task_stuct() / put_task_struct() juggling.
>
> Disadvantages:
>
> o Possible increased rq_lock contention on the chain-wakeup path but
>   those events are generally rare.
> o Lack of delayed task handling since the src_rq need to be locked
>   separately to migrate it.
>
> For the delayed handling, it is possible to use proxy_migrate_task() to
> move the task after blocking. Series does not implement this yet to
> limit the number of bad ideas.
>

Sorry again for being so slow to respond here!

The series definitely looks interesting, and it seems to be holding up
ok in testing.  Though figuring out how to refactor them so that they
are also bisectable looks like a real challenge (part of why my
sleeping-owner enqueuing is basically one big patch)!

That said, I can't say I've truly gotten my head fully around your
series yet. I've definitely had way more time with my change, so I'm a
little biased in feeling its somewhat more bounded (even though the
activate_blocked_waiters() function and the multiple lists of tasks
are very complicated).

My initial sense of the downsides here with your series are: It adds a
lot of new per-task state (blocked_cpu, is_linked/needs_rq_sync,
sched_migrated_on_blocking, lock_nesting) to keep track of, and some
of rules for the new state have dependencies
(sched_migrated_on_blocking is tied to is_linked), and leveraging the
ENQUEUE/DEQUEUE_MIGRATING flags feels a little subtle (I have often
gotten the ENQUEUE/DEQUEUE flags wrong in my patch series, and
unfortunately the general documentation around those flags is lagging
a bit, so this adds to it).

The locking being simpler is a clear benefit and definitely sound
appealing - though I do agree the rq_lock hold time in
proxy_activate_blocked_task() seems like it might be an issue.

I've got a few more questions on specific patches, so I'll reply there.

Again, it definitely is interesting and appears to be more integrated
into the scheduler logic, so I'd expect that will give us better
results then my maybe more isolated and tacked on activation logic.

Have you gotten a sense of what Peter thinks of it?

thanks
-john
