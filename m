Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039570;
	b=fB2fKxFAaP1ETTmywk6BsL3Vy5vbvD1m8aUP9h/b2gVqTddwRYINWXDv1phkUJQB4S28
	 J2DZNK3wONJINkCcYKNl6s1Ltju0FfunQwL7HZ08XJsAQeP9bKJg+2AIPnXrPHGXeLp5O
	 reeEY86EBU9t4y4isxI2uhjTWdQFuOWA9n+85jvV2N5m1IByanM234/LAarMIW+DQWcUU
	 GCQFyG5JguRDr0R+pUPXp+vIJENVrvvwqeFNMHzx8GWiWlk8RtiWwyd6MCFmAEvpimLSt
	 UzrjIbu4Kcn2CRgFbSEtJNKk0Yhzb0nvunHkMzD1nnS6uJ9cUHi71D0UFFSdmu4z2DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039570;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yBDBfddaUvxfPKX7S3biSebLhWa78wPzWcZi2nvKfc4=;
	b=10HS5mYOnYtUpY/hqAvb8pTY//BNgGOvIEQvdVebKYR8mSC7cZdCDS2WvDnH8Kq8XrTF
	 zIJ7h60zI8/wTLiFmtv4XPwLgDaZkpdDWo3+yi+OYkvrJRNo0KTM37CpNLjO586M6f0tG
	 7fJm/p1ST3fr8cWUAs0l8cgYH3HR+BdIUk9xwAcI4QYsP9i7KUxQ0tQcoiTBHGTqfEvrJ
	 S79nxdFzxzXqXozP3qcS7x3l+uSrrnHxYvutp89imLctMOQzfg0yJomQ4FC11sFDT83OX
	 ery+PXlvQHE+9ReeEq0z0HzU7x1bIpGZol2+h+iXXbK6nLYPHy5T22VHczXxPvMuXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JeJjMLC7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26836606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26836606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JeJjMLC7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 426D415A1;
	Mon, 26 Oct 2026 11:32:46 -0700 (PDT)
Received: from arm.com (RQ4T19M611-7.cambridge.arm.com [10.0.144.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52D0E3F7B4;
	Mon, 26 Oct 2026 11:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793039569; bh=KyOTK+JHmlO+rcDJ12BHciVm13fsPWlRYD/5lfdsduk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeJjMLC7Y+Do9bszcjHu+F7V++WE6b4FSUWOc+6miEWnE6wx7ab8VGUpWBKoWZwQd
	 1VHo2IYXWh1soAcUMux5cYpkxT42ynzJmu7VJOZdoe2F5ukJtWee7fnPC2Wnect0eo
	 ZTz5Z100eZ85VG8/o7b9PL4ei0CSnJjaYhZ0al+8=
Date: Mon, 26 Oct 2026 18:32:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: will@kernel.org, mark.rutland@arm.com, oleg@redhat.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <at-czRUYRPRxi9dy@arm.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023110710.10145-1-zhaogongyi@bytedance.com>

On Fri, Oct 23, 2026 at 07:07:10PM +0800, Zhao Gongyi wrote:
> PTRACE_ATTACH to a group-stopped child can enter do_jobctl_trap(),
> which calls ptrace_stop() without siginfo. If the tracer writes
> NT_ARM_SYSTEM_CALL, system_call_set() can change syscallno from
> NO_SYSCALL before calling update_syscall_orig_x0_after_ptrace(). The
> WARN_ON_ONCE(!info) then fires, although this is a valid ptrace stop.
> 
> Remove the warning and guard the syscall-exit-stop check against a
> missing siginfo. Keep recognizing both SIGTRAP and SIGTRAP | 0x80:
> syscall-exit-stops use either value depending on whether the tracer
> enabled PTRACE_O_TRACESYSGOOD. With no siginfo, allow the final
> assignment to synchronize orig_x0 from x0.
> 
> Fixes: 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> ---
> Changes since v1:
> - Remove the warning and early return, as suggested by Oleg.
> - Keep recognizing syscall-exit-stops with or without PTRACE_O_TRACESYSGOOD.
> 
> v1: https://lore.kernel.org/r/20261016024536.18938-1-zhaogongyi@bytedance.com
> 
> Tested on arm64 KVM at af32da41b032 with this v2 applied.
> At a group-stop, PTRACE_GETSIGINFO returned -EINVAL and an
> NT_ARM_SYSTEM_CALL write succeeded. Syscall-entry and seccomp
> x0 rewrites worked. At syscall-exit-stops, NT_PRSTATUS writes succeeded
> with and without PTRACE_O_TRACESYSGOOD (si_code 133 and 5,
> respectively). No kernel warnings occurred.
> 
>  arch/arm64/kernel/ptrace.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f743cbec1..22fb9eeed 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>  
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> -		return;

That's a slight semantic change since this function may now update
orig_x0 even when !info. However, I think it makes more sense as the aim
of commit 88b839ce497c ("arm64: ptrace: Keep 'orig_x0' in-sync with x0
on syscall entry") was to update orig_x0 in all cases other than
syscall-exit-stop. We can't have the latter with !info.

I'll wait for a couple of days to see if Will has any comments and queue
it.

Thanks.

-- 
Catalin
