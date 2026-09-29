Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971F5012AF;
	Tue, 29 Sep 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679854; cv=none; b=T5hT9xK7Xjd1fVwUpZ4xAms9Aij1B8NgrrSEpacLRksaok2AA7OkQb8cqZI4pDfTxqZtgu6K+8tOZVOufKSyOLorSoXwCVwFszNVNOYOAmdBGn12yYJhwGaG0oov48VXBswMlX//JTSPbxyOQ74hUVo4Z7LQgHefXRvRcnpY5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679854; c=relaxed/simple;
	bh=s2WhwZ+nGtdj8d18CPvmqKGvmV/NViYAVXS6dctkRYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SbfTz4EJlmv/0LMwkyDz11qvoHsPwlAuBhkh7WQxpHS1FAEtFG3djgDXAfz+5OSpDJmtjtnUSbxl0OA008xBEsJbP+cFYTyDGrg8wWQWu99ozv5ZuICtZKw21V+bOJE2a3+r/Nn87/jQO03XBcdk+1CZqYLNzP9en3S+b6ukRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMgFZBDO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMgFZBDO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C9C1F000FF;
	Tue, 29 Sep 2026 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790679851;
	bh=l5JUeCTtHPn1GvL/VgOcMoEX7i+Bh6wrpN8i8JE1rIY=;
	h=Date:From:To:Cc:Subject;
	b=oMgFZBDOv00C0EIMYwayA2cw9ZKwkSD6xw0+NuWGKmFQMPdZSQ2o4p4g9zIUMIQLS
	 xq8iF6Hv4IhlrB0IDcMsN/ONuuhYMBoxZgBACXkgl7Q2jEcbwZ5cNHpQdbRnsDcGJQ
	 AVFN6Xerc0rgA1IbCbR4m0Ch/b6zEKrblnuyiGZgmfZvw9TQsZfvVAEAQFipaUO6aH
	 xgRkZ5htEyls5wTPwkjLYHNqS60qJvGtWvxXaqOByUs0VhERBz6pG2u45fMtEIs0qb
	 /J+aGVDPe+EcR15juzoBn6zAg16GFs18UTtltpH8IqyPbIRppaXEDDaStP4JzdQicP
	 eoRTI/bwxcBuQ==
Date: Tue, 29 Sep 2026 12:04:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 28
Message-ID: <arubKB8g_s_g0NjA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tv6UObsM+O3wKxz7"
Content-Disposition: inline


--tv6UObsM+O3wKxz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260925:

The hwmon-staging tree acquired a conflict with the hwmon-fixes tree.

The drm tree acquired a conflict with the drm-misc-fixes tree.

The drm tree lost it's build failure.

The drm-misc tree lost it's build failure.

The tip tree acquired a conflict with the jc_docs tree.

The scsi-mkp tree acquired a conflict with the scsi tree.

Non-merge commits (relative to Linus' tree): 10427
 10844 files changed, 587151 insertions(+), 201979 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 430 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--tv6UObsM+O3wKxz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq7mycACgkQJNaLcl1U
h9CHaQf9G3tVW0TsLpox9ZfOJeh71emBnZ82e6cUXo3G5A8hqODeQOrwjbmy1zhK
QtsUUazeEjeeE2X4lXXmJ9WISUgs/GvBrSX3fIYI1Qik/dBI4N3zatk6AMqtd8Fz
izByIJO/JkzayWp1sI6lG6N26/7YckoP6OsGeHS18pMKQVN1vsK3834N6sskM1rI
7WKNaHsLR7Bs9AFZzvuFFtQAb6JjIb0vH6axpnO2DmPFSD6WzyFERlbRpzqYDPN8
CYkq1BBJUGi8uZ+Yb5HtYhROTEk+S+7vmDXL0SKWftVPo+COJ4ol5lSL1gKsEnjI
yW1sfFwKkmKboGmFewt4daJ1IjrZmw==
=+yi+
-----END PGP SIGNATURE-----

--tv6UObsM+O3wKxz7--
