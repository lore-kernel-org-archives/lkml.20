Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B3444C51F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944725; cv=none; b=hPf9943h7vdj0DrgOb0MB9N4/uErtNVqORFxWq8wytwe/kdBzQD8LbO7+mC3OEc8MRK/LynQnrmYddL+zatRB6UWrcahvTRlnwXVa+fWRdE7yvnYtb1xizsxCrKEl7kIIOh0AVj0w6xLR0RSW+qxan3DJ80i+uemfHzRnxYMuAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944725; c=relaxed/simple;
	bh=q/sP3AsNoR3RmKdfGQqgTWtlCydIYBxW5nIeJqo9DaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAqAZMudNx7GlqIrw407Zrg1/Dof6mXx8iXjkie/kY4shyNYD+KBt+zGJ/T/EXwBP61NOaQHkQs5hW60epCMtNTanZqUmohMJPO8ZaVZPRzlbYkjwbzLgKduLvJ1cF5iuKPxS06KnmV3ljU/9EgSrMFzFN41IzGQNDcisNrBH/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VJMzp4kD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VJMzp4kD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4A01576;
	Wed,  9 Sep 2026 02:05:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90CD3F528;
	Wed,  9 Sep 2026 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788944723; bh=q/sP3AsNoR3RmKdfGQqgTWtlCydIYBxW5nIeJqo9DaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJMzp4kDduuRf2C4T2Advm8bOQaVcMgWtSvIOXm5Qx7LUZwR1aZjLCwml5W6iorfS
	 dxr342WEm/vkSDiyGPLiLsBtvdA7xfxvq0bQJ+z3HPA5ime/m3w/JEg+Ga5KlAy9SM
	 i45FQ7qGO8Gu0jWELoYvPnikdBpTCs7pYHbfgjSs=
Date: Wed, 9 Sep 2026 10:05:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <aqEhTIPqoKj98TRS@J2N7QTR9R3>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
 <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
 <aplRx8f5NprO9dSU@willie-the-truck_quarantine>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aplRx8f5NprO9dSU@willie-the-truck_quarantine>

Hi Will,

On Thu, Sep 03, 2026 at 11:53:59AM +0100, Will Deacon wrote:
> it's worth noting that Bradley's patch _does_ fix one of the
> hibernation problems and has been tested by Vladimir:
> 
> https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
> 
> I would prefer to take your complete set of patches, but if you don't
> want that then should I just take the above for now? Prior to this
> series, there has been no activity for nearly two years on your branch,
> so I'd prefer to get _something_ in, even if it only fixes some of the
> problems.

Sorry for the delay.

I'd prefer if you picked up Bradley's single patch for now. I'll follow
up with a respin of the rest of the cleanup and fixes shortly.

Could you add a note to the commit message as to how Vladimir was able
to trigger a hang with CONFIG_PAGE_POISONING=y and page_poison=on? It's
helpful for anyone testing a backport, etc.

With that:

Acked-by: Mark Rutland <mark.rutland@arm.com>

For context, when I originally wrote my patches, I hadn't managed to
trigger failures at top level without additional hacks, and so this
hadn't been a high priority. Given that Vladimir can trigger this
specific issue with existing options, it makes sense to pick that up.

I had a vague recollection that this specific fix lead to a secondary
issue, but digging through my notes I can't see what that would have
been, and I suspect I had just gotten confused w.r.t. what KVM was
doing. If I find there was a real secondary issue I'll follow up with a
fix .

Thanks,
Mark.
