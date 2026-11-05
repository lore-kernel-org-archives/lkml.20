Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870481;
	b=j8hwMA2Qqoh8Fu1EyAXyJIVlznkRHyNuDYGLInZRjRC77QPVYHNc8CyfRvM2Vj0Nhyjz
	 zpdDIeVQfe7pFobKd9PmYUqup8vpSXMaISOQ/sjyAGKgoQuXTZEZi38WZrDN10codFFHK
	 sNek0t/oY1RXAsL5MwJSnP/sg+aPr3MjNsmXzuCw8kGngVkMb9h1JFA9qv/uFQecaK3i0
	 AoC+nR+Uya51duQk61dMg5OwJMJ/iYz+ahoet4CmG3PEP7hyodvMwK/YD9mRWoDSRH6PO
	 TaXkCYjMZdeyMJxn3Dov7Dd1Gn+ORmA+cLankJyAkqzh5VE7E70WlVA1TQr9adiuCnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870481;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=coFe23yWIjr3rWL1bT0oW9dpEwkMZ8FlItLtkhGEJxY=;
	b=I+5qDYDaA2MKrN/KX3Q5cvYWN+F7eOBfaEinJCRHho7kAo6QlAMFvru7qubnvywmIXtC
	 M8ccYsOZH2/0aXEPirozdB4YxLCjGAgSZ0tsEjvtYOl5wGiiV/EaSuqzLCPfoDqe73mu1
	 v3FeNDC6qYHeJ1W0qsdR5Fzw9s6RLO1I3tTkZEnuTMYddwrUiW20SSWrm0N2H0NNkmJaG
	 A4pQjmrJaEiv2uGwDCIPv+iGXlc0hKBLwTibLifE0QNwEbKYrNUOKLevRbmbxjROA1ohb
	 We0VUoxqmHZ3yGmxAy84Q8t8d6XsZpYpl3AxOFfy2eP288d6seHEHSNEhpsCb0MdXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijxnfrgv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zgt1TAG9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD23606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD23606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ijxnfrgv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zgt1TAG9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793870480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=coFe23yWIjr3rWL1bT0oW9dpEwkMZ8FlItLtkhGEJxY=;
	b=ijxnfrgv0vZ+XW6bijfUPiirW5amvIHeDcBku0SPLjT7cfggcff/fvAbjD5aq/L7k8lUci
	PxMvbzhm0nxEOXXeTlmZEAJHCh0BpzRQBpM2Puuo8h5Vol4ocHk7ax89sSgN7Ejdt5JsuS
	UKBhx1KweYWbDfJ3HSDAC8O/u9WBnPQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-F2rbOIkINt2prZ4AO4IlBA-1; Thu, 05 Nov 2026 04:21:19 -0500
X-MC-Unique: F2rbOIkINt2prZ4AO4IlBA-1
X-Mimecast-MFC-AGG-ID: F2rbOIkINt2prZ4AO4IlBA_1793870477
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so13434845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793870477; x=1794475277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coFe23yWIjr3rWL1bT0oW9dpEwkMZ8FlItLtkhGEJxY=;
        b=Zgt1TAG9YOfsnRZRQzHKoGDecqL7ZTki+5Gszt8Yypo4/ZGNAbLZe1nqc1HL4Yq/ov
         dJbFK/ipbkgZc42gdMN40JQ8cBH93hiAQGEMXwLyLh0c8597l/NI1CZSNRcmZeB8cAv+
         eq4BYLd8RtKE/MYCGKGMJCgq9LqEsyWH3h1Emd/cPESvicJDM8AJkKqTuqWCaF1Qb+qp
         nPArat/cz+Xb8DXv2FJZoE9x05rT9DxHZKVIkAIYFfGT42Qe1CjKpi1zZN6MoMNOfXlA
         /dZUx0ZR0+/PQ4FyIv1d4K5GnGg9i86dX34/sDS/mXP1yIzm3V0FNuMm4xlr4EcXSore
         zhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870477; x=1794475277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coFe23yWIjr3rWL1bT0oW9dpEwkMZ8FlItLtkhGEJxY=;
        b=qeXNFZTHNO/lWijVaKIL6x/3IeiaGY0WmSJmzB14XfM1JQPn3s6BFxv6mgiS3HtV44
         7zrczuOBjNW7roViawUmcvVA+xdFJI2TZtcMxZEa8lS3RLy5dn22OL5hiPBnY0gtj5pY
         sVIoDEmaOBMlZA7hA08nwnAVC/W81Lk7c+dDZJYkPcb6v7zxP3ektvXL7gWu+I+xCh0T
         nQcPSKyqjPlDdxQ281kFJOdS+3MzXqlTaXhiptCOiWVs9PXvqB90ZLDHc1wjiAbsS+lj
         YXsRbRuG1RfjF3jLxYne4FZqq57NFtCwYPP6FVBQ9+Fia9TXBheA18L7wfZRjmnB8B5K
         6dgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxITfhcDXGFPIpGijvvypkHUMhIdmLpm7hlmxMnuZzDHb4M08e01kKe4tnqeXcEV9/w+4grNXanns959TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dHbJILcYelEa0a8KXJWxY/uMF4UjLvuvvIyDBG7fCQ8K4vRTO
	gWz8zK+ZfsNczEw39lLSSFtaxd4clPeFXg0koMg95CUmnsAyZLCSIxoYocBRkpoUfkmYs3QfEjK
	Sg8dgf1/xU8LW9z9Y9DynXN+UFsv0RTRFAo0Y/f6NPjRHZpaKqyBtg5P3m4l36QDOgQ==
