Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9D445ACE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830533; cv=none; b=I22DDGzkjWDLl7nJfs+36KjPUWmE5lDBTBlUoI+j/sIlqn4pTkh9i7+MKirWVrbrhFQQ1SRMnNzCDDjSRYL35kaYiDddrmfhE1WIt3bs2zQIOlFvpN77q7sUsXe6HWpJNy3tLJQkxZOQw1CxcqG5/jNSwb95qK0TDm/cIs53jFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830533; c=relaxed/simple;
	bh=k7uI04KNrAt14+4wVU/1LoyK0BobJkgQiHs4Mhbid0c=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=V0kLfyUo5QEET2Hvcaf+Ydh3IggLT1kj6NjWPEBU5+3dNJamMjesaMY3RkJBoBYV66LWybDHHyBUslCqbEWtheWRtrhE3O7eIvrxsUpicGEcqqGRilCzETgpootxD4LLid/dUAtJja9B7SaRo2GwUWO37kiP4Co2ELlwJfSDe1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bHLbJNPn; arc=none smtp.client-ip=91.218.175.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bHLbJNPn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k7uI04KNrAt14+4wVU/1LoyK0BobJkgQiHs4Mhbid0c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787830527; v=1; x=1788435327;
 b=bHLbJNPnq7gADa3BqXX/sxuhsYU1uhhPnur4HFetB3M4ha5GW4NH4vlexmpgQOP65XRbmosX
 07pBzp9RdZMiH5jH2LUwiOp8/JVX64+iL4K6tb8o2BKsTR4MOYwo3gIZFJe4JSODKfWRSjdaU6i
 LkMFHyb8AcqQ7Tm8nP/wI4F0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 70dd70d25540ce3d;
	Thu, 27 Aug 2026 11:35:09 +0000
X-Mizu-Trace-ID: 70dd70d25540ce3d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 11:35:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <698a4d8b6c559f9049ee6fa6b0bc99d45a3d7e44@linux.dev>
TLS-Required: No
Subject: Re: [BUG] srcu: false-positive WARN in cleanup_srcu_struct() after
 78a38cbf6f20
To: "Sunho Park" <shpark061104@gmail.com>, rcu@vger.kernel.org
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 syzbot+d4faf7db59e11f6fd1ab@syzkaller.appspotmail.com
In-Reply-To: <e6350377085ddd85d6ef00d8e9a67bd50c762d3c@linux.dev>
References: <20260824105625.3725157-1-shpark061104@gmail.com>
 <494f3e0cdb3692bf13690f4cddd3b40098b51627@linux.dev>
 <24c0edd6-3cdc-4536-ac78-394bf785aad4@gmail.com>
 <0e74e6799bf042293fd1e34e2f242c56786c3de4@linux.dev>
 <9e216978-d884-4d56-b39f-d134f78a4999@gmail.com>
 <eb2132ad05cd3804a8f2a170de441d79afa793e9@linux.dev>
 <f85c60a0-81d7-41a4-9926-f69cf10222d0@gmail.com>
 <e6350377085ddd85d6ef00d8e9a67bd50c762d3c@linux.dev>

>=20
>=20>=20
>=20> On 8/27/26 08:53, Zqiang wrote:
> >=20=20
>=20>=20=20
>=20>  Based on your description below, the 5.srcu_barrier() did not inte=
rcept the callback of 4.call_srcu(),
> >  this means that 4.call_srcu() and 5.srcu_barrier() concurrent calls,=
 or calls after 5.srcu_barrier().
> >  The combination of srcu_barrier() and cleanup_srcu_struct() typicall=
y occurs on the module exit path.
> >  srcu_barrier() ensures that all previously inserted callbacks comple=
te=EF=BC=8Cso therefore, theoretically,
> >  there shouldn't be any callbacks left to execute after we finish exe=
cuting srcu_barrier().
> >  and of course, there are also shouldn't be any ongoing or newly star=
ted SRCU grace period and the
> >  WARN_ON() in cleanup_srcu_struct() is designed to detect it.
> >  If when the cleanup_srcu_struct() detects an incomplete SRCU grace p=
eriod or any srcu callbacks
> >  that have not yet been executed, this is a risk that needs to be rep=
orted, even if the
> >  cleanup_srcu_struct() can intercept it internally.
> >  > Therefore, we should investigate this issue to ensure that 5.srcu_=
barrier() can intercept the step 4 callback.
> >  Thanks
> >  Zqiang
> >=20=20
>=20>  Before 5. srcu_barrier() call, the 4. call_srcu() is finished and =
the callback was enqueued, and srcu_barrier() did intercept it by appendi=
ng barrier cb after it. They can't be called concurrently because when ca=
ll_srcu() is called inside kvm_io_bus_register_dev(), the kvm reference c=
ount is nonzero and kvm_destroy_vm() which calls srcu_barrier() could not=
 be started.
> >=20
>=20Which tree is your test based on? (rcu tree or linux-next tree)
>=20
>=20The step 4 call_srcu() is finished and then the step5 call srcu_barri=
er(), it failed to intercept it?
> (theoretically, this shouldn't happen)
>=20

Sorry,=20here I missed.

>=20=20
>=20
> >=20
>=20> In my debugging, all five __free_bus() callbacks enqueued by kvm_io=
_bus_register_dev() were invoked before the barrier cb, and only then the=
 barrier cb is called and srcu_barrier() returns. So all the real callbac=
ks were executed and practically there were no callbacks left to execute =
when srcu_barrier() returns, but a stale n_cbs > 0 is left because srcu_i=
nvoke_callbacks()'s invoking loop has not finished.
> >=20=20
>=20>  KVM logic correctly called srcu_barrier() and cleanup_srcu_struct(=
) without calling call_srcu() in between. In my opinion, the root causes =
are as follows:
> >=20=20
>=20>  1) for timer_delete_sync(): the srcu_gp_end() which ended the last=
 grace period (from 4. ) arms sdp->delay_work to expire at jiffies + 1 ev=
en though the invoke work (queued in 3. ) is already queued, and cleanup_=
srcu_struct() runs before that one-jiffy timer expires, so timer_delete_s=
ync() cancels that pending timer and returns true.

The step5 srcu_barrier() has been intercept the srcu callback which by st=
ep4 call_srcu() insert,
so at here, the srcu_barrier should not be return, and the step4 srcu cal=
lback should not be run.
the cleanup_srcu_struct() also should not be called.


Thanks
Zqiang


> >=20=20
>=20>  2) for n_cbs: srcu_invoke_callbacks() calls rcu_segcblist_add_len(=
-len) only at the end of the work item, after the barrier callback has be=
en invoked and srcu_barrier() has already returned, so cleanup_srcu_struc=
t() observes a stale n_cbs > 0 while the cblist is physically empty.
> >=20
>=20because you say the 5.srcu_barrier() can not intercept setp4 call_src=
u() enqueue callback func,=20
>=20that means that the step4 srcu callback shuold not be run, the cblist=
 also not empty.
>=20
>=20Thanks
> Zqiang=20
>=20
> >=20
>=20> Thanks
> >  Sunho Park
> >
>
