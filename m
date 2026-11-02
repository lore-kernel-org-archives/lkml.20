Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621942;
	b=twAyoT8RSSc4pcIaLSoPi3HZlOa1rSKf0cL99SnktfHYzkfD4ZcrqGR2gw4Xq55Iy9fq
	 gA6cqu9mWxCzk+6ZSsw7T5jb1F3SHljuafSJz8GGe7QofRTLJRCDTgvlC/TgAZh5j6tW9
	 cIzhZWI9YFYmp//G1XKXSF3Wk+2XHA1YG6D7wRUMStcaXiR3E2Vw7u6MrJcyWz3IBP2XX
	 Vt8lsuoMjWkDWL33gNWe3+N81IUB6mT13f1j7DC0NAzHtQ5bhSfYkm8i7fehUdnQ1Vsc6
	 WRd3k97hbuC+eY/IcAuS0OLY3bB2SEbCyxG4/S76uLP9QQPN4auKuw38iMxaHRBruAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621942;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ezbpBo/Df5RXTILcrA43k0R/PKSOtGb0Z1SJrrOr0RY=;
	b=3pA0Jw05gVoqVJCx2rixP6/1eWmPrDma9imV7gR1HEXRdT6WngwBeu7LEUfCwsu+TNbY
	 N78gLX+n8MnhowpLv0ohQV4BPElqHnO+cHKSsqoTrmFDBUeJJBeDla6qFuSiIkTykRANC
	 hoifNMW6RTXoXeBCIC0ndY2Wd/e/AGyU6to5aXWaewuKqR688rH/FFwayNhKvKzsBosQX
	 pWU+5ToQVcjupBw05VxLDDXafytLvLHu4fhX/bwPeKVHr/LEMFtLAvep1NECpeKGYBzmO
	 s9ZpV9T4X2eBfea7w5ZiTcwsYU5+GI5Q4csF5L+yBXc2tn9SvApgh4eEmO4D+GdJ8Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPeNrzlg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=muxRvgEI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8118606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8118606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPeNrzlg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=muxRvgEI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793621941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezbpBo/Df5RXTILcrA43k0R/PKSOtGb0Z1SJrrOr0RY=;
	b=cPeNrzlgq1Q/J4RgFF+eUwG4G7kN9OVYgOqOSQWHYiAxyMzLSBcSxzB83zQfBB6Zg2voQY
	gBKf+lb9xAmqbJ88tK/f3cNWc78mBNs3MGA88TeWQL7oTG7aaZHvXlvx3LaPNqYpAm1oLN
	qJe1eNMahlD526b6bh/HJ/lsBm19tps=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-CDJP8BlwNhaM4Ybrk7wWqg-1; Mon, 02 Nov 2026 07:18:59 -0500
X-MC-Unique: CDJP8BlwNhaM4Ybrk7wWqg-1
X-Mimecast-MFC-AGG-ID: CDJP8BlwNhaM4Ybrk7wWqg_1793621939
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1d818b501so1040958a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793621938; x=1794226738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezbpBo/Df5RXTILcrA43k0R/PKSOtGb0Z1SJrrOr0RY=;
        b=muxRvgEI1s8h2zXXULZwzI/3XpicjK0kmbxlDECs7rKlTB1yV417AeqCjWgbpgMPHo
         HaZDvQbbIp8Z9pm++PmPre6CDAOjXSvgLL2PTbyanJsw2PSpd2/Tez5W6NLvLMBHsBuv
         NTRIpvhZHtiAaGj4AfwZubouJ8NmlF/fcU2U9VP6C9ZNxoO9BUo3RuY7LBL877l0+sW3
         erVGbHIbFa0qo6s9N4vntGzH5HUU8un+SikGAnSUunIV+aR6G0QHZnLcCTY0DhwG9Y4+
         GIxr/OqeijdBgYRIPusUguFRwANmziqyeJYXNPhzIHn5dhsFd+/ihq7X22q95wzwc8kW
         g8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621938; x=1794226738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezbpBo/Df5RXTILcrA43k0R/PKSOtGb0Z1SJrrOr0RY=;
        b=aXhQz7eDN9hAM5CtmJJCHl7aFM0Y8vcilGzsNBSGNmfmtY9m2SN7C+TEwN4tN2pHsm
         MX4J1iq4tfIdrEKxBc2YrCSH0SRCVX0pfe09t4hbgUyZkNo3eMUaThGL+0F4NUW0Lkrp
         P2Fa8nMkmq4/fyNeSQ7JySXNCeTpZa3P6vB67oYa2p6ivF9eiS9d5fCU0PWWAzQwa5Ls
         bVwBv2NhXdYDam1i+JkZxASeGdKCiEqew8gEDjt4SXNbqrHwWz9LKLsWF1TBkI7zfI8N
         HR/m9beNo1OvxZw9QVvq/7/rGVIxtTZHs9ZP6tx4CapsRSKyMyTk/0RweN1BS2+bHx8O
         yOJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbUbKAgOFXMaB7ZBOk/jzp7lRP0m/eMPC7YxJClMaiUxH8claA9JQ8PdvdMsk2uTwdFHpLTHhn43FsqUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XPP1diQCUqgTaYpK/2Z4U3b3VurrVcEosVL3KLNKzC5bcWsfh
	1unzK3HqSdtc+2jAxAMIZjsyV1SXvii1FqtzH4XRI2yxgWo0UcSR5ThAi7VCFzSNezu1rPgJnMj
	ROu8W7Lh5UFV0/qyaWI1SYqVnS7LHvzqHPkZ3Lys1mzffmg4ZjcN1q+i1cuhGFjsD+Q==
