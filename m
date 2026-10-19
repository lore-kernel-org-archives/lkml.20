Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429306;
	b=g+ezLsBk4tshC1vw8FjZNpRVN0AEVKjfLy4Z1lXQfrYHp6eSpyv5SX/HUQfSsBtnmsJE
	 xqS0l79pG5/qrd+B3z6+RfgWPbR1SeO7csbWQ2UFXYLFORgn/geJow/VLZm4+YvMFVGCP
	 u70e+aHfKfUH30bRqL4ON1n61FaNzhsFX+m30UQmEBCxKOYPwTHfSAq84f7MKXwDYSdKu
	 RIFHLLLikIHA+8MTZV7zaTFdIGV9lK9rB3sc1O+7DoJLbRyRMsl3lOReO4GgMNZMgw5og
	 ZIVmZ1yfeRwUh005+UwJ14XSRBKd2PpWoVbg56cWqOQC1dsimj3iFOJLgd72r9MP8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429306;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=d3tuAwqgxm78om08dBoibwah49ttD0KiH8DxtWjz9Tk=;
	b=EIY9tnyxfao+9eUmokzEpZb4glp3EglquhbOCgBO8qO1lwqBKt7r0WtLc+okp0T6CCyJ
	 CydzanpgRKoIzXmpECGurVR8MyQ95r2aw05w34C+IT9VSgIYDkkz4HbojYCthOqHr1uvN
	 w916/+KvJo5SKoZkQ9/XAz9X92l9oq0CmLKZqux0LAaxCB56n/bpS98cfWEGHtRyDHdaH
	 2PA5GRa39CC0bvcWW2GvtYm9jTavdxnlPpL3CJ20NCqoIUs/wqdU/3JHIWO+t2hNcNJ5s
	 FPQXwT301Iu4PI/eTsNz1B189PqkSwQjh/bVlX8sWZsEVGUs8ed9Nfh1K2voe6MTj2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfEngfUu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72E606A31C;
	Mon, 19 Oct 2026 17:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SfEngfUu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD3E1F000C4;
	Mon, 19 Oct 2026 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792429304;
	bh=d3tuAwqgxm78om08dBoibwah49ttD0KiH8DxtWjz9Tk=;
	h=Date:From:To:Cc:Subject;
	b=SfEngfUuHmlHsqe5pHfHVS5g/qqmPdNQOpmm5Q+9NgPGj5sTOcLqPC9nFozRAv2LI
	 dW322VoJzz/qX+vsgAZrACPd42t0oKhFIfca3+PJLrdJASraG8AHgfBWUyRhZPc6ri
	 hjI616/D1HayEAECfrk8vCvHBvXQedxrTpnsKoqtqcvZrNykG0nsJ3PigsUXTdFi3W
	 ODjHSNyCt7Jbz4zvMrDywZMHMAeb5UcQlfPrzrjPebSZ9M7y98r0J7S4HpdtIMdZUQ
	 iksjKzWFGRBZg9U7aFKVT1K6y9YohKz3bB+w4eOH28rdLsxRHeZIzCMX7a57svefEP
	 lIKpyicFEwzMA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8221B1AC57D0; Mon, 19 Oct 2026 18:01:42 +0100 (BST)
Date: Mon, 19 Oct 2026 18:01:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Usama Arif <usama.arif@linux.dev>
Subject: linux-next: manual merge of the sched-ext tree with the origin tree
Message-ID: <atZM9nFiaMvuX9kP@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="reON6mJP71M0PGJo"
Content-Disposition: inline


--reON6mJP71M0PGJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext/ext.c

between commit:

  2935062be7711 ("sched_ext: Wait for SCX_OPSS_DISPATCHING before moving ta=
sks off DSQs")

=66rom the origin tree and commit:

  efa7bc7d71955 ("sched_ext: Avoid relocking DSQ during remote consumption")

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

--reON6mJP71M0PGJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZM9gAKCRAv73Ows9A4
idGMAP9XsDqEnoN6Dji1IqXlETCpznENaH1bsaWrcSW+j70m4AD+NjgrttKoqX0q
qs0m+l2rYoqnUtMGYxAeMAD5ZkCf0AQ=
=ljde
-----END PGP SIGNATURE-----

--reON6mJP71M0PGJo--
