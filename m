Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861679;
	b=mf28cgQyNj1AiPqz0mJJRGlhnkcziBbFTtQ9yJRt3K1SdHTfXm1hhAi/x8KcGNVLs/pb
	 eu2yxwBn4aYhZXojRNvzF6/135E5Fz00Jy8959dLOMDYQctVnrOEgTKewgMO9VYm0Hdwr
	 KX6cnN1LAwFkOiyKKRD+PmOhtgAyzxwWS/kib1BDe9lnpoEV04UzI/ZSKMlFM53Qt5ZES
	 9HnC8gaixCDgHH9Czt87auRGiQ5muZrGO5jIQVVuMz2RE6by2Bb4Q/0ad/yAxRHufEKFu
	 Nx4N6QAaQ31Fo2iQQ6G7ge/lTd+qV+1CIwXNATpMBXUpF0J6CyiDTpLpG4pD7zmzbjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861679;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=d3/NVvZ70FBDltlYVQiIJhqO15jiYtwSRqAM0IFKIFQ=;
	b=ozVr1y6B6V5lXOQZCljtBX9JTeyTKhms7xargvOaGaBmHlpQFz6XJQZDH/uprHQGI25v
	 raC23oXKfGL24DbIBL4+2ELNgHIs8cDXU5+yjNLifxXrCGqqS2r8RZbLKPPCDYR6DvQrF
	 inlumpQebC/CLc/wqQ3j7qVixSCwFDOZ2JJLzy6hhIQovRrmaO2P4NHXeiccr05C5vcvP
	 qMrvo56FauEpXzeLsSjhtXzOFQLqmAVWobQecvQTVBH9RgJ/C0rYfgAsXf24Xfrjv0BOp
	 0OYkVpwLRmFNe5WIet86aigSM0FI+dkvSnlNixn4y9zVT+Nf4uPSqg6VqmWvK2Za4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dE9ouOGv;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6E606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F6E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dE9ouOGv
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e9995ce866so37809155ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861678; x=1795466478;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d3/NVvZ70FBDltlYVQiIJhqO15jiYtwSRqAM0IFKIFQ=;
        b=fgU8GdEJMV9O/0ifaRLEK06FixiY9cm/Tm1nneexw7ESuZycsA6+qxpkWAZtLiU8ZV
         jMyW0PmOk2hRYaByzqRpgM3GgwjXaaWp8eJaGQX+OWVTyytCJ45wZE0aURuiPPTBwtTI
         sGk8r3MrSkJ6Di5LwgFGSS0r/RO77QiteiQobMbcxG83VXPckIGVQi67WO3tI1JWk5vH
         5Vlv8M9Q94prOgwBrUXR0kBqiQgFZO8S+abVwK2cYjhBmVui2dVJogMtYP2av1ZLbap8
         AK1zVcuSHX1+3Hf12wbPagHCiwJbul0eDhwKXMCz1Ntl8b4EENhKa7FBOJVfJ6BRJKIL
         Pe5g==
X-Forwarded-Encrypted: i=1; AL+hErF40rBgF763fhtBTh1QnCDDCY4NoeBdChiIM+TJjvNjyk8w8ZEpAzv3aP5xgenatgzunQzmZEQFfem69J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XYHN90MzfAwtdzF6bZh7LC/tiZDqNf63AKvM8W8/O1QhtxxJC
	vVdUV57my4+FKlHgyjges3NwBT4uLwrF2RsTp0SJ3quvxcsMRoPG6v3WzkdHuJwXdxHERRYhcR4
	zoYI7W7a88megWC33JU4BE0Be/WWNq/GAx8jtPdiKCNJS3ZSdkJdv7yc1JeJVYu6ORdltq15NV1
	92wuSevvCJeSLGcyP95mk2SRdW5HA0bIRme6CUNWsrfJJeyVxWCBX8BQwQrdbR1D9aGhj2xpefI
	1al6F7ubyVWNVRgAb8jR9ew
X-Gm-Gg: AZFdTZdFB+bkRxgymkrNWCG5ZcoZA91nQEqTOTWJ7CSvkbHfoAP5KW/FRS7SGFOATrB
	FuD3B4VXo4+I8jTflA+yQK1/CzqNlNEgJiz6dpXdh04Vf/2wBvDT9+NoFoJxFqHV3XGmdmmRmhb
	bIeU4tC3fqNXs1NPxUfEVLCnLBs4RNqm/O680zCzt0IpRnh+wuE5t2OpDWWQpAcWYvDvFjiOJZI
	O5M6mkC5yM96SlIU2xu6hoeL/zAqP9u8TtVqAhLx0X1XHvzib7eri4qiHVOZLqO3joCVY0caqvV
	U+NkMpcxlcl/o+TUrPM6cs2TUlwAvGAlv9KG15TUU8ZkRUGXjAyJ7INua5w58iHk/SIzMcUM7vL
	m/07TUzLHk4IdZXJ2tiuilFmtR7gb99Oy+yFqixTx0QmKPmnsiQMVaLvVXluEMs0kDlavebgr46
	9DxqMWlmcCBdxNIBT7m13lEk2qryymMfOnuVSc/HuN/nc=
