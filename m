Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6AF374E7A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220290; cv=none; b=n9+gKa2lKcAZxTCVqnMdUPBsEBMa0yJtZBCCKd7FjqcXHoYP3Lbjyp7isLH/yc9XNAb7YvmsQSdFMANi0PIGryYAOAAM5nuYoR2w8wLSTsIjvqEAhUGhdknXwW5dnRJkDfa5W73o5C8RnkngSX0Fjo0QTEDs0YfEMW9lSN8upaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220290; c=relaxed/simple;
	bh=cwbLYLitS7LEcU4XgagnKGY2mKrmOuDb6Qdoi3vYmAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thBg0//92LdcV5y/X5h/BEGSLkYUSr39Fa3tnjMY3FJv+DjShD3JGq0lmu0DD/cyhFhyIrA0Rj2R8nJNfCyvqeXzuucniXoxfmEGV75c2OLUu1TbF6DB0vw1H9naNrIMz6fQGs9/mOo8Hj86/WOrP5oyIQNo2MFGTPXUMWjvnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVIi/+0d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVIi/+0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2262C1F000FF;
	Thu, 24 Sep 2026 03:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790220289;
	bh=dS6xM6YKItsqX75coPt9kSWsKNwEnbwlGIyOx/9zO8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVIi/+0dEQUUXrlcQIzjIda5APKTOT2TOqRxnewI7oKhPL7+264rB+gfcnAGJRhp+
	 p8g0qSYubY/+9TwrNUvZ8KGZs4FjbHV7DBbvlO0LVuFLXBd1+vIcRfYaAL9Uxl7VLU
	 cyyseibybD8Pu44eWCgpLxNlhQ59AfiPYmiTFlpx46M/UmeKBXRcJnNRPyOevUZeMF
	 ufN57uHZHD7CVx2XPVx6pcUT1QIDXK0wOpVIJs9EN/j74vwcTW1Whoa6F1XDoQoH1B
	 haAn05ePyB/1uhPqUB7iXjYFwIbRXDXobmHYts2lhMuN+lConEENbnzGl1oHde5gf3
	 wpkk3xXXO5WSQ==
Date: Wed, 23 Sep 2026 20:24:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
Message-ID: <20260924032446.GA5048@sol>
References: <20260831185706.90103-1-ebiggers@kernel.org>
 <20260923211450.GBarRBSoXGFKvUBwe7@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923211450.GBarRBSoXGFKvUBwe7@fat_crate.local>

On Wed, Sep 23, 2026 at 02:14:50PM -0700, Borislav Petkov wrote:
> On Mon, Aug 31, 2026 at 11:57:06AM -0700, Eric Biggers wrote:
> > Since commit ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related
> > glue code"), X86_FEATURE_FPU is mandatory.  If it's absent, the kernel
> > halts execution in fpu__init_system_early_generic().  Remove unnecessary
> > checks for X86_FEATURE_FPU that occur later in core x86 code.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > ---
> >  arch/x86/kernel/fpu/bugs.c   | 4 ----
> >  arch/x86/kernel/fpu/core.c   | 2 +-
> >  arch/x86/kernel/fpu/init.c   | 2 --
> >  arch/x86/kernel/fpu/xstate.c | 5 -----
> >  4 files changed, 1 insertion(+), 12 deletions(-)
> 
> Sashiko might have a point here:
> 
> https://sashiko.dev/#/patchset/20260831185706.90103-1-ebiggers%40kernel.org

Sure, there's more stuff that can be removed too.  It will make for a
large patch, but I'll try to get the rest in x86/fpu code.

- Eric
