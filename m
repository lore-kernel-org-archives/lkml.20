Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212421;
	b=eHob5eY5kdrhqDxlg6EZ7ZZJ5iqbjcjhbJN7oVAL7UbUmuDN62FoFraBeaxzUs0hvvtw
	 7S8hbtCOFuooSnk2Yraz4cQc/CKJdgZY9xKvbn5X3CQ7sQuvNL7LMbAtyQRZR+oDu/Tq6
	 cwwpe7//0vjq8ZMAJsKjCeJQrTcpA3coRIxkTaSmqjMT1h6wFyofAyCElP42BZRsThmmQ
	 Ad6Vsnt8vZpX6v8L1GhWX0H02M895XTOqOU3YvL+ZJuXa5U/olxSs/EMTWdcB0K21+mmh
	 PI8+kAP7Pa2qEPPWPTZKe/1NTOzBFz6mHd9vlFkxudgArIYbg+ASshwT0Rh0EVABPxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212421;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SR1t7sCl4LjwQgxmjEVNXFO9Cz1nfsLVq6mei2OzuQI=;
	b=skZBxFXq6k9aq7769TCDpxtPiKFdA0uxneaHcZIltpq7YKkbngsWv0egQue/d17Oxtpd
	 ilSLmjcNf0Mp8V28fuHF9yyL0zl6Nfak7MqpkcInNPazE8atAixoRDNUq4F+UepGHAIM9
	 4aQ/Y9C5dhsUsoe3uMtHuhfuJiQSsGbAI5WfoJ6TW7RcSyR/GYwu/wqZsZt5Vspugid8g
	 eZAuBHzsPwspB0yMFEaSN6dTkZxzO7Mj2sWDAvkN0WyqjQqnpDvsY/n3m88DxqAqf18QP
	 bzAomOY2dlD+xLPQ0Btxsq0DkBzOPbllkQmahR37F7rKNFumIAFLgxyDooy5UK8Wftw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gabX9mRr;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA9606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DA9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gabX9mRr
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so757765a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212420; x=1793817220;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SR1t7sCl4LjwQgxmjEVNXFO9Cz1nfsLVq6mei2OzuQI=;
        b=T/BmyT2GrFqw7Q/tpHgfI8G/w4qTFlDmj2D7KncNzVcPe0fZP5SJtaN7LeMGPypKjJ
         axXlQPnhzp4UnNkt3qU/haVnRKF3DNAbFNF0zIfgXxy0QqWUQEDf+chnp9cZSV5qfMX5
         GyjkUGz3pNjBpcIu05A2qV39sC0KfA/SVhEAfNMHjtxZu7kCVniZB2jLP5Wu/yaj9txq
         cNSzxQk+0JbvQ1uXJinjdA96z0FxHCvPIoDzDO1b+6IsPyDlcd2aZr7rPoKt5JTY2SeH
         mp9JRLNYpssAqK+hWzIB3+r5cv168SeF3uF8AX+zvBngztUUyBO6BUvrOSHIL096e0cG
         csfA==
X-Forwarded-Encrypted: i=1; AKwUvBzc9G14EQOtcz7OwNnKebE+DN11K25qZsu8q+lU92onjDMTwe8qTrvBJBhvuyyNWURJilnFlyXcGoLTdHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyyfwRb73bFajDa/uHdCVUAdKLuJXkn0U6ICOTu19kvFTAVL9k
	/mlDsvbAzvExwCiKeOxDH1cilzXWv75rmy+ioZmrNl2om90SEZ0ccE7aw2MwQGwz/L/UXCbo8xo
	APrRvCmN3sAiJwqEqCaM/Hg0MB7Oeiclr0b57gmrHNpCBnC4H8cXQeTmyXMWp5+XSu+jj42Gxcu
	gWZYa9eREhAtZWwfETJA+lISBDZX0HWsOG5TIPQOPMj0m8GxmXoEqgKDpUC1lwS7tFY2dim4P8j
	DbhZMT3EJWJVFM9mtrTTBNJ
