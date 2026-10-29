Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793267921;
	b=uxUavLrq+wueBD903+sI5U5AdzvZ8P1Pe4KW9fLv2/GK7M+FdJSlz4Xy3bcbp0+RiXmW
	 qY97yxFV7bD+MWQE08jKb9/RhHt484dVdKJjMa4iQkf021B1Cxz+kWIFUcI+qS4HrFQyM
	 Onvl2FG1kP59IIrobYKHrXOoQOpPp46i+jqolKSWXRFMmmIVVjw+jhuBwf/3o4yUq6Gs9
	 DY2LYopnTrYhD39Cu9rdlt3UlYkITtjI+tGpGH4nJRVGhMUX/mGPGbLEi1m2Jc/0egT3B
	 EnsruJrIW89rrtbC3UBZYilvrl56s0OehmQ4kClxlcQFqGdxvjCY1HzkIMMDkJM3wtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
	b=THrGuV0Iadben+ArFTeRwjfmV13X8QfNlwx4eivJeftEiacBtFCN8xcGO9W8CLtmbYtJ
	 HQ/QWFIeLo4XcjMsfBzSALE1O2Kzas8BYIwpflbJCy1Dc45fNiNhccXLTzcKQ6Ac3YgK+
	 h606+3lYgHyj0Vs/FE0S0qg0Q1xJKE3hVcooiNrnAx1C9aNXE+9Ke/Z+PzxjqkzpaoRup
	 nqD9VlUU9730ywqSxahSrlRTVAb0AWo7GltHcGiBk3FOI35daCAfnvLWUTyHXhP9nHPBJ
	 ucLXTA0gwv72PBFfUmLZQxzbUqhGds6Ntv3UVk4vBaDlEtSR3V4uEzigx2Tx0h+VBeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmLH3ecd;
	arc=fail smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAC606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FAC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmLH3ecd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso10731095e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793267919; cv=none;
        d=google.com; s=arc-20260327;
        b=YBhEK/O9iijJ+KpebSC0kRQbK3bt8eSY+PoOo5lkruGCrJu+T5koes2NMso1SMUTE3
         fUtiLdys0Ae9Rdr3DQICJRAbU4yISpMoCvlmdOgxaxuXALYXQTqIRvQmOR5MCNjf8JN/
         T13ZuAI6cMlkHL9706ZBc3mByt/hcdLumQn1F7rwO11ggOLaQlYOl+pUQ4FVSLfscqIx
         pqT5iNoWjxiVM/1TBifhpfQGP5tvGRvgh6h1K+jyONB8e8a7hZxSm4IVKKMuJJgqJ6Ij
         7kiuQ716t/O4XRgnoOpiUF6vX8Y4OJyZwyTjObcqb9GkhN3BJnplqRk1uALA8CPFm2np
         Aq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        fh=fwm1ld6vZkOj194SyB7KmsE8SDS26OCMszoHBpPOB3g=;
        b=WgbOjJ/fEV+XYAGiUYKzSFhIkfZf2dziqfECVqggPcXxtbrH8pOQmSv03qB9rS5R5A
         SDOTI7DEmcrO4UcQdj4ou1a1bBA9+pLTtCIYjetV0JLi7yjG7VAbm0dxcGlnH0peATyF
         SKsdLxDfmUGtG+i8+6ag6MNVxWXNNDyCSTRREhTynWAD6oXuY/R/jcpCqqGUSEguvkGn
         SPyFIEAkce9DnBOFEfVEWPHnV6SFpT8TLK9TEKMMpJ2PG9HzFScI/0D43VfBaKF2Xq5W
         qKKQLYUeTF9itjSxXUwkep7NYEEvtcBxbI79aVsDtm0XV3S/7eY+oBM8NxpK3Nt1b/oH
         LAsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267919; x=1793872719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        b=KmLH3ecdsMA0FV9WSna7IrJggs/oMBbI0RXE7j/puUJUTtpgiG5IDBjca+s4vOHPnr
         kvx869iJiE2LVmA6UYSGhuGvnRfOQQnfg/sq9B/RtW7ccLaZboZM4cAaVLTzhaHt60Dj
         IE8lVgypJmRoDx2dCQI04ERcHnieV4aC83BsTOm3FIULqhHt0VmaSHd0e97SRf3ObA/D
         zik5mqCmO6uRmlsC0/R5taodK8l4x0+dJBPJM5JRDFjh2s9ZqD1d0gNe+dgddpyFhvRH
         s5VOQSAaCN81fctaLNX3sRG6DGOJcsaEGxQM06ZYmO/IlIUXws4BDBf/Dj93AYo90HQK
         cMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267919; x=1793872719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        b=GrZglxd6GQCwrvawD0S/H2YJVO2Jeq2iO80aUs7QtLKmIeDU2O1sIJifOoy4z8DQgY
         +i4eYrHgDnQW+idG2s37xx5jG2+NAqwMaEwxbdHYGEGkFHYn9IFUk8LD/hdahNx7oSNl
         4SRuVjDNv+/1vvEEoGaW5qUakUd7U08gr8c8c6j8+Bqy3Tef8GILwyoQ7ae7zigacDt+
         JLaCLx9lbKV5qBAwdbOzFMHXvU5xVKxxoRApuvQ0MRduQ85pV7qq0SENe6K1zsTRhd0z
         bg7vVwRSMrXsKk2hBp+D4OShkboxX+OdGnE705x5mEaWyFaxwupRaNTpDe7N8lBCwGwi
         EJvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuKJLPZ7Dum5zplsqpbXIT6zhIbmndv/X/Ozi6qXDLAfQK0imBEYRXqgpCpf6fzkKL8n3OIOXm5YcgKzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFQePaTQi6UlDhFqDrexrZH+cUTcZawnwHjW+1y5N/Qk4R3OO7
	HMWVcw3Uwx2DvDBvvfmCBuMZP6x6ELJHAj1Yk5agUlcYdkMnGNptaU8HXbNefKJ+h7WN9OjH420
	ZBWSf7kTyKITyriZiJm9ZgHqSDtSlceY=
