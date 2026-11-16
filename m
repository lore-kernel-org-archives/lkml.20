Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861457;
	b=JOH69iAd3mjYp9U+bgCLoeVeIPsxPDZLxi8UkIX/2cd2UKrG700T45pm8V0h7pkPJmlF
	 Efa9cc0aV6QSGmY4R2CO2grVmD/JnMbdcukeDZMN/sQDhIcoE8R41pnPKlZiakaIzGK5v
	 fPDLYtcbbZJn5mrSWJzoTFC4Yo/24cdOmcejBmHNFeuD08HkAUc4Pcf9kmK6aHWbutEyq
	 qtq10xIcIIK+XUjOFZuJYBTw4LkGENrHatNTai7n40/wFlNgUTKMC3q+4wxp/tu7mUunl
	 hefueE9HGnE1FG1NCWDajfOzfB3AQHy0gsUxpNZk8uEnh2Ly8zOH3FS5WzoAeT9nWrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861457;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
	b=JYtCEdHeIwX0W2R+phKja9x3QDK2AtsAHZ6IqXVcrxOC6pV9NIEzm6J9yEC9PERAABXv
	 tI5bcXNf6b+nRSI9DERW8r1po0Hc3tG3wLhv/hZV6HcftXXYROJhStjxFoFcu/ZSqrl1/
	 p4myPjFq4oWGFMdIN2jzrDGk4F3Hk6o7V5k/cmbIF+xCs7EPdY6VuB5blnhOuI19wFQAj
	 6IO6nGOiyZ33TFQdmIItVd+ivKva2rZaMzUiEKRaH9hh27ibwUU3g5D0MCzyZ+1gUwcYf
	 vq5qFkmQfPMiihMZEAe9/UwfIxgYJmEXJpZimRSnei7zmAmqe7Ow/5HeVEjhHPb60aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YPRiHJIw;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE60606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE60606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YPRiHJIw
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7d65662077cso2607270137.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861456; x=1795466256;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
        b=NRPJc9k7hjMoZWI0OZkfAducr9tY2BfrC/qT+veuupr9FkNsh6Z+QX3FtpOmeMZX1p
         ngCt82zchsGECvecxMbix3ou10jW81caBOAwvzN2R75eOK/1le1lKzusoEWbxHo+bwXV
         JIUGhUIMwhakzVg9qSDUM1z18PaEsFWnvVneZYTqCUX/wyuEHCOc8dfFo3eZK2nk7akh
         6Gze371cPjq6S7VqlUIpSG2xmx9BHiNXGRsdF1fm5z05xaCmRQ3pAeLd2bG+dcmOn6Tc
         e8RBU9cISq5nwTxm8mUHY+KoUts75iYdk6TnBDjQuWZam0OUwm2WC/L3nhgO5PFP7eaC
         D4Aw==
X-Forwarded-Encrypted: i=1; AL+hErEpDZuP1Snk4HuBkNrbeJjJ5FbCLwVjcJwDxpp6thuQyr9Il3krVNQ8c7TG0qo56SgZ0RstFb2XPPTOIX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RLybtEWhubvhyundVMUU+k0vnakr9d2MZJMS1dii1Ehs8yOfa
	uRMhLy0YD1a3Zteg4cMR/6qkADFZ5AheFyDPFdzFO+lbmg6qw0XU2SinfctoZJewLehpyzg5RHb
	HoF/5F/SBF0uwXPM8nZ3Akd0pqjLEnuVik6GOQAsqJC+HqnkEpMZH2oLHG7D3rg03YWUyPpmJwl
	V1+Hl1Z9/VR4toes3QKWMB15J88QDNKAaevY7vQfW597YiMXw3PSK5so34VumxeFOShtPSj/nRM
	yfcIY/op/Ap8H3q0OpQnJGE
X-Gm-Gg: AYBFou0u4qWlnvJNyugmaj4YORklZwz95hWg7LPHHrqlv2NPRWtDvJspm7MTlfbqouA
	mi775pB/+R5zqViYBl9KoMQlJB/Ro2V3jhn4QkHMwvO1k009ncvU6YGSsnPmX9mEZdrDw8pkhHq
	HnfSrEyThMHxrf7M3PnRJH6cfsLLjDP8UONuGTswjcVAXJWZe2Jb2Y8C5hHvflikg3e2LRL9DyX
	GUuW6lPuHA8e7v5EG70GpRRS60FvdJSMT2Vsbq6y2zMxTFw4lfvFV2W80tNgU6ws2wGQdGb30f0
	NBCVPvmmTb0Nt2atDI8r8m2ytP7xAiaYm5nMTxwKtYxToc3svfE8ku+dQENFUzkQU/jHnTfYe+W
	tjmG9TJs2vukwyCJ749fMitgCAJyza6CYfcIjNAZKQPVuN6Aq1Oj4OgsWY+6e6MUXO6/6ydXBzG
	dnvWCeYdiiMXxfEEVvIvFZ2IgMAQ8H7rzNk9LUDjVenns=
