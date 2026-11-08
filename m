Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129917;
	b=wyJYG64A6Q4HJhaFgOu+kPx41M1qE2fnD2D6JNps78slfScbnKWJUTT8eXrhjXvS7MjE
	 3PzD0sVo0pUufFpelDQKTKrBVLA6x8EIJcxRjBJ5V8ZUYJvBSkFXUpJXYM8AxdlpoINKL
	 EKMQDEs7BAB3xsnlkfdQZXMdgjvnLTLcdxnV1i+kIVU+Fw5I+nu5J/3n0l5SXSgt+XAGL
	 y4/mey0mO7t897b7KbPshGWbigxBrynysCd72JgwsbjEv9UxvqvMI5SuGWXyeRYOlws8R
	 /Yq2l+V9L5eA/COv9mYg+xsEVWZvGxpT9+Eos91DyqOuswWOFwM3/Z1rstzxtibkOAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u5YlrDxz3fhgoLFhtNbY64UsUoj272lyDf/p6ZFjQg8=;
	b=NdDufC3L43h+nBXIMj4olymBYu2hSVcjYxSGpgWLeQ4K5kd628u6QLu2a1d4OTgKQeBk
	 bytGI/3QYF+kKWxasuKyIW/Nd6qC7K6FNIdWSsRSFmgmD+WnPg6Iv2DfoszWE9/pZctCn
	 TeJg0eBYqwo5/6ySIVRgjyn13FnMZOQIpSZJvEmw311KVwC7go/m0HzTZM3qPfG/2e2/D
	 T1iJ3m/ubq5idXo0iU39sbVjiUlI2uukFYT8BHy5c0F8gshsVZmHmwj4LrjA+/m8FgzPL
	 zAkFwwo/7i5QPA7SqFE/kpAO2ySD+SQZzBR/pxiKxN0PM7IjSRItZNLKhfdzvS8IHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJIgxY18;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1B606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJIgxY18
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso654665e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794129916; x=1794734716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5YlrDxz3fhgoLFhtNbY64UsUoj272lyDf/p6ZFjQg8=;
        b=QJIgxY18WSwnNUneA2ZLjD9PT/hXl0JGW4CB/urRU2xZdVYnabdiGjCygZGi8Kv82w
         YmdJcV3HCr2gHBaVFLfCjL5P9e3l9WL5W0WZHfYqpQwES9Cu0Sb+QCDjNJGCwaKqBJzH
         OVQtdIsSBzBdaKMCcyljv6fSBODPo7uKhVtazyEC8K3GVkYGqo5RWQUBbJzi6gPUXj1w
         oSyABB/VblU9KYptkCASdwTJOGtM+8VO1exF9yRHMMq28/tGFdhCyKxEB/RKxxyHhn35
         wovAJPC6oRg11d9XF8++g4yOcu6v6OAmcyuHDecFCZDB8e61LFTCrMsoA0gVAHtjQ3fI
         aCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794129916; x=1794734716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5YlrDxz3fhgoLFhtNbY64UsUoj272lyDf/p6ZFjQg8=;
        b=lzATDBymUEYbxcG3TOr/8fUI4w/iIazVQlxHNEPkLcdK5CS5xtnAdcu55RvbzAvXFc
         CuyxrNw/YY3Q6psfWUQS6DwSAJCVYxb+A46+VdWhsTFWZw4cLKQGkvbhMpSxyi6z7meW
         Lby14B8BnzwkjnzLNKL4NhhgpJJge+gwETHCLkzTsfmC7HnPa0FKHuv6Kk8Q2dRDNKkP
         NaWsn8hMGp7ZCQlXKUDjFtJSzI2YkIespe7zHtAu4lEsSZ/vkg8gIyC9Y1wrssCkW9yM
         x4WYiV4IUh+9YAuY6MC7L1kc2XSI+gPHGz05YQtNegwEMv2iEWqgEcCpHVYRxGLri3ac
         nQYg==
X-Forwarded-Encrypted: i=1; AL+hErHgZy29j0OlcSi9nsAkA7iua4+lvDa+qR2Hay94Kecqre88BTU/8aFyiGzbCAEVrRA0PWHxHDFfj2dyoPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z85LB+6i9IgKNv7zOTSCI0QnxRWycMaQHO2yLr+S2iWQmmjxBo6
	h8rS9oCvmffGpIGDhm3hnSd0+OfQT/J9bQsmI24fEHKbe2RO1uOTUdeK
X-Gm-Gg: AYBFou2QorEjGPdKuANuNE9DIQksrt0MtorPR2C8hqtdK1l09a1VS4V5sWpfJzpq8+I
	fQhaLkvu9h6Tgtduw8A0VCCR6SzAqK4wWI1bSJ5W/VSPz61EI3nQPEBhNQQ19oyLpERI2MPCh3Y
	cq8RS4lY1MdVwuZe7xgQ/R7san/Tqo0SDhOjC+qWL/JD0thhEAb6fBAtQVbyYAE4fZ39Fvmm4DI
	IdRh4RGuL6NS+IoxPU0N1z5QZQ3+pSDwkjsNZb0+yaJStNvvr/K8gvFoGtpgJ/1+2Ho7KA2JImw
	vHRb9dHsKfzAh1gVcTcYwX4/E3wBQwUib5hpaPy/HzlNs5yndsK75SnKxGf6OTkG97RyL7BEaR9
	WoR17+6RC/t60f9v2OjrGUyYO8WR+dyLdLdK+73DOsRtp7ybY0cYKo8cKSsCmANTUq6eAvBIfXe
	L9Afs4Hn1NXmo38TdYWyPuASApfOpJfMf2jJXdmZW2BXmlKsa3/9RLdaHPoXZcAWCkbQurSVPHr
	/be9VQwUAIBGGzFh9cmkR/U3sYYeGAK16nVeU9XFn0XAqiMljAy5ytiIh9X4cJ9Z3SD9TfasrgF
	E8pO/kpgeqGIPfxbw68a8ia8klhBEbLnZN9SBl+Hn87qv5rbra6tPiw=
X-Received: by 2002:a05:6000:4a12:b0:48e:6651:d82b with SMTP id ffacd0b85a97d-49580c083admr2176808f8f.2.1794129915708;
        Sun, 08 Nov 2026 01:25:15 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm3083064f8f.30.2026.11.08.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:25:14 -0800 (PST)
Date: Sun, 8 Nov 2026 12:25:10 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 02/12] sched/core: Introduce rq_drop_lock()
Message-ID: <avA36psY6pULqy8X@scheduler.schedules>
References: <20261107115913.261163891@infradead.org>
 <20261107120206.858693648@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107120206.858693648@infradead.org>

Hi Peter,

On Sat, Nov 07, 2026 at 12:59:15PM +0100, Peter Zijlstra wrote:
> Currently rq_unpin_lock() serves a dual purpose, it pairs with both
> rq_pin_lock() and rq_repin_lock(). That is:
> 
> 	rq_pin_lock()
> 	  rq_unpin_lock()
>           rq_repin_lock()
> 	rq_unpin_lock()
> 
> In prepration of making the temporary drop and the final drop

nit. 'prepration' should be 'preparation' :-).

> distinct, this needs another function. Introduce and use
> rq_drop_lock() for the temporary drop, like:
> 
> 	rq_pin_lock()
> 	  rq_drop_lock()
>           rq_repin_lock()
> 	rq_unpin_lock()
> 

Yeah well sadly I couldn't find anything aside from a nit :-(.

I couldn't even find 1 missed place that we didn't transfered to
rq_drop_lock().

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Cheers.. Woo..

Kayra
