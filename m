Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504153BCD01
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147575; cv=pass; b=iMRa1RiisLUfLfIjMpioA/z2b1EpA3QToeyk+eIfEGUJIXAYhGNLNjsqVxFA9pCEnYskj4kuxmD1/tnMLIXiOABkJJFHxfmphrXsK1iux+M5PFVEJhf9mrAKISXnqao3DNOiekmVp7Zm1zMfC8XKNyPqVdiY1ngKHojkRbcqPCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147575; c=relaxed/simple;
	bh=ePal1IXH2Ui+jY7Cm11lrIQVvYsSFG8i9kUMaDDpZ0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=joS/6VJ3qw3ofz5APaWc84xCCbwlIxsrsLq6KrSznTxeAjslm7SEgE+nY8mVhsZdxYcUVZO5fiYFnmbpIb3gn4hmWxZ1aJcvIq/9tvP3n1QIkdi7s44sHBVdgfM24XJaSycGW3ys+uXbXJiHc87b36N+ECuG1KVpb2yCl0A4tIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=emKzngRi; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="emKzngRi"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so5766381cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790147572; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/YAfuNC1MDPUsjIE85tcbNE6ahs1MnQ3D+o2qUs7ieWf+5DDdbf1Iat0lZzRg+sVf
         x0mLqEPWWys5FIZgC9CdpWHbYKXC5OB6DdNevJYxhhwgREAePYAVk3sx8avHr7AkI7UZ
         Q0rD+wiCEUCUEhoYxk+BHRQMdBSsgDPR04v+edAxSX6dQ2Fqqht+sjmr/Ehm19xxrv0g
         uVLPrkesO3ylSTo9IQIlbyaPcRclhiUOUExLRlmugusOBQGjTooaW7q+2iiq4Qwlj7QI
         NZmlSYA78tcWIozBVU54cL74wjdFV/MJ3muDbS63fG7DesiOfxSwbE1pjepKjW1l+8t7
         /BDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fux143jdFR0Eh4CQI0otQKDHPnWvDD/S8UKWh266eU=;
        fh=X0IcaO8zwLDFcEcLURYtUPMZdcN4/WMc0DfgxBbOkA0=;
        b=SfOOlNBxbNAuKq1MCkffGmwRS7jlD6oaWP/c9YIJXeiMF39rmjomAqjvDVNYhB+3kj
         cQdn2YPP9o66bZmiMCJNcRr1YE0R/IjZvSAvjYASCbymLL1SVoGGmBMQYpqFU2nWUKEE
         dMM5lIZBZ67Ya0hvV8V2iNIuxMunG4VEzVyf0RpXa3qKRaMMnFh75JsLkjYp/ArEH88c
         3qFvhmSmRNHGGYJF4ym5++0FrN4oIDHvZAp0iC5Qr0dc2yEJrFGsCLH+lfudpfrqHN2N
         cdprsy/jQGiI5gzgFqgwNRIxpa4CKan8GUFbt6NU7b/2+ClogAl99YWSv4ApLss6/t7N
         RMkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790147572; x=1790752372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fux143jdFR0Eh4CQI0otQKDHPnWvDD/S8UKWh266eU=;
        b=emKzngRiX8Z0z0envXyWC//55RUh0SpPAYietpdEoXz01NbpVeE38oEFW/UHBdCwEc
         kvpI73deH0FCw+ZacAOJkwpiw45NQUwEjtz4ABXvhHQ6gD1x3yNQ8uh5zoyGupsKLDMH
         y6MNeXOWW9kcDQTOvRsNM0CT+SBSWsAMojYU2f4n96KsAruajdJ+w2crhioOunaU49ID
         xDybQLSBveJOqmL+ZRBP+MFiQxsLkhTyKJFnFSG69SkgLQWn6mpW99SfbBq0d9QlBjwd
         /JZm7R8ZFRLEPeMFetWVz25gouxTXyyWLZ4Ksbc7G9RN0fafM0FmZDPIG3goAGqmgRxJ
         9pkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147572; x=1790752372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fux143jdFR0Eh4CQI0otQKDHPnWvDD/S8UKWh266eU=;
        b=ceCP4fbAaGjYblpB/as3k7H1ESMWO7p2ViHkNzGymKwBSbu4Hxa+acpPLYrwPzru9w
         mIisy/okbf1vMZh0KaF+DwSUuJh69tS0MUutl34V9hgcKVbyei307utlN7S5Xndaa9gx
         MXCS8R6zgcrZNNGRHz2mzGsVyMD9ECixyrxroFrc4ZeSXLLC1nTOyVwXpywL1Ca3fD5I
         6Z8kJjjPnn8P5qGONSUE8fB82rDMJUlLK+wSzzxcc7yZp53x4elMswmNFPJ1XdxcBgA4
         x9mE27+9Z9rmFhjR3fd4Gd6vRAyvv4abON/KSmlT8vTVCXRX05RztGSuuOLQQfrJZZ8P
         OBiw==
