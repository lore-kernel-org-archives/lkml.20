Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13C7364929;
	Sun,  4 Oct 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129874; cv=none; b=tyFMNSWdUgzMv5MFdwAaO5ztg/bXT5FJt/O8KX/Qpu5gYOGwy5sEPMASGKxE4CaW/Rz+0l5IbYpTp08JfUKiGGVfePCjzQBMFshls1MS6gbg3/pnkevk2nC5ho5aZ4mtr1krmakCn5o2P2iwCHUZoRFsDgjGDcxCAI7owYrHIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129874; c=relaxed/simple;
	bh=BOzsiabtprSB95KcdClnhVz25l5BpuIgdCl+LU7H6mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvUcI7zu0wGLkv59dkBAfNRVWAG0+9a/CfZXEmO7LIj1dFIsbg90ExBfl3ZLUhHAsP50feoTQmCFhOf+Xo0hZFDh2n6TI5L4bScgMKRkkWeW6ZHD8XW6FaNAmRCUuz+cFq5m5Nt/PCGUZ/Y18tXOsgAuz4lt9yuIfJNp9Im0pBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Ok6qyJ4g; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ok6qyJ4g"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DE7E840E021A;
	Sun,  4 Oct 2026 16:04:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TYxxSk3Cu54O; Sun,  4 Oct 2026 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791129861; bh=WQJxnep8DiX51Cmu31jgW3/QT7e+n1ZKtZaYaMU4UdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ok6qyJ4gJpDYbspBwgkqBlDEQ7RogUntuoHbiwv0OB7JxR5LY0PBMtYbHNsmANypT
	 8lN6nlmBuCNUQap8blxMBEIPIGGd3ptZUU05OYPhp9wcQtoQgDhlHSKZfdP+xITlfn
	 3f8z8H4F4sQ8WHst+aKo9DlkDpfnc7yDVAyElH/A52L1sLqScUDtUc9CSu/Wuuj/Og
	 15fzG2GSDWVTbe0VTJWpisVL+uP9BQAHUmcABNxNLdXLt1G9b5SaaBhC6ZACiws/Bn
	 mbqSTnTijBCB6Ibk1Gf5eVk6XdnJ3l6a2gFs09TYJ379MhCbZMgsxD2ul73NXOh0wV
	 Rhnw+CPkZ4Zuc8iTXCskwwhzaAGJZwvUNR3+MJLObvN90VP7J1cz/HtW46CQmuUmZ9
	 N3pjSfDD2Bqq9NuY1bwq4GPrpbeADnAyKr+MgHY9oQgXExd9wgKCylMqS96WPjYk5O
	 zP8tqzs3nmdkympZ9tN7yFSlJp9IjESpKWn26LervWtAUef2RCuuwN1+2lYZOl6IME
	 cXHk3JXdTwmrSdjZnHZc0wlJ3a8sRpeE+Y5tgYh8qSSAVlABdxQVx+CifiYPE3Iybi
	 MdxJeFMeFKhAtxQpSNJekke86MOC31k9s5spjN4O9gGDmLCZR0DvSrcwh6G61Wr0sP
	 /Ikey2e52gw3qUyJVOyK1DBk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7185640E01B4;
	Sun,  4 Oct 2026 16:04:15 +0000 (UTC)
Date: Sun, 4 Oct 2026 09:04:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Vishal Badole <Vishal.Badole@amd.com>, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah
 models
Message-ID: <20261004160412.GAasJ4_AhYcuacY6ZM@fat_crate.local>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
 <20261002113204.3358815-3-Vishal.Badole@amd.com>
 <20261003012238.GCasBY3rN9K8ps1dDR@fat_crate.local>
 <20261004151447.GA2673@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004151447.GA2673@yaz-khff2.amd.com>

On Sun, Oct 04, 2026 at 11:14:47AM -0400, Yazen Ghannam wrote:
> Because it becomes an empty case once this flag set is moved up.

No, models 0x40... are supported. The others which are not explicitly listed
there are not.

And no, the code doesn't enforce it yet but probably it should. And there
should be a default: label for the models too which returns -ENODEV, like it
does for the unknown families.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
