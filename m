Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487453;
	b=VbJjgD8pfUHCCO/FKm7WHAWeUBSX4k5jassbS0TCvrAU0yR1tuiDXesF4g0x9YYn+Dgv
	 smqsnpYFjHD7cbMd6YdJnC/rJjTI3VrmqA6nJWOiyev7/WuCc0bDkyFhJlU/qXDoAq0Qp
	 wt2Phs1FOJ4LJhP6mufPJ3FUyg1cmx5oFoZKL9f7PY+AdMNjojQJhYWIvijT3Pxaz8kY+
	 y3tMAQ1pqebpG01/6U2p1/0hVS95MMwnnsPO6W59r77TrOyD2R0bJ4VsPjEKwwwkjERb4
	 7FZpI3DX/K2gssDcl+p2WCfRnmb5heSHmkZ+AOkfEwufSEf8Q619aVkZIVn7ebjxUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487453;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9vIdgBKkx8FiLd84P3eX8Jv72blwet8ijl33gemJzAY=;
	b=PdQbRGvz1JRRqgMrq/Kma8LCHRTv/zkPltZotHeMUP2R6u2JVHYWyAjF0AR0qzivN6lN
	 u8SIh5F6oqbQlJnbQk/ydfgaJj2Ny2Y90tr9WR4B89gsWlZBDg6geS+iAu029/N32HWlH
	 Y6OEeubTNXMBoTKRvNHhgzijnYLa3ErxYKXQj/2euq6sxvSOFUPrN0NCvAfBKCcSx2Qx4
	 WQF3aAuP4cEDQu0MiWO9XF8da2CvawdlQJs8YMUqCiFU6G9bSv8dRvk9n5wrYXMVjZ6J2
	 mIbymWrApRch1C7HRKgug4VAQqHSgk90XFd943l6Uaw3BsZLGfSX0TscDTjQ+v+gFVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="Uj/siFV8";
	arc=none smtp.remote-ip=61.135.153.170
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D9606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=Uj/siFV8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793487448;
	bh=9vIdgBKkx8FiLd84P3eX8Jv72blwet8ijl33gemJzAY=;
	h=From:Subject:Date:Message-ID;
	b=Uj/siFV8Ire4c6Qf4XK/b+XUt67qwU7bBJxGKz68RKGdjuliO4tYcDUiPjQt9cNDg
	 Gv623Ft2maZii1RwlTxH4U3kAHdIO5ZJCG4BC6oY/pSwLKNRcog82NDQ1E4FBc53v7
	 1s8ElkDBbUTqPWxvOHxxrp8Xbeld+aDrsgwIdPrI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.246.238.23])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE6725200001F84; Sat, 1 Nov 2026 06:57:25 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 496936291904
X-SMAIL-UIID: B49EC83963F94FD7BD8D10A30166C57A-20261101-065725-1
From: Hillf Danton <hdanton@sina.com>
To: NeilBrown <neilb@ownmail.net>
Cc: Kal Cutter Conley <kalcutterc@nvidia.com>,
	Chuck Lever <cel@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sunrpc: fix lost wakeups when stopping service threads
