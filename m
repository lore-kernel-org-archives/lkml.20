Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1C259C9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958457; cv=none; b=SLgXES8Qqe56ZsBbG1m38j6ybCxR+D7dpOlWqTra8dZhkHbXb31pJPtUdIohQqJXfI2YxiS3LAKH/Zv50gPPl1JFv3WHRBgbAS6fzfFHv6HxHwlHcQ/tdXQLwQ97TmXK/EiXaP9w3UJAq6FKwAP2RwhhBG+g41/ftR5WbAykPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958457; c=relaxed/simple;
	bh=7UHpGJFWQ1fdtESAHCBiLPjJ63+0bondFnQ4EU82Bhc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ofEB6bpFLrROMAwQza6JeMcY0/y5fRl+b1HseQk5NxLxDuCwPb/9z1DH2EJGCz1NCAtvoekjSCrQdSRkOeQvvHtq/wiN5OZsNVi47Pz/BAbf3QZmjXV6//XFSophMH8X1IsHUGB9bXXFBVN5tWpSq0UVax3tTj8GKAUcHJPMFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLtRGGhU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLtRGGhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8568D1F000FF;
	Wed, 14 Oct 2026 06:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791958456;
	bh=5aynIBdykWUyiJc5wo5/fTgc0Cz2299hKU/OS3JyPo4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=oLtRGGhUG5Yh9pfLh+xYlDOuF2HGHqmem2ewJTR9Yo2nugNvCPpz5At20WX93MJux
	 Z4XA/uJpk40qPtankMdCXYBVEWzG/jZq32GeQtZPAx5suTJAPXJguGgvbpVQ2PPZro
	 RAYnVJnt0ffJivnvKndKFM1tB6WMEl92JEKiqoHpFt2QLK7NBv97n1UjdVImBzi/9n
	 NCZysmm/nUZ9XPNtqJb5E28tfJu0LBSRHpb94oE3+QpEloIvLNrMQEtkRh89W+RHti
	 h6KVbTI8hCcXsRKMXL2tBh5JO4mnOtxr+t/j6KwAOnKnRw6ld29xkwxNH8xYU6xZ3H
	 2akFH01tY1RPA==
Message-ID: <9efd2ca3-ae57-428c-97c7-bc2300ba9a42@kernel.org>
Date: Wed, 14 Oct 2026 14:14:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: bound the SIT/NAT bitmaps by the checkpoint pack
To: Kaixuan Li <kaixuanli0131@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/26 21:09, Kaixuan Li wrote:
> sit_ver_bitmap_bytesize and nat_ver_bitmap_bytesize are used as memcpy
> lengths into and out of sbi->ckpt, which is sized from cp_payload alone,
> and nothing compares either length against that allocation.
> 
> sanity_check_ckpt() has checked these two fields since c77ec61ca0a4, which
> added them after a crafted image overran build_sit_info(). That check ties
> each length to a segment count; it never compares either against the
> allocation, which is the half this adds.
> 
> Mounting over-reads in build_sit_info() and build_node_manager(), and the
> first checkpoint writes the same lengths back through the same pointers,
> so the over-read's contents reach the on-disk checkpoint. An unmount is
> enough; the filesystem does not have to be used.
> 
> Bound both ends the way __bitmap_ptr() lays them out. The three branches
> differ, so a single sum of the two lengths would still admit a small
> overflow when cp_payload is non-zero.
> 
> Fixes: c77ec61ca0a4 ("f2fs: fix to do sanity check with {sit,nat}_ver_bitmap_bytesize")

It looks the overflow issue exists since the beginning, w/o c77ec61ca0a4,
{sit,nat}_ver_bitmap_bytesize was not checked at all, c77ec61ca0a4 just
added partial check, so how about:

Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Cc: stable@kernel.org

> Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>


