Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07658B6C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906236; cv=none; b=tqq6JJ1kwpug4j63r8xxcyDjfCYrrnDZkZxpd/JMD22ZbkUgmC4feVpTP9grauho4qwzi3noXpe5bepPOBISIHS0UNaIXS9TeKXvGCtOxMh99/OEBU6YoyhhIz1si7efa58Sk7lWCIGT4QhIlnIhcPCcrFlnGekSwFfbExVnbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906236; c=relaxed/simple;
	bh=4HyFK1flP9XPjvF9Eh7scTKlZQguC9n/6rCyS7TnA84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhJCNdDUDYNhWe2fKot7wF9J0aRKUizVOVDesf6se1GnL624X+tpt9Bs0avL5P70WXFOup88w1vHChsOrDo7MwSx4kYZYRVrmCw+Oh6mypOAca6qzOWQ27+ZpfTotMfqFnls3MPzpry4pXleFyQriT5r743gUqELwAweh/AInf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F522mD+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F522mD+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0376B1F00A3A;
	Tue,  8 Sep 2026 22:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788906234;
	bh=rdePD4l8fV/1dBShtyAVdNh0Ias4aYNa6xAzkxWzQ/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F522mD+VgsB5DgeJaxr9C2eXIiBu2P+ZDRJe0yFAKL7Sg+7S4sXFSsUeGTFiQTYmS
	 KBlHdDUT6gbT38/XmCPnw+uTRZKnTAJvbb9X1FQsJ8H35I39nIiAkSfmoWYp9L/mQx
	 x2mhSxBTbaZfeSXgR8Abzk/zBogZtCzXnJRmqLymSAFD+QlXK5e5LvAtLOtu3Jcw/M
	 WQRb5kljsaSpLV2hfUBCW6qRbmEiUydugrp3y/iEYte0Q3uk5sywToBzr0Vn30ZGhe
	 0lTBB1iR7lVsmHSVDeLfFaweCkkZuN4Izd8UWcGL9xNuGKuDIFav6vzBFJ16al224Q
	 nmq1UGCitoWHg==
Date: Tue, 8 Sep 2026 15:23:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guo Ren <guoren@kernel.org>, tglx@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, daniel.lezcano@kernel.org, anup@brainfault.org,
	hui.wang@canonical.com, samuel.holland@sifive.com
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
Message-ID: <20260908222349.GA2324870@ax162>
References: <20260816070049.2097442-1-guoren@kernel.org>
 <20260816070049.2097442-2-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816070049.2097442-2-guoren@kernel.org>

On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The IPI message type enumeration (and therefore IPI_MAX) is currently
> private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
> the exact number of IPIs that the architecture requires, so move the
> enum into the public header.
> 
> This is a pure code movement with no functional change.

Other than a build breakage with allmodconfig :) -next has this change
as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
asm/smp.h"), where it breaks allmodconfig with several errors along the
lines of:

  In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:20:
  drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclaration of enumerator 'IPI_MAX'
     63 |         IPI_MAX,
        |         ^~~~~~~
  In file included from include/linux/smp.h:119,
                   from include/linux/interrupt_rc.h:17,
                   from include/linux/spinlock.h:60,
                   from include/linux/sched.h:38,
                   from include/linux/ratelimit.h:6,
                   from include/linux/dev_printk.h:16,
                   from include/linux/device.h:15,
                   from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:8:
  arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IPI_MAX' with type 'enum ipi_message_type'
     27 |         IPI_MAX
        |         ^~~~~~~

So one of these needs to change.

> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/smp.h | 12 ++++++++++++
>  arch/riscv/kernel/smp.c      | 12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 0ecc67641b09..bed39fff1f8a 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -15,6 +15,18 @@
>  struct seq_file;
>  extern unsigned long boot_cpu_hartid;
>  
> +enum ipi_message_type {
> +	IPI_RESCHEDULE,
> +	IPI_CALL_FUNC,
> +	IPI_CPU_STOP,
> +	IPI_CPU_CRASH_STOP,
> +	IPI_IRQ_WORK,
> +	IPI_TIMER,
> +	IPI_CPU_BACKTRACE,
> +	IPI_KGDB_ROUNDUP,
> +	IPI_MAX
> +};
> +
>  #ifdef CONFIG_SMP
>  
>  #include <linux/jump_label.h>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..8930b62b15e7 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -28,18 +28,6 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
>  
> -enum ipi_message_type {
> -	IPI_RESCHEDULE,
> -	IPI_CALL_FUNC,
> -	IPI_CPU_STOP,
> -	IPI_CPU_CRASH_STOP,
> -	IPI_IRQ_WORK,
> -	IPI_TIMER,
> -	IPI_CPU_BACKTRACE,
> -	IPI_KGDB_ROUNDUP,
> -	IPI_MAX
> -};
> -
>  static const char * const ipi_names[] = {
>  	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
>  	[IPI_CALL_FUNC]		= "Function call interrupts",
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan
