Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295126;
	b=n+kSqCAuduzrm8YeKA47oRBTaTVs7BZ5ud1tt9RRdxGkLtnsc/HHUauZsFWI9/e1fgjZ
	 cjPhdBELSW49UpSKAXi5AlLQiP7IV9BUBCCMQHggiuuST5l3ylYMIbTosJXFjiocu4hHp
	 khZEFaTwQ0LslX4WsVUdDTk9U79a9hrxRreHIo1nngyfV8EfbuMnZaZMnVslyFjMHe0Gb
	 Arq+alNUdHSs95p+Ih2OOt5Tv1BE9jH3l81ZZmLHwGdnPxtRUqcAyCYhi0gUhK4jAeJ7p
	 ZK12U6+pEn/NwqQZCIJCV9QEQXCxdtuxXMaooXAf4FgdlFeC1YHeJbFAthyyVZQvlHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sJUAf6MVr1LbNiZAzeVxjzmF9d4A7eRpwOmFm8HYo3Q=;
	b=wu+L7YGgaLP00Feo3rejZ9x0Fc9+KUrnbsf8Y3q+iG5Onwd2SjQXt4rD/gCrVAoQoiCP
	 UoXt0rNkjQe7tdkDb2hk37YkG+hb6oKw3zsAh7MKoBriZZcnNGtNHcSS0xk96bKrva7e7
	 wvcKetgsM2pA+Te8jOezkHnWqDudGpMVzwsbkfT0hCSoJZ/Sg/d8FlUiT1p4yu6gxW5/q
	 b/cOz2uab2n5as9WHzhG+zP1A/NtbX8gmJhkCc6e+eOaAZh2tGjS6nOuZpPEL4aX6eOpT
	 oaxwfjeCUqVvikLk4TJMIkoia7oEsbyXmnUcPbIfAxegrfrMRsgwEA6HmDhRayw/KmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIfl5Mng;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A254C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bIfl5Mng
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso505965a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295125; x=1793899925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJUAf6MVr1LbNiZAzeVxjzmF9d4A7eRpwOmFm8HYo3Q=;
        b=bIfl5Mng4gxdWhKRNbpO9PWQD5tYmo4ekW5FpajJY6vrOLHsttzxE2pBRa5VTCnNZZ
         Wy+pdzF9/Je31rbXglJaxsH8GFfZDEwven5S0gX4EhfrdXEhcE4JGauA8uJj8/cIE2f9
         buCJIKayt5qZwaf0UPsEYF/q6rgFiajroXsDlpgq/pKu3+mdsZW8A8Ev0GHGd4WTxfou
         Sl7oV2AhZ31umOlPAECE59aVzLNr5d4n/hsocEmVa/TjwuYr65xVw0c3wEEsV6baKgpu
         CLYU3FObwKvjUO36KlquZv1ukqpTnwdJnylqnvGdDwi88Amn1JBjhQnDXd51ckhSfdQh
         6LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295125; x=1793899925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJUAf6MVr1LbNiZAzeVxjzmF9d4A7eRpwOmFm8HYo3Q=;
        b=eNevnuK78k4sheoTSihXw0c9RuqYU8UEH8ohY8L1ePFboE6DqmIZTwnUwQWYBR4PHP
         7UgzJ4W7jqZK+hEZ8MYwvlUb1hqbXzgPJG6NlQxF9OWuquFThQKwt6gZGRrOIZF5b4lC
         Re33Voa3nA3CZnKdMRZ0fZgL4s9wo4fH5VYAEj3eNOIz8WXKYMbnyHbfHq8T90ftqvPr
         5PIISIyKxcEwQMF4YiNR9nJil7uQrNZxWRVL1WbVbRCK07/LypOZ2vJqyZJ1VZmn+xb7
         xUzjz7Cq7MIqj8+bvbBaQ5YUYK584yE3Q/VGHcLWvg6JqMeb9I+j97L8QukjCK6cKyPg
         hHMw==
X-Forwarded-Encrypted: i=1; AKwUvBwCmWLvAKUvuN41BK89oOZJfI2TQj3vjnaWNLs2SRlfkTMSt5p3CoRHRyxIVPu0PsXQ6YoSOGDyUbIbxwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLl9tBk3ZGcw+dIFb2gV8wB6wptlZmgi7GpZBLLYjEfa/jqu1k
	g48ngrC2z4OXWZ0RkBBp+nsYYscFCXGGOoYBjx4zPHGRMqD4XEUBDvPi
