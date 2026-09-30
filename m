Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD04DEC09;
	Wed, 30 Sep 2026 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775591; cv=none; b=FIK61Uwbk/4f8S9FS/PCC5Zj7oqZBYa/mHk3NCTHjGVlQIaEB470hQ23Pk7qzhUu9EjKKLxpLG8lyO5Q26KRaAWShel0zd0PhUakdquX3qXSu9MPz47IFw5aLf2uGS20U01WIwUHsodMyxzNW3sh1FNmPad7puxWcRR1E3xNDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775591; c=relaxed/simple;
	bh=Vm4jS6jq2vj2KHH3vETEQm+Bg9TaclDm4aw8qivixLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEC8uTC/OVkltBSz3h2zOSIkrmESE3uasyhBxfuc9xAfPcx1726NWndfB9m04SQgnSGF54p31RvqwJzEC5EmBJP4BHFkfC55dfAVgyCSge20d1BsUIr2PLRO0f3ynBVWaDF22YIsjOfduzdPDLLsv444Dy2/ZbdCZgb5mavSHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tlyN7BlL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k3CCmG5t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tlyN7BlL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k3CCmG5t"
Date: Wed, 30 Sep 2026 15:39:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790775580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zn4VjKK02Il1ozefnBi/Fvnvz8XZiZNWHZGxcZRwyJU=;
	b=tlyN7BlLpRY/wZQHKMOCT2EQz++YtaCmZZok+iQTAmPuJsWcyQPTq22a2iGGIy8eQtr70Y
	hxRBAki7JZeMUHjCeSh9cbZ844/Z30C3/FdgR198BmnzNQXRNF9nICtrqDvLg5Mq8bek8G
	x+pHjqx0rMz3VzYf9T6lDsedSf48Ynxkz6mV19e22OiDeyJ2n13sgYt/7zMKiThmUs7cJh
	IWeZJiQrZ4yjMy2+1M79W4IB1bf/ehl77pCth2k470P5MLwhg9TUPiTJ+WtOFZ7dfTeYED
	dAcq51FGV0UBGk4UvBvcB0jpCWXNRXodEexnEPHakl0rOseOQJ203H9osAMnhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790775580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zn4VjKK02Il1ozefnBi/Fvnvz8XZiZNWHZGxcZRwyJU=;
	b=k3CCmG5tDH7aDhIdy3cgi9eNpBKRyafciAS8o1o4BIkH1nPjyELp/KwwgaTk2hk1Q8zTKd
	uIZNQK/fTNPjJyAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	Thomas Gleixner <tglx@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <20260930153855-46152e34-6e63-44a9-a2a8-bb659cb8e55c@linutronix.de>
References: <ar0OGZGN0ftc20Zi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0OGZGN0ftc20Zi@sirena.org.uk>

Hi Mark,

On Wed, Sep 30, 2026 at 02:26:49PM +0100, Mark Brown wrote:
> In the final build today's linux-next build (powerpc allnoconfig) failed
> like this:
> 
> /tmp/next/build/lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime_common':
> /tmp/next/build/lib/vdso/gettimeofday.c:288:31: error: implicit declaration of function 'BITS_PER_TYPE'; did you mean 'BITS_PER_LONG'? [-Wimplicit-function-declaration]
>   288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
>       |                               ^~~~~~~~~~~~~
> /tmp/next/build/include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
>   682 |                 if (!(condition))                                       \
>       |                       ^~~~~~~~~
> /tmp/next/build/include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
>   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>    40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>       |         ^~~~~~~~~~~~~~~~
> /tmp/next/build/lib/vdso/gettimeofday.c:288:9: note: in expansion of macro 'BUILD_BUG_ON'
>   288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
>       |         ^~~~~~~~~~~~
> 
> Caused by commit
> 
>    ca46a07c4b682 (vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask)
> 
> I reverted that commit for today.

It got also pulled from the tip tree:
https://lore.kernel.org/lkml/874if6j4if.ffs@fw13/


Thomas
