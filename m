Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865406;
	b=lXsaHDFP7Li9i3uYmSGpESkU539hGH8NZ98hAd+mPkHg4/LA3tNx0s/nVUv0n6MCNwHe
	 zBapItfSuBoB+8rdjRXzB9FfoVvm4I+GuQipY2xUG4t9SiwhF2N5+59w+rqew4/jDJAYn
	 hiSLM+6xLJmIX56FKkM7kmRKPZj5hetKNWwjVAmMavuRVKLFPsxzCcSiLDKTO+qQDjIuP
	 y5i8odO4YNS8GZF0SdYqHqG1QXc3c3TMnDkVXequBPphG3mU8K+zO6TpCG5LyQ+dtJpQs
	 nr8dvNu76RL+J9AGIQEC0V6etol8mRhmSvUtfpbFdDGpcioxoDk2aJo44jfKa3AG7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
	b=PrTKJgp6oAuXEXdQ1v6qfT1IRrUEc+Mgd2MqPI9Dc6iwPcC/fpCeIm3j8pqR+Jg4Q9bt
	 So+6T7/4oR2JQnAPRL3k8U+frnoLH06Bl+wyZYXCLRYk2WzTlYo5Vfky5zRg0yLp4nnpf
	 68u738ULiXrXwdtfcmKtyCRWhCG67q3GSGkRCXxsPUNLwYUB5pvCheylJrrDMOI6b/EyG
	 xlmOXPK8yMkbORLFnJ6Gc8csttDeRAGctolGe809+GT5HyVwgYLNWIgtlul1YrQkJ2O73
	 YlZ1VplkOYTwmqEuZ2I1kAimEpZ4wxEgebnQrhKX656Waq0l+sFFMXfVar+2somWfWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGT83oNM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBED606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGT83oNM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb606491faso13585585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865404; x=1795470204; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
        b=SGT83oNMPaSWmbN8kB43XYA2l7Gx0Zoh5XE8726L0a0uF4yORuIKc0fKmsDvtrrEY4
         oHOZ7evPFMxjaPYIvSfzAfNhyTS8Yurd6qO0bICNhVFOHiJuQTiEs+nIMU3HPg2acB0A
         h5hreRzE8OsJvQWYm5IBuW86mZDd3k1LAMazE+q3TDae0+/mlUI8dCu/++MLhswzMT+I
         JlHRUBT8LZveeEH4rFyfLzMm2bi7FWYkVMy7S0D2Z72ZijcvZfECfqhE3rO4jyPajzSe
         80XRXGtphkwjEaUbPgJkRktrVAHCAB8rAUb5VHCS/KxsNAxEzZKXuEGPlyf8OGVwZ/AL
         L1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865404; x=1795470204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
        b=wIYFlufTRAw6Ki+njfT+6J2ieBKebZ0WeYWIiQfMHBqZqBAmfqT3EBJnBnXJ4jmuFy
         KLpqfbKF9TWSMxzLE+jBjw3b348pUm+jfsVqHenosz+sGDNzbfCcmTwHfkhfXMRPE8oR
         wBO1SDDmHKisZ4wnJFZcPn39du+daxTBctP9i/2eHlzGHNUOsYWM9OvZWfzVdNaaAOXi
         q3TiIdT2CuK/6BJbXVghKyViX9mmvRk+QYmFbQfyEVh6SIytz2+of5STXJ2fgcGiCU+Y
         jvIvu77EG92oLZukQvgU5/AfUT9T839tryT86K9uVSt54qkCO2bN0rG+ulVmcXBKDzEl
         7Q4w==
X-Forwarded-Encrypted: i=1; AL+hErE3kWqv1G5ABwWP27HJwfcLx7F7LORvLduf1mPOcTwXRkvX0FAutIGefw3ilAy+g3RKFC7MY8B2mvx0on4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LyH8gEGEgFJ7td0uASMQSuruoO8sJZ2nCTec8LXvOsjwb2EXu
	6y5i++ARivnyP0dX+rh0qlTYG9n3iUrAEMmO1/PUwYf2kwk7PdxthzgdvSLRQiPCNFU=
