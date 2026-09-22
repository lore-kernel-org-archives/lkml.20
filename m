Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB6A3438BA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037988; cv=none; b=A5mi3o+xM8xcKdfKnyRBxDVeKrw43Z6ZH9eODPZSdobeNUfEIAB350nI2Xz+N29cZSR5IHO7nJLmRbXr0fgJ45em88uUmiLaAbbp21lTpdl4e9tkBrC0k0byBZoRvBDi/S8rVhdVYyoXRsEasUd64kfvhfE+kOoi0tT/hXyK6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037988; c=relaxed/simple;
	bh=vKtCm9XTjkRQb9SfW4f7ls/hU2zKhYJWUzRnnXGUYXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUHEtaC4WbECJDeqWrVV/BAtmd4Noo9dj0Fre6Vq+6ZIRfBgWqO7AfLszK/uskqGizivfuM+jiwFulVuk1y3N+HUOBHRiDE7nqpVKjrmeeZ1tsovnidSI1kohWRWx4mfKp/RnCIqVuo2l5GBnR7fqQLmPVVL2rkbhN+u2w379Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=amLSiIt+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="amLSiIt+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 80B2740E00E8;
	Tue, 22 Sep 2026 00:46:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g-LcIrRPDDmk; Tue, 22 Sep 2026 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790037973; bh=alLEgG3Mvb7R5zvWzg29bTIj32mdD3BXsRGDk4es6hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amLSiIt+Ffrfz0nIhEWJhQXQb7YNdp/CO9wXQ2BxZg1yLpCV6X9eoUIXY2oyKz0Ow
	 RZ4vx0tTKmK2l+OF3dRUmH/V3MwlavpDcOlV/NxhO5DiyolsalDh29Kze1aApWjIKj
	 yGJQTuuq3LkJzLAfnTwXaNpzhN7WcIbXi8UV8uTdimafCIEil3Z8prXFmfvCWq9GVN
	 uSJ4ESefPdB8eFPg3ll71+cLI91wjO84CO5eW50h1LURSs/cxczb5h8g8SS6T94MOO
	 uRxNLsUqYVuws8iWIIi3oQVTFquDkphC00iIiuRRqfpbEsgOpoZIlrzD54YX6MGO6G
	 sntL2Ct7ViYNqCtPLhJgpPPFluVRaeBx0XG6qW1c6VcAOrLSlpQGU7ZAprHI7TGwF3
	 Aw+tqqrph7/qsqImuiV+E26kUQZNTvyJwjWtoPCYS2xvwfUsCpzptp4HZL0meoagOb
	 XPvQMaX9Bf3MbrlXWtquu70W2XM7ZAkhnExESO0rLCfAvIWc8zfPZa1rj1qbbuDJzK
	 z7KoUr/Izet6N2rGTWEQKiE4AaNeg9Tp2b6bZ6oNxjNMoWVCqftD+b2yVWgZBKHCiF
	 r7NSEy7zlvAdjAGN+ghPxr+O8QCbbmoIRi2b3E5Qsg9EhvOjWlhskTNAMellnHhRVk
	 W5BGlq1RVAJW0CvhUTMpio6g=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 11C8640E015B;
	Tue, 22 Sep 2026 00:46:02 +0000 (UTC)
Date: Mon, 21 Sep 2026 17:45:59 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 3/7] x86/fpu: Extract restore_from_ia32_fxstate() and
 clean up fpu__restore_sig()
Message-ID: <20260922004559.GAarHPx9ttq-TzP2WG@fat_crate.local>
References: <20260916232310.490786-1-avagin@google.com>
 <20260916232310.490786-4-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916232310.490786-4-avagin@google.com>

On Wed, Sep 16, 2026 at 11:23:06PM +0000, Andrei Vagin wrote:
> diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> index cd7db6dc819b..db069947bdb8 100644
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@ -325,32 +325,24 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool f
>  	return true;
>  }
>  
> -static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
> -			      bool ia32_fxstate)
> +#if defined(CONFIG_X86_32) || defined(CONFIG_IA32_EMULATION)

We didn't need that ugly ifdeffery and the stub until now. Can we use
IS_ENABLED instead and return false early?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
