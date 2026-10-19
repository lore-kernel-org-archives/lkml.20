Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429309;
	b=iCzR0nBjZTtJ8g34GQmFYtvJkEuHPGnlSA0B7+xZqRTxa73qQzgdBG7iJ0IDb+dMxNBA
	 yNesLDCCyYblvorzFyQuSWplIKt3qvQ42uCHPck27U+jTsC3jt3hx5XTw6IeSL6lOG/l2
	 Tl9/7Sys3EIiM4u65HPL88SZFsY7piRyN2XMxtaps8wbQszt0ALStYBnBtmewM5MsJNrw
	 IExYITm+VWlC/2UiUC7py9dHAyVO25TGB9IMqjlrJFdufhcgUZtjSRvcBvFjzHhRRV779
	 GLmwbwaTj3R2/qrDOqGdpf1ATFdI1BnM8d3dp0ueEOa1umUY2oyDKKvBsMBgK6YgJxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429309;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=S3i+jHVVPDNWyNDsleSOJM+lF7eDVzfmCU9l597q6rU=;
	b=2rDe3e3JGTx49mIQF9IcwLMlOacmHdfKOfmTS1NXDHArGh1qXAzDoY2asIvwq2d4GC2R
	 N3KWQk8liCtvimfk6GV6Vv4x91v2atK3onmPQjaZPi0WZIotse37sfbSy2/xQnMEc48gM
	 Ht+1KNkU66r4XQSBfznoYkD5baQshJ8Efk6eiGFQ0TM28Fh54YO7aK/W2QAIth96s8z60
	 CgQahKzos9ZYZiAnULoCgcj9JATfyIHsZsgfg6xYb71ADrWZK9/J8QYaEBbdnv53Yx1Os
	 ifkpKA04qQDzMts1ZWR9ewp5OJDmHj+up8UglcL6zRUgm4+wu04lfw599R6/ZVKjYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X437GM04;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A31606A33D;
	Mon, 19 Oct 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X437GM04
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625211F000C6;
	Mon, 19 Oct 2026 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429308;
	bh=S3i+jHVVPDNWyNDsleSOJM+lF7eDVzfmCU9l597q6rU=;
	h=Date:From:To:Cc:Subject;
	b=X437GM047dYthGut0z2XvzHGiNex0TlYLSMxN0RRRlS3igbz56zqE1wispSl0H1er
	 hyOJYcfgnPHofBHXp/MNK5/lh6xavzqGZjAg5ejdB+nCMHCthUG0JHVT94hshR3h03
	 m5Fz01a+S13yztuEtURK7DUNgQL0PDc+7nM2jfB6goeEQnkrX9zdn+KVhbNTy9iiaX
	 +VdQHDi1J5UFOVi5Q3SeBZ+L5Pd4txYLquTrRN7XLmaIRrE9QjUugMB+xWM2l+ttER
	 b3wjMLHGahbzNRAhbD/fdh3VXXBA4+QlML1C9b2Cg6taNgnUe/3S0L58PFy0mCcS9d
	 xH7ht+7XAyMkA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 753F31AC57D0; Mon, 19 Oct 2026 18:01:46 +0100 (BST)
Date: Mon, 19 Oct 2026 18:01:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>, Kuba Piecuch <jpiecuch@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the origin tree
Message-ID: <atZM-tXvYuR1bE3z@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="AAd/J4A5l7u5t+Tx"
Content-Disposition: inline


--AAd/J4A5l7u5t+Tx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext/sub.c

