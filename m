Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145819;
	b=hvLDO36wd6cd615qTRqCWadonkxaDoGjTMvU1qoirg8XxyJmp88uts8fzhNN79KjP004
	 Xb/FlddgKNYZFzdbCcerUwcRw/Evhh8E+MowpLXGXnpzmtgtYtWaff6iLyiAH7T2EQdqk
	 MVWVulPe2ZVirfj4uvBwFJI4mX4DEJr3sLroeGnGnleXqOqpQBW0pOHwbByCB1Lg9D8L+
	 p+AnpF4Ct21ZV3kVcKgIKO1qMUqDw/iSnKV4yHV9lJHh2P62q7VZhMVNCKPnChmO3cvwR
	 JgQunYfgtMqhvnGHWxXGZPfSJan89WZw4zBDk24i34v2V0d+6f34qiK/gbBv8o+oe7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145819;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Rp7LGkUVrmXCkphyWnFX63KRi+EDmDlHYBY1YDA4Aj0=;
	b=BW+mojAz/rlbLBTMWsnGNPfqftvZlcVwPuRVFDfKfT7EWscZbYf0HuNsD05o/ED/8l2l
	 jdhzEPoK85zIXNqd91UdDAfeSRrISl3kMga0v/K64is4xXN3AxsLtNzdq7aKguBMjwk7U
	 kE/qemCU+Zh581cuBJCv42O0vlUj13TrT3wbRRRONStJvMwWHpoVVyR+aLQ8IkcJSQQou
	 ZE/eJmVu2/wr+X/KuzRGKkzaOjbIXeEkwLYl0jCH63I8OdnAOBMIq6BV1NohKlVz1AD88
	 6z0s/8hNYGKds+5tYH+SAuJ6DluESANNeLmTFlvknU8te2OTlyRaftQNlHE9YD0MBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="MuFrW/mx";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46E8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C46E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MuFrW/mx
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so210411a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793145818; x=1793750618;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rp7LGkUVrmXCkphyWnFX63KRi+EDmDlHYBY1YDA4Aj0=;
        b=kID7q3B/yxeBJdy0TXmCT9tV/z3i/3HXw8k8K46oQnQ/w3v3qndtBMA2M+uKtzcP1b
         mvzHRUKtjVsqUT6OP10UzC0KQyGpV2vxljqcYa+HqyBYlpN4enpV6cnJIjcQ/Mot5BDX
         hkTlxXqp+7SLy/LKRRNw2MO+QA46go2gsxJREKROUSseoc/r624J9vgytwFJe420d+Wt
         KeUlTh0+seAPpOBc9XPD8/Xsfq2CF1ijup0/DbHRRW5tfO+soLz527FG4RUg02yMsMPk
         QLS9pXqJ0urGsa2AeJZ5SaykpJkg05ie4yeZgyUwpZP3WoTSOgLNPHAMOsHJFpirEvvS
         NUug==
X-Forwarded-Encrypted: i=1; AKwUvBxhnOlFZM/tCZ7inbC010EiSvqHSjrfXX1cGcZeCl/W/TNnRywWqBd4tTPXg7Fi/0/HoQEWPDGsORL4DJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSlhzPiJ69NDC1RYXpNoP/TDn9KM6IHGfJuSC7uUZ65K9cDD08
	XRGcW21JjofZyykCWtGedXVJpCqev/9Nzp+rL07pCLlTgTzKNbR513ejdyh+S90Y+lUBOCFibJ/
	5sSwiIWkI2jpAZ8adre0t+Td0csOF98EAakij48C7cYePH60o3l3Y9T9mP+fA5vqx+4NnVNVaIF
	FHVyW8uwUtGi4GyZxh0t+QGdnWfnPRtUzvnzaQdSeYPQgRXw4CyvBKF22hWyjq6PvyBoQ3G8vrp
	UkF3NEeIl668osd+O+Kp1QNlcs=
X-Gm-Gg: AYBFou1ArSv66zpXTLBmy7cmLeJeb8Pu2L0jf3H1PTq3Gl7Sy/i//Yq7pIb71OC/Vw6
	2BXsH5k6lQDXqX6vQxZwI8G9h0vF7xVS6RT1xaBk1xoUr3R3Ho08hod+pI5nxiK9J4XZ70jczAP
	GaoEEuC4Jlp5dfFGh1iVCfap03q3Os0FzT4tRwIDnewJtIipZpmHcpDSsCm6MKj7H81pLJfEAVU
	wtA0hSQ9w8+IeZxmiEHmX1nQIofPMLYzY6ohZ591ZPZst1I4eARQ4aD0/BXs40qMQ1pMbX8aHAb
	CJbkA8G0lVda/wywbnKmel/yt9a9MYXlagnZNTyS99XMoe/gHLn0gU0mUNcGy11Yomzpp/AT3uG
	SIyGwG4LA2qahfIJk+enQ0dGDl1zaQf8XuWCNO/cZObjb9o5+1qPrJPV0e4Q2K79cWfW5xZHKHc
	eF8/iaLis3Ocy1fFmlSMBQ5rij7txc+5j0+mYuXXBN
