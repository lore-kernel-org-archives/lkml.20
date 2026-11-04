Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796987;
	b=N6G1Xg2szsS9vKqeNR1arv1BemwZIMXRBo0WM36fyTDeM8VE5bn6BdXBirbQ+RFjv0dr
	 nn3xrN4cvLBrIlnEAmLtG+gkaBjQoB6ydmczfLIWEtiPF7s9wRrT+oVWoDN5cDD5Srq7n
	 CpztscMTyKz7+GdcdhjT5oy4999mcSg3Hfka4T3q2DCW9pVZBF/FAo46y8QFEyX5cs7dE
	 4i+/lb0+uVg2Llcny6QDn+WMVhPK9pXLNAAxG63Skv4a7NZzlQkPYsdK7yjI2hAkYc6V9
	 RuwVQykTfsAx6EjLkoOBijOJJTffocdI/BrctOWIELELwliJ1om0i8OFoP42fJMPNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a3viuefWVHlkOcjcyLognlTI0g9S7LK7g5mw2hwAeX8=;
	b=JxJgOtMqes6ayrzNmSSCLeo/3vfYRyPpz3r8audL/btaeO3+GGfPpt0f8Ba0VPQxc7qM
	 L+oZ2IpfN6Ibgb+/fBdTeHdQYe1ftGEu9l4dCpHLRGEufcsfRIbyXy8vGsKahkwszqN8i
	 t3xl+uNRVU796mHz54LGHtJaBbw8BAfultJM3B10GmTVJBTs3ftWfTlOaJeSsa52I9lrO
	 tHmDmEiTDivIyzxNlcnKnM51TlEwxQd2OWAa+4GxpmLoOcs+dXkKdze1KLHZbb7up8XyC
	 p7PTwZ7wUwXfCClPNwmPJbkQK4oRs5ynG57Zd1yEZsfxiQZbjoPugWLZ2ZBeFsw9l3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E1HS4KvD;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E84606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=E1HS4KvD
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5975485e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793796984; x=1794401784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3viuefWVHlkOcjcyLognlTI0g9S7LK7g5mw2hwAeX8=;
        b=E1HS4KvDMJ6h45stv1yXcg6I/LLEE/c9MaF6ggenro1/m0w4QKXVE9y6xXyOpyL8I1
         29B115DvRQVFT2gq1ICuxfvi5sQcPumezfbyddX1fyWCeBLKcAlcXd9gZ6sezLvemTVh
         WA21r+rWy83sQ/m6kgUSl2ALr1nRvpPTT8KofRZrcuEGlZYgSVrJ9ZMZV7qwYtO4LHF7
         HzcCk0kdgJHlo2eL/5FbAbPCSVJ9QEk2LNE5mgFuUPOqAvKxeef40wNrU/qf5+6SgSJN
         3jbWRt/ekMkLMiHRPqmhKWKA0LoSJTKgkQPcFG6EvmyifG5TyT8j3FPqrmkp5R6NonH4
         EG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796984; x=1794401784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a3viuefWVHlkOcjcyLognlTI0g9S7LK7g5mw2hwAeX8=;
        b=AY0L3GnOrLdH9euErQTHjuXZvVZ0V74t33tU2oSXbBb44sDyeAfQrBFvJckF52NyJ/
         8eRFClK85nDB9g3L+uU6d+NCCtWJo7s/G4wkDjzHPoYlceoAfGINVVFbrSkGS3S0j6tl
         Gk4KZljK3+L4VsjV63LpZTT2AMr5fzrx0/Fl6svUhZVqAt5/APp0IGnsM+WcFF6fyiA5
         C4ByGEQBcemxq02l+KVxTKVDFIT4kzpDPrlSWlDzcOGc8zMKimC57quL4uBciZMjYKqT
         tGZ5hQNsrXZVANLvvYtVXx7L3YDlTIIiEE0hUt4yWioeVvRZbqMmjulBiblylJX5hWEs
         CwRw==
