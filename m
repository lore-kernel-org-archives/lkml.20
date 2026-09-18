Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E6270575
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690359; cv=none; b=eoEIc3IzUX4Wd4FFoXC+JeA6fQTKr1ICj25O2wLWT3woBVlNcov2FOGg8pOCgGtoRLhOv55uKzChpooIroowVI6OojEhrOIBpFMer7yffn6oElosygsew34KdFCCRUb+vzXGNNxYGGF/596SjpVhbgUrW4cA4LVYKt12BgraO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690359; c=relaxed/simple;
	bh=S6WTitiZhScsse4BNwexQE4nUZiiH9qflpERhRHNTQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U232kPMGcdMHSQ7R+gXPPIOx+Xn3MDGlGN8l7V5/bQdpkP9lBNhvR8gP9O9t0q9wI5DfADOpirSxrrZWVqE2amTPrtiGijFtcROGxtRj3/n0IhY9SOgy58dPzL12mJ/ip/2GzuDSi9ezXvAP8IO3ZwOxHbjZjwd4B7wDfANUcUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bCq//u8V; arc=none smtp.client-ip=209.85.222.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bCq//u8V"
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-939f30a2d3cso3592085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690350; x=1790295150;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8mYgUWzPauMPI8KvHgXl8UKMbYZ2jyU3o9Br39MOIhU=;
        b=fEbWPN+lLudKaC5AgH5WfVmfRv8U7otQKMullu+qPQW2xO8qos384o5kVfzJQpBTgN
         +crr7bYQvoijTMrp7DX5EVwJTpE7oj1qeDwCJtLQnoEu47DADplLVzP45nmTiI2HjBVy
         zXtWELJFyiHj9KtasrIBrGQpx/QIfDYQjRJJhGso3wCYYfSP/Ymnyogo4xWT8VaeE6Rf
         puIrEJsOggMki8mlJ9pf+BjOxdjke8qhrojG5ys3X9JAWmBhQ1VmT+irEqdfiir2Wgiv
         7ChjlmvRmWu9Ev7YJb8g0fRGjYerxgzZidyl+e6QD2f8WTkDZVB3KNvyGvGIzcmp7tjd
         flvQ==
X-Forwarded-Encrypted: i=1; AKwUvByiwZLPfrR4Jx/RYHYqniF96rxI55ZXhsGtuBuSHp72pHEqn7Dix74BaIamQULhDZQzmMRT3XoekDCxnxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ko70PA1CuMvKkhx+cGtteTkxQdllmvenPSvBIGmavr2dTjYWqe
	RmAclcFJEICOQTAbpBnx2Fn9b7XIoJhMuyuAlq04Q6HlGvfUG4fA5Syq63zuZrWhVFFe7OvQcgN
	hH9V3Y4sSH5aTcJ4PnFppIJOlNKt2ZSCs+lfN1JbNKUcfbX26cCzMOLBXQ/qZd1Ak0ZZFq1iKC+
	uS40D7rHcVfHB1AK+Ci8uzhRX2K9z4lsIGBtCe4gaJFW/73L2oEZRX28hm+anZD6kMdTHSupZZY
	Y8kOr8fMylMZqMlqi3fxk6U
X-Gm-Gg: AYBFou2K5d34NgNH3lV6C/sGUE4aCmSvlBECs4BKoR6D9py4N0aV3q/KSqBKvEOH69r
	t7z2focYJdOiuWDE6YtQSg9TLdvNxbm83ZTvTOFLHfy2+RQFrb3H0Pyp1Ux7n5Hc/3xch+mzAID
	8LNdqAeTdfxV6xrtGE0Ht8xYrnAJ9KG6KsfYqXS6QqWvo+pP3fJxm+mvTKYaufqr9EZqH8cvDJs
	lBTXNSzH0mO6SpVeuz/TqXSC1tld/44K1X01pfh9pSJo/a0YYaN+ZIGGEc5EuocOBP4gATQI3Sd
	N0tyeuHPZgsQjF9SJL6l4MLKDPr98ukz06gHx/QhU9HcFz5RH0Y3xhoRNc/QXnWomcKeuXlydeJ
	CNMqFrEWd1qNMYktLJRJ6WDnuegXHREy3pD4CpCwf9DQVJ6JmPzrixzVHTeog9OJ7c3ATFy7e2s
	A+CxUid5A/ho+CECySfCBTso7nxboJ637xDeHWegv9