Date: Sun,  1 Nov 2026 06:57:17 +0800
Message-ID: <20261031225718.278-1-hdanton@sina.com>
In-Reply-To: <179348338213.447095.12525891242476966502@noble.neil.brown.name>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 01 Nov 2026 08:49:42 +1100 NeilBrown wrote:
> On Sat, 31 Oct 2026, Hillf Danton wrote:
> > On Sat, 31 Oct 2026 09:45:39 +1100 NeilBrown wrote:
> > > On Sat, 31 Oct 2026, Kal Cutter Conley wrote:
> > > > Stopping NFS can leave rpc.nfsd 0 in an uninterruptible wait with
> > > > this stack:
> > > > 
> > > >   svc_stop_kthreads [sunrpc]
> > > >   svc_set_num_threads [sunrpc]
> > > >   nfsd_svc [nfsd]
> > > >   write_threads [nfsd]
> > > >   nfsctl_transaction_write [nfsd]
> > > > 
> > > > SP_NEED_VICTIM and SP_VICTIM_REMAINS remain set while all remaining
> > > > nfsd threads sleep in svc_recv() and none has RQ_VICTIM set.
> > > > 
> > > > The stop request is published with unordered set_bit() operations.
> > > > svc_pool_wake_idle_thread() checks the idle list and task state before
> > > > calling wake_up_process(). If it sees an empty list or TASK_RUNNING,
> > > > it skips the wakeup and its memory barrier. The requester can therefore
> > > > miss a sleeping worker while that worker misses the stop request.
> > > > 
> > > > Order work publication before both lockless checks, even when no
> > > > wakeup occurs. Pair with set_current_state() and llist_add() in
> > > > svc_thread_wait_for_work(), so the worker observes the pending work or
> > > > the requester observes the idle worker and wakes it.
> > > > 
> > > > Fixes: 60749cbe3d8a ("sunrpc: change sp_nrthreads from atomic_t to unsigned int.")
> > > > Signed-off-by: Kal Cutter Conley <kalcutterc@nvidia.com>
> > > > ---
> > > >  net/sunrpc/svc.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
> > > > index af8d87c1de83..f3cc63acc5e1 100644
> > > > --- a/net/sunrpc/svc.c
> > > > +++ b/net/sunrpc/svc.c
> > > > @@ -29,6 +29,8 @@
> > > >  #include <linux/sunrpc/clnt.h>
> > > >  #include <linux/sunrpc/bc_xprt.h>
> > > >  
> > > > +#include <asm/barrier.h>
> > > > +
> > > >  #include <trace/events/sunrpc.h>
> > > >  
> > > >  #include "fail.h"
> > > > @@ -693,6 +695,13 @@ void svc_pool_wake_idle_thread(struct svc_pool *pool)
> > > >  	struct svc_rqst	*rqstp;
> > > >  	struct llist_node *ln;
> > > >  
> > > > +	/*
> > > > +	 * Order work publication before the idle-list and task-state checks,
> > > > +	 * even when wake_up_process() is skipped. Pairs with the barriers in
> > > > +	 * set_current_state() and llist_add() in svc_thread_wait_for_work().
> > > > +	 */
> > > > +	smp_mb();
> > > > +
> > > 
> > > I don't like this.  Stand-alone barriers are, I think, harder to read
> > > than barriers combined with operations, like smp_load_acquire() or
> > > similar.  And this one seems quite detached from anything.
> > > 
> > > If I understand correctly, the possible race is between
> > > svc_thread_wait_for_work which includes:
> > > 
> > > 		llist_add(&rqstp->rq_idle, &pool->sp_idle_threads);
> > > 		if (likely(svc_thread_should_sleep(rqstp)))
> > > 
> > > and svc_stop_kthread which includes:
> > > 
> > > 		set_bit(SP_NEED_VICTIM, &pool->sp_flags);
> > > 		svc_pool_wake_idle_thread(pool);
> > > 
> > > The first sets ->sp_idle_threads.first and then checks SP_NEED_VICTIM
> > > and the second sets SP_NEED_VICTIM and then checks
> > > ->sp_idle_threads.first.
> > > 
> > > So we need barriers to ensure the values are seen is the expected order.
> > > Have I missed anything?
> > > 
> > > llist_add() always calls try_cmpxchg() which is fully ordered, so no
> > > extra barriers are needed there.
> > > 
> > > There is no barrier between the set_bit)( and the READ_ONCE() in
> > > svc_pool_wake_idle_thread(), so you added one.  I agree that is correct
> > > and solves the problem.
> > > But it is only this call to svc_pool_wake_idle_thread() that needs a
> > > barrier, not all calls.  So I would prefer the barrier went in
> > > svc_stop_kthreads().   Do you have a reason for not including it there?
> > > 
> > > We do need a full memory barrier - a "release" on the set_bit and an
> > > "acquire" on the test of ->sp_idle_threads.first
> > > 
> > > I would be happy with smp_load_acquire(->sp_idle_threads_first) in
> > > svc_pool_wake_idle_thread().  I'm not sure it is needed though.
> > > 
> > > I would like set_bit_release(SP_NEED_VICTIM) in svc_stop_kthreads()
> > > but we don't have that.
> > 
> > It is on the way [11].
> > 
> > [11] Subject: [PATCH 1/2] asm-generic/bitops: Add set_bit_release()
> > https://lore.kernel.org/lkml/20261021095512.1345191-3-phasta@kernel.org/
> 
> Thanks for that pointer.  It helped me realise that I was wrong about
> the sort of barriers needed.  A set_bit_release() would not help.
> And an acquire on the subsequent read of sp_idle_threads also wouldn't
> help.
> 
> A release is between two writes:
> T1:
>   foo = 1
>   smp_store_release(&bar, 2)
> puts a write barrier between the two.
> 
> An acquire is between two reads.
> T2:
>   y = smp_load_acquire(&bar);
>   x = foo
> 
> These ensure that if T2 sees '2' in bar, it will definitely see '1' in foo.
> 
> But we don't have two reads or two writes, we have a write-then-read,
> and that requires a full memory barrier.
> 
> So we would want set_bit_mb() (corresponding to smp_store_mb()).
> As we don't have that,
>    set_bit()
>    smp_mb__after_atomic()
> 
> is the right way to fix this - acquire/release barriers would not be
> effective. 
> 
Thanks, a good lesson to me.

Hillf

> As I noted, this is needed in both svc_wake_up() and
> svc_stop_kthreads().
> 
> Thanks,
> NeilBrown
> 
>  
> > > We could do
> > >    atomic_long_fetch_or_release(BIT(SP_NEED_VICTIM), (atomic_long_t*)&pool->sp_flags)
> > > but that is ugly.
> > > 
> > > So I think the best solution is
> > > 
> > > 		set_bit(SP_NEED_VICTIM, &pool->sp_flags);
> > > 		/* Order SP_NEED_VICTIM before testing sp_idle_threads,
> > >                  * matching svc_thread_wait_for_work() which orders
> > >                  * setting sp_idle_threads before testing the bit
> > > 		 */
> > > +               smp_mb__after_atomic();
> > > 		svc_pool_wake_idle_thread(pool);
> > > 
> > > We probably need the same in svc_wake_up() after the set_bit().
> > > 
> > > Does this make the barriers easier to understand?
> > > 
> > > Thoughts?
> > > 
> > > Thanks,
> > > NeilBrown
> > > 
> > > 
> > > >  	rcu_read_lock();
> > > >  	ln = READ_ONCE(pool->sp_idle_threads.first);
> > > >  	if (ln) {
> > > > 
> > > > base-commit: b803428098f6fcd584db9f0499217b80e465bb34
> > > > -- 
> > > > 2.53.0
