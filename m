Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0E45560C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069030; cv=none; b=Y1yTE3qx1Fv74780om4pENnyhVUul1NrPTx70vTX+lhFl8vtvkiGqxtpxWu27//EBedXwMz0q5/IddIs1Dlm6bb+B7lchkvN1Pq3NGLUiMqji4WHtPnby/xc1dPnNRZXPJuc0Xr2JUgVpAQteKdSbmQi6BRCBsgZsNh9OWtr8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069030; c=relaxed/simple;
	bh=XTWPCxshzqA2jb/zUl02Yv+fxuT88vEQbI0PigmzXa0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p5aRGKRV3TMKEwfRyDsDmmeG8D8B3AZQ/UQhHB0edA3YC6t8aqvcKJxEgT18x55IXWUOlXwLKheY6TRn63zZOakuszogDYIuuEMuuEiz0kEvxYuo2KL+DX3YyDxPoKqGTtBGAvLrDrMR+NV8z4jtRS2xSmJEeO07v7koTXFz1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqeJD2tm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqeJD2tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A87E1F000FF;
	Tue, 22 Sep 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069028;
	bh=II/+fPJUfxh7r6fAXYXNIc1fkLRMwSiccDjJ6S2THbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DqeJD2tmh+fN1hNVMw8k5is7THVl0KB/daYaQRoKLvrUALNxO3E9VbO3hQOKmtuIZ
	 Q8mialHrHSTuQZWfyRDhEVejrGI0CAXG+ovxfJ/0cSmMR6xpVBq3Y1lnuAiT0N9qqH
	 B/QcsalYpX3HdrK75vJQXlxH7zc9sgbzXJRi39Atmbnozcm/OCej64z3F/wmwjPatO
	 JYYQ3By4SCuw03vuy9bqzT+iwrmSCqkEUaaU6v82R/nVMTcqiU1jN9Rg2SyLxNcdsw
	 r0V+9Tg0hKH275kYVXLPnptqgeBLNpgCqtiJSYng6o5xFcdHWKUgQ6+wMolbt1UUcC
	 OqLk1CLnt9/Xg==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Xu <peterx@redhat.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260921-nommu_gup_pin-v4-1-c410041cc479@kernel.org>
References: <20260921-nommu_gup_pin-v4-1-c410041cc479@kernel.org>
Subject: Re: [PATCH v4] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Message-Id: <179006902500.6914.763745635708083429.b4-ty@b4>
Date: Tue, 22 Sep 2026 11:23:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 21 Sep 2026 11:57:29 +0200, David Hildenbrand (Arm) wrote:
> The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
> get_page() reference for each page regardless of foll_flags:
> 	if (pages[i])
> 		get_page(pages[i]);
> 
> This is reached from pin_user_pages*() with FOLL_PIN set.
> unpin_user_page() is shared between MMU and NOMMU configurations and
> unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
> GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: gup-7.4.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/gup: honour FOLL_PIN in NOMMU __get_user_pages_locked()
      https://git.kernel.org/mm/core/c/da01399b

-- 
Cheers,

David

