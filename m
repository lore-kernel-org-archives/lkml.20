Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339624;
	b=rtJhwRHl7ilwXVUEYSAW7z3fb0ERQotXRJBllU85JMQduB8ipXg1jgzTRP1dutQOkXNJ
	 EhD4XBPIXG1dNEMILFE1RdWI2zYLwMjAF4htNoVd+61jbEccWEmGK6x3noP8Ropd0m/fU
	 aysxp68AyOhBAvDslpQ0XuypBp6CbuFSOKJK/qkFoTcfV19WRbWeZ85UNZa7fvKtyT/yy
	 skqN5fxwhUiUe9QmLk/ckmnT4KH2hBIea6cb3CFlNnVHgIE19CITYAhY+z34SKkOxGAKc
	 9vXSmyqIwLvtl1w7p8IpDfdvpaLkzOg1hKJ5hl9CLD6gjAUp3fkeHjc1akC4hOakP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339624;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=q2+9fpg2768DHZGt1GtPhK1HO6UtAVoVEPvNI2uvv+Y=;
	b=i7QD7642AnuUXZ1mZk21IIGA/C8MWMh3Xb9VEJlN4sh2+EqyELpa0X2aQQoDutas6sIu
	 Tc+s6bY9ajBcbTEjBrOL8rNZLmvcgAsS0YSEXG08Krq1u9zwSXMg+vM0pWej/k6OSIbP8
	 4prj+MK5R03p8obAtS2/H1DsyJ6hpntRREvmdAqL3L0YsregtWfw3MExQ02yFy/2XYN0Q
	 Tdbqs/fwRcpXLQrObwAC7m79/N/31c/hzZHoMeoFW5FFvqqtPleFMxqncaa2ifyI3eh0I
	 4TNiPyhDd8BeEJK7W9SqTKHjVLwQa7qmDMZpB5z2e/YrnXaXGMD8EPjnXgi5uja75aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4jyzJky;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48160A2606;
	Tue, 10 Nov 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4jyzJky
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116FC1F008BC;
	Tue, 10 Nov 2026 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339624;
	bh=q2+9fpg2768DHZGt1GtPhK1HO6UtAVoVEPvNI2uvv+Y=;
	h=Date:From:To:Cc:Subject;
	b=S4jyzJkyc0jcK5qHh/21s9/DInf83du7sSvk9nn2ZugrRFp4Ehy7zvx94wjRdOvzA
	 H0M0mDWfSRYwWCV6RyMTIENyHiUEL/WTmvPHUNV3Mp9Z4/xMzKHfZltavdpoJCDwR1
	 9ne8MwkAFfa6NV3nt8LtIS9fX2Pz6xE4tOQUDs9227+Ncc011ZwjAafpv1CeH4mXoY
	 OfxRoF8XP50OizoThq8z6WiTdDeOS4S416o2zyMKs+qifZc0n94IvU6jyjSSxlRy4P
	 QVhXUSi0jtz6Lj9atZG7fhTNWYPJufsiNfAdIm4nmcANUYRUijAd/50rgoCE9os3ih
	 5ob7TyjQU9F8Q==
Date: Tue, 10 Nov 2026 19:40:19 +0000
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the origin tree
Message-ID: <avNzIwARUFPlPyrF@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RZ7xTxRFVmCXH8i"
Content-Disposition: inline


--4RZ7xTxRFVmCXH8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/rcuscale.c

between commit:

  0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")

=66rom the origin tree and commit:

  08fa1784740f6 ("rcuscale: Consolidate per-writer arrays into struct write=
r_state")

=66rom the rcu tree.  Kees, let me once more renew my complaints about
this being done at -rc2...

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/rcu/rcuscale.c
index 38c75c37a07c3,5659eaebc5c0d..0000000000000
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@@ -115,17 -115,21 +115,21 @@@ struct writer_freelist=20
  	struct writer_mblock *ws_mblocks;
  };
 =20
+ struct writer_state {
+ 	struct writer_freelist wst_fl;
+ 	struct task_struct *wst_task;
+ 	u64 *wst_durations;
+ 	int wst_n_durations;
+ 	bool wst_done;
+ };
+=20
  static int nrealreaders;
  static int nrealwriters;
  static int nrealexp;
- static struct task_struct **writer_tasks;
  static struct task_struct **reader_tasks;
  static struct task_struct **exp_tasks;
 =20
- static u64 **writer_durations;
- static bool *writer_done;
- static struct writer_freelist *writer_freelists;
- static int *writer_n_durations;
+ static struct writer_state *writer_states;
  static atomic_t n_rcu_scale_reader_started;
  static atomic_t n_rcu_scale_writer_started;
  static atomic_t n_rcu_scale_writer_finished;
