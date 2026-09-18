Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9642941A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691330; cv=none; b=B6v8/IUEmv/3xNENsTIa/eoT5W4kBOQIbJzfU3qqP73U5Kyl3zXNlarN8/onGkOKWJt0G0xxyxWU96y8B8EilN50WkNpeewt0ZjX0nkKu1snDqquVszTt49vDG4KlJmv0xbWfuSzGXmcKE4oowc54XVFhnh8oUzXtx/Wq2Df80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691330; c=relaxed/simple;
	bh=xWdkD+GXOAFss6uSt2scfW6nKUhscEWgM1Ggtm7nXBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nOdDfdc+5JMQCdUZjBs1QiUeSTWVPFNTeJtekBO6FdX1MCMRTbp1qIfPawrCYsxLnuA4t3dkGOM3TzJuZEwz2GaaC6XXRbU0+RmGbzJ3m64YQsOmsrWJc36lQrF74VJsstlixUoKAJdq9d8KGK1T5XSJB7AKhOLMym5v3hye0ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGLKgzwS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGLKgzwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCF71F00898;
	Fri, 18 Sep 2026 00:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789691315;
	bh=OjEB8YoSvr2E8wX9cD7isVumdC5ySqRIBYWNH1Q63aQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGLKgzwSwrIvn0iCT+qFyEn8qxZ/uTuu+fXrTh3zKpK5AZt9AvxAH+dw6o5ejPH/z
	 3dMXhPmDyMvjetdJHJhHMHHnx6Ig3uXk5NV9Spo9luo2PJwSGKFuT797OkbSjTAONn
	 C0myLUPUVv/sFeYO8D9VgGhhs0lDiX1KaTGUPGLobwwaoujqlI3tkM5UJWdxKb05gA
	 Mo5eEA2rdlnqSg6wMSMwS+5ZANvMb/kKJ3Nk8krN77jCrFzzV8J8eHjl3azqPgGXEz
	 miQyiBHQZpvDDEvXuZmlRDeO2PPfsWQi9mB8rOT+NxRXNYgaGiWXwfXveYEXUepkf3
	 G4a9Wv70HEZ5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] memblock: drop for_each_memblock_type() and open
 code its users
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Morton" <akpm@linux-foundation.org>, "Mike Rapoport" <rppt@kernel.org>, dmatlack@google.com, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Tarun Sahu" <tarunsahu@google.com>
Cc: linux-kernel@vger.kernel.org, dev.jain@arm.com, "Pratyush Yadav" <pratyush@kernel.org>, linux-mm@kvack.org, kexec@lists.infradead.org
In-Reply-To: <20260918002239.4024231-1-tarunsahu@google.com>
References: <20260918002239.4024231-1-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:28:34 +0000
Message-Id: <20260918002835.4BCF71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mm: commit message and implementation mismatch regarding variable s=
cope
--

commit c0dca5a3d7239e89d9dccb549819f0c9f7139656
Author: Tarun Sahu <tarunsahu@google.com>

memblock: drop for_each_memblock_type() and open code its users
   =20
Remove the for_each_memblock_type() macro and open code its users to
allow iterating from an arbitrary index. The three users modified are
memblock_add_range(), memblock_isolate_range(), and memblock_dump().

> Remove the macro and open code its three users: memblock_add_range(),
> memblock_isolate_range() and memblock_dump(). While at it, move the
> region pointer into the loop body scope.

[Severity: Low]
This isn't a bug, but the commit message mentions moving the region pointer
into the loop body scope.

Looking at memblock_add_range(), memblock_isolate_range(), and
memblock_dump() in mm/memblock.c, the declaration for=20
struct memblock_region *rgn remains at the top-level function scope rather
than being moved inside the newly open-coded for loops.

Did this patch miss moving the declaration of the rgn pointer into the
loop blocks as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918002239.4024=
231-1-tarunsahu@google.com?part=3D1
