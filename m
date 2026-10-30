Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361242;
	b=aoIOIcbOMxZRkv86joPWyl0/U+Hm+V263tU1L8uit94RpKvxL0I7XL/95sxOofNNXaOq
	 ogROlfQhw7npl5RF36aSD2oDXM2udyF/5HflUMM3GgbrsB9oAr+rRi/+5hOLbLph//0kW
	 gHJO6zsLotGOMznqJpGjhu9k3l0J6FErP2uJhOZKNXsLzU4l7/EDFSqQDvbK5nsNwMhFE
	 jY2FZvUHcVTL63g1jke+yU5IWNm1ehyw/K3fUa/qv4Ozz6GeqeMqKSAbA1Lo39suODqQz
	 JOh0+/CVh0fFNObP350s7M4VLU2D0OoAFtU/BWHCjmR8qyH2Kv+zoC6z+HHHq3o50QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361242;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=x66U5C/iSZTncRHHJDJAZlR5pyUwqAkX43Fg0MqJDS8=;
	b=oYq6nbrH/4yunZ1meLpf4yldbGBLMrxIDBy5DGE9FMjZpKfMHd+WMdpDM9zqJcjRgojq
	 DtXeg3x556ZLhR0194OqkkDINPaOSTZgIW/pCgpAjwFljTDeEC+5sKEa/iqVIVJNHrRm9
	 SUXib5At248K222+oqUdV71/KxUBZ1IxkqRWTX7LkaxuVtEAGNlwNVCeI91d27othX/jd
	 W6YzNEwMA7qahA+zye31/llNvS3EedaUbne/kLHuRLzZBFZ8MlOYgmRUk+sanBXHSXkgm
	 p7p7ifl0gmdxfKz90n1XnuXMabQiy2jCwMuFlCRrAIIdTlv/Za1srJ9fvBuMRdO/Ghg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmewaUMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAFF60A2620
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YmewaUMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA4A1F000C1;
	Fri, 30 Oct 2026 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361241;
	bh=x66U5C/iSZTncRHHJDJAZlR5pyUwqAkX43Fg0MqJDS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YmewaUMwDzmy19jdhXhLRkKl+deMfF+KWQqzJ4T9zugHj///0cKWAp6XojHFKeKU7
	 0aL9VoOt1qRnZarJoO0h6AhKMddH4ZdWT8LD8yU/luTg1uDF3ApFVAJ7aZ/Rt2A3h1
	 oGRgNmnoNJkRcwMqjm3Pgbqg59LEIag8vSys1ZTJ9XNxls1vj3S5KXkzLjNR4Bxnf1
	 0VzL5OZihg2DA/8hHKzs2ufEycIAZpOQzM8qRdNmms3Q2YIq9eK207EhKXyZseq5Ow
	 /CS5axDrR4pztItYowByjTUdE36LcWofyLFqA25aKp7WxJ0pS+V8KGMYxuzu/So3ve
	 KNo7lfWDnZA3Q==
Date: Fri, 30 Oct 2026 11:53:56 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auSFVKVuGryqTgjG@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
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
In-Reply-To: <auR0kSCYyo31Inxf@gmail.com>

On Fri, Oct 30, 2026 at 03:46:03AM -0700, Breno Leitao wrote:
> Hello Will,
> 
> On Fri, Oct 30, 2026 at 10:28:04AM +0000, Will Deacon wrote:
> > On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> > > On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > > > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > > > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > > > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > > > extra alocation and possible performance penalties.
> > > > 
> > > > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > > > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > > > page kernels are unchanged.
> > > > 
> > > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > > ---
> > > > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > > > stack usage, and I found that this might be an small optimization!?
> > > > ---
> > > >  arch/arm64/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index 5f2db2cecf9772..b73371327d2a47 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -111,7 +111,7 @@ config ARM64
> > > >  	select CLONE_BACKWARDS
> > > >  	select COMMON_CLK
> > > >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > > > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > > > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> > > 
> > > Does this one sound sane?
> > 
> > It doesn't make an awful lot of sense to me, to be honest. The page size
> > and the number of CPUs are two independent variables, so tying them
> > together like this looks a little odd.
> 
> Sure, but with 64K pages the kernel stack is _huge_. Why do we still
> need to keep the cpumask off the stack frame in that case?

Because you might have thousands of CPUs? Because copying these things by
value could be expensive?

Will