between commit:

  18f5c699d1d0a ("sched_ext: Rename scx_reenq_wait_dispatching() to scx_wai=
t_dispatching()")

=66rom the origin tree and commit:

  cea8b60e4aee0 ("sched_ext: Move reject DSQ draining into core")

=66rom the sched-ext tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/sched/ext/ext.c
index 2b6239763b230,9491e4332115f..0000000000000
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@@ -2421,11 -2597,8 +2601,11 @@@ void scx_move_local_task_to_local_dsq(s
  	lockdep_assert_rq_held(dst_rq);
 =20
  	WARN_ON_ONCE(p->scx.holding_cpu >=3D 0);
 +	scx_wait_dispatching(p);
 +
 +	dst_dsq =3D scx_resolve_local_dsq(sch, dst_rq, p, &enq_flags);
 =20
- 	if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT))
+ 	if (enq_flags & (SCX_ENQ_HEAD | SCX_ENQ_PREEMPT | SCX_ENQ_PREEMPT_LAZY))
  		dsq_insert_head(dst_dsq, p);
  	else
  		list_add_tail(&p->scx.dsq_list.node, &dst_dsq->list);
@@@ -2604,7 -2847,13 +2854,14 @@@ static bool unlink_dsq_and_switch_rq_lo
 =20
  	/* task_rq couldn't have changed if we're still the holding cpu */
  	if (likely(p->scx.holding_cpu =3D=3D cpu) && !WARN_ON_ONCE(src_rq !=3D t=
ask_rq(p))) {
 +		scx_wait_dispatching(p);
+ 		/*
+ 		 * Keep ->dsq set until we own @src_rq so that a racing dequeue
+ 		 * can find @dsq and clear holding_cpu. Once ownership is
+ 		 * confirmed, clear it under @src_rq so that deactivate_task()
+ 		 * takes the !dsq path instead of retaking @dsq->lock.
+ 		 */
+ 		p->scx.dsq =3D NULL;
  		return true;
  	}
 =20
@@@ -2651,10 -2913,21 +2921,23 @@@ static struct rq *move_task_between_dsq
  	lockdep_assert_held(&src_dsq->lock);
  	lockdep_assert_rq_held(src_rq);
 =20
 +	scx_wait_dispatching(p);
 +
  	if (dst_dsq->id =3D=3D SCX_DSQ_LOCAL) {
  		dst_rq =3D container_of(dst_dsq, struct rq, scx.local_dsq);
+ 		/*
+ 		 * Unlike the rq-lock handoff paths, @src_rq has been locked
+ 		 * throughout this operation. Only active proxy state can race the
+ 		 * move here; let the enforcing check below diagnose an ordinary
+ 		 * migration-disabled task.
+ 		 */
+ 		if (src_rq !=3D dst_rq &&
+ 		    unlikely(task_proxy_running_or_donating(p))) {
+ 			dispatch_dequeue_locked(p, src_dsq);
+ 			raw_spin_unlock(&src_dsq->lock);
+ 			scx_proxy_reject_task(sch, src_rq, p, enq_flags);
+ 			return src_rq;
+ 		}
  		if (src_rq !=3D dst_rq &&
  		    unlikely(!task_can_run_on_remote_rq(sch, p, dst_rq, true))) {
  			dst_dsq =3D find_global_dsq(sch, task_cpu(p));
@@@ -4562,11 -4922,10 +4942,10 @@@ static u32 reenq_local(struct scx_sche
  		if (!local_task_should_reenq(rq, p, &reenq_flags, &reason))
  			continue;
 =20
 -		scx_reenq_wait_dispatching(p);
 +		scx_wait_dispatching(p);
  		scx_dispatch_dequeue(rq, p);
 =20
- 		if (WARN_ON_ONCE(p->scx.flags & SCX_TASK_REENQ_REASON_MASK))
- 			p->scx.flags &=3D ~SCX_TASK_REENQ_REASON_MASK;
+ 		WARN_ON_ONCE(p->scx.flags & SCX_TASK_REENQ_REASON_MASK);
  		p->scx.flags |=3D reason;
 =20
  		list_add_tail(&p->scx.dsq_list.node, &tasks);

--AAd/J4A5l7u5t+Tx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZM+gAKCRAv73Ows9A4
ieYXAP9fxp35nFCEEtdqbZzTg6aGmsvu3ETaEx2JH3J6twEsnwD/WFX0OlxW+JYW
Ib25LSN5g9TckB263UYu3HqHHg3Z1gU=
=j5I/
-----END PGP SIGNATURE-----

--AAd/J4A5l7u5t+Tx--
