Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4B2D8DC4;
	Wed, 23 Sep 2026 00:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123159; cv=none; b=dPxIHpIxo4myFhsveZcUzs2YR4BJQ2ptynMbeMPQBDJ6pTDuUf4C4pXyAclik4a/ga4sl5dCCArmhCCDCjCBMuHKdeeKDj7S9OTC6lNXULT2hdoVt+smtkVz78Oybk35lv243JDLoMGg5/ExTw1MH7jiTdWsu9/BgDuHtR6vCWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123159; c=relaxed/simple;
	bh=vd3fLlH12aAh3yJhOy1LbHpA/jRwLzSXn71pqAdHvNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lyo64fvXDHrSzEYSDvRyZAJtth5wOVQTzGoxASnOkIMPiVnFgs0fWtKzaoDs9c4gV9ucxXxvCH6H/84zwLiRLSPdY8WQ5n/j1RFasyQxfaGP7FYULiRWKXfzAeCK9aWzL+vCrvPJaZ7QoPas3bwoS13Y6ktPmi+DgjVJsI0WUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ae89WTwL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ae89WTwL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7F2C140E00E8;
	Wed, 23 Sep 2026 00:20:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ogbgF5UMlqeQ; Wed, 23 Sep 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790122819; bh=dSqVsuG/tQAXVs9qp7sThFp6POmhYNqwAVnmBNtHng8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae89WTwLJirBlYXPlykeTwmRdpcg2zIuRxK1DjULrtbg8/O+9oiQPSk0CEoXNHG6v
	 IXhYHoqqEvMTRugC/KeXjNn4YgZiGMjBGM657Mnx2q4YCbVylSzwZNEwXg2VHGcjBw
	 3LknmYAh24VGu/RuRexYt49T3Ms6AIlk/T1XYylfsYU0VApiM9Kuj6h44BCOaP9+oQ
	 u3mG/M1fU3BQHs2sLpLpK4XjVwSbIO6rqIcEjVykAbpb+qaAIDyN/QdvX8v56Cvaed
	 T69spIVwosQLYheM0dsHZyTU4H/Ppa+rRcD2XpgHZMx+c36bxP8DYTTi+dI/imF/hP
	 NP6XEhOLhz+107u6IjmdyuCwQ7iBJHCZ8DDSpKjGzf5eXM0Zn41qzrOb8omF46imY+
	 6lAJTYu89VH9lugWi0z3GbC4N+IQgl9cta7LBg9lMqSmk4UwfpfyaaMbBpw6t5pZBK
	 xReeavO55XRv622WD1np+w385i8tir8BcZgzK3yT4ta6gbVq3LAYVfcBkhpRs+lM4x
	 u1gHDSeeuxJUtarDQY31mpZ0mHdxGzvy7sFGN9vuh+WEXuoutZZSX/tfoQJXRht+bX
	 LXz0tyaNF/6V+2KW+TTqprGvOLPqLMWZYjGvyGmlngbAVig8uaAF7DfyTXTHt6I+vj
	 dbvnWcTQHrJLCiNhN3nSz860=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 184B940E015D;
	Wed, 23 Sep 2026 00:20:13 +0000 (UTC)
Date: Tue, 22 Sep 2026 17:20:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, qiuxu.zhuo@intel.com
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <20260923002009.GCarMbOYCb4onwhwRf@fat_crate.local>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
 <arKX7O905e7yv3Ra@agluck-desk3>
 <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
 <arLWNgnyo08aFM-R@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arLWNgnyo08aFM-R@agluck-desk3>

On Tue, Sep 22, 2026 at 12:25:42PM -0700, Luck, Tony wrote:
> The above is a clear example that should not be tagged for stable. I'm
> suggesting that this EDAC bug doesn't meet the stable criteria.

Aaaha, I see it now. You basically want to point out that this patch
shouldnt've been tagged for stable in the first place.

And I agree - old, error handling path, patch is probably AI-caused, and
nothing really someone hits.

> I ought to have quizzed the submitter on why they thought it needed the
> tag.

Actually, that is your job. And you should remove it if you don't think the
patch is stable material. Because the stable tag causes a *lot* of work
downstream in distros and stable kernels picking up this patch and trying to
figure out why is it even stable material, what it is fixing, should their
customers upgrade, yadda yadda.

So, what I would do is, rebase the branch and zap the stable tag. The stable
tag is not something we should use willy-nilly but think twice whether we
really want to pile more work for distros and stable folks.

And if submitters cannot give a good reason why stable, then off it goes.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
