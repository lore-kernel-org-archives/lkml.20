Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417749;
	b=GuCW+6pXAsUxEM2F6vTD+mLdSfmoxLlBCZfBYAZrJHKqfQKzTClC++Xh0Eltj3XCovp+
	 i6ZiV0g14q72vm7fLakt3WZnzr6H99LVlMOYRdFw9eKhpf8uGFPXE5d1uM+W8xQj7DS4F
	 iPPu/1epkHhH3KEtzCisTwFiAVjx4wBZkLmRbakSFHEckASJAQdcU1bMNDKhBvFYw3CDh
	 s7ENxznYuvJX2vnT2yMgwJ8vr19Yuh0rUw/9ICkWhazK7ST0R6PEQ8kaLJthhs9Pw1uXD
	 zBvUQzg/SYCVx1sa7CPi3ngi0q/1v7I5bYezasyJaWOVmyHUuEN5MME9wMgoz6uWA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417749;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=94chnNwV7jUuGablQmYGqu0VRRLsEEyNiKC8ktRDRaA=;
	b=XxkODrV2yio6Bj0rxg1fc9weJd2/QfvwTxXdIhv1K/dHL4FdkeEcsS0DK4TrFouYlAoi
	 Fhx9gnnXC5Mdnd1Cta/WXJLmfpAoTHLK8SnH81b+wyng8N+o7G4YPGtveqVMociGEg0br
	 /oeUSkYpukaNbklmQot5YLgC3Ver3CUEuMra7/Jc+09vQW3SKXUyleJY6i9py6FSZlFKX
	 9SVsbVnkxwiL2RFYIYKg/OhpquSDj0KxyOMd8WXsoMVbZeoqee0bfI2xP1rtIj6pl/W6Q
	 DWvoPYhwZctGTzi40Fa2R0xigxXoXDZUsH/5yAlztYH/qPiMRGNY+mba7GY9oAmy/DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iR6aFo0r;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9200B606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9200B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iR6aFo0r
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1676356a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417748; x=1795022548;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=94chnNwV7jUuGablQmYGqu0VRRLsEEyNiKC8ktRDRaA=;
        b=mgTYKXxUvfxLjfR0L7UJD/Zn+2pi7G4gVX0zh4p+x52zmMX0B5feDlLVsqoFUvxV+Q
         COhFoiKYjJKPHHsF5/ajL/mHewwfuJMq/YCG6mYcWYeUVQ2Pf9t+aetuj8fFNWNVZrwb
         bbeuDxgbkUUTm1SbRwpEtL+S5ibsRRrRvjwHCr7MO9C4CFTbYeQL5qHcaE+gST9xizwT
         3j/RP0tjFA2CbNwD4DCh+Jyho9vpz2tq4dPdRCdLgVEGPMq3RhP+21w4rzZIKr/bnuoc
         s/slkiCkaXBn5ipSfIXyEDPxuTRajhxu9oR22ZlVb7gYJUlnKYEqWN4DpmRrZCCUANN1
         Kbuw==
X-Forwarded-Encrypted: i=1; AL+hErHf/DPjHI4LyRNr4BTglOvqyLPxFSe5MA/o52smbY3lIId9WvJ0lgYb4ghDNQIDtF3Hq74A8/jsUSlYksY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xebexc4VSclU8+EFQo6QpN9nPSATrQF+XdRpFeRA5P0rAd8qJ
	TAFE0lA3hYvlx6yaiU9bXGqMNeCF9V+0NCnmhxFXQhWbVV4pHUGJzzNfRJeSVxyd3ktys7LsXE5
	p4NxBPJ5b1lVH8JseMAoDc2VLWJk8x0M1JbAdTmSXtZ28drmMq2yzni/uQD1iBTkhodTusxrVec
	wSs28IliZOWQO/XIcz1/YQMUeCL815MG7d9ffcBdicPfnJ6CNM54/KJ9zeLuiMKBFSTBZtFUNGl
	ECASR68jPn0hihw5d+bQnDt
