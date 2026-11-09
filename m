Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268596;
	b=FgbaWL5+cYKcfnPUGhlNwVzyt9R4QyQnib9RDP2Tt0afR7bt+FLO9ptU9X9u12WYOPDZ
	 hOscmzKw03O9aVLtKZ1WGLzhTm10fr7hKKahhTChBYcNb45AbzSsA6vZZTgc5LAC48JvP
	 9dl78f24APR4A4oasilFPEuvFxQ4UqlVDZM30U/pTA+1Oh/s8eGGxfY7S88VzMtag+OBl
	 SI+F8IPBIW9psUiFqX9SL+SHTp/jcxaOzf3ZYQmX9SwXBqkpSh/3QOgbFQw6nIjgfj8FG
	 21zeh4VjXUWuhUX4akFaV1R87SKKGbCV6mFRySCdrk6CjtIUbtDVVvMWkLGBMiBzFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268596;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=MV9l+zJLmKEJUA1yt63pBpC3JlqNH1CMzrjR4zJJ62k=;
	b=22/7TI430XB4L7hua9gfYp9uyN/BWFDaR35bap9Gsc6tUvlPPZ7CkaZDp/r9iuEOajSJ
	 DOBzXS5MmcObQaHxAmSvDM8idM+M4F9KOTk2kw/23RGHEO80Rhjjua88aJYRRcZoEat5J
	 oULGRsTR5mNWh2dmp1EJJpo2tI4WyxTDgbSk29ITnn/k2tfXhx9YIwsKGj7/lu61mGU9E
	 O9QksRcFZ/K2nS1ybB1hIVIhDCGZYMG/qMmZhhkDiZs4ke8F09Qr5TBg6ceaNmnq6T2h+
	 BuDpQQhD10qZMLz64KXYZ0wW5drX4/ZQIW1rDxh1kRHAYRBIROYouFqxAc5m5mdpJiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLCqFtn3;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941AD606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941AD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLCqFtn3
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso965220a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268595; x=1794873395;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MV9l+zJLmKEJUA1yt63pBpC3JlqNH1CMzrjR4zJJ62k=;
        b=R3Pdgd30aWmVDFEZVstN3t0XAIMJHQBW18iGzrRK7hHnnZptz0Vm/Bco9/6XdcTLvD
         YjpS5JF9GMF0zgsk0ZG8J9C7YDiyEI9NTmpuf28ib4XpqprcdOPhIFs8/iVYX+ii8sVU
         fzuHjDC1TflY2eQRO9/adJK+JMF1vp/jvXmeijRCFsPb4XBEwsVU/XyMrvH93uu45FvB
         ukX3pM6Jn/qS0GD/KQBiVaLWN+jbzeSmNZbJMfTydyUl+9ai7luUWCMP6RHxb766STZM
         tAEJgEBDSdzsXguzOcZrTRXd4JjfXS+ImImBkpjpwg6RRkWxP/eqhDb9hF8gqpQ5GOwD
         Xv9g==
X-Forwarded-Encrypted: i=1; AL+hErH2QdiNG984oDDTOH6nRwcoCcYL7mDskSk0z98R+LU2e/JOgDcpyYWl1Ti/hAAq46FmVMJ+QU1Cjh9c1qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91YCsB6NfSjtSLICfb7S7ZOVfaJJZ23dN06itmzP6p8csYH47d
	RkYYDTnPxAebsSPviM9EfwUxY1leFQ1pSou63YOrcA18j7THa9jc7ty2TfjCT7EGw5IQdH8P9jT
	A0ZZn+96AYsTsBsNO2le4vtVahCNqmaZQhU4P6vy9beBzlzelHPi1XELczlo6NarhvKNqGDdawn
	5H/CTZVfUQNKnhV+WLG0tnIFZRGsrr6ymAk5pp8AKWOQkY7NBZzkVlhyWfFQfss+eR3ivjagkVf
	vGSpa2kVyudNVbskDRhiSCv