X-Gm-Gg: AYBFou0KAeYVH1Nv1sW3IiBc25JPPOPDwY45+eqsbuNR8jojSc5ZjWkn++xZ2NGp2LK
	psuBFfF/bock63yg4+SEnepUebo7O8UiiFN2+8Aq6uvQo0X3wXtQeg2zclxicEzU/7L4l/eUhhf
	+8+9f5GcbWjtxY6iLOMUhwUrkPwegUmG75rAz9rE1bwB2Ltfxk5CARgeQz5VGHeDCW5ezF9D7Lj
	JziQjKSb7uOCJzgO6JSfy3OM6NscRWEBvAlXe1RSQh0QKVZDgRebrffkR/vKz8p7yYpEPguCZmD
	DwThoYC6FMGvzmGayfnoUJfRZ/XFHiOB7ySPaZHxfVJi3znPSYyXx+l8r+tPC9VAbfUFnEn/R7y
	MP2LvNiAfu4R+C+rFXE/IoZ1Zzl4FNNUtpleuTvfDJ/5sv+jVJZs9mR01PwIXyv5Us6il7zp1SK
	rysHx7/phE9WInP4XmiPuut86HYJVZWAdO/8qQP74iOgI=
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4ac15584c05mr425346785e9.2.1793870477362;
        Thu, 05 Nov 2026 01:21:17 -0800 (PST)
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4ac15584c05mr425346215e9.2.1793870476675;
        Thu, 05 Nov 2026 01:21:16 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99b33sm8317482f8f.23.2026.11.05.01.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:21:16 -0800 (PST)
Message-ID: <5abaf2a2-73b5-4400-a585-0955556a01a5@redhat.com>
Date: Thu, 5 Nov 2026 10:21:15 +0100
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
Subject: Re: [PATCH net v5 2/2] bonding: give a slave that starts UP a full
 arp_missed_max window
To: Ramses de Norre <ramses@well-founded.dev>, Jay Vosburgh
 <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jiri Bohac <jbohac@suse.cz>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Hangbin Liu <hangbin.liu@linux.dev>
References: <20261030-bonding-last-rx-v5-0-0b9b653f2f94@well-founded.dev>
 <20261030-bonding-last-rx-v5-2-0b9b653f2f94@well-founded.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261030-bonding-last-rx-v5-2-0b9b653f2f94@well-founded.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 15:51, Ramses de Norre wrote:
> The ARP monitor marks an UP slave DOWN once jiffies passes
> last_rx + arp_missed_max * arp_interval + arp_interval/2. bond_enslave()
> seeds last_rx one arp_interval (plus a tick) in the past, which brings
> the down deadline of a slave that starts UP forward by one interval
> compared to what arp_missed_max promises.
> 
> Active-backup mode hides this with a grace period after enslavement in
> bond_ab_arp_inspect(). Load-balance mode has no grace period after
> enslavement. With arp_missed_max=1 the deadline is half an interval
> after enslavement, and the first monitor run checks the slave before it
> sends the first probe. If that run lands in the second half of the
> interval, a healthy slave is reported "interface is now down" and comes
> back UP on the next run.
> 
> Seed a slave that starts UP with last_link_up instead, so it gets a full
> arp_missed_max window for its first reply. bond_arp_rcv() and
> bond_na_rcv() only trust ARPs seen on backup slaves once the active
> slave's last_rx is after its last_link_up. A seed equal to last_link_up
> keeps that check false until a real reply arrives, as it is today.
> 
> This only covers a slave enslaved while the ARP monitor is running.
> When the monitor starts later, from bond_open() or when arp_interval is
> set at runtime, the seed is still as old as the time since enslavement,
> as it was before this patch.
> 
> Fixes: 5944b5abd864 ("Bonding: add arp_missed_max option")
> Signed-off-by: Ramses de Norre <ramses@well-founded.dev>
> ---
>   drivers/net/bonding/bond_main.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 2f5638f4d3a78..84eafb607c370 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2158,9 +2158,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   		new_slave->last_rx = jiffies -
>   			(2 * msecs_to_jiffies(bond->params.arp_interval) + 1);
>   	} else {
> +		/* Give a slave that starts UP a full arp_missed_max window.
> +		 * Not seeding it later than last_link_up keeps bond_arp_rcv()
> +		 * from trusting ARPs on backup slaves before the active one
> +		 * got a reply.
> +		 */
>   		new_slave->last_link_up = jiffies;
> -		new_slave->last_rx = jiffies -
> -			(msecs_to_jiffies(bond->params.arp_interval) + 1);
> +		new_slave->last_rx = new_slave->last_link_up;
>   	}
>   	for (i = 0; i < BOND_MAX_ARP_TARGETS; i++)
>   		new_slave->target_last_arp_rx[i] = new_slave->last_rx;
> 

@Jay, @Hangbin: can you please have a look here?

Thanks!

Paolo

