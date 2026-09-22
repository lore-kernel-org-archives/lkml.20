Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BF53F6B6;
	Tue, 22 Sep 2026 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084212; cv=none; b=kZ28pEuGNYh9N/+RnFovG3V7WWSrWSZEtDq2Jn/Muzg2gqMzbuli3KNqAXYgZW9TGf0eTZUbvk1n8A+BXcKOqWK08Ku0WUMREm++LEc5K83/mcT9iREWMkcDGwVFSfAJWXyE0nEgEVvxfhJr4SK20YY4ZEpfokQ+FlFgMXT8WfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084212; c=relaxed/simple;
	bh=eNZBh6cHAEDzKuClRS5BIy5Td6oZWR8mnoa/ob8kFJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtlRJk8MAGXVLknf8623nHKcbq1U1zMY4US8SSwD1dmfggZxcNeX0g7E1zkdtwlELMRSz+4Q3V+buonkdh5qeWLA4/3IwmcV5ijrVHi+Yg0vCbWqfq6YR34Sw3jeDOFaHJqdtYQUN9FqNPenu9PCzuqWMjszLGZjvSNI28pVzSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOiV6vGo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOiV6vGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F481F00899;
	Tue, 22 Sep 2026 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084211;
	bh=6iwpa6YmjIFtqVzmnXXYjuXs5akIU92bwSKTfxNZMRk=;
	h=Date:From:To:Cc:Subject;
	b=BOiV6vGoA3PR18TxjTsAU7cJAf8ki3Qcypg4koPXO5JzGf3/bjmV4LatmE3eMT/fK
	 r4aeTkg6RY7k7fFSf7awJsq9qj3lo4Eb7STNOd078LZrHIOp5uO3OuD3K6gDT7ubiu
	 cKWZAeFI+Mi5fvSs7yZ6fhaFUKg3dUe5ddcFuMXg2NBRO6uCSosVlc1ZVGo6UOfmIy
	 pElCD1VjTjT0L1uwceJbhriCz17Lil2eN/TdM9LAQoTzEvbgrKkKQOMLQGoth9oXCc
	 Uof/OghA7KXI9gz5K3wUb9Li8f90VXOG0BawtgOzluMfU5465/doNDc6GiymN2X7Al
	 JkOnFQbK1qcXw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9CF681AC56C0; Tue, 22 Sep 2026 14:36:45 +0100 (BST)
Date: Tue, 22 Sep 2026 15:36:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 22
Message-ID: <arKEbZQySYcnkScl@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cJhaHlhUxtXFDCKN"
Content-Disposition: inline


--cJhaHlhUxtXFDCKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260921:

The nfsd tree acquired multiple conflicts with the nfs-anna tree.

The cpufreq-arm tree acquired a conflict with the pm tree.

The net-next tree acquired a conflict with the iwlwifi tree.

The bpf-next tree acquired a conflict with the bpf tree.

The drm tree merged the existing build failure from the amdgpu tree, I
used the version from next-20260921 instead.

The scsi-mkp tree acquired a semantic conflict with the libata tree
which I fixed up.

Non-merge commits (relative to Linus' tree): 8044
 8597 files changed, 452932 insertions(+), 146409 deletions(-)

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

--cJhaHlhUxtXFDCKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyhGwACgkQJNaLcl1U
h9AOfQf/eyHVYPYEW86A2C1zhaulOQkd1UVP0JpggjNsiAPKFJqGDWEwib9FQIAz
ThayzXQm0pLdfDkzjLJ59rUj3iTqWjBOsETSUDyIQHjP5W0zCK/ZbleW5x+8SSgo
nMTXE4scbpDX7npBARb5EACLGb1Q1AzGHSLJZuKJzPRLgEuL0cwCpowSAgm/WTCy
8E+s5OrpZmwTOUZTCEPmx6c33pAF0HldyfwfShSHsB0BIeDjb+HO4hioQobiWJuo
JSXI4k+ojzpt7pfYeyaSWitVO034wJBQxnQYPUT9yUaxe5D8N2z5ckcTqeuVFxAT
BaT5rDrTvf41GCyFl3xTFwM7EwjTyQ==
=oasw
-----END PGP SIGNATURE-----

--cJhaHlhUxtXFDCKN--
