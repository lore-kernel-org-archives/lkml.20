Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217842;
	b=y/MYVikb7RnSHPZ1aMdv7REOzSkbUROBvLuXaY1M6AlVSu0jDLKLjH5q+F5rXYE4tE4E
	 hKBou4TDeV2P+UYeLDvtenrG5eP/0Hu4cUqK9yh84PUd7BmcZ9vOO4h/B+0ea2wwTC/tP
	 3cWx967x8JUpXaRIfuOKHumvYwcrwzL1hkX7HsXsqAt0z24HrHZUAlEY/qe/4zuEcyPnA
	 7OVsd5lVfrssTZQNlzi1aOse4wQx9PXqT4V+1raGAYjumRuuRUuDJdDSBmkKO1mMAgQla
	 tHm43jXb4XgxbUUfI9nNvkYM5do530VzO199HdymNDzluHbGKMEFX/D9+YmRzgeE9cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=;
	b=KDomSi1CYTfv9qog6Fyydw2rO4y/P3W5Urniq4HbUv7ZqgrEKVvrQ+t2qjnbvAK0UjNG
	 jGddupoPc4IpycKhluDLo8PKOgZcB9xlx82AzojPXHyhPbN0z8hcEVgvCxuEay0OFYPqW
	 qfeYroMDy0EGmBx2gVfd8EOzvqx0yLNsG476hrlVU0TQM2v1UHdhrVqzCvoM530Fp6v25
	 maZc4Il+AGXnrWXwwhszfaA6d2PJyN3yGqHL5hD2XfxlE7WQkFKy+2DOJVTIzpMH0uo/z
	 VKi5DQu5luY54MY61oKY7+E2s6DvwV4QQ9HM3o0PrmtIVa9UMqrxCxWEY5B13QlXxNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y89PWs7e;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85472606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85472606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y89PWs7e
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so771206eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794217841; x=1794822641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=;
        b=Y89PWs7e1BJC+SG+uwknmjEOeXLCPVHRqNnTH+jAuqrWpPQPhmqkDe5YFTrm31BLxQ
         bDfCPsvOSmLnlw4NYzRV5b6sL331MHSp9rjVMseNdC1asEhvDqiFyocNDGKDx2plT/R7
         KjTjxs6CjOJ9V3r9uku1nqC+NMy/9hvYDo5EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217841; x=1794822641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iiWUMRW68xMPGfjZ+AcEwv9KLUF/IxUzNqoAU1lF5U=;
        b=SGUpOTIxVgq/uM3YovERPZMyLGjbxBXT8Jn/RAyghxrMz+kLhEOOcS/sv7ymgp+yKv
         MjqVT+3JhCdbC8SWRkzvXhTvXQBhzQx+dzYotibl+rc2MjooN/Nn8W9Tn2dyvGUwP62I
         7f9s/yNO9SGi6IWTWlsxTWiV9BY0M1QDdgZlwMtpyhFs2m5cKxlxeug1FwXxb1/PkuxQ
         35nvAjZGVI6MtD0TLObMB4HpZb4qcxvk8XjeyaVOTiAiutKqfVhQkTDThhi6YApWi0nl
         m05331pTtzOuSDM4O6LFU6zncBR1lk6Sc8Qe3zHXJiaZw/BQhKV5V9z2X8qiZEZvHU5C
         o7vg==
X-Forwarded-Encrypted: i=1; AL+hErEqC74bt9H2Yz/2EROqN7x5XEyPIumeESEJpF9TxNbk3SH+D1abvndn+WwA1Aa/rypIzKvHfddm4vVKpyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VUTrbLAa4vqpHyttdVdQhBAIvVIw4w8vyTiJAUg4IrJRWFHkh
	BMrcIwOMchbJlU5kGArMxj7a8WgrS2tyMXtATvrJRDsfUaHZBSz3YSYymPvbfuRROw==
X-Gm-Gg: AYBFou25NkuemFV/4XGhMxdut4NteVO8KpIAvuVmlI3RtusWIv09j5BSiD1L5elOaNz
	kdHcIutiHGN7Pq4LV7ydh8UKA17fq3X2WCnz8j8ykLUngSYFaiiwrQWoV0ilwf/ib6Wy5yQlF/F
	2g4ts+1HxOxmEwQdw8xviSXnWNOPc4Ificx9iUSySC+JiQ0J+ysg6P0SRpmL3Kl24v04L9qKb7X
	cJXENfqD1TUm9zTzIVlMDMPO82vNoqg9gw5Vrsv86lRcGPE6ioMamFWwrvJ7gC9+aIBa+U/ZKnG
	V+fYVuoUyrO/+f7Z1XVpXD6e2/9DHIsDCP1opmdWDXQL4TmqnktZvJotrKH3Agi66I4+NrcBwP/
	BHygxdO1ujA61BXfWSiH/5ESuoMv6cvVAzO1vpaN9EkDtVBWOISzgg0F0+0yM+sIpAF0it3x58T
	sM4kg35L7TcdrsqAoQdXGNYy+SnrgUwte4GVkHJFN2otMRtxplFEbBHaBuWfeFndfDxJWIBXo9x
	Mjd9erasYyfzHqCiXXzKbHUve24OUmZwmz8PRVv/Phw+obO3x/WP04LMjsTdjNvLeGuDU4WwxBj
	ywu6mKsGtXoHSagliP2XSz5MbqwHsz37skoEHX8nVzDef1ctHuJoIiKe1gRx3KxrMXcGl7KxTJQ
	zjaN/4A==
