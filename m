Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDE3B14CE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791065513; cv=none; b=ImfmvlelquINTcufoxnjPT+gw11/A5U5OHOVbr8EDp1P5ygDmdTxVY6rE9rabvVIPoLZF5ul8HLIkFJdlCLa+g2oO5aiEeCn9Yjm7xRkDswQqDDuiJCnkEv7VJauRJn/iIC1pRHNGZsfze9yqcVabUCFDsYq6a4F9l+gSEeA7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791065513; c=relaxed/simple;
	bh=/FDcxP2VxOCq6pCdMLW2nHCghQmeUDFNpUmAW9Z+LZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hof0XmivDIkK8JKKUrrSQX2ZsSQJLLLxxbMuay1YQIyNzuWyfJ6m2qwnte9ySFMiBsKFeEF3/50FfnZ0oZXK9MOrs258zfbM8N/rvolWm/vhOoOT2wS2+DISGFZx0MO+Seo/HanLXeDA6EaLFd4kGgIegdrgLajZ3QyuDVBehnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Zoge+cJh; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Zoge+cJh"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 73B2340E00E8;
	Sat,  3 Oct 2026 22:11:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id G_0F1zM_b6BI; Sat,  3 Oct 2026 22:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791065495; bh=h0gCLOQ//5qC9nart87cQ0it1ao5nZmJq2+8GQALRRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zoge+cJhkX/CjJiSbatyJmy45fCcf4U6uFAy4Yt76yT8OwhSBzVMsiUBVNzFqE8UR
	 6QHd4L5xmSuZ0T4hYuBhBALheQs8dsFlCMEqXzNPfIoPEBUJ9jdgcMpMEWeUcsPNos
	 5oeCvxe20iqn9CxorbWbar/OSM/KMRP/iRZ2obGhYbNxXHefZI33FUfCX5YQbx39gH
	 CXYWCYKCOLosjJk9s7CDehEEQzFlS20fvP24XvDk8JZV/ZRJozxUXouxlUf6uzfVNV
	 hD6JFLnN/eWNIgdO8bsGXsUmpGowdiTciilTmFHdPFVW1JF2eQaU9qtgelYYcXTJfk
	 nacjTX0+reDvNUTiZ6qGhmWMJBthxj/8Pq1dS3YbXYMV1M98O9/sqcWgpJYw7MU05d
	 /o7jFG7FJDhvkMfMKOhbUThtWqtJtg+OANdmXcue8R7oIoZshWakNeLL3cofI7gBBC
	 rMx1wYytrmNN3jilKOc1yOtHachqwUdUoSC58cpaIHpkkjbA0H87jBX02Upxf2Rnpj
	 kSy/uE0grKHke3NDRn5hN3cDWpNWKt1wIBxL7CnZ/7ke1wd5oE6KUULaB82ErsmSX6
	 ALBom1fFfdfExAbzjijgKTULQEXRnmvqi5vLO0Hj8lEsyai7gN0z/yBRkz8oIE+M5i
	 oMHpSo7S89+lS57VBeVtEU20=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DFC7A40E021A;
	Sat,  3 Oct 2026 22:11:27 +0000 (UTC)
Date: Sat, 3 Oct 2026 15:11:24 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/5] x86/boot: Remove hardcoded boot_param constants
Message-ID: <20261003221124.GBasF9jPtYg953gHaU@fat_crate.local>
References: <20260724030256.232690-1-brgerst@gmail.com>
 <20260724030256.232690-4-brgerst@gmail.com>
 <84c3aee9-d03f-4880-8974-99b2a8ee3841@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84c3aee9-d03f-4880-8974-99b2a8ee3841@amd.com>

On Fri, Jul 24, 2026 at 01:22:29PM -0500, Tom Lendacky wrote:
> Why not sizeof(*boot_params) here and each place below instead of
> hardcoding the struct?

I know you prefer that but sizeof(struct boot_params) tells you the type
you're measuring while the ptr dereffed one will need you to go find what type
the variable after the "*" is.

IOW, his is more readable IMO.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
