Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58344446F7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828821; cv=none; b=rmrYpTklYVeZ7xGkFZpx+J3PN+2sRLn3FafOUeI2jRsCBaQ7TRmPqfoIqCawjyiKWzzggBwKc2lKRDE+5Cn9KN9P/a6yjtQ2XALRGeh04lVIVsNr/Z1EU9rBjayc2loD80lVHrcHEuqdBLfsjojisWq4RiRbA7TiEOznVZhN2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828821; c=relaxed/simple;
	bh=2C1uWDJSm7NYS6Ru5K6nLL3jKwfCsJ0F+F1PThT1F/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxjrZG93ji1Al8kmIUC8JIUJHeCIrSgPtGyu/I5/3iz9Rhl98KvhLa5PfCpnCYU2uLDL9wyaeDv9Iffn232E/jQYh+83CK/1gcyc2qwxomuezpBlShC7dy0rszDb0WZfGPc0a1Cw/2WkWMSA0QVOavf7QXHU2lyHR2nebJ5HGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ONhpioEi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZtCVO/A/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ONhpioEi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZtCVO/A/"
Date: Thu, 27 Aug 2026 13:06:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787828813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHQbBs4DA4y08B/5/1T5xiTCpiS262Nzuzf3tI1lZZQ=;
	b=ONhpioEihl9L//svaFWhGkkaSty9/TUQva6BEWzSGTxMuFDvPgbK60wFZqqZUxhSqOZksD
	GQog2ofDnkqhzEqeDFIHpRfmIljP9EoaiIMOez5G0fit7edwQg3cOMpe2sjzq/O/iZj18B
	rQ9NPc/qrsr++yf6ZzPiUMQGCHu3kTGktx5xqz6aNfOXqwshnEXSEmCz+TaEG1+xa1L6Iz
	UEjt4cx2R2qRKHW1OhHemLpg/8/htaPBPotDX/kuU8o+XwPWv3MNDjWdPLvwTvwxBfeleh
	geCCk+wKm11mLEWvKG3PmWQua52Vp8PxcDfPElkWFEer3SyJNAZDO8ftEb8j6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787828813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LHQbBs4DA4y08B/5/1T5xiTCpiS262Nzuzf3tI1lZZQ=;
	b=ZtCVO/A/XphIAzVDwlYOXwVsdDyQr7EvhAhtjT6CVFrttNIU1nQXRigjBJ360IfFunNDQV
	bw/HMAXXldZlawAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] locking/local_lock: remove unused
 __spinlock_nested_bh_init()
Message-ID: <20260827110652.esUM7hmc@linutronix.de>
References: <20260817130354.4024582-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817130354.4024582-1-zhanxusheng@xiaomi.com>

On 2026-08-17 21:03:54 [+0800], Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng1024@gmail.com>
> 
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> Added by commit c5bcab755822 ("locking/local_lock: Add local nested BH
> locking infrastructure.") and unused since: there is no public wrapper for
> it in local_lock.h and no caller, and 'spinlock_nested_bh' appears nowhere
> else in the tree.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -94,17 +94,6 @@ do {								\
>  	__local_lock_init((local_lock_t *)lock);		\
>  } while (0)
>  
> -#define __spinlock_nested_bh_init(lock)				\
> -do {								\
> -	static struct lock_class_key __key;			\
> -								\
> -	debug_check_no_locks_freed((void *)lock, sizeof(*lock));\
> -	lockdep_init_map_type(&(lock)->dep_map, #lock, &__key,  \
> -			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
> -			      LD_LOCK_NORMAL);			\
> -	local_lock_debug_init(lock);				\
> -} while (0)
> -

This must have been something in-between because it uses LD_LOCK_NORMAL
and it should have been LD_LOCK_PERCPU if intended for this.

>  #define __local_lock_acquire(lock)					\
>  	do {								\
>  		local_trylock_t *__tl;					\

Sebastian