X-Gm-Gg: AYBFou1+BOxMGIRQCe+IglRSybd4qbnAC2COdWhWOoDxMtFVDzeAu3tW4Pv2pjBmqfq
	hCMtRllx2+REYnda4kwbsySaL4VaJjVeBObSEcLh1Va5V46VmRnuRTPVlOI0o3TEMLO0xC2vGkw
	wCaS4m0pL1hBxD5OH8LIuyAF+ibKDY+616Q/Ddtdh6t5+LoRnL80FCyrb914BtGDKN9RfKearec
	JQW49BS34Q6m1ogZPQzkbTPlrunLywghqQJpv0vfECzBGnxQgWi0FPOPba1WATTFCqChRGu4agv
	fH93pHx6q6DyCCwhJsYU5U06pg6AS8rXWrSava+ejobo0RISkibdxZQMngvpfx8w0V/kkD0WnpL
	9Ue7GfhQjXiIvyREzcElsZZabKVfGpv/ZEYOtYiLbyCDruXQl7WtgJAoZtPszwqWs8aWY+cMhlc
	d8yyBqS/V1iq2M2YSQhDTDh1PAfntLdP8EWkRtH+Sl
X-Received: by 2002:a17:90b:1b03:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b166c8486cmr1124080a91.14.1794268594675;
        Mon, 09 Nov 2026 15:56:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b168b567ebsm230818a91.0.2026.11.09.15.56.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 15:56:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea4a2210fso16500126d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794268591; x=1794873391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MV9l+zJLmKEJUA1yt63pBpC3JlqNH1CMzrjR4zJJ62k=;
        b=VLCqFtn3HS6Mup60PGesKPi/CqY6dd6JQ+EePcPvKPpyGx8Y1dzAOiGdnwUvOXP0Jf
         LpV0BlaC2pikJaZhO1Ee4xzP7t0NfH/KdhqyS5h8WnYEU3DmtoRek0ARdXbhujnpj7fH
         PD7c4374lNxh8H1CNF+pP3C13u3FUWYmf/szA=
X-Forwarded-Encrypted: i=1; AL+hErE/eNF9SBVvNSghRyMFtsiPQbDv8ihg3UzdbPXAC4c03Yf3Zp4LNOlPrDcOIQqOMdjDO4ICpPs5WC7rnh8=@vger.kernel.org
X-Received: by 2002:a05:6214:c2a:b0:91e:8c55:e005 with SMTP id 6a1803df08f44-91eef93d977mr19944576d6.39.1794268591083;
        Mon, 09 Nov 2026 15:56:31 -0800 (PST)
X-Received: by 2002:a05:6214:c2a:b0:91e:8c55:e005 with SMTP id 6a1803df08f44-91eef93d977mr19944316d6.39.1794268590351;
        Mon, 09 Nov 2026 15:56:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04fe53asm7909876d6.27.2026.11.09.15.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 15:56:29 -0800 (PST)
