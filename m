Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325635;
	b=KrTXGiJB6htRkxvc7RmtVAsS1wL+BJwt24d39Un3DgP5kDckmKkA65Kuwla69L6yRNij
	 jbrEZp9tznHc9n8uje8EcLzCvS32oiRL6M/rLhVP0gl0j7K2GnHSX2Sj6ajVdwVtJSQaA
	 mHbLcpQ1oHUHVl/8vmaRyFbYiwzVPgPLLKYFM27Ph51YHIHcvg2ROIO+qZ2Yfhp+xyNF7
	 SGpRdQO3F72xBmJc7zg1BSZU/TTRcr8HInAxfFNOUdCOzHoKTNGRRgJGQTgb/C1XUQ/aJ
	 QsIc7FJKQjvp20dQSP1AGHHcHMdrxlmflbseZOhT+gED0mmLz6kuZudmWhRQkOSrNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325635;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=by6bcN6564jBT2tmqv/JygG7JXTnviQS6zWyMdHXScs=;
	b=3qClA0Q2ALcKumLUA3TupVRmcQEifnvZq8ZO3qEQrFhJnKm74mxP4RPR55JKU2Vh5Ja2
	 5LBQZABZcMMESp5QnpEL4wbiEWH7b+x7rXYxCWJCfCTmUx+OrhGMQ4qFcjeKGao6v1baz
	 5pMBEvOGsRKe9K+uAUAtd1VVsboAlrH1lDgKTj6EHnR2V7sxFyXQYRbyuSHiT29sbm+SO
	 e9NQckxvhQddc6zAcz4KQkvdgAFgiCxmVnDDlRM2b+i4V6EbRbzZi+lrv7XCRfwVadkR9
	 db1/2Y0OO7iU7gDTZ+02ePtcBl/fLGmDj2b/rS48/Lx4SgO9M9rcoua0SVuce/7mYPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNV+rAWN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2519606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNV+rAWN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B4C1F000C1;
	Fri, 30 Oct 2026 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793325634;
	bh=by6bcN6564jBT2tmqv/JygG7JXTnviQS6zWyMdHXScs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iNV+rAWNhau+smI92EasZfEwTAGgXm/g98EHFsjBpmmxOMXG9et4byRsC6DlhFrif
	 BB6f+FVzA/6HeR0Ww4lHN6jPtz20fOvPYw8KfIG341YSTyVK+jlwROGN4tnZuHJh+L
	 ymrSwj6D6UgP2RlBefYRlYug0tle0bPDnQRHjXKQVAqrLIWmQjzVCFVgoR+HDIWsx9
	 jZacvJ6VFSQuu0L7UIAviyQqF8wjtoYAqfjtGxj5imOZ1PtCY3/4AZtGK+blfM+0N0
	 EzxMRDj+XJAjhJs0C8NnS3m0QN/3tQpM2S8tnlXZOuR7O0kDsqjy+oBtz4jhhwFVAQ
	 9TYIC1AaLR6Ow==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, justin.ernst@hpe.com, kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com, linux-kernel@vger.kernel.org, Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Date: Fri, 30 Oct 2026 11:00:29 +0900
Message-ID: <undine-1793325629776229606-c448071ee52df6e1@undined.local>
X-Mailer: UndineD 0.1
In-Reply-To: <20261029103438.69284f7c@pumpkin>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net> <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com> <20261028142625.GU2668564@noisy.programming.kicks-ass.net> <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com> <auJT1Ld3urbqaeA0@swahl-home.5wahls.com> <20261029084606.GE1779021@noisy.programming.kicks-ass.net> <20261029103438.69284f7c@pumpkin>
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
Content-Transfer-Encoding: 8bit

On Thu, 29 Oct 2026 10:34:38 +0000, David Laight <david.laight.linux@gmail.com> wrote:
> On Thu, 29 Oct 2026 09:46:06 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Wed, Oct 28, 2026 at 02:58:12PM -0500, Steve Wahl wrote:
> > > On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:  
> > > > On 10/28/26 07:26, Peter Zijlstra wrote:
> > > > ...  
> > > > > Also, when was the last time you used KGDB? I think I've tried it once,
> > > > > some 20 years ago, and haven't bothered since -- it was *that* good 🙂  
> > > > 
> > > > I can't remember the last time I used it. I also grepped through all of
> > > > my stashed-away kernel configs I've been using for the past 15 or so
> > > > years. The only place I even see it configured in is in distro-derived
> > > > configs. None of my trimmed down debug configs.
> > > > 
> > > > There seems to be approximately one clear commit that shows anyone using
> > > > the x86 kgdb.c in the last decade:
> > > > 
> > > > 	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
> > > > 	Author: Matt Mullins <mmullins@fb.com>
> > > > 	Date:   Fri May 31 12:47:54 2019 -0700
> > > > 
> > > > 	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()
> > > > 
> > > > The only question for me at this point would be whether we should just
> > > > config it out for a couple of releases rather than removing it outright.  
> > > 
> > > I have never used kgdb, but kdb is a different story.  I originally
> > > reacted quite poorly to this patch, assuming from what was changed
> > > in uv_nmi.c that both kgdb and kdb were being removed.
> > > 
> > > I would like to see the kdb action remain in uv_nmi.c, even when
> > > removing kgdb.  Is there a good reason why both were removed?  
> > 
> > kdb is just a local wrapper around the kgdb gunk. If we kept that, we'd
> > still have all of kgdb.
> > 
> > > There have been a number of times over the past few years, on large
> > > cpu count systems that aren't easy to configure for VM usage, where
> > > I have a problem that wedges the system or leaves it unresponsive,
> > > and I enable kdb, reproduce the problem, enter kdb via uv_nmi, just
> > > to dump the stack of all processors and find out what they are
> > > doing, and check other things that I can get to with kdb.  
> > 
> > So this uv_nmi thing looks a lot like sysrq; you could wire up one of
> > them things to use lib/nmi_backtrace.c to dump stacks for all CPUs, no?
> 
> Where would the output go to?
> The kernel message buffer is too short to be useful.
> For a smaller number of cpu something used IPI to get each cpu
> to dump_stack() in turn might be useful as a sysreq command.
> But I've usually resorted to cat '/proc/*/task/*/stack' (or a subset
> thereof) to find where processes are stuck.

Isn't it possible to use another external monitor like capturing
serial output to store the dump results (for logging all dumps)?

If this is intended solely for performing an in-memory post-mortem
analysis (without generating a crash dump) by leveraging KDB’s
debugging information interface, it might be possible to restrict
the functionality to just that purpose by new kconfig. (In this
scenario, the kernel should trigger a panic at the moment of the
interrupt to ensure no further processing occurs.)

IIUC, the core issue here is that intrusive KGDB interrupts—such
as breakpoints and watchpoints—disrupt the assumptions regarding
kernel consistency while the system is running. For examining
the state of an active, running system, tracing is a more
appropriate approach.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