X-Forwarded-Encrypted: i=1; AKwUvBwDOt015SRKT4dxYKjD76gfV3LbKz8oLEJ/9bFBSwiVLWPmd1h6CmK681JZJUdLxEgNX5xHxv9l0uS8750=@vger.kernel.org
X-Gm-Message-State: AFuF++mTwBUWxgC7T3e/mKLLn22KVjyuEPtdj3v7+yfnEzOhcC3bnjKG
	VC1bvqSv9t3cp7TU/bZBEVzCw3uHURs3/J29FiGZM4x7us4i2UuWLFF5kPSufPmEH8cpw6d67Dn
	fD27Ed0JIUK3+8f7lVT0ePRejIf9PEX71Q2opPhLa
X-Gm-Gg: AYBFou38ArM9oXUxCgMb7oUQAJ2ZU4BL7J+QvPnvhI1EkMIFj6Dal9D8DzuzUu1pLJP
	XDgUaQkdb6NNbtqVWDNhhVxM7dCoOaE0SeL8SCxYTnLwLJtXBSm84omFnOvuC0xlc6fBJr6zxA6
	3QB1B5OkU59xMOBx5yHuh69NfWP+vtqhsReeNYAU3l2FLvX+SCFaNkLcn2TETIxVYJeiJyCk8HW
	Vzr9mWiXfod4g/LiSiAEOEZvmrsQvVnuPpFAQHZH2YhH6F0cGVIM2wD5PE0+rqZM1wSH45qpSFy
	bJI/Qkwt11YVX/kw6G64vH6Hsk1jSa7saLg9dwXMsnj64GHtSFT4JWfKjPfBEmF25n/hx7P8M8O
	MTzHJCnwv1Xe7eljryATpt90pIyLjPDCDSdXVrzHTaWru7Bg2pvtuHSxAA+/NeLVIDZo8
X-Received: by 2002:ac8:570b:0:b0:530:e01d:6001 with SMTP id
 d75a77b69052e-532eac6cbb3mr31883801cf.11.1790147569115; Wed, 23 Sep 2026
 00:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923032936.2020902-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260923032936.2020902-1-runyu.xiao@seu.edu.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Sep 2026 09:12:38 +0200
X-Gm-Features: AcwNN1VwyXdqxc5s0wWZvupLP8rtkXVbaVkNw_j7qxnCeeIIfDCdM4_fvPpPjkA
Message-ID: <CANn89i+fsQdMeMcc6zk_Vp0WtckLQBTmrQ_fbb9rm44L8kSiTQ@mail.gmail.com>
Subject: Re: [PATCH net] net: gen_estimator: protect seqcount updates from
 hardirq readers
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, stable@vger.kernel.org, 
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:29=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:
>
> est_timer updates the estimator seqcount with preemption disabled, which
> does not exclude hardirq readers on non-PREEMPT_RT kernels.  A reader can
> observe an odd sequence and spin while the timer is interrupted.
>

There is no hardirq reader of gen_estimator_read() in the tree.

The only callers are:
 - gnet_stats_copy_rate_est() from tc dump paths (process context)
 - tcf_police_act() (BH)
 - xt_rateest_mt() (process or BH)

est_timer() itself runs from TIMER_SOFTIRQ (or ktimers/N on RT), and
softirqs do not nest on a CPU, so no reader can interrupt the writer.

> Disable interrupts around the seqcount write section.
>
> The failure mode was reproduced with an x86_64 kernel under QEMU. A
> test-only hardirq injection invokes gen_estimator_read() on the same CPU
> while est_timer() is updating the sequence counter.

Injecting a call that does not exist is not a reproducer; with that
methodology essentially every seqcount_t writer in the kernel would need
local_irq_save(). Note that such a hardirq caller would already deadlock
on e->stats_lock in est_fetch_counters() anyway.

Also, the preempt_disable_nested() here is deliberate (9f74c0ea9b26
"net_sched: gen_estimator: fix est_timer() vs CONFIG_PREEMPT_RT=3Dy").
local_irq_save() is not remapped on PREEMPT_RT, so this patch would add
a real IRQ-off section in a context RT intentionally keeps preemptible,
and would lose the lockdep assertion on !RT.

Finally, the Fixes: tag and Cc: stable are not warranted: nothing
regressed in 1c0d32fde5bd, and there is no user-visible bug.

pw-bot: rejected
