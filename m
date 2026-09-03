Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED54E80C1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451010; cv=none; b=PP06ORMw6buhEBvIe9aCrjq5QWRU3ve0ReUjGqshu4I9DETeGHvcoRpIlNGtKGw1D7JeRMiv3nQm+AgJz4uuYUZmrJXi4gZeGDasr4lygU4lix3NOJ2ne1MRqRticgqCzklKxOG1agl92LH7jbmxlXYuJ7vvSqGMKS0movR74FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451010; c=relaxed/simple;
	bh=lxBqtxuBOusWek29/dJLnhOh3CXKdVZPRI0FxP1c5Uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HsIy2UwCC+uWw4uH7InUdtdUN1MBD6om+qlIjtjkmxuAisMcheG/PbMgPwzCEiWWUur2L8GEJiB4JgmX1HomTwyiNF9BGe+xCpzSrS0ONT2pXKJ5KE9D/hR8qpXAZblMvaJyuWCzkDVd1cGlkfdQ0Brtv84ZFOFd0oM/9CIY+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpRfYrLZ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpRfYrLZ"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-85a50f6a7f7so240007b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451008; x=1789055808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BU0pHPVrhHdYT1WkFVjJDxv8ZrMHIUMFXolTYoauB9k=;
        b=UpRfYrLZffqWDCQYEyankIaWGjzgdulvyIiVeUEg9yFIbhzhxhkScqw2lcu+6PzisC
         9NfMSANnobNIYTrTLZU9aDw/A9AZKCt1/iGXwWF65kDmn+qKLWT7aSsQPxRQADk20A8V
         QkbukRhaKjNqhlDKIiHVa8RROXVSXVTWHNlUdv+OFsINCDC48NplafGcVjPhSTNnHmGa
         xrLUrPKJShDofb7bD8Y/6uBfFwiHZE0Nf8/Z2DGq6iqP4J6JeyVZ1S6t1kqHQejS7VLX
         HCeMGRKAT2zpOwd6O4XDqm2UXtqH6bUgVuftBotArRLfpcqdLV8Zo6HZ1iT7WhvXv4gb
         IA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451008; x=1789055808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BU0pHPVrhHdYT1WkFVjJDxv8ZrMHIUMFXolTYoauB9k=;
        b=Rc6m5Weu/SGpxweB9QFyV3ASdHS/rs/k1XHshdRimU3z4cKgVkeiBYrVuGOCYRGGiF
         PNSV1JKR5sI9KUh+S/rIAPgvVODegg1ueWfQ78C6zu5DVwQ1nzy1j83M4ekVPx174H/n
         FG7XqdYxc4adN5u1is+PDADWiHvGcO0PRDa1DhnZdjwBJmy07N8agJxZXAfRr28bKULk
         QFob0Az2ASbjBhw9iOwAZKzMnt3mv3+usZsyISxv5LZQR7Vh6xQT2369eR112GX0Dh6U
         ilPv3FAhbdtYhJbHKGDsRS0Jm/qR4y8CoQZIxIxriH1kMsP9Xw810CD1j57kRYOgrVzH
         gRaQ==
X-Forwarded-Encrypted: i=1; AKwUvByQVu65k98AFz1m5jnbgd5u8HEXj0N53PVL+4+ZqhOlYbQF0F/WBNfGQ9TOiWPBYfxk9xwNVEzAL/+I/gg=@vger.kernel.org
X-Gm-Message-State: AFuF++kBndJRiwUZ0EPj4WX5SVttHepOl2B0m5fSKWMfyzZcFkiim4Qn
	9DPGk5hqiDZAN76CC5ItmkNZyAB+aPOlb3WNNCey3KMtcztsmjxPVA25