X-Received: by 2002:a05:7300:f407:b0:36f:fc3e:fb95 with SMTP id 5a478bee46e88-370f74a3b54mr9301081eec.17.1794217840410;
        Mon, 09 Nov 2026 01:50:40 -0800 (PST)
Received: from google.com ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm12674477eec.20.2026.11.09.01.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:50:39 -0800 (PST)
Date: Mon, 9 Nov 2026 17:50:36 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-mediatek: Convert to OF
 probing
Message-ID: <20261109095036.GA722431@google.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
 <20261002072115.169250-3-l.scorcia@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002072115.169250-3-l.scorcia@gmail.com>

On Fri, Oct 02, 2026 at 09:19:27AM +0200, Luca Leonardo Scorcia wrote:
> MediaTek APXGPT general purpose timer driver is registered via
> TIMER_OF_DECLARE to be loaded early in the boot process. It depends on
> a reference 13 MHz clock that is assigned via the clocks property of
> its DT node.
> On platforms like mt8516/mt8167 this clock is provided by a driver that
> is loaded using OF probing and becomes available only later during boot.
> This leads to a silent EDEFER error during timer init, which is not
> recovered by TIMER_OF_DECLARE and GPT clocks are not registered at all.
> 
> Since those clocks are not critical for boot, convert the timer-mediatek
> to OF probing and drop the TIMER_OF_DECLARE instructions.

I think this is now triggering some lockdep warnings.

[  +0.000084] BUG: sleeping function called from invalid context at ./include/linux/percpu-rwsem.h:51
[  +0.000086] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
[  +0.000079] preempt_count: 0, expected: 0
[  +0.000050] RCU nest depth: 0, expected: 0
[  +0.000051] locks held by swapper/0/1: 1, last CPU#3:
[  +0.000060]  #0: ffffff80c15d1138 (&dev->mutex){....}-{4:4}, at: __driver_attach (./include/linux/device.h:1109 drivers/base/dd.c:1046 drivers/base/dd.c:1299)
[  +0.000142] irq event stamp: 250728
[  +0.067364] hardirqs last  enabled at (250727): tick_oneshot_mode_active (kernel/time/tick-oneshot.c:128)
[  +0.009480] hardirqs last disabled at (250728): sched_clock_register (kernel/time/sched_clock.c:189)
[  +0.009301] softirqs last  enabled at (250642): __do_softirq (kernel/softirq.c:703)
[  +0.008427] softirqs last disabled at (250637): __do_softirq (kernel/softirq.c:703)
[  +0.008433] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           7.4.0-rc1-next-20261105-04243-gd86019357887 #373 PREEMPT>
[  +0.000018] Tainted: [W]=WARN
[  +0.000005] Hardware name: Google Hana (DT)
[  +0.000007] Call trace:
[  +0.000005]  show_stack (arch/arm64/kernel/stacktrace.c:499) (C)
[  +0.000018]  __dump_stack (lib/dump_stack.c:94)
[  +0.000015]  dump_stack_lvl (lib/dump_stack.c:120)
[  +0.000015]  dump_stack (lib/dump_stack.c:129)
[  +0.000013]  __might_resched (kernel/sched/core.c:9195)
[  +0.000018]  __might_sleep (kernel/sched/core.c:9124)
[  +0.000014]  cpus_read_lock (./include/linux/percpu-rwsem.h:51 ./include/linux/percpu-rwsem.h:77 kernel/cpu.c:490)
[  +0.000013]  static_key_enable (kernel/jump_label.c:222)
[  +0.000016]  enable_sched_clock_irqtime (kernel/sched/cputime.c:33)
[  +0.000014]  sched_clock_register (kernel/time/sched_clock.c:243)
[  +0.000014]  mtk_gpt_init (drivers/clocksource/timer-mediatek.c:338)
[  +0.000014]  mtk_timer_probe (drivers/clocksource/timer-mediatek.c:356)
[  +0.000014]  platform_probe (drivers/base/platform.c:1508)
[  +0.000012]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:707)
[  +0.000014]  __driver_probe_device (drivers/base/dd.c:869)
[  +0.000014]  driver_probe_device (drivers/base/dd.c:899)
[  +0.000014]  __driver_attach (drivers/base/dd.c:1300)
[  +0.000014]  bus_for_each_dev (drivers/base/bus.c:383)
[  +0.000013]  driver_attach (drivers/base/dd.c:1318)
[  +0.000013]  bus_add_driver (drivers/base/bus.c:782)
[  +0.000013]  driver_register (drivers/base/driver.c:174)
[  +0.000014]  __platform_driver_register (drivers/base/platform.c:996)
[  +0.000016]  mtk_timer_driver_init (drivers/clocksource/timer-mediatek.c:372)
[  +0.000017]  do_one_initcall (init/main.c:1419)
[  +0.000015]  do_initcall_level (init/main.c:1481)
[  +0.000014]  do_initcalls (init/main.c:1497)
[  +0.000012]  do_basic_setup (init/main.c:1517)
[  +0.000013]  kernel_init_freeable (init/main.c:1732)
[  +0.000013]  kernel_init (init/main.c:1622)
[  +0.000014]  ret_from_fork (arch/arm64/kernel/entry.S:870)

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/clocksource/timer-mediatek.c | 36 ++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index e20075b09fab..a9e7ff6908a3 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static void
> -__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
> +static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
>  {
>  	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
>  	       timer_of_base(to) + GPT_CTRL_REG(timer));
> @@ -281,7 +283,7 @@ static struct timer_of to = {
>  	},
>  };
>  
> -static int __init mtk_syst_init(struct device_node *node)
> +static int mtk_syst_init(struct device_node *node)
>  {
>  	int ret;
>  
> @@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> -TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
> -TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> -- 
> 2.43.0
> 
