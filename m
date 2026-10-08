Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97003C1D6A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445841; cv=none; b=hel3qwXWPkgUbl87jn9X3nyiURkDiVYCUkB3zq5aOC9WBgmKxSff+QBuZTB6Bmsqf3s9K3n4i1ZBSGQT3UQ1PvANAwEg4vSLH9h1lgnPLc//jVfUJUdR5irdSAsfRgIiqpPsM/YNlSmO6XejMGcUbyMWassZuRFfBrOm4mTQu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445841; c=relaxed/simple;
	bh=WeHImkokxLCrrOlY3pI+lQb1DsrGqfSisOxSY3/B7Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxDgxMbrOpj6XMD/680uCjIb81w4fDkYwgr1dDIPUFqK7zoLo9WLOYo7cDesoRyT9GiF2mRhHaG2BA4/JiEk2WjtdnC4fTz7RTMJVP0WjMVWna1j6s1HCFW+02QeEdyy5Hc/1lfOEBMg1aqq1+W3BrWioWWPqPJh/pFWRy0GS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyYqNrIg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyYqNrIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AC21F0089A;
	Thu,  8 Oct 2026 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445840;
	bh=RjEfQ8K0k/MG2FrlywYZFAm1b1OQE1BGLhy0qHVcnUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IyYqNrIgnpzzFIJm9VUcTtkTa/krazKwEPDJeihSX4TjZ5OOGBpyYwUlIPuD9VI+7
	 gt8vqVLzPaEghj/4b0MzpHynDxYWhC1VIZVySweXqqAfXuiMsy3AgYcQ6UPXwMJ3BX
	 raudmfsPGitA+aKfIVXQ/VuF6BoCayOg6VimigLs8RKNfSuVWa4ymDVuc2Gg4DUlL0
	 8CwN+kn9fuiNIgA3V2lJiOpM2kqPREEMzfkoVJszNR1OD7tzg84PbR9oGrikrx6skE
	 IhTnuCnQRZR9qv/bytscnWbigqBHaWNn3esyk9f7W3mHvF5iSTdF2iLDLc65qFSTI3
	 2ZubRZZ27uv3Q==
Date: Thu, 8 Oct 2026 09:50:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] kexec: Add helper to report an active kexec reboot
Message-ID: <asdLS9lRSL30eD34@kernel.org>
References: <20261001132128.1703511-1-shradhagupta@linux.microsoft.com>
 <20261001132147.1703600-1-shradhagupta@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001132147.1703600-1-shradhagupta@linux.microsoft.com>

On Thu, Oct 01, 2026 at 06:21:44AM -0700, Shradha Gupta wrote:
> A shutdown callback in a loadable module may need to distinguish a
> kexec reboot from a normal restart, halt, or poweroff. The Hyper-V
> VMBus driver needs this distinction when moving its kexec cleanup into
> a common syscore shutdown callback.
> 
> Add kexec_is_in_progress() and export it to GPL modules so the callback
> can remain guarded when VMBus is built as a module. Provide a false
> inline implementation when CONFIG_KEXEC_CORE is disabled.
> 
> The helper reports only the normal kexec reboot path. Crash kexec and
> preserve-context kexec do not set this state.
> 
> Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/kexec.h | 2 ++
>  kernel/kexec_core.c   | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 8a22bc9b8c6c..827a5311d97a 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -468,6 +468,7 @@ bool kexec_load_permitted(int kexec_image_type);
>  
>  /* flag to track if kexec reboot is in progress */
>  extern bool kexec_in_progress;
> +bool kexec_is_in_progress(void);
>  
>  #ifndef page_to_boot_pfn
>  static inline unsigned long page_to_boot_pfn(struct page *page)
> @@ -544,6 +545,7 @@ static inline void *kimage_map_segment(struct kimage *image, int idx)
>  { return NULL; }
>  static inline void kimage_unmap_segment(void *buffer) { }
>  #define kexec_in_progress false
> +static inline bool kexec_is_in_progress(void) { return false; }
>  #endif /* CONFIG_KEXEC_CORE */
>  
>  #ifdef CONFIG_KEXEC_SIG
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index dc770b9a6d05..282c7b3c6c35 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -23,6 +23,7 @@
>  #include <linux/hardirq.h>
>  #include <linux/elf.h>
>  #include <linux/elfcore.h>
> +#include <linux/export.h>
>  #include <linux/utsname.h>
>  #include <linux/numa.h>
>  #include <linux/suspend.h>
> @@ -54,6 +55,12 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
>  /* Flag to indicate we are going to kexec a new kernel */
>  bool kexec_in_progress = false;
>  
> +bool kexec_is_in_progress(void)
> +{
> +	return kexec_in_progress;
> +}
> +EXPORT_SYMBOL_GPL(kexec_is_in_progress);
> +
>  bool kexec_file_dbg_print;
>  
>  /*
> -- 
> 2.43.0

-- 
Sincerely yours,
Mike.
