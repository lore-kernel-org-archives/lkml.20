Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7C4F3ED2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569216; cv=none; b=IEg5NsEjf9uhQtRXcDNMW+PSi3DIulmrY2GxqxkNgd+vK9JDBtqyqEZ11PQvsu35ySnfgLmbg04mL6kHf5ItQ9vWHL1qKcFPXEvEYeXDfIuN+6zBpx2Y7JsBV0Jf7DS7O411DRa1giEgkof7Zv9MKk343Gp0C8LxChDaefzQGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569216; c=relaxed/simple;
	bh=LuHQFAe3lPq1p8EjyWcgPyz3jc9NpoCBv7dfKY7xBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6Nm6AYe88ZpTPA1E3+oFD4dwm7WX5qXIAE3dVTJmbHAZEcT5K/nsls04IlLZSbAweQGE7+KTTfCIuovf024zynUbcwip+glySX05ZRqEUFwyPzaPaEgKa+0Td8A+wpnNncsfIVZBEyrjOOmIzgIYtvkKZRGov2Tx3yjmuosooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bi3Y+hEv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi3Y+hEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4694E1F00893;
	Fri,  9 Oct 2026 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791569215;
	bh=8zD4NycKYzR4b+3JMqBPIZjbkNo8vo1ksVX3mK7N/Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bi3Y+hEvxhTKGPnvRXnd/oWDFx1A1IKHvDWstaqyRbySmBo/iD9xB9FQnFGvSZCxc
	 65xQqNX7/iEWYesSg7DY9qV3ChEvsma6PZ4lENH5CjKXcFyuJE3LhNToIR0dbOwcsx
	 GYIPvBmOokc9cWxxcZRJEtk9xDy9mwUkO/GVqUXtyxir3+cb5ykKcyoEZoFCuPBuvl
	 xpyEHW21/P8TaujPzQ+mRVkaJAZ8HbDBQI6VRK0noggLtAGzJjraMq11zQ6d4oMxUy
	 fL7xrTm9k0LqfJue2/vHPGlLLuFNhn9o2hyiWa0eo5/iSyvjpr9dAeYDiiDIM0jCiU
	 nfxFcGPubISdA==
Date: Fri, 9 Oct 2026 20:06:49 +0200
From: Thorsten Blum <blum@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>, x86@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, corbet@lwn.net,
	hpa@zytor.com, "David Hildenbrand (Red Hat)" <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2] x86: remove the BIOS memory corruption check feature
Message-ID: <asktOXVRiXNOTcqH@kernel.org>
References: <9e1a161e-9246-41d1-9651-ffa85b1bc99b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e1a161e-9246-41d1-9651-ffa85b1bc99b@redhat.com>

On Mon, Jul 20, 2026 at 04:41:05PM -0400, Luiz Capitulino wrote:
> By default, the BIOS memory corruption check works by reserving the
> first 64 KiB physical area from memblock, zeroing it and then scanning it
> periodically.
> 
> However, this functionality has been broken since v5.13 by two commits:
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
> It might be possible to get this feature to work by allowing
> setup_bios_corruption_check() to run first, but it's just not worth it
> given that the kernel will never access this memory area anyways.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
> 
> Changelog
> =========
> 
> v2
> - Rebase against latest Linus tree (v7.2-rc4)
> - Improve changelog
> 
>  .../admin-guide/kernel-parameters.txt         |  23 ---
>  arch/x86/Kconfig                              |  30 ---
>  arch/x86/configs/i386_defconfig               |   1 -
>  arch/x86/configs/x86_64_defconfig             |   1 -
>  arch/x86/include/asm/bios_ebda.h              |  17 --
>  arch/x86/include/asm/setup.h                  |   1 -
>  arch/x86/kernel/Makefile                      |   2 -
>  arch/x86/kernel/check.c                       | 187 ------------------
>  arch/x86/kernel/setup.c                       |   4 -
>  9 files changed, 266 deletions(-)
>  delete mode 100644 arch/x86/kernel/check.c

Hi Luiz,

v2 no longer applies to mainline - are you planning to rebase it for v3?

Regarding the changelog: did you consider that the check is only broken
for the default size? Booting with

  memory_corruption_check=1 memory_corruption_check_size=256K

still works and I get:

  check: Scanning 1 areas for low memory corruption
  check: Scanning for low memory corruption every 60 seconds

Thanks,
Thorsten