X-Gm-Gg: AYBFou3xrObreV4DLsWhEa1VMbD3loxmIFWLWFkyfyXq5yoptl4pMB9BeyiWHdMVvqz
	iME9TLa4AXbUbMTIQnqpJWzV9asP3utN1FCCFG3QyPL6KZV5Mv0rA+4emU2t2gJSJNv5gafyj1f
	NgrCNCWenb6UZ9gqhSrc62HY3+9WBwJ4Xc6Dw+n+IDRV4oTTZLRJs4ft1kRP3c2GdyYHYj6uVmq
	eu+ldkSzi5i1QDA3UktwexmCOYOoGONHjjgDqE6nj1AHn3bfKe+WOvWN5l+WqByul+/SA2jcy0W
	X6ZdwnNffFYevl8YSfn7+8a6SDWhK6vsRRecdBPHzgXZkRGnDjzzsqM0bfGvKYS6tIi0OCLoH/p
	0ujjHrp0w4D6lsc9MkmcOp4mhRyKG8vTOZ2S+8gSUZU1QHAYd/olAgFE12uRxs2va/1kKytbP5W
	r9T8cu4o3RaEMKLrj4SiYTnYO0e1cxiPXwbjC622ok
X-Received: by 2002:a17:90b:224f:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3ae57e2ed45mr2402150a91.3.1793212420404;
        Wed, 28 Oct 2026 11:33:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae57a52031sm913415a91.4.2026.10.28.11.33.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:33:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so756416a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793212419; x=1793817219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR1t7sCl4LjwQgxmjEVNXFO9Cz1nfsLVq6mei2OzuQI=;
        b=gabX9mRrMK6y6c1v9Olt/QFZmEtVZ8TWhTviAFPaDb2FRsN5p1Nex6u+KXW6LJhei2
         ddy7SURWZ91jeuWiDlmuDTmdkspv3X4Bfd/NHvBuvJBuFLTq7oIOKUHkX14EXWAMny0e
         OMdg8+6kIDEH8WRMYIHZeJUK/26GXlYMrF3ls=
X-Forwarded-Encrypted: i=1; AKwUvBxoJDLoeVlGVRUghKw+QBo8dX7saWKngzaJm6IuCfatLOgLwzqM16rRPejEo1Qi0w527xF8gtTAYGhCrVA=@vger.kernel.org
X-Received: by 2002:a17:90b:4cd2:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae581d37e9mr2128514a91.30.1793212418558;
        Wed, 28 Oct 2026 11:33:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd2:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3ae581d37e9mr2128496a91.30.1793212418055;
        Wed, 28 Oct 2026 11:33:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83a4f1sm661571a91.12.2026.10.28.11.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:33:37 -0700 (PDT)