Message-ID: <41b76df2-d07a-4b59-93b6-5e4e6fe264e1@broadcom.com>
Date: Mon, 9 Nov 2026 15:56:27 -0800
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
Subject: Re: [PATCH net v3 3/8] net: dsa: b53: clear stale state when creating
 an ARL entry
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261030211617.288562-4-florian.fainelli@broadcom.com>
 <179348376043.3131.9215522572202391161@kernel.org>
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
In-Reply-To: <179348376043.3131.9215522572202391161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/31/26 14:56, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In b53_arl_op() (drivers/net/dsa/b53/b53_common.c), deleting a
>    {MAC,VID} that is missing from the ARL now returns -ENOENT.
> - [Medium] Deleting an ARL entry that is not in hardware now fails with
>    -ENOENT, including the -ENOSPC lookup result, which used to return 0…
> 
> --
> 
> net: dsa: b53: clear stale state when creating an ARL entry
> 
> When an ARL lookup misses, the patch now clears the b53_arl_entry before
> building a new one. This stops a multicast add from ORing the port into an
> unrelated bin's bitmap. A delete of an absent entry now returns -ENOENT
> without writing to hardware, and that includes the -ENOSPC lookup result,
> which used to return 0.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 559d4b360c828..c38e8c5838bd8 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1990,11 +1990,15 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
>>   	case -ENOSPC:
>>   		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
>>   			addr, vid);
>> -		return is_valid ? ret : 0;
>> +		return is_valid ? ret : -ENOENT;
>>   	case -ENOENT:
>> +		if (!is_valid)
>> +			return ret;
> 
> [Severity: Medium]
> Can returning -ENOENT on delete leave DSA's host address tracking out of
> sync with the ARL?
> 
> b53_fdb_del() and b53_mdb_del() pass this value back to DSA. On CPU/DSA
> ports, when the last reference drops, dsa_port_do_fdb_del() in
> net/dsa/switch.c treats any driver error as "still in hardware":
> 
> 	err = ds->ops->port_fdb_del(ds, port, addr, vid, db);
> 	trace_dsa_fdb_del_hw(dp, addr, vid, &db, err);
> 	if (err) {
> 		refcount_set(&a->refcount, 1);
> 		goto out;
> 	}
> 
> 	list_del(&a->list);
> 	kfree(a);
> 
> dsa_port_do_mdb_del() handles errors the same way. The struct dsa_mac_addr
> then stays on dp->fdbs or dp->mdbs with refcount 1.
> 
> A later add of the same {addr, vid, db} finds that record in
> dsa_port_do_fdb_add() or dsa_port_do_mdb_add() and only calls
> refcount_inc(). port_fdb_add or port_mdb_add is never called, so the
> hardware entry is not reinstalled. The record is only freed by the leftover
> sweep in dsa_port_teardown().
> 
> How can the hardware lose an entry that DSA still tracks? b53 doesn't set
> ds->fdb_isolation, so dsa_port_bridge_host_fdb_add/del() force
> db.bridge.num = 0, and all bridges share one ARL namespace.
> 
> A unicast ARL entry holds a single port. A user-port static FDB for the
> same MAC/VID, for example in another bridge, overwrites the CPU port's host
> entry. Deleting that user-port FDB invalidates the entry, and the later
> host delete then misses.
> 
> There may be a second path, though I have not confirmed it.
> bcm_sf2_sw_resume() calls bcm_sf2_sw_rst() and then ds->ops->setup(), and
> does not replay FDB/MDB entries. If that reset clears the ARL, every later
> host delete would miss.
> 
> Before this patch, the 0 return let DSA free its record, so the next add
> reprogrammed the switch. Would returning 0 for a delete of an absent entry
> fix the stale-bin problem without this side effect?
> 
> The commit message mentions the return value change, but not its effect on
> the DSA core refcounting. With the Fixes: tag this will also go to stable.
> Later patches in the series don't touch b53_arl_op(), b53_fdb_del() or
> b53_mdb_del().
> 
> [Severity: Medium]
> On BCM5325 and BCM5365, does this make every MDB delete fail?
> 
> b53_mdb_add() returns before it touches the ARL:
> 
> 	if (is5325(priv) || is5365(priv))
> 		return -EOPNOTSUPP;
> 
> b53_mdb_del() has no matching check:
> 
> 	ret = b53_arl_op(priv, 0, port, mdb->addr, mdb->vid, false);
> 	mutex_unlock(&priv->arl_mutex);
> 	if (ret)
> 		dev_err(ds->dev, "failed to delete MDB entry\n");
> 
> The bridge calls switchdev_port_obj_del() on RTM_DELMDB whether or not the
> add was offloaded:
> 
> br_switchdev_mdb_notify()
>    switchdev_port_obj_del()
>      dsa_user_port_obj_del()
>        dsa_port_mdb_del()
>          dsa_port_do_mdb_del()
>            b53_mdb_del()
>              b53_arl_op() -> -ENOENT
> 
> So every group leave or expiry on a bridged 5325/5365 port with snooping
> enabled would log "failed to delete MDB entry". It would also log a second
> message from switchdev_port_obj_del_deferred(), which only ignores
> -EOPNOTSUPP:
> 
> 	err = switchdev_port_obj_del_now(dev, obj);
> 	if (err && err != -EOPNOTSUPP)
> 		switchdev_obj_id_to_helpful_msg(dev, obj->id, err, false);
> 
> On other chips, when a user-port FDB or MDB add fails with -ENOSPC, the
> bridge delete that follows now fails too. For FDBs,
> dsa_user_switchdev_event_work() then logs "port %d failed to delete %pM
> vid %d from fdb".
> 
> Should b53_mdb_del() get the same 5325/5365 guard as b53_mdb_add()? Or
> should a missing entry on delete be treated as success? b53_arl_op() and
> b53_mdb_del() are still the same at the end of the series.

Agreed. I’ll respin this patch such that deleting an absent entry 
returns success for both lookup-miss cases, while retaining the early 
return without writing hardware. This avoids retaining stale DSA 
host-address references and errors for entries that were never 
offloaded. I’ll update the commit message accordingly.

pw-bot: cr
-- 
Florian
