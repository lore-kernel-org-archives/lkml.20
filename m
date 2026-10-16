Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B7547041
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110503; cv=none; b=AmevnPMdHn5TUQpHoYY1Ij+WHzc7HPBOA4PIan52Dj0Ygh7kkMAyn4PyNs6FLv1naNFnPiKvqZdw7cb8N6l4cI93auQIX5dXQ33xWV/YcMDGTHmsSov3Y5195bYUKgPCjfifSyY0GRgDnjm2D0exQmVqhq6jB75a3mhQesAP/rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110503; c=relaxed/simple;
	bh=JrV2aaGMxvDa8l4Ok451VQGmYrMHjM9953t4XfUJa/Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iG2AtXMJHnDXSJSFlZEGKv6pb05TRoGPJM+kdTc3I4UTwksJhTpHOKwxtBOFIGAIyt9+M8vkkvK/4WUTaF7SEulYMsaz+N8FjTqaa5L5VwXNi9SaSPA3xcuq2Ox/oVcsA8uSgev93lgpO/KATBJCsVAHxgZ9QGs2NM4N8xopsd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cQ3/riAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cQ3/riAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686361F000C4;
	Fri, 16 Oct 2026 00:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792110502;
	bh=8tChevyDCNpHwTF6VNwlTOZAk8TDbJCK/O52gp4miT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cQ3/riAL9kw/dqN6Oigdw8FG/7/Hdfr7otqyORVpjcGZh1l+5sfriH2LIq58Lhe6q
	 jR9kJwWGxjvvmfdN3RFPvDBhfN7Ne5xo1MAC7SDWo2S+ls9jVdLCl8BwWvf4gFWQy0
	 MOLupzKsLaRhF+5VZL+c7h+2+ePrAswKvyMs/PLg=
Date: Thu, 15 Oct 2026 17:28:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, David Laight
 <david.laight.linux@gmail.com>, Rik van Riel <riel@surriel.com>,
 ljs@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@kernel.org, Mike Rapoport <rppt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Pedro Falcato <pfalcato@suse.de>, Kiryl
 Shutsemau <kas@kernel.org>, luizcap@redhat.com, pbonzini@redhat.com, Tal
 Zussman <tz2294@columbia.edu>, Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-Id: <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
In-Reply-To: <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
References: <ar/F6+OUzj8qQ8YC@pcnci.linuxbox.cz>
	<asAE3kLFDUx5v0Nw@gremlin>
	<asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
	<bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
	<20261005132113.43548696@pumpkin>
	<asP5xK4axiUk7jun@pcnci.linuxbox.cz>
	<aseMsMGpGPT/G548@pcnci.linuxbox.cz>
	<20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
	<20261009090042.39ba9c06@pumpkin>
	<aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
	<20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 16:57:36 -0700 Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Oct 12, 2026 at 01:43:30PM +0200, Nikola Ciprich wrote:
> > Since I didn’t have anything else to try, and we started having
> > crashes on our own cluster nodes, where I can be a bit bolder,
> > I built 7.3-rc6, deployed it on two problematic AMD nodes, and
> > started a migration torture loop.
> > 
> > Over the weekend, there were ~70 migrations of ~160 VMs between
> > those two nodes without a single issue.
> 
> Did it reproduce usually with this?
> 
> If not, keep hammering on it with the latest kernel. We might've fixed
> whatever that was, along the way. :-(
> 
> And if so, that would be a damn nasty bisection to figure out what fixed it...
> 
> So pls hammer on it as long as possible to see if it is really fixed or it is
> simply harder to repro.

fwiw, I fed a lot of tokens into $LLM and it suggests that 55780d8a1dcc
fixed this.

If that sounds sane then testing 55780d8a1dcc on that 6.18.x kernel
would be useful.


: The repeated structures appear to be AMD VMCBs: 0x0fffffff0c930020
: decodes as segment state (selector 0x20, attributes 0xc93, limit
: 0x0fffffff), not a damaged pointer.  The FS/GS offsets in the dcache
: corruption and the LSTAR/CSTAR/SFMASK offsets in the earlier library
: corruption suggest misplaced VMLOAD/VMSAVE state transfers.  A
: candidate fix is 55780d8a1dcc (KVM: SVM: Stop toggling virtual
: VMSAVE/VMLOAD on intercept recalc), which is absent from the inspected
: v6.18.53/v6.18.55 code.  In the affected
: svm_recalc_instruction_intercepts(), VMLOAD/VMSAVE interception is
: changed in vmcb01, but virtualization enablement is changed in the
: currently selected VMCB, potentially vmcb02.
: 
: Although the commit describes this mismatch as benign, restoring a
: fresh destination vCPU directly into L2 appears to expose a case that
: assessment overlooks: deferred intercept recalculation could clear
: vmcb01s intercepts while enabling virtualization only in vmcb02,
: leaving L1s subsequent VMLOAD/VMSAVE instructions neither intercepted
: nor virtualized.  That could make guest-supplied physical addresses
: target host memory, consistent with the observed corruption.  This is a
: source-derived hypothesis, not a reproduced root cause, and depends on
: an affected vCPU actually being restored in nested guest mode.  Could
: we confirm that condition and test a backport of 55780d8a1dcc?  A
: useful vmcore check would also be whether any live vCPUs vmcb01 has
: both VMLOAD/VMSAVE intercepts clear and the virtual-VMLOAD/VMSAVE
: enable bit clear.
