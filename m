Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122274;
	b=zMifepi2+DKLttRYzggLYAe+qyWrbw+HYDkijRZiPpS/xvBLb3WpweMegRD4zsW51TCH
	 K51sZl91AubnYlFuVlq8rJOo+6JeAJ+eXD2MTrz+sRoiWVcRlhvZ6g1zf/dOd6seGZRc4
	 UL0NTF/67vCUdm2vfwOo8BKlZHS+ihcRp+Z1YkeaIM+7NDmeXMCocj5QtjcJj7i/l0R0e
	 DwYTnzZvNYmDlgreE1fKnfXyKjDOw/ZcWfx1z1mEheqqGaXskEYdh5YaaOHrzZm2X3URR
	 FJiQmK2Ad/KULsGOlPyzU/e6JZH6akEk+KZ/kiIKZifM34t8E6IQ9Ua9fX/D/ZUDX2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122274;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=yU8D0sG+nfhP0Zoa6lOz8zWSfCN6EQZHrPZeFRloBxo=;
	b=fefCEyANlIWnAkbC07VvXzs3nyvru6Uv7I0IWZCKWgyf16LVyJIC1663WOWEYA7X/LkA
	 Trf1N6Q5MSMTcL4YoP2IaRjCxPwzbdjKGFlMXzF7nTpXd8FlfRqQ9G9ydG3+nkhFOh/0p
	 BMbQVP6pJHjTRrsXgUYEos5HljMRXOyBJzayZ59H9dTbyumUmUh6y9qAJDNRV0xbbHtY7
	 4qt70EOsRp+wHP4W+tmWtQJ1NGsXjWt9coLtVzHniYbTzkvRmg9zeQiP20m5vu+6dwf1Q
	 qaoZngK7W+J8KI0PlcA1BJEph4WyL1mBQ7TdBC83T5F+K34B8LUpmNe0X4Qx9Mke7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="gNA/ACmr";
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C225606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C225606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gNA/ACmr
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e7e742a2c7so887025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122273; x=1793727073;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yU8D0sG+nfhP0Zoa6lOz8zWSfCN6EQZHrPZeFRloBxo=;
        b=ax3Ph+NWtoLBoXvuqhskgkMZXdrSZ59q9OBxm/7SJg2+qKwF2G8XE2lHsLOYsKHrn6
         dvdfubLps7t0yjeUit1jhKvCTaHXLLDIum2VKrpzhVSsxbsCuyejnqbCChXx8zHBSols
         0vQAZCqj8OZjiFRwy092sHhpNI3M3a6dfRLE01aCdQWYQgR6AO7n4g5PLxdwPmzU9fIM
         scB5x2vbqpF7mYj0qOemdLp4KfaW3FpYGK7c1v6YIQ05E2yJ0eexaNhOiq+k5/DID82U
         /vI38Q6pA5eOdLpBAjdHILjaJoPPDTU+AtnelbnBCP4e5W9Wpk0eE+aMKeon5WxxTaME
         O/Bw==
X-Forwarded-Encrypted: i=1; AKwUvBycDg+rGOQEVO+JnkGK8tgRPSMgtlhGVksd+9VHs3DV0nwFMExPI1Pq26lMNcTHYbrK05RoAfB7HJJ0vqs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuTVQVt+6c2bqAzrklby9fGECoKu5Oz1bgutqDY/ALGGXrsnBj
	HkRCWQkLJiUvXapq5K3LLsAOD8pAZpKDozLugQw2xIszyrcTvt7oXUnJb4pxrShS8ZSBZi6E1bF
	bEwsIXOZ0xsykg86SpouON8xKYlrZGSpzN3O4Mb7T2mXa1BmBRI7oTBYfUho55+o3wPfE2rwMkK
	oiiNJOlFqNbSsfk54O20N9gCB0cE1tO5Bv7WnWIE37t2wg6HNzdFXqj1RIZXD3XwjhfzhVfy519
	yx2R6kaSHyRXqT+IqAzBxmWa6I=
