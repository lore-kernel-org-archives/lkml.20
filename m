Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685AA48595A;
	Mon, 21 Sep 2026 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990411; cv=none; b=Sn7YH69pTqmhypdMcQ6tU5S5MzLfjHmg+f7fSFggqbrfetzzFxW8ugutbT/hOY0PDbFosUXoEVNc8Rm72tknt3EgJVsYO1mvwOnYtfIE45mG3VvGC0a4cygN/VMKEZHbQin1t2XYeFMOt3sE3R0sSRHbSlTTq/kZ+jnmmwhNaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990411; c=relaxed/simple;
	bh=PTv6yjJz/RBdtUjegKYV4mz2D35sdvnVKeYdXjsOobo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddnhOf9H9w1ffIj0FkA20CPHCvlKMt4JodP6w8qcxr5HH8OUnBOlsJ4xbhuil+9dBrpAwFb3yxuiRUPym7kjmDd2zEDc3LlxRBRWTO4SZ7q93m8HlyZ3t+nCv7Wv95cQMpDPtsxW/RgtM+of+yGu0UQDkCeohy169rnGvMk5svU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pgVfGaPp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kzwv0Fmo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pgVfGaPp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kzwv0Fmo"
Date: Mon, 21 Sep 2026 13:33:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789990407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TScYKL6o5mTsctdhmCMr4Nk4MqaIFlhlNjejMRnwJo=;
	b=pgVfGaPpyfeLl7RwP83UFQL5b55dQc/U/VqfkSPs1guLUcjdk/gR1+ymyyULtIWxcBfwAH
	KIjiUv9qegIr81GmuFZl8GTzqHZ8/fXb0f4Q/WsIMg8IdYzkc+7VOyOB3ed/lTevZzu4bt
	s6S+7WBwGK+0ZnkURo/TpGLlj5tVTFQuEbmm/cmJ1Uo0rTYmidin2EISu+PY2ADBRq8q2C
	1y+SsyqY3lj7Id1bldlCHUq0x4gWxoepWwJde0+fP85YNUPMSqQ8H1/ThfW5enTQkqHFZs
	rbJpgdj0TFkIESQBl2kls9U1uRaZEgcsQqY+XPZKmBc8mFishNev9W8njl0GQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789990407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TScYKL6o5mTsctdhmCMr4Nk4MqaIFlhlNjejMRnwJo=;
	b=Kzwv0FmocymOoDneKc/Nd1G/PtK3h1+Psmif8LiEZyYJsOeniKIgO9yNJiNNBY3Xg84NKV
	/Kg/b9AmsRnPU6DQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: kernel-parameters: fix a truncated sentence
 for preempt=lazy
Message-ID: <20260921113326.MTXJ89aP@linutronix.de>
References: <20260920022003.1202546-1-quchaosheng000406@163.com>
 <20260920022003.1202546-2-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920022003.1202546-2-quchaosheng000406@163.com>

On 2026-09-20 10:20:03 [+0800], Quchaosheng wrote:
> The "lazy" entry ends with:
> 
>   One preemption is when the task returns to user space.
> 
> which is not a sentence.  It is a leftover from shortening "One such
> preemption is when the task returns to user space."  Add the missing
> word back.
> 
> Fixes: f66e4a996582 ("sched/core: Update kernel boot parameters for LAZY preempt.")
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 33cd30996e47..6c1bfba180a2 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5453,8 +5453,8 @@ Kernel parameters
>  			lazy - Scheduler controlled. Similar to full but instead
>  			       of preempting the task immediately, the task gets
>  			       one HZ tick time to yield itself before the
> -			       preemption will be forced. One preemption is when the
> -			       task returns to user space.
> +			       preemption will be forced. One such preemption is
> +			       when the task returns to user space.

I think if you do "preemption point" the sentence becomes English again.

>  
>  	print-fatal-signals=
>  			[KNL] debug: print fatal signals

Sebastian
