Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD86309EE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220405; cv=none; b=R/SU8aMBAV2+JiV+V9YkhdXYMibxpz3SzaqEpyk94fpbFiaVqLT89GYTMBD74f9DuWv4D7kY1vQsa2AtcJ1nmvvmxzJjZgQSLkcT7whZ8Vi3hvfwy6ylvd0Xz6+Sp/uRDNm7yahagL/vqQVyscQIOyT9T6Hq4rmul460HxCe03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220405; c=relaxed/simple;
	bh=TsARFK3OFOgDH7mUFsiTJdbHZYIjCZx6Q8TIZUqodKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kiSRbXFt+7yxxhGwg0Bug088CO6mXBVlNyuplUyJDvzLmuMQI30RYXgA8wCmXmZGquGjyZ4GgiofHol3MMvE1ILmMJbbbysBN6otAZ2FUnVOYK+dfsA8VjetiQ2wupM9hk29vKeAB9e8WEWjw6vMl5Q1DURKYvkkul1fRbJFB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP1Grhdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP1Grhdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64D41F000FF;
	Mon,  5 Oct 2026 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220403;
	bh=PJGQiGG2EhFdB2vRXI/iToPB7BKM0nrSllWgrPUANUU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WP1Grhdjr9mHHfqIVRUvx/mjm3ZRAsUhyQ3nUCRqi/Q+gXrYvCQopj+ntzVmhW6Qr
	 itH/aPggqcw86qFpEqX/OeKScRUJz+TicfSpbj7jDGTg9i3CjKuD6L0fL6iCa+JeyM
	 ng/eDkJGa4YM0KEeDZ+/x5JLhwADhdyusOQCXFKVOO3OrHK8qTPBIjIPmRP6Irqijs
	 4/+oRhbLJY7lhCYNgXoUV2WZ64FG7lbX7bLKEtcCOuKZvo8Z5Y0w4byDw07HpSGD5I
	 9vMrQV8eqn7BCrfM5mixvVmKUwU5iLqgxQKXRA9saa0TaF6F801CEEvy4bjG/niVfQ
	 gDAFBd2Y84RKg==
Date: Mon, 5 Oct 2026 11:13:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: shao.mingyin@zte.com.cn, gao.rui@zte.com.cn
cc: pjw@kernel.org, mikey@neuling.org, jiangfeng@kylinos.cn, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    zhang.yue5@zte.com.cn, david.laight.linux@gmail.com, 
    qingfang.deng@linux.dev, aurelien@aurel32.net, troy.mitchell@linux.dev
Subject: =?ISO-8859-15?Q?Re=3A_=5BPATCH_v4=5D_riscv=3A_lib=3A_Fix_ZBB?=
 =?ISO-8859-15?Q?_strnlen_wrap-around_regression_on=A0huge_count?=
 =?ISO-8859-15?Q?s?=
In-Reply-To: <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
Message-ID: <970c63ed-9fa8-9d1f-4521-0a7119b9d6e5@kernel.org>
References: 20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Shao Mingyin,

On Mon, 28 Sep 2026, shao.mingyin@zte.com.cn wrote:

> Hi Paul,
> 
> Gentle ping on this one - it has picked up more tags since posting, and
> should be ready to be picked up:
> 
>   Acked-by:     Michael Neuling <mikey@neuling.org>
>   Reviewed-by:  Aurelien Jarno <aurelien@aurel32.net>
>   Tested-by:    Troy Mitchell <troy.mitchell@linux.dev>
>   Suggested-by: David Laight <david.laight.linux@gmail.com>
>   Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> 
> It stays a minimal fix: only the two boundary-computation instructions
> in the ZBB path are replaced (18 insertions, 2 deletions, no new
> registers), so the scanning loop itself is unchanged.
> 
> This one matters for stable - the regression is in v7.1.10+ and v7.2:
> strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string and
> truncates names built through FORTIFY strcat/strlcat (device-mapper's
> sysfs name "live-base" becomes "live-bas"), which broke blivet/anaconda
> installs and LVM on RISC-V systems.  It has since been reproduced
> independently on a Fedora 45 riscv64 image with ZBB enabled, where the
> fix restores correct behaviour.
> 
> Cc: stable is set, and the minimal form should backport cleanly to
> 7.1.y.  Happy to rebase onto riscv/fixes or adjust anything if needed.

Thanks, queued for v7.3-rc.  Rather than posting a new patch, it would 
have been better for you to comment on Gao Rui's patch:

https://lore.kernel.org/linux-riscv/20260819161821053fNUWuvdGIo4HUBmxlcNfG@zte.com.cn/

However, since time is short to get something into v7.3-rc fixes, and the 
approach you took in your patch seems better, I've queued yours instead.


- Paul
