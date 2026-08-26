Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D82FBE1F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787788417; cv=none; b=PM5c0P1IU/2nl3JkqcR7JubREMbhUZEOOL81IFU0g8KIgVgx1SeYMrHUwcNSowsk5Qt3mW92pw++z0Y8lMTp4+en+vngF+D7U0jaWyHxLSKcwJ/vNZHwPIumoHF6DIoXuJaNIljYwz1FPmprZAzkip3dHBf+qdDCjBdPQ3ufBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787788417; c=relaxed/simple;
	bh=jSlw6hAerUXDpVZLz8w/ZxRM7DxzgIEMkO8B3L+BcAg=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=tvhVqjWuX1RRM7S1LlYeaJjFMm+vLk94YsrYbwtx8OClrnNW0bGJTcNf2yE3K4+u6xTADWD/FqPfSbFomqS/f4TPSoCbn8rXrZPDwMY0fzw+sliVx5hQLeOS3cqb1NdLa0jU/8FvEYL6z0KNQQfsTTMeCrNv5CJea5wqftu2pVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iDRVupQ0; arc=none smtp.client-ip=95.215.58.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iDRVupQ0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jSlw6hAerUXDpVZLz8w/ZxRM7DxzgIEMkO8B3L+BcAg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787788412; v=1; x=1788393212;
 b=iDRVupQ0sNDJLPKv9Gho8nQu0ktsb26GVx30jsUsfGt8qifLcj3dYyW6X3HjbqeJ3nL8mCx0
 rfoW750cLZmTWEmX6QNdtZQVVTVHI6nj4dVRHvnDIzs7WU0ECwDQ2CIOtVy+H/0bZ/m6RPlAeFX
 GeuK26Y2PZUQ/ghZj5vKV7Y0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 67c8cdd62d0ba66e;
	Wed, 26 Aug 2026 23:53:32 +0000
X-Mizu-Trace-ID: 67c8cdd62d0ba66e
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:53:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <eb2132ad05cd3804a8f2a170de441d79afa793e9@linux.dev>
TLS-Required: No
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: "Sunho Park" <shpark061104@gmail.com>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
In-Reply-To: <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
 <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
 <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>

>=20
>=20On 8/26/26 22:13, Zqiang wrote:
>=20
>=20>=20
>=20> In this SRCU_SIZE_SMALL mode, when queue delayed work timer, the cb=
list is always no-empty.
> >  unless invoke start_poll_synchronize_srcu() to begin SRCU garce peri=
od,
> >  otherwise invoke call_srcu() or synchronize_srcu*() will insert call=
back.
> >=20
>=20Right, every grace period which armed the delay_work timer is started=
 by the real call_srcu(&kvm->srcu, &bus->rcu, __free_bus) in kvm_io_bus_r=
egister_dev(). I missed one point: the invoke work which invoked the barr=
ier callbacks is not queued by the nearest end of grace period. It was qu=
eued by the timer of a previous end of GP, and it started only after the =
last GP had ended. Meanwhile the srcu_gp_end() from the last GP armed ano=
ther timer even though the work was already queued. The timeline is as be=
low:
>=20
>=201. call_srcu(&kvm->srcu, &bus->rcu, __free_bus)
> 2. One end of GP comes, arms a timer.
> 3. The timer is fired and an invoke work is queued to rcu_gp_wq. The ti=
mer is disabled now.
> 4. Another call_srcu(&kvm->srcu, &bus->rcu, __free_bus)
> 5. srcu_barrier() is called and queues barrier callbacks, waits for src=
u_invoke_callbacks() to invoke them.

Based on your description below, the 5.srcu_barrier() did not intercept t=
he callback of 4.call_srcu(),
this means that 4.call_srcu() and 5.srcu_barrier() concurrent calls, or c=
alls after 5.srcu_barrier().

The combination of srcu_barrier() and cleanup_srcu_struct() typically occ=
urs on the module exit path.
srcu_barrier() ensures that all previously inserted callbacks complete=EF=
=BC=8Cso therefore, theoretically,
there shouldn't be any callbacks left to execute after we finish executin=
g srcu_barrier().=20
and=20of course, there are also shouldn't be any ongoing or newly started=
 SRCU grace period and the
WARN_ON() in cleanup_srcu_struct() is designed to detect it.

If when the cleanup_srcu_struct() detects an incomplete SRCU grace period=
 or any srcu callbacks
that have not yet been executed, this is a risk that needs to be reported=
, even if the
cleanup_srcu_struct() can intercept it internally.
=20
Therefore,=20we should investigate this issue to ensure that 5.srcu_barri=
er() can intercept the step 4 callback.

Thanks
Zqiang


> 6. The end of GP from step 4 comes, arms another timer.
> 7. The invoke work queued in step 3 starts, srcu_invoke_callbacks() is =
called. It starts invoking callbacks without subtracting the cblist len f=
ield. It will call rcu_segcblist_add_len(&sdp->srcu_cblist, -len) after t=
he invoking loop is over.
> When I debugged, there were five __free_bus(the real callbacks) and one=
 barrier callback, so the cblist len field was 6.
> 8. Barrier callback is invoked, still the cblist len field is not subtr=
acted as srcu_invoke_callbacks()'s invoking loop is not over.
> 9. srcu_barrier() wakes up by completion and cleanup_srcu_struct() is c=
alled before the timer armed in step 6 expires.
> At this point the cblist is physically empty (head =3D=3D NULL, all seg=
len are 0) as all six callbacks have already been invoked. Only the cblis=
t len field is stale(>0).
>=20
>=20Thanks
> Sunho Park
>
