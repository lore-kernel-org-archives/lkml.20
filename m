Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C443191D3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975923; cv=none; b=VM3dkIZuvtpDnrWHhZX4tYsOoAAol0cdapyjHM+6P2wDCLgSpYKESOYzVrcZ3KDpJgOsKU31wIwZMfKbzG9tY47ZCYCMoY8XGSFnKCwfEw8lc5jytiF6XIu4UpHHE+bNi1+p4j6YsEj79CCOLOecqzBbQUX32l5KBJhcYj1COWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975923; c=relaxed/simple;
	bh=PAJ4lcuLPgZqPE7jcAIWPq7zTZF8+s9TNwS7ib27uKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJwSaq70qRZS1pasDJNGzu7XTWPyijQTkn4OKH6+gI2DxJQ5qqn2CW2XcB13wYAhlKfUm0s0mt51XVGuakbAoT7B3b5HFHkXE8yFOObQ101kegkitjXkyKRlgs1gtwD+I3u8TLMHMe41D/c91S4RlQ8kttg3/DBjPi/xvQu2mAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoRiu169; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoRiu169"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF211F000FF;
	Wed,  9 Sep 2026 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788975921;
	bh=HFfE9HcNi0TUInIwXLNG1j5b62hK4QYJNdno/Y4vvp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BoRiu1695kLhSM+u/zhZmaY1bBjDdI2yzCRIVC0We6j65BDWrYfBwBI5gy4nmXrSZ
	 53nrtnaLlChgV9AaO8Mk9AYm5PCHFazey2AeExyBEsSdyYp5oLmLzwhjxkQU4uPJ1O
	 h6VfVlBIwUg0gHFtZhTnbd3mqZTTgipj4hjjS0Gt0fd9MQzJi7YrNGES+x/1u4RjKh
	 rjcEAVEYHGcy10ZQaGWOEDbf/lqMmXzNJZGkip+oIglJ0Yj9xgc1WxNEp4zw/vG4tE
	 jP+btFjtH1ZvEo7VkVpy0/KOpV08UDgmfXCGUwdbKiRJiCquu2RHxZ6bSlovaeAAMQ
	 uHKwBlv7gxXIQ==
Date: Wed, 9 Sep 2026 20:45:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] x86/mm/pat: skip RWX verification until kernel text is
 set to read only
Message-ID: <aqGbKuaVo5FVGG7l@kernel.org>
References: <20260908092730.4002628-1-rppt@kernel.org>
 <522548e1-ebbf-4785-83d7-e2cc3aa83b62@intel.com>
 <aqEphDuTtIZDANnS@kernel.org>
 <c364b3b6-f8c1-45a6-af3e-8685d9044b0c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c364b3b6-f8c1-45a6-af3e-8685d9044b0c@intel.com>

On Wed, Sep 09, 2026 at 07:22:31AM -0700, Dave Hansen wrote:
> On 9/9/26 02:40, Mike Rapoport wrote:
> > On Tue, Sep 08, 2026 at 05:15:46PM -0700, Dave Hansen wrote:
> ...
> >> How about we add a kernel_strict_rwx() helper:
> >>
> >> bool strict_kernel_rwx(void)
> >> {
> >> 	return IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled;
> >> }
> >>
> >> Have verify_rwx() check *that*.
> > 
> > Checking only that will bring the warning about ITS pages back :)
> > 
> > Both CONFIG_STRICT_KERNEL_RWX and rodata_enabled are set before the
> > alternatives patching. 
> > 
> > And rodata_enabled is kinda arm64 specific thingy :)
> 
> I think I was confusing rodata_enabled and kernel_set_to_readonly as I
> read through things.
> 
> But either way, I really don't like the idea of checking some random
> state bit. It's generally fragile.
> 
> > The check for (!kernel_set_to_readonly) has to stay to actually rule
> > out the silly checks at boot and it covers your strict_kernel_rwx() because
> > kernel_set_to_readonly is only set when strict_kernel_rwx() will be true.
> 
> Could we do something slightly more generic?
> 
> mark_readonly() is awfully close to setting SYSTEM_RUNNING:
> 
>         mark_readonly();
>         pti_finalize();
>         system_state = SYSTEM_RUNNING;

We could check SYSTEM_RUNNING, but OTOH using kernel_set_to_readonly is
consistent with the existing checks in protect_rodata() and
protect_kernel_text_ro() in the same file.

I think that it's better to use the consistent kernel_set_to_readonly now
and flipping them all to SYSTEM_RUNNING ...

> What if we (eventually) did something like:

... when something like this materializes. 

> /*
>  * Get the kernel page tables ready to run userspace.
>  * There should be no page table manipulation between this and
>  * settings SYSTEM_RUNNING.
>  */
> void boot_finalize_page_tables(void)
> {
> 	WARN_ON(system_state >= SYSTEM_RUNNING);
> 
> 	mark_readonly();
> 
> 	/*
>          * Kernel mappings are now finalized - update
> 	 * the userspace page-able to finalize PTI.
> 	 */
> 	pti_finalize();
> 
> 	/* Ensure the final kernel mappings have no W+X issues: */
> 	debug_checkwx();
> }
> 
> and then verify_rwx() can just check system_state?

and protect_rodata() and protect_kernel_text_ro() :)
 
> >> Also, make the DEBUG_WX functionality mandatory for STRICT_KERNEL_RWX
> >> (with appropriate renaming) so that it can be depended upon.  I assume
> >> all the distros are turning DEBUG_WX on already (Ubuntu seems to).
> > 
> > Just checked my Debian config, it does.
> >  
> >> Maybe just do the strict_kernel_rwx() to start and then circle back
> >> around to muck with making DEBUG_WX mandatory?
> > 
> > I though about making DEBUG_WX mandatory right away, but that's surely not a
> > oneliner, so I kept it for later. Maybe should have mentioned in the
> > changelog, though.
> 
> Yes, please. It would be nice to mention that the fix is a bit exposed
> without DEBUG_WX. It could honestly even pr_info_once() about it to make
> it less likely it somehow gets forgotten.

I like the pr_info_once() idea, will add it in v2.

-- 
Sincerely yours,
Mike.
