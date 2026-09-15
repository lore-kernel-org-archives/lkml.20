Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D173B6C1C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495738; cv=none; b=m8jzO49uE+DGkd5f1sPfjLueNPhNHJ9dxi5YhxAj/cJIw233qMidTDn8RO6h4D7pk1ktwAz80EFX+tnpHvt5A1W2raVr49vyuuMRWN71J7qlgp9NpYyvSxYm79fFYyDQbor69jFo6k7wX3ueAohZS2BrHU5wrrjQdT+sakmwdyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495738; c=relaxed/simple;
	bh=mueVF1saYnz250XHso6OqfNSVvla2VF8UIvmRPzHb6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGp7qwmnQhCgHxmfuH88Z832zdqJGDVv0DLaptfvttRMD+xVDXMRJSXfIWUITWb9UKxKL8FbNFPq/F3yFLDR+c/F8elXCskdHdQ2Gt0O5jNhXT+oJpi7XYU+SSKzhJLC743cTXFhrnuPDa6vdRQOsfJRv7IIVss+0tUKpxdFzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsxHp0kw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsxHp0kw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so1337495e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495734; x=1790100534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AGX84LuhcE/hO/qLEXinPpXR8ptwcheDClCAKehX+04=;
        b=FsxHp0kwJQift8Fr0819Qf5E4Rzp9WXwykK4eAnalIlbqZ60khTrXR1sCFhxKWWE1k
         gifsibXH+MO3kRL4s7SGFeE72ZssQaERs6JTZDRXDb16ORfmAS4fZnAeK3ODCP9fDmlN
         LzFcMbpUmko3Fj0oq0xWGESyoU7liACS02nOV24MB+rVAY3HKV3D06m4SLtfRg97VtAR
         gqUhFS/RZEtBNKKm4H0Vw2XA6cdOQV375tND1fAhGyv2eHlHJXJk9CUAyTony6cCVVdu
         JjsrUzQNpfHNnjYTl0yWyLxsQvlbeLwIM9+OGa3bbxz7pLseE8Fsd919eEdDo2+lXIAE
         hoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495734; x=1790100534;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGX84LuhcE/hO/qLEXinPpXR8ptwcheDClCAKehX+04=;
        b=08hkTavm0DfDk+4CZE56F7/sIfV4dvFxOJYLnfXUc1gDdfq8Qa6j/nkP9AqyqrgWFY
         LGK6ts2eU2C4gdPuodsRWvSREOAu7g2jtVjjdAZO+4FCTYgARf0Kd5lxpqg+8798d0Ag
         mJntWbnnzmSPPk4WLPSsjshkQTzilSyEuz2wr53izCStyRYPmknWBKhuEoyYUgopgPuO
         iRuwqaWlpc76NhJO5IC1XNyeMsbpqa9+1GxVKMMllL4gVi+hruRgwc+AKu4BdUxRy4gS
         LJ44LNgqpXkJv1M7578yzIqKSb29h93lqpe8MoiqMNJv+qRSfgPL3omKbQIcyLGBA6Gl
         ehoA==
X-Forwarded-Encrypted: i=1; AKwUvBx7QF8HH/ivrmUIgBhybIa1+m6l0acPbTdWctNniB/dvwmwWqWe8L9wEkjBVpFzFQvB2JYOq73PbbE4zQc=@vger.kernel.org
X-Gm-Message-State: AFuF++nzqrDMHMtN4E20kFIT2A18o223jphK/IgVKIDpo1QPvEvMzw00
	yxWy1r+YswJb503bMHx62rCKclD57RhDNcSPthNYxWcITeprDRotcE0NvPBn52tZ
X-Gm-Gg: AYBFou0bTXLsH2eieVO6REnyRTsM92u3RXs5AWbH5pHDs50V/8D2EXfXJgAY4VP1jJZ
	bdscOJiPEW9IzVvZdwRipXgmUzuDmnc1BViVjdxfI8EwbfdnFP9TvO2jiFm2FtjBzHt5+SSCylO
	FXUzxfR2Nbg3C50+U3CJCNOv4weVZQO+Lz3g+9E9v/nay209QjmKJ88vSzkUoniUe6PZu9vSM/b
	SzctMzrfyn/epPqRetfmMxU2cQfvB9X/ybHr0FAXHz3ck2y7Srv2vK9m14587uAefyX6fZ/Pdyg
	G67NKL7Z+t8zUHLVf/C/S62F2di1Hkk66sL9gYETsygZLuxvh+rfzC/r1MWIAqEu7lX0TQetvQj
	OJgGf48RGWmFOV2r0zROgcdh6LBcNGDi5bIHw7IxsqRw946XZblh5jMyhzIY9Rmbau/QHqMNOoF
	dzxC8rl4AxJMSoCezcUYBbfwobfvoAiUjzVr0+3paeP+4FcSKG6SRwmFuWHeAIAC0zdtF4K147O
	An2HTkXi1dW6qQt2FyrhWH8yoznBDCpWE7c