X-Gm-Gg: AYBFou3IHEL2QSds1fRMtrvsRgdJi08UvhUcb3XnSxmQW6gvhhSB9EWqZOg5NjRI0u4
	dz6+N1lCKNBH/aR0lU+EAs3+4FhPpqgH+OP+wa7wewDY/U8paOA0vTb31FO8PlMgvn01+v2njH9
	I8r4izBM+OL5Noun7pvm1YnxKg8VlRS4JivXcMegQKy0zq4djjLOBTkSwjzAGiCW+81kFk1ZZYN
	EPN7rLc7fj7RfLEO4Us5BsnDs76H48fS/r5HPyHhhwxwZuLJwV4csrco/5jnsxhedQfiPCmAzPG
	JFUzlLE9TM3UWLHDlAB3rOKqIPHJvEEHJ9vtgCIon2DeMdggc7fH/GxAlfuho1qsZGuArh5iWQ5
	Jry8GrxfATXkc0FSViN3bUGSwuzJVzRNi5nlR/Ftm+Iw8YXp693DBZbFtw0CQv88aR54Aeh1jft
	3ayoWY2mUkwUFw6p5JwBAoUli+epxZoCLBeIxrtD/8
X-Received: by 2002:a17:902:d54b:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2eb005601dbmr384435ad.33.1793122273105;
        Tue, 27 Oct 2026 10:31:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2eae6c5fa46sm598725ad.54.2026.10.27.10.31.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:31:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5375488b238so21065351cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793122272; x=1793727072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yU8D0sG+nfhP0Zoa6lOz8zWSfCN6EQZHrPZeFRloBxo=;
        b=gNA/ACmrsc+GAg5Yy9rXus/60ms0NKEF45rWU9tYm+uUOU5XgpgfqNrISTHF7uraWT
         G4q0WEfA1/sjYUuLXpHJeDE4+qfHiZ6SRwvP3jIlKC70lRjV3/z9FRjH8Ut13vLXgAL6
         UfSCRZ5vjpK2SCzXCqq8keG8WWMb5P5XPIbjU=
X-Forwarded-Encrypted: i=1; AKwUvByGL+vSzIXxv7l50qkeFWkCGnn/gMhlPm1JXZGUGyvLf/vjt33EvPt90rLX5Apt9McsKwMi0PKsRl55bOs=@vger.kernel.org
X-Received: by 2002:ac8:5a86:0:b0:535:f9dd:a3c9 with SMTP id d75a77b69052e-53e3bd81b45mr63804751cf.6.1793122271515;
        Tue, 27 Oct 2026 10:31:11 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:535:f9dd:a3c9 with SMTP id d75a77b69052e-53e3bd81b45mr63804061cf.6.1793122270888;
        Tue, 27 Oct 2026 10:31:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c6bc95b66sm38918596d6.43.2026.10.27.10.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:31:09 -0700 (PDT)
Message-ID: <3f6dca36-09b9-4c33-80f0-a48bafd03e54@broadcom.com>
Date: Tue, 27 Oct 2026 10:31:05 -0700
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
Subject: Re: [PATCH net 2/6 RESEND] net: dsa: b53: manage SerDes power through
 the PCS callbacks
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org
References: <20261022225656.1387306-3-florian.fainelli@broadcom.com>
 <179305843757.3134.4007285132700969521@kernel.org>
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
In-Reply-To: <179305843757.3134.4007285132700969521@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/26/26 16:47, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] Baseline decision: discard.
> 
> Pre-existing issues:
> - [Medium] Baseline decision: discard (pre-existing, medium).
> 
> --
> 
> net: dsa: b53: manage SerDes power through the PCS callbacks
> 
> This patch moves SerDes power management out of the b53 mac_link_down()
> and mac_link_up() handlers and into new pcs_enable() and pcs_disable()
> callbacks. It removes the serdes_link_set io op. It also adds a
> b53_serdes_modify() helper that does read-modify-write of SerDes
> registers under reg_mutex.
> 
>> diff --git a/drivers/net/dsa/b53/b53_serdes.c b/drivers/net/dsa/b53/b53_serdes.c
>> index c90894877626e..87771e3788f7f 100644
>> --- a/drivers/net/dsa/b53/b53_serdes.c
>> +++ b/drivers/net/dsa/b53/b53_serdes.c
> 
> [ ... ]
> 
>> @@ -202,32 +235,31 @@ static void b53_serdes_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
>>   		state->pause |= MLO_PAUSE_TX;
>>   }
>>   
>> -void b53_serdes_link_set(struct b53_device *dev, int port, unsigned int mode,
>> -			 phy_interface_t interface, bool link_up)
>> +static int b53_serdes_enable(struct phylink_pcs *pcs)
>>   {
>> -	u8 lane = b53_serdes_map_lane(dev, port);
>> -	int reg;
>> +	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
>> +	int ret;
>>   
>> -	if (lane == B53_INVALID_LANE)
>> -		return;
>> +	ret = b53_serdes_modify(priv->dev, priv->lane,
>> +				B53_SERDES_MII_REG(MII_BMCR), SERDES_MII_BLK,
>> +				BMCR_PDOWN, 0);
>> +	return ret < 0 ? ret : 0;
>> +}
> 
> [Severity: Low]
> Should b53_serdes_enable() also pass the error to b53_serdes_error(), as
> b53_serdes_disable() does below?

