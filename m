Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C84D3BC6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421194; cv=none; b=AYWRDkDxVEffPz9F+7E4PKIuRvqZ1Utx9c6xI9z7XYIDdvDiMiTNwwoh4cminpnh0x5BYOsJoiZ3LwcwRlaaVW3CgxMR+hRHm11ab+81v38MfHSBpz6FX3yhrUDBL8kwWChuTzcVSHt+pjzaE2HgvrggxHdyo4ww7hpaMmbr3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421194; c=relaxed/simple;
	bh=smp4HpGoH1c5JQuzQw57o+RIgjW6/I+3WDyGPAVK0sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RghbmLtFF8vXyAh3+4Ccp/dtIzxImuKhGoR6P9nDgSAfYOdAGp1Fa0SeB0ay7Am1MSFL9zTsl48KJxbZRhNipTFPgsCkjm/6oRg1m4OgRPf98YRBiBeY4+s+zFeon7DOit6Q7w2bIn3dOWltaCZWrUmhRGjorGACQdMFdzA8hSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fDfuGRln; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fgfd31+d; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fDfuGRln";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fgfd31+d"
Date: Mon, 19 Oct 2026 16:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792421190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HF3tNAMnu/RlsFMLL+unS4mFijEG/tqVpSzfdT7ocaY=;
	b=fDfuGRlnlaRdzNjatS6aBhOihsCQImuPFG+cof2XHa9IbEGWSAmS5ia+sn7yp4Kd47TE1T
	yl8hd4cCBbwLrZCqIfX9m34XzeyZTl/O6GIr6cw0E85EPhfo/ZK1ZzQdvJzGqWAMCobyd9
	n90gga5IbDj2gSk15VKX8ueReI2oJNsncEnXwh2w5JHePcNKwpQHbQXKwiV5bFUwUwGb2l
	W13Bn+2Qvnk0Y0pUw+NeCQRJqC8y40a57WTMZtI3VG/BPxQkeeqhYxnTj2zvt1jpXVsoxC
	dDmZa6/bhPxJMqyXqpg3bLSW9CR1nZNsn2rJ2K2WLSy67tPLZWxVXBYU1vwLUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792421190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HF3tNAMnu/RlsFMLL+unS4mFijEG/tqVpSzfdT7ocaY=;
	b=fgfd31+dOEaTaaAFUaUdWLP80xhuN7ue1utuJF6aJDl0DOzcgkklXZTpgzB+DCRhfut5R8
	oWjpFBupZlBQXbBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Bradley Morgan <brads@mainlining.org>
Cc: pmladek@suse.com, akpm@linux-foundation.org, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] panic: drop the fake trace id from the oops end marker
Message-ID: <20261019144628.r8Q0S1M-@linutronix.de>
References: <20261004175419.269865-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004175419.269865-1-brads@mainlining.org>

On 2026-10-04 17:54:19 [+0000], Bradley Morgan wrote:
> print_oops_end_marker() prints "---[ end trace 0000000000000000
> ]---". The format pretends each oops has a trace id, but the value
> has been a hardcoded 0 since the oops id machinery was removed, and
> nothing prints an opening marker anymore. Nothing in tree parses the
> id either, the pstore selftest greps for "---[ end trace" without it.
> Kill the fake id, the format specifier and the 0ULL argument go with
> it.

Could you please figure out _why_ it is hardcoded to 0? Someone
requested this with a reason. If you want to remove it, you need to
ensure that reason is no longer valid.

> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/panic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 213725b612aa..0436a92318ed 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -1051,7 +1051,7 @@ void oops_enter(void)
>  
>  static void print_oops_end_marker(void)
>  {
> -	pr_warn("---[ end trace %016llx ]---\n", 0ULL);
> +	pr_warn("---[ end trace ]---\n");
>  }
>  
>  /*

Sebastian
