Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB95221D3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183852; cv=none; b=X7KyW32nuQJWPr7SIbsUQvIFqH0LfBuYK8jHcoh0gZeR7KP6yTZVJQbwOzao8WG+nZsFFMKgrXzlEqfbZRTpmFGHsihxvC/2cr5Ab4SuCBWXAWrpM+/WD0gbPvvR3FFYtglc+nAdgw7zKaNuHMtfQ67EZ4IqIOQPBTbWLiiaE4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183852; c=relaxed/simple;
	bh=Evj1zRFLuCBqOI2af1jBeQbnmctt7kC94rtbAZdc6eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN0KH1Qe05mmAa7hT5NTimfhC7pVx6Udtj5ZgMquW1RdOooTIhN0BkhW/1ykcDYHDyIFHZJPbYJIDJi8pokVHXx8qxS9855qaDEGnlo0/pQt0U2H5HfUTe0N8JhJ+m0h6GiNKlFleGIAhFPIXJ/ZfR8UqxpYFA3PdpiDIDyiDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mawYqY5Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w9GCzgqB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ym5SOG38; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=whq/18A/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mawYqY5Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w9GCzgqB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ym5SOG38";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="whq/18A/"
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C6EE2243C;
	Mon, 31 Aug 2026 13:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788183843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCGtVk2TLoYPQQbbcLiU13lbdiQg9aIvtEsS4hGMzfs=;
	b=mawYqY5QZTArcFrAlqIIOi6lf/hFV7BHS0unR88MfhHuBvMLENScplC5j2+aHujPmOh1vK
	TaOuGeN7sbhv70xmszaDqdD5aqY0/8+RjZ8d7geIuh4FOOmOQGVEeedy5CsjMBtLXKcKPg
	bNF/+0csUkeZ4tKolJ19wcECpIaipCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788183843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCGtVk2TLoYPQQbbcLiU13lbdiQg9aIvtEsS4hGMzfs=;
	b=w9GCzgqBFAgiLQlIenVZ6E0+hn0b4LdHYfGJyGj8il9LdrcitVKF9MiFRSTtjYa8QUogB7
	7+tzSLMpfi/6unAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ym5SOG38;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="whq/18A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788183839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCGtVk2TLoYPQQbbcLiU13lbdiQg9aIvtEsS4hGMzfs=;
	b=ym5SOG38qywxFnIIhthZPP3kQvSZN4DzL/jiv44Jc6lH/X7D8ud3dfjqzFhNH5mdmeBMyW
	PC0x4vL3YoiN6JAx+DEb7DnQ8pvnqST6dqhmq6dGm1vlT/pVbsIws1TvQFzn/2ksc9ROGb
	YusviI7fb+l8VeXNxOs0F5pA2RpbYCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788183839;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCGtVk2TLoYPQQbbcLiU13lbdiQg9aIvtEsS4hGMzfs=;
	b=whq/18A/mt61lCiP7NJOQ3oFGNBGzSYhOXZ7B0E2ruPALCK1pWOlNDkSx9hoOwpgmRYZpu
	hQUbwSCU0/dEVpAA==
Date: Mon, 31 Aug 2026 15:43:58 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Renzo Davoli <renzo@cs.unibo.it>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v7 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall
 skipping support
Message-ID: <apWFHkZnCMfxQCEk@kunlun.suse.cz>
References: <20260831082753.165731-1-renzo@cs.unibo.it>
 <20260831082753.165731-2-renzo@cs.unibo.it>
 <apV_j5GvklbgmjAk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apV_j5GvklbgmjAk@redhat.com>
X-Spamd-Bar: +++++++++++++
X-Rspamd-Queue-Id: 8C6EE2243C
X-Rspamd-Action: add header
X-Spam-Flag: YES
X-Spam-Score: 13.59
X-Spam-Level: *************
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [13.59 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.10)[-0.512];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[cs.unibo.it,vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io,alpha.franken.de];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unibo.it:email,strace.io:email,suse.de:dkim]
X-Spam: Yes

Hello,

on some architectures the syscall return value overlaps with the syscall
number or syscall arguments - see
https://www.man7.org/linux/man-pages/man2/syscall.2.html

When calling a seccomp filter the filter is able to return a value
which then tells the kernel if the syscall state should be interpreted
as entry (syscall nr + arguments) or exit (syscall skipped, registers
have return value).

ptrace has no way to return a value, and from the register state alone
it is not possible to tell if the syscall state is entry or exit.

Some architectures affected by this overlap problem implement an
architecture-specific thread info flag that tells the kernel that the
syscall is alreaady dispatched. However, this flag is
architecture-specific, and you would need to set it in architecture
independent code.

You could make this flag architecture independent (and even set it to 0
on architectures that are not affected) which would then allow this to
work in general.

