Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208352;
	b=nCdMwELYfSQj34xVe+Yfju/ZCNsYXXuADSSbXtwsGZ/+ZLpLVZUEG70w4hYcYiOc7606
	 QqSnjereUUr/JwsQWki5iR8xnW1EWka8c8rTiYLbdILqh/je4sP31Hd02GsbYpeczdVF5
	 NyHdQbaWsO0hOEK1L4tVNYLx4+Zk3Mr2NB32WA86on+QcujGdokPaHaIkZmP5+UJTGYQ8
	 bjJtjg6ewfk5f7GXhX97NRTY5MwdpNZk3GZELk5yQEnRadLFSYMGyjkjYLh1Cj7ozgQ/U
	 ZQ3VNCo3HmZZOlczqmQjNNC3fSfuzxqmWW3uhnM38O0ME21JoDPPhadiOHs1Lex2fxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208352;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=96REoSpqeOFESJkk5pNQFSDJAOzVBOi/GV9/PTsQSbc=;
	b=Qcf1KG3L05rmp3l5JQQWKVz1p08lY/kWGDAoN3mmJli+Shyy0qolKdVqMMwl+YcgUY2A
	 CZlShqUFfg343XAskrwH59HH81Z588xfP7w7tmQ8/jenJ++N9+kdzGewBEqlphlLge7zI
	 h/XqSvBqvt0b/vPPzo36M6XC2htauMme7lqkUOsneEt17y5+scuEoZDFy8SaMsuiAyP1D
	 eSvDOaOmCrYEBZjh0f31wPoPgWgzzJdRsY/hJJUcJwZMtXxIra+DfGzmpMhS19gPsv7uB
	 FuLoCLeH6dxUNELvCA/Mzk5x8c3DyQTvYcAliUevFJXEo8eV24C30VkSmi1YQczc5qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BEqxhsK5;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAB606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EAB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BEqxhsK5
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso627006a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208351; x=1793813151;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=96REoSpqeOFESJkk5pNQFSDJAOzVBOi/GV9/PTsQSbc=;
        b=HSNOglTC0o5Sen10yFvdXv/mmb41wS36IYfaoCdXbxMDOGIvMOizMKkP0MOt5qkXt0
         Um7MwTyQ62eOV1GRc1RmA7krYSSDk/VmflAXgKYy+ZNB2U4+kRXcEPORqsh7Lax339mZ
         qwVV67BzKXDGesJKZFY+TthhH6mui1NhwLYyEDe9e4uvbC24iPQ+s8SQY/UPAgcdsh1S
         jeI8OEutzv6kK43j+5suqmPaKhCl2QjRIJmhSj5ctB+7/AY075Rym0nLer61ccbF9MO8
         4WdVwSqfm+m1yqBa2ec7ZACavNnXNRFHTTJY8YtZL/PiQgfAf6SA2l8M6A9BbMxii7t1
         f7VA==
X-Forwarded-Encrypted: i=1; AKwUvBzANaE8hnxpTtHhuZdCS+rijJCUARL1b3NEn1iE44IJBNZ8BSlJgogyjmbs+01lRAEyTCrICSN1aoTc2J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2fMgbnC70uw7EBV1bBKYZKV/wmHSlnTxbQqk4NMWnIN42vSwT
	gkauW3DRZP2xlOcBcpVwzIF7hpCHUwHPTKD+cYNxTkNry49a7pabP3G1KGL89BaCd5nt32gaCfa
	8Kt2Ork9jqSk+wR9OUfaq41IDhmXr97jLCrN3PDI2+OIFZBGjoJPg7NybVuDo06eBbSZxcB2tM/
	/o/R1Qdx6iTSSErAIfLiRZ4jEAIZAjuz7BQ9gmuyKYlHl5xaTLfP1zW0CKbAdv9SfXDQby78cav
	190Zjcs2zLrFISQ+9wspEuX
