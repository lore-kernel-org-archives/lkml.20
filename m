Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE447243956;
	Sun,  4 Oct 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086803; cv=none; b=mOBOJi+rerDEnRUSZahkQbYKVUzIe8yQDdQeD5Os+OVv7kkP0NehqMbaqoT7K4tnwm6+sgfIC/CfW7XcGXsgEFeQ7xFJMqyPEgowJcCjm9Z7cdT533OwBoikNWxckYWnNqef8YvAwnaxu45LqZZvtALvGv3LBvL/m+F1kZ5Gjl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086803; c=relaxed/simple;
	bh=qEWX5foLONyTr/CRHePAam0TjxmK7K3nfdvKcBOddzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhPo2QRQyRgBgbEFZ/ATHJPiVXSkmqFvxO6ulGxOb+BkoEY/PBanbo1ctzca8wOljwfykD2CEmFDDO8F/OSwjw1GOeQg/TQfS62GAb6STOwuZepP+mBdK20s+zVRgK4PGG+7mjEBw2AwCGQFK/0+M3zRVkGOK9EUmw3om7W1kZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHecPX0E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHecPX0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751971F0089B;
	Sun,  4 Oct 2026 04:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791086801;
	bh=kTfqoUPkpF0Jsz7kz1OsV9jjmOlrDadquE/qG7YQXMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iHecPX0EXhWkfAX48ITNY+2H07phkFbZ6oddvuyy/3nzSDGqdf0fo4l09jCpc//Ds
	 DO7rJw4F1iFnVQLwMRahxRKMIFXe3im4TuXj6Mg3K2B6QHP80Ts2OfNYA1wjrHYEM9
	 03hkAUI7G7is9TkcI6gIMqe7HSRY5N6Zb9CX47uWGQ/TiaoLw1O9Hc3s+XT/2dHrcy
	 ie9Diayqg49kplNTxhxWLhZZJIlzkgwOBXezBhSVMwLmjR6VoRVItBOz/dSVdNnt8j
	 zB8MaDUqCHZs/eya/rz6HfyQkKDsVYp/3l5qIp8YjfBL+vW7lGYte+Y6GyqcXEYv4k
	 Auyb/2f6UBS/g==
Date: Sun, 4 Oct 2026 11:46:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v4] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
Message-ID: <asHMJEELrCjSY-yC@xhacker>
References: <20260907-v7-0-rc1-rv-dis-int-before-restart-v4-1-42bb460c4afe@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907-v7-0-rc1-rv-dis-int-before-restart-v4-1-42bb460c4afe@linux.dev>

On Mon, Sep 07, 2026 at 10:30:24AM +0800, Troy Mitchell wrote:
> Currently, the RISC-V implementation of machine_restart(), machine_halt(),
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
> 
> This implementation fails to provide a deterministic execution environment
> for registered handlers in the restart or power-off notifier chains. These
> chains are intended to be executed in a strict atomic and single-threaded
> context.
> 
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentification
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
> 
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
> 
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Anand Moon <linux.amoon@gmail.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> Changes in v4:
> - Rebase onto v7.3-rc1.
> - Link to v3: https://lore.kernel.org/r/20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com
> 
> Changes in v3:
> - add Aurelien's tag
> - Link to v2: https://lore.kernel.org/all/20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev/
> 
> Changes in v2:
> - expand the fix to cover machine_halt() and machine_power_off() for
>   architectural consistency.
> - update commit message
> - Link to v1: https://lore.kernel.org/r/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev
> ---
>  arch/riscv/kernel/reset.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db85..ec84e3c94a3a 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,7 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +19,9 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +34,18 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	local_irq_disable();
> +	smp_send_stop();
> +
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
> 
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.dev>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
