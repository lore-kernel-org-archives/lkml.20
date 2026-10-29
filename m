Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295432;
	b=XHXDX99m0S05ZrH2QDbswGEB94UbtvzL0UD15XuCtVfrarttH3cB+hoZEOWSZmz1SIdu
	 LWB3I9C3Wf/zy/54QoiOhp1a7VojrJeFD1AKLRJSrOT+U4o+KaAt+iuLJJ/ZbD739rcUQ
	 ZbatGvfrf+X1D+i8hqmx9l+kTJBoniLVzl8Zn4AeB4C878vheqF/1vKMQYCij2cFtllP5
	 wEA2SpUcRLOZ5hCKAgTs58HY0/hoAEO/IOvqWErE4YaNEQ3K2dw+j0murMQ0PKrFgv3sb
	 keE2xrpdoeBICYQcgMlat5o5jZ9LB6JgUjF/C47/8rofLW6/+1ApsTV+C24KaW6q3Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1R93MDTU0XytCmvnwXdPrrSy/zaN5hGMCigbTQ62llo=;
	b=gXRgnzmy3iUED9g9zMHnX4SgbssfSY2EgeGh8Qk1XeFkpmNQdh6vIZRPlB0iXjoxVv7i
	 ALJJhGZrpMHnxv2ERFNTiWFAuah5HtuWnt4MOmx1hkQ4dSVcZACBuxrAaT6N9yXgfDOmq
	 BlTiXrgnm/J9BMpwOFLaYND1KCRIVu44s7s2iSF3Z60xAkIkLfFiGN5eoBdvbGRRcW7p8
	 A64085BG1c+dZdPYNZ1rl+n90Xx49aDJ8OYvf/ogb8LPa27H85NUQTuAX0pwOuoKA0WMk
	 FAbu7gwOYFbPvrQaD4o8vJ6mR3+6hrqS0VTGMNvKW9OkS2DuPcMetPTRvtY9IOp8v0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aV7bCt7R;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51487606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51487606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aV7bCt7R
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14fc585291cso2219744c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295431; x=1793900231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1R93MDTU0XytCmvnwXdPrrSy/zaN5hGMCigbTQ62llo=;
        b=aV7bCt7RqRyTS/LfOOaXqrwODQp6BkyKXTEOC0hRoZ/qCfN8ZfD01J8OdU6aoOMGl/
         Cq+qRgwk5YP9yc9DONncGQxJbl+M8iLdwzqDtAlcIJ7nmDLCF75JfvpczLu//T5Pyzx6
         m+fURzOXw6BngapSpIbdo38MlYlx/PeYss9bB2tR6iIVWb3Sj+GlaFBLiFDxT/3zKKpJ
         M7G4bZP6kDGwHpl0FtNF0LQzZ5j2DLqRLhA5j7oLHePionsZW/39pztCzazzQHCOC28m
         fh5cCVfKnJJzaUrfJ/u5X1SSj8hnA0mVRpAtbPKP1yLzYCrO4Cd31ZnW31Fe8OiZrf9E
         2H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295431; x=1793900231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1R93MDTU0XytCmvnwXdPrrSy/zaN5hGMCigbTQ62llo=;
        b=NQw+kN3I7Jrs19fI1+iJZXP6DukgXfXLH1qDtRlBtcnUyDi5rDZT+z8KQt++2jE8LN
         TXhHALfqoiU5I4HuqCAqRSbyyBD7iRK3OaJMa4YvsQax5rCqUmG/Itlu/SfEntdQRGm6
         03+5nnwKGqlyug7mqb0xVHs+jagnGuMfTK7O6f33mO0nQkofmpIBEYvA3OqXMfPeeGbD
         PT3tluNoTN6z+M0xa84xkvuG8lv4vgXqBVK9ZUA2DDhG5ceoZko+LVMI+iDG3fObZ15D
         6fTsHfF+IsgbNC6sQjhoed5AWFJ4UIyfkoIfAZdeWjX7879VyI3MDlKlxF28uFsG2aAa
         u+ig==
X-Forwarded-Encrypted: i=1; AKwUvBznKdgp5vLqUj4RA09IRV+W/yDMMG6ep+q8Zxl8bQ9BvPexOU1xfC3RsvEca1U0QJink9O+DqIMls1O0wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTpGxsPkZgsQTJU2EC5Q8ZgzQ7pOsTSX9l1xZjsWftx4sRd87Z
	2Sd4aUcJs6ub0OweCoKg0ieYOnLoVO0cKbyRn2OPFRj4wWcHKH5fpoV+
