Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724035;
	b=phvxK5xRCttvYN/nhPjPtidpfnvMhphztglPFjey89222e2bRirNmHdRI62DuH+6emNI
	 J7E65+Eqtt5oT+P0noz4vfeU8nY43oPim55iRXyG1ok7lRxfI6elgibhLZI1GjmI0cqqr
	 eDKis0fv4gNP5BO5onII6HuO5bfUk/ucLk+k3gE/ih+Dk+1ys84B/HyN6+YwK7VPnuGJ5
	 GWhFO97Y9wIgMHPGfyUJ7+rXAlM+Akl7wExcrMuDr3WpKok0ewKOB8I3en8qU65k14p7s
	 rx+/THRY5Owl6tsYpFnRZkXWuzy7Mu4cbkbfL7QKnmYqrT4ijg9lRfJivJRz0kKbv8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724035;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=WyneMzdBZQTXt6uP8ULfkQbHSCb7U03Fkta6DFQ6puY=;
	b=ftwhO4fJDiQ2SGWdao7mJrTbTm2vpikTJx+DQfLu5HrAEuEhBKmBwVmp6FJ5WvRPFUAN
	 NHh+0hUwkZRD57aR5ihR8RXqmDN57h7zm4rgJNsINbjk2bZqUaKlqkapWSy8kX3tPg9HR
	 x35ljwr6w0MyQl9W028YDWLsNYliTYqKPJgqqIhdlyZ5up7Yv0xed2iS3OOZmDxwIhg+c
	 tF6KouBQGvd+k3pmzo2Kuwje13Lq4UaFvjzXzb+ue/l7M0xZ82utdwjX1H7cKvoC7y4lb
	 HyVVcDxWzu8zK6ZdwqPFZyBa0MHk/HOvQxvu4eZx+67p8s3gnewZNThuskKNXFnq2eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DxoqhKjs;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B79606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DxoqhKjs
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso26645235ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724035; x=1794328835;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WyneMzdBZQTXt6uP8ULfkQbHSCb7U03Fkta6DFQ6puY=;
        b=iZJX0L00ZOe/wl02J8pQ6MMsOtwMtkwZzWn2sVN0SDjiB7vf1ldGBLhDf/l+9eiNuR
         vgT2M2+zZWfhcLMFo9C4szQ0s939/rJ5TjFwgHZOzFRZCIE4tt3H1WlaCbM3JtgvE8cX
         g3EFsFHt/E/cIcmf5E1D6vpBixIDLq5gVP0mlf02a6XwFW3DyFjKpW5stUokf6XHgFik
         mvrDmVfiMf5o5NUBlk/ml4whAglHHM1vy8SaPIwCQnLyWAUNtjugA6NTaIbsUSlcovJc
         wpd0JTMs+y4poWycNsriPuET7OwwIVw3lspm5TGVmDH3gBsaLS2yilhD6HtK3lV8DPAS
         /vNg==
X-Forwarded-Encrypted: i=1; AKwUvByv/StLI9iJv4DQJd1Yj9E9J1msPQfQvHA+gRkrf80FnA+zfgQBASdqR1IjQ0mjZ1gZOZsOig3NGds/9zg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JzVVRCtarb8V/DGCQoSe0LAFL0LZiP/JBHsSkpJADkHO/fwW7
	g1lFYWzo11k/Ec4fB9i1SlHnENNtawklhlqvh+fNBkb1+rKunOJNXXWPzYtAUEHtbeHZNfRqZ1I
	NMlZJWVD1gNoZWcB51HwpD8+AU+8HMPJbZe9aRJeqtoFtjcRgYxDx/ac8LiuYY8r9A6WJpz60Pj
	VAaV6NrgHP8SSQuT/eTp9Ar9URgRbAMtHGz72EL5q9syZpZwongOQGRkqkte9Y+As+5e5U3sC0W
	gSxkjx/F2xUPD6AX8QvG+2PLyo=