X-Gm-Gg: AYBFou2ex2o0sbJCV0GLOPyjPNbwzKciyLhQqEnRGsKyrZKCIIDG2iUz2NhjEQSa+2h
	1QLcqwoOouOxHuxsK+pYtHqp0M2O6t+y2SKMVVYYP3MzzlKucESrtwrsKMbBc6Jk3UN3MDRmbUv
	+ci3wJBxc8O0Xd6xoQxmF0nBk1Rgh7RnKUFNug2Q3WPwZ1zknVMp27o8ctaNr0iXMOUfpz/ssUP
	gT1Xp7G0rDf3QzEWRg5qhfKl7ARuUCergSiEGm7x5EnrDQi/4zyKvxDRU5uAbbosxveWzFZjc/V
	s5wtq9QJ7PVJSVvrsPobI3HkXK7bohnRnM94Ntvh5mqNgIVQhogzidh2hBmNW1WIeZstquIQvNm
	EkMbGKDkoQzueUOBpHrnpxCkHrBz2w8xAhd/x9KWnsph7zdHPK5C//tGbCNmwMvUM1pQGVpr6l8
	Y5vemKMK3U3WExxd+AEpA1RzGwMQsVfID77bj9fZbn
X-Received: by 2002:a17:90b:4b84:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b182f93ae7mr3047151a91.50.1794417747782;
        Wed, 11 Nov 2026 09:22:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c77e92sm72338a91.8.2026.11.11.09.22.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:22:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea3a6c1a0so64528056d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794417746; x=1795022546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94chnNwV7jUuGablQmYGqu0VRRLsEEyNiKC8ktRDRaA=;
        b=iR6aFo0r506woL1zShoDXOtQG67IzLCqy6XtpipingCSWqBgKrcpr+UBhiWvyMFGi2
         GlVRafIhPXUXmQU+h02jB3pMalazJy3dS89j6E3vDdzkIP2QWW58pvfIC6vcjlzBJprX
         azZpi6H5IMM9g0wjc02ICDpViO2C9B+tYWCtE=
X-Forwarded-Encrypted: i=1; AL+hErEIAtERlaZorzLDQwCS1S9h6A7RTsBFrxyToa0jevp0PAr5OT5VCCDVNY5Ga1cTV9k9l1gj82SBMXUTg2E=@vger.kernel.org
X-Received: by 2002:a05:6214:590a:b0:91e:9a4e:8cb with SMTP id 6a1803df08f44-91f03dc9be3mr55802546d6.7.1794417746250;
        Wed, 11 Nov 2026 09:22:26 -0800 (PST)
X-Received: by 2002:a05:6214:590a:b0:91e:9a4e:8cb with SMTP id 6a1803df08f44-91f03dc9be3mr55802026d6.7.1794417745685;
        Wed, 11 Nov 2026 09:22:25 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f046e42a7sm24311426d6.31.2026.11.11.09.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:22:24 -0800 (PST)
Message-ID: <52c38c53-7806-48c7-a0a4-9e1aa40cc55e@broadcom.com>
Date: Wed, 11 Nov 2026 09:22:22 -0800
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
Subject: Re: [PATCH net-next] net: dsa: b53: mirror BPDUs to CPU port 5 when
 port 8 is not a CPU port