@@@ -293,6 -297,44 +297,44 @@@ static struct rcu_scale_ops srcud_ops=20
  	.name		=3D "srcud"
  };
 =20
+ static struct srcu_struct srcua;
+=20
+ static int srcu_scale_atomic_read_lock(void)
+ {
+ 	return srcu_read_lock_atomic(srcu_ctlp);
+ }
+=20
+ static void srcu_scale_atomic_read_unlock(int idx)
+ {
+ 	srcu_read_unlock_atomic(srcu_ctlp, idx);
+ }
+=20
+ static void srcu_scale_atomic_synchronize(void)
+ {
+ 	synchronize_srcu_atomic(srcu_ctlp);
+ }
+=20
+ static void srcu_atomic_scale_init(void)
+ {
+ 	srcu_ctlp =3D &srcua;
+ 	init_srcu_struct_atomic(srcu_ctlp);
+ }
+=20
+ static struct rcu_scale_ops srcua_ops =3D {
+ 	.ptype		=3D SRCU_FLAVOR,
+ 	.init		=3D srcu_atomic_scale_init,
+ 	.cleanup	=3D srcu_sync_scale_cleanup,
+ 	.readlock	=3D srcu_scale_atomic_read_lock,
+ 	.readunlock	=3D srcu_scale_atomic_read_unlock,
+ 	.get_gp_seq	=3D srcu_scale_completed,
+ 	.gp_diff	=3D rcu_seq_diff,
+ 	.exp_completed	=3D srcu_scale_completed,
+ 	.sync		=3D srcu_scale_atomic_synchronize,
+ 	.exp_sync	=3D srcu_scale_atomic_synchronize,
+ 	.stats		=3D srcu_scale_stats,
+ 	.name		=3D "srcua"
+ };
+=20
  #ifdef CONFIG_TASKS_RCU
 =20
  /*
@@@ -504,9 -546,9 +546,9 @@@ static struct writer_mblock *rcu_scale_
  	struct writer_freelist *wflp;
  	struct writer_mblock *wmbp;
 =20
- 	if (WARN_ON_ONCE(!writer_freelists))
+ 	if (WARN_ON_ONCE(!writer_states))
  		return NULL;
- 	wflp =3D &writer_freelists[me];
+ 	wflp =3D &writer_states[me].wst_fl;
  	if (llist_empty(&wflp->ws_lhp)) {
  		// ->ws_lhp is private to its rcu_scale_writer task.
  		wmbp =3D container_of(llist_del_all(&wflp->ws_lhg), struct writer_mbloc=
k, wmb_node);
@@@ -560,8 -602,9 +602,9 @@@ rcu_scale_writer(void *arg
  	u64 t;
  	DEFINE_TORTURE_RANDOM(tr);
  	u64 *wdp;
- 	u64 *wdpp =3D writer_durations[me];
- 	struct writer_freelist *wflp =3D &writer_freelists[me];
+ 	struct writer_state *wsp =3D &writer_states[me];
+ 	u64 *wdpp =3D wsp->wst_durations;
+ 	struct writer_freelist *wflp =3D &wsp->wst_fl;
  	struct writer_mblock *wmbp =3D NULL;
 =20
  	VERBOSE_SCALEOUT_STRING("rcu_scale_writer task started");
@@@ -631,7 -674,7 +674,7 @@@
  			started =3D true;
  		if (!done && i >=3D MIN_MEAS && time_after(jiffies, jdone)) {
  			done =3D true;
- 			WRITE_ONCE(writer_done[me], true);
+ 			WRITE_ONCE(wsp->wst_done, true);
  			sched_set_normal(current, 0);
  			pr_alert("%s%s rcu_scale_writer %ld has %d measurements\n",
  				 scale_type, SCALE_FLAG, me, MIN_MEAS);
@@@ -649,7 -692,7 +692,7 @@@
  						cur_ops->get_gp_seq();
  				}
  				if (shutdown_secs) {
- 					writer_tasks[me] =3D NULL;
+ 					wsp->wst_task =3D NULL;
  					smp_mb(); /* Assign before wake. */
  					rcu_scale_cleanup();
  					kernel_power_off();
