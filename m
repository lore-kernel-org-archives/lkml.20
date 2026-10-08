Received: from mail-108-mta169.mxroute.com (mail-108-mta169.mxroute.com [136.175.108.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E13DDAED
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497263; cv=none; b=Flj6uFpjAPIPMtAFJJ6zKt9tWleI+ql2h+8rUpsO4VvdZtyW1Ela4NvyvbH0rXgEAQKVmp3LgylM3nR7bcMcJCt3AN/qdpiu0KiUSpT5fnE/b7NQFaz8I/maC7dQOF82AW+vBXjZQqYqktAvqn0xTfFijYzaVizN3ngQiiBB66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497263; c=relaxed/simple;
	bh=L1mx8sak6hZtHhg5DUdFfJIP9A/aaNZH5W/kiQKTq+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hfg267SPgJeIgJCQZMIgxqfLWZ6JWZ0OWgfruOe+5VVe9MJ6SDK7vEqZeWzQemDaPnN4ncrgUpNWBN16jdVWCk9L5ng/7FPrxKvG0IQSXlAYFCvhLjggiHinCnZRG7jcNXCZFOJMoMajDR+ba9+R6LRIEOGKkacx9LvqDXh9QQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=ZdwOw+X/; arc=none smtp.client-ip=136.175.108.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="ZdwOw+X/"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta169.mxroute.com (ZoneMTA) with ESMTPSA id 1a11d8a16a200028b2.00c
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 08 Oct 2026 22:02:31 +0000
X-Zone-Loop: fa648216e3d16b546320eaad5b6035aecfa00aa405ec
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+JBa/UpW05diveQaJQTaNloDGKgL+DnD+0i1Ut6M2f8=; b=ZdwOw+X/pK0MrpN8H1tVG/28dj
	g6lY/0y6kiahvUvRt+xlw0W3ovC/JqSDiQ7E1Bga+BqtBafWpYPNUMtnu0RjTzHEK+btEh1/WUIly
	T8iD2WCOS1LKuthjtBLjaOttc++9YzfjA4kOCvh4tcjwkkL3EOIkhLuZHHA5LMIUq2rCM6hDxB0o7
	6X7nVrIDgA0clyqqpZW0ds3YK64UrkmIFrj46ZeilI+dzOq5LYsDfa11IYuZMtFpqVZ6I+Ve+Fq8c
	EclWcPh0Ml/HyMtZ0Q31/q5ao1q6yRTsKKj3klp+COd6HkFsDS0aa0fPwr5yMcEMNhatds3xMHpAw
	KcvzPIyA==;
Date: Thu, 8 Oct 2026 22:02:19 +0000
From: Richard Patel <ripatel@wii.dev>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "fweimer@redhat.com" <fweimer@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"david@vortan.dev" <david@vortan.dev>,
	"xin@zytor.com" <xin@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] x86: usermode IBT and signal handling
Message-ID: <asgS64GnvOH781hw@wii.dev>
References: <asZJ7Q1W+Fd/RFoO@wii.dev>
 <6ddd6b564eee6be56150e39bd34c41d29f6315d9.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ddd6b564eee6be56150e39bd34c41d29f6315d9.camel@intel.com>
X-Authenticated-Id: ripatel@wii.dev

On Wed, Oct 07, 2026 at 03:28:02PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-10-07 at 13:32 +0000, Richard Patel wrote:
> > 2. Where to preserve WAIT_FOR_ENDBR across signal? Options:
> >    - shstk signal frame
> >    - signal frame fpstate (carve out a bit in _fpx_sw_bytes)
> >    - uc_flags
> 
> The shadow stack signal frame is extensible to fit things like this and gives a
> nice security protection for the bit. But I'd consider pursuing the simplest
> option first. This option requires making IBT require shadow stack though. It
> probably is the common case.

The problem is changing the shadow stack signal frame layout breaks a
few userland apps that were already written to hardcode it:
- libgcc's C++ exception unwinder runs into a parse failure if the frame
  is extended (_URC_FATAL_PHASE2_ERROR)
  https://github.com/gcc-mirror/gcc/blob/master/libgcc/config/i386/shadow-stack-unwind.h
- CRIU (process migration) hand-builds such a shstk signal frame
  https://github.com/checkpoint-restore/criu/blob/criu-dev/compel/arch/x86/src/lib/infect.c

It might help with logistics to allow apps to evolve shstk and IBT
independently also.

> The original patches found a bit in the normal signal frame, but I don't think
> it ever got fully settled? In any case it would need to be revisited at this
> point.
> 
> But the best option is probably the one with the least resistance. It might be
> shadow stack, since that is off to the side. We can always harden things with
> further changes (add to shadow stack), or extend to IBT-only later.

The original patches used uc_flags but that didn't work with 32-bit
sigreturn, but that's easy enough to just ban.

I just didn't like the cosmetics of uc_flags anyways, there's a more
elegant way to use a reserved fpstate bit.

> > 3. OK to break legacy 32-bit sigreturn if IBT enabled?
> 
> IBT needs userspace enabling to work, and legacy 32 bit userspace is basically,
> well, legacy. So unless there is any serious user that pops up, we should just
> not supporting user IBT for 32 bit. This simplifies things. BTW we don't support
> 32 bit shadow stack.

Wouldn't you need extra code to prevent IBT from working in 32-bit mode?
Since the user can just far call into 32-bit without asking the kernel
AFAIK.

With IBT state in fpstate, IBT would work fine for any variant of
sigreturn (32-bit and 64-bit) all in the common signal frame restore
code, no need to modify any syscall handlers.

So, I'd argue it's simpler to leave it enabled in 32-bit compatibility
mode even if no one ever used 32-bit IBT. We should certainly prevent
IBT from being compiled in for true 32-bit kernels though.

> What happened to the discussion of a PROT_IBT (like PROT_BTI)? I had POCed two
> ways to do it and one was not that bad. The legacy bitmap thing is not easy to
> use here, and I don't recommend it. But handling IBT #CPs by looking up the VMA
> of RIP was pretty compact. If the VMA has !PROT_IBT, then clear the TRACKER bit

Sorry, I just forgot about them! I like the idea. 

Do you think we should do PROT_IBT first or prctl or both?
I'm happy to help upstream the POC, please let me know.

> and proceed. This punishes mixed mode apps indirect calls (not *that* horrible
> IIRC, I've lost my test results), but doesn't hurt fully enabled apps.

Could you share your POC?
I'm curious about the overhead on top of a regular GOT-PLT inter-DSO
call. There are probably apps that spam those, so if ld.so started
enabling PROT_IBT automatically, those apps would probably be confused
by any performance regressions.

> Now, the security question of whether a mixed mode makes sense, is valid I
> think. But the issue we struggled with a lot for shadow stack was compatibility
> of apps made of multiple packages (which is a lot of them), or which have JITs.
> So I think a mixed mode would be valuable if it can be a stepping stone to a
> fully locked down mode eventually. For example, start with a more permissive
> prctl that turns on mixed (PROT_IBT) mode. Distros and other wider enablers can
> use this without fear of crashing apps with JITs, etc. Emit a pr_info() or
> something that incentives people to fix their libs. Then later distros can
> switch to a fully enforced on thing.

I think pr_info() instead of crashing is a really cool idea! I will port
this to the prctl() app-wide API. We'd disable IBT and log to dmesg on
the first violation in log mode. (hopefully loudly enough so that the
distros' error-reporting telemetry uploads them)

This allows glibc/distros to roll out IBT immediately.

> But would be good to hear updated opinions from the distros on this. (maybe I
> missed it?)

Wasn't sure who to CC, Florian what do you think?

> > - IBT enablement sets both ENDBR_EN and NO_TRACK_EN
> >   (enforce endbr64 on indirect jumps, allow 'notrack' prefix to opt-out)
> > - vDSO polishing needed (add missing endbr64 markers, GNU property note)
> > - signal handler entrypoint does not need 'endbr64' (the signal handler
> >   entrypoint cannot easily be changed)
> 
> I think the signal delivery should manually check for endbr in SW. Using
> something like the speculate loop in shstk_pop_sigframe(). What is the problem?
> 
> At the same time, something small that actually upstream is better than nothing.

It's trivial to enforce it. But generally the less endbr markers the
better, because it reduces valid sites for `call rax`. Hijacking a
sigaction call is much harder than smashing a function pointer.

Userland should eventually do a variant of FineIBT where the callee
checks a cookie that the caller sets, e.g. `mov r13, MAGIC; call rax`.
If the kernel required endbr for signal delivery, that blows a gap into
the cookie mechanism. The signal handler would always be a valid target
because such a cookie can hardly ever be part of uapi (kernel signal
delivery wouldn't know what cookie the userland handler expects).

Thanks,
-- Richard
