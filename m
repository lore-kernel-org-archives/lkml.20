Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227737;
	b=27gTfoGsUckYRRR3Warm8YikxFND3LeraQyA1zJDm0dhef/THL+9GByaVC/qMbPEkZ/D
	 PrgCQ9aa3N6LAP9xhNAvT0udpFr6DwkmqkOEQG3F8fc9wZQFHYNL67roMhHl5IbdT3WT3
	 9lmZZAygofH/QtXtEYyHN3cvzL2bBE4asA3qkOcb/MGsmE6Z/zTikLYQn+EE6ZlESdM3U
	 tuGPyZFDKawE/rO/HoU8IEkvk/P7USsaDhcyK/D6sM2Be9aFhprC3MiI5gluFC4ASssv3
	 BRpLoNP6+dl3Zd8+taIXzm1kWcOeNeCiCyJrIAlT7gRIjTBcW4zbbde3eh0k8wsCaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227737;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ezlQIpBeCLKp3BblnMdViA21cKifwksyw0/26Kc1RZI=;
	b=eoZvJIea0p/PYkrYJlSaHfwX3ZdRhzK0Lg3XsyI4tGQw6e+JN7j+Rbs7qfNFptoaHdoE
	 JIIb4h7/2aM56fQ5cUUPd6GCs2fu/nMDyvleX9NRMa1AH8Xf8k2ILKekZ8gj+dE1wmcV0
	 89Z2t9qXfMa0R09mozdu+tZR0BO0cCFLM+z4GNKoRCHKQSSOOdvG0mtlrCv5nfOn318UZ
	 5N9/6JZifGTuU19JyhSmGpPBKti1n/1/6WLvKoVZ1FLxi9hfzLJSxbLbAHB7OrORhyP8K
	 ovo7Bzi1rbjOfXZIgVw1E26E4IBXP/uijOEHtxipFdCnCzN+zxmy0N5H7l1D5UNa5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GaB8fV1b;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918E606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B918E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GaB8fV1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794227734;
	bh=uz6Pxf5P1OBQ1OuxMZ+mpEwGfimAtMPaXnOF09sKZoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GaB8fV1byCSC9EYTiwgvgZwhDJLwctYNUTvoOHmIWggOil37/GIKZPA4bDmSiD+r0
	 NakpRnw2P2aP0m/dW2BRc2bEUKMJCwYtXkGCc43pNfdZtp6k3H8oz1kDGJxpqaemiA
	 Ukk6H7yKGtL1Jjw7AY/RLhL8ZyTo+tiW/O1vl4zok85PGzWdsNXLx4TmscyQKCSG00
	 4z345XE6XdYIlhQe7FfGCXWsTR1dsLaonEdKK63OAOss6Orb7qjaYEEWbgt/lBmU3n
	 otvWPS4nm3IGY2KU+H/2FlhtMZH3T0V1Y91pK01Ldt6FhvIRa7sSdQjVYikSLo3mkU
	 D6o1Z+iFXOS8w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E5C317E0390;
	Mon, 09 Nov 2026 13:35:34 +0100 (CET)
Message-ID: <379c2b3d-ab98-4b58-86fe-da2276ede617@collabora.com>
Date: Mon, 9 Nov 2026 13:35:33 +0100
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
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Chen-Yu Tsai <wenst@chromium.org>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
 <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 10:54, Chen-Yu Tsai wrote:
> On Wed, Nov 4, 2026 at 8:18 AM Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>>
>> Since the driver probes as a platform device, the GPT clock event is
>> registered late in boot, when PSCI CPU idle may already have put CPUs
>> into a state that stops their local timer. Those CPUs wait in the
>> oneshot broadcast mask on the hrtimer broadcast, and
>> tick_install_broadcast_device() arms the new broadcast device to expire
>> at once so that it wakes them.
>>
>> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
>> clockevents_config_and_register(). The forced event fires while the bit
>> is clear, nothing is latched in the status register, and the waiting
>> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
>> state in use, this hung the boot in 20 of 40 boots, and in none of 16
>> with this change.
>>
>> Enable the interrupt before registering the clock event. The IRQ line
>> stays disabled until enable_irq(), so the handler still can't run before
>> the clock event is set up.
>>
>> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> 
> This seems to have fixed the cpuidle related stalls I was seeing. I
> didn't do that many rounds of boot tests though.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> I do think we should expedite this into the kernel, as a 50% chance
> of stalling is not great. It was even higher for me and somehow I
> had to do a hard power cycle by rebooting the EC to get it unstuck.
> 

Agreed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>> ---
>> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
>> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
>> broadcast device is armed at once to wake CPUs that are already idle,
>> and that event is lost because the GPT's interrupt is enabled only after
>> registration. Traced on the board with prints in
>> tick_install_broadcast_device() and mtk_gpt_init().
>> ---
>>   drivers/clocksource/timer-mediatek.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
>> index 842d6ee4259e..1b2cbcc2795a 100644
>> --- a/drivers/clocksource/timer-mediatek.c
>> +++ b/drivers/clocksource/timer-mediatek.c
>> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
>>
>>          /* Configure clock event */
>>          mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
>> +       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>>          clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>>                                          TIMER_SYNC_TICKS, 0xffffffff);
>>
>> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>>          enable_irq(timer_of_irq(&to));
>>
>>          return 0;
>>
>> ---
>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
>>
>> Best regards,
>> --
>> Ryan Brue <ryanbrue.dev@gmail.com>
>>
>>
