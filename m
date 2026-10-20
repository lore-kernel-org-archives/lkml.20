Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460498;
	b=HpqElU1e9E6F0SDa4yWfUPiZW5iBDQHF7bwFmlCAyUiGbKh2FZ9q+RfL/8l6KMsNfC2Q
	 sGyvBEl9hdyO/qrkP+PoeXd5Sn8qOn/N3Bsw9oc59CrGZ4vOmei7zEnwPj2AJ/hoMzKyL
	 lN+lLXzxYg/VvXVi2dOEdcztz0cOYZpTRKYew6CcwWZaGq9FczA0a8MNYPxh6WuYF94cn
	 EhYtUbmeLZrLqoVub0u8kNvpIJbSvNe+SBF1Me2HaP+K1muN6sRLnlHA2xl0vTEE7AqtR
	 8WCcYS5mWMTQ9mF9X7NCeWKWZVXcuIkFNHn3ewwIUbHl2oEw3Jem+HUBzDO0S9WBiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jV9vQbp8kVwiR6PyktkkrAbRYjtNNONjs0XwKEZKtBY=;
	b=k1HN4RDNcASdbiHraADszPRRpXvteOaPsOWhvvJu36PCyv6G5Wt8oOXlfnxEUagl14os
	 JDJhlQpqM6mN7qGW5a4HWiqasVYIHGDUfnp+zgq23Bw9keQrJgCuCBm+AVsCGy4gsOZhD
	 5dNZMki8b2kRtqbcR2HQzFn393c9HcrW+ZoFLlilDWXhYXUIRtpPEukg83vB9Ya4oC0MW
	 J4PDzKniZPLPhA5VF2XXCVP4fn+RDW7YMJG82oF2k3x7G9mNgdB066D9FoUTzd8fMv3Hv
	 Bql0KKk22Yq7iH0ub9B0UafZ5hqTooyQyEtoLlMDVUIkxzT+8rFHZRtqI+UjqVW4LqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wti6IN8A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6667606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wti6IN8A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABE71F000CB;
	Tue, 20 Oct 2026 01:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792460497;
	bh=jV9vQbp8kVwiR6PyktkkrAbRYjtNNONjs0XwKEZKtBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wti6IN8AaYX6nR1a4nrFjdTh15ygN7WfDZAQ9TLe061bRkGIkDilOcPLyKPzmDSsi
	 k7rXChH/oGTKJN73CSQTcKxofRqOXRonR7NKa7RfPQcKA03BjsGf4rvqOWFSrvuuTh
	 fK3mTNgzah2xKFQa59Ayk/4o6eDa45k2rRhvEigTolOfnZvIUn2w1RoIdXsnlcXnfA
	 hsKPyaVxBDfbYi4AzaKkZCN0x579dx7rLqtw34VnyFvQLOyncVCXFv/sQdRgzlvfMj
	 p2DLgTI+Djf803DsIJ20+9t5/9hSmcI3yX6VwNbYuY7Cyr13ZG5mBDDznnuwUYFd+q
	 ZllEwGVlNnECw==
Date: Tue, 20 Oct 2026 09:21:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Haorong Lu <ancientmodern4@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: signal: check the full syscall return value
 for a restart
Message-ID: <atbCH0O2JSJdBVKE@xhacker>
References: <20261018024215.798849-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018024215.798849-1-nickolai@csail.mit.edu>