Otherwise this API is non-protable, and broken from the start.

On Mon, Aug 31, 2026 at 03:20:15PM +0200, Oleg Nesterov wrote:
> Well, still looks good to me...
> 
> But I forgot (sorry, actually didn't really read) the previous discussions
> and IIRC Michal had some concerns about this patch. And you don't CC him.
> 
> Michal, can you take a look? Do you see anything wrong?
> 
> Oleg.
> 
> On 08/31, Renzo Davoli wrote:
> >
> > Extend PTRACE_SET_SYSCALL_INFO to support skipping a system call triggered
> > via seccomp.
> >
> > When a tracer retrieves a ptrace_syscall_info structure with 'op' set to
> > PTRACE_SYSCALL_INFO_SECCOMP, it can now choose to skip the system call.
> > To do this, the tracer changes 'op' to PTRACE_SYSCALL_INFO_EXIT and
> > populates the exit union fields (rval and is_error) to define the return
> > value and error status for the tracee.
> >
> > System call suppression via PTRACE_SYSCALL_INFO_ENTRY is currently not
> > implemented.  On some architectures (e.g. MIPS), when a system call is
> > skipped by setting the syscall number to -1 at the entry stop, the
> > architecture entry path unconditionally overwrites the return value
> > register with -ENOSYS, clobbering any custom return value set by the
> > tracer at the entry stop.
> >
> > Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
> > Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> > Reviewed-by: Dmitry V. Levin <ldv@strace.io>
> > ---
> >  kernel/ptrace.c | 27 ++++++++++++++++++++++-----
> >  1 file changed, 22 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/ptrace.c b/kernel/ptrace.c
> > index d041645d9d17..64fd1b455297 100644
> > --- a/kernel/ptrace.c
> > +++ b/kernel/ptrace.c
> > @@ -1099,7 +1099,7 @@ ptrace_set_syscall_info_seccomp(struct task_struct *child, struct pt_regs *regs,
> >
> >  static int
> >  ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
> > -			     struct ptrace_syscall_info *info)
> > +			     struct ptrace_syscall_info *info, bool skip_syscall)
> >  {
> >  	long rval = info->exit.rval;
> >
> > @@ -1111,6 +1111,9 @@ ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
> >  	if (rval != info->exit.rval)
> >  		return -ERANGE;
> >
> > +	if (skip_syscall)
> > +		syscall_set_nr(child, regs, -1);
> > +
> >  	if (info->exit.is_error)
> >  		syscall_set_return_value(child, regs, rval, 0);
> >  	else
> > @@ -1125,6 +1128,8 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
> >  {
> >  	struct pt_regs *regs = task_pt_regs(child);
> >  	struct ptrace_syscall_info info;
> > +	int op;
> > +	bool skip_syscall = false;
> >
> >  	if (user_size < sizeof(info))
> >  		return -EINVAL;
> > @@ -1141,15 +1146,27 @@ ptrace_set_syscall_info(struct task_struct *child, unsigned long user_size,
> >  	if (info.flags || info.reserved)
> >  		return -EINVAL;
> >
> > -	/* Changing the type of the system call stop is not supported yet. */
> > -	if (ptrace_get_syscall_info_op(child) != info.op)
> > -		return -EINVAL;
> > +	/*
> > +	 * Changing the type of the system call stop is not allowed, with the
> > +	 * following exception:
> > +	 * PTRACE_SYSCALL_INFO_SECCOMP can be changed to PTRACE_SYSCALL_INFO_EXIT
> > +	 * to skip the system call
> > +	 */
> > +
> > +	op = ptrace_get_syscall_info_op(child);
> > +	if (op != info.op) {
> > +		if (info.op == PTRACE_SYSCALL_INFO_EXIT &&
> > +				op == PTRACE_SYSCALL_INFO_SECCOMP)
> > +			skip_syscall = true;
> > +		else
> > +			return -EINVAL;
> > +	}
> >
> >  	switch (info.op) {
> >  	case PTRACE_SYSCALL_INFO_ENTRY:
> >  		return ptrace_set_syscall_info_entry(child, regs, &info);
> >  	case PTRACE_SYSCALL_INFO_EXIT:
> > -		return ptrace_set_syscall_info_exit(child, regs, &info);
> > +		return ptrace_set_syscall_info_exit(child, regs, &info, skip_syscall);

Here it might be preferable to define a new function that does the
skip=true part and calls ptrace_set_syscall_info_exit.

Looking at the code it would not be the first.

Thanks

Michal

> >  	case PTRACE_SYSCALL_INFO_SECCOMP:
> >  		return ptrace_set_syscall_info_seccomp(child, regs, &info);
> >  	default:
> > --
> > 2.55.0
> >
> 
