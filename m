Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718930;
	b=u/mpoWLsbNxxn/WgIYoD/pb7if9XChmyIoWHe0ec380GJa9Jt0MbJ68Wz5d6YbNF7z5q
	 WdHUOEMVLn3y1T6lNJ1dtNg1HI7tojk/vS6nyPMfEho3+zc0Smizbqm78rK0V2157VBHl
	 MTDxPCgQxElaoqNdC1dL8RD4uNIbmynaAf/H5LUZp3TuY/sxMsei0qlHFGZ6CYgLOLpmw
	 md9rG25v166wEezh5Exsae+ns4pS4qWoh+5LWunwJ2Dljntu4K3bsDDBIepzC07qya10H
	 XEFPIHw9A2eqCB0+IhGahY5zSfw4r0flTCVNcvgyb7MdlrthHwdD/OQj8qH0fxThm7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718930;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=BgukwoyCf3zTzFVKabsq2TdYwY6CNscXV5Cmf29RB7Q=;
	b=3MaJUq+gBUSHQqQvpuv96dNMuCGUr8tL4JTzCkpClX0WItDU1I4zzIiIYmnEUFGo5geY
	 5JROzpIdZOfvGurQbbpIWk+3WiP1+DGofhucp39U+yQDnMbn88U9//DzG+JE+Mc7OeZNL
	 QCJLrBFcEPfKG7RGhJnhGipEqnC6L5G8KjT/P+XngcgaPjcO8C2jOtI3pglFo4cKJtyyl
	 wsk1bOG4P5XCYNt5baRRdcz9iv+P335RS8JesXUtUsMWZ+3QvtF61YwAqQyQjur09/dL6
	 8TxGbPb/CmX2/EVSDNJNu0s+CUY0tzT2BE55CQfOW8S/0Wll2atLu8gBvqZf0d15NOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kMbUDnGE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LlUeWMgI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295D606B267
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D295D606B267
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kMbUDnGE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LlUeWMgI
Date: Tue, 3 Nov 2026 16:15:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793718927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgukwoyCf3zTzFVKabsq2TdYwY6CNscXV5Cmf29RB7Q=;
	b=kMbUDnGEtN+o2K6Sc0FYTQScRac4GHh0gDlIj32H/OaOCzn3rk0buxMZ2uxeTujqb7LB+U
	avaJIcSmVMDuVZYQQgbpcRkt6Yd2+IhGW88pc+1LT1Vp9M17ZQNt/GdJggUCZYDnztar+4
	o8+P/5yzJNG/bb4cMwIbocm19heTF8SoE4Ktqr6USc0MbCH/zBIS5leYXblrXNXmzGISSo
	2FrjiLW4cPvclKZTlPBZj/4cE+M1cGKEwY7xuN8SvKdDwaxW31pRrF+EWcVqbR4CIi5mFi
	BcfGYyxYSXppaXL3rYB3nlEF6VOFlB1AVUfgR5TWCNB0QhbfZ8jwOKyZ93Dzpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793718927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgukwoyCf3zTzFVKabsq2TdYwY6CNscXV5Cmf29RB7Q=;
	b=LlUeWMgIeTsvuaFnXpEBn0duGO6yYrS82b6zzdYWJ/4smcxUV0iyQ1Py24GBQMwKDTEMZa
	y+7QVo3JAjJxpGDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: mt4022@columbia.edu
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	tz2294@columbia.edu
Subject: Re: [PATCH] smpboot: Run the thread function only once before parking
Message-ID: <20261103151525.Mu-hc07d@linutronix.de>
References: <20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu>

On 2026-11-02 16:51:24 [-0500], Mani Tofigh via B4 Relay wrote:
> From: Mani Tofigh <mt4022@columbia.edu>
>=20
> Since commit 4a3b51aab6e2 ("smpboot: Don't park the thread if work is
> pending"), smpboot_thread_fn() parks only once thread_should_run() is
> false.  CPU offline waits for that with no timeout and with
> cpu_hotplug_lock held for write.
>=20
> When the outgoing CPU keeps receiving more packets than it can process,
> ksoftirqd always has NET_RX pending and never parks.  The offline then
> waits for as long as the packets keep coming and everything that takes
> cpus_read_lock() waits with it:
>=20
=E2=80=A6
> That commit only needs the work queued before the park request to run
> once on its own CPU.  Softirqs left pending are taken over by the
> dead-CPU callbacks as before.  So on a park request, run the thread
> function once if there is work and then park.  With the fix, the
> offline finishes under the same load.
>=20
> This bug was identified and confirmed with the help of a deterministic
> hypervisor currently under development.  The C reproducer below however
> hits it within about 25s.

Is this just the net_rps interface or was this used for a reproducer and
the issue is different?

On CPU down path we do first smpboot_park_threads() on the target CPU
and later takedown_cpu() is invoked which flips the CPU bit in the
cpu_online mask. This means work can be enqueued while the CPU is going
down. Something like

--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5402,7 +5402,7 @@ static int get_rps_cpu(struct net_device *dev, struct=
 sk_buff *skb,
 			rflow =3D set_rps_cpu(dev, skb, rflow, next_cpu, hash);
 		}
=20
-		if (tcpu < nr_cpu_ids && cpu_online(tcpu)) {
+		if (tcpu < nr_cpu_ids && cpu_active(tcpu)) {
 			*rflowp =3D rflow;
 			cpu =3D tcpu;
 			goto done;
@@ -5413,7 +5413,7 @@ static int get_rps_cpu(struct net_device *dev, struct=
 sk_buff *skb,
=20
 	if (map) {
 		tcpu =3D map->cpus[reciprocal_scale(hash, map->len)];
-		if (cpu_online(tcpu)) {
+		if (cpu_active(tcpu)) {
 			cpu =3D tcpu;
 			goto done;
 		}

Would avoid it. On the other hand networking has HP-handler which
ensures that the queues of the offlined CPU are handled.
My original issue were queued up irq-work items which were not handled
due to the park request and couldn't be handled otherwise.

The suggested change is okay in principle restores the old behaviour
where we did not care but run the work at least once.

> Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
> ---
> Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ks=
oftpark.c
> ---
>  kernel/smpboot.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/smpboot.c b/kernel/smpboot.c
> index 3f60e8c6dd30..a2ddd10a8577 100644
> --- a/kernel/smpboot.c
> +++ b/kernel/smpboot.c
> @@ -119,9 +119,12 @@ static int smpboot_thread_fn(void *data)
>  		}
> =20
>  		should_run =3D td->status =3D=3D HP_THREAD_ACTIVE && ht->thread_should=
_run(td->cpu);
> -		if (kthread_should_park() && !should_run) {
> +		if (kthread_should_park()) {
>  			__set_current_state(TASK_RUNNING);
>  			preempt_enable();
> +			/* Run pending work once, new work may keep coming */
	/*
	 * Run pending work once to handle queued work prior the parking
	 * request. Don't try to process everything in case new work
	 * continues to come and the handler has a hotplug notifier for
	 * everything that was enqueued later.
	 */

> +			if (should_run)
> +				ht->thread_fn(td->cpu);

The thread_fn should only run in HP_THREAD_ACTIVE case.

>  			if (ht->park && td->status =3D=3D HP_THREAD_ACTIVE) {
>  				BUG_ON(td->cpu !=3D smp_processor_id());
>  				ht->park(td->cpu);
>=20

Sebastian
