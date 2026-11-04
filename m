Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801117;
	b=UjE2XzreAqxnmiGoRy7EDSfNaIgfot/nVIVc5P5/DFepzQ0/E3+isn4UWwJSYLvZCi3I
	 95eIxnApVz1ALvUfiCzq8hUvcihFjEwmwKZ4yfc0q+LnVlMYJ8jfJWeCMqkquSo+x78hA
	 YcBNI2MGA/OhKkBmObqhF4YQVRaO8OFt6N52seXMyPO8/G384As7aYWtO6RIVUlRRjOnA
	 ddZM3H634ApuwsQqBnuKdYLd2SVGfzzDvHoTZ5zoXYw2T4ZdQUfw56yDvcpoKVSLFAdJY
	 lUnguBB90ngnh8xBbc26UbEtO+f2S+/nI/cEKWuKwAGJhAFUlMoaU58XfvxnW99E8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801117;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eH9cP+eSCph2k6r+Y5Wz7HRU49O/httC0nGpICpjyGY=;
	b=o2M4RRuZeDWpmumZ9eqh8tCmWlaR47cDdGyF1waj/GCVklJODZTe1PLBBNvJkHN7v1Es
	 buo0Pt5XWNzO5/Ln5uasNvo01wvPBgod+1ltUggW+xFTZK3Mr47M9cADy28f0pQ1eRbJi
	 z+UR4YcPtGwyKYp8VsKnxrfv4d+w6OXjSExIdgH46Ah14MqEN55YZ39/ZoiREfbXmvm9n
	 dwVkSFcpucw8jPvW4D5pp7dnbUkJks3ufoIyqfOQJbuL53tieJIcW/yOtFwtkE4+h/spf
	 4bgjoCDzdElgSfsjBWk7ltu2cHRdjjsEy+IvPZGdtGNmqL0F3z7fySSRBTe2UuREVxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhQ25LS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905E606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFhQ25LS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1161F000C1;
	Wed,  4 Nov 2026 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801117;
	bh=eH9cP+eSCph2k6r+Y5Wz7HRU49O/httC0nGpICpjyGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFhQ25LS6X8qFxZw+3UIXhlc5l0jQ2ka1gGkAeCYFAa5lpRq2bVUcA1h0kqugd6Q2
	 OPPSDJv2HXSXByIRZvS0a4o8r+fm07mesoJdu2PMdDW11eANd4OdCxrhzXS8/aH9ne
	 yPBEoVek3oXs2suxt3CPsujAYluewP8XYd27E5FY+iTE6MUZajETjVBeiLUKa770ax
	 9R+Jp+mqLJzkyzJZgtDi3fUWxtdc+4H2MOKurlulaE6cnRie3B5wLL1ZQlYzF1H3A4
	 5KEBRVfqEcqbqJJYFq4ghyexetbZ32/JEEnzONhUuEeYcP6l0T4pvBoRDHPN3dHUCg
	 k2PgtJB//J+Zw==
Date: Wed, 4 Nov 2026 14:05:12 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <aus7mMS4tXAzPCSi@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
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
In-Reply-To: <attf9KALBQyOGyco@redhat.com>

Hey Oleg,

On Fri, Oct 23, 2026 at 03:24:04PM +0200, Oleg Nesterov wrote:
> On 10/23, Zhao Gongyi wrote:
> >
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	if (regs->syscallno == NO_SYSCALL)
> >  		return;
> >
> > -	/* We should only be called when target is in a ptrace stop */
> > -	if (WARN_ON_ONCE(!info))
> > -		return;
> > -
> >  	/*
> >  	 * For compat tasks, orig_r0 is provided directly through GPR index
> >  	 * 17.
> > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> >  	 * return value of the system call.
> >  	 */
> > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> >  		return;
> 
> LGTM, but I don't understand this arm-specific code.

Welcome to the club :)

The original rationale is described in e057b9477232 ("arm64: syscall:
Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
helps to set the scene. The crux of the problem is that the x0 register
on arm64 is used both for the first argument of a system call but also
for the return value, which causes difficulties for things like syscall
restarting, syscall skipping and syscall reporting in /proc/<pid>/syscall.

We handle that by keeping the original argument value in a shadow variable,
orig_x0, in the pt_regs and using that to implement the problematic
mechanisms above, including the accessors used by seccomp in asm/syscall.h.

The bug was (a) that we only copied x0 into orig_x0 early on the syscall
path (el0_svc_common()), which meant that tracer updates to x0 would not
be visible to seccomp filters and (b) that we passed x0 to the syscall,
which meant that the unchecked value was used as the first argument.

My initial fix (in e057b9477232) tried to copy x0 back into orig_x0
after tracer updates on the syscall entry path, however this didn't work
with some of the more complicated seccomp interactions (involving BPF
programs and SECCOMP_RET_TRACE) and so commit 88b839ce497c ("arm64: ptrace:
Keep 'orig_x0' in-sync with x0 on syscall entry") took a different
approach of updating orig_x0 at a lower-level, whenever x0 is written
by ptrace *and* we're on the syscall entry path. The latter check is
really a "we're not on the syscall exit path" so that we can handle the
seccomp case.

So that's the mess we're in and I'm all ears if there's a cleaner way to
sort it out without breaking anything that relies on the fragile semantics
we already have.

Cheers,

Will