@@@ -665,10 -708,10 +708,10 @@@
 =20
  			if (!atomic_xchg(&dumped, 1)) {
  				for (i =3D 0; i < nrealwriters; i++) {
- 					if (writer_done[i])
+ 					if (writer_states[i].wst_done)
  						continue;
  					pr_info("%s: Task %ld flags writer %d:\n", __func__, me, i);
- 					sched_show_task(writer_tasks[i]);
+ 					sched_show_task(writer_states[i].wst_task);
  				}
  				if (cur_ops->stats)
  					cur_ops->stats();
@@@ -676,7 -719,7 +719,7 @@@
  		}
  		if (!selfreport && time_after(jiffies, jdone + HZ * (70 + me))) {
  			pr_info("%s: Writer %ld self-report: started %d done %d/%d->%d i %d jd=
one %lu.\n",
- 				__func__, me, started, done, writer_done[me], atomic_read(&n_rcu_scal=
e_writer_finished), i, jiffies - jdone);
+ 				__func__, me, started, done, wsp->wst_done, atomic_read(&n_rcu_scale_=
writer_finished), i, jiffies - jdone);
  			selfreport =3D true;
  		}
  		if (gp_succeeded && started && !alldone && i < MAX_MEAS - 1)
@@@ -687,7 -730,7 +730,7 @@@
  		rcu_scale_free(wmbp);
  		cur_ops->gp_barrier();
  	}
- 	writer_n_durations[me] =3D i_max + 1;
+ 	wsp->wst_n_durations =3D i_max + 1;
  	torture_kthread_stopping("rcu_scale_writer");
  	return 0;
  }
@@@ -1031,13 -1074,11 +1074,11 @@@ rcu_scale_cleanup(void
  		reader_tasks =3D NULL;
  	}
 =20