X-Gm-Gg: AYBFou3b6hhbJUkM4Mhm1KcDf6jJyWaIP1m+AoWs37T6ZjLdzAdR9dp72cb/izRj/wO
	Wup7hMmdOabcRe1WQXxt10IH9cWd5fccUgeI09bRJnYPhAGwejb5Yif1XCyqJWnBNMMk5G0NrbW
	4vpPB9pyDPLejeZkzZlwH+x/Rp22O/YnnsjPzzdgRX+Z5VRgrRtmhnWlBR61nu5vYOIIqYFXddL
	7nvZqmoJzomlS3OYcuhInUIuLJQ+eRjmff8D70UU85vdgEJIKNtXTC3txtRQs96IzUU8pNwzmHD
	1R6WkHDSCFydzD6e3p+TSZGTdqrz/rQiGeQ3fYEA0oZZCs8+0HjJy9lZCsU0MVh6sA1bUDsZZ+C
	RzjbFB9Iz1mTy4wGDtRxmDrjFPZ5R8IbpQmKBCUgXiZIqusHcn90TMwnh4Y390nBmJBx7YC5/ve
	ZRQGDZIN4KTKr8uW9T6BBLb0bmO9xVVB7IgwjINOlcnLAT6sxt4mWhXSLOHGjM2Ns9bycF+UXdW
	vrPjImxI2BNVMrmQZw9qXT2Fm9wEcNSV+/A4U6swrIYfVQlQMGUdDnjKE3a+/Ipm3Uxv+xQ30rh
	M3anOB0TZJgarnUEUp2T4QfIe4f+fuGMy1vpz4RkcuMuYqUtLvZnx/ayPciEqPaj9vgt5jD7vE9
	A+TpafwdDv+cbCjmdA38raE8eS8e2J+WhOQg=
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr243466415e9.2.1794865403930;
        Mon, 16 Nov 2026 13:43:23 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm18136285e9.4.2026.11.16.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:43:23 -0800 (PST)
Date: Mon, 16 Nov 2026 23:43:22 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <vj5f2zj4fpqp7qaztfp3e5elec44pih3pjqsnkmyhv4js3vxid@naaggpvburqc>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <179479577764.3136.18033299607451586926@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179479577764.3136.18033299607451586926@kernel.org>

