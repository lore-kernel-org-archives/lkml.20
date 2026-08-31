Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268B3D952E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164561; cv=none; b=HMSfCHpS0qZvOOvYm/8mWehVLfRrYwYOxwv6AXXfK01VxUP6I8Vx0UKWCQNuFxUaID+/1uBg3OhO0KksuqzZxGcxGFnjos8KJFYzkFIMUmhcAcfFOh8wuOkd0vPOWQ2N8uvzIR3b5/IszvHD/zt0Ds+DHH/qiji5TSenjPSggeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164561; c=relaxed/simple;
	bh=OrZlY82iZ6+gAmzSRw53x9LSGq/jZ/3E4NCXIOzb68A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da9xevOiFKpL/1/8SZEx0/BGDEwfi1zG7VzKs/UapXcKLLm91kJ7upsr7XK0TCfEPXUUQL3tVatt5/P+d04P5VK1xF7IchfR56v2z8zV0JIdncP2JtrO6KDISEum643V3Qc4yhXFoINU2NUUzC2jfPLA59McaK6xal4Rf0sF560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wBiL+9GD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9k3eCjw9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wBiL+9GD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9k3eCjw9"
Date: Mon, 31 Aug 2026 10:22:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788164558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVsh1XKit0hPfFojg88xIUivt5OP2nkKSKHsPJp8gkE=;
	b=wBiL+9GDDBXfhONkiBw2u88eK/+vRSSU72RPpNnmAj0U0Ar7+0YE+dVhcALRv43MxuJCRn
	ogh23wmqhxOfli2KtU6Vyu8QACMyPrfUGyd7thjymLeSk2gO8HrE0R9h2k+modN42unbnw
	E29PBAgtrO+VY/ARZ0FO+7no1tZBLfkbYK/7YBEoaMc2jseaLgPKwq0P117mfDMRVuxYYr
	R1WYQpbdhZ7KfJWMdNuyCh70YnK5a72HztD7d26FXzBOL4L+vGPJP28fzkXXo70JqFUgd9
	Tl1czoZ2hMhQUw6/kpY05pgmKkYNtGcHYzdceb5fwSQzGQborx3b1eauLwUoQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788164558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVsh1XKit0hPfFojg88xIUivt5OP2nkKSKHsPJp8gkE=;
	b=9k3eCjw9mewKcMisMGbQOu1rjXuU5uqKsMNUUNM4x5Chuxlabu0OZoDXVdRXrHMVYvgXkv
	BlvTra/3po4zNgAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Bradley Morgan <brads@mainlining.org>
Cc: john.ogness@linutronix.de, gregkh@linuxfoundation.org,
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
	pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org,
	tglx@kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
Message-ID: <20260831082237.lo_33Mqq@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org>
 <20260831063648.7j2bEr1S@linutronix.de>
 <E462DFFC-320A-48AA-90E3-B61B026BBC58@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E462DFFC-320A-48AA-90E3-B61B026BBC58@mainlining.org>

On 2026-08-31 08:31:22 [+0100], Bradley Morgan wrote:
> On 31 August 2026 07:36:48 BST, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >On 2026-08-29 00:39:15 [+0100], Bradley Morgan wrote:
> >> Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on Pixel
> >7 (ARM64)
> >
> >Does this PKVM even use a nbcon and if so which one?
> >
> 
> heh, not PKVM itself, I booted a kernel inside PKVM, which is the
> hypervisor, the kernel has nbcon inside. My T-B is for the kernel 

That tested-by is futile if none of the suggested changes were actually
tested.

Sebastian
