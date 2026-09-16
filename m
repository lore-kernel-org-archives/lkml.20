Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B783358DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529403; cv=pass; b=CchmSRqHaQu1WuvcHSigdwarHbn0c0a3dFsUsN2dz/NaB+xbj7ZXGnfIzx/8NUvEv4FcaJpG5NDcEOSyL2jyoFMymwPNI9tjO+/XRvn/SHOk6CPIOdp8OoszlD8KhYRfklmJyKz+npElmKSbtKfVLb3OYiaUELmdWQO/TLlDceI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529403; c=relaxed/simple;
	bh=dCHCocecSGZPi84hY5y85r4qFG+OorWwo7uZne4tM54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeVhaP+oT5oaNYMiiKBmS2HXQl0Aiu93MsuGjcEX8vNKr0yATzX7hgZMD5GK6SxL129qvbgehRAZXwL5L710r8m3N5+Fwauk+nx5noytPmG1jDr4fNSFRCxqm2/gwfaaEFLmt7qjq5bVU/bD/olCMAUC61NA+UnEbCVU4E5/CS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ixI3sYKx; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ixI3sYKx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1078935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789529400; cv=none;
        d=google.com; s=arc-20260327;
        b=mg+bGsNx1kEyMfx1uAaMH1C75vfQmexPbFKIMMpqEdoSP80gKnH/7JaJ0uSkHtO/e7
         mcGvdJZnUgiBA3ab7AXsD7zT9+ZdPvFnxbE+nR4OPoPDDdNexw43LKHhQpZx0xyKdNyR
         Y/wVHxvkdgFd4dJHRnbGK5FHnkAdjihIRMdY4MdUnD3FMqfDsSSQo2vfnpvkYo0uyUmG
         LvM2CP9rOU8XkSbV0XDPpO4aWqU57VlXnBa83LuRk9t/5juTvrJsyoz00d2xo/zwjgZs
         fFOLNQoviV6ADJ/xfdWKBOWgU4FwowiVDi6ouujqg6Sf4eId+rVwY8cmT7WYEb0IM3Qt
         0xWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uDcTyGMnI2BgV5Hi+QbgAQIfVH73BGlHbf43DvTeRb8=;
        fh=HKwJbd2om28QjAHdpF3ZTwSTV+xHrrZAakJjuVqTLYk=;
        b=ZtBep4kXQLKKs7VmMJDxB/RUNFLaBxRb0n2AXXyPmNSIRZOEN3PPrrAw35pjwhVvMo
         pe5ndFp84EZpud6sAVj8i/axY5vfU0Ywc3iQGdCO//xe+XRA1QBQ5A90En2/rUGcQSRd
         Hll0IJu35S97nEs33pdJheeAbi+FlY5ukdZdUfOo2YS+PmBwrTL6Pc56wUvfGsDhw4/1
         4Zx7CVrDn+SRiPoZXLsqDHksqVkdXFlo8uQk+AHQIZGL+QSEoMoNaJpsK1LIgguGannT
         VlilKVuvkzth5iqRF9K3CFVVCNyzsWvZ8LgdAHPu9aGKpfD8VhNR5w/jSc9tuQ/lBvgF
         TEOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789529400; x=1790134200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uDcTyGMnI2BgV5Hi+QbgAQIfVH73BGlHbf43DvTeRb8=;
        b=ixI3sYKx7i8EqhUzyBDf7Sa8H2bKl+Il9dZkHHa7cox8hZ3uP77QMciGFogz+SIR9C
         v4aluMND9wgB7A8RVPftahVidqbMrhQhMLRNYSf5RlNY8mW9X47pcK6osdZjKqE54qI1
         Lwbt8nJATg0zaWpVZHi41G9kPp+6G7/QXWpLYSUlyqXrYataDAY1E+X3stROXPxaoT3i
         1XWihqFKhnlQfSnZBIOvdL4nD8z31Nyvd82jarrQSingom5KfXXFyNOXB/SaXmUZI3bL
         oPUKhUPep417ES7VNE003Lp9sFHX2nnRLvAVKba5cYkksIXA6NRQJnFCFVQ4+HpVmoM/
         oESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529400; x=1790134200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDcTyGMnI2BgV5Hi+QbgAQIfVH73BGlHbf43DvTeRb8=;
        b=U7b52Lm9nkMPZXzx6cSOAL9nkCa6j9NM95PQWpI5mYJLnVi4aMKSiAuFexhkHH6F7b
         xxmt4jt7zvWk5oSsYSn5pjbt8qL3AJs7ygDa4c1OGuCP2tY0rTyswlYUb/Au5bkDmgO5
         ED00Bbak12dvJEaB6DXt0vf6FvIhDPsklbMOfcnfxj8GF5B+RqivLSAKKbp+erdYVYYG
         jNogOiiZNVZGk5kR+F2VA69dOcg8HIginDF1ZXbM9jz19O8Grzcl0bFhECD5Lj6MlkM1
         GI14xYPtOZQD0emWPN8yUwMpV0i9W0+Uf1ORCUMpRSpLq70EvAfYxgjmNRaS7oDd4sbz
         2h4A==
