Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665512CDA5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102583; cv=none; b=iZldFATKNy1U+fLDx58YSxA9vYAykThOZQqQlq78HC9Sn/R8kC9u8x7XbluGVU/ggL/1Dc9qt245O1upZMBfr2+jLAGTw7pr7B9mo8vkO2rXxLNUuvTua2zjm/epkeLzyMMWh99trt2+UcgjI9u8+8YnaGDan5efTOd/+v6iv9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102583; c=relaxed/simple;
	bh=wBpjlKhhKIs6q3hHJHNz5IyrsFqpIxAyA7zvxOXZcAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8PMrXRSchAOJfx9h+OAA++1HzM0zmV+VvLJ5uEa/RyAr35A7tr6BWk9WtKR2VbK0R3ER3WP+8Ecl6DmkeGa2ev+9Din6gHow2RL5FJd+e7xMGyedlL9jPV6FJ6RdetL5zH0jbT7BRM2t3ECHhr+hOOr5bp1FDNfKLI1WINOijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Eal1toxd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Eal1toxd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DA03740E0497;
	Thu, 15 Oct 2026 22:16:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 80Z-8B1sJTl2; Thu, 15 Oct 2026 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792102575; bh=ayvyf0SQKGYl3AXZdZH/iDjIpOIVCOpr/zIAFrXxluE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eal1toxdOhCf1v9Vm+kGWIgleqGavTE/aGcf4EiVB+Q40bgDA289jaskoAd3YUkA1
	 2IrrFTCyudrY2/2BbOe6E7E8XvFcGY9qc+TQ01+Gg2OyKU7jxQpNx1qOONlVuJ8pYE
	 LUG/lMIOi61R6fFj9yBKlAtD9+Do2IOG4ZfxZ8I4974KmjF6bzINqNiafklFwvxoSt
	 y0FKlY5+3a70rGOg2mpMzS9EVVmH/JYjWWhuib8II6kgCw1MdOIhV0QU4BW0xZruHv
	 GKF63jRG6C6XoXJ/M0yv2UflPvGboDHXPfwY2YLqZ+BZzdfuR44zMLIOO5MW7JUndg
	 +MT+gAX1+tEzNF24HJLK23YXhzyRnh0UTtQ10lMCfW4HJ2g4JiJHI3qzvzV1Qx8udI
	 IxXN4OpKSX0whvSH7hC4kgYvKhOtdiSVU6iDV4ErF2XwGnRXrplS5hysm0mjeBNdWL
	 B2CzlXNNtTF4dahMZ61zt+akX1j8eI6Y08m8IfXwzaUvGzAKYV6tVQ3j4tqsbgsV0j
	 3EZ3E1MsEBFVKRFW3+buKB9VsK3aY+uh0TRqg7tJ+UjRPTnnbDbD4wH/hHRiJU5Er6
	 BwK8/oQB1SeiaiP8YncOywvuCuQJofV89XLYIrHq6HMH6644D54Yg175kMMz8Y0pLF
	 0Be7nzIerTj69bCLh0W8Npi8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2919D40E047F;
	Thu, 15 Oct 2026 22:15:58 +0000 (UTC)
Date: Thu, 15 Oct 2026 15:15:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Cc: David Laight <david.laight.linux@gmail.com>,
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
	luizcap@redhat.com, pbonzini@redhat.com,
	Tal Zussman <tz2294@columbia.edu>,
	Matt Fleming <matt@readmodwrite.com>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <20261015221556.GBatFQnDnsIjRVOpU-@fat_crate.local>
References: <asKdhWiJb3qXeopz@pcnci.linuxbox.cz>
 <bd8e9b01ad88cafb12da33331f32a1ce315f590b.camel@surriel.com>
 <20261005132113.43548696@pumpkin>
 <asP5xK4axiUk7jun@pcnci.linuxbox.cz>
 <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <atCZc+XB1eWWR02x@pcnci.linuxbox.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atCZc+XB1eWWR02x@pcnci.linuxbox.cz>

On Thu, Oct 15, 2026 at 11:14:27AM +0200, Nikola Ciprich wrote:
> it doesn't seem to affect users in any way, so I'll just keep it running
> and report if I get some issue

Thanks, yeah, let's see what happens...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
