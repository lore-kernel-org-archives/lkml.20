Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490D3B19AF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790726250; cv=none; b=DK/oDzx+Fb8Rb+OUAceprydlsqidWjxQxXQLtxyi6ymCZe+1ShCrbJJulKoaE6onxxRlh861ACMnIwyrRdbirzxOFu/yBnhCYxoSmGAN/jv9N55wAfPIXLfwGGGtP+LACLAFmTc0B3j2UcjBsI7KqRqUcKeSDzu+LEgfCq/ST3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790726250; c=relaxed/simple;
	bh=9Qwqr4O1Hk5QXM5BJaunl/8mdy0F4NYnkgxyteM1Vsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crSF7/AL31alrsjHBa+8ETZs/SfClS5BMGoFe+CIhMZBYFokrdlMSg47MHLrOx9tl7X8QKC30RFkByJUewX0YRl0FAo6BUEvSVXoQu+EYZIms0BNEPQMLROg1Fx+bFY2zHIrNeaXHWPoccp2e+Jr489co4GAqWd20XaondhCcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YL89hyDz; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YL89hyDz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6F3A840E01ED;
	Tue, 29 Sep 2026 23:57:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WcJGX6yWGAaZ; Tue, 29 Sep 2026 23:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790726235; bh=3TXQNKNtzGun0BzILCNXXur5LDD3gQiPLPIRxrj+WG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YL89hyDzenYImpeqKNKHZ4i6ZprbjH0W03mpQCP9ikOeqO38mqi5diJTtwKNXkDyf
	 pqWwmbu/ooyDUHmaP+ke6qxm9GWSwJSJBdhunEwGu9J0giXNfBRKY6yUDzN6PPn1ML
	 Uu/JCQIyiXpoXVF0gOeuR2YSIdlOXHR3cpwmOwMht31naPayaVyYyfKa6GGP98Wxb5
	 TZ/X23gz17mWIMKJwnyAfbNyj13YQ5M/AzfXpK5SrdOJXHctBwFcPcoml54NGi9ksW
	 08czE+xLl+xAZZAdOiqU4oUMT4EUtkJ6PLjIQI9B5fezaxKqiOX2+atBr01SzAo63I
	 mQhVplX/JiaL1MFsiSC0TnpahDHuxfXWWHm8/4ipTsu3sZQFrJhbJtfkEjWF7aM9KH
	 d7ehHhY0xvGxTz7AVd67Owf0ppSSF0zdlJS5wQD/HQjzbdLiMFg26RCTXk1vF80mNu
	 80+4sy6YIRStQQfVjRZ3Ae8GhmZuddAH/FblpyV4QeUhRjZCPtM8+88QHR8/lj94fo
	 wtzHmv2k4hSPDBJ7hwe8Gq1l4vrXNPm0memTMQZwO+deUobk4VmYB5zWFsijGXOBbi
	 Fje4f/BlFXiJyAekUUpHdee5W1heIbZPa5z24j5Qj2Itk1Ihskki44ZGDQlA8xenZZ
	 7uFCNYRsPoQckH8d8mQpA2Nc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D386940E015D;
	Tue, 29 Sep 2026 23:57:04 +0000 (UTC)
Date: Tue, 29 Sep 2026 16:57:00 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@google.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org,
	criu@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger
 xstate_size
Message-ID: <20260929235700.GBarxQTLOrWy1I3UZr@fat_crate.local>
References: <20260929232621.3745312-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929232621.3745312-1-avagin@google.com>

On Tue, Sep 29, 2026 at 11:26:19PM +0000, Andrei Vagin wrote:
> When a process is checkpointed on one machine and restored on another
> (e.g., via CRIU during container/process migration), any signal frame on
> its stack carries the xstate layout of the source CPU.
> 
> Commit fd14edd82077 ("x86/fpu: Pre-fault only required size of xstate
> buffer") enabled restoring signal frames created on CPUs with a smaller
> xstate_size than the destination host's default. However,
> check_xstate_in_sigframe() still enforces that a signal frame's
> xstate_size must not exceed the current task's fpstate->user_size.

Hmm, what happened? Change of heart after the fact?

So I guess I am zapping fd14edd82077 from tip:x86/fpu now and then we test
some more before we try this again?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
