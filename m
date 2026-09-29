Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA752120C;
	Tue, 29 Sep 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694239; cv=none; b=QGdEQSINA5mMDvPnp5N77Go9aKZdeuHfpqnXG8f0Scp1waqW4MZ4ibDhPmhnxNFOZJiRpyGW9F54mBerNzsKzHpkJlKSHUj1CbuBoJJMWe4cDF14qgJRCBHNYlY33bsxFgrD8TuEYAJe/DnQbQNCryyhmv3rx+yw5iJ/dasrzSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694239; c=relaxed/simple;
	bh=WaXKcasx1zPtgDUCMIWSKVCSS6YKjFzv63033xnjo/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRgMadeDRWZ9MffedSj5bo5+QG+pzJNsJXj3QTLbP51xVe042D0JwN+Nr8QBaW376S5871ogrqgQYoSVB8sHQ81P5c2IPJCENYH2OiXGr1yYI0xF8z1Pmo4yhAfQhzXEVjYf0pklZmmvYU6X/XaHEBx/ULVLZ+j6Nzl1YhfrHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ib49nVso; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ib49nVso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E800C1F000FF;
	Tue, 29 Sep 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790694224;
	bh=w+du77RpD5Dku94/DfThISuzR+k3i9B0QTaacDqh74c=;
	h=Date:From:To:Cc:Subject;
	b=ib49nVsoB5GIyLxx9V83HQd5RYb4IS7nwDzfjuO2cSHbfypD9g9Xy1WOXYSOINMXQ
	 FboFI1SAV7JccdX3peJTgK4QEn/+AFUATVfJKnjseB8g9aE4IJF5n3oLfIGiU4VjnM
	 SUUVgP6xPeWqJYQyYet9iw16+F65ww/sXkNt142MlbyqUi9GHRlIXqyK/37GJXFLml
	 y2rZGW0lLTun/jnXzgvlKIhL8Lnvo6FnxDLG0oCyC8MIrLT10pQUFbfRCwq8RKAxQP
	 TyoVGy+FC0eSYXB3pz3V1UBt5vW6UWCmJ7HRVJIoab3d3E5+4uaG1wNP7OgkZ/KALr
	 RifZjgZg3btSg==
Date: Tue, 29 Sep 2026 16:03:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 29
Message-ID: <arvTTZ5DDHpyfmUX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tCj8I6rAsUis+mI2"
Content-Disposition: inline


--tCj8I6rAsUis+mI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260928:

The configfs-rust tree was added.

The bpf-next tree acquired multiple conflicts with the bpf tree.

The drm-xe tree acquired a conflict with the origin tree.

The gpio-brgl tree acquired a conflict with the iio tree.

Non-merge commits (relative to Linus' tree): 11014
 11334 files changed, 618644 insertions(+), 208239 deletions(-)

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

I am currently merging 431 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--tCj8I6rAsUis+mI2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq700wACgkQJNaLcl1U
h9BN/Qf9E8wisE0nKOFWaBJoKOs5O/7HNuxl0QOFkzRompGmKkqSEp2k2bswf1HY
Cz3ZQ/mgWPtiy9S5nBfWrfQcvX79yyzDwG8TqgabWsU2lmQUB069ekQ6wFp/1ZIP
GiPgRNVbJrHZ7KMR+KWxaqAaMyq2xCBW+0dHTt2oL5jSQM8eZwMUkbNuqX+HpeXj
5+0m/CnkwaLK2zGsQFyPjuuZ4fmUcdvCA4vBSBC3V+74dJi2x2e7MIAep3rmIrKw
/8eCz4K6bXu3YGSFbyjqBljfiPlHV2H5zsvVG04+cqwGZQC/VBn9b5zFF+/bsSHI
NdFxH1qXspcQ4Cm+fCMP7hFqszQQqg==
=tNRP
-----END PGP SIGNATURE-----

--tCj8I6rAsUis+mI2--
