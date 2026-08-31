Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E7314A60;
	Mon, 31 Aug 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167643; cv=none; b=psVKNML7HKm9lwrYojXWMq20eCKmeeQb8y0bjdHDrErZNX6nqpNq1r7AcIZQ/CPnOT97q0gdTGab6hXpLHdodFERCESjQGED9l6LyaMvk8aBCxsWCJ9nu2NLCG/fnmXoVR2Vwxg/Xi/z0GQtMBg8sdCrAbz865dksW0g+guP/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167643; c=relaxed/simple;
	bh=C5mbr9iEqsNLjlV0Hb+vr1L557FW0NzksCme0vieaLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsVFkEIRvKivJSgSv6dpEeA+nUd9zpXJENmu2N+d2SSyais6x8+IeFwKtYc7HNFTqFvA7Gpgg67gJX3ZBZzmB/em4GZ3i4e+Fu5wYr9w1M3Lv7yhG8MT5x1ERo2zCO3uBvE9+rbSQtRKF1TPHpZTN9W3zzXZcTf0heD9Rs3I/rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bKkDyFsZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hXta8YaX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bKkDyFsZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hXta8YaX"
Date: Mon, 31 Aug 2026 11:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788167639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sxN1KEjG5y2GfwBVxqB4v4GrJp1o3PRO14Nj7oMRHs=;
	b=bKkDyFsZuuydQGMgCxfKn1Bgpb/mmDdZS+7WuuAEzOELw16h8l3DTAWF13f/2xYc5I7fwj
	n6Bc/qwiirSHlf+9ra5hRnjxmHYIdfxskXzbaInWKb4FbL7FoS9/vZfFqBaGDH2yBMC2cY
	1FPyBjIyfBJ1xtnXjUG27g88wLz//aOX3GOfV9RZxl/wX69r/8ojyhEB8qTmn9qtpbf/MH
	bR0UX9DYbYcaxQdklcwsqNkQo43CyvQi1IgpdKyI9eF2mTBKPakycc5ipR2BPjn6vCB9aL
	LUuvUuoNRcAu07SR74cn/70dDyrTlxxNqwykSIpMiDKB6VEYlhiMFq4bbNyhaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788167639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sxN1KEjG5y2GfwBVxqB4v4GrJp1o3PRO14Nj7oMRHs=;
	b=hXta8YaXTWE0Aj7+p/2fTf9EUOo+QE9xn7uIS92slSCcj9av8a7iT6Ie667SEj1Jpvmpf+
	IHfNnVfKUm+u+IBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: wang.yaxin@zte.com.cn
Cc: akpm@linux-foundation.org, fan.yu9@zte.com.cn, yang.yang29@zte.com.cn, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	xu.xin16@zte.com.cn
Subject: Re: [PATCH v5 2/4] tools/include/uapi: Add __kernel_old_time_t
 typedef to tools/include/uapi/linux/time_types.h
Message-ID: <20260831110504-4229e3fc-5506-461b-9fdf-50999a9646bd@linutronix.de>
References: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
 <20260829171452167RNbirsudPmuItbeo-z9Wm@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829171452167RNbirsudPmuItbeo-z9Wm@zte.com.cn>

On Sat, Aug 29, 2026 at 05:14:52PM +0800, wang.yaxin@zte.com.cn wrote:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Add time_types.h to tools/include/uapi/ to enable y2038-safe time
> structures in tools. Unlike the kernel's uapi version, we define
> the required types directly instead of including
> <asm-generic/posix_types.h>.

This reads, like the UAPI variant uses asm-generic/posix_types.h, which
it doesn't.

> Rationale:
> - asm-generic/posix_types.h is NOT architecture-independent
> - Different architectures override types (e.g., x86_32 overrides
>   __kernel_mode_t, __kernel_uid_t, __kernel_gid_t to unsigned short)
> - int-ll64.h is special and cannot be used as a pattern here
> 
> Direct typedefs for the three types actually needed:
> - __kernel_long_t: base type for time values
> - __kernel_time64_t: 64-bit time for y2038-safe interfaces
> - __kernel_old_time_t: legacy time type introduced in v5.5
> 
> This follows the reviewer's suggestion to add typedefs only where
> needed, avoiding architecture-specific issues while maintaining
> self-containment of tools/include/uapi/.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> ---
>  tools/include/uapi/linux/time_types.h | 76 +++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 tools/include/uapi/linux/time_types.h
> 
> diff --git a/tools/include/uapi/linux/time_types.h b/tools/include/uapi/linux/time_types.h
> new file mode 100644
> index 000000000000..3aa25d824cac
> --- /dev/null
> +++ b/tools/include/uapi/linux/time_types.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* Started by AICoder, pid:00350371 */
> +#ifndef _UAPI_LINUX_TIME_TYPES_H
> +#define _UAPI_LINUX_TIME_TYPES_H
> +
> +#include <linux/types.h>
> +
> +/*
> + * Define time-related types directly instead of including
> + * <asm-generic/posix_types.h>. The asm-generic header is not
> + * architecture-independent: different architectures override
> + * certain types (e.g., x86_32 overrides __kernel_mode_t, __kernel_uid_t,
> + * __kernel_gid_t to unsigned short).
> + *
> + * We only need a few specific types here, so define them directly
> + * to avoid architecture-specific issues while maintaining self-containment.
> + */
> +
> +#ifndef __kernel_long_t
> +typedef long __kernel_long_t;
> +#endif

__kernel_long_t itself is from 2012. Can we not rely on it?
I thought only __kernel_old_time_t was the problem.
__kernel_long_t is architecture-dependent, so this could now be wrong with
old UAPI headers. If it is not strictly needed, I would just drop this.

> +#ifndef __kernel_time64_t

This type is never #defined, so the guard is pointless.

> +typedef long long __kernel_time64_t;

Is __kernel_time64_t a problem with your UAPI headers currently?
It is older than __kernel_old_time_t. If not, I would drop this.

> +#endif
> +
> +/*
> + * __kernel_old_time_t was introduced in v5.5 for y2038-safe migration.
> + * It is used by legacy time structures like __kernel_old_timespec.
> + * Defined here to avoid dependency on outdated system headers.
> + */
> +#ifndef __kernel_old_time_t

This type is never #defined, so the guard is pointless.

> +typedef __kernel_long_t __kernel_old_time_t;
> +#endif
> +/* Ended by AICoder, pid:00350371 */

Hm, what is this supposed to do? Also missing "Assisted-by" tag?

(...)
