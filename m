Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631171;
	b=xZ1x+7wGVX2bBzewVoorCUk7pyneZClWrduuLgZ8aaE1fHIrxOho4J/rbTSgcXwiv27t
	 b18+W+vbN/LRjqrb3USYHiBhHdjNOMyA5Wl9lMy/85DEE8ddprnXN+jhDD+gZ74LpdQDq
	 FMhFQJugbEX9QPmD+2NcbvzoG5cVGSVpUm2MZDpDmhX/caWP32eBA0EvS+iAZYng6x7Ct
	 xdYUs4FF9yLoRg1yDDqMKp/5aujdys2MZjE2zoCxMfTMBVZujO2364jvL2drJW+dZlkb7
	 1vaUncW2kS14U46I+HtqOxibVsyM98W67yHkYmJX/DRxQznHzluaUNOwHHpw594yshA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DnZiEBAI8KR9amAjTpP9uVPbbO7v77L7Fo7uDbqMnxs=;
	b=Xb9BhzCNNfoENK9RrHZexjh24qVLbuaaPn8/7WU8uQW8f2rC6+fWvuKTQZ9+khMT2KqQ
	 zQYU4e4o1Kpo4eOMhsbO+JFnrP7Mz67kUCdKJ9xwbhDXrRS+VUPxG5NNIJVL/csk8NZ41
	 7LJlkpBwcA41OsyMqXMJVRmrdfAbKEQfLHcnGEJ+Guyh9sgbxv7TJ6ETawtjyXOFKgE7H
	 /LpXp9Go9c7zLmmwAk9LK8e1H/8D1A5FXbcxWCjm9y+Zs0oKXTA/rsI5Fx5H9y8dtwPE1
	 lzoBqtLnRppOIQ2akTEI85V+45MU/qbB8whrGVkEyG0HbA0Zq4o47g47weve/XMFxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Co/5Vhq/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831A606E01A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5831A606E01A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Co/5Vhq/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so1875393f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793631169; x=1794235969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnZiEBAI8KR9amAjTpP9uVPbbO7v77L7Fo7uDbqMnxs=;
        b=Co/5Vhq/L8JGGMRN8JLdcMJBKEF/RQ/Lhi9x+AnQwA6LyrEfV25iJj/fXIjEYgpLpQ
         iipaN/pRR+jXeHb19XI8ny1xA+FnMA18B6ZBXoMTzhs0wH1LFqxJI6UpjlYKszLe8PLd
         VxnnbYspqt379w0JGGojHDTAiOskyLIpVh7iTvbFs/wxgDa4Rrx27SwjIYnLMHjSQFOS
         8J7CRDUAtLNHo/d06OZ8EfLlzFtBpM2NVxVo4x83RXyZfzq8bfBHK7SCDhBE95peArhQ
         f7Udn00wyKgRw9eBcbE3WEAz6rFTMDHDcXZlCCHCtVKqvGj6riTMEmJ5UbVVaRcK246Y
         L7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631169; x=1794235969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnZiEBAI8KR9amAjTpP9uVPbbO7v77L7Fo7uDbqMnxs=;
        b=2IgIdESQQMQ88izxSNsKUlXsp+JdhdEXHXMh8g7kVMK/InFVowtxzmiOIfiXbSAGhB
         t+26+gTbOI5kbqIMZBcspRQGuGGH/ZvdLDJ08AoXTT3stJkpFQjNUDQTCYM+EFextB3L
         WAnddDboQkEUdEcja3EMsjyHncF4ph5PvMbInpddlJm+HQJAXin9Hdqc5lFkws3UOwmQ
         OjnY0nrGBZcrW8UrxpzOVFHgticjKkQDa2zP2ZAm/9E3JAw4JJ6ANpmlymDNWHZXaDZq
         vyXf+1Kmtt51gc33RNQFm4qCcPwpuibIg3Ruvn1qmpKS/9J60rXunJNwvRTt3Mn+Xvzc
         FU3w==
