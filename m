Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AEE2CCC6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848022; cv=none; b=PVY2QlNBhvrVvvv4Y9fU+QO+GNHy78zzQJp7K3eknYaPZI3OBUa1HNH9yge22weywesvywLa/kp3fIBMWgfXqnC3tLckP4WoDrpwx7UPzVdBVc11Wgx5YU6JghnAI38LR7sLg9mdcefbP1T76Rl3OlHMkVq1oXmHNkQ249ZdJAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848022; c=relaxed/simple;
	bh=0LvVTEutIoYjhJnrj9l91SyQV/qP1qzm2TUFWejUpEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=feqGAOG7HdSVKiNRHpPGbmJneFm8x5WTOw1AHexkCNvc6KLYH/0yE6gD82VOSk7LGFphB0otjfFs1ZMpKLsQnAWFiYp5YmKKNFqy23CO53RTPXR/WSQ3OByPa5W12wZ+WoU9mvHeGz7zaCbey7WW2fuQnEJgiO7MhS0UauOtm1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIZNqq8R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIZNqq8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57CC1F000FF;
	Sat, 19 Sep 2026 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789848020;
	bh=bVfBFCmbKliEeVR2O90Bd2VG3Mye0fRiwIGadK6jWE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gIZNqq8RsuPT0gWMEhRJIsZ/Jlu9GJlW2yZuPYSc3DNPkPp4ZS3uUsDWuo5+5aiZb
	 9zfUxo6pmoxMVT3TGmpQN735oUvHVmn9g3lbnTYvAH72SqR4AW6LTbEWt/7Ltpxu8C
	 cJNAEt73IJl4LMxZPa++Q/L8x1xEqh+ao+RmqZxhjXvfeGb/DsEOkwYiNklp0EpiOf
	 z2eeDYYakS3ABqWwaRJtWt6BcfLvigWm5kBRONzTfKlbMJm1O2mq+puG05TIKAUfQ5
	 D24iQjYP4r+ybbztvCVmpkbSOYFWv6u9tfmbYQvDT08tYmimj/dllXA6JlpC8ZmNGb
	 cCD8IeVbK5vmw==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Xu <peterx@redhat.com>, "David Hildenbrand (arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
References: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
Subject: Re: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
Message-Id: <178984802063.1919131.12249420688270261597.b4-ty@b4>
Date: Sat, 19 Sep 2026 20:00:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Sat, 19 Sep 2026 12:04:36 +0200, David Hildenbrand (arm) wrote:
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
      https://git.kernel.org/mm/core/c/8ad0454e

-- 
Cheers,

David