X-Gm-Gg: AYBFou0+n/Lxut/FUCXXbefcLX1FaCdYNbLWRD5PZGmxhKSDkSqR3yCPEAmAxCwyO5B
	lKmDkZWP3W8k3ioK4XSvMe8XazGSuDw495HXkOUwI6PIrhvJt8B4oL6mOMdn+3tbKvlnGDdm7ss
	P5l/Acrfj35eLD/StDH7VvwLif1bIFDD+XMRjPQgsx3Qo9LGEtRaqSneXt7lSEBxDWaa/+rB89v
	153g6GzWTnmiSyeAvUmplPRIwPIuo/DEBBiWb825M06H0MT53Z+yDh1Rd6wOFl8QpLxfTY/Txz0
	cv7B8+3DGhPSSSuFEDMJOYLvFNeF4j/xxm8EQ72TudLdhbmHQ/o0J5zBh7qoNi+cfJBivkOVl6m
	JAAdWPcOiNq1K1dT65IHnYR2na+WrUDyMq4c0mHl64N4JfobvzrEg545nVfdayMrmDpB/6F5v6V
	zhhBkZ/J4JOH6ymwNJp40K4hi83+bh+vVovn4WY++6
X-Received: by 2002:a17:90b:2c8d:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3ae8987e32amr11219018a91.67.1793724034619;
        Tue, 03 Nov 2026 08:40:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cabc00asm2170877a91.8.2026.11.03.08.40.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:40:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so3790741a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793724033; x=1794328833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyneMzdBZQTXt6uP8ULfkQbHSCb7U03Fkta6DFQ6puY=;
        b=DxoqhKjstIzARwug22HcNqXN45934bkWPKP2kwj9sJ+1L+yxYOV9bT7mmyyAQbkeCP
         beqIpb6p5TmGm87YGi+gGPEnLM7TKbcn//LT3sdI2LSARJjfh9OJkadHG7gsNycYf83D
         kPdja4rMAuzPYrWQ/gOpHG08bhMemJUd03s10=
X-Forwarded-Encrypted: i=1; AKwUvByPvMHOnt4tz0O3PL51mZjwKkOBWdEOmChyLAHu1s0iy8Z3cOZoJ3DALIvCaQpmJNGQtCZLgKAbe2RK28M=@vger.kernel.org
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr10995753a91.0.1793724032848;
        Tue, 03 Nov 2026 08:40:32 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr10995726a91.0.1793724032307;
        Tue, 03 Nov 2026 08:40:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5adc33sm5157831a91.1.2026.11.03.08.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:40:31 -0800 (PST)
Message-ID: <f4db7d5d-0c92-4cd5-a933-a64bfe670ccd@broadcom.com>
Date: Tue, 3 Nov 2026 08:40:29 -0800
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
Subject: Re: [PATCH net v3 2/2] net: dsa: b53: Enable legacy IGMP snooping
 controls
To: Paolo Abeni <pabeni@redhat.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk,
 linux-kernel@vger.kernel.org
