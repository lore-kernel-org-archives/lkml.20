Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A30834041E;
	Sat, 26 Sep 2026 01:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386566; cv=none; b=uztnwIemjwzxF6tYJK4+UFU/m0jGf+eKB7olHbGzNekQBOSc2+mCixfv1bKN5iKKNlZrr3+Di9LxB6IHP7ZlFG0KjC5D9MqyRR3j0xIA2qSH8NuNjeEI/r/x7/0m/bNZAp049/XdASMaKR0E7h/udr9rD+YhM0JNDQX7KKy8cEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386566; c=relaxed/simple;
	bh=bLpuX8+fDH6EHUNb6dVWA4b4Zh592cInja9uwieaL0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlv/V6VYRvtbMj2Akv+WKEoT64W92SvHJFdcMiPglDqOrsE3lXW1X2QZb8JkN6adVxTAyPkG3uQMYKiUbmTJ0B6jfXmExGYrwcPUPgtccgTKWC9EGsBmjs9bP6QH87V1Ettsy7C8PZ1H+5KnFW7hUZlssPkbVWmk8mcPVVEi3+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PkirdCxr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PkirdCxr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 57F3640E00E5;
	Sat, 26 Sep 2026 01:35:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bWOq_xQsUVsD; Sat, 26 Sep 2026 01:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790386540; bh=Jusva0SS4AdP1hg8p8rbJkUfy+5lQ7/ImX4PS99MfTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkirdCxrbS0C2VvK1IOynDIeMKdXokhc7ZU1G7IGuFm85HhDU7smc3vvKNMt6/JLC
	 ei11eZd5hc/+dedtmQACQX0fy5aGykj8tY+7Hui0oIr9TUuHmLgSHKiKgwLI8q3pa+
	 qEffhrLTMKwGB2rjE7VLZICkrtCoyxhSzVu2TCnqHVCn6ojZLNo9JfaZdO44qFyakV
	 OJ/4Qwvjo5tI4XZd6xYXQSbZ+8/gI4PAL94KWyjz8vNrHNCF2IPGXn36wgsUQw8yhh
	 SXaVVcw1D8m59f2P2IHUZX7CtPTJtATy5C4XG3/GuiBF3HZC+g5fe2skGWbK1669X2
	 UgAJSg1wJGWOUS0hUzLq2UYi1P9HJq6vyKK1A+BPg2IWnM2D/w/fBKdv9yeGsLxH+K
	 XaWbGUHlbQ2gfGPf176nueIZdo+EjIlfuZ3zwnWt4kTYiMk+YmlhDQJxAsgAJAXB9z
	 MS/HCnf6b8wz6vNBIdF6FpfpwBi8qM2lWfkF30beGkuBV3vKOOQBUu+ZeDbZ2K8MyJ
	 ATR4TEqM/fg0ch/nHI1/ARtvYplf4uTHgGYSiRH1Bcxgl8UeXEZGhQCx9JbzFGrsbf
	 l1NfXM8p6Ud5XOJ5AMCvuuWvzrXFMXkPPxZnTv09qV12TNPueeqoOx5OaPtIBkVdvd
	 f1bbocxU2pWVPWzOuPoeWLgI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D641D40E021A;
	Sat, 26 Sep 2026 01:35:34 +0000 (UTC)
Date: Fri, 25 Sep 2026 18:35:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	rounakdas2025@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Message-ID: <20260926013531.GAarchYw8ed2_Fs99x@fat_crate.local>
References: <20260911120627.2634225-1-dinguyen@kernel.org>
 <20260925043821.GBarX6vdJ1WucqPuvN@fat_crate.local>
 <48621819-9a03-4577-ac73-5cb186f8a9a7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48621819-9a03-4577-ac73-5cb186f8a9a7@kernel.org>

On Fri, Sep 25, 2026 at 10:00:33AM -0500, Dinh Nguyen wrote:
> All patches should be applied to v6.18+. Would you like me to follow up with
> a v6 that has the proper tag for v6.18+?

Nope, all fixed and pushed out. It'll go to Linus in a week or so.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