X-Received: by 2002:a17:903:3c2c:b0:2ed:146c:cbb2 with SMTP id d9443c01a7336-2ee0da98d11mr108098555ad.21.1794861678491;
        Mon, 16 Nov 2026 12:41:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7a88784sm279305ad.13.2026.11.16.12.41.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:41:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548d4bc0so99987431cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861677; x=1795466477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3/NVvZ70FBDltlYVQiIJhqO15jiYtwSRqAM0IFKIFQ=;
        b=dE9ouOGvM0epHGqKQUqIxE40X61srhd+5hWeaZRGWPpt5l/glX54sTQaPSDCr+wGAC
         JvJfq1ztrdx742Y30MSdYH6GAh7Xxx2RiStuNrhn7nwLLMfanQrFcdeDTjMFnoqpvyb+
         ozXAQkTnu6z2rhrWOl2qm1cddUL4+w4ei/oJY=
X-Forwarded-Encrypted: i=1; AL+hErGFOIP7ckifF8wKkDhIQ2TAdLVcagoC9fyL/hpgxn9t+WigcPrP/1Q1kdLfComTuil00i8idhz9S3hDVCg=@vger.kernel.org
X-Received: by 2002:ac8:598b:0:b0:55d:2b4c:8b2f with SMTP id d75a77b69052e-55d2b4ca1d6mr115832481cf.21.1794861676784;
        Mon, 16 Nov 2026 12:41:16 -0800 (PST)
X-Received: by 2002:ac8:598b:0:b0:55d:2b4c:8b2f with SMTP id d75a77b69052e-55d2b4ca1d6mr115832061cf.21.1794861676316;
        Mon, 16 Nov 2026 12:41:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70918sm93558856d6.22.2026.11.16.12.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:41:15 -0800 (PST)
Message-ID: <a6081c51-e317-4687-ae93-b9072cc5255f@broadcom.com>
Date: Mon, 16 Nov 2026 12:41:13 -0800
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
Subject: Re: [PATCH net v5 5/8] net: dsa: b53: use the correct override
 register 2 Gbps bit
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-6-florian.fainelli@broadcom.com>
 <179485574004.3136.10514561050304983493@kernel.org>
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
In-Reply-To: <179485574004.3136.10514561050304983493@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The Fixes: tag covers only one of the two bugs this patch fixes.
> 
> --
> 
> net: dsa: b53: use the correct override register 2 Gbps bit
> 
> This patch picks the 2 Gbps speed bit per register in
> b53_force_port_config(). The IMP override register uses
> PORT_OVERRIDE_SPEED_2000M and the per-port GMII override registers use
> GMII_PO_SPEED_2000M. As a result, lower speeds clear the correct bit and
> 2 Gbps sets the correct bit on GMII ports.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 64e04c5731a69..d8dafa9e0c44d 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
> 
> [ ... ]
> 
>> @@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
>>   
>>   	reg &= ~(0x3 << GMII_PO_SPEED_S);
>>   	if (is5301x(dev) || is58xx(dev))
>> -		reg &= ~PORT_OVERRIDE_SPEED_2000M;
>> +		reg &= ~speed2000;
>>   
>>   	switch (speed) {
>>   	case 2000:
>> -		reg |= PORT_OVERRIDE_SPEED_2000M;
>> +		if (is5301x(dev) || is58xx(dev))
>> +			reg |= speed2000;
>>   		fallthrough;
> 
> [Severity: Low]
> This isn't a bug, but should the Fixes: tag also cover the 2 Gbps set
> path? The commit message has:
> 
>      Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
> 
> b6a8a5477fe9 added the clear of PORT_OVERRIDE_SPEED_2000M at lower speeds.
> On the GMII register that clear removes GMII_PO_EN (BIT(6)) and leaves a
> stale GMII_PO_SPEED_2000M behind. That part of the patch matches the tag.
> 
> The change in case 2000 fixes an older problem. On a GMII port, ORing in
> PORT_OVERRIDE_SPEED_2000M has always set GMII_PO_EN and never
> GMII_PO_SPEED_2000M (BIT(7)), so 2 Gbps was never selected on that
> register.
> 
> The case 2000 line goes back to 967dd82ffc52. Later, 63f8428b4077 switched
> the code from cpu_port to imp_port, which moved BCM5301x CPU port 5 back
> onto the GMII register path, and that path still set BIT(6).
> 
> In the current tree, the only caller that passes speed = 2000 is
> b53_phylink_mac_link_up():
> 
> 	if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
> 	    dsa_is_cpu_port(ds, port)) {
> 		tx_pause = true;
> 		rx_pause = true;
> 		speed = 2000;
> 	}
> 
> That code came from 41af38324341 ("net: dsa: b53: restore the NSP IMP port
> 2 Gbps mode"). It also covers BCM5301x CPU ports 5 and 7, which go through
> B53_GMII_PORT_OVERRIDE_CTRL(port).
> 
> The commit message says the patch makes it so "2 Gbps sets it". Would an
> extra Fixes: tag for 41af38324341 describe what the patch fixes more
> accurately?
> 

Agreed. I added a Fixes: tag for 41af38324341 ("net: dsa: b53: restore 
the NSP IMP port 2 Gbps mode"), since that is the caller which passes 
speed = 2000 and reaches the GMII override registers on BCM5301x CPU
ports.

pw-bot: cr
-- 
Florian