X-Gm-Gg: AYBFou0iw9M+xALy3IdyfX2z1O+zXBrrI4vQ29SpeeD3kiHmynqZZOmitZjCtErBl7Q
	uOGf6aiBaYDCdRXEtwOKGIevwT7LGHXVJ4WWm5DjduyI8J8lbnzZHc1qHLaiEXj4OHt9UdIdE5i
	82yXLf0TFM/TT5bXF9txMPe5C6I+t195cG7Awrqapd248lb+zO7tPDT+RsQ7vxQaKBLUjDeDOTP
	zuW/V/XZHVbOFYaedGQ9leHdqyEnkUPOSX12k6wzwcvGXzsEKS8ONnbHARxPg9ykNvZYkLqw6gt
	cMjCjx7uhMx3sgbeq3afQUjunjGhujFZUGOGyFHFzCzNDCow1Sp0CV0agXZ2VP0+mgEHcRszXec
	nrxmAuU1kLQAJyCmHnmREFaZ2G2iQIXin3kRSquEr7e01bfc1E56vC4OQfQZoW3bY2Ceu2scRQ9
	fC7i5FLLtevfEuKHgoMPc0ujq+QpfEgAi1mp+NbWg+VqM=
X-Received: by 2002:aa7:d518:0:b0:6ac:7868:b690 with SMTP id 4fb4d7f45d1cf-6b4d438916amr5355712a12.8.1793621938404;
        Mon, 02 Nov 2026 04:18:58 -0800 (PST)
X-Received: by 2002:aa7:d518:0:b0:6ac:7868:b690 with SMTP id 4fb4d7f45d1cf-6b4d438916amr5355695a12.8.1793621937879;
        Mon, 02 Nov 2026 04:18:57 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fb9a3sm3166256a12.14.2026.11.02.04.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:18:57 -0800 (PST)
Message-ID: <836982e0-b733-44d4-ae2b-20276589f867@redhat.com>
Date: Mon, 2 Nov 2026 13:18:55 +0100
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
Subject: Re: [PATCH net v4 2/3] sfc: ptp: serialize host and MC
 synchronization transactions
To: netdev-bot+sashiko@kernel.org, alex.austin@amd.com
Cc: ecree.xilinx@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, richardcochran@gmail.com,
 alucerop@amd.com, pieter.jansen-van-vuuren@amd.com, netdev@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org
References: <20261026123023.3566549-3-alex.austin@amd.com>
 <179336481081.3134.5405870739856758840@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179336481081.3134.5405870739856758840@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/26 13:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The new kernel-doc for `@phc_lock` in struct efx_ptp_data
>    (drivers/net/ethernet/sfc/ptp.c:275-276) says the lock "Serializes PHC…
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>    `_efx_phc_adjtime()` in drivers/net/ethernet/sfc/ptp.c (line 2144)…
> - [Medium] Baseline decision: not a defect of this patch (pre-existing,
>    Medium, in a driver the patch does not touch).
> - [Low] Baseline decision: false positive, fixed later in the series.

Note you can usually ignore pre-existing issues. Exceptions are
e.g. when the solution for the pre-existing issue will require
a significant rework of the patch at hand or impact is drammatic.

BTW I agree comments WRT problems still existing on siena are
unrelated and should be addressed separately.

> sfc: ptp: serialize host and MC synchronization transactions
> 
> This adds a phc_lock mutex to struct efx_ptp_data. The mutex is held
> across the whole efx_ptp_synchronize() transaction and around the PHC
> adjfine/adjtime/settime operations, so the PPS worker and the hwtstamp
> enable path no longer clobber each other's handshake flag and timesets.
> It also bails out of efx_ptp_synchronize() when efx_mcdi_rpc_start()
> fails.
> 
>> diff --git a/drivers/net/ethernet/sfc/ptp.c b/drivers/net/ethernet/sfc/ptp.c
>> index 957ca08092e7f..e26269fae38d6 100644
>> --- a/drivers/net/ethernet/sfc/ptp.c
>> +++ b/drivers/net/ethernet/sfc/ptp.c
> 
> [ ... ]
> 
>> @@ -271,6 +272,8 @@ struct efx_ptp_rxfilter {
>>    * frequency adjustment into a fixed point fractional nanosecond format.
>>    * @current_adjfreq: Current ppb adjustment.
>>    * @phc_clock: Pointer to registered phc device (if primary function)
>> + * @phc_lock: Serializes PHC commands and synchronization, and protects
>> + *	      @current_adjfreq
> 
> [Severity: Low]
> Does this comment claim more coverage than the code gives? Two of the
> callbacks in the PHC ops table don't take phc_lock. efx_phc_gettime()
> (.gettime64) sends MC_CMD_PTP_OP_READ_NIC_TIME, and efx_phc_enable()
> (.enable) flips nic_ts_enabled. A standalone clock_gettime() on the PHC
> therefore runs without phc_lock.
> 
> Making the comment true by adding the lock to efx_phc_gettime() would
> self-deadlock, because efx_phc_settime() now calls it with phc_lock
> already held:
> 
> 	mutex_lock(&ptp_data->phc_lock);
> 	rc = efx_phc_gettime(ptp, &time_now);
> 
> Nothing breaks today, since the MCDI interface lock already serializes
> the RPCs. Could the comment instead list what phc_lock actually covers
> (synchronize, adjfine, adjtime and settime)?
You forgot to comment on this one. My reading is that this is just a
slightly misleading comment.

/P

