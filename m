Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F43E00B5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049522; cv=none; b=jIG5GBeL9Jnn8waYuTr28lv0N2QGBIps00c8Xh3AJE8lPbc9Xlkt2UgJKGrD764GVA2keQotu/UgxTFie+UweOHzMwm8dXt2Nd6Quuae8mDY2OhdZwKKYa/HLj/m5KyY67auRlER004jjjlUd8LDC2T4tNA1imNlHI1E4T1FNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049522; c=relaxed/simple;
	bh=dp4cDF1EKv2LmB+l3LyXUTVSljxheEEqVA2Wh86ijFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAZzevar2IZrDTr70HxLxI2u3/k4iuu1QcWfCYcrUe1qU2tFl3JeJZCqcP9DRZRpp/oaNhHOB+5/l0kGcZWls2uuTgVOt3e4AexwgWUrryFHVJTP45ECEp2ZtURSSfSrOPKJDbzV3tFMWQqCSJPpVNJGaD9rTef4bRzp8Gyi/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MD0icsez; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MD0icsez"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 010DB40E00E8;
	Tue, 22 Sep 2026 03:58:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nvhTkD8QdV62; Tue, 22 Sep 2026 03:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790049514; bh=MBq9MKoqYDyi6jKC6qgxnxmzVGaLBF4/RDqvU1A6oxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MD0icsezxahjSvGTzX7FuWBeB30RgBBn2pASpPs5UbhD28SWShZh1cuuJam39GZwS
	 Leo1YpaiXthWZboMxhxUFwUsdViaKjhrZxp4WH9EtpIe0CHu9obPwjWYpN46+CeT45
	 dmeg2+agTy4z79x+WebZLBYYWkldkNgqEgRyB/uhN/5FqCjJMDt9a0gtSTkjc8V82s
	 +teTqJJsO/KCTXjMYhngD517M/Ivi9A8c9MJITaY99PisJGYHhtbelIh/Y42leqgvO
	 SN2oOSrpC7qYV/wJHKhATS9vxorQnilOVpRpwlvfD6fTFwxDtPjsa3NU6R2J/TK6w/
	 iSWA/QbGYuSudg0Z79sVPpYFAFzxDttoyG9Xd2Wv0FWkDjx3gd4p56i8/YAz2mp9By
	 Z1injbFi78Mzzc4c9z0pBRvjoc0yeyPVWQl7yPECF4ahcR6qIOqwt5iaZ0SdRi7MkW
	 iBxT+ISyQi/M+hwCZARNJLwaWsFW0K1HoRZE8y96uJxpOZoTXVF+qBOnG6qeA7Rznn
	 fBw/zstrEUhKUCEaxS3KeaZ4xbUifJ7+11/KViXmXBALyV75IckGDvNDeNR4iWSRgQ
	 Ggnewov4IZGcegK/2w2kQOlDVzVio+nouBuj3xLmhaDl94ZxduZ3VsWm4xAXigikdF
	 n/a/iOXxZ2UB85X1u/Us7llA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C87740E01DD;
	Tue, 22 Sep 2026 03:58:19 +0000 (UTC)
Date: Mon, 21 Sep 2026 20:58:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Message-ID: <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>

On Mon, Sep 21, 2026 at 10:36:31PM -0300, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.
> 
> The PVH code is required/supposed not to use the KASAN memory access check
> in the kernel entry point as KASAN has not yet been setup, or an exception
> is hit and the boot fails.
> 
> This was previously described and addressed with __builtin_mem{cmp,set}():
> - commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
> - commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
> - commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
> 
> However, even with __builtin the compiler may decide to use the out of line
> function instead of the inline implementation. So, that does not really fix
> the issue unconditionally; see details below.

So, this whole deal doesn't sound to me like we need to backport it to stable
- it rather looks more like fixing some configs which want to enable KASAN on
PVH guests.

In that case, I'll queue this for 7.4.

If this needs to go to stable, then there better be a pretty good reason for
it.

Right?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
