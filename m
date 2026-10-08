Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5893644C4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486892; cv=none; b=I2myV7CnOFpc4SweNzRIBCNSr6e3z6iJXQyEYDsKJ/Ec5jlVvsFiXdSYlWtxUPqQXSH8dsNKCD4PViiQ7rK7tkW7G1ZpHtvolWWN2U0WZmZ8gQ8W2cP1aodft0sXpau+VnQaxNDYM5ZyEflzM+Nc/3iUIijFht3eudqt+5KeZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486892; c=relaxed/simple;
	bh=g8KQeNifzJDkfTub6uCXp9RKMHqJJTc0kuS7L1xFNWM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=krR27ByOfVm7japnW+nw981C2+3JE42jZUN1J4hdLJy+eJtzPX91Hk2vQoLphYGErrOgZQNm41smJ0W2hbgmFi6n8RoEUH4Xg5M1yXtxFB34zTHGL/RyxN2cDTCE3jcIJFvLRlJva47tvV73s5QR3zk9DnXdBaoW224nD9onddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2FMifRh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2FMifRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FDC1F000FF;
	Thu,  8 Oct 2026 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791486891;
	bh=g8KQeNifzJDkfTub6uCXp9RKMHqJJTc0kuS7L1xFNWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2FMifRhEDoiYaA/Dnn2ugNRparTpm3x5ZCC1vqmTwUiiOxVVPC+onovRHhZ5h2QH
	 7taU5pl2DUzoVki4fstwIEh+jmSkXIZvalkchzyzk6y13DQYNaI8xjXCQDfrWPmFJu
	 UGr5GEKkSrEWd6VGjM27xlJekcT26snY+yy1eJNOSPfc8AXLYiNGJSiakQX1G1zieE
	 8/IvER3rxJ3fsGTj6C+NZsE+yeuVbk0CY/kbIpq/a1LhvgWuPx+RVwaRMA+sKKdGkT
	 o3KKtjVYrZmcm6C//CkcvvWtCLDkzIISvC7+9+vZ+f5iUb1mBJqhm1WPThn92spuoh
	 5o0pLdCPueGcQ==
Message-ID: <sashiko-outbox-164506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] memblock: use binary search to locate candidate
 regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Morton" <akpm@linux-foundation.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Tarun Sahu" <tarunsahu@google.com>, dmatlack@google.com, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008190828.3221718-2-tarunsahu@google.com>
References: <20261008190828.3221718-1-tarunsahu@google.com>
 <20261008190828.3221718-2-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:14:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Use binary search (memblock_bsearch_start) in memblock_add_range() and
> memblock_isolate_range() to locate candidate regions instead of linearly
> scanning from index 0.
>=20
> Under heavy memory fragmentation (such as KHO page preservation registeri=
ng
> hundreds of thousands of disjoint folios), scanning from index 0 on every
> insertion and isolation results in O(N^2) complexity, causing boot-time
> memory retrieval to take several minutes (~268s for 393k pages).
>=20
> Using binary search reduces the candidate search complexity to O(log N)
> (from O(N)), cutting KHO memory retrieval time from ~268s to ~50ms.
>=20
> memblock_search() open codes the same binary search, so reimplement it on
> top of the new helper.
>=20
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008190828.3221=
718-1-tarunsahu@google.com?part=3D2

