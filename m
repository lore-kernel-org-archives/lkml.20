Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277873;
	b=KqYZNfTT3McZ/KaZ1nSyAgg9JIJVXtNwcQwGxSI1Rr7+MoYJtW8cEtsfYaqZULYfwTsT
	 vPwKiiDx+WYnEA9zViGfLDEnwU1VO5kM2LkQStSe2dXv3b25SK85w/z4DgQwU4yNiac0A
	 7GIMTrFRkWJnsu+wVCtUNg0cGyPklPiKJRlZmAY8bMl+BwvSYUETkHqBZH+nBJcQx/Oal
	 WqHEIk9aPPghHp7g4h/mxgrvjRYm7wCbSTLlxQGKiHbcjY22SW5b6fqSejBgFUZuRi8Lr
	 9QXYC+ekJ69moGRo5T4UzOzJk00l6CwJU1yBDjMghOl4so3lUPq0iFY6rQxXzz2v5ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277873;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=05W4yApdW6fKJ5133N5Gim93/IrFgrZW39fL4T5FCW0=;
	b=VLS4ar7vNnkT/saXw4QAlE5AKWsvLDtEgtJsHkbSJkGvFURF2MgwQQ5HmX66pvxC1t0K
	 exF3KDkQL/aMD6TJEH3db6MDZc67feecqHo+KfGAtt2wnDEc/Gr1d5kqP/gOyo5XcgVpS
	 SrpWysbcGjZGhM15kLE8pgVXaVd0KiCt8PIiID/R4R/K0AsZ17E8wpyYZQaWTCUPaFUm4
	 92HaFCgdLG7KG+8keqW/UduPp3KkiS8hwg+uVGFRmdkD5xNUrjX+i9vmJLDifSxc5xEa6
	 NFO+DIf/cbMm0mI6H7n8De69jt0r659nU8z1/uuS+ClFXpk8MtmnBSJHYhRS6v+kkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hk5O3afT;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B91606A339
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B91606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hk5O3afT
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9403A40E02A0;
	Tue, 10 Nov 2026 02:31:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vSkAX_HkCi1b; Tue, 10 Nov 2026 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794277860; bh=05W4yApdW6fKJ5133N5Gim93/IrFgrZW39fL4T5FCW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hk5O3afT3Xg1joSaBx1YkX6uTslvxGps6aEmZd+sOa+jFR7vA8d1wmECZp+ATUnUC
	 UA4ZFBcnmSuCeeinWhu16XlAyI7OraNvDtyEvMZLR0oFW+tB9Tik7WSvs7T+UQWixj
	 OKxeXFeAcalFMUrIqSqQ/2d/UDyDNer8KnDWrcPH2rDA2o+/Y34wCHK1wNCr8KNkA8
	 2B4yKxtT4nnczd1+bqO0kyCwn7a99o5GkpAb36pyzfOSo+2+L2fIu8vcjmDjQdN15a
	 h0YpHTWrkGUJJHxcXVI0b9NuWstAG0X0LwxqNm2Rs7kl3GmQq9QxuHBZ+XV3q1oxpY
	 GwTR9+zZWA+Dv4Bk+/VLQq+0WhDD459J747XhWJ6VRZp9gglaOq8EIutyIq7WK94Kd
	 si9IVVHBcXdniOiX16dpGePHXgJ9XtovTmjePZeQ2+McZxSH91XOF4hKwWIAzKwEUC
	 khBHJjmNQslSmPUnFbmx/t5tHUAemp1pjpUballM+ueZiBkwW0B4wECBj7w4aD9WNR
	 oxD3AONVouFlIeeEqlILccPCJ7oAIzFGJUJLF4cuvb5twwA6lANmiiPke7pWHiqP9m
	 6i0BSkQg+4n/WDPezxSTG8Kgr1d9S27imBqJ5ONjXWx8EdWim+A/gTI41qMwhlMY+J
	 79aAcqOfEq6mbjtb+Rst1cYw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E687F40E015B;
	Tue, 10 Nov 2026 02:30:50 +0000 (UTC)
Date: Mon, 9 Nov 2026 18:30:47 -0800
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [PATCH v3 2/9] stop_machine: Add NMI-based execution path
Message-ID: <20261110023047.GFavKB16_DlfgpAij7@fat_crate.local>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-3-chang.seok.bae@intel.com>
 <bfe8f403-06c9-4e93-9bcb-738c9128c557@suse.com>
 <1944bd56-201a-4184-af7c-616e282cc953@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1944bd56-201a-4184-af7c-616e282cc953@intel.com>

On Mon, Nov 09, 2026 at 06:06:47PM -0800, Chang S. Bae wrote:
> On 11/6/26 09:44, Nikolay Borisov wrote:
> > 
> > I think this function should be moved over to patch 5 and by having
> > moved/subsumed patch 4, Patch 5 should become patch 3 really so related
> > functionality is introduced in subsequent patches.
> 
> Yeah, the suggestion makes sense to me.
> 
> On top of this fix,
> 	https://lore.kernel.org/lkml/d81a45f9-1ba2-4eed-92f2-c5152c5caa7b@intel.com/
> 
> my local pile now has:
> 
>  * x86/microcode: Remove microcode_nmi_handler_enable
>  * x86/nmi: Simplify offline microcode handler invocation
>  * x86/microcode: Use stop-machine NMI facility
>  * x86/microcode: Distinguish NMI control path on stop-machine callback
>  * stop_machine: Introduce stop_machine_nmi_cpuslocked()
>  * stop_machine: Add NMI-based execution path
>  * x86/nmi: Support NMI stop-machine handler
>  * x86/apic: Implement self-NMI support
>  * stop_machine: Define build option for NMI stop-machine
>  * stop_machine: Refactor multi-CPU stop glue code
> 
> I'll post a revision once sorting out the bugfix part and other feedback.

I think that's enough stuff to warrant a new submission. If the bugfix needs
to go before them, place it first in the series.

You can wait a bit until I finish looking at patch 2 and send you some more
feedback.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
