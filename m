Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8D31714A;
	Tue, 15 Sep 2026 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479168; cv=none; b=Zk+H5L4ZAPRMrul3+7xjXMo2OnF59VL1YAT2VNgfktJyUlRpcK6YKRDb8tt3/gqJHFNvg5nxoey8AWuGUMSsjQwTuxzRUIGR7T/Dhx1oFzBq1QyQoSAqTcZIT2Ej/FtN/dUw3kP0BQYaP67IjV2uiy0/INVCoB/w7/+F1KQgBBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479168; c=relaxed/simple;
	bh=Lzk96gnZr75l/ZjNA76Tt61NDgmSF7Mo3m9GZY9ug1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sz4pLv/nmYEpE5kEn3hXVl9Xd1x47jyZrZ5OsibqfuIPPxkdKEHlEgQ66C3kDqVevg8t28a3XbdgPIgoZ25hrCYiWFT2G26RfB9vU4VL2K8IUk6dspz/C5NbgFYQI5uQSF4p74ijKN2/tH1zARvqVQuxEIvXrJwtrTjE57KkeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHY6mrZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHY6mrZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2760A1F000FF;
	Tue, 15 Sep 2026 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789479166;
	bh=xWyeCGYr9LF4LDsS2gdCg0Ajq/EjfF59Sr2tBkYEamA=;
	h=Date:From:To:Cc:Subject;
	b=AHY6mrZTXgj19+J721KH6Z4w1TlEHVeSbJDrxjyP8i6oRaTnecvZQAKmZjVtgdLRh
	 9TYooCmWrCDIsZ3sK1lA41x58/h7spX+dAzDI/kt0M6tbGO9aPqWGDc4E/wf2l1ZrH
	 7fc9LEq/vCMEF2EWI0wXc25gbD5u+pERUEHS/0VrUCO9sG6cVJ21rRXHW3NgBAxOXJ
	 IbzIMj8JcVZEImKMBdgKPOuxEkCRsXyXBKKBAscbLbA7NyKRqagCQUFk6RlJXSnFrr
	 d81oM2q+YQg50YzAAT4PVs5U4xeUztVIQ4DZQQoSgX2T7rGl62LYf1La4ZNph8LS55
	 sJDCFXcjEHhwQ==
Date: Tue, 15 Sep 2026 14:32:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-nonmm-unstable tree
Message-ID: <aqlI-2jsjHQlyzf8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+y9bBoJPGle1ID4r"
Content-Disposition: inline


--+y9bBoJPGle1ID4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in other trees as a different commit
(but the same patch):

  0669a7ed8b3bd ("tmpfs: fix unicode_map leaks in casefold option handling")
  07b9bed89f7d8 ("mm/damon/core: allow esz to be set to zero")
  09a2c8a46cf62 ("mm/hugetlb: do not dissolve gigantic pages without runtime support")
  1651388e34a34 ("mailmap: update Haowen Bai's email address")
  1a205dbf317b3 ("selftests/filesystems: fix missing and stale TARGETS entries")
  1ff1504af83d9 ("mm/hugetlb: fix max-only subpool accounting on alloc_hugetlb_folio failure")
  215c3667edf4f ("mm/page_alloc: avoid direct compaction for costly __GFP_NORETRY allocations")
  4338e1bfff3db ("writeback: report a Tasks-RCU quiescent state per cgwb drain pass")
  566380a1497eb ("mm/damon/vaddr: avoid hw-driven pte updates during damon_hugetlb_mkold()")
  58351654bdd90 ("mm/damon/core: reset invalid quota->charge_target_from")
  6911032b06ce9 ("mm/damon/core: fix unconditionally skip last region")
  6b932f8d005df ("xarray: fix index jumping backwards in xas_find()")
  70a39f9ba9526 ("selftests/cgroup: account for zswap shrinker writeback")
  75b41adb019c4 ("mm/vmalloc: ase dedicated unbound workqueues for vmap drain")
  8b55674a670d4 ("mm/rmap: fix missing barrier between anon_vma init and vma->anon_vma publish")
  8e29ecb3d09db ("ocfs2: make ocfs2_calc_xattr_init() return void")
  bc561f6eb5976 ("MAINTAINERS: update Xu Xin's email")
  c7c6a963da705 ("module: fix lost error code from codetag_load_module()")
  e1efb6f8f84a0 ("mm/damon/ops-common: use a page-aligned address in damon_ptep_mkold()")
  e43fba36fd075 ("MAINTAINERS: add Baoquan and Baolin as MGLRU reviewers")
  eddf1f80667e4 ("mm: shmem: ignore sysfs configs for shmem forced collapse")

--+y9bBoJPGle1ID4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpSPoACgkQJNaLcl1U
h9Ccugf+Mf6p1YR3JbYxzcu16X2c5+H9KXemr8k2rLWcaf+9amrKD/WpP8dZx83V
bGwt/BDJlN25fnX6/t6QeN1ij4K4H21fr16s97dFz/gCf0/GjaczYDquMS7RKmfS
qMVAagnKV+ufgI44++JLAKAoTLBhfv+CUANHejtbj1fCa81T4/R9QF7ahnh4qZne
uBSNONusvualOuxkMfoPRpWVNW6wK5NGybYOu46wr4hQClg6qO3tjhwHcH3EOOD0
Oj6ycRpnyIp7dc+JhDoD9pwyFQApoTBw10zQ/wXBKpBRjNyztx/fBdxRidHDv+hn
7hTNuqD+tbLQZ+Gtfz7hx4VtVETVng==
=/GIC
-----END PGP SIGNATURE-----

--+y9bBoJPGle1ID4r--
