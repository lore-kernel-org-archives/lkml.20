Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCF34750F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241516; cv=none; b=fxTypNMSwxhUqaafxCalhwOhML+gvOFZqsVcP4VEksvzr6ImT9JHguftzp1gI/6Z8aW9/BqDnL8/l2KLjo25We2qLL1LzV2XLN6/WNIISdaQkZrNSgsaxSjlBUNDYHl2ClPI5KVAy51pkV+hOjpfmoJAZHZjpNFXSuFZYFtO2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241516; c=relaxed/simple;
	bh=/pBUVYjz+dhlHjNGfMXZJzY6we/DMekTnDKv6B0HtEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRY8lnwv4q7ZZHNq1km6mjGfo/p+NKslF14frrNNQd8JK9Cmntq3ZoRrIAgRNehX4xzm5D+xBrqGzyxZOhJnNUkmdeMCgltc1OODc52xeiePcAnTLCcmQCEHIZDCQPoz1O65+SmJDR7yMVb83r+Uavn3TNSvm/2EmcMVfkYzN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B4c42AFW; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B4c42AFW"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a7c8c25f7dso381514a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241515; x=1791846315;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iW6L5TqJ9/IRRgok0g4xFXuyQiaTucPylThbHh/H7ZE=;
        b=OSWAn1vArSdaQHuDldw0bvlq5+hopc91TVKnFAMp3sgYHoofYglFI9ejXT9R3Abk/5
         lnOVZW5dQkApdrjky5ut8Mbi33slnu3xxKXcxXNXveZwy6ZNpZD3LvxGGDoJDZEo72KP
         0bhQgAFSnIFuJ/jTLRvut2ZTgVumH4AMrtJMPBwBpOv2VramvZegkACQer1UkR0bFCAE
         +lhdf8s5hGkOye6tPjVe2nFfHTOXYuTodsa19VTJUBmtEnmf/F7brki8H7lGDsk7BxfJ
         DXVY9c/VCL1MEXTczgKFn5SURKpzfInvj0SBYoQFGJJOo44ZfQQ8t1yu8qxSwu0o3anw
         7xkA==
X-Forwarded-Encrypted: i=1; AKwUvBw5puswzzzdCyrDFoY+Xvwdsw7LAv/Piv96W527yowmW8J7Tz5MgplRfRTV2J8egctikLlyXHKNzcqbsn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0LLt66g++DJHGKAr33pzIhTJbzdSJmtv6GDEQTQZGAoy3/KTZ
	gDMdenrm4QkcR697Go7CT7omxKgDJfje4fk2MAn24T4ZEqreTuq5Qoxmjkc8X/LlEDBcdcXJOV4
	EbizDGnAKpqaeYTuArG/2k38XIM6F58dLgs+FRbv1SV6B2yKCudpKsqUWeVmKu997OlusiiRYpQ
	HVVEVbZOnepgM4Wu8ArTvbwS7Z1vbARhGL45H2M/+vNHhNPVbEYynSUyxVRQBLtAr2lKr9qORb6
	wpjjndPoROk3iOXlKSu7chG
X-Gm-Gg: AYBFou0mes78iOq/CqQqFnezrhbQmH5+3UZpv4D+i/RNsJBgIgw0pHBMsno+Wv3kLVW
	XPuxEF6udfePBohX1GizYEK5QhgaERyZm6zDRJyUg5PeakOuVaru3KS16LC1cxDFFFR1Mk5kSIP
	TkVljaXtoJSyd0zpJicEExRrr6msBp++8f57R9EU3nA8X6sInW2J12pOhBnX58vIvaKWqSzBcuR
	dTdLauKY5jWtzOQnduZY4q9tHH0BUvc26yn7PWXp3Wlm+1ZbJplH5f80Owmdw7dvfs5490Xe8Aa
	65QZQ/b0uTH1yYiOPFePyHnYlLW7QX5Kfw9/hVs/OUCuzlEz+t8ByIPoEtm4YGotHpMJKkXLarj
	rH1G1A27Px1WyybmvGlgUrJr1liqi0HCezLFzhEhnhKsBwMITK1W35Ni8sIBdtXxYqklAC4/o3x
	S5PnjnDr1cORDFf3HLMPGL0UiDkUDgG5Wt/vaglPvZySQ=
X-Received: by 2002:a17:90a:757:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3a6e901ebd4mr5962735a91.15.1791241514429;
        Mon, 05 Oct 2026 16:05:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a853892b65sm457024a91.3.2026.10.05.16.05.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:05:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350ec54bf6so40644461cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791241513; x=1791846313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iW6L5TqJ9/IRRgok0g4xFXuyQiaTucPylThbHh/H7ZE=;
        b=B4c42AFWZs8W0gT9wNOEZoG2RdYtG21maUouS74dLN0dWB/vP+ZuX70G1Qf2BdaXu+
         jff+Yi213ry7Ssmg9tmRvQSbp0lHpakPLoTTAFKGiNBSyyzvB0O8fu0cY5F2QwJrI61A
         y0Et/aYr47G+9xmPb1WmM5LwWgmEeqg0QH6Hw=
X-Forwarded-Encrypted: i=1; AKwUvBxXOLYtLMkYkx0HqP1vkrH9LhXpjYD8WP8dYcsMwDB9HYmhGeIyE/kXqjikKAyQ+3kWS98V46Fur96z4qY=@vger.kernel.org
X-Received: by 2002:a05:622a:1314:b0:535:181a:ce08 with SMTP id d75a77b69052e-535181ad143mr136766841cf.42.1791241513140;
        Mon, 05 Oct 2026 16:05:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1314:b0:535:181a:ce08 with SMTP id d75a77b69052e-535181ad143mr136766151cf.42.1791241512649;
        Mon, 05 Oct 2026 16:05:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5353d78c3d6sm11404021cf.2.2026.10.05.16.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:05:12 -0700 (PDT)
Message-ID: <d340d589-78fd-48ad-bee5-ff88cfbb8b3f@broadcom.com>
Date: Mon, 5 Oct 2026 16:05:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/7] net: bcmgenet: allow a continuation
 descriptor without the alignment pad
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>
References: <20261006-nb-genet-mtu-nn-v2-v2-0-c4be21151912@tipi-net.de>
 <20261006-nb-genet-mtu-nn-v2-v2-2-c4be21151912@tipi-net.de>
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
In-Reply-To: <20261006-nb-genet-mtu-nn-v2-v2-2-c4be21151912@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/5/26 15:24, Nicolai Buchwitz wrote:
> A frame longer than the packet ready threshold arrives in several
> descriptors, each with its own status block. Only the first one also
> carries the two alignment bytes. The length check assumes the pad is always
> there, so a continuation holding a single byte looks a byte too short and
> the whole frame is dropped.
> 
> Account for the pad on the first descriptor only.
> 
> The MTU cannot produce a frame past the threshold yet, so nothing hits this
> today. It is preparation for the larger MTU.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> Tested-by: Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
