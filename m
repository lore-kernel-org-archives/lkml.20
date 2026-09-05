Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB611D7E5C;
	Sat,  5 Sep 2026 00:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569144; cv=none; b=gnoTme9UH2+ZTWk7Gs/KjHbv4767ABJ3GvwryFkpkgKRbq7fVrjwNmjypoYKPcgQOqPanNaOmWhp4m6FiFkC2ovGGG9j+EJkcGil5f6uY1UmAISwu7a1tAda2CK5lH6Pcb7CtLPTvFEoyoecTgtFT7VZJ1fn8i/j8AgrXvCCHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569144; c=relaxed/simple;
	bh=a0cW6PYD2Tr3wJD2E0ngQ0wexkWk1v4S7G4nYtgrnGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hONm0DNEFgEK0mvay1Q0OhwoRQd3XgNkbCOPEVYDoeL+456upRlCef3MPNR7OmALO1d31JWwUA41b8UKpxKtpsq3z8Tu82/oZX4nDssMLYganLHXEntYjtMEbmu2jP+5i1E/CkUZ6nO3rxi8bnMoTPP6EqqzUBOgzJ5cTENdIlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KeE8Kb2d; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KeE8Kb2d"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1A4540E016C;
	Sat,  5 Sep 2026 00:45:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3y-QtSAJBYRS; Sat,  5 Sep 2026 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788569124; bh=nORnCbVbH5mxAliZabDrZOjSHlsyvMySDHzBkM2HwuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeE8Kb2dJnLpc0Ry3NEKvf3vCEVLMrMV5QyBRo0KxYaxV6VWbglrWNnrM8qZ2VlEs
	 ueh8B2nHU+9dRPzuM6kk9rWnQUyj5td8sG11Qu7nvf+nXlKe/Y37FBMmcVj5FAL6u1
	 VT0i/uuIUTac3SnYSaDI641+CO3QgfQkn0KDmsS7SZztN2am2SvPlOLRI3jPEXq292
	 VrTouNMrb/w0olJhxn9MlEoY4GLkSVlXYMDH9IEGfyELbP9kx80sAnZIG9jaZgfq/G
	 74/j2OdNPx3DYb1f+JyjQ/Su6akocpeeBsC+0zjuf4cujmMG/aAKr6vlBeTZKtEHOQ
	 b4iJx2bsGvAkioblq8nCMLSR0DrIOInD52wduSNooIPkeM2v/IbFEWlWc765lHdBgc
	 akFqn4qBCWTPJBkq4l+Df/Vaa92wdDrNZ2kPNXw6di8BuKngMNfUD+QSMuzg6WcV+N
	 rfU4i6KVr+I7GcgHGvcuIGiI+NpnqeUi9TremNXpJTLbQ1z7HgWjDS0eGXtKCWPwhu
	 7XkLHhs+rydTLhEqlSMPr7ObvpPwEKh1jJD/mUSBOF8kD4NhUGM29XP6Akx75CjKXP
	 C+tVq40iIVxeWjYZ1zdIk9Iq5hZe+Ib8qVj5QjnAnD76ty8L9dc4usZ1PIfLT8Ajup
	 6wdQMImKL4K6CzagrtA8O8sE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38E8340E01E1;
	Sat,  5 Sep 2026 00:45:09 +0000 (UTC)
Date: Fri, 4 Sep 2026 17:45:05 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260905004505.GAaptmEVxltONVfl2J@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <35ebb8d4-2ef0-4bc0-ac3f-afff0c95ae89@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35ebb8d4-2ef0-4bc0-ac3f-afff0c95ae89@intel.com>

On Fri, Sep 04, 2026 at 02:15:08PM -0700, Reinette Chatre wrote:
> Sashiko's second comment is about resctrl's existing (not introduced by this patch)
> Intel specific enumeration being resilient against a hypervisor misconfiguration.
> Thus far resctrl assumed the enumeration would return what the actual hardware
> is known to support.
> 
> Sashiko had similar "hypervisor misconfiguration" comments in response to another
> resctrl series that already falls under the "cleanup" umbrella. It is not clear to
> me how far resctrl needs to go to be resilient against hypervisor misconfiguration
> but I can include needed validation addressing this report as part of [1]. 

I would always ask myself how realistic is the use case. Here, I'm thinking
not that realistic unless you guys wanna support resctrl in a guest. Which
would be weird, IMHO, because a guest can fake all kinds of hw so controlling
resources of a fake hw is an exercise in futility.

So might as well answer that Sashiko review comment with "thanks, but no
thanks."

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