- 	if (writer_tasks) {
+ 	if (writer_states) {
  		for (i =3D 0; i < nrealwriters; i++) {
  			torture_stop_kthread(rcu_scale_writer,
- 					     writer_tasks[i]);
- 			if (!writer_n_durations)
- 				continue;
- 			j =3D writer_n_durations[i];
+ 					     writer_states[i].wst_task);
+ 			j =3D writer_states[i].wst_n_durations;
  			pr_alert("%s%s writer %d gps: %d\n",
  				 scale_type, SCALE_FLAG, i, j);
  			ngps +=3D j;
@@@ -1051,14 -1092,12 +1092,12 @@@
  			 rcuscale_seq_diff(b_rcu_gp_test_finished,
  					   b_rcu_gp_test_started));
  		for (i =3D 0; i < nrealwriters; i++) {
- 			if (!writer_durations)
- 				break;
- 			if (!writer_n_durations)
- 				continue;
- 			wdpp =3D writer_durations[i];
+ 			struct writer_state *wsp =3D &writer_states[i];
+=20
+ 			wdpp =3D wsp->wst_durations;
  			if (!wdpp)
  				continue;
- 			for (j =3D 0; j < writer_n_durations[i]; j++) {
+ 			for (j =3D 0; j < wsp->wst_n_durations; j++) {
  				wdp =3D &wdpp[j];
  				pr_alert("%s%s %4d writer-duration: %5d %llu\n",
  					scale_type, SCALE_FLAG,
@@@ -1066,34 -1105,23 +1105,23 @@@
  				if (j % 100 =3D=3D 0)
  					schedule_timeout_uninterruptible(1);
  			}
- 			kfree(writer_durations[i]);
- 			if (writer_freelists) {
+ 			kfree(wdpp);
+ 			if (wsp->wst_fl.ws_mblocks) {
  				int ctr =3D 0;
  				struct llist_node *llnp;
- 				struct writer_freelist *wflp =3D &writer_freelists[i];
 =20
- 				if (wflp->ws_mblocks) {
- 					llist_for_each(llnp, wflp->ws_lhg.first)
- 						ctr++;
- 					llist_for_each(llnp, wflp->ws_lhp.first)
- 						ctr++;
- 					WARN_ONCE(ctr !=3D gp_async_max,
- 						  "%s: ctr =3D %d gp_async_max =3D %d\n",
- 						  __func__, ctr, gp_async_max);
- 					kfree(wflp->ws_mblocks);
- 				}
+ 				llist_for_each(llnp, wsp->wst_fl.ws_lhg.first)
+ 					ctr++;
+ 				llist_for_each(llnp, wsp->wst_fl.ws_lhp.first)
+ 					ctr++;
+ 				WARN_ONCE(ctr !=3D gp_async_max,
+ 					  "%s: ctr =3D %d gp_async_max =3D %d\n",
+ 					  __func__, ctr, gp_async_max);
+ 				kfree(wsp->wst_fl.ws_mblocks);
  			}
  		}
- 		kfree(writer_tasks);
- 		writer_tasks =3D NULL;
- 		kfree(writer_durations);
- 		writer_durations =3D NULL;
- 		kfree(writer_n_durations);
- 		writer_n_durations =3D NULL;
- 		kfree(writer_done);
- 		writer_done =3D NULL;
- 		kfree(writer_freelists);
- 		writer_freelists =3D NULL;
+ 		kfree(writer_states);
+ 		writer_states =3D NULL;
  	}
 =20
  	/* Do torture-type-specific cleanup operations.  */
@@@ -1110,7 -1138,8 +1138,8 @@@ rcu_scale_init(void
  	long i;
  	long j;
  	static struct rcu_scale_ops *scale_ops[] =3D {
- 		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING=
_OPS
+ 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
+ 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
  	};
 =20
  	if (!torture_init_begin(scale_type, verbose))
@@@ -1187,36 -1216,30 +1216,30 @@@
  				goto unwind;
  		}
  	}
- 	writer_tasks =3D kzalloc_objs(writer_tasks[0], nrealwriters);
- 	writer_durations =3D kzalloc_objs(*writer_durations, nrealwriters);
- 	writer_n_durations =3D kzalloc_objs(*writer_n_durations, nrealwriters);
- 	writer_done =3D kzalloc_objs(writer_done[0], nrealwriters);
- 	if (gp_async) {
- 		if (gp_async_max <=3D 0) {
- 			pr_warn("%s: gp_async_max =3D %d must be greater than zero.\n",
- 				__func__, gp_async_max);
- 			WARN_ON_ONCE(IS_BUILTIN(CONFIG_RCU_TORTURE_TEST));
- 			firsterr =3D -EINVAL;
- 			goto unwind;
- 		}
- 		writer_freelists =3D kzalloc_objs(writer_freelists[0],
- 						nrealwriters);
+ 	writer_states =3D kzalloc_objs(writer_states[0], nrealwriters);
+ 	if (gp_async && gp_async_max <=3D 0) {
+ 		pr_warn("%s: gp_async_max =3D %d must be greater than zero.\n",
+ 			__func__, gp_async_max);
+ 		WARN_ON_ONCE(IS_BUILTIN(CONFIG_RCU_TORTURE_TEST));
+ 		firsterr =3D -EINVAL;
+ 		goto unwind;
  	}
- 	if (!writer_tasks || !writer_durations || !writer_n_durations || !writer=
_done ||
- 	    (gp_async && !writer_freelists)) {
+ 	if (!writer_states) {
  		SCALEOUT_ERRSTRING("out of memory");
  		firsterr =3D -ENOMEM;
  		goto unwind;
  	}
  	for (i =3D 0; i < nrealwriters; i++) {
- 		writer_durations[i] =3D
- 			kzalloc_objs(*writer_durations[i], MAX_MEAS);
- 		if (!writer_durations[i]) {
+ 		struct writer_state *wsp =3D &writer_states[i];
+=20
+ 		wsp->wst_durations =3D kcalloc(MAX_MEAS, sizeof(*wsp->wst_durations),
+ 					     GFP_KERNEL);
+ 		if (!wsp->wst_durations) {
  			firsterr =3D -ENOMEM;
  			goto unwind;
  		}
- 		if (writer_freelists) {
- 			struct writer_freelist *wflp =3D &writer_freelists[i];
+ 		if (gp_async) {
+ 			struct writer_freelist *wflp =3D &wsp->wst_fl;
 =20
  			init_llist_head(&wflp->ws_lhg);
  			init_llist_head(&wflp->ws_lhp);
@@@ -1234,7 -1257,7 +1257,7 @@@
  			}
  		}
  		firsterr =3D torture_create_kthread(rcu_scale_writer, (void *)i,
- 						  writer_tasks[i]);
+ 						  wsp->wst_task);
  		if (torture_init_error(firsterr))
  			goto unwind;
  	}

--4RZ7xTxRFVmCXH8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzcyIACgkQJNaLcl1U
h9D2bwf9Ful4BA69sEdWpskRtI0g0aIcMVcdiGMkzcUuMsD6VjBtitP3Q1Hvv8Np
hIkBRHGhq+j7f3I4wNGie3d+rs411VtFllBeyTNdVfnAO7mBm9E838x53jfSuWe2
t2M0LV/s5a5ljVSLUT1rllNeFnsVSpx4dmKHwqtO+6AKtgoCdovZcIqwL0uXWc7g
5bioRBVZmNdev1aM64j7MDjBd4hqB1VqO4xmcAifrMLJg5ZGh4If4z2+toh0OGUK
KaRFS06Wj4/64mvLFQ9lJGhlb/Fx547B6zjxZql+he/wdD/zFvSy/vrZCBA32BKk
TokUwMOr6ei3/K54C6F1VuayYK/hAg==
=5hjA
-----END PGP SIGNATURE-----

--4RZ7xTxRFVmCXH8i--