On 16 Nov 02:22, netdev-bot+sashiko@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issue(s) to consider.
>
>Critical: 0 · High: 0 (2) · Medium: 1 · Low: 1
>
>If you believe none of the issues are legitimate, please reply to each
>issue of Medium severity or higher and explain why the AI is wrong.
>If any of them are legitimate and you plan to respin, please let patchwork
>know by including "pw-bot: cr" as a separate line at the end of your reply
>(one such reply per series is enough).
>
>- [Medium] The patch uses `budget_left > 0` in spl2sw_rx_poll() as the
>  only sign that all work is done.
>- [Low] The commit message says what changes but not what goes wrong
>  today.
>
>Pre-existing issues:
>- [High] This problem wasn't introduced by this patch, but
>  spl2sw_remove() frees the descriptor rings and buffers before it…
>- [High] This problem wasn't introduced by this patch, but
>  spl2sw_rx_poll() leaves a broken ring slot behind when it fails to…
>
>--
>
>net: ethernet: sunplus: check budget before calling napi_complete_done()
>
>This commit replaces napi_complete() with napi_complete_done() in the
>spl2sw RX and TX poll functions. NAPI is only completed when budget_left
>is greater than zero. The RX/TX interrupt is only unmasked when
>napi_complete_done() returns true.
>
>> Sunplus drivers currently do napi_complete() after each rx/tx poll is
>> done without checking whether budget was exhausted or not. Interrupts
>> are also unmasked before the call to napi_complete().
>
>[Severity: Low]
>Can the budget actually be exhausted here in normal operation?
>
>spl2sw_probe() registers both NAPI instances with netif_napi_add(), so
>they use NAPI_POLL_WEIGHT (64). spl2sw_rx_poll() handles at most
>rx_desc_num[0] + rx_desc_num[1] = 32 descriptors per call, because the
>inner loop is bounded by num < rx_count. spl2sw_tx_poll() holds tx_lock
>and reclaims at most TX_DESC_NUM = 16 descriptors.
>
>That means budget_left is always > 0 for polls from net_rx_action(). The
>new check only changes anything for budget 0 (netpoll's poll_one_napi())
>or a small busy-poll budget.
>
>In those cases the old napi_complete() already did nothing, because
>napi_complete_done() returns false right away when NAPIF_STATE_NPSVC or
>NAPIF_STATE_IN_BUSY_POLL is set. The only visible effect of the old code
>was that MAC_INT_RX/MAC_INT_TX got unmasked while netpoll or busy-poll
>owned the instance.

Netpoll can invoke napi->poll() with budget = 0. In that case,
napi_complete() already returns false because NAPI_STATE_NPSVC is set.
However, the old code ignores its return value and unconditionally
unmasks interrupts.

This patch avoids calling completion with a zero budget and moves
interrupt unmasking after napi_complete_done(), making it conditional
on successful completion, as documented.

>
>Could the commit message describe that actual impact, so the Fixes: tag
>and a stable backport can be judged?
>
>> I do not have the hardware necessary, this patch is not tested on real
>> hardware.
>
>This note is in the commit body rather than below the --- line, so it
>would end up in git history.

Shouldn't it? Documentation/process/maintainer-netdev.rst, under “Bug fixes”, 
requires describing how the fix was tested. I included the lack of hardware
testing in the commit message to make it explicit that it has not been
tested on hardware.

>
>> diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
>> index a37c9a4c281f0..1aada11429d4d 100644
>> --- a/drivers/net/ethernet/sunplus/spl2sw_int.c
>> +++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
>> @@ -125,13 +125,14 @@ int spl2sw_rx_poll(struct napi_struct *napi, int budget)
>>  			h_desc = comm->rx_desc[queue] + rx_pos;
>>  	}
>>
>> -	spin_lock_irqsave(&comm->int_mask_lock, flags);
>> -	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
>> -	mask &= ~MAC_INT_RX;
>> -	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
>> -	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
>> +	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
>
>[Severity: Medium]
>Is budget_left > 0 enough to show that all RX work is done? Normal polls
>never bring it to 0, but spl2sw_rx_poll() can still stop while completed
>descriptors are pending.
>
>The first case is the high-priority early break in the low-priority loop:
>
>			if (queue == 1 && !(h_desc->cmd1 & RXD_OWN))
>				break;
>
>queue 1 is the last queue (RX_DESC_QUEUE_NUM == 2), so this goes straight
>to the completion check while new high-priority packets are waiting.
>
>The second case is a queue's inner loop stopping at the ring limit:
>
>		for (num = 0; num < rx_count && budget_left; num++) {
>
>Descriptors given back with RXD_OWN earlier in the loop may already have
>been refilled by the hardware.
>
>In both cases the poll returns less than budget, calls
>napi_complete_done() and clears MAC_INT_RX in L2SW_SW_INT_MASK_0 while
>work is still pending. Documentation/networking/napi.rst says a poll with
>outstanding work should return exactly budget and not complete.
>
>The cost depends on whether L2SW_SW_INT_STATUS_0 latches RX events while
>masked. If it does, this costs an extra interrupt round-trip. If it
>doesn't, the pending packets wait for the next RX event.
>
>Would it work better to track these more-work conditions explicitly and
>return budget in those cases, instead of relying on budget_left alone?

Agreed. This seems to be a separate issue, the old version also did call
the napi_complete(), even if the work was not 'done'. To fix this, the
solution could be to iterate while budget_left > 0 and one of the queues
has packets to process, but this does seem like a big change that should
not be done by me as I can't test it properly.

>Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114222744.535158-1-janislacis06%40gmail.com