Yes it should, v2 will have that.

> 
> The phylink core ignores the return value of pcs_enable() in
> phylink_major_config():
> 
> drivers/net/phy/phylink.c:phylink_major_config() {
>      ...
> 	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed)
> 		phylink_pcs_enable(pl->pcs);
>      ...
> }
> 
> If clearing BMCR_PDOWN fails, the lane stays powered down and the link
> won't come up until the interface is cycled.
> 
> b53_srab_op() and b53_srab_request_grant() already hit WARN_ON() before
> they return -EIO, so the failure does show up in the log. This is mostly
> about keeping the enable and disable paths consistent.
> 
>>   
>> -	reg = b53_serdes_read(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
>> -			      SERDES_MII_BLK);
>> -	if (reg < 0)
>> -		goto out;
>> +static void b53_serdes_disable(struct phylink_pcs *pcs)
>> +{
>> +	struct b53_pcs *priv = pcs_to_b53_pcs(pcs);
>> +	int ret;
>>   
>> -	if (link_up)
>> -		reg &= ~BMCR_PDOWN;
>> -	else
>> -		reg |= BMCR_PDOWN;
>> -	reg = b53_serdes_write(dev, lane, B53_SERDES_MII_REG(MII_BMCR),
>> -			       SERDES_MII_BLK, reg);
>> -out:
>> -	b53_serdes_error(dev, lane, reg);
>> +	ret = b53_serdes_modify(priv->dev, priv->lane,
>> +				B53_SERDES_MII_REG(MII_BMCR), SERDES_MII_BLK,
>> +				BMCR_PDOWN, BMCR_PDOWN);
>> +	b53_serdes_error(priv->dev, priv->lane, ret);
>>   }
> 
> [ ... ]
> 
>> diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
>> index b9939bbd2cd51..9818b3922a377 100644
>> --- a/drivers/net/dsa/b53/b53_srab.c
>> +++ b/drivers/net/dsa/b53/b53_srab.c
>> @@ -493,7 +493,6 @@ static const struct b53_io_ops b53_srab_ops = {
>>   #if IS_ENABLED(CONFIG_B53_SERDES)
>>   	.phylink_mac_select_pcs = b53_serdes_phylink_mac_select_pcs,
>>   	.serdes_map_lane = b53_srab_serdes_map_lane,
>> -	.serdes_link_set = b53_serdes_link_set,
>>   #endif
>>   };
> 
> [Severity: Medium]
> This is a pre-existing issue, not one introduced by this patch. The new
> SerDes power paths go through the SRAB accessors, and the timeout check
> in b53_srab_request_grant() does not match its loop bound:
> 
> drivers/net/dsa/b53/b53_srab.c:b53_srab_request_grant() {
>      ...
> 	for (i = 0; i < 20; i++) {
> 		ctrls = readl(regs + B53_SRAB_CTRLS);
> 		if (ctrls & B53_SRAB_CTRLS_RCAGNT)
> 			break;
> 		usleep_range(10, 100);
> 	}
> 	if (WARN_ON(i == 5))
> 		return -EIO;
>      ...
> }
> 
> If all 20 polls time out, i ends up as 20 and the function returns 0. The
> caller then goes ahead with the SRAB access without having seen RCAGNT.
> 
> If the grant shows up on the sixth poll, i is 5. The function then WARNs
> and returns -EIO even though the grant was obtained.
> 
> Was the check meant to be i == 20? It dates back to commit 967dd82ffc52
> ("net: dsa: b53: Add support for Broadcom RoboSwitch"). It is reachable
> from this patch's code through:
> 
> b53_serdes_enable()->b53_serdes_modify()->b53_serdes_write_blk()->
>      b53_srab_write16()->b53_srab_request_grant()

Yes, this pre-existing issue will be addressed separately.
-- 
Florian