X-Received: by 2002:a05:6102:32d2:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d64d6ed86emr4177944137.9.1794861455798;
        Mon, 16 Nov 2026 12:37:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e337a0a56sm83151241.5.2026.11.16.12.37.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53639e47be2so78931751cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861455; x=1795466255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
        b=YPRiHJIwqIsLktC73Fzl29mj+4Vj6oQoBdB6rTaERCD8ykX3j+ogXXeAN94W5jBLaT
         JCE6WLzcIMaZRct8WNXHcGyNW1KAy35nvIf6jOF3v2YDFPujsg4G23qHLHF+h1dOZtTJ
         KC40cRLAWNs2nbYFLDhjgMgkJTPJbS8H+mIjM=
X-Forwarded-Encrypted: i=1; AL+hErHqhZTARkGAiYJ3025ZbNoG34TIdHdmwjHR+RIUoJfMZBrOoWeSWwok9c/sPBy62YsY5vdsaC5l2wH0Eco=@vger.kernel.org
X-Received: by 2002:ac8:5a0e:0:b0:535:a5fb:67fc with SMTP id d75a77b69052e-55ac9f61d43mr177777201cf.72.1794861454935;
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
X-Received: by 2002:ac8:5a0e:0:b0:535:a5fb:67fc with SMTP id d75a77b69052e-55ac9f61d43mr177776961cf.72.1794861454507;
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c3b7a4adbsm64637071cf.19.2026.11.16.12.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
Message-ID: <ba66f497-78fc-4790-93fe-22ff0e44968f@broadcom.com>
Date: Mon, 16 Nov 2026 12:37:30 -0800
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
Subject: Re: [PATCH net v5 3/8] net: dsa: b53: clear stale state when creating
 an ARL entry
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-4-florian.fainelli@broadcom.com>
 <179485573753.3136.13658549628439256102@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <179485573753.3136.13658549628439256102@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In b53_arl_op() (drivers/net/dsa/b53/b53_common.c), the code
>    does not do what the commit message says about return values.
> 
> --
> 
> net: dsa: b53: clear stale state when creating an ARL entry
> 
> This patch clears the b53_arl_entry in b53_arl_op() before a new ARL
> entry is created, so a multicast add no longer ORs the port into the
> forwarding bitmap of an unrelated bin. It also returns early when
> deleting an entry that is not present, so stale bin contents are no
> longer written back.
> 
>> Deleting an entry which is not present now returns -ENOENT, including
>> when the lookup ran out of space (-ENOSPC), where it previously returned
>> 0 in that case.
> 
> [Severity: Medium]
> Is this paragraph accurate? The code below seems to keep returning 0 for
> a delete of an absent entry in both cases.
> 
> When the lookup misses, b53_arl_read() returns one of two values:
> 
> drivers/net/dsa/b53/b53_common.c:b53_arl_read() {
>      ...
> 	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
> }
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 1f5776dfaae2e..dac6013f8fe29 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
>>   			addr, vid);
>>   		return is_valid ? ret : 0;
> 
> The -ENOSPC case is not changed by this patch. With is_valid == false it
> still returns 0, not -ENOENT.
> 
>>   	case -ENOENT:
>> +		if (!is_valid)
>> +			return 0;
>> +
> 
> The new early return in the -ENOENT case also gives 0 for a delete.
> 
> Before this patch, the -ENOENT delete path fell through to
> b53_arl_write_entry() and returned b53_arl_rw_op(dev, 0), which is
> normally 0. So b53_fdb_del() and b53_mdb_del() get 0 for an absent entry
> both before and after this change. The real difference is that the stale
> bin is no longer written back.
> 
> Keeping 0 looks like the right behavior. b53_mdb_del() logs an error on
> any non-zero return:
> 
> drivers/net/dsa/b53/b53_common.c:b53_mdb_del() {
>      ...
> 	ret = b53_arl_op(priv, 0, port, mdb->addr, mdb->vid, false);
> 	mutex_unlock(&priv->arl_mutex);
> 	if (ret)
> 		dev_err(ds->dev, "failed to delete MDB entry\n");
>      ...
> }
> 
> Returning -ENOENT there would produce errors during normal teardown.
> 
> None of the later patches in the series touch b53_arl_op(), so the code
> is the same at the end of the series.
> 
> Could this paragraph be dropped, or reworded to describe the change the
> code actually makes? Or was a code change from an earlier version of the
> patch left out?
> 
>>   		/* We could not find a matching MAC, so reset to a new entry */
>>   		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
>>   			addr, vid, idx);
>> +		memset(&ent, 0, sizeof(ent));
>>   		break;
> 
> [ ... ]
> 

The paragraph was left over from an earlier version, the code is correct 
and I will send a v6.

pw-bot: cr
-- 
Florian
