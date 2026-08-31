Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3593E0C47
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170282; cv=none; b=pM9j2xWu9McYViuID7HBPB+CV6+3iMw0C6S36Qc8UiJdIb/N0clH9XBg9urmi0qIjkljxAsuVf/iIukc1auEC1aU3XGRRyUQgHo5YVD21QDyKrk5PnXQxfffPEGPhVaS1H5Y3lzNguisoMZz7HyTAe4vtOT2nYcUW2Tn3Lws7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170282; c=relaxed/simple;
	bh=LGYsyYVemBByw2Jl+401q75Qqt2cz4xzmZ+SlhTx/uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKOkAA82GJpLYAXuUL+6skvWprCyanhwkWIg3jSqfp09FBrf+oWZo6/1v3izMgOiUnX4btlxyl6GU4II1ftxVlH9Scr9plIwOjDSIBqbCpPdJNapnrK3Eo1jFmA7/SNTIQikaJJ1GIfiizxIpcxvhHtVpNizTP1sLBCjc7q0Weo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hAdTr9Er; arc=none smtp.client-ip=95.215.58.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hAdTr9Er"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LGYsyYVemBByw2Jl+401q75Qqt2cz4xzmZ+SlhTx/uo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788170277; v=1; x=1788775077;
 b=hAdTr9ErWLytQjoFTmT4ZzvvFILqP/CdUFqNJdPoeQnsyEf8K4DGIXMYfQU86MIv9iL//75c
 +gG4W3mADzC8YEKmAs2XRmsKbKPI8tiJP9RSFAKqDrlWbanXvdCv/Lw/U64eh+75T1k+Y3sKcjS
 3s4IbRD0hr9qW9B4LEPyDHFI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7b2bc6ce6311ca25;
	Mon, 31 Aug 2026 09:57:57 +0000
X-Mizu-Trace-ID: 7b2bc6ce6311ca25
X-Migadu-Flow: FLOW_OUT
Date: Mon, 31 Aug 2026 11:57:55 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/fpu: Use vmemdup_user() in xstateregs_set()
Message-ID: <apVQI4em8hdBZPAl@linux.dev>
References: <20260805140346.149561-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805140346.149561-2-thorsten.blum@linux.dev>

On Wed, Aug 05, 2026 at 04:03:45PM +0200, Thorsten Blum wrote:
> Replace the open-coded vmalloc() and copy_from_user() with
> vmemdup_user() to simplify xstateregs_set().
> 
> vmemdup_user() returns an ERR_PTR() on failure, preserving the existing
> -ENOMEM and -EFAULT error codes. Since vmemdup_user() is backed by
> kvmalloc(), use kvfree() to free the buffer instead.
> 
> Return early on error and drop the obsolete out label.
> 
> Performance should be similar, and xstateregs_set() is not a hot path.
> Page alignment should not matter because the buffer is only used as a
> memcpy() source in copy_uabi_from_kernel_to_xstate().
> 
> The allocation behavior differs because vmemdup_user() uses GFP_USER,
> which adds __GFP_HARDWALL and may affect cpuset allocations.
> 
> tools/testing/selftests/x86/avx_64 passed on an Alder Lake CPU.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Add performance analysis and selftest result to the changelog (Ingo)
> - v1: https://lore.kernel.org/r/20260720195534.70111-3-thorsten.blum@linux.dev/
> ---
>  arch/x86/kernel/fpu/regset.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

Hi Ingo,

Could you please give this another look now that I've added the
performance analysis to the changelog? Is there anything else missing?

Thanks,
Thorsten

> diff --git a/arch/x86/kernel/fpu/regset.c b/arch/x86/kernel/fpu/regset.c
> index 0986c2200adc..8dc9de732c78 100644
> --- a/arch/x86/kernel/fpu/regset.c
> +++ b/arch/x86/kernel/fpu/regset.c
> @@ -3,7 +3,8 @@
>   * FPU register's regset abstraction, for ptrace, core dumps, etc.
>   */
>  #include <linux/sched/task_stack.h>
> -#include <linux/vmalloc.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
>  
>  #include <asm/fpu/api.h>
>  #include <asm/fpu/signal.h>
> @@ -157,21 +158,15 @@ int xstateregs_set(struct task_struct *target, const struct user_regset *regset,
>  		return -EFAULT;
>  
>  	if (!kbuf) {
> -		tmpbuf = vmalloc(count);
> -		if (!tmpbuf)
> -			return -ENOMEM;
> -
> -		if (copy_from_user(tmpbuf, ubuf, count)) {
> -			ret = -EFAULT;
> -			goto out;
> -		}
> +		tmpbuf = vmemdup_user(ubuf, count);
> +		if (IS_ERR(tmpbuf))
> +			return PTR_ERR(tmpbuf);
>  	}
>  
>  	fpu_force_restore(fpu);
>  	ret = copy_uabi_from_kernel_to_xstate(fpu->fpstate, kbuf ?: tmpbuf, &target->thread.pkru);
>  
> -out:
> -	vfree(tmpbuf);
> +	kvfree(tmpbuf);
>  	return ret;
>  }
>  
