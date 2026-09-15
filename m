Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04A4BA1DF;
	Tue, 15 Sep 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473962; cv=none; b=QvjZ9tHGJqByqhB72gp8LlNNrKW2CaMXt00NaTr3PZaE4LMOjVukHGBEY9807mQ808foQWK3bbH3oqI0s7MxJwvDZ/rvySZ3gGiQS/xIJlXKEhZarZp8Ms/SKcKaw2dXTRl4/6XdEuLw/7ekLAmq6q/6/+QduP/8Qd0JY8XVDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473962; c=relaxed/simple;
	bh=GI+D3/UioFA1vmXDleie0Ud/k6yZpdTypn47Lnidi74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBTLevVavuH+1hG+vLtvjBi4sEHosCkdjEaWX2W3Y+RWbhP4gtUKdhpMCL1d02k5S1GXrKijG34gEIPHO2swfL8j8QNGiKGfXCViPAYH/OZOVR8qfrtBavhyfbTaYDS8nDxK6xt7aJ2dT2BBBoNwM9Crz5GcHbe3F+8TmVLFAW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Javh9Ln8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Javh9Ln8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DA71F000FF;
	Tue, 15 Sep 2026 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473961;
	bh=1XFNX3yDmLNog/1MzVVAa4tFp5wsYZm4XoypdmUjiIg=;
	h=Date:From:To:Cc:Subject;
	b=Javh9Ln8eqWY1lG5OMNndnu7PUClqjpTDuhUCRaFWHSvVmfQ7gS9ucPsbIeincw2d
	 zU5ngYLYlvp11wLWNJ3fuhePa4Rp0jqUshQVvpAUUtfwgTd33qt7w6jU1+18MvbLJ1
	 aMccw5QR8liipFCFSXusb3Exa57ObjVJ7oYEaToMB+zjnPZpuSBeRA5ZAT9WH12ANP
	 YQLRDXK7bpStrftJPSzHjNgh+f5t2U1yG8N9HKrjla7hgAbm4XBMEM3V4bTKBzroxY
	 IditqRqSvy7koWNBAUXNkucOQAaA/SPqruxZnOFfVemcNrFuTjNswQoS78U15YI/0d
	 8ZZSl5Nqz4y9A==
Date: Tue, 15 Sep 2026 13:05:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 14
Message-ID: <aqk0phAAAHFHxX00@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gj/z9fHVtCRgQD5R"
Content-Disposition: inline


--Gj/z9fHVtCRgQD5R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260911:

The net-next tree acquired a conflict with the net tree.

The bpf-next tree acquired a conflict with the bpf tree.

The amdgpu tree acquired multiple conflicts with the drm-misc tree.

The security tree acquired a conflict with the vfs-brauner tree.

The phy tree acquired a conflict with the usb tree.

The phy tree acquired a build failure, I used the version from
next-20260911 instead.

The dmaengine tree acquired a conflict with the usb tree.

Non-merge commits (relative to Linus' tree): 5814
 6145 files changed, 320550 insertions(+), 91662 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Gj/z9fHVtCRgQD5R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpNKUACgkQJNaLcl1U
h9DB6Qf/ZRLLWXooaQWdbeb3d2GTNs4uAIVYNCGjN8eaGNYhbXfL2XmJwWH7aLJo
poia/aCgdBcyXpEFMa3r8gf5XrytaQwM+9fWe7CS18M4RH2/BhdhhVPkuwEI2eiM
QMNr4OHt3zoH+C6MjEF2DNFqei26LmP+ebQz6l75MM77Jg5+NDYQM+MV4XGB5GKS
+gND8Zua6MP/4RE53mJZwmNorEd1vxILemB3RDnou71uLZZ9XsmZePBD23m6HN4n
KgJMbjDVsVWokrAdApWl1+v5abU9bnT5zG7BZ6SdmbxOIgzsdTUYPibhjnwnYHBB
fK56NtWs5zKQrYlQJXephKlGfMPKbQ==
=5REl
-----END PGP SIGNATURE-----

--Gj/z9fHVtCRgQD5R--
