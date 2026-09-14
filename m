Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF93B42F9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379623; cv=none; b=UBQjloTwGK78RFS2cLua2cQ4E09dRnFCLeQnSbjOZtlBkZBJproqj/16SnFUo+0ZNFov+YTlJcEijyM81OhD5ebGB9cdwOq3ODmWxbx8+IUyYJLwtePwar8hXror2sdiEo5wLbBN4ZOZSsV2+eTovGOd7iSWCSMrtxLiAaLC9GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379623; c=relaxed/simple;
	bh=Y123/ADqj+NfnYObaRo+ZrAYC6ThuSe4AzOCr0fuZfE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VM259fuvCeEPWNc3oF1fhk0rKzh7wya+QFH2u39zyxVQyOXYuYPwpk6j5TCQl0nqJ6abs7pBJkr59I1ngF3X9kUIJKTAn0XQ4i1RfKQSIkfSWbYtJ0ShqTVCyfPQ8QXnW9Hl6vRZwAjD4fMzjLZAdyai1EjEH0bw1bavlAgtviQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAI5N7wd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAI5N7wd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so938614f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789379619; x=1789984419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=da6ePMIYm/aVtrZu1tTn2uNa2Ehq+6YGaT6o8m85P1A=;
        b=MAI5N7wdEw2NKr+KvPhwnblqTg62x7VBik4xZeOpN7g1agZ4no0wFovNNHlX7x1DUG
         0ZsXmZ3xWNaf7Psicqv4P1/+c7Guc9mOf3zkSlI/cCZX8fa+kym7HNz2QC4KHAvsA81h
         2zETe9RRhVzGN+b+RoFgYjxkIb3vIs/EQXUbm6h+tmg93ZkpHOElGYb9ysDSUP1L6Wis
         FMOR12r6uLhGfDFJ47/JpMpDmqjLK+Mt4b3+5GJyPvTp2NItLO3RHJxyrn5ZdnALjU17
         hsHB2+Fy6v8I2zYsjA1UhYh7pLSUK+1NJ8BJGuXF/lgTLSgBXOX6XiGpjIy2YvJ6ybKl
         3PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379619; x=1789984419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=da6ePMIYm/aVtrZu1tTn2uNa2Ehq+6YGaT6o8m85P1A=;
        b=Snuz4Wzx/adZk8uc6uEW8CCNgvBFSAVpH8sHiuHj+aPZv5pasD0VY5OI2Sdfc6waRU
         u4Lt4qqD3IqueaRYJwHk1hf5E/U0TUSepKhoToqtQ2px8yV0ZHhy5H8p4R6r7n886hLU
         1uz37K0PkTqqY/Cvl4KyWHIjRwCgZ3pe7ckPrXNJcpAXyJS5pkni+KWr7NOCMoKEz8dl
         zlWVPjqCHe3iBc5DKqje3ar46u0e06gIcmB446rJTmO5K+19T8v7YMWv3LdDO06FGXyR
         VBNYK/qKgjmxchoOPD+J6g27PbQ1Q+9OP3MbMse4sGxAOezZUkbR4GgELaLUEE6P86WC
         qxdA==
X-Forwarded-Encrypted: i=1; AKwUvBy8R1MpokDms3fNiaFjKZjWvs5vReimyNGd90iMENNrmzxne8QJvQaWYZXJNm/R8L5oiYO+vPmRvusrudQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l+OIvhaYm6h0NASCX2R7YukzR0oLbkOMc9vcPdCeha+XTthX2x
	tKXM4lpoYz75nWHDqAMBVam4KNsNOISI4Jg8LAsZ1Y+ELAI6lzK9uGoE