X-Received: by 2002:a17:90b:4b89:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ae580a902fmr545006a91.14.1793145817984;
        Tue, 27 Oct 2026 17:03:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae5a46031fsm269009a91.0.2026.10.27.17.03.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 17:03:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso915344eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793145816; x=1793750616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp7LGkUVrmXCkphyWnFX63KRi+EDmDlHYBY1YDA4Aj0=;
        b=MuFrW/mx4OhoKwTeMHEKaDLpPUYiy5REIZcktnxS8NVsVsBnnbbe9o09+IdKadyyDz
         FEieNvAaohMLKVHYbSeq4wahwRO2bK3nSK5+829ujX15OwhdSzLbJfDWLOdINzPtwLBo
         2Vd5RfSWUyqWd1SehGYgg9yHvlcbzz5tsfvBk=
X-Forwarded-Encrypted: i=1; AKwUvBzPQa1ipfJHY2EnU7lDzxD8EGF6GT2fLYRDZe+q2nPUbcBOs8orIipy52ig2Ah9YEGkGCvbI1grbWxMN+U=@vger.kernel.org
X-Received: by 2002:a05:701b:42c6:20b0:143:54c6:6a5 with SMTP id a92af1059eb24-1a6d00d2a21mr1002786c88.37.1793145815828;
        Tue, 27 Oct 2026 17:03:35 -0700 (PDT)
X-Received: by 2002:a05:701b:42c6:20b0:143:54c6:6a5 with SMTP id a92af1059eb24-1a6d00d2a21mr1002748c88.37.1793145815151;
        Tue, 27 Oct 2026 17:03:35 -0700 (PDT)
Received: from [192.168.2.21] (wsip-184-189-202-35.oc.oc.cox.net. [184.189.202.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm229439c88.19.2026.10.27.17.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 17:03:34 -0700 (PDT)
Message-ID: <2c6f6e8f-2e82-44f7-a789-599e6b0ba189@broadcom.com>
Date: Tue, 27 Oct 2026 17:03:32 -0700
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
Subject: Re: [PATCH] net: dsa: b53: Enable IGMP and MLD control packet CPU
 copies
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261026172453.3152951-1-florian.fainelli@broadcom.com>
 <179314132517.3134.14168811742216365656@kernel.org>
Content-Language: en-US
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
In-Reply-To: <179314132517.3134.14168811742216365656@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/27/2026 3:48 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new IGMP/MLD CPU-copy setup in b53_enable_mcast_snooping()
>    (drivers/net/dsa/b53/b53_common.c) is static and has one caller,…
> 
> --
> 
> net: dsa: b53: Enable IGMP and MLD control packet CPU copies
> 
> This commit enables the IGMP and MLD high-level protocol classifiers in
> B53_HL_PRTC_CTRL, so control packets get copied to the CPU even when a
> multicast ARL entry matches. This lets the bridge keep learning listeners
> after the first MDB entry has been offloaded. BCM5395 uses a 16-bit layout,
> BCM531xx/5301x/58xx use a 32-bit layout, and older chips are left alone.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 0880310c9ce3f..54844cfadf019 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -836,6 +836,52 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
>>   }
>>   EXPORT_SYMBOL(b53_brcm_hdr_setup);
>>   
>> +static int b53_enable_mcast_snooping(struct b53_device *dev)
>> +{
> 
> [ ... ]
> 
>> +	/* Older switches use different IGMP controls, not HL_PRTC_CTRL. */
>> +	if (!is531x5(dev) && !is5301x(dev) && !is58xx(dev))
>> +		return 0;
> 
> [ ... ]
> 
>> @@ -1334,6 +1380,10 @@ static int b53_setup(struct dsa_switch *ds)
>>   			b53_disable_port(ds, port);
>>   	}
>>   
>> +	ret = b53_enable_mcast_snooping(dev);
>> +	if (ret)
>> +		return ret;
>> +
>>   	return b53_setup_devlink_resources(ds);
>>   }
> 
> [Severity: High]
> Does this fix reach the Starfighter 2 switches (BCM7445, BCM7278, BCM4908)?
> 
> b53_enable_mcast_snooping() is static, and its only caller is b53_setup().
> bcm_sf2_sw_probe() sets the chip id and then swaps in its own ops:
> 
> drivers/net/dsa/bcm_sf2.c:bcm_sf2_sw_probe() {
>      ...
> 	pdata->chip_id = priv->type;
>      ...
> 	ds->ops = &bcm_sf2_ops;
>      ...
> }
> 
> bcm_sf2_ops sets .setup to bcm_sf2_sw_setup(), so b53_setup() never runs
> on these chips. bcm_sf2_sw_setup() does not program B53_HL_PRTC_CTRL:
> 
> drivers/net/dsa/bcm_sf2.c:bcm_sf2_sw_setup() {
>      ...
> 	b53_configure_vlan(ds);
> 	bcm_sf2_enable_acb(ds);
> 
> 	return b53_setup_devlink_resources(ds);
> }
> 
> bcm_sf2_ops still has this entry:
> 
> 	.port_mdb_add		= b53_mdb_add,
> 
> So multicast ARL entries still get installed on SF2. After the first
> listener's entry exists, the original problem looks unchanged there: later
> IGMPv2/MLDv1 reports sent to the group MAC follow the ARL entry and never
> reach the bridge.
> 
> The resume path, bcm_sf2_sw_resume() calling ds->ops->setup(), has the same
> gap.
> 
> The is58xx() part of the gate above matches BCM7445_DEVICE_ID and
> BCM7278_DEVICE_ID, but devices with those IDs never reach this function. Is
> that check dead code? The commit message also says this covers the "newer
> integrated RoboSwitch families".
> 
> Should the helper be exported and also called from bcm_sf2_sw_setup()?

Yes, all good points, will address in v2.

pw-bot: cr
-- 
Florian