X-Received: by 2002:a05:620a:6012:b0:915:a953:4b9c with SMTP id af79cd13be357-93bdc698a93mr105881485a.3.1789690349508;
        Thu, 17 Sep 2026 17:12:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93b7819c398sm71865985a.6.2026.09.17.17.12.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 17:12:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-869553205a7so1969177b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789690348; x=1790295148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mYgUWzPauMPI8KvHgXl8UKMbYZ2jyU3o9Br39MOIhU=;
        b=bCq//u8V6Jfq3XywAdaDamwtAxuj29ijtHOZk//3GRsSbV80nerk6lrDJU9rVThuZ3
         wviEliEj9tJSJs2AsOFrrh2YjdGjzVpdAtseA8lwwqKFnfQTjbbNhhVWlo0lKAFHyrO+
         ro+3WEjyIfwDmp06LQR8AdO2WNffrKPlS8UiM=
X-Forwarded-Encrypted: i=1; AKwUvByISfofJTn6PaogTiS4kB6VLMl7/E6/o7hzNutcMPWvigLO9Fvlq3hKvUCes2w9HsweXuWy/G+Syh/13vQ=@vger.kernel.org
X-Received: by 2002:a05:690c:386:b0:884:c89c:ae4e with SMTP id 00721157ae682-89732278bb5mr2414787b3.6.1789690348023;
        Thu, 17 Sep 2026 17:12:28 -0700 (PDT)
X-Received: by 2002:a05:690c:386:b0:884:c89c:ae4e with SMTP id 00721157ae682-89732278bb5mr2414727b3.6.1789690347550;
        Thu, 17 Sep 2026 17:12:27 -0700 (PDT)
Received: from [172.16.1.139] (107-214-104-235.lightspeed.irvnca.sbcglobal.net. [107.214.104.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8978bb53ef7sm902147b3.35.2026.09.17.17.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 17:12:26 -0700 (PDT)
Message-ID: <fa38279f-0020-472c-93ee-7f4c1740cc81@broadcom.com>
Date: Thu, 17 Sep 2026 17:12:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/8] net: bcmgenet: Collection of bug fixes
To: netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Nicolai Buchwitz <nb@tipi-net.de>
References: <20260918000732.276506-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260918000732.276506-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/17/2026 5:07 PM, Florian Fainelli wrote:
> This patch series contains a collection of bug fixes found during a
> LLM-assisted coding session.

My bad, I forgot to remove some tags while the patches were sent out, 
will wait for feedback and repost.

> 
> Florian Fainelli (8):
>    net: bcmgenet: fix 64-bit RTNL stats reading in ethtool on 32-bit
>      systems
>    net: bcmgenet: initialize u64 stats seq counter for all queues
>    net: bcmgenet: do not skip WoL power up on GENET V1
>    net: bcmgenet: clean up RX NAPI on bcmgenet_init_rx_queues failure
>    net: bcmgenet: acquire ring lock with BH disabled in
>      bcmgenet_dump_tx_queue
>    net: bcmgenet: validate Ethernet address in bcmgenet_set_mac_addr
>    net: bcmgenet: zero-initialize Transmit Status Block in
>      bcmgenet_add_tsb
>    net: bcmgenet: mask DMA_TIMEOUT_MASK when reading DMA_RING0_TIMEOUT
> 
>   .../net/ethernet/broadcom/genet/bcmgenet.c    | 34 ++++++++++++-------
>   1 file changed, 21 insertions(+), 13 deletions(-)
> 

-- 
Florian