X-Gm-Gg: AYBFou32XAFpoTzbBmz0rvdBeVUJpl9vhocGCNHinnJ0vfsOLiCZdRJmKHFwsugggLJ
	7tqu2hHjGsyLzngtWvTnG4yOKTlOrD/1PfVll8FnmRdvz7MUJcvTcO1x1QWk2kRDxPGETEa3M+9
	m4p/kmf8S5+B9IZEuM0BOHpd47MARyq+IiJh0YjLElk3U8vEBKoVO+v1C/uQ7LsmXntGraxy2yZ
	GdANOESR/sFKrJq6TmvdOOu7mAfdOJ8WAcj0LCkGThry4anGNvfaPE7FZmxz5LHoa821bkZU6eN
	m0JNmWWSNNvflzqQ+xNbtEUAZC7KNAthJl0G+/F2Jqe4FpqWujd7ILB4cszOBb5jpa7K4tGr8HB
	/xH6XXuUXKTC5oiHwEfuvG4YxmDOd1dQxpbaU3tGbgNfYz7ACIZzCULvEeLZHj8hLrsHhz4uuod
	45ohwHCMufbT3Nai2QjOYzYG83isoW9lkX0+94RTGWg5otJrd+9rDbkOgmHbFfysW/gs4eh+j5m
	BZqKv/fx89xKFt0e7iElNwFoj9dL//lZAvM
X-Received: by 2002:a05:600c:4ecc:b0:49e:6be6:d783 with SMTP id 5b1f17b1804b1-49e7a5f419amr39457415e9.0.1789379619381;
        Mon, 14 Sep 2026 02:53:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm208874455e9.7.2026.09.14.02.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:53:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:53:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Haakon
 Bugge <haakon.bugge@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260914105337.576bab34@pumpkin>
In-Reply-To: <20260910141908.592414-1-longman@redhat.com>
References: <20260910141908.592414-1-longman@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 10:19:08 -0400
Waiman Long <longman@redhat.com> wrote:

> The osq_lock is special in the sense that lock transfer from one CPU to
> the next can happen either over the common optimistic_spin_queue.tail
> value with uncontended lock or over a lock waiter's own percpu
> optimistic_spin_node.locked flag when the lock is contended.
>=20
> To ensure proper lock synchronization, we need to provide
> the acquire/release semantics for the osq_lock/osq_unlock()
> functions in both cases. This is currently the case for the
> common optimistic_spin_queue.tail value, but not for the percpu
> optimistic_spin_node.locked flag as the proper barriers are missing in
> some places. Fix that by adding the needed barriers in those places.
>=20
> Note that the two percpu optimistic_spin_node.locked setting in
> osq_unlock() are proceeded by a full barrier xchg() call, but the
> contended cachelines are different. This should probably work in most
> cases except in some exotic architectures where the barrier semantics
> may be cacheline specific. Nevertheless a release barrier is still added
> for safety reason as we may opt to relax the xchg() calls in the future.
>=20
> The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
> ("locking/osq: No need for load/acquire when acquire-polling") a while
> ago as the smp_load_acquire() loop was causing a performance hit due to
> the repeated acquire barriers in the loop and it argued that an earlier
> atomic_xchg() call could provide the needed barrier. That may not be
> enough especially if we have to loop for a while before the lock is
> released. Now with the new smp_cond_load_acquire() helper, only one
> acquire barrier is added at the end of the loop. So it shouldn't have
> the performance hit noted in that commit.
>=20
> Currently osq_lock is used only by mutex and rw_semaphore code for queuing
> purpose. As a result, the imperfect lock synchronization support does
> not cause harmful consequence as the new osq_lock owner of a contended
> osq_lock will still have to wait for the real mutex and rwsem lock to
> be released by the pervious osq_lock owner before it can acquire it and
> go into its critical section. For correctness, we still have to fix it
> in case it is used elsewhere which doesn't have this inherent protection.
>=20
> Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-=
polling")
> Tested-by: H=C3=A5kon Bugge <haakon.bugge@oracle.com>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/locking/osq_lock.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index b4233dc2c2b0..ef1bbd914917 100644
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>  	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
>  	 * polling, be careful.
>  	 */
> -	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> +	if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
>  				  vcpu_is_preempted(node_cpu(node->prev))))

The comment above needs changing to match.

David

>  		return true;
> =20
> @@ -224,11 +224,14 @@ void osq_unlock(struct optimistic_spin_queue *lock)
>  	node =3D this_cpu_ptr(&osq_node);
>  	next =3D xchg(&node->next, NULL);
>  	if (next) {
> -		WRITE_ONCE(next->locked, 1);
> +		/* Provide release barrier for unlock */
> +		smp_store_release(&next->locked, 1);
>  		return;
>  	}
> =20
>  	next =3D osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
> -	if (next)
> -		WRITE_ONCE(next->locked, 1);
> +	if (next) {
> +		/* Provide release barrier for unlock */
> +		smp_store_release(&next->locked, 1);
> +	}
>  }