X-Gm-Gg: AYBFou3hzaSZrDDA9cviWuUOwzlfDTLsCH11PBanRhByLdBR9qV1N9KLvAGszyJOiZv
	Y3DwC4nvT2d9QEcZ2+2wS8ntLcCHxExojtXnagWhvnlgEGoGe7lEwzkNVzRMdXZnrg/NqX5l6PB
	WxlKRgk0v3zz1YN00HEkmpQdFbkjJkZVbWMEl4PwnSm7F255TQQchRR94fwT8EIGd9NQLVFKawj
	YSG5M9dqiRmuMrh6e3NQn4uVpycNTVMSTYyfEUqfYdFCEcVDxrBmd7yjeSOm5/79jK5ltaakNCY
	KrkTxpmsYipDZkV7c9ygKwb6bhjKgI0vl8lKQ3C9nsTFkPVcgEsrna5mLvPH0x7lsT0aiqi3n05
	iar3xtqmfnkCvAtA+83w8dHxQ+H3y0FwjXOv3XN5+6pGyMp+30VnYFRbmxroFR4MWVo9qo7nNwa
	L4R+Clotx7bnuukvGtNIJ9SwMuN2B6/j8GMVMFw5z0TN1VZYCBDWEcpeO9+QrW0x4hGuTskUZ4z
	m9vs0yN7EGbo7VKdn5MpgN3yOq/spLzkkJ9nLL+7oE6ptiBqpTiwpWr9BDIbfcaVIhngrmiHeJx
	eq98anIK9ixTY64CmxCsP37H4s+W6eWZMFelLziwp8WV+iPJR+0DVMmh
X-Received: by 2002:a05:7022:6989:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1a6cf071fcdmr10788012c88.31.1793295431303;
        Thu, 29 Oct 2026 10:37:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm166684c88.7.2026.10.29.10.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:37:09 -0700 (PDT)
Message-ID: <209a7881-d76d-4449-98e6-c3b4f1efafdd@gmail.com>
Date: Thu, 29 Oct 2026 10:37:06 -0700
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
Subject: Re: [PATCH net 08/11] net: au1000: restore receive filtering after
 MAC initialization
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261027223140.3774570-9-f.fainelli@gmail.com>
 <179329051912.3134.7644702434785244368@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179329051912.3134.7644702434785244368@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/26 09:15, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In au1000_init() (drivers/net/ethernet/amd/au1000_eth.c), the
>    control register is written with MAC_RX_ENABLE | MAC_TX_ENABLE and no…
> 
> --
> 
> net: au1000: restore receive filtering after MAC initialization
> 
> This patch reapplies the current netdev receive mode at the end of
> au1000_init(). Promiscuous and multicast settings are then kept after a
> watchdog reset. It also takes aup->lock around the control register
> read-modify-write in au1000_multicast_list().
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index f8976e324f0e7..6b817d18329b2 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -742,6 +744,9 @@ static int au1000_init(struct net_device *dev)
>>   	wmb(); /* drain writebuffer */
>>   
>>   	spin_unlock_irqrestore(&aup->lock, flags);
>> +	netif_addr_lock_bh(dev);
>> +	au1000_multicast_list(dev);
>> +	netif_addr_unlock_bh(dev);
> 
> [Severity: Low]
> Is there a short window here where the receiver runs without the
> requested filter?
> 
> A little earlier, au1000_init() enables RX and TX with none of the filter
> bits set:
> 
> 	if (!dev->phydev || dev->phydev->link)
> 		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
> 
> 	writel(control, &aup->mac->control);
> 
> Then aup->lock is dropped. Only after that does au1000_multicast_list()
> program multi_hash_high/low and set MAC_HASH_MODE, MAC_PROMISCUOUS or
> MAC_PASS_ALL_MULTI, using a second read-modify-write.
> 
> This can happen on the au1000_tx_timeout()->au1000_reset_mac()->au1000_init()
> path when the link is up, or on open when there is no PHY. In between the
> two writes, frames for joined multicast groups, or non-local frames in
> promiscuous mode, could be dropped.
> 
> The window is small next to the reset delays that come before it. On open
> it is also shorter than before, since __dev_open() calls dev_set_rx_mode()
> only after ndo_open. The window is still there at the end of the series in
> "net: au1000: keep the MAC stopped until the PHY link is ready" when there
> is no PHY or the link is up.
> 
> Would it be worth computing the filter bits and adding them to control
> before the single writel()? Then enabling RX and programming the filter
> would happen in one step.

Agreed. I’ll share the receive-mode programming logic with 
initialization, program the hash registers before enabling RX, and 
include the filter bits in the same control-register write as RX_ENABLE.

pw-bot: cr
-- 
Florian