X-Forwarded-Encrypted: i=1; AKwUvByIEsXoJ9aQI5sI1a2cKoBeahBMeAe6PF1BQhXEcBkl79dKFnQRSZemT0sirdQH3yC4uRzFve1XmYnzeS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PBinrM611c44lSstVMR8Vt9SETKuju6WIfK49DCYJjpQUzWUq
	mhIBJjtX56Eng0O9ONDeXrUz+J+iit2staf+YYShF3Ju34+qvRLrOzUYWt5GruzzJRY=
X-Gm-Gg: AYBFou2jhUz76Fvk07WFedskWC+Y/UJkt/65tEJGZCZJaHpk+4qNbVkcfS5fUOBOYwJ
	iiCfaiEUAOJ3UP2yf5pgk2VX1aOt3kUuzjp2FHvriYRX15lpJgGMRZcm1womQNOB/wCdTOTDn5S
	wvSm+Ejk1axfnStvS3PxRFbtFj8SBo98hU7ObaAi47Bxz0c0PEEX8oKPX0x9rAKKo5yB02j7pIK
	0X2bGV/ZL75y1c4YB36fGljvaxzlDCEsDdpdZkIwQDv9dFLLohAY7IxmWq4Lar4KtizncUvz2y/
	Ax9wIrHWYg8pgF6+2wybcMeCc9E9EF2eiNFUrPD8XKa+WjhQffT8ZMx27LSTI+QGHWkCf/Lqsue
	9CTLxxh6RhoApPVW7YvV74fgEw8hZ3JbEjJ0MMyUcqO8zcFQViZ0LbnSSSbYa+Hq3b4Fm9apcTv
	JZTnBl7/17p07SLoJ1Uxm8rZ9gFXH6fIEbYJYWE+3pfSjOLiS1AjfIOMJGrV+m+bagVKIoAPIJO
	wY3DFmOrojazXdkVV5rrZZFebn3q7QdDAOKfFZxsZDLiUkv1QtFTN23DVDvT2/JmXECSwgXiBWT
	s6Zf2yedjtYy2tLfVo1xkUZXB2UNLQVEtU2QswSltkSRBPKjB0QTcqTlCCu98gxilEhUwc+EVEX
	iculixuikeA==
X-Received: by 2002:a05:6000:40dc:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e6e2fa50dmr24136852f8f.20.1793631168401;
        Mon, 02 Nov 2026 06:52:48 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm20266085f8f.23.2026.11.02.06.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:52:48 -0800 (PST)
Message-ID: <cbf60391-ebd5-4e3d-b38d-45b8d86d1574@suse.com>
Date: Mon, 2 Nov 2026 15:52:47 +0100
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
Subject: Re: [PATCH] module: drain external refs before freeing a failed-init
 module
