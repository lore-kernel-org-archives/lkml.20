Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759E3B7A8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641661; cv=none; b=k05JDtncN7cHCnRdznV1zJttpk/8hiDbqPM2m6GLt1NXd6Qu2HIOuoBDyemzjei9Zs1rt8GPSV43mpUaC/3yoW6BpRFoPTjzHYO9YEZA6QsPcL9pHdyrNLaZu4KqC1dGUIQNM4hX21WYHMZTj9v45Z8Rq+CrAEqT6Bx4rw3hw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641661; c=relaxed/simple;
	bh=foipVr2Jz35Kf7yg4o+vJwCK5ZF8i4RCeaRdyt395qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jMtO67WBxpyxIXkRmrPzNzJ8euTyPkXgJ/XrXx8ZeIwwBwIuAHZHWVQvBopmd7GEfTT4cS2QZtzkQ8inKeQ5TuneEaH3DlBdjj6KHwWbSOtgSygg6U41rYW8zBsyXOIsk7Qz8asAh4YtrOjOlRKqdmQYsDxSv3j9kzYRZ//0qhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lJZJGa51; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GWuL2f2O; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lJZJGa51";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GWuL2f2O"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788641658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVM3JcP3l0QxPvl7tXGCGW8CFgbFM+Xn86k33rJJp1E=;
	b=lJZJGa51P8AoDWP3VSVX7QI4qUZXD7sP4hVyBfjHZOj3ThbBUinneY8jxvcYaeMWxFvPEU
	FWUvtQCPSm+bagCwxejB8e67Klnh16yHJRG0m3FmiuF2s04jw4G3IptPWWpF9udeZFcg4U
	2mIX9Ld7r3QN5YEAGjCxhphzZDIYnMejxYNMLEnthrgWbL7USZ+9/oTQbz9fi17MF0v0uT
	UZ/GafZz0gFul2YZp2vLSnU7pPqPdLGkxeBPwTew+W2/nyWrAkSNaiorhmNfdsp3GwaD+9
	gniaUYlRMLuAJgywgNQIrqoF8kweM1lOYXhw6pD3ndBpDbhD5PvZzhgUOjyXHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788641658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVM3JcP3l0QxPvl7tXGCGW8CFgbFM+Xn86k33rJJp1E=;
	b=GWuL2f2OufS6TH37ZNjBZIaHhzyEjGbXDi7wXmMOWtXetaXUzKhdcrC3DWHZzJ3O4C27Lb
	YmtDHx3nEv8vLLDw==
To: Frederic Weisbecker <frederic@kernel.org>
Cc: =?utf-8?B?5pyx5oG65Lm+?= <zhukaiqian@xiaomi.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>,
 =?utf-8?B?5byg5ZiJ5Lyf?= <zhangjiawei8@xiaomi.com>,
 "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, =?utf-8?B?546L6Z+s?= <lingyue@xiaomi.com>,
 =?utf-8?B?54aK5Lqu?=
 <xiongliang@xiaomi.com>, "isaacmanjarres@google.com"
 <isaacmanjarres@google.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, =?utf-8?B?5qKB5Lyf6bmP?=
 <weipengliang@xiaomi.com>, =?utf-8?B?57+B6YeR6aOe?=
 <wengjinfei@xiaomi.com>
Subject: Re: [PATCH] tick/broadcast: Plug clockevents replacement race
In-Reply-To: <ZxE4U0YzXAY9RPOp@pavilion.home>
References: <042520850d394f0bb0004a226db63d0d@xiaomi.com>
 <87o77m1v9r.ffs@tglx> <b07f9746a58d46919b1600b22f5dff05@xiaomi.com>
 <835d5847-1aa0-4852-89c7-6a6996b3eb65@linaro.org>
 <bc1a086b932f454f9379c49221983675@xiaomi.com> <87o775uh0y.ffs@tglx>
 <87frrs8lsg.ffs@tglx> <87cymdsu0r.ffs@tglx>
 <ZxE4U0YzXAY9RPOp@pavilion.home>
Date: Sat, 05 Sep 2026 22:54:17 +0200
Message-ID: <87qzj74dxi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17 2024 at 18:16, Frederic Weisbecker wrote:
> Le Mon, Aug 12, 2024 at 04:19:48PM +0200, Thomas Gleixner a =C3=A9crit :
>> =E6=9C=B1=E6=81=BA=E4=B9=BE reported and decoded the following race cond=
ition when a broadcast
>> device is replaced:
>>=20
>> CPUA					CPUB
>>  __tick_broadcast_oneshot_control()
>>    bc =3D tick_broadcast_device.evtdev;
>> 					tick_install_broadcast_device(dev)
>>         				clockevents_exchange_device(cur, dev)
>> 					   shutdown(cur);
>> 					   detach(cur);
>> 					   cur->handler =3D noop;
>> 					   tick_broadcast_device.evtdev =3D dev;
>>=20
>>   tick_broadcast_set_event(bc, next_event); <- FAIL: arms a detached dev=
ice.
>>=20
>> If the original broadcast device has a restricted interrupt affinity mask
>> and the last CPU in that mask goes offline then the BUG() in
>> tick_cleanup_dead_cpu() triggers because the clockevent device is not in
>> detached state.
>>=20
>> The reason for this is that tick_install_broadcast_device() is not
>> serialized vs. tick broadcast operations.
>>=20
>> The obvious cure is to serialize tick_install_broadcast_device() with
>> tick_broadcast_lock against a concurrent tick broadcast operation.
>>=20
>> That requires to split clockevents_exchange_device() into two parts, one
>> which does the exchange, shutdown and detach operation and the other whi=
ch
>> drops the module reference count. This is required because the module
>> reference cannot be dropped while holding tick_broadcast_lock.
>
> The reason why the module reference can not be dropped while holding
> tick_broadcast_lock is not obvious though. What can go wrong?

tick_broadcast_lock() is a raw_spinlock and deeply nested ...