Message-ID: <a9e7da66-a9ae-4652-b15c-9064f20d927c@broadcom.com>
Date: Wed, 28 Oct 2026 11:33:35 -0700
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
Subject: Re: [PATCH net v2] net: dsa: b53: Enable IGMP and MLD control packet
 CPU copies
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20261028000912.2081659-1-florian.fainelli@broadcom.com>
 <CAOiHx=kKX0YWEkyp-HBahae_krDCXLAjO6kLPi1gJzpf7EOfMw@mail.gmail.com>
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
In-Reply-To: <CAOiHx=kKX0YWEkyp-HBahae_krDCXLAjO6kLPi1gJzpf7EOfMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/28/26 03:30, Jonas Gorski wrote:
> On Wed, Oct 28, 2026 at 1:10 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> IGMPv2 reports and MLDv1 reports are addressed to the multicast group
>> itself. Once the first listener is installed in the ARL table, subsequent
>> reports can follow that entry without reaching the CPU. The bridge then
>> fails to learn additional listeners, although static MDB forwarding works.
>>
>> Enable the high-level protocol classifiers so that IGMP and MLD control
>> packets are copied to the CPU independently of the multicast ARL lookup.
>> Retain normal L2 forwarding by clearing the CPU-only forwarding modes,
>> and preserve unrelated protocol-control fields.
>>
>> Handle the BCM5395's 16-bit register and different classifier fields
>> separately from the 32-bit layout on the BCM531xx, BCM5301x and newer
>> integrated RoboSwitch families, including BCM7445, BCM7278 and BCM4908.
>> Export the helper and call it from bcm_sf2_sw_setup() as well, since SF2
>> uses its own setup operation instead of b53_setup(). This also restores
>> the classifiers after the switch reset on resume. Leave older devices
>> with different IGMP controls untouched, and propagate register access
>> failures during setup.
>>
>> The SF2 setup integration and BCM4908 chip gate were updated with
>> assistance from OpenAI Codex in response to review feedback.
>>
>> Fixes: 5d65b64a3d97 ("net: dsa: b53: Add support for MDB")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>> Changes in v2:
>>
>> - export the helper and call it from bcm_sf2.c as well as spotted by
>>    Sashiko
>>
>>   drivers/net/dsa/b53/b53_common.c | 52 ++++++++++++++++++++++++++++++++
>>   drivers/net/dsa/b53/b53_priv.h   |  1 +
>>   drivers/net/dsa/b53/b53_regs.h   | 17 +++++++++++
>>   drivers/net/dsa/bcm_sf2.c        |  5 +++
>>   4 files changed, 75 insertions(+)
>>
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 0880310c9ce3..51784432d266 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -836,6 +836,54 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
>>   }
>>   EXPORT_SYMBOL(b53_brcm_hdr_setup);
>>
>> +int b53_enable_mcast_snooping(struct b53_device *dev)
>> +{
>> +       u32 val;
>> +       u16 val16;
>> +       int ret;
> 
> I'm surprised to be the first to say that, but ... reverse christmas
> tree? Or is this not a thing anymore?

Indeed.

> 
>> +
>> +       /* BCM5395 has a narrower register and a single IGMP classifier.
>> +        * Its ICMPv6 classifier also covers MLD.
>> +        */
>> +       if (dev->chip_id == BCM5395_DEVICE_ID) {
>> +               ret = b53_read16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, &val16);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               val16 |= HL_PRTC_IGMP_IP_EN_5395 | HL_PRTC_ICMPV6_EN;
>> +               val16 &= ~(HL_PRTC_IGMP_FWD_MODE_5395 |
>> +                          HL_PRTC_ICMPV6_FWD_MODE);
>> +
>> +               return b53_write16(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL,
>> +                                  val16);
>> +       }
>> +
>> +       /* Older switches use different IGMP controls, not HL_PRTC_CTRL. */
>> +       if (!is531x5(dev) && !is5301x(dev) && !is58xx(dev) &&
>> +           dev->chip_id != BCM4908_DEVICE_ID)
>> +               return 0;
> 
> I would move this to top, and probably check for those that don't have
> it. Basically go from oldest to newest generation code wise.

Sounds good, I will actually add a second patch that enables IGMP/MLD 
snooping for the older generations as well.

> 
>> +
>> +       ret = b53_read32(dev, B53_MGMT_PAGE, B53_HL_PRTC_CTRL, &val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* IGMPv2 and MLDv1 reports use the group's destination MAC. Once
>> +        * the first listener is offloaded, ordinary multicast forwarding
>> +        * can keep subsequent reports from reaching the bridge CPU.
>> +        * Copy control traffic to the CPU independently of the ARL lookup,
>> +        * retaining L2 forwarding rather than selecting CPU-only traps.
>> +        */
> 
> Should this comment be also in the 5395 case? Feels like it would apply to both.

Yes, this comment has been moved to the top now since it applies to both 
cases.

> 
>> +       val |= HL_PRTC_IGMP_RPTLVE_EN | HL_PRTC_IGMP_QRY_EN |
>> +              HL_PRTC_IGMP_UKN_EN | HL_PRTC_MLD_RPTDONE_EN |
>> +              HL_PRTC_MLD_QRY_EN;
> 
> I would also break out the "Copy control" part and move it here, to
> make it more obvious that these bits control this, and clearer that 0
> means copy to CPU instead of trap to CPU.

Yes, done as well, thanks!
-- 
Florian
