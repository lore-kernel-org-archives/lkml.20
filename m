Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AABE476076;
	Tue,  1 Sep 2026 23:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304939; cv=none; b=Pp+61EFPlDj26KU/65CnhxPGrTBzsWW2DcdOCSmjTY3cBRt101c63Qcyk5siyjzG0OziJPDpACdEw3adK2ntKDMrJrOppklKbKOPdgArZZoaAchKDc2uhflQzlzqb/dHSWNGn8ZkgmTnXpbo4HrMn+evdk/8wt/Y1If+MyzjVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304939; c=relaxed/simple;
	bh=scK+kptJkNr6W7MX96O7NPZI3nTU+LU+7fmHevKf1Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcDt6fSJ/uZgnHfhMbpXj0W3uRZIzE+1ROMnJDEPzAdFdt5VJYlOjbA/znYdxk68D9rrSwAsqHl0YX64DVGtS+dP8c5q+czjmkg96qq4rUlLyCP7kJfmJAgw4eKYKQwteYaXzJ5h39iRSUbqUVEEPffDYP6u4Dplv2gHdDGytzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Mkm6k+FK; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Mkm6k+FK"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CF27940E02C2;
	Tue,  1 Sep 2026 23:22:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gO4gW60X3RF1; Tue,  1 Sep 2026 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788304920; bh=OaTycWBx2t67XjEtvYVwpUli/s3apDRKpXj/az5pMFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mkm6k+FKHtu+tSDkqr+tXyxHkBUxE9J7l9FCog4yYS2l1SaLYrUGooQu3dJw498E2
	 73svyrPDyXGy1EGG8DpF/K5e4Ny2KvfUvLZ2sdC9v82dMVktwBfa64rgWMgk8KHPfT
	 oumTyluzlHXPRrPcKd48UKO+UvudF1hCVhylvAAKb27cb05oTQiNd9y5a7RPMhQ+hX
	 g8FvXXufUwnJS0cG5IFA89UKaGiTLme8xLXdezKrM6DlE1LDVgcNQVuyX75GOGHr2C
	 em4u/+mjwvIsrf5X7j6YmBNDaRM0KQIHe0blQQZJxcsLWL9Gaft07KsAzoCZVR08Z5
	 vjPBzTq+HiJ5M9ogezIDicSYTk+Fv+FBrLMorGhDwWioDJti+Nz7geURUjqN4RyoG0
	 jiC34dYB4J3nNLDoGB4jsguvLJA/nuW5UknX1PCnR5CviHOEeUPIiCY/zNRr3+iuB9
	 g4Du9dus3vKQ85NxbppX3t+UfvfgkWxzoE2+fmfNjJY3czMeihXuCGHv74pteYisfQ
	 PwpMPNMIOc1XauRufFC3Ac3/27bEfMcYfAaCcJX72ue05XL6wXn1pX02DyJD3kzHrJ
	 aaUojZkefYXpk5YVqFcFh/pwh26Y3IEvI4KGPlnvzUH/pYHiVH4nK0MI3zIT+GPxI/
	 wLpr2RIAxhHj9MHDUJZifs/g=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0D9D140E01E1;
	Tue,  1 Sep 2026 23:21:42 +0000 (UTC)
Date: Tue, 1 Sep 2026 16:21:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260901232139.GBapdeA0fj1XjLsjAM@fat_crate.local>
References: <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
 <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
 <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>

On Tue, Sep 01, 2026 at 12:26:16PM -0700, Reinette Chatre wrote:
> From my side I provide a very high level summary of my view below as we await
> guidance per [1]:

I thought we agreed on that:

https://lore.kernel.org/r/20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local

and

https://lore.kernel.org/lkml/98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com/

I am reading your reply as you're agreeing with me.

Or?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
