Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFA30ACF2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789101619; cv=none; b=LX1iE/jx407cnhN0FWcmUgNUcElu8dJmpwjzN6Bn/pUqqiSTjUNpJdyQ+7Y+LZXYWdOx5xsslSGVCxj0nbCrfOGe4ycumpuu3BT2AYg9sG/QY1dvko3rLeqEDwy0TTtmO2TaBrtv368b0/Bolg6wSMU1Ay4scdgSV6DFFo54n2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789101619; c=relaxed/simple;
	bh=bWp+dCR9cHiSAQsGz7STZo+mJEKj/PDlPUndkySUI5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3yzAg1CebdOxmFIHBhVyD2Pa8ykR8DWmGfQ5B2d3qLFVey1ti48vH0/E1wtD+K7LBCkSm4K1gjchX+Ufn9t5kGTOsAZByd59bbr7XaEUy/35/na9a3WHFwhBr/uy0ywWQgCPbSgJvYnOU+/Rf+obLhaxicYxLH+1rgiLZ0bvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Q7q3U/Mq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Q7q3U/Mq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B7CAC40E00E8;
	Fri, 11 Sep 2026 04:40:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id njDzaZ9af6w9; Fri, 11 Sep 2026 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789101604; bh=6qo6QIs0b8aAAaNSTcLUnAAWEPHz3aFEX3OTeai0y60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7q3U/MqLnZqz9eauXKGR5jkGJoQi/xsVneN3cpyobRdrDoSZieIYnY5Kczd77/QS
	 QtW0OuJqp+UpOM2b7qA7NV1xgMtrbpezYey5yKCRtFISka3VbmA+gDHJ2BYxYKYZak
	 +YkuPDvyFQwH2IzESFjNzr/Vw0M+v3EZN4ggIA/R0/j/6hGtAeh1spO/Ll5aLdWoAb
	 RiT3/XxrrFYIl6f5osJRwfV7Oad/wV6+xGO3AfZKqBD7t+jFL5uxietxLquGSpCCxG
	 HlBCvN7rBSTXeB13qllYR/k+GjLH41zoQetUNUrV78FZeqap62y093w9mUkAtnknen
	 zxL/vsCndurZTjncKxdKajbHdAK3SEq68Kn7g3YJbTt+oGPuWegSjC+K/zZzjViwZ2
	 Vjas1VTohdoOfbDzgt9AXegkjm4cOcHyadroTDj3/0wFaeMQLgAEqJlHrdsYkuy1XH
	 Hyl2A2EqO//Ze+yX0xeVWlSaD2OeRnJ0zVSJDZX7F6yyGlT9obDHd6uiwdOZBDFM3n
	 WicAreuz2Vz/+GLvOUp5CvPou5WZn5NGs3QeeOnXcxP76I/z5ttw5J+pG2g00lEpjs
	 jO0/0Iy+D5edRQ3OQjuF1m0wZ1KEFDu/NyvfdYeYte4dJX9EJqXNCnZyH19HQRFBSQ
	 5s/aSZcj+EvMoKdRSTOKTtkQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5171840E00B8;
	Fri, 11 Sep 2026 04:39:50 +0000 (UTC)
Date: Thu, 10 Sep 2026 21:39:47 -0700
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
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
Message-ID: <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>

On Sat, Aug 22, 2026 at 03:33:21PM -0300, Mauricio Faria de Oliveira wrote:
> Even with __builtin the compiler may decide to use the out of line function
> instead of the inline implementation.
> 
> This particular one (still) generated the inline implementation as expected
> (at least in these compiler versions) but this is not guaranteed to remain.
> 
> Switch the builtin to the inline implementation to address it.
> 
> Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/platform/pvh/enlighten.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
> index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
> --- a/arch/x86/platform/pvh/enlighten.c
> +++ b/arch/x86/platform/pvh/enlighten.c
> @@ -8,6 +8,7 @@
>  #include <asm/hypervisor.h>
>  #include <asm/e820/api.h>
>  #include <asm/x86_init.h>
> +#include <asm/string.h>
>  
>  #include <asm/xen/interface.h>
>  
> @@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
>  	 * This must not compile to "call memset" because memset() may be
>  	 * instrumented.
>  	 */
> -	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
> +	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
>  
>  	hypervisor_specific_init(xen_guest);
>  
> 
> -- 

Why is this a separate patch from 4/5 if it is fixing the same thing?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