X-Gm-Gg: AYBFou3XRORZBteDBpJnJz8powQ9IEogjbiFvMukRR2djmLVE763VK0RtR5KtqYvHRm
	ox0o0lj4kW45KohgEsdX+YPGB+DoPbKqessruMrqkVBSYKyuEKwEEY3twk0lWZjqWRsH0B9zIZK
	lzaWlOKUYWmM2WeThe78xVAx7jys1vQnYgYgIvlmLQ9Tlyf5DLWOrsmoVyeV9ANcEwpWA5vfybr
	CcSoyPHNosznzOTG05m7EozRXOV3NugGikZ3JMqjpQetk5AmqnCIeKwbRhJM9XiZBq0zJFtmwUH
	Ga5tOlhDl4CXocHFjXDfHoOWgz6iyV8tkPgdI54+MimfTEu/M3tU+LsKsd5T21BRAf/D70FPj2f
	JwgvDIg0/QARpn0KCBA6XTGiq2yae/RmyTpD9O/vuHZyOAUoCGdXAIqrjchpxB3iq5C7XVK8=
X-Received: by 2002:a05:600c:a103:b0:4a3:5d5d:48d9 with SMTP id
 5b1f17b1804b1-4a967ab127emr88000115e9.35.1793267918857; Thu, 29 Oct 2026
 02:58:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 29 Oct 2026 17:58:27 +0800
X-Gm-Features: AclHuK-PyU47NuYgIA0zE-mZxiBBfVoQmUb043GP6GTroV1D35cedFeNfUB49NM
Message-ID: <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
Subject: Re: [PATCH -rcu/dev 0/4] hazptrtorture: Fix shutdown hang and catch
 slot owner race
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Gary Guo <gary@garyguo.net>, 
	Bradley Morgan <brads@mainlining.org>, rcu@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I ran into both issues independently while developing new shared-scan
