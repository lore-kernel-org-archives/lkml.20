Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E6349CE2;
	Mon, 14 Sep 2026 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361608; cv=none; b=n7awrQ+xlj+qocdORmhQaPwNajw04DC58qd9hPVBDfqonHdwsKw+O4oTxviytjZsh7hS9OYEtj3o6pUBFwimO9RuXDYNn8j8sY6WqeQUuXD1dyUax7hrxNXv27Sw/hLdY7UECNb1yULCHYpyvsM1GAjoq/MaG8NEjTSjsC4WORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361608; c=relaxed/simple;
	bh=xYvSUo8AQbE6UwJvLzxM/4vooRtmD+iP1X1UvDUq6w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvHpd/WCmxOzvQhrTjsu2doIXIpK5NsY5LR/xKZ9GTB+NRLq3fikfK8O0mnXFmVFydQLRlyxZcxOdUwHeWkqRQvEn0LyqauSEmD7r1CLo7sRPI6XPJRZrhBjcBcOgG81EzBiI6O85hR389z7hgrjXE0wjSlPuo/QU0A3OYPOco0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CJieynAM; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CJieynAM"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1703F40E01DD;
	Mon, 14 Sep 2026 04:53:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WU-ZetynU7Sa; Mon, 14 Sep 2026 04:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789361594; bh=g0l5quF+CtNkdsOWSveDsrHYwy6jVN/CZnleVwD2z6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJieynAM9jrDxo4LAJUGNK9VkbQ5r6Ge39UKQpfrRttXErk+LyHy3KWnhC9ox0F7A
	 lFc4grpo/cjndn1L4HlVJMbZv4WVfy+hwFj1Zct5O9RvPw+pf50hfCQBavPIJhQ0n4
	 h1nkHdOcVtuM3pbLmgi8gTFJOq+pWM1Vx5Rzm/h9bK4Qx6kUNMtQ/dYvqVOTeUvvbt
	 v99PUg/5bwL11nH8I5Kip/kcM/iuneorUSaCgHflXlJhlJcKRK0PZNpB4/f4HXQ+vi
	 ZcDvaG36/m+uHhDjXKPF10pmA35Y53I9goQu9AcrfSRUYfxtM9CCVs94tQJYM5khjy
	 xvrBTX40pEPNUBP4/8C+z/rZp4BlYIQAKEOicZmDI1TSu1l8xoXVh6vDNv9FkTvSxk
	 wLXVvT7rvaMeL/hslbUgNUhIL/6SF5Ug/q5LYhY+WIYwNyr5zUMvQ+JGKR8cYyq6VK
	 EgZT4uwz79+n13NHrj8Jz5xikZbnZlVb1dZPTCCwtoEW3W1kAFsnq//fSQTpqcC4zg
	 yAF6mIGfqIKXsZ/GPD3yUPPqDd4pHrjvJqb5IxkMqI+QScmgZgil+rcAr2QOTAdJwm
	 yN+nLDAvHf9gKR+KJbTwj4oTIyXwUCROaRBarHVcmidKm9UBhe2PycLEYTy7IMAIyK
	 y2StxZjt29oVy7zl0zSSgi/Y=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 75AC640E0173;
	Mon, 14 Sep 2026 04:52:57 +0000 (UTC)
Date: Sun, 13 Sep 2026 21:52:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Aaron Tomlin <atomlin@atomlin.com>, tony.luck@intel.com
Cc: tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, frederic@kernel.org,
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io,
	chjohnst@gmail.com, mproche@gmail.com, nick.lange@gmail.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] x86/mce: Fix timer and storm tracking races, and
 avoid redundant polling
Message-ID: <20260914045254.GEaqd9pgnKrXYU4thR@fat_crate.local>
References: <20260911201206.532113-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911201206.532113-1-atomlin@atomlin.com>

On Fri, Sep 11, 2026 at 04:12:02PM -0400, Aaron Tomlin wrote:
> This series addresses several distinct issues within the x86 Machine Check

There's also this thing:

https://lore.kernel.org/all/6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com

Since you two are working on this, probably should productize Thomas's patch
too, in the last mail of the thread, while at it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
