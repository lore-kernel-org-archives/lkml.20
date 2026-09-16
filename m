Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AB3C4572
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600681; cv=none; b=d641Tm+8dOR7aS1Vh+YLWTt4W4HDk6+dpoXIV0CTDvKnTAxC6xIkaN9b/GS+iyGb018Qnj1XJEVApkAPNdY9nvSyMYxkyHm5JJ/ONgQVyfQCSuYXj4fPfZ98cl3oQJ2xLPro8/I0gI+OZ9YpZ1HQsEP1poHjAQvfVkvEf3pu0YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600681; c=relaxed/simple;
	bh=fij3eEOLxurYpPo1Gj1MtbRPxFtSDKvt+BZeN/vOW6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=be1hr7t0xI1gT0Eyr/6nI41Hy65GdlChoOX+5Mq8eEJIxPNc8pStkxDv6cncDBWmgAKMhmeIRnnrVMHxLME3S65lzHSozceWSI3iFDi+HCMbYPXfj7Y7hIJWrJwR/dOOhLqvGj7fU6VpgLFXsjpXWp6z51C5GxrniyWMSKfAneM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cZEUumzZ; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cZEUumzZ"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-86aecf49833so9103b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789600679; x=1790205479;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0sDEArYGlpoxYwz5GEnDLe44Yw0mS5y0ZSiL1JMItsY=;
        b=cV9jvirbJekGPQOZzz25tRlK+jKlRNYrpHEnzu9F247sX0bbgy0XC4HZzPwFAX1mn6
         4B/UuCNApJwQoAPJYW1VTH5t9g10xfOIKU0wEoi0A+MHqOw2Q4jEmm+fSo2ogvuQOyTw
         k4tf7Ir3p07bBREoE/hYkNPgB6mxP7ShK4JnKzqSgnSov9gscW3Cq74/hNqfq7pqACU7
         X7vRSsJrFIoRoBIsb8wWdkxCQzkrvZL3yQRRnsmeNad+DJON6we003UfY3azeDPjvnX0
         V3ROoXMOws0UZz8Vv+swoNHAgChYZCLPYxIrx+F/sFTBp2kQbPk1rifNNXVuWpHyJvue
         PEsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4LAZalCcgeggjnfsQ9oMUQKI+KihrCIAliy6RRQaErSEY6GukWheunLLHN1cJTBgQ0r7wsnz1nV6JDBc=@vger.kernel.org
X-Gm-Message-State: AFuF++nNlWoMdTILUfcXTRuZBqbRMfkqQKpLw25iZ90LF9wqahu6Xj5c
	TIf9tRb9od4KTBYSgXL8Y/YbGVwsnbIjyNsCzQzTUe1Ac1UjFRmJ+1nsdJd7jxTx2PfPcpLAoT9
	MfhIzsRj/pmBgAB4NC16BVRH/Fg/74DpPKQjK1oTag3SCLL2kYr/MoH7RzN3BRorDSX9Pvpg90N
	43QaK4O0NfySCE1JHSdsbtL3gxKUB1ReyX089MftKXWIe6VZrt8OjFl4kAhzX8U0776PymDuYBd
	4Vdcpv3BOtyTP0pf8MIYtMb
X-Gm-Gg: AYBFou27E3wJW+CpuCza4l5b/eUWmxrZzWd12i+jbP2gglK/b08Fu5OgGeDsYr/Lfkb
	33Y4cDd+D+ho0B2+rwARWv292D3T7F7S8y4JUUOA/jG9ZiWa8MWwVmKsd/SzaKHc7mnOozUroP6
	fF52ULHW5b572qd9XnhEG35+DHJzzOHjWeBnrepKUx7K8rGnBHXTvyUwuJcYdcCvnvcGJYpE9G2
	7CY7qKB7QfJOiatr0MRac9skx/XsBDZ8DdtLP2WRAoBt2iTjPBzaOwVjlQ9V4H2aPUJqla7HQCL
	30Z1KS4s2qN70Z0UDvxLuM4jYBK/eW+aAluVGSFI4QlVT2+nT1s1XcgjTj4UwMi3pX4hY87VNo1
	99ChEtLJ2Wi+hNhvIuKzZaP4hPu4oyD3+3Z6rhzecwnDH/eRO24cKMLbcV5yrAQTVgcfTQGhPmA
	3KnUXLe8kw6xIZKQMc1BNyueABY7ZsdRMyolGRZmBB3lo=
X-Received: by 2002:a05:6a00:13a1:b0:871:a6f5:693a with SMTP id d2e1a72fcca58-87341a86511mr1921532b3a.11.1789600679332;
        Wed, 16 Sep 2026 16:17:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8720104c4dcsm1256539b3a.6.2026.09.16.16.17.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:17:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso2507085ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789600676; x=1790205476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0sDEArYGlpoxYwz5GEnDLe44Yw0mS5y0ZSiL1JMItsY=;
        b=cZEUumzZSXonK+ex+nqtcJuFGrCendCNw32f0a5+HTdEA7UgliPRMHvXR/90aP5TDW
         xXnPRSjR0thWBJKBOgk4FMJLNhc6q+hsR8B3iKEHF3IIF0PTGfQ9Prv2ou+y4LNNdRim
         qEAspDOblApibD5CWPUxGQkAIAssmGcO4d15w=
X-Forwarded-Encrypted: i=1; AKwUvBwvi5uRZU/aleNKlXW+LfkthF2sVkDF2NJIEeeXy67ktaGggyOnGCpGHNrpWYBhHxAU2sjZmashY+D0YYM=@vger.kernel.org
X-Received: by 2002:a17:902:e543:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2dd9c7c2b1cmr18256045ad.8.1789600676538;
        Wed, 16 Sep 2026 16:17:56 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2dd9c7c2b1cmr18255765ad.8.1789600676083;
        Wed, 16 Sep 2026 16:17:56 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm20543472eec.31.2026.09.16.16.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:17:55 -0700 (PDT)
Message-ID: <f2c11f68-c787-4897-b5a0-3d05b15f6bb8@broadcom.com>
Date: Wed, 16 Sep 2026 16:17:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: broadcom: enable jumbo frames on
 BCM54xx
To: Nicolai Buchwitz <nb@tipi-net.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914094703.1093504-1-nb@tipi-net.de>
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
In-Reply-To: <20260914094703.1093504-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/14/26 02:47, Nicolai Buchwitz wrote:
> Jumbo packets need two bits that default to off, extended packet length in
> the auxiliary control register and PCS transmit FIFO elasticity in the
> extended control register. The latter raises the transmit limit from 4.5
> KB to 9 KB at the cost of 16 ns of 1000BASE-T transmit latency, and the
> two together take copper mode to 10 KB.
> 
> Without them such frames are lost on a 100M link while the same frames
> pass at 1G. On a Raspberry Pi CM5, which uses a BCM54210PE, 9142 byte
> frames at 100M are lost 20 out of 20 with the MAC counting every one
> as transmitted. The same frames over the same path at 1G arrive intact.
> 
> Set both, which bcm_phy_enable_jumbo() already does for bcm7xxx. The
> frames then arrive and the payloads check out byte for byte.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