X-Gm-Gg: AYBFou2KbF5BioowHRuLXPI5ZaCgJ8pVdox/I9FEDC+ASAA8Sdd3ZuSuBsYWNApWXPN
	4jbEMWg1PNJmLv5x+nWP8e8T/1xr9ydIipusQI7fGNZ6cuNAtSfMQgtjAF86X3wKct7mwuxUrW6
	6Rn//rulsT86t07Z2JW8U2m2/Sz1ONGrprbBBtFlvDnqwM5WaTAYMib8Q8eDR938mK1MSnVZoWS
	QkkFmW4VCosdDVJpSjqFcdT/qaNX3jafVHAmLaXJ9bja1O+tLjRYE4qg1FgF1Aiq0LQLEewsZv1
	rrI2dpMqlYQkTYUY7Basb3CMS5pkL4Kq1hdhoeb6P3qHOPFyjShhrWjBzlLOd4C2W+sdQornvvE
	OWn7qrBuM76CRIOz6LnOFQ9fQIonXJxxHwx1BXJAztao4lLDIdsauM0FjWAqCHJ6GSy5wFd2h20
	h7pTJjGQZK8tOxOOkMOybPxvOI0H2euFPztlxVlpUHPydN8CX/sRPJjfHNlaEKaCRjxTTJothBB
	RU=
X-Received: by 2002:a05:690c:5609:b0:81e:7d90:5673 with SMTP id 00721157ae682-86c53678a4amr59135427b3.26.1788451007441;
        Thu, 03 Sep 2026 08:56:47 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c1784192bsm42962537b3.30.2026.09.03.08.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:56:46 -0700 (PDT)
Message-ID: <1fd96ec4-4247-4d6d-8936-cf4607a206c1@gmail.com>
Date: Thu, 3 Sep 2026 11:56:45 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next 1/8] e1000e: add jumbo Rx CRC stripping
To: Simon Horman <horms@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 aleksander.lobakin@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830232146.36948-2-tactii@gmail.com>
 <20260903102730.578872-1-horms@kernel.org>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260903102730.578872-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 06:27, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/20260830232146.36948-2-tactii@gmail.com?part=1
> ---
> e1000e: add jumbo Rx CRC stripping
>      
> When the hardware is configured to not strip the FCS (CrcStripping=0),
> the jumbo Rx path would deliver frames with the FCS still attached.
> Follow the standard path's convention by stripping the FCS at EOP and
> leaving it out of the byte count.
> 
>> diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
>> index 844f31ab37ad4..599600ad695cd 100644
>> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
>> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
>> @@ -1631,13 +1631,23 @@ static bool e1000_clean_jumbo_rx_irq(struct e1000_ring *rx_ring, int *work_done,
>>   			}
>>   		}
>>   
>> +		/* strip the Ethernet CRC; it may span fragments */
>> +		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
>> +		    !(netdev->features & NETIF_F_RXFCS))
>> +			pskb_trim(skb, skb->len - 4);
>> +
>>   		/* Receive Checksum Offload */
>>   		e1000_rx_checksum(adapter, staterr, skb);
>>   
>>   		e1000_rx_hash(netdev, rx_desc->wb.lower.hi_dword.rss, skb);
>>   
>> -		/* probably a little skewed due to removing CRC */
>>   		total_rx_bytes += skb->len;
>> +		/* If configured to store CRC, keep the FCS bytes out of the
>> +		 * total_rx_bytes counter
>> +		 */
>> +		if (!(adapter->flags2 & FLAG2_CRC_STRIPPING) &&
>> +		    (netdev->features & NETIF_F_RXFCS))
>> +			total_rx_bytes -= 4;
> 
> [Severity: Medium]
> Could these lockless evaluations of adapter->flags2 and netdev->features get
> out of sync if userspace changes features via ethtool while a packet is being
> processed?

Yes, this could be prevented by bringing down the adapter before changing bits
in e1000_set_features().

> 
> If a concurrent change occurs between the first check and this second check,
> it appears it could lead to an inconsistent state where a packet's payload is
> incorrectly truncated by 4 bytes, or where the byte statistics are overcounted
> or undercounted by 4 bytes.
> 
>>   		total_rx_packets++;
>>   
>>   		/* eth type trans needs skb->data to point to something */

