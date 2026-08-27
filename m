Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E01C862D;
	Thu, 27 Aug 2026 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840952; cv=none; b=m6Nh0hbg+x95MZX1zogkA/ZSrgjOZlKKmeAW1ufHSvpUXUXFJyoq4kxQPHyfvz3iDWoCvO4yklx4sGWS1Ka4APiazN3H/GRISNe+NAfRINECRckWkvUxhIinNls6C+Kd8Aib5PkfBUc6VpUOioQNe9AHvMQ6fEtAbbBa6JCNuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840952; c=relaxed/simple;
	bh=6brJ3I/FMSLxeAu7VYeM5Y1AtwdHO0fwzquf41vQQ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PimSIt1Zut3uGaIw0Is7lRryujgJWFYLxxd3c+S/JN87cZefV3vxiddloNCmP6x0EpFYDyWqa51JBupZV+rFK9WdCLw4yzHCQBJcLbfY9nGm2L4qSF/UDDnzI1QQ4oYvsFXL1CogF0xG1nPlsoZutkASy3RCfhBGI8qOc34F3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MN8qz0e3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MN8qz0e3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7539E40E021A;
	Thu, 27 Aug 2026 14:28:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ObWb8cOFOnty; Thu, 27 Aug 2026 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787840928; bh=nH1dEa45oKyEZ+LvyVfaxCb3KtSM1VwnQfe9BHKlGaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MN8qz0e3pXb/1DL78Fq1XC5Hr75Pv2Og34nfm4yQbcx7w01QaBJG/Y5t3S6DR2sI4
	 nOoLvlLbDx8LnDFCYAY0xNz7ApPmo0ahdYGXcdh4rsrUh3g0z8vSAicxm5WVWFtaW1
	 52O0ix8ZLAqBxTbXYysHq93LeT6UlocQ+hxu+R7fWPZFIxsIDzqzI2xWmvfrXQMHYk
	 atAbPpbg28vUKuk3TX5o2bUydDwdrhQFraiX+GwA6oSu2MwMu+Q8lFgQVcYIDnGGno
	 Rz1JFfDL8uRIqvl5s2HiRr/faX1irlrpjMcEF7xzlFLvg+ABbDF2cl2/DPgkcdryBm
	 +3byy+38iZZV4K093GMSWXW1xH0y/VkjUsiZ5F7otaUWCSHM1eehZ7AyEi4WedT0dO
	 mJkfzfu4bPPO9/vAXINgj9j+NbdD+q4fUQp75bXyWG0Q6oPt7XadqP1/0hgp7DDS8O
	 B/bfpyjo8zFVlHyWITijge1LfQWkEbwasZIlYkYahqFdfqFuNjZo/u9JXJG8qlAfMl
	 2aDHAwpswfSgkAfGlLFnjO+ScL9AoTMmt6AIgzmkH+RjL6Ep8u7H0403YE5jeJH7jD
	 6SrlSEuloFfbRCKWfRuSfBRtKZinMIlNkiiKS76uZ8ttPmRKwz/DJ+zeLtIAhtyTDZ
	 H9DcvsVpehYhAg8DxqoEeJz4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BAF2440E00E6;
	Thu, 27 Aug 2026 14:28:33 +0000 (UTC)
Date: Thu, 27 Aug 2026 07:28:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260827142829.GAapBJjfZwSEhZ-_71@fat_crate.local>
References: <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
 <ao7nGM9sCQyxJvsD@gmail.com>
 <20260826160934.GBao8PvsM8M-U7XuFR@fat_crate.local>
 <apAEy6c6xuXJXSEQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <apAEy6c6xuXJXSEQ@gmail.com>

On Thu, Aug 27, 2026 at 02:47:11AM -0700, Breno Leitao wrote:
> This is a user-configured option; each user picks whatever number
> works best for them.
> 
> From a quick look at the Meta fleet, this follows a bi-modal curve:
> a bunch of hosts logging a dozen or so, and a few with thousands. So
> doing some napkin math, I'd say "many" is around 100ish for Meta
> fleet.

Sounds to me like this patch should remain in the Meta kernels too then.

Because I don't see it being that useful for upstream.

> Correct, that's exactly my approach here.
> 
> After X CE errors, we acknowledge that the machine is no longer
> stable enough to keep carrying the workload, and simply panic. It's
> the last resort: it means lab technicians haven't fixed the problem,
> and nobody has gracefully powered off the host either.

So panic instead of graceful shutdown.

This makes it even more a Meta-only specific approach.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
