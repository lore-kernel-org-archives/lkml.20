Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704346AECF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117507; cv=none; b=hxdB09hvDlQF85EjXWBXB9T6T7pHkweBq5LtKNJ4GEIhoHMZP/lFzmYvvIx7GwAHHVZgMRB02gHC1+9Lz/eqo0Zwtf+X45ag6UoRPi16eyHjx7wMb3pzVIwNK0fxqNRCJc29XbHP1e6DjJaCQTyRwZ1t2gNhxVEb1CoxJMva3Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117507; c=relaxed/simple;
	bh=e474aSLHndUNJKpelZxApsAyflFJq7NhWyKslZH++oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcPufOOshh16VNBQRwEWSmuCrL3qVItrlD/PQuxQGFMsE/8jwgHQVjDsuhFvo8lePgJ6BxyD4HL5cRvA+dAMpyW/EqTH2DBAp1urv8iQtE1zOzwsiTpfMzPtnXZhyIOgTpAeTAUe2TnRSAwS+7iB0ibelJyaUgobUZFzYirufps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HUBrHXCs; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HUBrHXCs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o5a81C6Pf6nCNiYofT/Bvnc6DSVLsIMMxj6ZCKfwTCo=; b=HUBrHXCsf7Gf6YfOJZyqOkj7Hx
	AGVMTZvlcUs6lG+MT8B6RwOBpbtwEKn05ujWbAui439mbP/Iq7ceiitkmQcefeGcV05z79OHOVosV
	NEHWOfLoBYvVvlff/uUIMhAYPJR2Jasrjh/uGcngzpu8k1IDwvPElJU3aIVM/wawhYFQyWzfwVqdr
	ahQ5aGiXHmCkJcsjL7mjRifBVM5vMQQ68QrE9CYZFQ/AV0HvTrMokK666+QGqYiwAch3Mk2NteGIp
	p17uN5U2TKGE+ot4ThgczDHKiePUotoeyv6nbo8Xm7a4OCL0Tlj3xu2ZmBcjSIRyBafi3vpmKYeMf
	2+gIQJLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4xBh-00000003P5P-1RIw;
	Fri, 11 Sep 2026 09:04:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 97B163005AF; Fri, 11 Sep 2026 11:04:47 +0200 (CEST)
Date: Fri, 11 Sep 2026 11:04:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] futex: scheduling-while-atomic because nested vfork can
 break guard(private_hash)
Message-ID: <20260911090447.GT788244@noisy.programming.kicks-ass.net>
References: <CAG48ez26PrUOb8er9TP1gWLsqVLU8TEDr+1Zs25fgH0++=zhUQ@mail.gmail.com>
 <20260911083639.GX776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911083639.GX776954@noisy.programming.kicks-ass.net>

On Fri, Sep 11, 2026 at 10:36:39AM +0200, Peter Zijlstra wrote:
> On Thu, Sep 10, 2026 at 05:27:54PM +0200, Jann Horn wrote:

> > Impact, related issues
> > ==========
> > futex_wait_multiple_setup() follows the same pattern of using
> > guard(private_hash)(current->mm) to ensure that a later CLASS(hbr,
> > hbr)(&q->key) won't sleep and is probably affected by the same issue.
> > 
> > __futex_unlock_pi() and requeue_pi_wake_futex() also use
> > futex_private_hash(), but there the race seems benign.
> > 
> > This issue also means that different futex users could disagree about
> > the hash bucket that a private futex belongs in (older futex_hash()
> > calls returning a pointer into the global hash, newer futex_hash()
> > calls returning a pointer into the private hash).
> 
> Right, that transition is not supposed to be possible. Notably a single
> thread cannot have (private) futex waiters, and we allocate the private
> hash on cloning the second thread.
> 
> > Sidenote
> > ========
> > Maybe we should block CLONE_VFORK when current->vfork_done!=NULL ? It
> > is clearly bad to allow nested vfork() such that a SIGKILL can cause
> > two threads to run concurrently on the same userspace stack.
> > 
> > But I'm not sure if that's a good fix for these futex issues - a fix
> > that doesn't rely on such distant assumptions might be nicer...
> 
> So need_futex_hash_allocate_default() is explicitly excluding vfork from
> causing a private hash to be allocated. Perhaps we should fix that.
> 
> I need more thinking (and wake-up juice) to see if that might perhaps
> bring other problems with it.

So I can confirm that the below does in fact cure your testcase.

Per commit: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private default hash alloc")
the reason for excluding vfork() was performance and thinking this
would/could not matter, which you've proven to be clearly false.

Thomas?


---
 kernel/fork.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..bc32ea19099e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1996,9 +1996,9 @@ static bool need_futex_hash_allocate_default(u64 clone_flags)
 {
 	/*
 	 * Allocate a default futex hash for any sibling that will
-	 * share the parent's mm, except vfork.
+	 * share the parent's mm.
 	 */
-	return (clone_flags & (CLONE_VM | CLONE_VFORK)) == CLONE_VM;
+	return clone_flags & CLONE_VM;
 }
 
 /*
