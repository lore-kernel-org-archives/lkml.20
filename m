Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F8283CB5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383144; cv=none; b=qmCofxIWPMweY5QucUaVCeNXRgz10lZMRS1SPBuN+IJR314YDqT3yREddHTJBMcqYj8ikO8zEIW/sRYEA+CxORA1sdnojGIpVeoiiMatvylJBrNhPvOPPHWZ3CYoAx7piYmVLM/9fWI9dLyPtAB+HFMTLIdd2L7LJ2YUJ4p4XXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383144; c=relaxed/simple;
	bh=CMdjFxy3NXWFpveCWHJ8A0qEY2dn5hanCBe7Yqk/ia8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he5OXDG17g7OskC4flT/kssqHOgTlsWC9EUZsRmFC/zpKuC41NV8rhg4FGhZbR8vchdyBk3pVW/0l7SIB2WU0a3lYqFHmlITV7lc0/LHWphqyqql2Ak0mTgwg9yaaAA7qX4rvL6yAmfk3z+QW6uQxIqXqeccZiOUw5jsYjNFnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VMg06L48; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VMg06L48"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CE2FF40E00E5;
	Sat, 26 Sep 2026 00:38:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ek1kYcKiS66M; Sat, 26 Sep 2026 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790383129; bh=uxlA2rz65d2JuWG2sCY1bx0d0PwdJgHsGS3E0reqXzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMg06L48EdAtP+1hqeaDIhYjkcjTizYwoZxxbF9Skq9nwwZ1gLAbCIY2da5KFWLuL
	 tyzyq/pCj5ZAibedfUBTjlDD7Cp30L3HH/GMnl2gerBLCc6qqC181nNq2Jg2IMdop2
	 KpS30LtUA5XDRPk1g3stR2E6sztGAUAtJ4++L4rFd3jzBORZyWifEe1nsH26j+s1t2
	 BHW05jXjRmabus0TvlUhlAMn22ADrauuK+ZLqBHksCNhWDNgkzmJv9S7gRP2Uyh3Mp
	 DItt15va4ooDsEUWh4x1c+9muAtLRYy9BbJBsPhKjSZbOdX+kVJcyJuT9oP7pk4skr
	 WhvuF25quYILAfeVtYaL6/HNqqHVULJ03p/hPAvNS7gUm2J7aPz6aZYCQJ8EMo5HIZ
	 V/S+xhuJ45XM8wFZD7lwTKwJjZdHoetFvIjxXxTl4LxHlzo9NYVDrJ091/LzSeHt5r
	 N5yhkzHob4WzeL9m4VsQufYcpkugxN/h/L18bNDOG9t9/2i7Pqc+VZGhMM9LRXlxdu
	 TIvV6WN8CjWxQFbN2+KXvldwKCtfv8mKT/C0XLODil6crJEMKD1KepaL8pCjZ8kKQE
	 EiC+PRIIqJbGE2ozCOD1xTWAN7qiOBaewGOvsdolGNWb0jwak6pVZpz/Ta++q1Ew3k
	 0A6GSc+H5rqOdYijVDd2+xq4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 940FE40E00E7;
	Sat, 26 Sep 2026 00:38:36 +0000 (UTC)
Date: Fri, 25 Sep 2026 17:38:33 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Robert Richter <rrichter@amd.com>,
	Christian Ludloff <ludloff@gmail.com>
Subject: Re: [PATCH v5] x86/apic: Use EILVT register count from APIC_EFEAT
Message-ID: <20260926003833.GCarcUCXmT6B5hfSBV@fat_crate.local>
References: <20260925161706.1619042-1-naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925161706.1619042-1-naveen@kernel.org>

On Fri, Sep 25, 2026 at 09:47:06PM +0530, Naveen N Rao (AMD) wrote:
> Future AMD processors will be increasing the number of EILVT registers.
> Rather than hardcoding the maximum EILVT register count and using that
> everywhere, introduce a variable in 'struct apic' to track the EILVT
> register count.
> 
> The number of EILVT registers is exposed through the extended APIC
> Feature Register (APIC_EFEAT) bits 23:16 on platforms that support the
> AMD Extended APIC Register space (X86_FEATURE_EXTAPIC).  Use this to
> initialize the count and fall back to the current default from AMD
> family 0x10 (APIC_EILVT_NR_AMD_10H, which is 4) otherwise. Since this
> value is no longer a compile-time constant, update eilvt_offsets to be
> dynamically allocated.
> 
> Drop the now-redundant APIC_EILVT_NR_MAX macro. Other than during EILVT
> register offset allocation (which now uses apic->eilvt_regs_count), that
> macro was being used in the IBS driver for determining the EILVT offset
> for AMD family 0x10 since the EILVT offsets were not assigned by the
> BIOS. Switch that to use APIC_EILVT_NR_AMD_10H, which reflects the
> correct EILVT register count for that family.
> 
> Note: because the EILVT register count is now derived from APIC_EFEAT,
> it is possible that the register count is less than 4 (1 or 0 even) on
> some AMD K8 parts (rather than the previous default of 4), which should
> more accurately reflect the correct EILVT register count on those parts.

Please, do not talk about *what* the patch is doing in the commit message
- that should be obvious from the diff itself. Rather, concentrate on the
*why* it needs to be done and why your patch exists.

It is perfectly fine to explain non-trivial aspects of the code the patch is
touching but do not regurgitate what it does.

See also https://docs.kernel.org/process/submitting-patches.html for
additional inspiration.

Also, that second note about clamping it:

https://sashiko.dev/#/patchset/20260925161706.1619042-1-naveen%40kernel.org

does sound relevant.

The first one, OTOH, is a very good example of a confused LLM:

"The APIC ExtLvtCnt (XLC) field represents the maximum EILVT index..."

Apparently, it couldn't download the APM.

:-P


> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> Tested-by: Manali Shukla <manali.shukla@amd.com>
> Tested-by: Bharata B Rao <bharata@amd.com>

Are you sure they tested your new version so quickly?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
