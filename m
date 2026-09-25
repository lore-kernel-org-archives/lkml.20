Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999F3C4B60
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311655; cv=none; b=VaPQm5sYDjkv4OgPvW9j/NU5h/GCowMGJExYsT5Uj6uVZimLrd411Rx2zWQDVft17OzSQx98C6BAZwwzqQIMmgS8yc+cH49wLT1GijcrBbUqVQkAe8k+Ffv6K9EnlXx/k3GM0O6AxzTri2Zj0RhENHdi1dnDhY5rWxSn1L3uZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311655; c=relaxed/simple;
	bh=eS+2aD9Y3jEV1QgHlIKiZa5jyEEltwbcErLzUySWIrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn4XUDMfNDlNOxO0+sX0GVQrGbVSTwl0JFEVvp6et2sdC7+n4tLBlmFh69PF12rwc3r8avjWiYbXPJTdsIDnjJ0uE0JOC9akzvgUC/ZA2T8FYMeiu/Eq5JI9zdNZCl63TqyB3j7k0mRAvdzTuYDRheqjnzOIIfKebMtyMIlRJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=WH23jZtR; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="WH23jZtR"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B03F240E015D;
	Fri, 25 Sep 2026 04:47:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1Ly4T7OTK9FN; Fri, 25 Sep 2026 04:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790311641; bh=HetyRvPQmfmjEsUDeoWTrgtwxMne6qmaMBlEDqkIhCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WH23jZtRWQQgQI6AssfgwE6MEY+VjFc+2f8jAC/eAai9mAnfpYTI5xemfa2LZtqmO
	 MF12iIH3BjZl0ZSyq7keQpk7eYeMvRssmwi2k5bo/lTp5MmQoTCxCsE2eBl/hjPnNK
	 xwYk8tAb4JEH0K/8YW/NB8BSnjXD8meS9/q21hSvdvGv+GrhRKNaeCKgLzKKZN1yoY
	 Wn3t84XZa+7BxyCIs2G1zu1Gc9qUyqo2FqC0ElR3QP+1Bwthc7O1T6cojCgGNecUF3
	 eoGVmnKCIKFEabTpzS5GKzfuoZUOVr/r2USX1lOWJz0BjDuO/R6JKdDgZ49MvcCmMA
	 3m5AHffNr4yNq/SX3EG+O4p8JFgY7tt9ynzAMk0ERgwL0ZprbMNkBpqrYKE5pq1SjH
	 hA+E9QPdvyetC0JwKtF0+RxcMQ1bSnGZXGIcxYvO+8jWNVnLhOaqFNkMxJ/1UUrhDk
	 7arsTNLDvykpc26hIMSfnWINGi6TJ2p7nZibZkr2huD4WqIoi8rgi/0qU61T1oSroF
	 q/4qyYif13v5IBQdRNDnclZff2m9blZLCO/1s5RObLgE1SXlQN4NsudzcvePIm4LyK
	 TBVboUzHJoNshtT5sOKI0u/nf/Cj5N5Y5Iy/AEoW2fuD2NKyGGV0K9t4RaryAZ8JMO
	 4Ybc4/RwjlQLDxljqYEr2y7Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 428B440E00E7;
	Fri, 25 Sep 2026 04:47:16 +0000 (UTC)
Date: Thu, 24 Sep 2026 21:47:13 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Melody Wang <huibo.wang@amd.com>, x86@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 0/8] Alternate Injection: Secure Interrupt Delivery
 for SEV-SNP Guests - Guest Support
Message-ID: <20260925044713.GEarX80eZzKR-DKfzJ@fat_crate.local>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <1a64a4fb-c14b-454f-a89c-43112b01d187@app.fastmail.com>
 <43674b3b-15a5-494c-b1de-041070b1e816@amd.com>
 <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <517e154d-dbdf-47f9-849f-2ee369dc832e@app.fastmail.com>

On Thu, Sep 24, 2026 at 09:06:00PM +0200, Ard Biesheuvel wrote:
> What I would like to see is an abstraction implemented in OVMF that encapsulates
> the logic that you are adding here. All the EFI stub would have to do is call
> the protocol, nothing more.

Out of pure curiosity, why?

Is the answer something along the lines of, before ExitBootServices(), the
firmware owns the machine, the kernel should not poke at anything but should
call the fw and latter is supposed to do the init and synchronization and
setup of resources, yadda yadda...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
