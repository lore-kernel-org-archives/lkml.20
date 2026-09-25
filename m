Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C672248BE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790308969; cv=none; b=BQrOKdLiGcMQUeV4BgMgLTxQmQpVQ75+Iqn3xPAZIuQLTE7+S1q3/Z9C3v4AGxfKIONb9bR7rSuAorafS7PLCg7PiWKrfOR1jNqXKJvEHdps/x22xP3g7P3TTI9RMzknYUjxi78fsYBGyCjpZ4lWmHO3+wRD+t9KCb7OF7mQEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790308969; c=relaxed/simple;
	bh=gjz4eAh9r8e7B0XJJhXz1omS87MKhqb85V0oJEfgxRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+M4DfrPLMsNS8f42VraUFkMJXbNWq57NCjDuiE0LEQrDLxPTm3N0kw4H4g5G4g5mY/vl1QUZ+e2CTV9Fbxj3r6hL4sYJznBxTN+bnAy59Y+K3d/tznCJye3W4oJOtVcSA82A6oPl02NjwpRUd5VJGlIEEXVk2YWdzWdU5s3ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=i1NcwsNp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="i1NcwsNp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D0B1940E015D;
	Fri, 25 Sep 2026 04:02:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K9hOh1ocpdwk; Fri, 25 Sep 2026 04:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790308948; bh=EW62N+pcJ/yklySi4JDKkkR0W+TsN7XjHETaluMMIt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1NcwsNpTlH5tTnT4oiTCLEJ/B2F64elCsX0k8vurIo4s1XzysEHysXgf9HFR/FAd
	 LSOIjO0hAvS4WqHL7y7KXH9GN8GfAz8/Fg1LpV2fs1hcWR4RON9Jpxb9TzqCNt8Fpt
	 wdsl90AvcCAKDhh2FBtPNd2lAZoiHdZpEXazVBVuhh4vpv1C1hlCYGBty3bZDyZC6c
	 pvsyNLrBSWUz0A65E0VVp12/mTV9tR+5DlDvLVQPgIyaKmvr/iH/SHpsnRiqhdaJQE
	 J/ihuDChO2xLq6G9MGtC+TgLzXwF5Ci9p/soP/Ka31Vly22c7WpCvcb+/NU3uxHMFd
	 kJIX0DYmXDakWdy/a50SUR2nfAG+0dFGMTxnjYEmkoswPXr7L2dnVglrsDu16Drlfw
	 L3mFQrFDXkmvKH+xfJrXnxIStJkNVR4JLGP5zovKZx343AeS6jSqgvRo5TCK+nhbOj
	 Z64TDy0i/xDsq/js5aOE8XaSzKpfJVuwKhMRAxwCkMPd3vH+RMlvqm9DTQbc+1DGCb
	 cmRCRIPUjVaNHEx+sWRylhJZB/TOOtx7DPefT3OQTMo2K/cZwMnzdM4hyP+usjakR0
	 tSF4V1f09u8glDFgoawf4FtlWc/o6hKK++G/RwJSM+S1tUxUmShTcKDYQ6Fp8LaPFv
	 SLnwztUA0PhBvCWSdp0so/5o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5066240E00E7;
	Fri, 25 Sep 2026 04:02:18 +0000 (UTC)
Date: Thu, 24 Sep 2026 21:02:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate
 buffer
Message-ID: <20260925040215.GAarXyR6cUzn9OH4ZD@fat_crate.local>
References: <20260924210121.87032-1-avagin@google.com>
 <20260924210121.87032-7-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924210121.87032-7-avagin@google.com>

On Thu, Sep 24, 2026 at 09:01:20PM +0000, Andrei Vagin wrote:
> diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
> index 38a2862f09d3..c73cf2444de6 100644
> --- a/arch/x86/kernel/fpu/xstate.h
> +++ b/arch/x86/kernel/fpu/xstate.h
> @@ -55,6 +55,8 @@ extern int copy_sigframe_from_user_to_xstate(struct task_struct *tsk, const void
>  extern void fpu__init_cpu_xstate(void);
>  extern void fpu__init_system_xstate(unsigned int legacy_size);
>  
> +extern unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
> +
>  extern void __user *get_xsave_addr_user(struct xregs_state __user *xsave, int xfeature_nr);
>  
>  static inline u64 xfeatures_mask_supervisor(void)
> -- 

Hmm, so which tree are you basing your stuff ontop?

Because in patch 5, xstate_calculate_size() is not static so you must be
basing it ontop of some tip/master branch from sometime because tip/perf/core
has 

b84c96283684 ("perf/x86: Enable XMM register sampling for non-PEBS events")

which drops the static qualifier of that function.

But then you're declaring a prototype above in the header while that same
patch is declaring the same prototype too. So if you were applying ontop of
some tip/master state which has tip/perf/core, then you wouldn't need the
extern.

Weird.

So what I think you should do is, rebase all your stuff ontop of this branch:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/fpu

Then I can apply your pile and we can sort out the merge conflicts later.

That would be better, IMO, than merging the whole pile of gunk from
tip/perf/core into x86/fpu or applying everything FPU ontop of perf/core which
would be yuck in a different way.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