To: Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 atomlin@atomlin.com, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 pasic@linux.ibm.com, =wintera@linux.ibm.com
References: <20261007083956.2488796-1-mjambigi@linux.ibm.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261007083956.2488796-1-mjambigi@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/26 10:39 AM, Mahanta Jambigi wrote:
> When a module's __init makes it externally reachable (e.g. by registering a
> protocol family or a bus driver) and a later __init step fails, do_init_module()
> frees the module while callers that entered through that interface and called
> try_module_get() may still be executing module text.
> 
> The normal unload path in try_stop_module() refuses to proceed while
> module_refcount() is non-zero. The init-failure path has no such check and races
> to free_module() immediately after synchronize_rcu().
> 
> Fix it by waiting for all external references to drain before calling
> free_module(). Add a per-module struct completion refs_gone inside the existing
> CONFIG_MODULE_UNLOAD block that is initialised in module_unload_init() and
> completed from module_put() when refcnt drops back to MODULE_REF_BASE and the
> module state is MODULE_STATE_GOING. The fail: path calls wait_for_completion()
> (guarded by the same #ifdef) after dropping the loader's own reference,
> replacing the previous implicit assumption that no external refs exist at that
> point.
> 
> Also move wake_up_all(&module_wq) to before the drain so that concurrent loaders
> blocked in module_patient_check_exists() are unblocked immediately once
> MODULE_STATE_GOING is visible, rather than after the drain completes.
> 
> Fixes: 1fb9341ac348 ("module: put modules in list much earlier.")
> Signed-off-by: Mahanta Jambigi <mjambigi@linux.ibm.com>
> ---
> Link: https://lore.kernel.org/all/5dc1fe2b-289e-4786-b9e9-e181dda8d4e9@linux.ibm.com/
>       [RFC] module: init-failure path can free a module with live
>       try_module_get() users
> 
>  include/linux/module.h |  2 ++
>  kernel/module/main.c   | 33 +++++++++++++++++++++++++++-----
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 96cc98568eea..0dee2ed02a2d 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -562,6 +562,8 @@ struct module {
>  	void (*exit)(void);
> 
>  	atomic_t refcnt;
> +	/* Completed when refcnt drops to MODULE_REF_BASE on init failure. */
> +	struct completion refs_gone;

Having a per-module completion that is needed only during module loading
is a bit wasteful. I think a global waitqueue, similar to module_wq,
should be sufficient. This would also avoid the use-after-free condition
described in my next comment.

>  #endif
> 
>  #ifdef CONFIG_CONSTRUCTORS
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index c1b34dc1e89a..655c693bd8e2 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -655,6 +655,7 @@ static int module_unload_init(struct module *mod)
>  	 * refcnt == 0 means module is going.
>  	 */
>  	atomic_set(&mod->refcnt, MODULE_REF_BASE);
> +	init_completion(&mod->refs_gone);
> 
>  	INIT_LIST_HEAD(&mod->source_list);
>  	INIT_LIST_HEAD(&mod->target_list);
> @@ -956,6 +957,14 @@ void module_put(struct module *module)
>  		ret = atomic_dec_if_positive(&module->refcnt);
>  		WARN_ON(ret < 0);	/* Failed to put refcount */
>  		trace_module_put(module, _RET_IP_);
> +		/*
> +		 * If refcnt just dropped to MODULE_REF_BASE and the module is going
> +		 * away due to an init failure, all external references are gone. Wake
> +		 * any thread waiting in the init-failure drain path.
> +		 */
> +		if (ret == MODULE_REF_BASE &&
> +		    module->state == MODULE_STATE_GOING)
> +			complete(&module->refs_gone);

module_put() can run concurrently with delete_module(). The module might
be gone after the atomic_dec_if_positive() call so this logic could lead
to a use-after-free.

>  	}
>  }
>  EXPORT_SYMBOL(module_put);
> @@ -3206,16 +3214,36 @@ static noinline int do_init_module(struct module *mod)
>  fail_free_freeinit:
>  	kfree(freeinit);
>  fail:
> -	/* Try to protect us from buggy refcounters. */
>  	mod->state = MODULE_STATE_GOING;
>  	synchronize_rcu();
> +
> +	/*
> +	 * Unblock concurrent loaders waiting in module_patient_check_exists() on
> +	 * module_wq. finished_loading() returns true once state is GOING, so they
> +	 * can now proceed. Do this before the drain below so a failed init delays
> +	 * only this task, not every other loader that raced to load the same
> +	 * module.
> +	 */
> +	wake_up_all(&module_wq);

This wakes up only modules waiting in module_patient_check_exists().
However, most duplicate loads using the newer finit_module() syscall
wait in idempotent_wait_for_completion(). They should be woken up as
well, so at worst only the current load gets stuck waiting on its
references to drain.

> +
> +	/* Drop the loader's own reference taken in module_unload_init(). */
>  	module_put(mod);
> +
> +#ifdef CONFIG_MODULE_UNLOAD
> +	/*
> +	 * Wait for all external references taken before MODULE_STATE_GOING became
> +	 * visible to be released. module_put() completes refs_gone when refcnt
> +	 * drops to MODULE_REF_BASE. The hung-task detector will catch any module
> +	 * whose error path leaks a reference.
> +	 */
> +	wait_for_completion(&mod->refs_gone);
> +#endif
> +
>  	blocking_notifier_call_chain(&module_notify_list,
>  				     MODULE_STATE_GOING, mod);
>  	klp_module_going(mod);
>  	ftrace_release_mod(mod);
>  	free_module(mod);
> -	wake_up_all(&module_wq);
> 
>  	return ret;
>  }

-- 
Thanks,
Petr
