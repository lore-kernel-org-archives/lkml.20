Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555923B71B2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712504; cv=none; b=AgvUMYwZ3krKXY8U/tjcunA0mOBkv2PtBX0Bq2ChgOZ9vyUwHqKacjs/+oQvNx5/8m0qmxA+uxtw4EwewDpiFW06ZoZ7rtkqwZkRxGaqDchnsaU3nN7PWLCxWwVhsclxYa3vT2vC+jl7Hc63wCX//pHZodO6Lw9rgq7e/hjILuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712504; c=relaxed/simple;
	bh=mBa6dfirHi27ujb7fASQF07jKuPZvj31euz3klTAajw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g8prWcW6TeKv7E5Ad4fWP3LCAYBYYZotRBuoabz2ObQrOKJohfQ7TWW70RMDVmP5jLi6uVTXZYnswYzStKMxGYqOG8kgMG+zWHJKOf5CJjbu+PChCtvANzPagZSOX/G03DsuAW90hNbLhXLj2z/nog0Bbob9SLDoQpaHAQP3M3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/YvoMHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/YvoMHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01C61F00893;
	Tue, 29 Sep 2026 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790712502;
	bh=asIX1gIl1Pjj0kV7TxM1V8TvAKyTwex3W5Zh/IEYhJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=H/YvoMHB6YC9IFo829Lc1lvTSSBxgMdAYNPenYcCa0W0rBhAAuVmomKfe1gLoQqWf
	 3RBJPxV2w8g0oOBOc40OujM97fUxoeyEc4aL5tE4WT7RCaU2NFab8kzEyabUZcWeE6
	 qMzQyvYhrIGrM4VysvWWXvnurRlNfTrCEvywOJ/vvEKMm6Vwwon7KAB63cfzVcJqIJ
	 q8mc2UtSqIiFKByqrlsqPfdpeE5SpDF/Iv0HJL8ZMySZYao6BpPMidlCueWGkx1Pka
	 iJjDNKGAK/3f+VKewNko/fWCvYPcEXuGVO4cJkajiL3PD+mMornHbW14hfBMxLpxn/
	 BBHT0XZXI1kqA==
From: Thomas Gleixner <tglx@kernel.org>
To: Liang Hao <haohlliang@gmail.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Liang Hao <haohlliang@gmail.com>
Subject: Re: [PATCH] timers: Clear pending_map on CPU hotplug
In-Reply-To: <20260823115046.50930-1-haohlliang@gmail.com>
References: <20260823115046.50930-1-haohlliang@gmail.com>
Date: Tue, 29 Sep 2026 22:08:15 +0200
Message-ID: <87bj9fizww.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 23 2026 at 19:50, Liang Hao wrote:
> CPU hotplug migration leaves pending_map bits set on the outgoing CPU
> while its wheel vectors are empty. After re-online, a later next_expiry
> recalc can treat those empty buckets as pending and temporarily pull
> next_expiry forward until collect drains the bits.
>
> Clear pending_map under the base lock after migration in
> timers_dead_cpu(), and in timers_prepare_cpu() for a full base reinit.
>
> Signed-off-by: Liang Hao <haohlliang@gmail.com>
> ---
>  kernel/time/timer.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> index ae9abf14688e..e550489c73b8 100644
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -44,6 +44,7 @@
>  #include <linux/compat.h>
>  #include <linux/random.h>
>  #include <linux/sysctl.h>
> +#include <linux/bitmap.h>
>  
>  #include <linux/uaccess.h>
>  #include <asm/unistd.h>
> @@ -2509,6 +2510,7 @@ int timers_prepare_cpu(unsigned int cpu)
>  		base->next_expiry_recalc = false;
>  		base->timers_pending = false;
>  		base->is_idle = false;
> +		bitmap_zero(base->pending_map, WHEEL_SIZE);
>  	}
>  	return 0;
>  }
> @@ -2541,6 +2543,7 @@ int timers_dead_cpu(unsigned int cpu)
>  		for (i = 0; i < WHEEL_SIZE; i++)
>  			migrate_timer_list(new_base, old_base->vectors + i);
>  
> +		bitmap_zero(old_base->pending_map, WHEEL_SIZE);

Why do you need to zero the map twice - once when the CPU goes out and
then again when it comes back. That does not make sense.

Thanks

        tglx

