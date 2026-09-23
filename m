Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FF752CCC4;
	Wed, 23 Sep 2026 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169929; cv=none; b=ugI1bAme4QLbmhleDzl3WTE/axn6PuBdKQw9qrgOS9/MSip5EGkL4b5HyIUjv7ksgOpl8eXdEXV/ILmpUQ/fIB7l7bSMtN1EBGNJW6wOJVDYwi79Bi6IlfDtoII6k0/hmH1FMVIK1B5mBHMOdnVsEFQ0bnII9HaiVL8ujttFps8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169929; c=relaxed/simple;
	bh=9aZzikd819n7ah0HgFlOZiZPPEbx5i4A3ezCtLWd1fI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln8Oet5ggkbi+6B4QySFAfrlBHwDka2i9WubBR9bP5hMLV0NAPx8sGRNRMRKIBpmNndOOpuDFbfak9VZTVqn+EYkWWGHT45Yg0lJkfkIIOArW0vMK90h8YwDfcH4aKF7UGVobi+g+wM3rMaPOF+rCKHwKhyZUeJXpQnaCCn65/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv9+vQJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv9+vQJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00C91F000FF;
	Wed, 23 Sep 2026 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169928;
	bh=zlWa1e2jWcfiiYfu+fJY+2gOtdAjpcg6EpsI0gyoG1M=;
	h=Date:From:To:Cc:Subject;
	b=Nv9+vQJ4X1ZPR4LjImDulZSo8D7/jmLZDpa9NesjKRqgcJH9yrUPZXyjOH1hXpFrg
	 Esif4bWydfMzQOEVLOZgkL3cqqsh5VxtSKP/Lq4lc+tLG+4z3i59TzjSMQdkx7gIM/
	 6m546sdQTDrcbxXaiK7Jl8+rmgGsjdizMLCZdt1MjJOfRf5wn2El1q41PUj/fFQoTO
	 FsKUuiZAIaaSukQ+n5WXssbE7bqYiBPqQD0AKafVWiCMr9snimVBjIyK37RCtyYAu8
	 koaAZJ4Ba/XnQHAvezbFhEMyHKrpaDDk+aRwq2SDMSHZDOsyyqUwAJPb/stjY/oeT0
	 VtmjT+x2oQHAA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 033191AC573B; Wed, 23 Sep 2026 14:25:24 +0100 (BST)
Date: Wed, 23 Sep 2026 15:25:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Alex Deucher <alexdeucher@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <arPTRF4qS6o1Q3vD@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4iB4BPRsdxcH5TP"
Content-Disposition: inline


--u4iB4BPRsdxcH5TP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:8=
7:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_poo=
l_create' [-Werror,-Wframe-larger-than]
   87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t si=
ze,
      |                      =20

which I am exceptionally frustrated to see was caused by commit

  bc3f07516a992 (Merge drm/drm-next into drm-misc-next)

which merged the bug I originally reported in the amdgpu tree:

  https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk

and then in the drm tree when that was sent upstream without the report
having been addressed in any way:

  https://lore.kernel.org/r/arJoCiRM1hRbgRb5@sirena.co.uk

neither of which have had any response at all.  It really seems like
there is some room for improvement in your processes here, currently
that's three drm trees all held out of -next with the same fairly simple
build issue.  Can I suggest at least check to see if the code you are
trying to merge is in -next, the drm merge was done after amdgpu had
been held out of -next for several days.

--u4iB4BPRsdxcH5TP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz0zsACgkQJNaLcl1U
h9BLTAf9EIijiMYDxEApkxScDx3f4Bi3xFEdhyaF/pQC0o575r2k4NOF7iZA3cTA
Az6mwVvR/OYFKgiWlMud0jcrwYH8F3oPL714/AlXxlrkGQFPQlHrjo8tk+DdWJoU
RX3gZP7VDGoNe9Ag20ZvcFUvUyPiBSp5NJENkGwaEBLzYwnmBjPluldBbHJPQ5Bh
D/HK0N+S+HWHq1/d8Jvbo9yaUKg3ZM+hNu37MMQjCuXCLREmwpfRg5mVtBwk99aI
jkx9SxUnZ665U0cPxMYskag0aiHxsdbDqkKXhafCLVJRooZpSGvNtDmbPSnl25rT
9N0YB0GV4MGYCpWVkpKIJUFaoCyqTQ==
=c41z
-----END PGP SIGNATURE-----

--u4iB4BPRsdxcH5TP--
