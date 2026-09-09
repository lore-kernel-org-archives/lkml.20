Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049047DD47
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946828; cv=none; b=dw729jhlzmANHm6UBH5PiK8GwrDGe35TymSUyX+YkC6bn+iEcoeQf8OWCyt0dMa/OLHUV51QTW7n0UV5C/Yasiba4kBw1bk/tMvFodjvMmFakhSnLuf2ujYt/MMNgjkfio3Y+cBtiVkVgH6eilkQT1u9mMwjpp2SQchCiJtq62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946828; c=relaxed/simple;
	bh=wX1eVhTPvs0BR+3v4DJaKlXMInFeWjGzLqCd1ESpde0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8reSbM34BnvPC9+VvVnnSDKI5m2wWPAXL+w0Kvo9utnNCFGA2KrEmKSo4biWLzs2B63eVFI+K5sCj/5QtOBkDo3GERpj+sdFauq2cW8/I06kxy0I2j9jSmr1I51t2tQl7AElZ239XzUb97nFj8b7Ewefy/ZEnnYzFvGlJjiCt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kd/J2fCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kd/J2fCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FED11F00A3A;
	Wed,  9 Sep 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946827;
	bh=1VV85WMbVpl9aCxFvRU3Tm4r82pU0a1SqZ5v4CYjkFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kd/J2fCP2AIOUJGGJ2gaiqmLrYjdNkyQ9YYjZoD/W93LcobZqDL+qlWPeCd5PydMC
	 8HWuGuMhJuP0bkR6b9tjKnJS4tYBiu0WnzXkZ0MCmBZ/tKgtNI9N9oGHEImcMLvxv2
	 6tJ8EwduOihaYigBZPMgn7mOV43nrSOfUo3XObH4MzniGUWsxcRQshpOIWPdAijBqh
	 CzLQYzww/usyOYZGTXZeAzKY2Wum2ffE+Vl6TgKOnzmh1ms0fUvWqHfnwl8rq9XdQJ
	 UsA8XB3DcPnsVMWnotwlcU+JVnWxMWoLsuzqR3jKm4ZWDRkbqboc3XPdloq4pCvMZq
	 K3OrUe6ernohw==
Date: Wed, 9 Sep 2026 12:40:20 +0300
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
Message-ID: <aqEphDuTtIZDANnS@kernel.org>
References: <20260908092730.4002628-1-rppt@kernel.org>
 <522548e1-ebbf-4785-83d7-e2cc3aa83b62@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <522548e1-ebbf-4785-83d7-e2cc3aa83b62@intel.com>

On Tue, Sep 08, 2026 at 05:15:46PM -0700, Dave Hansen wrote:
> On 9/8/26 02:27, Mike Rapoport wrote:
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -708,6 +708,10 @@ static inline pgprot_t verify_rwx(pgprot_t old, pgprot_t new, unsigned long star
> >  	if (!(__supported_pte_mask & _PAGE_NX))
> >  		return new;
> >  
> > +	/* skip verification until kernel text is set to read only */
> > +	if (!kernel_set_to_readonly)
> > +		return new;
> 
> If someone sets up a W+X mapping, such a mapping could persist until
> after boot and this would suppress the warning. Right?
> 
> Sure, you can _get_ checking with debug_checkwx(). But that's a debug
> option and it's kinda weird to shift the burden from an always-on thing
> like verify_rwx() to a literal debug option.
> 
> That said, I think you're completely on target for thinking that it's
> silly for verify_rwx() to even *try* to spew warnings in boot.
> 
> How about we add a kernel_strict_rwx() helper:
> 
> bool strict_kernel_rwx(void)
> {
> 	return IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled;
> }
>
> Have verify_rwx() check *that*.

Checking only that will bring the warning about ITS pages back :)

Both CONFIG_STRICT_KERNEL_RWX and rodata_enabled are set before the
alternatives patching. 

And rodata_enabled is kinda arm64 specific thingy :)

The check for (!kernel_set_to_readonly) has to stay to actually rule
out the silly checks at boot and it covers your strict_kernel_rwx() because
kernel_set_to_readonly is only set when strict_kernel_rwx() will be true.

> Also, make the DEBUG_WX functionality mandatory for STRICT_KERNEL_RWX
> (with appropriate renaming) so that it can be depended upon.  I assume
> all the distros are turning DEBUG_WX on already (Ubuntu seems to).

Just checked my Debian config, it does.
 
> Maybe just do the strict_kernel_rwx() to start and then circle back
> around to muck with making DEBUG_WX mandatory?

I though about making DEBUG_WX mandatory right away, but that's surely not a
oneliner, so I kept it for later. Maybe should have mentioned in the
changelog, though.

-- 
Sincerely yours,
Mike.