X-Gm-Gg: AYBFou2IDXMviKe+PPy18XcuiTse9cj3fkeUfvQX73GYaaWLOGLco66I7dryJbwP5rv
	3016hypVrCNx6kSIFaYRzcqfRiYjcSKWf3LEXWbu2WLSua4+WKDD8+X+NWlOfnfMFbeuu1DNvTp
	ciJzohIiCZXcAWHodEmYXS5ejQHTsilAuP+vB/17LYYFwzNss/KcYy/yNVnJnf4eIDMm3wEXhiZ
	myfQ4hr2cQ6EGbRegMAfL7kOqTtg3l6VPCyqm2aSynhFxODUUl/zlFLY+VhPjKy7tGJ6Q3T1pve
	ic2uQ1d2M78VSadVca1Z+0XEUX1fIg4NomaQS1dO7AWYum+tngOynpGWoVPuQxmGSnJqHr9zcIL
	NZtuJ9BvM2kVfq+vWTPnp3vQeQA7BKtsKj3G2QT7/Q+Ns+WyHqX1aa1qUM6unSUuDo0DYcG6hhH
	DvuxbyTmYX5ICyLukmPeTxrqRruBLOd7BcfFK2L6ReEHIUZ0csrRUsg40Afxs0eng6c3Tw2aldV
	jum0hgYh15ihYX9PiuAcf5ipxDSSq5rzMkGsamt55cQGFQxQWz50EuDaneeOFIGD1oQXG+Qwpjz
	RhBEoZSFr7kf7QAAPRnEMyqC8++DXVqrUSR9gbP9PXZoMmKo/PARwZr2
X-Received: by 2002:a17:90b:2e41:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3ae582eff88mr4604989a91.62.1793295124834;
        Thu, 29 Oct 2026 10:32:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm539049a91.2.2026.10.29.10.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:32:03 -0700 (PDT)
Message-ID: <e244d83b-6342-407d-9714-3c9140760d7f@gmail.com>
Date: Thu, 29 Oct 2026 10:32:00 -0700
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
Subject: Re: [PATCH net 05/11] net: au1000: serialize TX completion with
 packet submission
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261027223140.3774570-6-f.fainelli@gmail.com>
 <179329051390.3134.18192194876316281231@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179329051390.3134.18192194876316281231@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/26 09:15, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 (1) · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] au1000_tx() in drivers/net/ethernet/amd/au1000_eth.c now frees
