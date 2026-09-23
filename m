Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62AA41442C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204809; cv=none; b=gQMHLrp9RolkNyiKd2JOV8HjGLQYhkWaPhjmncndbf0C0eU9sri5s4Z7HnlRmBx4/ZNm0F+bHn6ALsJHR9UPRJ+uZnX5Z47sBztD0NQId7pZDIpqmH5CNvJuvFcuxqldOadGmKjjyo9uEKxtl+cmd4PBQtxLfH4l8h/CbRgxjE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204809; c=relaxed/simple;
	bh=Nc+ausGBZnDdVntlKZ4uK0lP0ER048RLxsk9x85Qgrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WEMbBM7CPkZmId6nPAbZsKVpafuI0zN7uMIHm+S6qkvFv95pPKYYt18Nv3I8kXfhOHF9IiYifokSE/LBO/hlkW7MkUnCq9rvpch/vHcYvPuT36Xlws0/8eAAisPZy5FiRDyF6/3ksVzMtiX2/nBugMHpwME/TV6NHQGvBsizI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzuHD4Gf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzuHD4Gf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E847A1F000FF;
	Wed, 23 Sep 2026 23:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790204805;
	bh=WZdmhBqOMuKYNscPsuUbYi6tP3G80UEN5EI2cwEtmR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzuHD4GfgdAkX+OUfQZ6s7tIgAQjGqlqG7OhOna8OhvbMDSeHf6VeKfOHVcSh4/tm
	 8XIBmh7+Vx7lTluK+P8eFyYsACVvqdN4LsDY+JRyF+2WvXMocelVF+MBLGwxj3HUmE
	 tKi+7G74HzQEWKKQQ1Duf93OfrGeAiWU9A2MfKgNPir+AR/wFXQ1mwAF00nZpV7674
	 2tELmsn+Tn/7ooLIyS4NPUHqZwOaHCptdW68CGWV1EWC50i6yX7sjcech7zZY4Onpm
	 UfjrFl+wjzhmL5Kh261xy7QdpWy10OiAZ708xw1p9jqE5xAJ4nCdpAu9KWJry3mpRZ
	 tCaljRNJprcWg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/6] mm/memfd_luo: allow preserving a tmpfs mount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Hugh Dickins" <hughd@google.com>, "Mike
 Rapoport" <rppt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Alexander Graf" <graf@amazon.com>, "David
 Matlack" <dmatlack@google.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923224408.3745689-5-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
 <20260923224408.3745689-5-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 23:06:44 +0000
Message-Id: <20260923230644.E847A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mm: tmpfs LUO drops group quotas due to incomplete USRQUOTA check
- [Medium] mm: TOCTOU race allows unsupported ID mappings and quotas to byp=
ass LUO validation
--

commit 20e62ff0b162f0ffc76cd0d972cc6c760a83d003
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

mm/memfd_luo: allow preserving a tmpfs mount

This commit adds support for preserving a tmpfs mount across a live update.
It preserves the filesystem block limit and root directory mode, while
resetting other options to default, identifying the mount via a file
pointing to it.

> diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
> --- a/mm/memfd_luo.c
> +++ b/mm/memfd_luo.c
[ ... ]
> +static bool tmpfs_luo_mnt_can_preserve(struct liveupdate_file_handler *f=
h,
> +				       struct file *file)
> +{
[ ... ]
> +	/* These features are not supported. */
> +	if (SHMEM_SB(sb)->mpol || sb_has_quota_active(sb, USRQUOTA) ||
> +	    sb_has_encoding(sb) || is_idmapped_mnt(mnt))
> +		return false;

[Severity: Medium]
Does this condition improperly accept tmpfs mounts with group or project
quotas active?=20

The check only tests for USRQUOTA, which means mounts with grpquota or=20
prjquota will bypass this rejection and their quota state will be silently
lost across kexec.=20

Should this use sb_any_quota_loaded(sb) to properly detect all quota types?

[ ... ]
> +static int tmpfs_luo_mnt_freeze(struct liveupdate_file_op_args *args)
> +{
> +	struct super_block *sb =3D args->file->f_path.mnt->mnt_sb;
> +	struct shmem_sb_info *sbinfo =3D SHMEM_SB(sb);
> +	struct tmpfs_luo_mnt_ser *ser;
> +
> +	/*
> +	 * A remount can install a memory policy after can_preserve() accepted
> +	 * the mount.
> +	 */
> +	if (sbinfo->mpol)
> +		return -EOPNOTSUPP;

[Severity: Medium]
Does this leave a TOCTOU window for ID mappings and quotas?=20

While mpol is re-validated here to handle concurrent remounts, checks for
is_idmapped_mnt() and quotas are missing. If a user concurrently adds an ID
mapping via mount_setattr() or enables quotas via remount after the
tmpfs_luo_mnt_can_preserve() check passes, those unsupported properties will
bypass validation and be silently dropped across kexec.

Should this re-validate the ID mapping and quota state as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923224408.3745=
689-1-pratyush@kernel.org?part=3D4
