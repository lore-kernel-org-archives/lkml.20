Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294758;
	b=CNugHytWya3ul9nJdK5KyQ5GmlAqVDTY4aaHFEJpjfEORuN1/NohjMVCZkTgUC2qSTe+
	 L7V5xh0BZaHrGjtcX22bEEUN53MF6rqQeVWbxUvxszNyE5TJD03b62zLOI1jBqMKdpiSL
	 uOH6DGrj9RWlqoX9VdZWrKoNSwkxV9sBMT/DnowM+DTMooF0yAzTWSUcWcS+rzP4X6rz1
	 vbB7gtKunl+4RQhSoiAWbeoven6bNOTLyUsM7Akfd0UEQGdu8c03soC0r4i2Crkqkn8sT
	 nFF+wBZJ/UxQnGRCzafKTPCa6LcdzBezoE1OXQZ7jBDNWI6Ogp9ZEy7tXrtqtu4GklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=p1M8KQKZEZVrR5oiIhhEHbcY6wunX44CsSXTYXwSo8M=;
	b=bHUi2D5xPtr9JMHv2Uo2SHsXZ6wBB4vR+sPNCyT1M/69TJResC4gCOerzBKIkbDgekjw
	 4qx31Fdkcmx8YFgHdGFT2/jDKV17O+/aay2LR69C4UZbYV3+LtAqxdeI22G8IWWHWxqtK
	 zqTIhUdLzdPCsl5Bmah00buQbATObojwZ1MOKNgRIr+M8fwGUc2Dg1TtCTatG8DYNilzS
	 bq45PH+rFVnrkcIv+vdH79Dehx5soyD8bOAMkg4b2DPqx3dAouSNKVvMg9D+qxSJuEAuR
	 WWHHr7UOdEGRLnu9DP2Zk2Wg1QBIxNynDlLczu9ToFOzxnbfRYSm3E3E1DyW52OcuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUCKVbgs;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUCKVbgs
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso1087217a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294756; x=1793899556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1M8KQKZEZVrR5oiIhhEHbcY6wunX44CsSXTYXwSo8M=;
        b=MUCKVbgsCF/1mRkGAftGIf6A9+mQOgMOrFVabDNzK4KU7JFWRz1meVdtnXTKzHDqEM
         D++LX85ATaBnlRRvQ4xRTDhtF5cWOVoTkQ7reAKvlEohu0SjNNxwuD7+BXpNvMcRewJr
         jnkOoqYxrj94KXWMyjQh16/h7/1u7yhIOe0JlaYZy/K0cNbiN00Q45vWQ9K6kDcKgChT
         I4WhVF9yXcmVqrXP15gMA5Whs/weXzQ4iEOJc6rF4zq6zkKiawfqPsebqiM/X+AqJCVn
         vg3Ku6rxyUCFwVc213pMr5vdjINrhG9uyycB6x3pSi2WxuGaO72Cy4IZeRG9HMjQ++bf
         RJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294756; x=1793899556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p1M8KQKZEZVrR5oiIhhEHbcY6wunX44CsSXTYXwSo8M=;
        b=Gs+CxujvTgz308iiz7p94J0T+m5eRZuIrvIJvu4q8FL1OWJZNuTZlDjLp3KKLSYHNO
         Yb4MfD/2cybSk/eQWRi90R6208nLlYmoIovoycdkkLXQXaaOAd7hm5AyMOd1GolQTtcN
         xsU8Jzu5d5WoRuwiNGZcTj2SF+AmKFWLbVz2y3CEaJXkFU6+haXWJ9++Hgd/8Ou+Uw+Z
         QvDBAx52yG91MeEdxcUI1RW+oSG9yeJetIb5ULHPbozyaRcM9L91BwoyTiCrNHCH0wCU
         LN9srucH50pF6Q8J7+f6IHBlqr/vW5+BS+JIjuhRIpH2tqti+2wHKST+MqWaWdY2EXMk
         N28w==
X-Forwarded-Encrypted: i=1; AKwUvBwLkzjKUKDzyOIRMHV/7JK1mDraD2rK+DkX/ArE04n/HQzQgHl0CEuXLjIwf/q8IuTLnwRjD9eIWXo56jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHsDMIqDF0EBhvJMEr/UrIxbFUXZgCSMsmEWfQuNvmbIJYlIc3
	Vf76ETltEo9mU2IkfErF/o+zeIoKFXCXwEZG5ctSInpxogeiWVyCCEmW
