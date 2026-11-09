Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232054;
	b=TzE5JKgZPRQ3M9hW1DEBrraDcqd3IPxkBkM97uo99Nm/H7nrjzUlhzOTyopwkB+btx3f
	 +X95uyKFaQHnMkZSTwfkkHHAge89Z08XsvRFfbU1e728xAAB4ctnZ8YJvksDJgyqG/WFf
	 WK7YztCEs8nEMRKivZ5e62vooGOIb9Lyd7VJaeiSsB0ghqnnDGzD7leACx8V3cgEcT/w/
	 hjdW+I4rnh6GQPDTA5tyRRN4JNNS+d6nr5bN/RGpP1erdCwB6v7J9VG/1+HnxWb/jv/Fq
	 1inlb0UHddYZEpXzvAIlP3z0seFeHdGOJEeX8Y2B+HvKqkKlJANtC3W1PTMHs+wafbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C2U0969ScVYYtAYSRmO3+08a5jB4pOxymunLPcJsNN8=;
	b=1zFp7DinR4qMA4jkWe0WlKvvQhB8OqPobr4VhKrHCzcx+w85W07LOZNrGyTYNxGAQL0P
	 o3oY+1s2iTo29qMd+istik1ZI/ZaIIH9wiP3ccS6fpi+s7Y8GodMWDgn8PNc1X+DCxPQ+
	 JsuyJCdnQCOxYrob1gJHtcUPc+o3sGCYlZik3LtqF3f8ot+4M5ci3Yo2xaR2ajHbQ4drW
	 B0gCnWzH+4B3Oypm8iJ5GJ/utxdddOB68X/Tc3L5B1Di3nAxT3ReAj/RbvV/Nmyx/c6WL
	 +R8Yz82ypSJqvObTHHf0bXVfDOM4Hb5MCpbN1lR8hxc20Y1gHB246INioi7Cx1CKC1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wlr6LMsO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0A606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE0A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wlr6LMsO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so6186375e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794232052; x=1794836852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2U0969ScVYYtAYSRmO3+08a5jB4pOxymunLPcJsNN8=;
        b=Wlr6LMsODBqo/wrW/v8ywEqMF87AyeKYptSQJIoQ4TcGi2QEfKeQRi/1qU+4tSUqqm
         M7U1xZdUtuGjN5ywbl6Oe5ajIDSKksvOsDz0B6lOHCk6k5sDBm6D1q3tvWa4V4NOMv33
         lgV9IasN8gA8ZpirGwWUUXW6WWiNVHUrByvX/P+jaoH51QtVuviZK0qPYsFaIrGl5zZt
         nqFVKT3pAxZZt0QExo66Nfp5MEkCnMMPOQbnko1VDcmuBYVFcTKiYmsnh7L5mq94vAfR
         ivI2Qw9etXDzE4CA5KgdDJrnrnxicsGT+yVVtirENaLikgmC+xrRv/INy5+L4gr3rJCl
         0/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232052; x=1794836852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2U0969ScVYYtAYSRmO3+08a5jB4pOxymunLPcJsNN8=;
        b=nxnKKX5S4LqX22i8p7Mncz23Qi323eJXviKVNcILkwXq3dI8iAiT79pq8bVW83+sor
         3rsmPVfb8Vz+K2Ap3oYyY4vvfQpoRq/LmfQnyHWYxgHAu5fqzHaMDJdEfKmc2mGh7EJB
         9+H+rMdmOTJ42QeRsI46NXnD52+cLD3Vp0rzcSZEFjgYPkEfYdzKQce96zq1bmCRW/BG
         Y81ZkiISS7s0aiUmen7GwwHxBrtVwlo6HDZ0EcZAR6PP8VA5lGihxRi9TXmZluU8NxFR
         KFd7GBi/vNIm0D2TZWI9PSI4sO/I+RIA8UEWwcski8ke43zcnqzIrj1HphJVanJHkbSB
         YYxw==
X-Forwarded-Encrypted: i=1; AL+hErEg2PaasMVjaJ55Grf6Btnz2hSVyoFZ6f7mmEcJjvQTwTHMYI+g2NvgkREW0r1JUwN2ZyI9EzgEw8OiXqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q4yAykgcUqvX5FP0heOam2dJmE1kTQ0CVWOHd+gTPkzp/MJ7W
	TLuyFq6wpI2InsVDSIRGNT+hLFhKGfyyEQuLp4Os0bJgCez6PFy2fkkWSG7l8egdnq8=
