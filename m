Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5E4D4880;
	Mon, 28 Sep 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603937; cv=none; b=BThiNeIO3SrUl+Lgt/gS2hId0cXNKbm+uk32WLtBbZ8SSddmHdEL0NDLRexPb5T0syIcVJi2+6MvPbnJyLyZnDxnzySfDbsYJ+lMD3N8xtufz0LG53k+4+MZqc1nWoZrRs7DSX9anCNRhujTmaejIRQSnHYIYeIGyCKh2SVrQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603937; c=relaxed/simple;
	bh=OS4yM4XgSy1xTdcwoEeWwTj3hR8RRCUz/718GOBUYDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jeNHSM85rNE6O9aQ098ALYkHbzJHX4UGysQ8nQekRj5dMpYkZlzMscrc81th4CUyblVO/m7pwQzTkPqKUFi937cDfndsQ9pkrOm9ct7WBUmyHNon+10WJhfnX/0f8zdi/jR2QreK6fLeB/uunmFRwf4I/1sz3URTCBxoFKVzHFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwaDPGWI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwaDPGWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CDA1F000FF;
	Mon, 28 Sep 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790603935;
	bh=Y9gF2QHFrIunHsm3e0cHFAjxLQmqCWdhgegmSR+iqFY=;
	h=Date:From:To:Cc:Subject;
	b=jwaDPGWIep2ceSrvXqzNKfHFjLGNihW5JE0ydg5oDlwIUAbITh2IjNpMuM7MmT15A
	 NPVmaFhm05K8hGHBZLzV9RnXr7RVCJQq9u/mGeIKXmS31YGDegJrhP1ZJIq8vJyyRB
	 Wv/j2bMA01qXXpRXa8z/Eolw0U9OECUBah/wGbTD2CaCUZIlE15o5V/1GyvGvEOoBP
	 mpV3ngKGhC4WWCuIfoHejFUPw44uHWepV23WQeLJL0YTGJgo7zGwOPXIqU/WfXVABU
	 lQn2kDpTiV1Ta7eUjM8AkBi4gKOSPRTpwS774RMNZTbI92VJK6HeK0vY1Eg30xy17g
	 R+nDjdEkxBTNg==
Date: Mon, 28 Sep 2026 14:58:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Quchaosheng <quchaosheng000406@163.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: linux-next: manual merge of the tip tree with the jc_docs tree
Message-ID: <arpymyOST1apXE25@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EYfPmxePTEo0sxBX"
Content-Disposition: inline


--EYfPmxePTEo0sxBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/scheduler/index.rst

between commit:

  80c2913d0a06c ("sched/doc: add a preemption model overview")

=66rom the jc_docs tree and commit:

  06a49ef784acf ("sched/docs: Document cpu_preferred_mask and Preferred CPU=
 concept")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/scheduler/index.rst
index d6d75421756ac,a43647b9706d9..0000000000000
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@@ -23,6 -23,6 +23,7 @@@ Schedule
      sched-stats
      sched-ext
      sched-debug
+     sched-paravirt
 +    sched-preemption
 =20
      text_files

--EYfPmxePTEo0sxBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6cpoACgkQJNaLcl1U
h9CiEAgAha5QjThwylOZbYzW7iDiC7/oxYCyP/Qa5jQQolhUhuLSoAzmQ+s5Fr8k
X39BzjVesnvZrpuvKWUQgUtS8Mpi6uYA1Azici50fzCNHogGVdZMzwPamWpqhLsH
xOK2s/uIipDOV9eG+9gMCLQEaiIA9BFcZ5J+yJUJw3KSSioCg+FkAIPIbJd/tpVk
A+1L9bXg926W1NYzIyPtqRVKGUz6rMczHid/90q82BUAAPg6skQTrI9v1ylSkiOf
cPO8lDfC5eIlytxcRvKGt4OHJB1WNZ8n09IBXX2JYYpeiXtc5WR8LsmZP0PEWLKa
MZFeKomx3QoB3TdC+rs6t11eF56T7Q==
=0Imi
-----END PGP SIGNATURE-----

--EYfPmxePTEo0sxBX--
