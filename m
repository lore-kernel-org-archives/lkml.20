Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576581;
	b=CKWuHjgqfQc3tuUo2xU0CTper+IK92tLFSA/M8bXNQoPMfzrOdUB7jF8YZC1zAWto0l6
	 YJop8hNsKk4gCHLHz5vuTSgA+ThYcHN5dr+JIB7O90Vt4LxoIXFXq5GSupADHLqfGouuN
	 +WQir7MEWQTmvBzGJoYkn0lIgELZRMMQB3NAeYTt/8SDwrTJsmTNnEWpy5DXem+cv7Wmf
	 QLrRm02/2Fj75GDeMLVdHt6noXuC/9RlAFNUxupU175Nns9n+WFfQ/MHW7uaYxsdMNy66
	 41dUSPa54mSdeT9qCLVDGDIJ7dXWdFtG1WYcfF2rlShejD7rMwSiDys9468wcflNIcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576581;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mRkP4vCBEhwDwIItCpqDxdPiuMhmAWoHVv8GMq0ZNVE=;
	b=P+7NKdQl20rjq4XHG5vAAsm/fiZBmSKuMI+9sG4xTew8aouN/awRj82ecfT7j2DExaUU
	 rEqobW/hB2bb2bjSClYqHrvupVPDu5kORF+WZj0vqyaebXTO10v8KynJzXQOSFrJMegeK
	 0NMAcdpZ6u6OdVl680YCmtmVT5vA7IasPmRonp+kj69eXGPGgpxoi45CcNLHHBI6LrPsG
	 5mN2F9iijwT8u9Cn4S2tfl+v4juyiE/sIhjh/G3hzqbUXyGM32wSCu/ZwDn2i8v+5HIId
	 zm4lbt4hTAOVB9gz80MIMRDj6lqnAUXqRDQfOgp0m52U7+Vq1ayy8tG6hXmaNBrmYFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlfnLIMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AEB606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlfnLIMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906B01F000C4;
	Fri, 13 Nov 2026 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794576581;
	bh=mRkP4vCBEhwDwIItCpqDxdPiuMhmAWoHVv8GMq0ZNVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DlfnLIMwN2cGm60Lm5wvzQwZPQSEoJ1NEOBxiV0pRcJDHB8KOEVBRTEIB+jq3xMKL
	 aDeuyD3r6ySM9HG1mLuVemktGLPh8HegaxK8cp/GJjEtYRLiFmIUh1F5zvbCNHYpti
	 DOyEcPdNXgOP2mpJA5R5VVU5v4W3RJ8CKSibz03YjWDqImb6iqYQMD6CzqOxphqhpg
	 5egjD/b5OOUzbuG5LApa10dWDUuQgPNQbQiqoQxaoAgBI3G6Mler/U67nVvm+Y9G0d
	 QXLrvPoB1HgL9jXtKAoNwh7Fvo0DiF44ytwUtEUCAM6uhRlwUXeBYxq6BHcnbFveRY
	 l1hdk8ixRzYig==
Date: Fri, 13 Nov 2026 13:29:35 +0000
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kees@kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avcQv3CPk4uxPl70@willie-the-truck>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <aus7mMS4tXAzPCSi@willie-the-truck>
 <avHN-qWRu--arO8a@redhat.com>
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
In-Reply-To: <avHN-qWRu--arO8a@redhat.com>

On Mon, Nov 09, 2026 at 02:43:22PM +0100, Oleg Nesterov wrote:
> On 11/04, Will Deacon wrote:
> >
> > > > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> > > >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> > > >  	 * return value of the system call.
> > > >  	 */
> > > > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > > > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> > > >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> > > >  		return;
> > >
> > > LGTM, but I don't understand this arm-specific code.
> >
> > Welcome to the club :)
> 
> Thank you ;)
> 
> > The original rationale is described in e057b9477232 ("arm64: syscall:
> > Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
> > helps to set the scene.
> 
> [...snip...]
> 
> Thanks for your explanations. Yes, I tried to read that and other commits.
> The only result is that I've managed to convinced myself that more or less
> I understand why 88b839ce497c and 5a87e8c7f3702 make sense.
> 
> > So that's the mess we're in and I'm all ears if there's a cleaner way to
> > sort it out without breaking anything that relies on the fragile semantics
> > we already have.
> 
> No, I can't suggest anything better. I think your patches and the fix from
> Zhao are fine.
> 
> ----------------------------------------------------------------------------
> Now the question...
> 
> So we had CVE-2026-68171 and then it was rejected:
> https://lore.kernel.org/linux-cve-announce/2026081123-REJECTED-f1f0@gregkh/
> 
> Now we have another one, CVE-2026-90347
> https://lore.kernel.org/linux-cve-announce/2026091703-CVE-2026-90347-6f2c@gregkh/
> 
> Why?
> 
> To me the problem looks minor (security wise). Yes, a malicious debugger can
> fool seccomp. So what? What is the real problem from the scurity perspective?

I think the security rationale probably goes back to a5cd110cb836
("arm64/ptrace: run seccomp after ptrace") so you'd need to ask Kees!

I suspect that some environments (Android?) don't want the tracer to be
able to execute arbitrary system calls in the context of the tracee.

Will
