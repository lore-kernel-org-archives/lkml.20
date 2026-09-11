Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DA48423C;
	Fri, 11 Sep 2026 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132887; cv=none; b=sPx9263luNHEpf8DLsQUNZ6IigqDIcSUd7bST/CcTd9SoQLLZNllXm0rcjE3qJOsvrmawuWL1G24I/hBzFgS18BgFWcVbhlYQljHl/2/v0t45ZHp9CHiQiZWt1QfXmr7saJaRCAeNt8dWf69All6p3tpwgBGL6ZhJ/uGGO3QLls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132887; c=relaxed/simple;
	bh=p2qxGS1cP7zVbxoOpZIPaER0eYmJcdUZNyniid6vf/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuxQZ1G3yhcQatF1ej42lYg+68N0QySbWfhAi/fYbXgk6OQrhIMuK/5hIN/YPwdyjUeTzKcneb//BGmOuBf95PL50lH45vxe3FqQsuiYStoJk1z1XKZjq2J8iRFoTAmbu84MhPhB60Y7vm3sPTDr3gE1SpfOJ+BqnSO9kLMzOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjdBzo0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjdBzo0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD371F00899;
	Fri, 11 Sep 2026 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132883;
	bh=uDGa9ugcbovdEyxQU2kdvgrK+ycBCxHLeEwjUwXgcSI=;
	h=Date:From:To:Cc:Subject;
	b=VjdBzo0ORLfobVYzdFwO1qwPaIJZg0d1SOTlghJRn1uOnI6o8yd4Dr8PxSeNnR1hy
	 gr6M/bfyNYfjg0AFaB9yUTcopq0HM1RYY3fab2uJhJa9nYJzw2XlzDALM0v0zfFIPt
	 I+39tHsgKZZ4SHw94N1+Ws90krjVTcT03wfVxqtpIN1wxK+VkrKUGsO2ZyjmnHcV30
	 ufJMyIjnBeVvt6Lu0MGWks2NdgFoawHbq6a6rkfcsuZsZcFWxSghct2ElAGUizEIh0
	 /GXxUt/YdD451MW1AsK2emLbg4MiVgDT4q7UNyJ0rffoTrrg3u51BIhMvo24PpgDj/
	 oSuk4o4ORdj3Q==
Date: Fri, 11 Sep 2026 14:21:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>,
	Varun Gupta <varun.gupta@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aqQATlmEVVr661dl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6KgKimICWc2l1DlR"
Content-Disposition: inline


--6KgKimICWc2l1DlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_pagefault.c

between commit:

  20fce5b34b21a ("drm/xe: Guard page-fault worker with runtime PM check")

=66rom the drm-fixes tree and commit:

  f2b4b3f814662 ("drm/xe: Chain page faults via queue-resident cache to avo=
id fault storms")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_pagefault.c
index a4986df8328d6,2e415995f067b..0000000000000
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@@ -14,9 -14,9 +14,10 @@@
  #include "xe_gt_types.h"
  #include "xe_gt_stats.h"
  #include "xe_hw_engine.h"
+ #include "xe_log.h"
  #include "xe_pagefault.h"
  #include "xe_pagefault_types.h"
 +#include "xe_pm.h"
  #include "xe_svm.h"
  #include "xe_trace_bo.h"
  #include "xe_vm.h"
@@@ -291,19 -594,16 +595,23 @@@ static void xe_pagefault_save_to_vm(str
 =20
  static void xe_pagefault_queue_work(struct work_struct *w)
  {
- 	struct xe_pagefault_queue *pf_queue =3D
- 		container_of(w, typeof(*pf_queue), worker);
- 	struct xe_device *xe =3D pf_queue->xe;
- 	struct xe_pagefault pf;
+ 	struct xe_pagefault_work *pf_work =3D
+ 		container_of(w, typeof(*pf_work), work);
+ 	struct xe_device *xe =3D pf_work->xe;
+ 	struct xe_pagefault_queue *pf_queue =3D &xe->usm.pf_queue;
+ 	struct xe_pagefault *pf;
+ 	ktime_t start =3D xe_gt_stats_ktime_get();
  	unsigned long threshold;
+ 	u64 cache_start =3D XE_PAGEFAULT_CACHE_START_INVALID, cache_end =3D 0;
+ 	u32 cache_asid =3D 0;
 =20
 +	/*
 +	 * A live VM holds a PM reference, but a torn-down VM does not.
 +	 * Guard the entire worker loop to safely drain stale faults and
 +	 * prevent autosuspends from desyncing batched CT flushes.
 +	 */
 +	guard(xe_pm_runtime)(xe);
 +
  #define USM_QUEUE_MAX_RUNTIME_MS      20
  	threshold =3D jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 =20
@@@ -374,9 -731,7 +739,8 @@@ static int xe_pagefault_queue_init(stru
  	drm_dbg(&xe->drm, "xe_pagefault_entry_size=3D%d, total_num_eus=3D%d, pf_=
queue->size=3D%u",
  		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
 =20
 +	pf_queue->xe =3D xe;
  	spin_lock_init(&pf_queue->lock);
- 	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
 =20
  	pf_queue->data =3D drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
  	if (!pf_queue->data)

--6KgKimICWc2l1DlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkAE4ACgkQJNaLcl1U
h9Cmogf/UqYPztpfI+/eAEMB/caWUfvDHCXMkQjwQARXYz5QZTv2WUqxQcX/wmT5
6HjUr0iW+0OI2ZvByw/a3tKy3TBo7Eze+I5EZPNe4mzYgyAmiqripG4fTmgP/Hjg
jOoYCEFghUT5n2G/ye50DTjRQn3Oxa77RByT0gEsS5+1ok/gEDmRHmr9s3JEgu3L
jPRa4thupd61IwHhZrr6wrQT7Yyo39qkbG40oku8sXu+ghLSjotfpUX9aWHWm8iK
w2xYh+TNpEkKk2F/p4Rso90IqAmnTo/iK9Bg0r1gNPAfas11XMAc4s5mHyasW890
EhhGXSA8toJz3mjW7BHyIVDMEqytKQ==
=8q+X
-----END PGP SIGNATURE-----

--6KgKimICWc2l1DlR--
