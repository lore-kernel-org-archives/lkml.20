Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E7415F37
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182433; cv=none; b=s94UbvhnWxyGvTIatRIJaqckREAFnPqWZvt0gMF07RsRWGZYZvE6EuWPvEPC5VURWYByaY8mvVtKFd/kswx95pDVsB2WX3G1acefnKkZVCw8YB4wkMk24jW3kJOZ7eduJE4Cr8edbvJd+70BqVSOywoX0IYmSnJtHaAgsLQaz9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182433; c=relaxed/simple;
	bh=jYUvJB45VZjUiNtTeKRXJPwYP3bpdx8WyEFX2ecKnhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPefuE7tSco5SYvWszDg03NW+HKs/5i+54C4QFoRgY60QZ8riGsX2/zjBTk0Oedwz/YRDzuOr4viZfDVAZlJo0+UONCAwc4XLCX62XTkgNEjcewMBHsFzm7APRI3IvOpUfafxYFPWyiqwn3DOS5yCfJmzZKa21pHWDJMOq7gQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+sU5rTG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+sU5rTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788182430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDUmUNGjgUNn7o2VN5CgE4EJKcE9IQr3kWukbQA5AnQ=;
	b=D+sU5rTGN+GgiEx9xknY8gt2NFbtMIuueaw+c4aTOAFV9bV7Llc/uiYgdd+JsMREPtcxNP
	J1Wpcm91l00tguHoZhYUEJGr+w33OeTh3eaTzCaqPfKNHIFtobkY+XM5hC1YH2uWwjT5n9
	WyfH4n4jHj9JzufiAncExK1IV+trlAM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-BZmdBVglNqqmV4ss1vsX0w-1; Mon,
 31 Aug 2026 09:20:23 -0400
X-MC-Unique: BZmdBVglNqqmV4ss1vsX0w-1
X-Mimecast-MFC-AGG-ID: BZmdBVglNqqmV4ss1vsX0w_1788182421
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE9E519776AC;
	Mon, 31 Aug 2026 13:20:20 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 58C521956049;
	Mon, 31 Aug 2026 13:20:16 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 31 Aug 2026 15:20:20 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:20:15 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Renzo Davoli <renzo@cs.unibo.it>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v7 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall
 skipping support
Message-ID: <apV_j5GvklbgmjAk@redhat.com>
References: <20260831082753.165731-1-renzo@cs.unibo.it>
 <20260831082753.165731-2-renzo@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831082753.165731-2-renzo@cs.unibo.it>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Well, still looks good to me...

But I forgot (sorry, actually didn't really read) the previous discussions
and IIRC Michal had some concerns about this patch. And you don't CC him.

Michal, can you take a look? Do you see anything wrong?

Oleg.

On 08/31, Renzo Davoli wrote:
>
> Extend PTRACE_SET_SYSCALL_INFO to support skipping a system call triggered
> via seccomp.
>
> When a tracer retrieves a ptrace_syscall_info structure with 'op' set to
> PTRACE_SYSCALL_INFO_SECCOMP, it can now choose to skip the system call.
> To do this, the tracer changes 'op' to PTRACE_SYSCALL_INFO_EXIT and
> populates the exit union fields (rval and is_error) to define the return
> value and error status for the tracee.
>
> System call suppression via PTRACE_SYSCALL_INFO_ENTRY is currently not
> implemented.  On some architectures (e.g. MIPS), when a system call is
> skipped by setting the syscall number to -1 at the entry stop, the
> architecture entry path unconditionally overwrites the return value
> register with -ENOSYS, clobbering any custom return value set by the
> tracer at the entry stop.
>
> Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> Reviewed-by: Dmitry V. Levin <ldv@strace.io>
> ---
>  kernel/ptrace.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> index d041645d9d17..64fd1b455297 100644
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -1099,7 +1099,7 @@ ptrace_set_syscall_info_seccomp(struct task_struct *child, struct pt_regs *regs,
>
>  static int
>  ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
> -			     struct ptrace_syscall_info *info)
> +			     struct ptrace_syscall_info *info, bool skip_syscall)
>  {
>  	long rval = info->exit.rval;
>
> @@ -1111,6 +1111,9 @@ ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
>  	if (rval != info->exit.rval)
>  		return -ERANGE;
>
> +	if (skip_syscall)
> +		syscall_set_nr(child, regs, -1);
> +
>  	if (info->exit.is_error)
>  		syscall_set_return_value(child, regs, rval, 0);
>  	else
> @@ -1125,6 +1128,8 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
>  {
>  	struct pt_regs *regs = task_pt_regs(child);
>  	struct ptrace_syscall_info info;
> +	int op;
> +	bool skip_syscall = false;
>
>  	if (user_size < sizeof(info))
>  		return -EINVAL;
> @@ -1141,15 +1146,27 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
>  	if (info.flags || info.reserved)
>  		return -EINVAL;
>
> -	/* Changing the type of the system call stop is not supported yet. */
> -	if (ptrace_get_syscall_info_op(child) != info.op)
> -		return -EINVAL;
> +	/*
> +	 * Changing the type of the system call stop is not allowed, with the
> +	 * following exception:
> +	 * PTRACE_SYSCALL_INFO_SECCOMP can be changed to PTRACE_SYSCALL_INFO_EXIT
> +	 * to skip the system call
> +	 */
> +
> +	op = ptrace_get_syscall_info_op(child);
> +	if (op != info.op) {
> +		if (info.op == PTRACE_SYSCALL_INFO_EXIT &&
> +				op == PTRACE_SYSCALL_INFO_SECCOMP)
> +			skip_syscall = true;
> +		else
> +			return -EINVAL;
> +	}
>
>  	switch (info.op) {
>  	case PTRACE_SYSCALL_INFO_ENTRY:
>  		return ptrace_set_syscall_info_entry(child, regs, &info);
>  	case PTRACE_SYSCALL_INFO_EXIT:
> -		return ptrace_set_syscall_info_exit(child, regs, &info);
> +		return ptrace_set_syscall_info_exit(child, regs, &info, skip_syscall);
>  	case PTRACE_SYSCALL_INFO_SECCOMP:
>  		return ptrace_set_syscall_info_seccomp(child, regs, &info);
>  	default:
> --
> 2.55.0
>

