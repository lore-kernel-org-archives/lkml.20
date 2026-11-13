Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567101;
	b=tvKQvmzGiL5NpU3Pgm/68tkUXb3yVSgcoZ24mrhijkDz+qCRfX/X/oBk3nHFNxXzfzDI
	 gPelcJIrCC3XwFx1ZZNHOET+mDFTlaNPRbdoz4SVwxctkvW7Y4+2z/gzzcfn0QrmvywO6
	 NQ3YPKsR20kplz1t7Z0VntXNHYqC91KSyfbE6/RqGbNZgOVdHdzGRV6hdscKIHpta89xL
	 bat5Rv+UiVttIQ66NTj9FjKfGIPkHh0NGGNltXLR5oXgaPsKznwG+nSPgNrjqplbg//DF
	 0I4xt0Jk8V8DXTeGVxrVlFNY1qMJ1hvCuu70tHWaEVlkmXY3c7JQcjlPhn1adH9rC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567101;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=2EE1wdDV3l4vc6SGBux4/xDk3zRZe8hWDSeaRMrJ8Q8=;
	b=fxaGo7rUN46+8s7yutd5MuFzleZQO6jGBl6rPSpG5ZZHiMDsN/QO5G/EHdNzuOGu+iuj
	 HVYGLIyOL+XQaLRZG5QcC+BoCysymPUd0+PAUfugIGj6pjeZOUUmVdtZJXmfsuAgWnL9H
	 bnvzR/bDDDgxbwDPqyiskIzcnplt6Fx2wrZQdVg1PIVwBDX6yMm6sCe+RcGIRVtysotVZ
	 KfXMWqfLUzqCvb+3lAdt+0lvby1ctZofUdx/eIbO5u6T/OA+WGfUXdrMJdNJm2ieorDoy
	 TWCupvDw7inoMV/wJIoDZod5+jG45JsH28Wb6+i52+WUWyz+SRj58/dCRLvJOKWQB6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCcG2i5f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6885606B26C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCcG2i5f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE3C1F000CD;
	Fri, 13 Nov 2026 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794567101;
	bh=2EE1wdDV3l4vc6SGBux4/xDk3zRZe8hWDSeaRMrJ8Q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dCcG2i5fW9HPy6zti+G7Mo18ybFErglRsGv/muyQHPvQTwch0Q6GfO+V0p2B1JccS
	 FW1pWmIoNeDlpnRBwAO8RrkPYOwirzHyDxZzbe0K4Jf5or2cLaLVIk724wccyd2rVy
	 TyknkPAWnVUZ7xQQlB5DIlbc9ckd+39TfM1DxaZgB+c6+OV4/tGyvfY5UkZObxxHrX
	 rxwVzSEG4vpfb52W9oYc5UqOCCRqYQtXfX838LYXVIp6m49/bvKAnc94j59kzB+GQb
	 9gWezpYE/tVwJHjQawhn4Zu+8wZVZkuexQzEBec3Zar8oK8iOIEld6DiNHgEfkwjMp
	 EcGB4jeTKFiOw==
From: David Hildenbrand <david@kernel.org>
To: david@kernel.org, kas@kernel.org, hughd@google.com, 
 akpm@linux-foundation.org, Wandun Chen <chenwandun1@gmail.com>
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113083927.2727599-1-chenwandun1@gmail.com>
References: <20261113083927.2727599-1-chenwandun1@gmail.com>
Subject: Re: [PATCH v3] mm/migrate: improve mlock tracking for PTE-mapped
 large folios
Message-Id: <179456709796.6844.3779042426492180260.b4-ty@b4>
Date: Fri, 13 Nov 2026 11:51:37 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 13 Nov 2026 16:39:27 +0800, Wandun Chen wrote:
> Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
> mlocks a large folio when all its pages are added in one rmap operation.
> However, when a PTE-mapped large folio is migrated, remove_migration_pte()
> restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
> result, PG_mlocked is not set on the destination folio.
> 
> Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
> remains undercounted until that scan occurs.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: migrate-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/migrate: improve mlock tracking for PTE-mapped large folios
      https://git.kernel.org/mm/core/c/9fa01fbb

-- 
Cheers,

David