X-Received: by 2002:a05:600c:c173:b0:49e:799a:8951 with SMTP id 5b1f17b1804b1-49e82214b48mr28215365e9.11.1789495734107;
        Tue, 15 Sep 2026 11:08:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84202028sm1519855e9.0.2026.09.15.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:08:53 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:08:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Haakon
 Bugge <haakon.bugge@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] locking/osq_lock: Ensure proper locking semantics
 for osq_lock/osq_unlock()
Message-ID: <20260915190852.6ab21493@pumpkin>
In-Reply-To: <89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
References: <20260914202102.551333-1-longman@redhat.com>
	<20260915082655.GX4121339@noisy.programming.kicks-ass.net>
	<89a400fa-f23d-41d4-9a82-df8697eed0b3@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 13:53:05 -0400
Waiman Long <longman@redhat.com> wrote:

> On 9/15/26 4:26 AM, Peter Zijlstra wrote:
> > On Mon, Sep 14, 2026 at 04:21:02PM -0400, Waiman Long wrote: =20
> >> The osq_lock is special in the sense that lock transfer from one CPU to
> >> the next can happen either over the common optimistic_spin_queue.tail
> >> value with uncontended lock or over a lock waiter's own percpu
> >> optimistic_spin_node.locked flag when the lock is contended.
> >>
> >> To ensure proper lock synchronization, we need to provide
> >> the acquire/release semantics for the osq_lock/osq_unlock()
> >> functions in both cases. This is currently the case for the
> >> common optimistic_spin_queue.tail value, but not for the percpu
> >> optimistic_spin_node.locked flag as the proper barriers can be missing.
> >>
> >> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b=
6a
> >> ("locking/osq: No need for load/acquire when acquire-polling") a while
> >> ago as the smp_load_acquire() loop was causing a performance hit due to
> >> the repeated acquire barriers in the loop and it argued that an earlier
> >> atomic_xchg() call could provide the needed barrier and reordering
> >> wasn't a problem in the way osq_lock is being used by mutex and rwsem
> >> for queuing purpose only. That atomic_xchg() barrier does not work
> >> as a proper acquire barrier for osq_lock() if the lock hasn't been
> >> acquired or isn't ready to be acquired when the barrier ends. So an
> >> acquire barrier is still needed in order to have proper locking semant=
ics.
> >>
> >> The performance impact stated in that patch is due to repeated issuance
> >> of acquire barrier which can be expensive depending on the architectur=
es
> >> and the actual processor used. It was not clear what machine and what
> >> benchmark was being used to produce the performance data. Anyway, with
> >> the new smp_cond_load_acquire() helper, only one acquire barrier is
> >> issued at the end of the loop. So even if there is a performance impac=
t,
> >> it should be less than a repeating one.
> >>
> >> As for the two percpu optimistic_spin_node.locked setting in osq_unloc=
k(),
> >> they are currently preceded by a full barrier xchg() call which can
> >> provide the needed release barrier. Add comments saying that a release
> >> barrier is needed for the proper functioning of the unlock operation
> >> to alert people from accidentally remove the barrier when the code is
> >> updated.
> >>
> >> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acqui=
re-polling")
> >> Tested-by: H=C3=A5kon Bugge <haakon.bugge@oracle.com>
> >> Signed-off-by: Waiman Long <longman@redhat.com>
> >> ---
> >>   kernel/locking/osq_lock.c | 12 +++++++++---
> >>   1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> [v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
> >>       with comments.
> >> [v3] Fix the comment above smp_cond_load_acquire(). =20
> > I still see no reason why this should be applied. Or even have this
> > Fixes tag. =20
>=20
> The main reason for this patch is for addressing the locking test=20
> failure reported by H=C3=A5kon due to missing barrier. I do know that wit=
h=20
> the current osq_lock() use case, it is not a real problem. I just don't=20
> like inconsistency that an acquire barrier is just missing in just one=20
> place. I don't mind removing the Fixes tag though.
>=20
> In your comment to David's "locking/osq_lock: Set prev_cpu=3D0 instead of=
=20
> locked=3D1" patch, you suggested adding smp_acquire__after_ctrl_dep()=20
> after finding that the lock had been granted which is exactly what the=20
> change from smp_cond_load_relaxed() to smp_cond_load_acquire() is doing.=
=20
> Right?

I think it is a smaller barrier - since it is only in the 'lock acquired'
path.
Whether it is enough is another data point.
I don't remember anyone saying which memory reads are getting re-ordered.

I really do need to find out exactly what the barriers do (or rather which
feature of the cpu hardware makes them necessary).
They might be stopping out of order execution and speculative execution,
but the re-ordering of reads might be a feature of the cache.

David=20

>=20
> Cheers,
> Longman
>=20