X-Forwarded-Encrypted: i=1; AKwUvBxBjHEm3c6js0gIXkLzTyhVetvsKbSmdxsmMccPbqtPPqv1z+20I32jbykoUAxzuv2y1ZD9NQ/8ZdDy6gY=@vger.kernel.org
X-Gm-Message-State: AFuF++niVsilP2r+pRjKWdtNjow2Js/1ftCXBeFr4RLZMP4wtGcIlax1
	8XSh2qQ/DfM4EUuKi+8LlI89w90z7icd7bOQ/uGrvLSQ3Y5S8EkDncnHfCZksg1YoLzROtmkVh6
	JHtRS/Fia4rVMgiBB+4MM1O7uyaxJjYvfhMBjDRA=
X-Gm-Gg: AYBFou2Wsh8kLHzXajT6pPK6KQ+tkjvEoIEtBYYjTSIjHYplGICwtgbrIq5lVIlRru1
	BsQmFPA9eCzoiOfxyZ/oxXtnKv2cqzCCTPqVnWwa2VLWbibWUkss/Fax6gwvhgsfpn8cXSZizvn
	NNZH2yJgoWI4FJz8IIfPwgRikUDWvjHL6QHvmIvCo7ONA8gI3O2IVVyyYuKv0/xweC7m1aVQrh6
	zZ81YuJNQeKBvn1cPNW34/0nFOW0xxRhbROmWRz7ON6t7RdbYlcwmCXE7ANMVxHsPAx6CZIaHY+
	+fNCWX95WgW73CNMv9niMUMUkc37utNBZTRJHoS2ayUaG8nLYViE9d+eqB3t1iYskK44mVMhVjm
	f5wOmJN+ut63ZFSCvfzmMyE9FpgtQUONRwz95zvTepGZl/08NYalGTSLyKwOc2x41w0cmGSlUJb
	GEugWNnOY=
X-Received: by 2002:a05:600c:8b8a:b0:49e:6836:5386 with SMTP id
 5b1f17b1804b1-49e8b621e03mr9386865e9.0.1789529399916; Tue, 15 Sep 2026
 20:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com> <20260826062901.2137-5-kprateek.nayak@amd.com>
In-Reply-To: <20260826062901.2137-5-kprateek.nayak@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Sep 2026 20:29:47 -0700
X-Gm-Features: AcwNN1VZYids1-8EMDW-xQxG4a1rOorl_00tdsS0ws-sq0kwaKe4w2fW-lYJMHQ
Message-ID: <CANDhNCrgA4FtvybSaigh1nfDr2r+xz5FDrhpWHnD3FS3FD2tWA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/16] sched/core: Activate blocked donor when no
 owner is found
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

On Tue, Aug 25, 2026 at 11:30=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
>
> mutex_unlock_slowpath() follows:
>
>     if (owner & MUTEX_FLAG_HANDOFF)
>         break /* ... and do __mutex_handoff() */
>
>     if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_fla=
gs(owner))) {
>         if (owner & MUTEX_FLAG_WAITERS)
>             break; /* ... and wake up the forst waiter. */
>
> MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
> up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
> the lock_word and wakes up the first waiter to try a
> __mutex_trylock_or_handoff().

We also set it when there is a blocked_donor, to ensure the task
donating its time to the owner gets the lock next.

> MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
> trying to hijack the lock from waiter all the time and potentially
> starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
> always set in presence of a waiter.
>
> If a blocked donor is deactivated when no owner is observed, it may not
> be woken up until it becomes the first waiter and is naturally woken up
> which breaks proxy in the interim.

Hrm. So in older versions of the proxy-migration/return-migration
logic, if the owner was NULL we'd clear the donor's blocked_on and
either run it or do return migration, which I guess wouldn't see this
issue.

I'm curious, is this behavior something you've observed directly or
did you just find it through code inspection?

I'm wondering as in playing with Suleiman's proxy-futex work I've seen
a few traces that had some unexpected behavior and I'm wondering if
this might be the cause.

> Wake up the blocked donor and allow it to grab the lock when no owner is
> observed. If the task manages to grab the lock, the block chain will
> follow at the next proxy migration. If the task fails to grab the lock,
> same situation is restored and everyone migrated to the CPU of new
> owner.

This seems reasonable to me.   For the situation to occcur, we'd need
the task A to be deep on the waiter list, and be in blocked_on chain
from a selected donor, and the lock its blocked on to be unlocked and
ownerlist before the woken top waiter is able to take it.

If the task is important enough to be in a donor chain, then we might
as well wake it and let it try to steal the lock. That seems better
than deactivating it and the whole chain until it rises to the top of
the lock waiter-list. Especaially as if we came in a moment later and
found it owned, we'd be potentially migrating the whole chain to a
different runqueue just to boost it. So yeah, making the most of the
opportunity and trying to grab it makes sense to me.

>
> Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migratio=
n for PROXY_WAKING case")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> XXX: Is there a better way to handle this? If we can confirm a owner in
> find_proxy_task(), we don't need to do a spurious wakeup of every task
> observing !owner.

I guess I'd want to get some metrics to see how common spurious
wakeups are and how problematic they might be.

> proxy_resched_idle() until owner appears in an option but it will spin
> until next owner appears.

Eh, that feels wasteful (especially if the top waiter unlock woke up
ends up deep in the runqueue and doesn't run for awhile - I see Andrea
raised this point).

I've lightly tested with this and it seemed ok. Though I want to do
some more runs with it applied along with the proxy-futex code to
understand if it helps.

Acked-by: John Stultz <jstultz@google.com>