On Sat, Oct 17, 2026 at 10:42:15PM -0400, Nickolai Zeldovich wrote:
> A system call that returns a 64-bit value whose low 32 bits happen to
> equal one of the -ERESTART* codes is restarted or turned into -EINTR
> when a signal is pending on the way back to user space. lseek() returns
> the new file offset, so lseek(fd, 0x1fffffe00, SEEK_CUR) followed by a
> signal with an SA_RESTART handler runs the lseek() a second time and
> leaves the offset at 0x3fffffc00; without SA_RESTART the call fails with
> EINTR after it has moved the offset. With a SIGALRM interval timer of
> 20 us, 2337 out of 2000000 such lseek() calls moved the offset twice and
> 2695 out of 2000000 returned EINTR. brk() can return an arbitrary
> address the same way, and a value ending in 0xfffffdfc goes through
> restart_syscall() with whatever restart_block.fn the task last set.
> 
> arch_do_signal_or_restart() reads regs->a0 into an int, which drops the
> upper half of the return value before it is compared with -ERESTARTSYS
> and friends. The code before the restart handling was moved out of
> handle_signal() switched on the unsigned long a0 and was not affected.
> 
> Keep the return value in a long. Compat tasks see only the low 32 bits
> of a0, and a 32-bit tracer writes it zero-extended, so sign-extend it
> from 32 bits for them as before.
> 
> Tested with the program in the notes on QEMU virt (riscv64 defconfig):
> the offset is moved exactly once and no EINTR is returned with the patch.
> 
> Fixes: ce4f78f1b53d ("riscv: signal: handle syscall restart before get_signal")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Good catch!

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> 
> Notes:
>     Reproducer (static riscv64 binary run as /init's child on QEMU virt, -smp 2;
>     riscv64-linux-gnu-gcc -O2 -static -o lseek_restart lseek_restart.c):
>     
>     #define _GNU_SOURCE
>     #include <errno.h>
>     #include <fcntl.h>
>     #include <signal.h>
>     #include <stdio.h>
>     #include <string.h>
>     #include <sys/time.h>
>     #include <unistd.h>
>     
>     #define OFF 0x1fffffe00LL	/* low 32 bits read as -ERESTARTSYS */
>     
>     static volatile long nsig;
>     
>     static void handler(int sig)
>     {
>     	nsig++;
>     }
>     
>     static void run(int fd, int flags, const char *name)
>     {
>     	struct sigaction sa;
>     	struct itimerval it = { { 0, 20 }, { 0, 20 } };
>     	long i, moved = 0, eintr = 0;
>     
>     	memset(&sa, 0, sizeof(sa));
>     	sa.sa_handler = handler;
>     	sa.sa_flags = flags;
>     	nsig = 0;
>     	sigaction(SIGALRM, &sa, NULL);
>     	setitimer(ITIMER_REAL, &it, NULL);
>     
>     	for (i = 0; i < 2000000; i++) {
>     		off_t r;
>     
>     		lseek(fd, 0, SEEK_SET);
>     		r = lseek(fd, OFF, SEEK_CUR);
>     		if (r == OFF)
>     			continue;
>     		if (r == -1 && errno == EINTR)
>     			eintr++;
>     		else if (r == 2 * OFF)
>     			moved++;
>     		else
>     			printf("%s: unexpected %#llx\n", name, (long long)r);
>     	}
>     	memset(&it, 0, sizeof(it));
>     	setitimer(ITIMER_REAL, &it, NULL);
>     	printf("%s: %ld signals, %ld calls moved the offset twice, %ld returned EINTR\n",
>     	       name, nsig, moved, eintr);
>     }
>     
>     int main(void)
>     {
>     	int fd = open("/lseek-test", O_RDWR | O_CREAT, 0600);
>     
>     	if (fd < 0) {
>     		perror("open");
>     		return 2;
>     	}
>     	run(fd, SA_RESTART, "SA_RESTART");
>     	run(fd, 0, "no SA_RESTART");
>     	return 0;
>     }
>     
>     Before:
>     SA_RESTART: 283700 signals, 2337 calls moved the offset twice, 0 returned EINTR
>     no SA_RESTART: 246693 signals, 0 calls moved the offset twice, 2695 returned EINTR
>     After:
>     SA_RESTART: 306854 signals, 0 calls moved the offset twice, 0 returned EINTR
>     no SA_RESTART: 278090 signals, 0 calls moved the offset twice, 0 returned EINTR
> 
>  arch/riscv/kernel/signal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 59784dc117e4..b1e92b969d96 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -499,7 +499,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>  void arch_do_signal_or_restart(struct pt_regs *regs)
>  {
>  	unsigned long continue_addr = 0, restart_addr = 0;
> -	int retval = 0;
> +	long retval = 0;
>  	struct ksignal ksig;
>  	bool syscall = (regs->cause == EXC_SYSCALL);
>  
> @@ -508,6 +508,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
>  		continue_addr = regs->epc;
>  		restart_addr = continue_addr - 4;
>  		retval = regs->a0;
> +		if (is_compat_task())
> +			retval = (int)retval;
>  
>  		/* Avoid additional syscall restarting via ret_from_exception */
>  		regs->cause = -1UL;
> 
> base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
