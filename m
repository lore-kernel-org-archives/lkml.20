Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588596;
	b=Vab5ChtGNwLpP17a5EHYi/oFVOtDOoI9tAaUM7JpZjuXFt/5qsO08np4EDDl5cmQHy37
	 YIaHF27YLMxV+/4jTZyUS4ey6+S7DqCbEA7EbjVC5CWx37CkoEftKaGuzlRvtAOciIwnP
	 +OY+lJzDgCTg7VyXWJv8Mc4oEd0nLTl4XNv4Uc/PzsYoVNMVIeJHsQxnbkvhD0hL5iBqC
	 H5+LxmSC1BCM9G10PRQn3IxhulPU4pfkXCd1FyEW4JS3gy6qLThcjxS7A65OBYGy00ood
	 a7inJ2jWASK7xay+4F3NU/rYoOMPi/WDA1LXXLvybm0a1nnnKEZvi0/HG8b//VW5AtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588596;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=DJqj7gh9SV0xIEH3OaHLRmMTtSkIx+R7X8nbTR1kj/4=;
	b=a6mIk+Kjfo+Vx38/Dq0mQku48wDmxmsb6Oc+Iwu1s8bfWFGm4Bo6O+Bo5muXk9YPd03T
	 ksI5crRT82SIcSnVZy24LkJyt6/MZ+Hh3PIHwsM0WguEvKPPhB3tDZz99yMcnSO+Gz1/X
	 3n1V9dnjJJ7blsf9O9nURqF3NgWllkffiTtGIy9L3KcFLB1srjH67BTY/rwSxnWdTk+qI
	 OnR1iThYo5/wWtcaE1g/RR+8gXoYHo0PoGFZxdt8XW+Rt9EaeyGX0YOh0tOh6AHfBY3n7
	 sTp/wzUq6Icr+PYMoKhBRmHOTbVicpAQ5ffQZoCaCUOol3MmrhE0mY1xSwyT0VgK7Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wLCHWUgm;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C0606AFE6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340C0606AFE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wLCHWUgm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B86E94E415A7;
	Fri, 13 Nov 2026 16:49:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 802FD60015;
	Fri, 13 Nov 2026 16:49:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2DB711BC11D2;
	Fri, 13 Nov 2026 17:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794588588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DJqj7gh9SV0xIEH3OaHLRmMTtSkIx+R7X8nbTR1kj/4=;
	b=wLCHWUgmjeAyLUYRu3URWIEaJoxEyHLdPi5duv7JgNMQLFXBEnWNMxI3o0Vp49D8hpBdDK
	fiLdbOBc0unPtro5C12Jf668jkKFUI2ZXZimpsuJBY4iUOik4wsARicO5uY4KiV0lVgKr5
	er3sOgXYc/NIV8yWd9gjVHOXL7M3I1D1q/H1r0cyXCrwnNG6TBa16XbhbhlIp3mT3sd542
	p8xots86wlNZfTs3jR1wtNdIg03G9Rt8C2SmigLG8NcTmb6Jk7wGVzZyztkG/4pHebQgvw
	Dai2h18pAiKm80x1Yhfbrl6rk7KfNV1KkWmSl8FXnazLfKiL3/24rGEn1WTu/g==
Date: Fri, 13 Nov 2026 17:49:44 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] time/sched_clock: Call enable_sched_clock_irqtime()
 with IRQs enabled
Message-ID: <20261113174944.05ea41cc@bootlin.com>
In-Reply-To: <20261113-sched-clock-might-sleep-v1-1-e11e404fba10@bootlin.com>
References: <20261113-sched-clock-might-sleep-v1-1-e11e404fba10@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Benoît,

On Fri, 13 Nov 2026 17:40:09 +0100
Benoît Monin <benoit.monin@bootlin.com> wrote:

> sched_clock_register() disables interrupts with local_irq_save() and
> calls enable_sched_clock_irqtime() before restoring them.
> 
> With CONFIG_IRQ_TIME_ACCOUNTING, enable_sched_clock_irqtime() calls
> static_branch_enable(). With CONFIG_JUMP_LABEL and CONFIG_HOTPLUG_CPU,
> this takes cpus_read_lock(), which eventually calls might_sleep() from
> percpu_down_read_internal(). So with CONFIG_DEBUG_ATOMIC_SLEEP the
> following is reported:
> 
>   BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:51
>   ...
>   Call Trace:
>   ...
>   [<a8000001008ad9c4>] __might_resched+0x3ac/0x3d0
>   [<a8000001008598b0>] percpu_down_read_internal.constprop.0+0x30/0x1b8
>   [<a800000100af5ddc>] static_key_enable+0x14/0x30
>   [<a80000010099b600>] sched_clock_register+0x2a0/0x370
>   ...
> 
> Most callers of sched_clock_register() are early init functions,
> for which might_sleep() stays silent because system_state is still
> SYSTEM_BOOTING. However, platform drivers such as timer-nxp-stm,
> timer-ti-dm, timer-mediatek and timer-rzn1, as well as the mips-gic-timer
> promotion work, call it later, where the warning is reported.
> 
> Only the sched_clock data update requires interrupts to be disabled.
> Enabling IRQ time accounting only flips a static branch, so restore
> interrupts before calling enable_sched_clock_irqtime().
> 
> Fixes: 2707745533d6 ("time/sched_clock: Disable interrupts in sched_clock_register()")
> Reported-by: Chen-Yu Tsai <wenst@chromium.org>
> Closes: https://lore.kernel.org/lkml/20261109095036.GA722431@google.com/
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
> Found the sleeping-in-atomic warning while working on the GIC
> synchronization series [1] and testing configuration options on the
> Mobileye EyeQ6H SoC, but the issue is not limited to that clock source.
> 
> Chen-Yu Tsai reported the same issue with timer-mediatek.
> 
> I also discussed the issue with my colleague Hervé, who reproduced the
> BUG on a board using timer-rzn1.
> 
> [1]: https://lore.kernel.org/lkml/20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com/
> ---
>  kernel/time/sched_clock.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

And I confirm that the patch fixes the BUG reproduced on my RZ/N1 board.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