X-Forwarded-Encrypted: i=1; AKwUvBwGZXegyeYhX6n42WPObLYm00gKcDcwUbp2NB5vV1TwfHKwLS8zu5gaQ8bAgTUDk7v/rD/eDYLRmS3RhTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hinUOOuAkJM/Xxk+Gbk1Bj77AjZ6/vtYAfbOdcHJsSE9bGsEm
	PteONvUOwTYuRjdVVicLncGIkC1ZY0ajqEATEUCmRM1XtW/mHagBujqVHblMRHKoT0M=
X-Gm-Gg: AYBFou0X43rq/L+RljklvKmrXfNmjes/0pQyOO7Lx1Ur0rTnbIKQkUV19aSK09t2Skz
	arB2n4IF8ADp5TtD/jpvqgfExysnVE1Mdn+HsA08NCSoVzVnt+f+P1PAfof4BpSeMAr1sE/AZCk
	1HRNaJCqoT/112pWWUxwvcSW9jDyALUYzzZf0/DiY0CZ+QTHbsgA4ITlb9VoawOWx8JP4NLq9pf
	ajYkEVvG9oCHrn9vtPRafoREPibzk53RiWgQh4MhC337E0g94CD3yMK5UZKB3qtnXWcbMCyW77V
	adnbPdEGpFUqzZpyoxbM0/oHqc2TZh4etRaWqfkzIJoGLP8viKo7ijggqaLkkmzSKGUnuDU/K7i
	mGBzyx8KWRvf4f6N1oz/+6nFcepxzS3jfq0ChAqZVwZk5UFBDxOHyX1Zhp495YheX5kccWukS8y
	q5lsgPv2XtdVv9TEWUtSEpythaUmOTA4FRy6l2LIMNwSw7dsGFKpQunHQuBH5ScpfBMv0Cf3QqW
	QXGuS0LxxXG6pGi3wovPrHqFJS8S3mg6Vcj4aJnbMyuisBCh3HBllmeEqagm9LZitiOzrF9DFUR
	BHI7CJnxbly+cXjhiHwDOkKdzMqEJA1WRq8i0/kq8/xQmV0eSNCQh+uA5woxzRkWXQlZ970ubEV
	s7twwXlY9c38MNGmvP9zrq2rJs36RlEc4nOKZlvWB5P3qxvD2yGvwycumMf0sD9oUou2B9Pk=
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr425311395e9.16.1793796983815;
        Wed, 04 Nov 2026 04:56:23 -0800 (PST)
