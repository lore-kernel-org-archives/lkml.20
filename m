Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5794D794C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369680; cv=none; b=VM6nQGzKVOMV5nc8oHc7GoJWF8YwilClexJqPm7vjQ/o1JCk8qL+Yz7uv2/uuHXsoTJPtqSV/8e+C1iIjIh3f9rHEZsPu7QasD03KifxsMMJ70mAxAEYg/gYf1dyrP2HHS5wCVaV2ovjr2qnh042gv7BZrpN1zM/ZcVCarnS5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369680; c=relaxed/simple;
	bh=sTi6v8TYKgmZhr/v3pk4G+5lmshfVWfgQ+SFXaf0iic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apbgo+/rd1+E/CA2y9QOJMLTTyZCjJ/jWuDpZceBLG8KLiCJmDv+zv4NM3/++G5p1B92bQDrGvkWuqGP1awYahNWH+0eq5rDE2St4u6TRcGRs4uxUj/EH5SLopQrVP13hVSQP4PcFwHo6p+KuODBUbaal60zUs1SHpgHjDSnS0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=Av1CNv7I; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="Av1CNv7I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tdnR0hQoks1raul8LJNCZKc3Dj++dhTUAanHv/0PU4c=; b=Av1CNv7IACArSn3DGiaeJ3WK3f
	YcC2faFWdSr0Ti5EmseHpaYxdnh2txUUOdYhkQXDj2ikzVbm2Ykg+r32UcOsj5HgIMCywnRpYLATC
	2DjXSzjSBjhP4lkqlXthnxjF3g75rj7j+iaFIeuc4X1a94zP5iWI8Ruy1CcQTA8rbQBtbSapPsMOP
	5dNodJz57NXsJmzo504CNqMQPbP/xqn0sSKN6cXNzUZIXlPPiWl2/8vUwds0mWG0eJTZQeaVKzWLy
	RnyVVTR5RYFmHK7vdx3a63Htb2vKXPOIxF+n2gOblBer3QadHmsP2LR4fOMGHbp2X9to+xPA3s3xP
	Q3f56uUg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xACw0-0000000Ac8p-1mNt;
	Fri, 25 Sep 2026 22:54:20 +0200
Date: Fri, 25 Sep 2026 22:54:19 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: shao.mingyin@zte.com.cn
Cc: pjw@kernel.org, mikey@neuling.org, jiangfeng@kylinos.cn,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.yue5@zte.com.cn, david.laight.linux@gmail.com,
	qingfang.deng@linux.dev
Subject: Re: [PATCH v4] riscv: lib: Fix =?utf-8?Q?Z?=
 =?utf-8?Q?BB_strnlen_wrap-around_regression_on=C2=A0huge?= counts
Message-ID: <arbfe8ZROfJshMJ_@aurel32.net>
Mail-Followup-To: shao.mingyin@zte.com.cn, pjw@kernel.org,
	mikey@neuling.org, jiangfeng@kylinos.cn, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.yue5@zte.com.cn, david.laight.linux@gmail.com,
	qingfang.deng@linux.dev
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
User-Agent: Mutt/2.4.1 (2026-07-04)

On 2026-09-15 15:26, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
> 
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
> 
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  The saturation
> clamps the increment to ~s, so it stays branchless and wrap-free:
> 
> 	s + min(count - 1, ~s) == saturating_add(s, count - 1)
> 
> Normal counts are unaffected.
> 
> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> Cc: stable@vger.kernel.org
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Acked-by: Michael Neuling <mikey@neuling.org>
> ---
> Changes in v4:
> - Use Zbb minu to clamp the increment (addi/not/minu/add): one
>   instruction less than the sltu/mask/or sequence and no extra
>   register (Qingfang Deng).  Clobbers stays t0-t4.
> 
> Changes in v3:
> - Replace the taken branch in the saturation with a branchless
>   sltu/mask/or sequence (David Laight).
> - Update the Clobbers list for the additional t5 register.
> - Michael's Acked-by is kept: the patch semantics are unchanged, only
>   the saturation sequence is branchless now.
> 
> Changes in v2:
> - Point Fixes: at the original implementation (5ba15d419fab) and reword
>   the commit message accordingly: the wrap-around exists since the
>   original implementation, 5d588c684833 only changed how it surfaces
>   (Michael Neuling).
> - Add Acked-by from Michael Neuling.
> 
> v3: https://lore.kernel.org/all/20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn/
> v2: https://lore.kernel.org/all/20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn/
> v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/
> 
>  arch/riscv/lib/strnlen.S | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