X-Gm-Gg: AYBFou05jn5Pr59lBy5p2oExjf6If/A/y/op3HlOCDB14VN/fLsUfXKGZof9a8Du1Bz
	nqfrnN0KoLimPluJq7XzzmUiFFa7K6Ef96x2fw6ahbnpxubWXVOXKxNg/pLxs0HGtkBP4MekuVs
	3/DEqwFXqosE/1r7XDOa1srWTNZc7BHpew6rrJaR7/0Y2OiigSb6kgSYrW1GG8NOLNANu+mP94n
	ju3ZE/mxw2iCkhLCkB5xP+BzVuV55mGM+YhQuco4h0sFvkO1KRwVamWErRv1zDBQud/bmLwN+wJ
	r+eXLlx8jGimbNrdsN0FUyvQLvJdmj2K3ifzCAiWd4ko0EV+eURpwxOCcCULNw0ctOFA7cBhoPM
	cFNCm7+Hpu9WojXp5tDKShC7hSyELJkieYs8MN1UhQnkAfdqpQJyrOuwm0kAP0rK51ZnjQt+4Of
	dpUXpz3B8U68ioLzD23rWXedVWSyBBLEGN2T4mP1yqPRSpvvXFYCWLi4yQ9lZ1cGnmgT7+gjt98
	OCB3Q9oxZ5L7/XcPYd4zLP7kvl4cgpDdTAHzXVCMf2o64grewpIOh+iSe+MC0c4zIdBNBJDJjDs
	vz8sxjKOVsfw3A+pRnm1m3Jb98uFSZ1z4RE+HrMY21vRiHLVsTubh/xN3J4hQzL8
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr77214205e9.12.1794232052530;
        Mon, 09 Nov 2026 05:47:32 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm129149595e9.8.2026.11.09.05.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:47:32 -0800 (PST)
Message-ID: <2fd1031c-7a86-45cc-a595-bbd13e102d43@suse.com>
Date: Mon, 9 Nov 2026 14:47:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: Fix use-after-free in module_put() tracepoint
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 da.anzani@gmail.com, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022184517.66438-1-atomlin@atomlin.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261022184517.66438-1-atomlin@atomlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/26 8:45 PM, Aaron Tomlin wrote:
> A use-after-free condition can arise in module_put() should a thread be
> preempted immediately after decrementing the module's reference count
> while the module is concurrently being unloaded.
> 
> In module_put(), the module's reference count is decremented via
> atomic_dec_if_positive() before the module pointer is passed to
> trace_module_put(). Consider a scenario where CPU 0 decrements the
> reference count without reaching the baseline MODULE_REF_BASE level and
> is immediately preempted: it relinquishes its reference while still
> retaining a local pointer to the module. If a concurrent CPU 1
> subsequently drops the final active reference, the module's reference
> count reaches MODULE_REF_BASE. This permits the module unload sequence
> (via delete_module() or the initialisation-failure tear-down path) to
> proceed and invoke free_module().
> 
> Function free_module() invokes synchronize_rcu() and subsequently
> releases the memory backing struct module via free_mod_mem(). Because
> CPU 0 was preempted outside an RCU read-side critical section,
> synchronize_rcu() does not await CPU 0. When CPU 0 eventually resumes
> execution, it passes the dangling module pointer to trace_module_put(),
> which dereferences mod->name and mod->refcnt, culminating in a
> use-after-free. This sequence of events is illustrated below:
> 
>     CPU 0                                       CPU 1
>     -----                                       -----
> 
>     module_put(module)
>       atomic_dec_if_positive()
>       [preempted]
>                                         module_put(module)
>                                           atomic_dec_if_positive()
>                                           // drops final reference
>                                         free_module(module)
>                                           synchronize_rcu()
>                                           free_mod_mem(module)
>       trace_module_put(module, ...)
>         mod->name
> 
> Resolve this by moving trace_module_put() prior to
> atomic_dec_if_positive(). Because the caller holds an active reference
> to the module at this point, the module structure and its name are
> guaranteed to remain valid throughout the tracepoint invocation without
> requiring preemption disabling or RCU synchronisation.
> 
> Fixes: cb0b50b813f6 ("module: Remove preempt_disable() from module reference counting.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>

This version #2 looks ok to me. I plan to pick it up on the modules
tree.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

The additional version #3 [1] seems unnecessarily complicated to me. It
is ok to report the value of module->refcnt before it is decremented. As
noted earlier, other code, such as xfs_group_put() and objagg_obj_put(),
takes the same approach.

[1] https://lore.kernel.org/linux-modules/20261103163103.13195-1-atomlin@atomlin.com/

-- 
Thanks,
Petr
