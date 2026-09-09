Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD05437D5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953572; cv=none; b=BUnAaGBD++frO6PZgbTApWHMm3Ild5bBRZLdBj4fuKBX+9iSOVXh0LnUZyBeToYyCUxFjaQvwC91PyHfia9+00tYqHh+bX1Ca6O1HaVSRr1aBlUJAAj8CBg2iVL1tXI9CqNOrFprnMYRTgT5KgSLxNclza6T3Lexf9OQsMzFjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953572; c=relaxed/simple;
	bh=NA3L/X7yFBnz1lV2FiTaJ7lm4nUxGPvSAwAudPs9V9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cplzHBPX6UPrbZ6q0Pj53f6SE5noRLREkuc+kbIdhxufiA+LNEb/yixH22mgzNaRQdI8dTxhNIfwVSHcqByGsRm+UgIzr29jyEuyHJYCjTSSdTAoEBCENAb36jtmmVZx3hjgKWY2FdJlVOEv2IXTMKLgD4dNv8u8sZvg2D/fmFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtCxJiPY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtCxJiPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138CC1F00A3F;
	Wed,  9 Sep 2026 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953571;
	bh=F/Y/It+Oz9Nbwm/YWPpWxy0x5yTbGaVUNJsxEWDorLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VtCxJiPYJhrxEkLHLz3Wpx4pexCEglcPyfgcdkD1zACMP3QUa9fZI442hjrd6g4YO
	 8Gi1rlwQE2pU1XT7SJ84BKSqOPhXSDa16zJtEM3BvST4EnuXOM3XDjgQALLn9mSD++
	 SsekVmSz7p29gCNlg5bH4afexIbboo4ZXOPTO97tSkouhyDCA95IcY4/Ixm8pxc/cC
	 6sLNneBy3RhQLh/JZXIFb/eE6dK7ChBgob1+rSh5uvY7D0xiim6lWYoNCYSPlOsrwr
	 9J+/xVyylptx0aWk6+YcgTQnn8SXeH+NHQE7Jv7P4KUyl31oE8qaoUMamKSBS6MXjI
	 yT1hIeZbXepdw==
Date: Wed, 9 Sep 2026 12:32:46 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 07/14] arm64: head: Force little-endian early during
 boot
Message-ID: <aqFD3s9RgyK4A-N_@willie-the-truck>
References: <20260907163726.17104-1-will@kernel.org>
 <20260907163726.17104-8-will@kernel.org>
 <ea76bef9-c346-41a6-9276-a5eb8cea3776@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea76bef9-c346-41a6-9276-a5eb8cea3776@app.fastmail.com>

On Tue, Sep 08, 2026 at 07:12:12PM +0200, Ard Biesheuvel wrote:
> On Mon, 7 Sep 2026, at 18:37, Will Deacon wrote:
> > Commit 2ced0f30a426 ("arm64: head: Switch endianness before populating
> > the ID map") configured SCTLR_ELx.EE at boot according to the endianness
> > of the kernel in case the bootloader had entered the image in the wrong
> > endianness. Additionally, if the MMU was enabled in such a case, logic
> > was added to turn it back off to prevent the hardware walker from
> > misinterpreting the idmap page-table.
> >
> > Given that the MMU is only expected to be enabled when booting EFI, EFI
> > only supports little-endian and arm64 kernels cannot be built as
> > big-endian images, we can rip out this handling and simply force
> > SCTLR_ELx.EE to 0 (little-endian).
> >
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/kernel/head.S | 20 +-------------------
> >  1 file changed, 1 insertion(+), 19 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > index 8951ce693552..d5c1ea0c5b3c 100644
> > --- a/arch/arm64/kernel/head.S
> > +++ b/arch/arm64/kernel/head.S
> > @@ -138,29 +138,11 @@ SYM_CODE_START_LOCAL(record_mmu_state)
> >  	b.ne	0f
> >  	mrs	x19, sctlr_el2
> >  0:
> > -	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> > +	bic	x19, x19, #SCTLR_ELx_EE		// Force little-endian
> 
> This bic has no effect here: the 'and' below clears it anyway, but x19
> is not written back to SCTLR.

Oh yes, this is only used to drive the flag to say whether or not the
MMU was enabled on entry and then the other part of the patch removes
the sctlr write.

> When I suggested this, I missed that SCTLR.EE still needs to be cleared
> before populating the ID map, regardless of whether we enter with the
> MMU and caches enabled.
> 
> IOW, we need to retain the SCTLR writeback logic below. The only thing
> we can drop is the clearing of the M bit and the invocations of
> pre_disable_mmu_workaround. But we might as well keep that.
> 
> Apologies for the bad suggestion.

Not to worry, I made an absolutely dog's dinner of implementing it
anyway! I'll just drop this patch for now.

Cheers,

Will
