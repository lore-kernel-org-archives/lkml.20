Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB455F602
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419398; cv=none; b=qhNpDfEPZTnbW8PACk7ou9o6ayDvCk+eaeuiCVDGTsCbyFn4GdvlwqDbMunrFmDl3fo3JmqmxdfcwP5P7Pg4vuv11di5P7DeGFTWCn7Y+dPcQGBDKnvZ3ZzOj4F8C084d9/188kKm+JsZu0bTGRomzkJqoAUNk8IuWMX9nasPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419398; c=relaxed/simple;
	bh=PirOfb7uWEdegUpAVSIQJFcnaoSaskXAGd6A2HplIbc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=cvG8kpcvovEcyldR3C5aQLTuJvvPwXUDxli2hh8ZnTruf0ylI3n8eXRlPTOuOC8tfieDqGk9RiZEz0WEaUSpD0DxjIvkFqTYOIVP3uY+Jlqh7oUXK3JmIdKSslSdta1kbP7JeLYehvlCGrrWGHCO/dMU+3Vd97uDcUHny/BxDsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RLA23zyS; arc=none smtp.client-ip=95.215.58.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RLA23zyS"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PirOfb7uWEdegUpAVSIQJFcnaoSaskXAGd6A2HplIbc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792419393; v=1; x=1793024193;
 b=RLA23zyS2XGcJQPX3sJ4rgicvMskcINalYidVF831pNoQvYZxl5uRG0xVDcFqvUVO3CUZ87Y
 YMfIHXaR0TVXkE4Tybx40EfGoFTBm0fec3Cs4+3FIvGdSLdTGWKeplQmYOJps8xKDuFQDSbOtZf
 UlYwtYCJNvAp7x/KAxub7Eh8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 681a367e69125c9d;
	Mon, 19 Oct 2026 14:16:33 +0000
X-Mizu-Trace-ID: 681a367e69125c9d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 14:16:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <8accba4566f0a0ea0a46950bc1da2b03993c8ab3@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] rcutorture: Clear cbflood_max for tasks-rude and
 srcu-atomic testing
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
 urezki@gmail.com, boqun@kernel.org, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261019003332.GA645187@joelbox>
References: <20261012104134.16268-1-qiang.zhang@linux.dev>
 <20261019003332.GA645187@joelbox>

>=20
>=20On Mon, Oct 12, 2026 at 06:41:34PM +0800, Zqiang wrote:
>=20
>=20>=20
>=20> When running the tasks-rude and srcu-atomic tests, the fwd_prog_tas=
ks
> >  kthread is created because the default value of fwd_progress is 1.
> >  however, the two RCU flavors not support ->call():
> >=20=20
>=20>  1. tasks-rude: commit b428a9de9bba ("rcutorture: Stop testing RCU =
Tasks
> >  Rude asynchronous APIs") removed .call and .cb_barrier from tasks-ru=
de,
> >  but left the .cbflood_max =3D 50000.
> >=20=20
>=20>  2. srcu-atomic: srcu_torture_init_forbidden_apis() sets ->call to =
NULL
> >  for SRCU_READ_FLAVOR_ATOMIC runs, but leaves ->cbflood_max untouched=
.
> >=20=20
>=20>  In both cases, the non-zero ->cbflood_max fools the check above in=
to
> >  creating the fwd_prog_tasks kthreads, even though those kthreads can=
not
> >  possibly carry out any forward-progress test:
> >=20=20
>=20>  1. The rcu_torture_fwd_prog_cr() returns immediately due to cur_op=
s->call
> >  is NULL:
> >=20=20
>=20>  [ 68.022674] rcu_torture_fwd_prog_cr: No ->call(), so no forward-p=
rogress test 0
> >  [ 129.462046] rcu_torture_fwd_prog_cr: No ->call(), so no forward-pr=
ogress test 0
> >  [ 190.902123] rcu_torture_fwd_prog_cr: No ->call(), so no forward-pr=
ogress test 0
> >  [ 252.343809] rcu_torture_fwd_prog_cr: No ->call(), so no forward-pr=
ogress test 0
> >=20=20
>=20>  2. The rcu_torture_fwd_prog_nr() is never even invoked, because it=
s caller
> >  requires cur_ops->stall_dur, and neither tasks-rude nor srcu-atomic
> >  provide ->stall_dur (only rcu_ops does).
> >=20=20
>=20>  Therefore, creating fwd_prog_tasks kthreads is pointless, this com=
mit
> >  removes the .cbflood_max from tasks-rude and clears ->cbflood_max in=
 the
> >  srcu_torture_init_forbidden_apis().
> >=20=20
>=20>  simple verification output:
> >=20=20
>=20>  [ 3.062959][ T1] srcu-torture: rcu_torture_fwd_prog_init: Disabled=
, unsupported by RCU flavor under test
> >  [ 2.922323][ T1] tasks-rude-torture: rcu_torture_fwd_prog_init: Disa=
bled, unsupported by RCU flavor under test
> >=20=20
>=20>  Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> >  ---
> >  kernel/rcu/rcutorture.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20=20
>=20>  diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> >  index 968343be4e0d..00db87256e78 100644
> >  --- a/kernel/rcu/rcutorture.c
> >  +++ b/kernel/rcu/rcutorture.c
> >  @@ -723,6 +723,7 @@ static void srcu_torture_init_forbidden_apis(voi=
d)
> >  cur_ops->deferred_free =3D NULL;
> >  cur_ops->exp_current =3D NULL;
> >  cur_ops->start_gp_poll =3D NULL;
> >  + cur_ops->cbflood_max =3D 0;
> >  }
> >=20=20
>=20>  static void srcu_torture_init(void)
> >  @@ -1250,7 +1251,6 @@ static struct rcu_torture_ops tasks_rude_ops =
=3D {
> >  .exp_sync =3D synchronize_rcu_tasks_rude,
> >  .gp_kthread_dbg =3D show_rcu_tasks_rude_gp_kthread,
> >  .get_gp_data =3D rcu_tasks_rude_get_gp_data,
> >  - .cbflood_max =3D 50000,
> >  .irq_capable =3D 1,
> >  .name =3D "tasks-rude"
> >=20
>=20I'm okay with your change, but I have a different suggestion. Let me =
know your thoughts.
>=20
>=20Could we fix this in rcu_torture_fwd_prog_init() instead? A nonzero
> cbflood_max does not mean callback flooding is possible when ->call or
> ->cb_barrier is absent. This also avoids changing the SRCU operations t=
able
> just to suppress a worker.
>=20
>=20diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -3842,3 +3842,4 @@ static int __init rcu_torture_fwd_prog_init(void)
> - if ((!cur_ops->sync && !cur_ops->call) ||
> - (!cur_ops->cbflood_max && (!cur_ops->stall_dur || cur_ops->stall_dur(=
) <=3D 0)) ||
> + if (!cur_ops->sync ||
> + ((!cur_ops->call || !cur_ops->cb_barrier || !cur_ops->cbflood_max) &&
> + (!cur_ops->stall_dur || cur_ops->stall_dur() <=3D 0)) ||
>  cur_ops =3D=3D &rcu_busted_ops) {
>=20
>=20Thoughts?

Agree, the 'cur_ops =3D=3D &rcu_busted_ops' check can be removed.

Thanks
Zqiang

>=20
>=20thanks,
>=20
>=20Joel Fernandes
>
