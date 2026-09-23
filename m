Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34AC282F17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204514; cv=none; b=F8FmJQ+yQxvgbV4L844SgcRPrM1wTBAIWt6Vt/7JL1t4mJOLUuqbYrNof+A9HFbWrnNzsKeUN1Y9MYc3A0UOcUic+ULjenH48bk44r2Is5c38zBv2Dj977okBswHH8HnFubkz3IJgJsxiYapD6dvjh0oL/nOXJJu8A4T/VFJGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204514; c=relaxed/simple;
	bh=29jNt8XG/T+V5bhc7jAR5YllmIAiPBHsnyJ4FmTHktU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m1tWDdUAY/0ZDk+72jq3ozOXsp5qLXeEKEXcMZRby26PgLLyEXrFLIWaqLFd/AZWSbDIwsSuB/8WJsVIKAv8KdLxm+DPLrCL7p8L3518W2kovI/mUk4tF0qvx09O+PO5Qr5UisDyIFfXwCd2mqrmDK6lavOe2u7xfAO7cn1cpGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLUEIV05; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLUEIV05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8160E1F000FF;
	Wed, 23 Sep 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790204513;
	bh=mAVq8riAYpkFQqE3vtYLztepdMXLNV8rYLOj0yWRQXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NLUEIV05TiKc0C/byycgiDauYslTGWVbc+nJ1MUD9VUnqU25rGdqejVNIqBf3pKFJ
	 5vpamPJuuFs302pY7sKIbWnzJH32VnHKvul5fJk3jKvVr7Tc+RFWXj9/iGc6IbDVjl
	 jCkFhVX+S5jF61sHSBBZOd0TuT3bqST8wCP0BMs9ud2VQgDsc4+ALG3BZb2tvRbwc8
	 rD9T9C5cZmKTsNXBA80mNGwvnvY3UmL55JJqvuEJmNzO1rvzvBkuoryvD8WVHSieJo
	 2LInadbEVFU7SMGahlhm0imyS859rWt1Y/OvYWDYXJH3pd+0RiHs+LPs5X/QFonpeZ
	 Ws1Um62uUwtBg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/6] fs/namespace: Add vfs_open_detached_mount()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Morton" <akpm@linux-foundation.org>, "Samiullah Khawaja" <skhawaja@google.com>, "Alexander
 Graf" <graf@amazon.com>, "Mike Rapoport" <rppt@kernel.org>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "David Hildenbrand" <david@kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Hugh Dickins" <hughd@google.com>, "David
 Matlack" <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923224408.3745689-4-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
 <20260923224408.3745689-4-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 23:01:52 +0000
Message-Id: <20260923230152.8160E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] fs: mount reference leak in vfs_open_detached_mount() error path
--

commit 7bbd41a97d183f30490f0856f394037fd1846a6f
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

fs/namespace: Add vfs_open_detached_mount()

This commit factors out the creation of an anonymous mount namespace and an
O_PATH file for a detached mount into a new helper, vfs_open_detached_mount.
This allows in-kernel mount creators to hand a detached mount file to
userspace, similar to what fsmount does.

> diff --git a/fs/namespace.c b/fs/namespace.c
> index 1ecd96c918b33..5e7ba2b61dd9a 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
[ ... ]
> +/**
> + * vfs_open_detached_mount - Publish a new mount as a detached mount fil=
e.
> + * @mnt: The mount to publish. Must not be attached to a mount namespace=
. The
> + *       caller's reference is consumed on success.
[ ... ]
> + * Return: the new file, or an ERR_PTR. On failure the caller's referenc=
e to
> + *         @mnt is dropped, as the mount cannot be published.
> + */
> +struct file *vfs_open_detached_mount(struct vfsmount *mnt)
> +{
> +	struct path path __free(path_put) =3D {};
> +	struct mnt_namespace *ns;
> +	struct file *file;
> +
> +	if (WARN_ON_ONCE(real_mount(mnt)->mnt_ns))
> +		return ERR_PTR(-EINVAL);

[Severity: Medium]
Does this error path leak the vfsmount reference?

The function documentation explicitly guarantees that on failure, the
caller's reference to mnt is dropped. If a caller inadvertently passes a
mount already attached to a mount namespace, this WARN_ON_ONCE condition
evaluates to true and the function returns an error without dropping the
reference.

For comparison, the error path immediately below for alloc_mnt_ns
failure correctly calls mntput(mnt) before returning.

> +
> +	ns =3D alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
> +	if (IS_ERR(ns)) {
> +		mntput(mnt);
> +		return ERR_CAST(ns);
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923224408.3745=
689-1-pratyush@kernel.org?part=3D3
