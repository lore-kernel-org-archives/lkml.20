Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973616;
	b=KL277TMQ3a8VuH79SFijQXXfQF1eUF/LWUdTvdYXYywoz+5xT8bSV6JCsmCyaiNou3yo
	 mMtPdJVH26js/ohhwG6l3sOvJjSrhFjCJBd8DOqYIX2vq0fINJUuAT+D4/659fNZ2SMFi
	 9YX5SkY7nq8ISmJYLWjFHafym7j5+GF16MJzkW1rTPTdFcU78JJRj/HUbgDuZPdrhqOAi
	 SUmkJJpc0WSqVGqNaaNnXmpGpPmSm34MAsek11gg7rOB+aOrpc8bnL6brV3J97woRi6iF
	 WYV+i7Ts7YVUVUUIGYnTyTg8YnQa9Q4Cg6buj4Oy46TgmSQ4YWu3jLz0CHGp8UH9I2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973616;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=1fOGWC1IPehrdOpwQpZifjsY9NFnCljgxd1K1pEMnZg=;
	b=2oKeQf/00igVfqYvCpz927YFYX+x+daMFdL+dPMFbgc5/MId5bBEJcnozNcMZPWr7jBO
	 hw2OxYBB8ZqureFXxmFBCjCzG+IYUY3W851Ui6BwXElOMGO6RXvjGZ3iXhMMBcu4XjY/2
	 83DwHjVYfjsNrJXo5aH853cjvq6I/JrFAujL01TUtKs5Wo0R2mQOtF/+/MDmb75gpIIbj
	 OQ0OFBV1zjiWkZ6uozkeqx4/Ja0RyXb/vG2TWQ/J2OLw6Zi5xL60L+FtiZ2dHd3nSRI64
	 kj1lgahucqo9srQsq71vZUaaJLB5dDzbMMgFLCsOsBXVjvdmYLr3ri1dbaUntb894zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QObvdsVt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA710606D81D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QObvdsVt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ACC1F0092B;
	Fri,  6 Nov 2026 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973615;
	bh=1fOGWC1IPehrdOpwQpZifjsY9NFnCljgxd1K1pEMnZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QObvdsVt4xv2Z2LNG6wWV9G6lIhzCjq7z+tSbzgeeVD40bRud7E+LlP7hmhsuuQdo
	 7ZMsPtp01uPj2zRWLrYMb0RF59k854JniltM9xrwDGEY6A/w2twm5x/HTnEZpAHcSx
	 bzxKlfvWLRXMh//Ro5f1OW73m8Xu6SW0sSzCKAErLfrOx5XL69bcL+snwbZVIHQNJw
	 pUhfItMWGGgrnzcnk+JxzxtetRHIsaaVEhWr/86nYQjkvnVDzTnptnH2B5+YpeN6uV
	 4rmdXz3lHU95VdYQQsBUxl3jygP8bjqQXM3bNGTyKRa/LLoVSKA64VZ+0R2egbZCDX
	 F1Hl2jGKuedZA==
From: David Hildenbrand <david@kernel.org>
To: hughd@google.com, Hungyu Lin <dennylin0707@gmail.com>
Cc: david@kernel.org, baolin.wang@linux.alibaba.com, 
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105055619.58289-1-dennylin0707@gmail.com>
References: <20261105055619.58289-1-dennylin0707@gmail.com>
Subject: Re: [PATCH v2] shmem: skip empty unmap ranges when punching holes
Message-Id: <179397361279.3706.12765582085126746884.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:00:12 +0100
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

On Thu, 05 Nov 2026 05:56:19 +0000, Hungyu Lin wrote:
> When a hole ends before the first page boundary, shmem_fallocate()
> calculates unmap_end as -1. Casting it to u64 makes the range check
> succeed even though the hole contains no complete pages.
> 
> For example, punching one byte at offset zero calls unmap_mapping_range()
> with a zero length, which means unmap to the end of the file. The file
> contents are preserved outside the hole, but unrelated mappings are
> removed and must fault back in. This can be reproduced with fallocate -p
> -o 0 -l 1 on a mapped tmpfs file.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: shmem-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] shmem: skip empty unmap ranges when punching holes
      https://git.kernel.org/mm/core/c/bf87d3fe

-- 
Cheers,

David

