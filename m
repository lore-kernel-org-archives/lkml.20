Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8B2BE656
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789848952; cv=none; b=VZKxuz5OIjSm73BLu9SSwe9IjeS1nO3ZCAG2ylmugbyyemXiPrGSuwLacFfdRaaXzbFEcf7Il1f2dHA7J45bvqokreqP6njRC9V6ZF4hNhxJOMpWJbCK4dd3VWvAm1OI7cpyNURHpqHYLklsjVrkACUIUvl23A/mlY0WXmsTD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789848952; c=relaxed/simple;
	bh=jZLsg0uEvMxqnop/CLvC8E7DCOwAvfMDC51BhoKGe2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N4ctrY5yO2zmN0TLFgYObCSIuNeJvKizmeiD4o8+PDWS2ujAHqUl82rrePQ6emi1DmH+cqYZzstoSvaQNrtnjjGiftPX+f0vPn9PDd5zl69V6LVcTveID25ANb1VLaTFMarSDop+iHfBnl+hvaXddd428RH0+pf1lUrpCJojBfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA6gOk9m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA6gOk9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEE01F000FF;
	Sat, 19 Sep 2026 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789848951;
	bh=aEklChI0Z6DSnGg1lTHUJ1IxomPedF8yLHgw2QGf2q0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cA6gOk9m0pTCXjAZtd3PmkW4Edy9ftTtAepGerXCf1aYz4gPVhE/h/LFlqsOsqIFC
	 2pFCsXKcPw/AfBC52QMdG7pihf/rafq3LwEB9hnzAUARQ+XfZwxJ4cUF/kumyhRZVb
	 p9WGBMndGlVU2lTvUfVLkGYbGqp0/sjjafsKmfcsvM2ajC6U6NCY/NnQofnKgj+a8f
	 55qTzRRE7eTpyNyP6MwuXLZ6WIRwuyQMCsnWdvwgqGIbVb9LpK9gGM4NxW/cjEUkkW
	 KPZsF3GQrJtM1MgcMyZ9EkeJi1Fu1U/sIUIZznRUHWD476ONfnieR5z43zoS/M+dl8
	 9GJKxxJMR3lHg==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901083452.115365-3-sarthak.sharma@arm.com>
References: <20260901083452.115365-3-sarthak.sharma@arm.com>
Subject: Re: [PATCH v3 2/2] mm/gup_test: report actual pinned bytes
Message-Id: <178984895068.1919785.9481531053256508981.b4-ty@b4>
Date: Sat, 19 Sep 2026 20:15:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 01 Sep 2026 14:04:52 +0530, Sarthak Sharma wrote:
> __gup_test_ioctl() advances addr to the end of the current batch before
> checking if GUP pinned the entire requested batch. If GUP pins more than
> 0 pages but less than the requested batch size, addr still advances by
> the requested batch size.
> 
> The next iteration detects the partial pinning and breaks out of the loop.
> Again gup->size is calculated using addr - gup->addr, so it also includes
> the unpinned pages of the requested batch.
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

[2/2] mm/gup_test: report actual pinned bytes
      https://git.kernel.org/mm/core/c/65a79b9b

-- 
Cheers,

David