Received: from alcachofa.home (cst-prg-36-190.cust.vodafone.cz. [46.135.36.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20935sm3705844f8f.54.2026.11.04.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:56:23 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com,
	royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 03/15] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Wed,  4 Nov 2026 13:55:18 +0100
Message-ID: <20261104125529.3229301-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101082307.151957-4-gahing@gahingwoo.com>
References: <20261101082307.151957-4-gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 01, 2026 at 09:22 PM, Jiaxing Hu <gahing@gahingwoo.com> wrote:
> drm_sched_stop() does not wait for a threaded handler that is already
> running. Call synchronize_irq() after it, outside job_lock, which the
> handler takes.
>
> Before the sync, mask the block's interrupt and clear its raw status, so
> that an active core cannot signal a completion after it. Do that under
> job_lock, since rocket_job_hw_submit() arms the same mask under that lock,
> and only when pm_runtime_get_if_active() returns a positive count: the
> reset holds no runtime PM reference, and with the domain down a register
> access takes an async SError.

The above I understand.

> Igor Paunovic's induced-reset runs on RK3588, including a two-task job that
> puts hw_submit() on the IRQ thread, found no fault; as he put it, "this
> does not show the race is closed".

This is completely out of context for a commit message. How is somebody who is
reading git log know who Igor is, and what his "induced-reset" is?

> Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.com/
> Link: https://lore.kernel.org/all/CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8HoMtHD5U1g@mail.gmail.com/
> Link: https://lore.kernel.org/all/20260912113717.6819-1-royalnet026@gmail.com/
> Link: https://lore.kernel.org/all/20260916132824.13527-1-royalnet026@gmail.com/
> Link: https://lore.kernel.org/all/20260919103422.148834-1-royalnet026@gmail.com/
> Suggested-by: Igor Paunovic <royalnet026@gmail.com>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2
> ---
>  drivers/accel/rocket/rocket_job.c | 71 +++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 03e5f094f60b..5b2abf40b618 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -401,9 +401,74 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
>  	drm_sched_stop(&core->sched, bad);
>  
>  	/*
> -	 * Remaining interrupts have been handled, but we might still have
> -	 * stuck jobs. Let's make sure the PM counters stay balanced by
> -	 * manually calling pm_runtime_put_noidle().
> +	 * Mask the block before waiting. hw_submit() arms INTERRUPT_MASK on
> +	 * every submit and only the hardirq clears it, so on an ordinary
> +	 * timeout it is still live and a completion can arrive after the sync
> +	 * returns. The next submit re-arms it, so nothing is lost here.
> +	 *
> +	 * Only when the device is already awake, though. This function holds no
> +	 * runtime PM reference of its own: the only one in the window belongs to
> +	 * in_flight_job, and the completion path may have put it and cleared the
> +	 * pointer before the timeout worker got here. drm_sched_stop() above can
> +	 * block for a long time, and it drops every pending job's credits, so
> +	 * rocket_job_is_idle() is true and nothing keeps the core resumed. On
> +	 * this hardware a register access with the domain down takes an async
> +	 * SError, so a reset must not be the thing that causes one.
> +	 *
> +	 * Only a positive answer will do. pm_runtime_get_if_active() tests
> +	 * power.disable_depth before power.runtime_status, so -EINVAL MASKS a
> +	 * suspended device rather than excluding one: pm_runtime_force_suspend(),
> +	 * which is this driver's own system suspend callback, disables runtime PM
> +	 * first and turns the clocks off second, and rocket_core_fini() suspends
> +	 * the core and disables before it cancels the timeout worker. Both leave
> +	 * the domain down with -EINVAL on offer.
> +	 *
> +	 * The cost is the other half of that ambiguity. A core that is still up
> +	 * with runtime PM disabled (pm_runtime_force_suspend() before its
> +	 * callback has run, or CONFIG_PM=n under COMPILE_TEST) is left unmasked,
> +	 * because writing to it would mean writing to the half that is down as
> +	 * well.
> +	 *
> +	 * Clear the raw status along with the mask, the way the completion path
> +	 * does. Masking alone leaves the DPU bit latched until
> +	 * rocket_core_reset(), and the hardirq decides on raw status alone, so a
> +	 * fault from the IOMMU that shares this line would wake the thread again
> +	 * and what the comment below asserts would stop being true.
> +	 *
> +	 * UNDER job_lock, because rocket_job_hw_submit() arms this same
> +	 * register and always runs under that lock. reset.pending is set here
> +	 * without the lock and read there with it, so a submit that has already
> +	 * passed its check can re-arm the mask after this clears it, and then
> +	 * the synchronize_irq() below fences a handler that is no longer the
> +	 * one that matters: the block is left running a task with its
> +	 * interrupt live. rocket_job_handle_irq() avoids the same race on
> +	 * OPERATION_ENABLE by making its completion writes under this lock.
> +	 *
> +	 * pm_runtime_get_if_active() does not invoke a callback -- it only
> +	 * takes a reference on an already-active device -- and
> +	 * pm_runtime_put_autosuspend() is asynchronous, so neither can re-enter
> +	 * this driver's runtime PM callbacks while the lock is held.
> +	 */

This is just absurd. The driver will quickly become unmaintainable if we merge
this kind of comments. 

Please remove all LLM-generated text (cover letter, commit messages, and code
comments) from the accel/rocket patches in this series, and replace it with
your own.  I don't mind if you write it first in your native language and use a
LLM to translate it to english, but I need for you to understand the code you
submit and write yourself any communication with humans.

If you don't understand anything in the code well enough to write the commit
messages, cover letter and comments, then I suggest you use the LLM to assist
you in acquiring the knowledge that you are missing.

Also, please read:

Documentation/process/coding-assistants.rst
Documentation/process/generated-content.rst

Thanks,

Tomeu