>    the skb with hardware IRQs disabled.
> - [Medium] After this patch, au1000_tx()'s inline reclaim path leaves
>    aup->tx_tail permanently out of step with the hardware.
> 
> Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but
>    au1000_tx() copies skb->len bytes into a fixed MAX_BUF_SIZE…
> 
> --
> 
> net: au1000: serialize TX completion with packet submission
> 
> This commit takes the existing IRQ-safe aup->lock in both au1000_tx_ack()
> and au1000_tx(). The goal is to serialize TX descriptor reclamation in hard
> IRQ context with packet submission in ndo_start_xmit. It also closes a
> missed-wakeup window between netif_stop_queue() and setting tx_full.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index a507a524370fd..90887dac26bc9 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -973,17 +977,20 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>>   	u32 buff_stat;
>>   	struct db_dest *pDB;
>>   	int i;
>> +	unsigned long flags;
>>   
>>   	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
>>   				(unsigned)aup, skb->len,
>>   				skb->data, aup->tx_head);
>>   
>> +	spin_lock_irqsave(&aup->lock, flags);
>>   	ptxd = aup->tx_dma_ring[aup->tx_head];
>>   	buff_stat = ptxd->buff_stat;
>>   	if (buff_stat & TX_DMA_ENABLE) {
>>   		/* We've wrapped around and the transmitter is still busy */
>>   		netif_stop_queue(dev);
>>   		aup->tx_full = 1;
>> +		spin_unlock_irqrestore(&aup->lock, flags);
>>   		return NETDEV_TX_BUSY;
>>   	} else if (buff_stat & TX_T_DONE) {
>>   		au1000_update_tx_stats(dev, ptxd->status);
> 
> [Severity: Medium]
> 
> Now that the lock is held here, can this inline reclaim leave aup->tx_tail
> permanently out of step with the hardware?
> 
> If desc[tx_head] has TX_T_DONE set at this point, the ring is full
> (tx_head == tx_tail) and the oldest buffer has just completed. This branch
> updates stats and zeroes len. Later in au1000_tx() the code re-arms the
> descriptor, which clears the done bit, and advances tx_head:
> 
> 	ptxd->buff_stat = lower_32_bits(pDB->dma_addr) | TX_DMA_ENABLE;
> 	...
> 	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
> 
> tx_tail is never advanced on this path.
> 
> Before this patch, on the uniprocessor Au1x00, the pending MAC DMA
> interrupt could run au1000_tx_ack() before the re-arm and move tx_tail
> forward. Now the ISR is held off until spin_unlock_irqrestore(). At that
> point au1000_tx_ack() finds desc[tx_tail] re-armed with no done bit:
> 
> 	while (ptxd->buff_stat & TX_T_DONE) {
> 
> So it returns without moving tx_tail, which now points at the newest
> submitted descriptor.
> 
> au1000_init() sets tx_head from the hardware's own buffer index, so the
> hardware completes descriptors in index order and that newest descriptor
> completes last. Wouldn't that leave the TX_T_DONE bits of older completed
> descriptors unacknowledged until then?
> 
> It would also delay netif_wake_queue() in au1000_tx_ack() until the whole
> 4-entry ring drains, rather than after one completion. The offset would
> then persist until au1000_init() resets head and tail.
> 
> The same thing can happen when au1000_tx() is called with IRQs already
> disabled, for example from netpoll.
> 
> The MAC DMA interrupt is IRQ_TYPE_LEVEL_HIGH, and au1000_interrupt() always
> returns IRQ_RETVAL(1). If unacknowledged done bits keep the line asserted,
> could this become an interrupt storm? That part depends on hardware
> behaviour that has not been confirmed.
> 
> [ ... ]
> 
> [Severity: Critical]
> 
> This is a pre-existing issue, not one introduced by this patch.
> au1000_tx() copies skb->len bytes into a fixed MAX_BUF_SIZE (2048 byte)
> bounce buffer without checking the length:
> 
> 	pDB = aup->tx_db_inuse[aup->tx_head];
> 	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
> 
> Can skb->len be larger than 2048 here? When po->vnet_hdr_sz is nonzero,
> tpacket_snd() in net/packet/af_packet.c skips both MTU checks:
> 
> 	if ((size_max > dev->mtu + reserve + VLAN_HLEN) && !vnet_hdr_sz)
> 		size_max = dev->mtu + reserve + VLAN_HLEN;
> 	...
> 		if (likely(tp_len >= 0) &&
> 		    tp_len > dev->mtu + reserve &&
> 		    !vnet_hdr_sz &&
> 		    !packet_extra_vlan_len_allowed(dev, skb))
> 
> An all-zero virtio_net_hdr (GSO_NONE, no NEEDS_CSUM) is accepted without
> making the skb GSO. validate_xmit_skb() then only linearizes it, because
> au1000 does not advertise NETIF_F_SG, and applies no MTU check.
> 
> With CAP_NET_RAW, this path could deliver a multi-kilobyte skb to
> au1000_tx():
> 
> socket(AF_PACKET, SOCK_RAW)
>    setsockopt(PACKET_VNET_HDR)
>    setsockopt(PACKET_TX_RING) with tp_frame_size > 2048
>    tpacket_snd()
>      packet_xmit()
>        validate_xmit_skb()
>          au1000_tx()
>            skb_copy_from_linear_data(..., skb->len)
> 
> au1000_probe() allocates a single 16 KiB region with dma_alloc_coherent().
> The TX buffers are at offsets 0-8K and the RX buffers at 8-16K. Would an
> oversized frame overwrite the neighbouring TX/RX DMA buffers? Beyond about
> 10 KiB, would it write past the end of the coherent allocation?
> 
> Should au1000_tx() drop frames larger than MAX_BUF_SIZE?
> 
>> @@ -1012,6 +1019,7 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>>   	wmb(); /* drain writebuffer */
>>   	dev_kfree_skb(skb);
>>   	aup->tx_head = (aup->tx_head + 1) & (NUM_TX_DMA - 1);
>> +	spin_unlock_irqrestore(&aup->lock, flags);
>>   	return NETDEV_TX_OK;
>>   }
> 
> [Severity: Medium]
> 
> With the new spin_lock_irqsave() in au1000_tx(), dev_kfree_skb(skb) now
> runs with hard IRQs disabled. dev_kfree_skb() is just consume_skb():
> 
> include/linux/skbuff.h:
> #define dev_kfree_skb(a)	consume_skb(a)
> 
> include/linux/netdevice.h says:
> 
>   * It is not allowed to call kfree_skb() or consume_skb() from hardware
>   * interrupt context or with hardware interrupts being disabled.
>   * (in_hardirq() || irqs_disabled())
> 
> Does this mean every transmitted packet now runs its skb destructors with
> IRQs off? That includes sock_wfree()/tcp_wfree(), zerocopy ubuf callbacks,
> and dst and conntrack puts.
> 
> If any of those reach local_bh_enable(), lockdep_assert_irqs_enabled()
> would fire. With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() could also
> turn IRQs back on inside the aup->lock section, which would reopen the
> race this patch is closing.
> 
> The data has already been copied into pDB->vaddr. Could the free move
> after spin_unlock_irqrestore(), or use dev_consume_skb_any() instead?
> 

Agreed on both medium findings. I’ll advance tx_tail during inline 
reclaim and move SKB consumption after unlocking, using 
dev_consume_skb_any() for callers entering with IRQs disabled.

I’ll also add a separate fix rejecting oversized frames before the 
bounce-buffer copy. The possible interrupt storm remains unconfirmed.

pw-bot: cr
-- 
Florian