X-Gm-Gg: AYBFou20o8+7Y11aMdYJMVHHPkPlGl49kcoDEf468jL42GakwskBIxhbUk9LH965JCD
	lX6bNC9rZHHWaLDil5cdWMYfwLyCY72qGecdIO6RyRg0KcGbXiHZTMtZ1I4SPggePuZL1vEgc4t
	aRMs3aBjGQ59iIUu/qkUukCxxWEgV3NJsjLe4fb1gTKohn9UzdnF2MVQOF/DAxbxrGJDMn7C5Yq
	P/oV4dAtf/MM3Yt+3IjX5N6BJ77ySFPaiCBz6vclv4p0VfjVNobff5nRREj0Yrfeoqi8+lyWKfd
	qFiTTP1GY4WmRQaIMoEb1cLrvOI0gzNY+61lVHgAwayHLL5e6cpfFOmb6Hj06ly4LEPjwgzYA9l
	tGKh+Gb9LUt+wz5rDqWZANgf0i9RtmG9FZIdQjumWoVJ+4G0LrqDo520FvcYpQ/oQ6VQSeJeKW2
	Mh14PxDj4EMEnujpByz7cpX3v3XBifUqIYieHn8jbCzR/HF6WbK9d2XEw3enejBGO6S6MhOLl4l
	3fNpksSoh8976WKnlRvnnRXG0QZdx9ReTrHLMgfOYD7EGK6RYYuNpg0akUT6h2JzrCilYedlFba
	FjXn+5n0AwSDFB3+93y2FF5dhsIulZxVe45nX6+SS+MovBA4qdITkW5NTLXTIq5TTkao47M2QrH
	1dA==
X-Received: by 2002:a17:90b:54cd:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3ae580f1940mr5003657a91.25.1793294756239;
        Thu, 29 Oct 2026 10:25:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae841dd1b9sm531417a91.0.2026.10.29.10.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:25:54 -0700 (PDT)
Message-ID: <3f17be46-2d9d-4121-9cf8-66fe739f11f6@gmail.com>
Date: Thu, 29 Oct 2026 10:25:50 -0700
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
Subject: Re: [PATCH net 04/11] net: au1000: report MDIO transaction timeouts
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261027223140.3774570-5-f.fainelli@gmail.com>
 <179329051221.3134.18425968013165195410@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179329051221.3134.18425968013165195410@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/26 09:15, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The new completion poll in au1000_mdio_write() reads MAC_MII_BUSY
>    right after `writel(mii_control, mii_control_reg)`.
> 
> Pre-existing issues:
> - [Low] On success, au1000_mdio_read() returns the raw 32-bit
>    MAC_MII_DATA value (`return readl(mii_data_reg);`, au1000_eth.c:298)…
> 
> --
> 
> net: au1000: report MDIO transaction timeouts
> 
> This commit changes au1000_mdio_write() to return an int. Timeouts from
> the busy wait before the transaction, and from a new completion poll after
> the write, now go back to phylib through au1000_mdiobus_write(). The read
> timeout paths in au1000_mdio_read() now return -ETIMEDOUT instead of -1.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 70319b432182f..a507a524370fd 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -292,14 +292,14 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
>>   		mdelay(1);
>>   		if (--timedout == 0) {
>>   			netdev_err(dev, "mdio_read busy timeout!!\n");
>> -			return -1;
>> +			return -ETIMEDOUT;
>>   		}
>>   	}
>>   	return readl(mii_data_reg);
> 
> [Severity: Low]
> This isn't a bug introduced by this patch, but should au1000_mdio_read()
> mask the data register value to 16 bits before returning it?
> 
> On success the raw 32-bit MAC_MII_DATA value goes back through
> au1000_mdiobus_read() to phylib. __mdiobus_read() expects either a
> register value or a negative errno, and it passes the value through
> without masking:
> 
> drivers/net/phy/mdio_bus.c:__mdiobus_read() {
>      ...
> 	if (bus->read)
> 		retval = bus->read(bus, addr, regnum);
>      ...
> }
> 
> If bits 31:16 of mii_data ever read back non-zero, phylib would get a
> value wider than 16 bits. If bit 31 were set, it would read as an error.
> 
> Nothing in the tree shows whether those upper bits are ever non-zero on
> this hardware. Would something like readl(mii_data_reg) & 0xffff be
> safer, now that negative values on this path are proper errnos?
> 
>>   }
> 
> [ ... ]
> 
>> @@ -320,6 +320,17 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
>>   
>>   	writel(value, mii_data_reg);
>>   	writel(mii_control, mii_control_reg);
>> +
>> +	timedout = 20;
>> +	while (readl(mii_control_reg) & MAC_MII_BUSY) {
>> +		mdelay(1);
> 
> [Severity: Low]
> With this new completion poll, will every MDIO write now busy-wait for at
> least 1 ms?
> 
> A clause 22 management frame is about 64 MDC cycles, which is roughly
> 26 us at 2.5 MHz. So the first readl() right after
> writel(mii_control, mii_control_reg) will almost always see MAC_MII_BUSY
> set, and mdelay(1) will run at least once.
> 
> The mii_bus->write callback runs in process context under
> bus->mdio_lock, which is a mutex. Could this use readl_poll_timeout()
> with a sleep of a few tens of microseconds and the same ~20 ms timeout?
> 
> To be fair, before this patch the access that followed a write already
> paid this mdelay(1) in its own BUSY wait before starting. So for
> back-to-back sequences the cost mostly moves into the write. The new cost
> falls on the last write of a burst and on isolated writes. The existing
> completion poll in au1000_mdio_read() has the same 1 ms granularity.

Agreed on the completion polling. I’ll use readl_poll_timeout() for the 
new write completion wait, retaining the 20 ms timeout.

The upper-bit concern is pre-existing and speculative without hardware 
evidence, so I’ll leave that unchanged in this series.

pw-bot: cr
-- 
Florian