To: Jonas Gorski <jonas.gorski@gmail.com>, Joseph Telaak <joseph@telaak.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111-b53-bpdu-mirror-v1-1-f9f32e9d25db@telaak.dev>
 <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
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
In-Reply-To: <CAOiHx=kTUBtFVgFhNqGhP135CdUmK8imCE_+pdk7qsdZKMqByQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/11/26 02:11, Jonas Gorski wrote:
> Hi,
> 
> On Wed, Nov 11, 2026 at 7:31 AM Joseph Telaak <joseph@telaak.dev> wrote:
>>
>> A BCM531x5 can be connected to the host through its IMP port (8) or
>> through port 5. With port 5 as the CPU port, b53_brcm_hdr_setup() puts
>> the switch in dual-IMP mode, in which frames trapped for the CPU, BPDUs
>> among them, go to port 8 when they come from a LAN port. b53 sets up no
>> WAN ports, so that is every user port. On boards that use only port 5
>> and leave port 8 unconnected, BPDUs are lost: STP never sees its peers,
>> and a loop between two user ports takes the host off the network.
>>
>> Mirror frames sent to the bridge group address from the user ports to
>> port 5 instead. The multiport address registers cannot do this, since
>> the RoboSwitch data sheets resolve reserved multicast before them, and
>> marking the user ports as WAN ports stopped forwarding between them
>> when tried. Other frames trapped for the CPU still go to port 8, as the
>> mirror matches a single destination address. The switch has one mirror,
>> so tc mirroring is refused on these boards.
>>
>> This was observed on a BCM53125 board in real use, when both user ports
>> were cabled into the same LAN. Tested on that board with a host sending
>> BPDUs into a user port: before, none reached the CPU and the bridge
>> stayed its own root; after, all of them did, the bridge took the sender
>> as root, and forwarding between the user ports kept working. No
>> selftests were run.
> 
> So on your board only port 5 is wired up, and port 8 is unpopulated
> and no way to make it work?
> 
> Be aware that more than BPDUs are broken by this, as anything trapped
> to CPU is not working. This also affects traffic on ports outside of
> the bridge, other trapped packets in the 01:80:c2:00:00:0* range, or
> IGMP/MLD snooped packets (or any other L2 protocol snooping).
> 
>>
>> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
>> ---
>> Sent to net-next rather than net because it takes the mirror away from
>> tc on these boards. I can resend to net with Fixes: 8fab459e69ab ("net:
>> dsa: b53: Enable Broadcom tags for 531x5/539x families") if you prefer.
>>
>> Only checked on a BCM53125. BCM5301x boards with port 5 as the only CPU
>> port may have the same problem, but I could not confirm it.
> 
> They do, though there it's "easy" to fix by switching to port 8 in the
> device tree, since all three ports are AFAIK always hardwired in the
> SoC.

Yes, I have a series of patches doing that, because using port 5 is just 
not working for everything.

> 
>> ---
>>   drivers/net/dsa/b53/b53_common.c | 24 ++++++++++++++++++++++++
>>   drivers/net/dsa/b53/b53_priv.h   |  1 +
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index a2a5754c413c..6b33775c7598 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -797,6 +797,24 @@ void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
>>                  hdr_ctl |= GC_FRM_MGMT_PORT_M;
>>          b53_write8(dev, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, hdr_ctl);
>>
>> +       /* With port 5 as the CPU port, a BCM531x5 runs in dual-IMP mode and
>> +        * traps BPDUs from LAN ports to port 8. When port 8 is not a CPU
>> +        * port, mirror them to port 5 instead. This takes the switch's only
>> +        * mirror, so tc mirroring is refused.
>> +        */
>> +       if (tag_en && port == 5 && is531x5(dev) &&
>> +           !dsa_is_cpu_port(ds, B53_CPU_PORT)) {
> 
> So this should be extended to all dual IMP capable chips, because they
> are all equally affected.
> 
>> +               b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
>> +                           ether_addr_to_u64(eth_stp_addr));
>> +               b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
>> +                           (MIRROR_DA << MIRROR_FILTER_SHIFT) |
>> +                           (dsa_user_ports(ds) & MIRROR_MASK));
>> +               b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
>> +               b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL,
>> +                           MIRROR_EN | port);
> 
> Have you tried a catch-all port 8 egress to port 5 mirror? If that
> happens to work, it should catch any trapped traffic. May not work
> while the port is disabled in software though.

We could also try to use the CFP to perform a full redirection to port 8.

> 
>> +               dev->bpdu_mirror = true;
>> +       }
>> +
>>          /* B53_BRCM_HDR not present on devices with legacy tags */
>>          if (dev->tag_protocol == DSA_TAG_PROTO_BRCM_LEGACY ||
>>              dev->tag_protocol == DSA_TAG_PROTO_BRCM_LEGACY_FCS)
>> @@ -2604,6 +2622,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
>>          struct b53_device *dev = ds->priv;
>>          u16 reg, loc;
>>
>> +       if (dev->bpdu_mirror) {
>> +               NL_SET_ERR_MSG_MOD(extack,
>> +                                  "The mirror carries BPDUs to CPU port 5");
>> +               return -EBUSY;
> 
> I think this should be rather -EOPNOTSUPP, as with this setup we will
> never be able to support it; -EBUSY feels more like a temporary state.

Agreed.
-- 
Florian