hazptr series and its torture-test scenarios.

For patch 1, I reproduced a shutdown hang on 16-CPU ARM64 KVM with
`CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=3Dy`, `nreaders=3D16`,
and `defer_modulus=3D4000`. The readers remained in D state, with
deferred-context stall reports reaching 147 seconds.

My prototype uses the same all-CPU drain operation, but keeps the writer
ahead of the readers in the cleanup order. With that change, the same test
unloaded in seconds. The upstream configuration was harder to trigger; I di=
d
not reproduce the hang in a 3-minute run on the unmodified `origin/dev`
baseline with `defer_modulus=3D100`.

Paul's concern about `torture_must_stop()` is valid: `fullstop` can make th=
e
drainer exit before the readers have stopped, so its exit-time flush is not
necessarily final. The reader-exit approach looks worth testing against bot=
h
the forced-slowpath case and the PREEMPT scenario Andrea reported.

I also saw the patch-3 warning during ARM64 `PROVE_LOCKING` testing,
although I have not reproduced it consistently. The warning count dropped
from 3 to 0 when the relevant fixes were applied together, so I cannot attr=
ibute
 that change to patch 3 alone.

These tests independently reproduced both issues in my setup. I'll check th=
e
final cleanup approach against the forced-slowpath scenario as the
series settles.

Thanks,
Kunwu

