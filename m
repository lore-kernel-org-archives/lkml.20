Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A311235B137;
	Fri, 25 Sep 2026 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354552; cv=none; b=YqC2zNVwCjwVqaSdepGm0OZuJqOwlO9mqjCxgjF9JcVka61Y9diGZG/pRX+gJkXBFxlqcP4bKWUC5D+9jr/ZngW7v5TDf331+ulx7IJvhDrAGlAJtuUfJ3p2idndJrYCvAnE/rQ/cMUMpQ45eyu6tgr7gIhk5St7YU/K7AqnQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354552; c=relaxed/simple;
	bh=koy5+F8nTJaHkAqWlV/xSOH+EDfL6/R36JtqDW1/Wus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZL450rCQ5zvddAl+hpLrEQgK/Qkhau98JSDT+Hr5y6M19E3RnOycKh+L+RDTlOh0/KWn09He6PElgpm0/dBCoTnwyfsU9EnGa2mgU/fc3o4ia6+SYijEINQgfm+llXjJuzX4Fo4cifC2MIElm56iy49FEa649uwmGKFwPz1imm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+hh+g3l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+hh+g3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9751F00893;
	Fri, 25 Sep 2026 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354533;
	bh=wuC7EGNgA5aYDHZ0C0IXK2Psb/V+bwgwhjLSTs2wOto=;
	h=Date:From:To:Cc:Subject;
	b=U+hh+g3lVACph12hTSn1MhorogERZWTMgxVoHHt5N9ihOLsijoLkuLSUimmIiGlnF
	 6TYVzq+LSHEqWypOQUiLpd+QmWSZstdDM20JDCeOvzPLK4U2MFew2ocuTEiWX+94g6
	 9hQjVi3Y62op0w06iQKIQlpFWCO1S09VDsjQuXxZtH2A3OeOSc85sg2cB8Eho2bcaf
	 9fOMFtBjg/C63jjSmC4GkGVMlQC66v1ayv1otp3jBsXmLQBdJvr1e6yY7kF7OTv7HG
	 i1nsF5+x79GNAgHKN7bdDzAdXEG9hAgEjvINxuIw3yoZrkj5CndiFhl89MMa1/5aOs
	 viFOgLw5kytPw==
Date: Fri, 25 Sep 2026 17:42:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 25
Message-ID: <arakYRakf27RgCok@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K2WS7Jo0HYoQDh46"
Content-Disposition: inline


--K2WS7Jo0HYoQDh46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260924:

The arm64 tree acquired a conflict with the mm tree.

The qcom tree acquired a conflict with the arm64 tree.

The arm64 tree acquired a conflict with the mm tree.

The qcom tree acquired a conflict with the mm tree.

The uml tree acquired a conflict with the mm tree.

The amdgpu tree lost it's build failure.

The tty tree acquired a conflict with the tty.current tree.

The gpio-brgl tree acquired a conflict with the gpio-intel-fixes tree.

The pagemap-headers tree acquired a conflict with the amdgpu tree.

Non-merge commits (relative to Linus' tree): 9541
 10060 files changed, 529974 insertions(+), 170918 deletions(-)

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

--K2WS7Jo0HYoQDh46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2pGEACgkQJNaLcl1U
h9CW+wf+MZGA/jkjS/5WjwKkbGd7U5j45eW6BvtE1GoCMLwerM9rSyFnA4tYDkFf
/Wf5BGK5Z/JAQ2sfqOhW8MlRJsZv/f/TLzVz8kc2mzQCdFYywBg1bts1QBuS3Fo9
fSXJTJ4oWUfMAav7m06A1J0urNmVms//LHuQ4WpR7KTI8rG97/pDY0IIsWo3Z9Zk
rtVesGcUels7i6a+rqKyDJa9XnBlaVQu4Wo5pUo123HhUzEDY8obAtt7xZ/PvIi6
fMmMBu8UP5Rggn/5XOhqbcQP3G8SPBjmCdFeiyC4hXvaLr5OOBoxvpBvxGuxD/y6
AnhST5v2AiQ1YO5LZQjxUa98CRDhZA==
=VkKs
-----END PGP SIGNATURE-----

--K2WS7Jo0HYoQDh46--
