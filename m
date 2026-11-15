Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723921;
	b=CkfapwYEuzwmzchYtbJkH/mc5s7ubNcvNJUlAKKEcCgSe2pNa4+J8K+QMvcKCpfkyG8W
	 TumOmb6Z4AEfegwyyJdoK/SnL2jGwAMHgBTqJt8ljOHh1W2CdcrcdbpoIfLwaJbxgSn3B
	 SQnZ6faQjKQlFEy7z6Jf34jawgdrBGFI6bY1zp77NwYP8lZZyCgLIORQ6KhLU1t6irMEb
	 vPE5rr0agUtRvkzFu2ZgTdk/G3vwUnDQKYvWn4h9jelrqAeF3BOdTy9Fq9RdiLdht7mj1
	 v3pPMcMtYV6UdzHPeNJjkHU4I/lua/WaOtLg69erUsuzkZmL7FLNT0GrQqFuSZOqg9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723921;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lEaSEP13YLWe51FMjtntpG8dRQe2g/kyEyc8pzUoiFw=;
	b=1RCr4lbA+EAQjKsyDbUBvmw5G2aslYCvIJxVDi8cNmdZzstW6Ea0VQbMaDcIsegglNF7
	 LWUSM6w4WY36kcj/iUy5QWTNmxGRu/iBBZkpgHKlcjFU+5ui0kdKFNKb7MsHqa6S9Crbj
	 v52/jNe1O3FjS7n/bLLz74jLujbQKfKpo/oXy2cH3WEW30SvSlFVUQQg2ZfIZ+BuqOr40
	 MmPBHPeTR76qco62SpuPrsmuLbpHnIUgN5ZYUC1FNBtlcM0hoVZ6aX5Dub63MVyn4FxcY
	 bCUBva/ia0tExKGdLk3t1/OCChafa3aGjJED40rbhaynNgVLWc6MTCO0ky0I2Sgj5zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AavXM6Yk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AavXM6Yk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF4D1F000C4;
	Sun, 15 Nov 2026 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794723921;
	bh=lEaSEP13YLWe51FMjtntpG8dRQe2g/kyEyc8pzUoiFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AavXM6Yk7OJjSS6Cg4Ku/zzm9o1X4YoPkfD+AcwWB1QxqSrxC1gktsQJ1Rs2eNEQ7
	 nnq7u74xgwddKK4YHO3/83ss0J3vVmnbjdojuIsxCg+WFncEJ0EcjGYBb/SLvV+Dwn
	 ALRATQTsJbe2B1hahH7CF970lxSvYjCtl7McxD2uyl2WLoMWM+fcO5WA6ArGHZ4t1P
	 YcNoG1fsGC9Sa+ohJtgYTo5FPM68VTWZhGufs9w8L6/cMTIcheLiPRh9XLbOA8R21b
	 JKH13cdPfuZo7MZjI6jNqL1FTJgofl7tffuT65lEaH9O6f6lkZFUS+oCAyYVQEmiHz
	 Ot3OxWEQG5wYA==
Date: Sun, 15 Nov 2026 08:25:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] x86/mm/pat: don't warn about W^X violations before
 mark_rodata_ro()
Message-ID: <avlQSfsHJoU6_BwY@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-5-791adb8d6670@kernel.org>
 <avYzmyX5eR814o5L@eldamar.lan>
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
In-Reply-To: <avYzmyX5eR814o5L@eldamar.lan>

Hi Salvatore,

On Thu, Nov 12, 2026 at 10:46:03PM +0100, Salvatore Bonaccorso wrote:
> Hi Mike,
> 
> On Thu, Nov 12, 2026 at 06:31:10PM +0200, Mike Rapoport (Microsoft) wrote:
> > The kernel text is mapped RWX until mark_rodata_ro(), so W^X violations
> > that verify_rwx() detects before that can be false positives.
> > 
> > CHECK_WX is enabled by default with STRICT_KERNEL_RWX and it reports
> > mappings that remain W+X after mark_rodata_ro().
> > 
> > Drop the warning about W^X violations before mark_rodata_ro().
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/pat/set_memory.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index a1bea16a3c3bb..a674433850dc9 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -718,21 +718,15 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
> >  	if (!rw || nx)
> >  		return new;
> >  
> > -	end = start + npg * PAGE_SIZE - 1;
> > -
> >  	/*
> > -	 * If the kernel text is still RWX, gently complain, this could be a
> > -	 * false positive.
> > -	 * Once debug_checkwx() becomes mandatory for CONFIG_STRICT_KERNEL_RWX,
> > -	 * the warning can be removed completely.
> > +	 * The kernel text is RWX until mark_rodata_ro() and the entire kernel
> > +	 * page table is verified after the text is protected, so there is no
> > +	 * need to warn.
> >  	 */
> > -	if (!kernel_set_to_readonly) {
> > -		pr_warn_once("CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> > -		  (unsigned long long)pgprot_val(old),
> > -		  (unsigned long long)pgprot_val(new),
> > -		  start, end, pfn);
> > +	if (!kernel_set_to_readonly)
> >  		return new;
> > -	}
> > +
> > +	end = start + npg * PAGE_SIZE - 1;
> >  
> >  	WARN_ONCE(1, "CPA detected W^X violation: %016llx -> %016llx range: 0x%016lx - 0x%016lx PFN %lx\n",
> >  		  (unsigned long long)pgprot_val(old),
> > 
> > -- 
> > 2.53.0
> 
> Does this need to carry a 
> 
> Fixes: ea6fd393cb9e ("x86/mm/pat: Use pr_warn() for early W^X warnings")

No, that commit actually relaxes how W^X violations are reported during
early boot.

And this patch removes the warning only because there is an earlier commit
that forces the check of W^X consistency that was optional previously.
 
> ? 
> 
> On a system booted into 6.12.117 (from 6.12.116) I see:
> 
> [    1.091378] ------------[ cut here ]------------
> [    1.092538] CPA detected W^X violation: 0000000000000121 -> 0000000000000123 range: 0xffffffffc0477000 - 0xffffffffc0477fff PFN 109c1f
> [    1.093994] WARNING: CPU: 5 PID: 222 at arch/x86/mm/pat/set_memory.c:665 __change_page_attr_set_clr+0xf62/0xfb0

Please see my reply to your regression report.

> Regards,
> Salvatore

-- 
Sincerely yours,
Mike.
