Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF223A785C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023182; cv=none; b=rmSMyhy4Cg1OTrUES/qL2KoSJDzah/pbDleogRzDNYO9xgo6WYbTGyf0EhFgbWD/fsEXlaV1W5o+ZNxbJtyBngtnxDfFn4ftqCMO/MVQwLhSQ6VUmsY9f5LrRLkPzv2KwA1Us47FSkk+zI69/zKV4W5VRvAt8q1h0NUaNilzNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023182; c=relaxed/simple;
	bh=oQeD7r6IR3HweXmIdH3Mg4BZVt03FUu1Hi8qcg7Ospw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iquREAxOUWK1K6c94gMzKy0CctdgPvWHpQX4Xe5qrVDCpRoSM4yzCPD5kn7g5DFvvmK8gcTW7F5fZQNx+K8gIU+pTISrQgsaadGybOODV5mWBDPTKRvjhBFz3CKUpw1dyM+7SM9oADZXPkuKUjUaZvBYTvdPZMEVcKi1PwAKSBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Nkxdr7OS; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Nkxdr7OS"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hgSzq1zdGzKmsk;
	Thu, 10 Sep 2026 08:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789023175; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pi9+8gu5d05+KlWCGDBzzias6bpz6p1T0S2Zn5fepjc=;
	b=Nkxdr7OSC7p/OF9TTkgg0JDir7I4PW2lC0bcw7XGJrJ1UcTKFecReVZhfqK1Yr753AM02b
	tR+nRSJqy2878kzsP3HCx8nXwmQ877lpugufqYMzSgpEfMDgFKcRkZJ2K1kXkR61lCOIJy
	wa0yFph/krobND52e2qyljqdVFOVOJultnfB7tDkuPNt09EtJZ106eprKuumdrKueETaZv
	VHKZwJ9cIob21Zhh2juRTTCrZtX3sxP84bpjzpLMPKihrtuW/upVc5xHj/5vDuPxtqgTxA
	mcX89tdQv+6aZ2LqTPadBWgupVcEwdnQ2XSj167hXlqyvMHKNC49wMFhrCdMOg==
Message-ID: <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org>
Subject: Re: drm/sched: run queues freed before the TDR that
 drm_sched_fini() waits for
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 10 Sep 2026 08:52:49 +0200
In-Reply-To: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: wbmye4nue85gc5a66nkayf6mup48ktfp
X-MBO-RS-ID: fef508222f6b22bdbc2

+Cc Tvrtko

On Thu, 2026-09-10 at 14:46 +0900, Donggeun Yoo wrote:
> Hi Philipp,

Hello,

>=20
> drm_sched_fini() frees the run queues above the two steps that wait for
> users of them:
>=20
>  for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
>  kfree(sched->sched_rq[i]);
>=20
>  /* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
>  wake_up_all(&sched->job_scheduled);

If we look at that, it indeed seems broken:

long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout) =
{ struct drm_gpu_scheduler *sched; struct task_struct *last_user; long ret =
=3D timeout; if (!entity->rq) return 0; sched =3D entity->rq->sched;


At least from the commentary; one would free the pointer of the very
party we say we're waiting for.

Maybe @Tvrtko can take a look, who has a sophisticated understanding of
runqueue management.


Let me mention, though, that the entire RQ pointer handling is
basically undefined behavior since forever:

 /** * @rq: * * Runqueue on which this entity is currently scheduled. * * F=
IXME: Locking is very unclear for this. Writers are protected by * @lock, b=
ut readers are generally lockless and seem to just race with * not even a R=
EAD_ONCE. */ struct drm_sched_rq *rq;

Fixing that is also on our TODO list for interested contributors:

https://docs.kernel.org/gpu/todo.html#add-locking-for-runqueues

>=20
>  /* Confirm no work left behind accessing device structures */
>  cancel_delayed_work_sync(&sched->work_tdr);
>=20
> 4827d6d83f07 ("drm/sched: Remove racy hack from drm_sched_fini()") did no=
t
> change that ordering - the kfree() was above the wakeup before it as well=
,
> and has been since 56e449603f0a ("drm/sched: Convert the GPU scheduler to
> variable number of run-queues") made the run queues separately allocated.
> But with the loop body gone there no longer seems to be anything holding
> the free up there.

Then it would have been a race condition, where the occurrence of the
bug depends on timing.

>=20
> A KUnit case that keeps the TDR inside timedout_job() while drm_sched_fin=
i()
> runs, with the callback calling drm_sched_increase_karma() as amdgpu does=
:

How precisely are you reproducing the problem? I'm wondering why it
wasn't observed sooner.

Since you mention amdgpu, many of the twirks in the drm_sched code base
were added to work around ordering problems in that driver.

The drm_sched life time rules are:

   1. All fences returned through ops->run_job() must be signaled by
      the driver before calling drm_sched_fini().
   2. Entities must be torn down before the scheduler.

IOW, I would dare to say that the wake_up_all() maybe shouldn't even
exist in an ideal world, because the driver would never call
drm_sched_fini() while it's still blocking in drm_sched_entity_flush().
Maybe Christian has some wisdom on the background.

>=20
> =C2=A0 BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x2b/0x40
> =C2=A0 Workqueue: events drm_sched_job_timedout
> =C2=A0=C2=A0 drm_sched_increase_karma+0x138/0x3e0
> =C2=A0=C2=A0 fini_uaf_timedout_job+0x4c/0x140
> =C2=A0=C2=A0 drm_sched_job_timedout+0x1b4/0x620
> =C2=A0 allocated by drm_sched_init+0x49c, freed by drm_sched_fini+0xec
>=20
> Moving the loop down beside kfree(sched->sched_rq) silences it, and nothi=
ng
> between the two positions reads the run queues. Is that the right fix, or=
 is
> the intended rule that the TDR can never still be running at that point?

Can you post a patch or RFC patch for fixing it? It's easier to discuss
then. I think I get what you mean, and it's probably the best cost-
benefit-ratio fix. I'd then just put some brain power into
understanding the ordering between threads though



Regards
P.
