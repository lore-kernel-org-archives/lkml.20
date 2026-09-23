Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A33346BE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125984; cv=none; b=gQifO/N4zsB9OMAEhxkWxWsVPPEEQm3aw95B3p4wgQL0jUKcKxRGZEK3PrtGa0BnFKiTwSxa6F4xitQAPHS9aHgr6JJ8kpqKRjFqf3xPn8DVaQW/v9HPjntrVim6FOC9JzKCOiUiD3TWJYS524GV6MN7JGwhNhXXaXZ7Vz+5DGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125984; c=relaxed/simple;
	bh=nqADIzUIir3XQk0D2wa/p5fhoKf5/ogQNyar+RSY9z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOoiuZHEfHWeGxoNl0Zz1FzTCohUH9bSAFEffHjUcxrGdJ0TXzuc6LPkZlgyL1jOasxfZ/Y2nK7hcal+9Cj8ZPjbxO1FDs6W5b8YBPzemY8FheHB+zYN1boBDsXBSKglhAQvsgSpEJBeq8Kc+57WIFzq5MzI0vezGNCOY37jkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ByW6iTGx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ByW6iTGx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F3C8B40E016C;
	Wed, 23 Sep 2026 01:12:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6o-Fo31hAHa9; Wed, 23 Sep 2026 01:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790125970; bh=uWKwydJTNrxZzExrdKneBzP0b9+gsjTjN2mem4Zk7Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByW6iTGxph5qdd6H36j8szI6mZnmiunldGYwh0edVemYmU5fJxDf3kjazB9Nkx387
	 C03N4L2UqELPzgreD3hZUn6FOn4mg1Z9iyZD8h6g4JwPQ67ZPbyLcAO9I3yvFn814g
	 LUzP0gS6us1xtFDb5K7Vhp02MtfpmPCT/lSW1AYFzplbHtnNVTlcdAvXljVoK8vmUs
	 j8zAyEuzFJfloggsP2KY8cXmNPgjKiFnrDD/Rm6wsAXyb/tg/9Hk3pgVPQHdkQZC50
	 ovcd514Ek64IUy9hT04pRhcqB3xNgkmoK9ijOhoiPy8mcwKqBn5TrXz2AKMT7V8Wy4
	 pChbdxTxfZFX5rw3XnGX2DBaV5YeWRrURqgDDkoxOSCAJd3+MtANuOPGC/uZx/1Qh7
	 5gp5DuuNB7ERfZi/qGQFqrtYp15uQi+r29W/sRrZGEzu8UF8Q4PXLZN6Et4PFqJTaO
	 V3x0/Kn1ZxxB93ZRfE31x5t4EOJ6DGcqK0P67EjhfGbdU57Fsuod36Xm5u48iIR1S/
	 6GaD68UIzAsQwoNZ+HbUaeJQ8cLZYjed6/o/EQmsp56SG/gcFl8Y+sAXUyZoPHF3RK
	 5ENNwIgmg/qMobHPIzEPyxbPeQRcftt04LNpGM6NiT+F2akLaoOSqcrnOmD2e12zat
	 RZbfvZK1kBMH7nQIzd8FIh7w=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6BA7340E015D;
	Wed, 23 Sep 2026 01:12:35 +0000 (UTC)
Date: Tue, 22 Sep 2026 18:12:32 -0700
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
Message-ID: <20260923011232.GBarMngDiylzal41XI@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
 <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
 <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>

On Tue, Sep 22, 2026 at 07:13:35PM -0300, Mauricio Faria de Oliveira wrote:
> I think that is fine, yes. Even though it's a boot failure, actually
> hitting it depends on all of: CONFIG_KASAN, CONFIG_PVH, booting from the
> PVH entry point, _plus_ a compiler version that triggers it.
> 
> Nonetheless, this may be picked up for stable due to the Fixes: tags,
> but I can provide backports as needed.

Right, just consider all the bandwidth of the folks involved downstream:
stable team and all distros backporting stuff every day. This sounds like an
exotic thing so let's be conservative here pls.

> BTW, I just realized that the title of patch 4/4 is missing memset().
> Would you mind adding it, please? Or I can send v11.
> -x86/cpuid: fix unbootable VMs by really inlining memcmp() in
> cpuid_base_hypervisor() and xen_prepare_pvh()
> +x86/cpuid: fix unbootable VMs by really inlining memcmp() and memset()
> in cpuid_base_hypervisor() and xen_prepare_pvh()

Sure, np.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
