Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246696;
	b=aGKcRZzSMzStfHReXNM7StJ6WyOgQZO0OhscGafRLCEuENuYBqlONnWqY85e2jnhAJ+x
	 Xl2Kfp3Zfg8W18quk59ywfEzns/l0zUIFZ/TYlYTJM4q6e3vsZzs8Gpm6ZYatzg9i7lEV
	 9eZsS7y9qAiC5QNS7I5mo3aXb59aJ4LVZfasSYeYtC+vfPMeKNW6qtQrMFtHBzUI+b3P2
	 hzJOSOvx0su9DuP6syRWrhtt5zaXeRG4SXt6HliD6NZ7JTd+dK1uh/xgdoeoXhUop6MaN
	 LXo88/zuD7Vqzs0EuewKa0fOppOtPKST2r/NnO5tWFU6FQFCpD/WckitQh0KwRQmecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246696;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-Id:In-Reply-To:
	 References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xn038JpTYGNFgIUsN47I3TQmCFXaC74gR+B6aNbbr3A=;
	b=TFqp56zNvhtH3k0fGC4Gcdus0U6wCTeI8GwGBWdDicOp7ZcgBpWi39Hsp45ZVkiM+NiZ
	 TDd03c+Nkq1VgWXKFyioKI/AqlHhF3O3/t4Nrcla05q48JkARysphYiTZ9KP7/lDV+z/Y
	 BV7G8drWfFl+emWAblvIKXktRnifxx8SPikuqEqG37fTBIy0yA2c4tNKEZIpEaXIpQscD
	 qDMilVr3nrMfda8ERGgYsn8M4WELpcFZSyTNKJgcFOc8jYzn4ELgqjcIW+MJyBngB9m3Q
	 HlS+M+rDYLo1YEHjTihBTBv98XIwS2UJZ5m7DTYMR/KI0qORTonKhnkzPE9a76LsFWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=aUXUoCXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F76606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=aUXUoCXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB631F01825;
	Thu, 29 Oct 2026 04:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793246695;
	bh=Xn038JpTYGNFgIUsN47I3TQmCFXaC74gR+B6aNbbr3A=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=aUXUoCXQnp7qve9tKC/nnyq0NU3kO/IEx9xLRH+xx6QiFjbKysacr1wR0IR/U9Je9
	 u7NSXwHeQZhMQUXdvPMxG8L//oi2vM3XzHM2BtYhSh4MpdhRSmKK+0HZDknxsUIUpH
	 QvedKIEVaiN+Ygcv58ku0C3k6nm8Pk3m/B+DehDE=
Date: Wed, 28 Oct 2026 21:04:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: david.laight.linux@gmail.com, linux-kernel@vger.kernel.org, Manfred
 Spraul <manfred@colorfullife.com>, Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 05/44] ipc/msg: Fix saturation of percpu counts in
 msgctl_info()
Message-Id: <20261028210454.7ff0d43fd57f3546547e0416@linux-foundation.org>
In-Reply-To: <20261028181502.484379c56878a872899c0f94@linux-foundation.org>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-6-david.laight.linux@gmail.com>
	<20261028181502.484379c56878a872899c0f94@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 18:15:02 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> > diff --git a/ipc/msg.c b/ipc/msg.c
> > index ee6af4fe52bf..34e607add006 100644
> > --- a/ipc/msg.c
> > +++ b/ipc/msg.c
> > @@ -501,11 +501,9 @@ static int msgctl_info(struct ipc_namespace *ns, int msqid,
> >  	max_idx = ipc_get_maxidx(&msg_ids(ns));
> >  	up_read(&msg_ids(ns).rwsem);
> >  	if (cmd == MSG_INFO) {
> > -		msginfo->msgmap = min_t(int,
> > -				     percpu_counter_sum(&ns->percpu_msg_hdrs),
> > +		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
> >  				     INT_MAX);
> > -		msginfo->msgtql = min_t(int,
> > -		                     percpu_counter_sum(&ns->percpu_msg_bytes),
> > +		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
> >  				     INT_MAX);
> >  	} else {
> >  		msginfo->msgmap = MSGMAP;
> 
> Added, thanks.
> 

LLM found another bug in there.  Please review:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: ipc/msg: clamp negative MSG_INFO usage counts
Date: Thu, 29 Oct 2026 01:43:24 +0000

MSG_INFO can report negative message and byte counts during ordinary queue
traffic.  For example, ipcs -q -u prints a negative header count and can
convert a negative byte count into an enormous unsigned used-space value.

percpu_counter_sum() does not take an atomic snapshot of all CPUs.  While
a third CPU sums the counters, it can read the sending CPU's local count
before an enqueue and the receiving CPU's local count after the matching
dequeue.  The sampled total is then negative, even if the queue was
initially empty and is empty again.  The sum's lock serializes folding
into the global count, but not ordinary local counter updates.  Queue
locking does not serialize these updates with the statistics reader.

Use percpu_counter_sum_positive() for both usage counters before applying
the upper clamp.  Keep the comparison in s64 so the result is not narrowed
before saturation.

This bounds the reported usage without making the statistics an atomic
snapshot.  Message delivery and queue-limit enforcement are unchanged.

This is a follow-up to David Laight's "ipc/msg: Fix saturation of percpu
counts in msgctl_info()".

Validated with a source-extraction regression harness, including a forced
three-CPU sampling trace and failing old-code controls.  No running-kernel
reproduction or kernel build was performed.

Backporting: kernels such as v6.1 and v6.6 require matching min() operand
types.  Use min_t(s64, ...) instead of min() on those kernels.  For trees
still using min_t(int, ...), also retain the s64 upper clamp; the separate
standalone variant includes both adjustments.

Fixes: 72d1e611082e ("ipc/msg: mitigate the lock contention with percpu counter")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Manfred Spraul <manfred@colorfullife.com>
Cc: <stable@vger.kernel.org>
---

 ipc/msg.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- a/ipc/msg.c~ipc-msg-clamp-negative-statistics
+++ a/ipc/msg.c
@@ -501,10 +501,12 @@ static int msgctl_info(struct ipc_namesp
 	max_idx = ipc_get_maxidx(&msg_ids(ns));
 	up_read(&msg_ids(ns).rwsem);
 	if (cmd == MSG_INFO) {
-		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
-				     INT_MAX);
-		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
-				     INT_MAX);
+		msginfo->msgmap = min(
+			percpu_counter_sum_positive(&ns->percpu_msg_hdrs),
+			INT_MAX);
+		msginfo->msgtql = min(
+			percpu_counter_sum_positive(&ns->percpu_msg_bytes),
+			INT_MAX);
 	} else {
 		msginfo->msgmap = MSGMAP;
 		msginfo->msgpool = MSGPOOL;
_

