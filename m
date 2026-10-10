Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D538F64E;
	Sat, 10 Oct 2026 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661552; cv=none; b=F7pwYo3/FPRL5sDNwHGbJR9ADziH6v5RN4t4D2ZOLkI7pKIXvTI9esEM2/L3fuMGM9ZuM3lawIMXUvaIKRxck72S+MXmu1XLi2KkqmXo1Goh8+t6ggsFlf88hi0XOYyyPVPZ0jz3ZUQaZt4P3uacyGPm9Hmrrw0kknd4zQ7/thg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661552; c=relaxed/simple;
	bh=ZQA+UGeOpmsIvKDIwLxf/GJRNePdvN2NiMqcQ08Pks8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co+fLj2GnGZUq6CFZp4YboIP9CFHnlKR4E6Rwn0+jcPRnXPDN1+phBXZw6ppOGaxbUswio8eRoLF44PpPE3WTgj0Om496jYi/T3y5bbecAB/OF2t15/PIMW8EvE73Gjw8xTlRWiEOV5UvVFnz9yYoelJpc226WBTESfhqX9y9No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NtlXGB2z; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NtlXGB2z"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3156440E03BE;
	Sat, 10 Oct 2026 19:45:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id w-LaY5QRolKJ; Sat, 10 Oct 2026 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791661537; bh=mXRiDOsjBGT9aPzVeIlvnBf2bqdjcsKrL2pwp5FX8u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NtlXGB2zI1Tp8ML/9s+L4WmD4SskcKXDb7xA2UEOSjQhjmuiplx2ne1+UzlvSK3NT
	 4TQRjxp5fbh1Qu4P3EQmjqwgAEYaimfZKz9YN4dbIXJUxrOBAZ+6ye6oC8l2Ro6ae7
	 5v62SYa0b+RDzkQ6m3cfh8ytEDUSmdPAPTBcTyqug/9+d067qSWxGFIcVynen6r+oy
	 zM3qJPr0wV/w16kor8jJXnTD16rhuMRbr4vbYDkbe23/A/ywspbqOjytbUzti9Yj/N
	 dAVDNiQcrGWr5/LPJM+EFeyrGgv8jxbyXm4zkA7hYOUra98b3oDIMmCwG1PmyNdGir
	 YkodN1DzAbJFSkIlJ5wFNc0EENcGH1/hi/GHFHPWBiC+BbGtB3n6jPyx9+yuPazdAu
	 0aajcH1abQqiX9wcgIDl6d9e8FRWwFE5qdCqq2jpwHRTUVLAGlA8LwaVaaxcH8Alog
	 vP/mriUp+86o5fLsVLlpVcUR1Fq5DveHk1slS6Q+MSUhntUtqn1VhC7jbyARFK4oGt
	 ER0hAa29b4Xa7PETteud0bL4bVdoWnSoBxcSDZZV5sD6gRKGEOEPQ4ePSKhF2o6Rty
	 AobwbsvH9QoigkOB5gWmO3O+Im+8/yNBbK2IuFI/FZ2m04nqGUoeou3cAbbG11bexR
	 G94QgDodOyZJg6LVhnX5NUvo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 87D0C40E0488;
	Sat, 10 Oct 2026 19:45:23 +0000 (UTC)
Date: Sat, 10 Oct 2026 12:45:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	corbet@lwn.net, rppt@kernel.org, blum@kernel.org, david@kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] x86/corruption-check: Remove the BIOS memory
 corruption check feature
Message-ID: <20261010194519.GAasqVz2brXiOLegQi@fat_crate.local>
References: <20261010153604.1885381-1-luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010153604.1885381-1-luizcap@redhat.com>

On Sat, Oct 10, 2026 at 11:36:04AM -0400, Luiz Capitulino wrote:
> By default, the BIOS memory corruption check works by reserving the
> first 64 KiB physical area from memblock, zeroing it and then scanning it
> periodically.
> 
> However, this functionality has been broken in its default configuration
> since v5.13 by two commits:
> 
> - Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations").
>   Moved trim_low_memory_range() into early_reserve_memory(), which runs
>   earlier in setup_arch(), causing the first 64 KiB to be reserved (when
>   CONFIG_X86_RESERVE_LOW=64) before setup_bios_corruption_check() runs
> 
> - Commit f1d4d47c5851 ("x86/setup: Always reserve the first 1M of RAM").
>   Hardcodes the reservation of the first 64 KiB early in
>   early_reserve_memory()
> 
> It might be possible to get the default case to work by allowing
> setup_bios_corruption_check() to run first, but it's just not worth it
> given that the kernel will never access the first 64 KiB area anyway.
> 
> Lastly, note that it's possible to get the corruption check to work with
> a different region by passing memory_corruption_check_size=. However,
> the main goal of the feature was to check the first 64 KiB. Besides,
> the region picked will be almost random as setup_bios_corruption_check()
> will pick a region by size.

And?

Do I want this or should it be fixed or the first 64K are not worth it to
check or...?

That whole "rationale" is not really clear to me. Yes, it is broken,
apparently. So let's remove it but we might get it work still... So which is
it and why?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
