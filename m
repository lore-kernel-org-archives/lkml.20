Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395341DED42;
	Wed,  2 Sep 2026 00:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309857; cv=none; b=oDyg/0klI+S0RowU9VVticfpj3dxGQt5mL5BZWQ+Yn72yT8hs0g53Sl6O2gu/ioiraiHtmSN8Ll7oRHVAf79288segNFh6JPyOuCabQyNk7ewjVpFOFMzteMJX5NAwVw+MBO9IuuAmuqQt0hor/mOP6MST3vwGOWFm9uokCEd34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309857; c=relaxed/simple;
	bh=gJN+B8AdtIAqiqlPYkcdFewfpZtr61Ziw8lDiM2W14Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdHYVF5XfBe28ep2/VfaaBkgFGq6/JtTCIkGwaFroJ8JIwAcMQPJEsnCewV2Hpw76HGHxh1NZu7uAw1j1589ZOwvW/dbypsufstk/2CAzDyulABz8Rv49KIT1ej+ZtlJcSXSxvZE/qHmGy1OZCjyagIVyeH+D1yooQAYduuITw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cv9O5YaB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cv9O5YaB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9257440E0301;
	Wed,  2 Sep 2026 00:44:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0iyfOlrPVYVk; Wed,  2 Sep 2026 00:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788309842; bh=rRTmD2cmwjFey9eoLHnKbN56gUWS7lz0BLKPZq8BhEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cv9O5YaB93g3WoZST4mvqTMSq+7gWOyvK4ILugR7tqNCqSnNue/Pq263m73gx6YJI
	 dYonXGUShfBTJVYLFMV+1WxFbM40Gw+wRlRd285BpPpJvno1Op4GkUml6IRkmudZBJ
	 sYXFkOZCX8qevdk28ZgSWCNRyWn9Wv1K4GOGaQni5KbP5ybns4xoPxTBw0Ea8VCdEv
	 9mM8MKIf3m83yezypJLDVB7os+Kdjz4PchMkCz0J5icjZ1u8n8R4HDJ5nH062O6UfD
	 1j77AM5Y+Uqd8aMwp2eWJR/ROVvssrEnRb9FWqlht/FmqtiDRtp7SIy9ozBgfD6paw
	 M5RswH/KUhDVZHd+D8E7V0waQr1n7HiJ57eUABR4M1qzDCE90vjkOxk1+9F9U6+ucn
	 E7MPWnE+vkFhUO1ILs4V2Lge9Ysht8jyb75yPTGDJ6Xee6zfjDD67qZnFe0+DARC/v
	 0/7GAZi7GdQ5jyEGifVa/OEdQZYUkHUGHFhsYrouuwHKkbeMt0JQXNYGZlXMdOTVoy
	 mXdiM069uL2sjQ5YZQ3py8CpbgUBo3z8kytvWwQi7nWkTtAGr6qnn8iLm4sN9hrjS/
	 GM/j4adw36dceom5lSNYU/823/aNDm9eiU4EcdjueNqnnFzcrK5jYe07JK5qhks4zO
	 Hqysqw2GiT7RzUWVxAxREWU8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 014BA40E027F;
	Wed,  2 Sep 2026 00:43:44 +0000 (UTC)
Date: Tue, 1 Sep 2026 17:43:41 -0700
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
Message-ID: <20260902004341.GCapdxPZmGSjGacft2@fat_crate.local>
References: <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
 <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
 <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>
 <20260901232139.GBapdeA0fj1XjLsjAM@fat_crate.local>
 <4a81506d-87a1-428f-b797-d9391aedcc7a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a81506d-87a1-428f-b797-d9391aedcc7a@intel.com>

On Tue, Sep 01, 2026 at 05:21:20PM -0700, Reinette Chatre wrote:
> Boris:
> 	I agreed to follow your guidance. I did have some nitpicks in the email that
> 	you linked to and the discussion that followed created the impression with
> 	me that	you were considering other options. Specifically
> 
> 	https://lore.kernel.org/lkml/20260805002138.GHanKCEmyMcvK8Xg4w@fat_crate.local/
> 
> 	is what I misunderstood as this topic still being open. My apologies.

Ah, ok, sorry for the confusion. This was me gathering some other suggestions
from Tony and the AET side.

> 	To answer your question on how to move forward I thus think what is needed
> 	is a minimized patch for easier backporting that is marked for stable.

Because, yes, this should be the path forward currently. A minimal patch to
fix the issue. Then, when the imminent situation is addressed, we can always
go and try and improve things at leisure like we always do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