References: <20261028235100.3892374-3-florian.fainelli@broadcom.com>
 <179357816089.3131.2008365378649919842@kernel.org>
 <3edcc63f-aed7-47fe-bee3-703c6becbbff@redhat.com>
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
In-Reply-To: <3edcc63f-aed7-47fe-bee3-703c6becbbff@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/3/26 01:16, Paolo Abeni wrote:
> On 11/2/26 01:09, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let 
>> patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your 
>> reply
>> (one such reply per series is enough).
>>
>> - [High] The commit message says: 'These legacy classifiers have fixed
>>    forwarding behavior, including query flooding which excludes the IMP…
>>
>> -- 
>>
>> net: dsa: b53: Enable legacy IGMP snooping controls
>>
>> This enables the IP-layer IGMP classifier (bit 3 of the global management
>> configuration register) on BCM5325E, BCM5365, BCM5389, BCM5397/5398 and
>> BCM63xx, which were previously skipped in b53_enable_mcast_snooping(). On
>> BCM6318 and BCM63268 it also clears the IGMP redirection enable to select
>> snooping mode. BCM5325M and unidentified BCM5325 variants remain 
>> excluded.
>>
>>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/ 
>>> b53_common.c
>>> index e54f6d4d1f7bb..957a1501d3f49 100644
>>> --- a/drivers/net/dsa/b53/b53_common.c
>>> +++ b/drivers/net/dsa/b53/b53_common.c
>>> @@ -841,12 +841,29 @@ int b53_enable_mcast_snooping(struct b53_device 
>>> *dev)
>>>       u16 val16;
>>>       u32 val;
>>>       int ret;
>>> +    u8 val8;
>>> -    /* Older switches use different IGMP controls, not HL_PRTC_CTRL. */
>>> -    if (is5325(dev) || is5365(dev) || dev->chip_id == 
>>> BCM5389_DEVICE_ID ||
>>> -        is5397_98(dev) || is63xx(dev))
>>> +    /* BCM5325M snooping uses the mirroring engine instead. */
>>> +    if (is5325(dev) && !is5325e(dev))
>>>           return 0;
>>> +    /* Older switches classify IGMP in the global management register.
>>> +     * They do not provide the separate MLD controls of newer switches.
>>> +     */
>>> +    if (is5325e(dev) || is5365(dev) ||
>>> +        dev->chip_id == BCM5389_DEVICE_ID || is5397_98(dev) || 
>>> is63xx(dev)) {
>>> +        ret = b53_read8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, &val8);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        val8 |= GC_IGMP_IP_EN;
>>> +        /* Disable the separate IGMP redirection mode on 
>>> BCM6318/63268. */
>>> +        if (is6318_268(dev))
>>> +            val8 &= ~GC_IGMP_RED_EN_6318_268;
>>> +
>>> +        return b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, val8);
>>> +    }
>>
>> [Severity: High]
>> The commit message says:
>>
>>    These legacy classifiers have fixed forwarding behavior, including
>>    query flooding which excludes the IMP on BCM5397/5398 and BCM63xx.
>>
>> The message describes this as fixed hardware behavior. Isn't it actually
>> something this patch turns on?
>>
>> Before this change, b53_enable_mcast_snooping() returned early on
>> BCM5397/5398 and BCM63xx, so GC_IGMP_IP_EN stayed clear. IGMP general
>> queries to 01:00:5e:00:00:01 were then forwarded as ordinary multicast.
>> The IMP has PORT_CTRL_RX_MCST_EN set, and the bridge never installs MDB
>> entries for 224.0.0.x, so those queries reached the CPU.
>>
>> This path now runs unconditionally at setup:
>>
>>    b53_setup()
>>      b53_enable_mcast_snooping()
>>        val8 |= GC_IGMP_IP_EN;
>>        b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, val8);
>>
>> On BCM6318/63268, snooping mode is also selected explicitly. With that in
>> place, would queries from an external querier on any switch port stop
>> reaching the CPU on these chips?
>>
>> If so, these cases look affected:
>>
>>    - the bridge can no longer learn multicast router ports or detect 
>> other
>>      queriers from the queries it receives
>>
>>    - the host IGMP stack on br0, or on standalone user ports (for example
>>      an igmpproxy upstream on a WAN port), never answers general queries,
>>      so the upstream router would expire the host's memberships after the
>>      group membership interval
>>
>>    - on standalone ports, where the port VLAN mask only allows the IMP, a
>>      query flooded excluding the IMP would reach no port at all
> @Florian: could you please comment here? I'm unsure how much legit the 
> above
> comment is.
> 
> Also this series is IMHO borderline for 'net' as it ends up enabling a 
> feature
> that never worked. Would you consider it for net-next without fixes tags?
> 
> In any case, if the AI comments is a false positive, no need to repost.

This is not a false positive, I came up with this additional patch to 
please the preview AI reviews which I found legitimate, however in 
hindsight this is definitively net-next material.

Can you pick up patch #1 on its own if you and other reviewers are now 
happy about it?

Thanks!
-- 
Florian