On Wed, Oct 28, 2026 at 12:38=E2=80=AFAM Andrea Parri <parri.andrea@gmail.c=
om> wrote:
>
> Patch 1 fixes a shutdown hang in hazptrtorture with deferral enabled, as
> in the PREEMPT scenario: hazptr_torture_cleanup() stops the kthread that
> releases deferred hazard pointers before the writer, which can then
> wait in ->sync() forever.  It now stops the readers before that
> kthread, which releases what is left once the readers have stopped, and
> that kthread before the writer.
>
> Patches 2 and 4 make hazptrtorture catch the race fixed by "hazptr:
> Record per-CPU slot owner after claiming the slot" (now on -rcu/dev)
> should it come back, as Paul asked [1] and agreed to [2].  Patch 2
> adds two CONFIG_HAZPTR_DEBUG checks of the recorded slot owner, in
> hazptr_release_debug() and hazptr_note_context_switch().  Patch 4 adds
> the nest_acquire module parameter, which makes readers take a second,
> nested hazard pointer that goes through __hazptr_acquire() while the
> first is in slot 0.
>
> Patch 3 fixes a false positive of an existing CONFIG_HAZPTR_DEBUG
> check, which the nesting of patch 4 exposes with CPU hotplug: a hazard
> pointer that __hazptr_acquire() puts directly in the backup slot warns
> if the task migrates before releasing it.  It comes before patch 4,
> which would otherwise make runs with CPU hotplug warn.
>
> The series applies on -rcu/dev.  30-minute hazptrtorture runs of the
> PREEMPT and NOPREEMPT scenarios pass on x86_64 with 8 CPUs, as do a
> 30-minute NOPREEMPT run with torture_type=3Dhazptr and three 10-minute
> PREEMPT runs: one with irq_acquire=3D100 and nest_acquire=3D1, one with
> CONFIG_HAZPTR_DEBUG=3Dn, and one with torture_type=3Dhazptr-stack.  The
> 30-minute PREEMPT run ends with as many hazard pointers released from
> the pending lists as were deferred (reldefer: 650385 relundefer
> 650385).  With kthread_do_pending_ms=3D10000, two 3-minute PREEMPT runs
> shut down in 100 and 130ms, well within one period.
>
> Without patch 4, hazptrtorture passes even without the slot-owner fix:
> its readers hold one hazard pointer each, so they reach the slow path
> only when the ptr_eq() check fails or the pointer is NULL.  With
> patches 2 and 4 but without the fix, PREEMPT and NOPREEMPT report the
> race 6.3 and 6.0 seconds after boot, and with nest_acquire=3D0 both run
> 10 minutes without a report.
>
> The nesting costs about a third of the outer reader iterations at the
> default nest_acquire=3D2.  If that is too much for every run, it could
> default to zero and be enabled from the scenario files instead.
>
> Patches 2 and 4 stand in for the KUnit reproducer mentioned in the RFC
> notes of the fix, which needs a test-only hook in
> __hazptr_try_acquire().  The checks can miss one case that the KUnit
> test covers: an interrupt handler that acquires and releases the slot
> instead of detaching it, then a context switch before the task's
> release, when no other hazard pointer claims the slot in between.
> hazptrtorture does not produce that case either, as
> hazptr_torture_acquire() always detaches.
>
> Patch 2's release check also warns about a second hazptr_release() of
> a ctx whose per-CPU slot another hazard pointer has claimed since.  The
> hazptr_release() kernel-doc permits that second release, but it clears
> the other hazard pointer, and a second release of a backup slot oopses
> even without this series.  Nothing in-tree releases a hazard pointer
> twice.  I will follow up separately on the kernel-doc.
>
> An LLM found the hang fixed by patch 1, the crash shown in patch 2 and
> the false positive fixed by patch 3.  It also helped write all four
> patches and their changelogs, and ran the tests above.
>
> ---
> Changes since RFC:
> - Patch 1: stop the readers, then do_pending, then the writer, and
>   release all deferred hazard pointers after torture_kthread_stopping(),
>   instead of keeping do_pending in its loop until it is stopped (Paul).
>   Paul suggested changing the "while (!torture_must_stop())" condition
>   to "while (!kthread_should_stop())"; this keeps it, for the reason in
>   [3].  The changelog also says when kthread_stop() can still delay the
>   exit of do_pending by a full kthread_do_pending_ms sleep (Paul).
>   Bradley's Acked-by is not carried over, as the patch changed.
> - Post patch 1 in a series (Bradley), now with patches 2 and 4, so
>   that hazptrtorture catches the race fixed by the slot-owner RFC patch
>   (Paul).
> - Patch 3: new, for the false positive that patch 4 exposes.
> - Do not repost the slot-owner RFC patch, which Paul has queued.
> - Drop the Assisted-by tags, following mainline commit 1e035297ffda
>   ("docs: remove Assisted-by references"), and describe the LLM use
>   in the changelogs and above instead.
>
> [1] https://lore.kernel.org/r/fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmc=
k-laptop/
> [2] https://lore.kernel.org/r/e0145c14-9d6a-4c91-816c-57dabd98879b@paulmc=
k-laptop/
> [3] https://lore.kernel.org/r/20261023120755.2463384-1-parri.andrea@gmail=
.com/
>
> RFC patch 1: https://lore.kernel.org/r/20261019162005.12888-1-parri.andre=
a@gmail.com/
> RFC slot-owner fix: https://lore.kernel.org/r/20261019161852.12783-1-parr=
i.andrea@gmail.com/
>
> Andrea Parri (4):
>   hazptrtorture: Release all deferred hazard pointers before stopping
>   hazptr: Check per-CPU slot owner with CONFIG_HAZPTR_DEBUG
>   hazptr: Do not warn when a backup slot is released on another CPU
>   hazptrtorture: Nest a second hazard pointer in readers
>
>  .../admin-guide/kernel-parameters.txt         |  6 +++
>  include/linux/hazptr.h                        | 13 ++++++
>  kernel/hazptr.c                               |  4 ++
>  kernel/rcu/hazptrtorture.c                    | 40 ++++++++++++++++++-
>  4 files changed, 61 insertions(+), 2 deletions(-)
>
>
> base-commit: 633f91e3408cc65a5237752a3265b031c389e43e
> --
> 2.53.0
>
