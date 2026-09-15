Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118203CB568;
	Tue, 15 Sep 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438025; cv=none; b=C5591EopYBwZZrAcS2jU6IbKGmzMKR3I+s0hqFRjKM44DTW4fBAC8EL+oMmG5n16fCMPqF//yfdjuX8eESFz4RtMES97vY+8KccMmv9f0nQJI18GfLhXsB1cnnkhY3AKTLi8J8Ht7iTKM5dLsAkqlb+b7MPzAn/Oj423DIk8dWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438025; c=relaxed/simple;
	bh=jeSHQ1FM+UBJrqlC5ywAuje++oe3B89qkOy63w8XVXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dcg31OXudFrDSCVIjoAmjhoFApvxCSplrcszN6C9TCFYMBmrjnPKgZIa0zCD0W4izVA1ctyTGtp0mme03C4t4uVsx5Li8mlLXTEmV12PLpIdCKh82mXxElr1GJdrowj6VIboHJJIuj0XBBtx7q0MzfHdVbg6EkJ5MhhnyCABqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fV1oX0W7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fV1oX0W7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A268340E022C;
	Tue, 15 Sep 2026 02:07:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h8yDa5sZE2n1; Tue, 15 Sep 2026 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789438008; bh=WYfdIITg1wVViWyyuBHmOXW0fDNmg9zKn2kdsMaVW8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fV1oX0W7Ju7E+WhF9N2uQYuXt4s9CaJxqGIE2xH3jw4NoHATpZ7M/XzcL/g/DbrWv
	 DgVMWVsVO2Xqx9wiJLT9b77/Oq3K4Dn3zcboxNZtlU2FrZS9KVVaSKoOff/Xj+VHc0
	 txG3s5XLJ7ZF5hIQVZHf4socASwYliW+4k9QJNU7W5JjZHYj16u7oQ6Dc5O4euLmuz
	 DYL0eGkv98b+EknA1EBKhzRfs7TU1gnKksTnDyoZM3nVKiIK5++P4DFdY8AcIAR6Au
	 lVLbzVZjoBA3nEV/jK01WprZ59mw74Mks2XTpVphD4qZUtaUI78O8EZwXRU+CgIWeY
	 fdSTB0eiYfQtErMo/pZRp9OWWacHWcU0To4uiyVkKixiR6j2G4nppQwZSVFp2Qfbj0
	 //aoYc9/nmlx4FfdvoOpFx8BoH9DFCmUUJ0yozOhY9EcydtsWGdWrhEqPb5cktHw7q
	 F7QMznZbJorqsZRorXis1dfBQMUAQHcg95c9xXh/XYMyR1v4D0qiMdvngIKlIq/WId
	 QXkN+M+CX0UFFl72Qwgzf8SWjQALReJ/DR1xlhS0Muso9+aPT4lPF6j6F6Q9u0NU4W
	 90Tj0twT/0lYx5fqRQjdh4DhqkOsTvkOZ5ym8i/tNBI4WOK2kOyEmIEgDT7SX+xovW
	 eRby/oY82qrLNYRvGAifTvXI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5D61240E0173;
	Tue, 15 Sep 2026 02:06:42 +0000 (UTC)
Date: Mon, 14 Sep 2026 19:06:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: linux-kernel@vger.kernel.org
Cc: linux-tip-commits@vger.kernel.org, Bill Roberts <bill.roberts@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org
Subject: Re: [tip: x86/cpu] x86/shstk: Shadow stack enabling write return
 code change
Message-ID: <20260915020638.GDaqioLswnZQpl7zUd@fat_crate.local>
References: <20260707184542.1721085-1-bill.roberts@arm.com>
 <178838346311.3717435.13754734302325111782.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178838346311.3717435.13754734302325111782.tip-bot2@tip-bot2>

On Wed, Sep 02, 2026 at 09:11:03PM -0000, tip-bot2 for Bill Roberts wrote:
> The following commit has been merged into the x86/cpu branch of tip:
> 
> Commit-ID:     f4cadf2d1ee3a24f259495309b76f98af467004b
> Gitweb:        https://git.kernel.org/tip/f4cadf2d1ee3a24f259495309b76f98af467004b
> Author:        Bill Roberts <bill.roberts@arm.com>
> AuthorDate:    Tue, 07 Jul 2026 13:45:42 -05:00
> Committer:     Dave Hansen <dave.hansen@linux.intel.com>
> CommitterDate: Wed, 02 Sep 2026 14:06:27 -07:00
> 
> x86/shstk: Shadow stack enabling write return code change

https://docs.kernel.org/process/maintainer-tip.html#patch-subject

"The condensed patch description in the subject line ... should be written in
imperative tone."

And that title doesn't really say what this fixes.

Lemme fix it up.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