X-Gm-Gg: AYBFou0imBsIk1ibLGmyDPMVpEcmr3HomiJnVj8ingdfzKjHp1139sB1Epcg5zlRryR
	3mjLsG7UzNkSqNIMOmyn6VyYdcsjtBEVZVQdhPoHzuw8olPLBbMhQfh86CH9ttatbiD08M8paxg
	5xpq0a2fhWblr4k2ppXRopLDfkV65ztTti6j9y56IZZRhnalV3xCIQ4k8Sd4VSFbRuJU7mTnGuJ
	SwSujUI4AI6aK0aIk4IyQSSXI7ERTglXJbeTeh/PjPQw/nppuXbeJnClen3GQZ1fMIbHzzhCY2b
	Pd2PiWEupMPr16Im91WIpko+Y9b2OzMCAbw7N/gzle/vAWb6VIRrJLeCkcGJYZ7t8582vHNk29s
	n4Ecf+IM7BYcg2KRA5aEl/9n5+Cq+HrdHJSmnZu48kWyrDOcB04T2rSHGjpGiFCdYnnKUjGJxLD
	FO4fPhohnf4NSfsrCKPgZ5SuI4qRelqP846I9zlAIuba0=
X-Received: by 2002:a17:90b:53ce:b0:3a8:a1f6:3b32 with SMTP id 98e67ed59e1d1-3ae58241dc1mr2108728a91.38.1793208350653;
        Wed, 28 Oct 2026 10:25:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e5e5305sm172968a91.1.2026.10.28.10.25.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:25:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c01778cefso25944196d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793208349; x=1793813149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96REoSpqeOFESJkk5pNQFSDJAOzVBOi/GV9/PTsQSbc=;
        b=BEqxhsK59jMeZ/P+vbogXmNyK1TQYJ+V6OPYr4knROJEUV/HUo+dCwUbfPFtke0PMb
         NTlHEpsAKTULD6ZGvNrkaGP7xPgCqggrsbRb5Kor6R0gkRNIbEi+RwrdgwFVYwqgwzsa
         Ce1EZQpGNyszstAkAZw5/TiAvlXgVn/1w23/w=
X-Forwarded-Encrypted: i=1; AKwUvBzHeVkPYGt/d5C0UDN+/kgxIWXbr2KbzBjRVXcFT+DnI1Bvle7EhO1JI6JGDe4d++H+OmyCWl3LYlUSkNs=@vger.kernel.org
X-Received: by 2002:ad4:5cad:0:b0:91c:7c57:728d with SMTP id 6a1803df08f44-91c7d1c01c7mr50546596d6.37.1793208348990;
        Wed, 28 Oct 2026 10:25:48 -0700 (PDT)
X-Received: by 2002:ad4:5cad:0:b0:91c:7c57:728d with SMTP id 6a1803df08f44-91c7d1c01c7mr50546116d6.37.1793208348296;
        Wed, 28 Oct 2026 10:25:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c69e721eesm71446646d6.11.2026.10.28.10.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:25:47 -0700 (PDT)
Message-ID: <2f230d17-88ab-4456-89fc-b567c9147d6d@broadcom.com>
Date: Wed, 28 Oct 2026 10:25:45 -0700
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
Subject: Re: [PATCH net v3 2/2] net: bcmgenet: restore the Tx coalescing
 setting when the rings are rebuilt
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261022-nb-genet-fini-dma-net-v3-0-6e9fc89c0156@tipi-net.de>
 <20261022-nb-genet-fini-dma-net-v3-2-6e9fc89c0156@tipi-net.de>
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
In-Reply-To: <20261022-nb-genet-fini-dma-net-v3-2-6e9fc89c0156@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/22/26 01:54, Nicolai Buchwitz wrote:
> bcmgenet_set_coalesce() writes tx_max_coalesced_frames straight into
> DMA_MBUF_DONE_THRESH and keeps no copy of it, while
> bcmgenet_init_tx_ring() programs a fixed 1. An ifdown and ifup or a resume
> then puts the Tx coalescing back to one frame per interrupt.
> 
> Rx keeps its value per ring and reapplies it on init. Do the same for Tx.
> 
> Fixes: 2f9130709d2c ("net: bcmgenet: Implement TX coalescing control knobs")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

